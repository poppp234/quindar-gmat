//$Id$
//------------------------------------------------------------------------------
//                                  EopFile
//------------------------------------------------------------------------------
// GMAT: General Mission Analysis Tool.
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
// Developed jointly by NASA/GSFC and Thinking Systems, Inc. under 
// MOMS Task order 124.
//
// Author: Wendy C. Shoan/GSFC/MAB
// Created: 2005/01/26
//
/**
 * Definition of the EopFile class.  This is the code that reads the polar
 * motion information, as well as the UT1-UTC offset, from EOP file.
 *
 */
//------------------------------------------------------------------------------

#ifndef EopFile_hpp
#define EopFile_hpp

#include "gmatdefs.hpp"
#include "Rmatrix.hpp"

namespace GmatEop
{
   enum EopFileType
   {
      EOP_C04,
      FINALS
   };
};

class GMAT_API EopFile
{
public:
   // default constructor
   EopFile(const std::string &fileName = "eopc04.62-now", 
           GmatEop::EopFileType eop = GmatEop::EOP_C04);
   // copy constructor
   EopFile(const EopFile &eopF);
   // operator = 
   const EopFile& operator=(const EopFile &eopF);
   // destructor
   virtual ~EopFile();
   
   
   // initializes the EopFile (reads it and stores the data)
   virtual void Initialize();
   
   // method to return the name of the EOP file
   virtual std::string GetFileName() const;
   
   // method to return the UT1-UTC offset for the given UTCMjd - use UtcMjd???
   virtual Real    GetUt1UtcOffset(const Real utcMjd);
   
   // method to return JD, X, Y, LOD data (for use by coordinate systems)
   virtual Rmatrix GetPolarMotionData();
   // interpolate x, y, and lod to input time
   virtual bool    GetPolarMotionAndLod(Real forUtcMjd, Real &xval, Real  &yval,
                                        Real &lodval);
  
protected:

   static const Integer MAX_TABLE_SIZE;

   GmatEop::EopFileType eopFType;
   std::string          eopFileName;
   Integer              tableSz;

   /// table of polar motion data : MJD, X, Y, LOD
   Rmatrix*             polarMotion;
   /// vector of UT1-UTC offsets : MJD, offset
   Rmatrix*             ut1UtcOffsets;
   
   Real                 lastUtcJd;
   Real                 lastOffset;
   Integer              lastIndex;
   
   bool isInitialized;
   
   bool IsBlank(const char* aLine);
   
   // Performance code
   Integer              previousIndex;
   
};
#endif // EopFile_hpp
