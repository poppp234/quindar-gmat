//------------------------------------------------------------------------------
//                                  SPADFileReader
//------------------------------------------------------------------------------
// GMAT: General Mission Analysis Tool
//
// Copyright (c) 2002 - 2015 United States Government as represented by the
// Administrator of the National Aeronautics and Space Administration.
// All Other Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License"); 
// You may not use this file except in compliance with the License. 
// You may obtain a copy of the License at:
// http://www.apache.org/licenses/LICENSE-2.0. 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either 
// express or implied.   See the License for the specific language
// governing permissions and limitations under the License.
//
// Author: Wendy Shoan / NASA
// Created: 2014.01.07
//
/**
 * Reads a SPAD file, and stores the data.
 * NOTE: Currently only reads azimuth, elevation, and X, Y, Z
 * @todo Add assumptions and general file requirements here
 */
//------------------------------------------------------------------------------

#include <iostream>
#include <fstream>
#include <sstream>
#include <cstdlib>
#include "FileUtil.hpp"
#include "FileTypes.hpp"
#include "SPADFileReader.hpp"
#include "Rvector3.hpp"
#include "gmatdefs.hpp"
#include "UtilityException.hpp"
#include "RealUtilities.hpp"
#include "StringUtil.hpp"
#include "MessageInterface.hpp"

//#define DEBUG_PARSE_SPAD_FILE
//#define DEBUG_DASHED_LINES
//#define DEBUG_ADD_DATA_RECORD
//#define DEBUG_META_DATA
//#define DEBUG_MOTION_RECORDS
//#define DEBUG_SPAD_DATA
//#define DEBUG_SPAD_FILE_AREA

//------------------------------------------------------------------------------
// static data
//------------------------------------------------------------------------------
// none

//------------------------------------------------------------------------------
// public methods
//------------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Default constructor
// -----------------------------------------------------------------------------
SPADFileReader::SPADFileReader() :
   analysisType  ("NONE"),
   pressure      (-999.0),
   recordCount   (-999),
   spadFile      (""),
   isInitialized (false),
   numData       (0),
   azCount       (0),
   elCount       (0),
   azStepSize    (-999),
   elStepSize    (-999)
{
   spadData.clear();
   spadMotion.clear();
}

// -----------------------------------------------------------------------------
// Copy constructor
// -----------------------------------------------------------------------------
SPADFileReader::SPADFileReader(const SPADFileReader &copy) :
   analysisType  (copy.analysisType),
   pressure      (copy.pressure),
   recordCount   (copy.recordCount),
   spadFile      (copy.spadFile),
   isInitialized (copy.isInitialized),
   numData       (copy.numData),
   azCount       (copy.azCount),
   elCount       (copy.elCount),
   azStepSize    (copy.azStepSize),
   elStepSize    (copy.elStepSize)
{
   spadData.clear();
   for (unsigned int ii = 0; ii < copy.spadData.size(); ii++)
   {
      Real az      = copy.spadData.at(ii)->azimuth;
      Real el      = copy.spadData.at(ii)->elevation;
      Rvector3 xyz = copy.spadData.at(ii)->force;
      AddDataRecord(az, el, xyz);
   }

   spadMotion.clear();
   for (unsigned int ii = 0; ii < copy.spadMotion.size(); ii++)
   {
      SPADMotionRecord *newMotion = new SPADMotionRecord(*(copy.spadMotion.at(ii)));
      spadMotion.push_back(newMotion);
   }
}

// -----------------------------------------------------------------------------
// operator=
// -----------------------------------------------------------------------------
SPADFileReader& SPADFileReader::operator=(const SPADFileReader &copy)
{
   if (&copy == this)
      return *this;

   analysisType  = copy.analysisType;
   pressure      = copy.pressure;
   recordCount   = copy.recordCount;
   spadFile      = copy.spadFile;
   isInitialized = copy.isInitialized;
   numData       = copy.numData;
   azCount       = copy.azCount;
   elCount       = copy.elCount;
   azStepSize    = copy.azStepSize;
   elStepSize    = copy.elStepSize;

   for (unsigned int ii = 0; ii < spadData.size(); ii++)
      delete spadData[ii];
   spadData.clear();
   for (unsigned int ii = 0; ii < copy.spadData.size(); ii++)
   {
      Real az      = copy.spadData.at(ii)->azimuth;
      Real el      = copy.spadData.at(ii)->elevation;
      Rvector3 xyz = copy.spadData.at(ii)->force;
      AddDataRecord(az, el, xyz);
   }

   for (unsigned int ii = 0; ii < spadMotion.size(); ii++)
      delete spadMotion[ii];
   spadMotion.clear();
   for (unsigned int ii = 0; ii < copy.spadMotion.size(); ii++)
   {
      SPADMotionRecord *newMotion = new SPADMotionRecord(*(copy.spadMotion.at(ii)));
      spadMotion.push_back(newMotion);
   }
   spadMotion.clear();

   return *this;
}

// -----------------------------------------------------------------------------
// Destructor
// -----------------------------------------------------------------------------
SPADFileReader::~SPADFileReader()
{
   for (unsigned int ii = 0; ii < spadData.size(); ii++)
      delete spadData[ii];
   spadData.clear();
   for (unsigned int ii = 0; ii < spadMotion.size(); ii++)
      delete spadMotion[ii];
   spadMotion.clear();
}

// -----------------------------------------------------------------------------
// void SPADFileReader* Clone()
// Return a clone of the SPADFileReader.
// -----------------------------------------------------------------------------
SPADFileReader* SPADFileReader::Clone() const
{
   return (new SPADFileReader(*this));
}

//------------------------------------------------------------------------------
// void Initialize()
// Validate and initialize, parse the file, store the data.
//------------------------------------------------------------------------------
void SPADFileReader::Initialize()
{
   if (isInitialized) return;

   #ifdef DEBUG_INIT_SPAD_FILE
      MessageInterface::ShowMessage("Entering SPADFileReader::Initialize ...\n");
   #endif
   // Check for the existence of the file
   if (!GmatFileUtil::DoesFileExist(spadFile))
   {
      std::string errmsg = "Specified SPAD file \" ";
      errmsg += spadFile + "\" does not exist.\n";
      throw UtilityException(errmsg);
   }

   // Parse the file
   bool fileParsed = ParseFile();
   if (!fileParsed)
   {
      std::string errmsg = "There is an error opening or reading the ";
      errmsg += "SPAD file \"" + spadFile + "\".\n";
      throw UtilityException(errmsg);
   }
   #ifdef DEBUG_INIT_SPAD_FILE
      MessageInterface::ShowMessage("      in SPADFileReader::Initialize, file has been parsed.\n");
   #endif

   if (recordCount == -999)
   {
      std::string errmsg = "\"Record count\" field is missing on SPAD file ";
      errmsg += spadFile + "\".\n";
      throw UtilityException(errmsg);
   }
   if (analysisType == "NONE")
   {
      std::string errmsg = "\"Analysis Type\" field is missing on SPAD file ";
      errmsg += spadFile + "\".\n";
      throw UtilityException(errmsg);
   }
//   if (GmatMathUtill::IsEqual(pressure,-999.0))
//   {
//      std::string errmsg = "\"Pressure\" field is missing on SPAD file ";
//      errmsg += spadFile + "\".\n";
//      throw UtilityException(errmsg);
//   }

   if (numData == 0)
   {
      std::string errmsg = "Error reading SPAD file \"";
      errmsg += spadFile + "\".  ";
      errmsg += "No records found.\n";
      throw UtilityException(errmsg);
   }
   if (numData != recordCount)
   {
      std::string errmsg = "\"Record count\" value from SPAD file ";
      errmsg += spadFile + "\" does not match the number of data records read.\n";
      throw UtilityException(errmsg);
   }
   if ((azCount * elCount) != recordCount)
   {
      std::string errmsg = "\"Record count\" value from SPAD file ";
      errmsg += spadFile + "\" does not match the number of data records expected.\n";
      throw UtilityException(errmsg);
   }

   isInitialized = true;
}

// -----------------------------------------------------------------------------
// bool SetFile(const std::string &theSPADFile)
// Set the SPAD file name.
// -----------------------------------------------------------------------------
bool SPADFileReader::SetFile(const std::string &theSPADFile)
{
   spadFile = theSPADFile;
   return true;
}

// -----------------------------------------------------------------------------
// Rvector3 GetSRPArea(Rvector3 sunVector)
// Determine the SRP area, given the input sun vector, interpolating the
// data as necessary.
// -----------------------------------------------------------------------------
Rvector3 SPADFileReader::GetSRPArea(Rvector3 sunVector)
{
   #ifdef DEBUG_SPAD_FILE_AREA
      MessageInterface::ShowMessage("In SPADFileReader::GetSRPArea\n");
      MessageInterface::ShowMessage("   azStepSize = %d\n", azStepSize);
      MessageInterface::ShowMessage("   elStepSize = %d\n", elStepSize);
      MessageInterface::ShowMessage("   sunVector  = %12.10f  %12.10f  %12.10f\n",
            sunVector[0], sunVector[1], sunVector[2]);
   #endif
   Rvector3 result;

   Real  azimuth, elevation;
   Real  x = sunVector[0];
   Real  y = sunVector[1];
   Real  z = sunVector[2];

   if (x == 0 && y == 0)
   {
      throw UtilityException("Cannot compute Right Ascension - "
            "x and y elements of sun vector are zero.\n");
   }

   azimuth = GmatMathUtil::ATan2(y,x) * GmatMathConstants::DEG_PER_RAD;
   if (azimuth > 360.0)
      azimuth -= 360.0;
   else if (azimuth < 0.0)
      azimuth += 360.0;
   if (azimuth > 180.0) azimuth -= 360.0;

   elevation = GmatMathUtil::ATan2(z, GmatMathUtil::Sqrt(x*x+y*y))
               * GmatMathConstants::DEG_PER_RAD;
   if (elevation > 90.0)
      elevation -= 360.0;
   else if (elevation < -90.0)
      elevation += 360.0;
   if (elevation > 90.0)  elevation -= 360.0;
   if (elevation < -90.0) elevation += 180.00;

   // Find the azimuth and elevation values that bracket the
   // sun vector direction
   Integer azLow  = Integer((azimuth+180)/azStepSize) * azStepSize - 180;
   Integer azHigh = azLow + azStepSize;

   Integer elLow  = Integer((elevation+90)/elStepSize) * elStepSize - 90;
   Integer elHigh = elLow + elStepSize;

   Rvector3 lowLow   = GetForceAt(azLow,  elLow);
   Rvector3 lowHigh  = GetForceAt(azLow,  elHigh);
   Rvector3 highLow  = GetForceAt(azHigh, elLow);
   Rvector3 highHigh = GetForceAt(azHigh, elHigh);

   #ifdef DEBUG_SPAD_FILE_AREA
      MessageInterface::ShowMessage("In SPADFileReader::GetSRPArea, az = %12.10f,  el = %12.10f\n",
            azimuth, elevation);
      MessageInterface::ShowMessage("In SPADFileReader::GetSRPArea, four points used for interpolation are:\n");
      MessageInterface::ShowMessage("   azimuth = %d  elevation = %d  force = %12.10f  %12.10f  %12.10f\n",
            azLow, elLow, lowLow[0], lowLow[1], lowLow[2]);
      MessageInterface::ShowMessage("   azimuth = %d  elevation = %d  force = %12.10f  %12.10f  %12.10f\n",
            azLow, elHigh, lowHigh[0], lowHigh[1], lowHigh[2]);
      MessageInterface::ShowMessage("   azimuth = %d  elevation = %d  force = %12.10f  %12.10f  %12.10f\n",
            azHigh, elLow, highLow[0], highLow[1], highLow[2]);
      MessageInterface::ShowMessage("   azimuth = %d  elevation = %d  force = %12.10f  %12.10f  %12.10f\n",
            azHigh, elHigh, highHigh[0], highHigh[1], highHigh[2]);
   #endif

   Real interp1, interp2;

   for (unsigned int ii = 0; ii < 3; ii++)
   {
      interp1 = Interpolate(azimuth, azLow, azHigh, lowLow[ii],  highLow[ii]);
      interp2 = Interpolate(azimuth, azLow, azHigh, lowHigh[ii], highHigh[ii]);
      result[ii] = Interpolate(elevation, elLow, elHigh, interp1, interp2);
   }

   #ifdef DEBUG_SPAD_FILE_AREA
      MessageInterface::ShowMessage(
            "EXITing SPADFileReader::GetSRPArea, returning %12.10f  %12.10f  %12.10f\n",
            result[0], result[1], result[2]);
   #endif

   return result;
}

//------------------------------------------------------------------------------
// private methods
//------------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// bool AddDataRecord(Real az, Real el, Real x, Real y, Real z)
// Create a new SPADDataRecord, initialize it with the input data, and
// add it to the data store.
// -----------------------------------------------------------------------------
bool SPADFileReader::AddDataRecord(Real az, Real el, Real x, Real y, Real z)
{
   Rvector3 xyz(x,y,z);
   SPADDataRecord *newSPAD = new SPADDataRecord(az, el, xyz);
   #ifdef DEBUG_ADD_DATA_RECORD
      MessageInterface::ShowMessage(
            "Adding data record with azimuth = %12.10f and elevation "
            "= %12.10f, and xyz = %12.10f  %12.10f  %12.10f\n",
            az, el, x, y, z);
   #endif
   spadData.push_back(newSPAD);
   return true;
}

// -----------------------------------------------------------------------------
// bool AddDataRecord(Real az, Real el, Rvector3 f)
// Create a new SPADDataRecord, initialize it with the input data, and
// add it to the data store.
// -----------------------------------------------------------------------------
bool SPADFileReader::AddDataRecord(Real az, Real el, Rvector3 f)
{
   SPADDataRecord *newSPAD = new SPADDataRecord(az, el, f);
   #ifdef DEBUG_ADD_DATA_RECORD
      MessageInterface::ShowMessage(
            "Adding data record with azimuth = %12.10f and elevation = %12.10f\n",
            az, el);
   #endif
   spadData.push_back(newSPAD);
   return true;
}

// -----------------------------------------------------------------------------
// bool ParseFile()
// Parse the file, validating where possible; store the data
// -----------------------------------------------------------------------------
bool SPADFileReader::ParseFile()
{
   if (isInitialized) return true;

   std::string   dummyStr, trimmedLine;
   std::string   colon;
   std::string   part1, part2;
   Integer       numMotion     = 0;
   Integer       theID         = -1;

   SPADMotionRecord *newSpadMotion = NULL;

   bool          readingHeader = true;
   bool          readingMeta   = false;
   bool          readingData   = false;

   bool          expectingRecordCount = false;

   std::string   azUnits;
   std::string   elUnits;
   std::string   xUnits;
   std::string   yUnits;
   std::string   zUnits;
   std::string   azStr;
   std::string   elStr;
   std::string   xStr;
   std::string   yStr;
   std::string   zStr;

   Real          azVal;
   Real          elVal;
   Real          xVal;
   Real          yVal;
   Real          zVal;

   // Open the file for reading
   std::string   line;
   std::ifstream theSpadFile(spadFile.c_str());
   if (!theSpadFile)  return false;

   // Ignore leading white space
   theSpadFile.setf(std::ios::skipws);
   // check for an empty file
   if (theSpadFile.eof())
   {
      std::string errmsg = "Error reading SPAD file \"";
      errmsg += spadFile + "\".  ";
      errmsg += "File appears to be empty.\n";
      throw UtilityException(errmsg);
   }
   // Parse the file until end-of-file
   while (!theSpadFile.eof())
   {
      getline(theSpadFile,line);
      // ignore blank lines
      if (GmatStringUtil::IsBlank(line, true))
         continue;
      // ignore the dashed lines in the data section
      if (readingData && (line.find("--") != line.npos) && IsDashedLine(line))
         continue;
      #ifdef DEBUG_PARSE_SPAD_FILE
         MessageInterface::ShowMessage("In SPADFileReader, line= %s\n", line.c_str());
         MessageInterface::ShowMessage("   readingHeader = %s\n", (readingHeader? "true" : "false"));
         MessageInterface::ShowMessage("   readingMeta   = %s\n", (readingMeta? "true" : "false"));
         MessageInterface::ShowMessage("   readingData   = %s\n", (readingData? "true" : "false"));
      #endif

      trimmedLine = GmatStringUtil::Trim(line);

      // Check to see if we are reading a different section yet
      if (readingMeta && (trimmedLine.find("END") != line.npos))
      {
         // the next non-blank line should be the Record count
         expectingRecordCount = true;
         continue;
      }
      if (readingMeta && expectingRecordCount &&
         !GmatStringUtil::StartsWith(trimmedLine, "Record "))
      {
         std::string errmsg = "Error reading SPAD file ";
         errmsg            += spadFile + ".  Missing field \"Record count\".\n";
         throw UtilityException(errmsg);
      }
      if (readingHeader && GmatStringUtil::StartsWith(trimmedLine, "Motion"))
      {
         readingHeader = false;
         readingMeta   = true;
      }
      if (!readingData && GmatStringUtil::StartsWith(trimmedLine, "Azimuth"))
      {
         if (!readingMeta)
         {
            std::string errmsg = "Error reading SPAD file ";
            errmsg            += spadFile + ".  Expected data records to ";
            errmsg            += "follow meta records.\n";
            throw UtilityException(errmsg);
         }
         if (newSpadMotion != NULL)
         {
            spadMotion.push_back(newSpadMotion);
            newSpadMotion = NULL;
         }
         // Check to see all meta data was read ...
         ValidateMetaData();
         readingMeta = false;
         readingData = true;
      }
      if (readingHeader || readingMeta)
      {
         // ignore the current time for now, to avoid issues with
         // separating by ':'
         if (GmatStringUtil::StartsWith(trimmedLine, "Current"))
            continue;
         StringArray parts = GmatStringUtil::SeparateBy(trimmedLine, ":");
         if (parts.size() != 2)
         {
            std::string errmsg = "Invalid line \"";
            errmsg            += line + "\" in SPAD file ";
            errmsg            += spadFile;
            errmsg            += ".  Expecting keyword:value pair.\n";
            throw UtilityException(errmsg);
         }
         part1 = GmatStringUtil::Trim(parts.at(0), GmatStringUtil::BOTH, true, true);
         part2 = GmatStringUtil::Trim(parts.at(1), GmatStringUtil::BOTH, true, true);
         #ifdef DEBUG_PARSE_SPAD_FILE
            MessageInterface::ShowMessage("                  part1= \"%s\"\n", part1.c_str());
            MessageInterface::ShowMessage("                  part2= \"%s\"\n", part2.c_str());
         #endif

         if (readingHeader)
         {
            // Read and validate header data
            // Currently we ignore Version, System, Pixel Size, Spacecraft Size,
            // Center of Mass, and Current Time so read them as strings and don't save
            if (part1 == "Analysis Type")
            {
               if (part2 != "Area")
               {
                  std::string errmsg = "Only currently allowed value for ";
                  errmsg            += "\"Analysis Type\" ";
                  errmsg            += "field in SPAD file header is ";
                  errmsg            += "\"Area\"\n";
                  throw UtilityException(errmsg);
               }
               analysisType = part2;
            }
            else if (part1 == "Pressure")
            {
               // ignoring this for now
//               if (!GmatStringUtil::ToReal(part2, pressure))
//               {
//                  std::string errmsg = "Value for \"Pressure\" field in header ";
//                  errmsg            += "of SPAD file " + spadFile;
//                  errmsg            += " is not a valid Real number.\n";
//                  throw UtilityException(errmsg);
//               }
            }
            else if ((part1 == "Version")         || (part1 == "System") ||
                     (part1 == "Pixel Size")      ||
                     (part1 == "Spacecraft Size") ||
                     (part1 == "Center of Mass")  || (part1 == "Current Time"))
            {
               // ignore these - they are allowed but we are not saving them
            }
            else
            {
               // ignore other fields for now ...
//               std::string errmsg = "Unknown field \"";
//               errmsg            += part1 + "\" in header in SPAD file ";
//               errmsg            += spadFile + "\n";
//               throw UtilityException(errmsg);
            }
         }
         else if (readingMeta)
         {
            // Read and validate meta data
            if (part1 == "Motion")
            {
               // if there was a previous motion, store it
               if (newSpadMotion != NULL)
               {
                  #ifdef DEBUG_MOTION_RECORDS
                     MessageInterface::ShowMessage("NOW putting SPADMotion record <%p> into store ...\n",
                           newSpadMotion);
                  #endif
                  spadMotion.push_back(newSpadMotion);
                  newSpadMotion = NULL;
               }
               if (!GmatStringUtil::ToInteger(part2, theID))
               {
                  std::string errmsg = "Error converting ";
                  errmsg            += part2 + " to an Integer.\n";
                  throw UtilityException(errmsg);
               }
               if ((theID != 1) && (theID != 2))
               {
                  std::string errmsg = "Only allowed values for \"Motion\" ";
                  errmsg            += "field in SPAD file meta data are ";
                  errmsg            += "\"1\" or \"2\"\n";
                  throw UtilityException(errmsg);
               }
               numMotion++;
               newSpadMotion = new SPADMotionRecord(theID);
               #ifdef DEBUG_MOTION_RECORDS
                  MessageInterface::ShowMessage("just created SPADMotion record <%p> for id = %d ...\n",
                        newSpadMotion, theID);
               #endif
            }
            else if (part1 == "Name")
            {
               newSpadMotion->nombre = part2;
            }
            else if (part1 == "Method")
            {
               if ((numMotion < 3) && (part2 != "Step"))
               {
                  std::string errmsg = "Only allowed value for \"Method\" ";
                  errmsg            += "field in SPAD file meta data is ";
                  errmsg            += "\"Step\"\n";
                  throw UtilityException(errmsg);
               }
               newSpadMotion->method = part2;
            }
            else if (part1 == "Minimum")
            {
               Real theMin;
               GmatStringUtil::ToReal(part2, theMin);
               newSpadMotion->itsMin = theMin;
            }
            else if (part1 == "Maximum")
            {
               Real theMax;
               GmatStringUtil::ToReal(part2, theMax);
               newSpadMotion->itsMax = theMax;
            }
            else if (part1 == "Step")
            {
               Integer theStep;
               GmatStringUtil::ToInteger(part2, theStep);
               if (theStep <= 0)
               {
                  std::string errmsg = "Only allowed value for \"Step\" ";
                  errmsg            += "field in SPAD file meta data is ";
                  errmsg            += "a positive, non-zero Integer\n";
                  throw UtilityException(errmsg);
               }
               newSpadMotion->itsStep = (Real) theStep;
            }
            else if (part1 == "Record count")
            {
               // @todo - make sure this doesn't exist inside a Motion record .......
               if (!GmatStringUtil::ToInteger(part2,recordCount))
               {
                  std::string errmsg = "Error converting \"Record count\" ";
                  errmsg            += part2 + " to a Real number.\n";
                  throw UtilityException(errmsg);
               }
               // @todo - make sure this number is correct --------------------------
               expectingRecordCount = false;
            }
            else
            {
               std::string errmsg = "Unknown field \"";
               errmsg            += part1 + "\" in meta data in SPAD file ";
               errmsg            += spadFile + "\n";
               throw UtilityException(errmsg);
            }
         }
      }
      else if (readingData)
      {
         if (GmatStringUtil::StartsWith(trimmedLine,"Azimuth"))
            continue;   // skip over titles
         else if (GmatStringUtil::StartsWith(trimmedLine,"degree"))   // units line
         {
            std::istringstream lineStr;
            lineStr.str(line);
            lineStr >> azUnits >> elUnits;
            for (Integer ii = 2; ii < (Integer) spadMotion.size(); ii++)
               lineStr >> dummyStr;
            lineStr >> xUnits >> yUnits >> zUnits;
            // remove blanks from the force units strings
            xUnits = GmatStringUtil::RemoveAllBlanks(xUnits);
            yUnits = GmatStringUtil::RemoveAllBlanks(yUnits);
            zUnits = GmatStringUtil::RemoveAllBlanks(zUnits);
            #ifdef DEBUG_SPAD_DATA
               MessageInterface::ShowMessage("azUnits = %s, elUnits = %s\n",
                       azUnits.c_str(), elUnits.c_str());
               MessageInterface::ShowMessage("xUnits = %s, yUnits = %s,  zUnits = %s\n",
                       xUnits.c_str(), yUnits.c_str(), zUnits.c_str());
            #endif
            if (azUnits != "degrees")
            {
               std::string errmsg = "Error reading SPAD file ";
               errmsg            += spadFile + ".  Units for azimuth must ";
               errmsg            += "be degrees.\n";
               throw UtilityException(errmsg);
            }
            else if (elUnits != "degrees")
            {
               std::string errmsg = "Error reading SPAD file ";
               errmsg            += spadFile + ".  Units for elevation must ";
               errmsg            += "be degrees.\n";
               throw UtilityException(errmsg);
            }
            // Base units must be m, mm, cm, in, ft
         }
         else   // data line
         {
            std::istringstream lineStr;
            lineStr.str(line);
            lineStr >> azStr >> elStr;
            // Leave this in for the future when we handle other Motion data.
            // Currently, this loop will not be executed as we are reading only
            // Azimuth and Elevation data
            for (Integer ii = 2; ii < (Integer) spadMotion.size(); ii++)
               lineStr >> dummyStr;
            lineStr >> xStr >> yStr >> zStr;
            #ifdef DEBUG_SPAD_DATA
               MessageInterface::ShowMessage("azStr = %s, elStr = %s\n",
                       azStr.c_str(), elStr.c_str());
               MessageInterface::ShowMessage("xStr = %s, yStr = %s,  zStr = %s\n",
                       xStr.c_str(), yStr.c_str(), zStr.c_str());
            #endif
            if ((!GmatStringUtil::ToReal(azStr, azVal))  ||
                (!GmatStringUtil::ToReal(elStr, elVal))  ||
                (!GmatStringUtil::ToReal(xStr,  xVal))   ||
                (!GmatStringUtil::ToReal(yStr,  yVal))   ||
                (!GmatStringUtil::ToReal(zStr,  zVal)))
            {
               std::string errmsg = "Numeric value for one of ";
               errmsg            += "(azimuth, elevation, or force data) ";
               errmsg            += "of SPAD file " + spadFile;
               errmsg            += " is not a valid Real number.\n";
               throw UtilityException(errmsg);
            }
            // Convert the force to the proper units (m^2)
            if (xUnits == "mm^2")      xVal *= 1.0e-06;
            else if (xUnits == "m^2")  xVal *= 1.0;
            else if (xUnits == "cm^2") xVal *= 1.0e-04;
            else if (xUnits == "in^2") xVal *= 6.4516e-04;
            else if (xUnits == "ft^2") xVal *= 9.290304e-02;
            else
            {
               std::string errmsg = "Error reading SPAD file ";
               errmsg            += spadFile + ".  Units \"" + xUnits;
               errmsg            += "\" for force(x) are unsupported.  ";
               errmsg            += "Units must be one of ";
               errmsg            += "[mm^2  m^2  cm^2  in^2  ft^2].\n";
               throw UtilityException(errmsg);
            }
            if (yUnits == "mm^2")      yVal *= 1.0e-06;
            else if (yUnits == "m^2")  yVal *= 1.0;
            else if (yUnits == "cm^2") yVal *= 1.0e-04;
            else if (yUnits == "in^2") yVal *= 6.4516e-04;
            else if (yUnits == "ft^2") yVal *= 9.290304e-02;
            else
            {
               std::string errmsg = "Error reading SPAD file ";
               errmsg            += spadFile + ".  Units \"" + yUnits;
               errmsg            += "\" for force(y) are unsupported.  ";
               errmsg            += "Units must be one of ";
               errmsg            += "[mm^2  m^2  cm^2  in^2  ft^2].\n";
               throw UtilityException(errmsg);
            }
            if (zUnits == "mm^2")      zVal *= 1.0e-06;
            else if (zUnits == "m^2")  zVal *= 1.0;
            else if (zUnits == "cm^2") zVal *= 1.0e-04;
            else if (zUnits == "in^2") zVal *= 6.4516e-04;
            else if (zUnits == "ft^2") zVal *= 9.290304e-02;
            else
            {
               std::string errmsg = "Error reading SPAD file ";
               errmsg            += spadFile + ".  Units \"" + zUnits;
               errmsg            += "\" for force(z) are unsupported.  ";
               errmsg            += "Units must be one of ";
               errmsg            += "[mm^2  m^2  cm^2  in^2  ft^2].\n";
               throw UtilityException(errmsg);
            }
            AddDataRecord(azVal, elVal, xVal, yVal, zVal);
            numData++;
         }
      }
      else
      {
         std::string errmsg = "Error reading SPAD file ";
         errmsg            += spadFile + ".  Internal error.\n";
         throw UtilityException(errmsg);
      }
   }
   if (readingHeader || readingMeta)
   {
      std::string errmsg = "Error reading SPAD file ";
      errmsg            += spadFile + ".  Missing data records.\n";
      throw UtilityException(errmsg);
   }
   ValidateData();
   if (theSpadFile.is_open())  theSpadFile.close();

   return true;
}

// -----------------------------------------------------------------------------
// void ValidateMetaData()
// Checks to make sure that the meta data is complete and valid.
// -----------------------------------------------------------------------------
void SPADFileReader::ValidateMetaData()
{
   std::string errmsg = "";
   if (spadMotion.size() < 2)
   {
      errmsg  = "SPAD file ";
      errmsg += spadFile + " does not contain sufficient meta data ";
      errmsg += "records - it must contain at least Azimuth and ";
      errmsg += "Elevation records.\n";
      throw UtilityException(errmsg);
   }
   else if (spadMotion.size() > 2)
   {
      errmsg  = "SPAD file ";
      errmsg += spadFile + " contains unsupported Motion data ";
      errmsg += "records - it must contain only Azimuth and ";
      errmsg += "Elevation records.\n";
      throw UtilityException(errmsg);
   }
   SPADMotionRecord *az = spadMotion.at(0);
   SPADMotionRecord *el = spadMotion.at(1);

   #ifdef DEBUG_META_DATA
      MessageInterface::ShowMessage("In ValidateMetaData, az is %sNULL\n",
            (az? "NOT " : ""));
      MessageInterface::ShowMessage("In ValidateMetaData, el is %sNULL\n",
            (el? "NOT " : ""));
   #endif

   if ((az->nombre != "Azimuth")  ||
       (el->nombre != "Elevation"))
   {
      errmsg  = "SPAD file ";
      errmsg += spadFile + " does not contain correct meta data ";
      errmsg += "records - it must contain an Azimuth record first ";
      errmsg += "and an Elevation record second.\n";
      throw UtilityException(errmsg);
   }

   if ((az->method != "Step") ||
       (el->method != "Step"))
   {
      errmsg  = "SPAD file ";
      errmsg  += spadFile + " does not contain correct meta data ";
      errmsg  += "records - Method must be \"Step\" for all ";
      errmsg  += "records.\n";
      throw UtilityException(errmsg);
   }
   if ((!GmatMathUtil::IsEqual(az->itsMin, -180.0)) ||
       (!GmatMathUtil::IsEqual(az->itsMax,  180.0)))
   {
      errmsg  = "SPAD file ";
      errmsg += spadFile + " contains invalid range for Azimuth data.  ";
      errmsg += "Range must be -180 to 180 degrees.\n";
      throw UtilityException(errmsg);
   }
   if ((!GmatMathUtil::IsEqual(el->itsMin, -90.0)) ||
       (!GmatMathUtil::IsEqual(el->itsMax,  90.0)))
   {
      errmsg  = "SPAD file ";
      errmsg += spadFile + " contains invalid range for Elevation data.  ";
      errmsg += "Range must be -90 to 90 degrees.\n";
      throw UtilityException(errmsg);
   }

   azStepSize = az->itsStep;
   elStepSize = el->itsStep;
   if ((azStepSize == -999) || (elStepSize == -999))
   {
      std::string errmsg = "\"Step\" field for Azimuth or Elevation record ";
      errmsg += "is missing on SPAD file ";
      errmsg += spadFile + ".\n";
      throw UtilityException(errmsg);
   }

   azCount    = 360./ azStepSize + 1;
   elCount    = 180./ elStepSize + 1;
}

// -----------------------------------------------------------------------------
// void ValidateData()
// Checks to make sure that the data is complete and valid.
// -----------------------------------------------------------------------------
void SPADFileReader::ValidateData()
{
   Integer azStep = spadMotion.at(0)->itsStep;
   Integer elStep = spadMotion.at(1)->itsStep;

   bool azEvenlyDiv = true;
   bool elEvenlyDiv = true;

   bool lowAzFound  = false;
   bool highAzFound = false;
   bool lowElFound  = false;
   bool highElFound = false;

   // azimuth range is 360 degrees, elevation range is 180 degrees

   // Check azimuth range/step size
   if (!GmatMathUtil::IsEqual(GmatMathUtil::Rem(360.0, azStep),0.0))
   {
      azEvenlyDiv = false;
   }
   // Check elevation range/step size
   if (!GmatMathUtil::IsEqual(GmatMathUtil::Rem(180.0, elStep),0.0))
   {
      elEvenlyDiv = false;
   }
   // Check data for extremes of ranges
   for (unsigned int ii = 0; ii < spadData.size(); ii++)
   {
      SPADDataRecord *sData = spadData.at(ii);
      if (GmatMathUtil::IsEqual(sData->azimuth, -180.0))
         lowAzFound  = true;
      if (GmatMathUtil::IsEqual(sData->azimuth, 180.0))
         highAzFound = true;
      if (GmatMathUtil::IsEqual(sData->elevation, -90.0))
         lowElFound  = true;
      if (GmatMathUtil::IsEqual(sData->elevation, 90.0))
         highElFound = true;
   }
   if (!lowAzFound || !highAzFound)
   {
      std::string errmsg = "Azimuth data in SPAD file ";
      errmsg            += spadFile + " must contain data records ";
      errmsg            += "covering both -180 and 180 degrees.";
      if (!azEvenlyDiv)
      {
         errmsg         += "  Azimuth range is not evenly divisible by ";
         errmsg         += "step size.";
      }
      errmsg            += "\n";
      throw UtilityException(errmsg);
   }
   if (!lowElFound || !highElFound)
   {
      std::string errmsg = "Elevation data in SPAD file ";
      errmsg            += spadFile + " must contain data records ";
      errmsg            += "covering both -90 and 90 degrees.";
      if (!elEvenlyDiv)
      {
         errmsg         += "  Elevation range is not evenly divisible by ";
         errmsg         += "step size.";
      }
      errmsg            += "\n";
      throw UtilityException(errmsg);
   }
   // Check to see if the data really has the step sizes it says it has
   try
   {
      Real     nextAz     = -180.00 + azStepSize;
      Real     nextEl     = -90.00  + elStepSize;
      Rvector3 nextAzEl   = GetForceAt(nextAz, nextEl);
   }
   catch (UtilityException &ue)
   {
      std::string errmsg = "\"Step\" field for Azimuth or Elevation record ";
      errmsg += "does not equal the actual step size between data records on ";
      errmsg += "SPAD file " + spadFile + ".\n";
      throw UtilityException(errmsg);
   }
}


// -----------------------------------------------------------------------------
// bool IsDashedLine(const std::string &theLine)
// Returns true if the line has only blanks and dashes; false otherwise
// -----------------------------------------------------------------------------
bool SPADFileReader::IsDashedLine(const std::string &theLine)
{
   std::string s1 = GmatStringUtil::RemoveAll(theLine, '-');
   #ifdef DEBUG_DASHED_LINES
      MessageInterface::ShowMessage("----- BEFORE removing dashes, line = \"%s\"\n",
            theLine.c_str());
      MessageInterface::ShowMessage("----- after removing dashes, line = \"%s\"\n",
            s1.c_str());
   #endif
   if (GmatStringUtil::IsBlank(s1, true))
      return true;
   return false;
}

// -----------------------------------------------------------------------------
// Real Interpolate(Real x, Real x1, real x2, Real y1, Real y2)
// Performs linear interpolation of the input values
// -----------------------------------------------------------------------------
Real SPADFileReader::Interpolate(Real x, Real x1, Real x2, Real y1, Real y2)
{
   if (GmatMathUtil::IsEqual(x1, x2))   return y1;
   return (x2-x)/(x2-x1)*y1 + (x-x1)/(x2-x1)*y2;
}

// -----------------------------------------------------------------------------
// Rvector3 GetForceAt(Real azVal, Real elVal)
// Returns the force vector from the Data Store given the input azimuth
// and elevation value
// -----------------------------------------------------------------------------
Rvector3 SPADFileReader::GetForceAt(Real azVal, Real elVal)
{
   // Figure out where in the dataStore to start looking
   Integer azRecords = Integer((azVal + 180) / azStepSize) * elCount;
   for (Integer ii = azRecords; ii < recordCount; ii++)
   {
      Integer theAZ = spadData.at(ii)->azimuth;
      Integer theEL = spadData.at(ii)->elevation;
      if (GmatMathUtil::IsEqual(theAZ, azVal) && (GmatMathUtil::IsEqual(theEL, elVal)))
         return spadData.at(ii)->force;
   }
   std::string errmsg  = "SPAD file ";
   errmsg += spadFile + " does not contain force data for ";
   errmsg += "the specified azimuth-elevation pair.\n";
   throw UtilityException(errmsg);
}
