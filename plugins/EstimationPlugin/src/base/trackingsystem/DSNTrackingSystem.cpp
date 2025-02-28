//$Id: DSNTrackingSystem.cpp 1398 2011-04-21 20:39:37Z  $
//------------------------------------------------------------------------------
//                             DSNTrackingSystem
//------------------------------------------------------------------------------
// GMAT: General Mission Analysis Tool.
//
// Copyright (c) 2002 - 2015 United States Government as represented by the
// Administrator of The National Aeronautics and Space Administration.
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
// Author: Darrel J. Conway
// Created: 2010/02/22 by Darrel Conway (Thinking Systems)
//
// Developed jointly by NASA/GSFC and Thinking Systems, Inc. under the FDSS 
// contract, Task 28
//
/**
 * Implementation for the DSNTrackingSystem class
 */
//------------------------------------------------------------------------------


#include "DSNTrackingSystem.hpp"
#include "EstimationDefs.hpp"


//------------------------------------------------------------------------------
// DSNTrackingSystem(const std::string &name)
//------------------------------------------------------------------------------
/**
 * Default constructor
 *
 * @param name The tracking system name
 */
//------------------------------------------------------------------------------
DSNTrackingSystem::DSNTrackingSystem(const std::string &name) :
   TrackingSystem          ("DSNTrackingSystem", name)
{
   objectTypeNames.push_back("DSNTrackingSystem");

   for (Integer i = Gmat::DSN_FIRST_MEASUREMENT; i < Gmat::DSN_MAX_MEASUREMENT;
         ++i)
   {
      allowedMeasurements.push_back(i);
   }
}


//------------------------------------------------------------------------------
// ~DSNTrackingSystem()
//------------------------------------------------------------------------------
/**
 * Destructor
 */
//------------------------------------------------------------------------------
DSNTrackingSystem::~DSNTrackingSystem()
{
}


//------------------------------------------------------------------------------
// DSNTrackingSystem(const DSNTrackingSystem & dts)
//------------------------------------------------------------------------------
/**
 * Copy constructor
 *
 * @param dts The instance providing configuration data for the new one
 */
//------------------------------------------------------------------------------
DSNTrackingSystem::DSNTrackingSystem(const DSNTrackingSystem & dts) :
   TrackingSystem          (dts)
{
}


//------------------------------------------------------------------------------
// DSNTrackingSystem& operator=(const USNTrackingSystem & dts)
//------------------------------------------------------------------------------
/**
 * Assignment operator
 *
 * @param dts The instance that supplies parameters for this one
 *
 * @return This instance configured to match usn
 */
//------------------------------------------------------------------------------
DSNTrackingSystem& DSNTrackingSystem::operator=(const DSNTrackingSystem & dts)
{
   if (this != &dts)
   {
      TrackingSystem::operator=(dts);
   }

   return *this;
}


//------------------------------------------------------------------------------
// GmatBase* Clone() const
//------------------------------------------------------------------------------
/**
 * Replicates this object through a call made on a GmatBase pointer
 *
 * @return A new instance generated through the copy constructor for this object
 */
//------------------------------------------------------------------------------
GmatBase* DSNTrackingSystem::Clone() const
{
   return new DSNTrackingSystem(*this);
}
