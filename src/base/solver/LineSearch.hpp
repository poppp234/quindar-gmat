//$Id$
//------------------------------------------------------------------------------
//                              LineSearch
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
// Developed jointly by NASA/GSFC and Thinking Systems, Inc. under contract
// number NNG06CA54C
//
// Created: 2008/03/27
//
/**
 * Class for line searches used by the Solvers.
 */
//------------------------------------------------------------------------------

#ifndef LineSearch_hpp
#define LineSearch_hpp

#include "gmatdefs.hpp"

/**
 * Definition for the line search class.  This class is not yet implemented.
 */
class GMAT_API LineSearch
{
public:
	LineSearch();
	virtual ~LineSearch();
};

#endif /*LineSearch_hpp*/
