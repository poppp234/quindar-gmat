//$Id$
//------------------------------------------------------------------------------
//                                  Interface
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
// Developed jointly by NASA/GSFC and Thinking Systems, Inc. under contract
// number S-67573-G
//
// Author: Linda Jun/GSFC
// Created: 2010/04/02
//
/**
 * Declaration of Interface class.
 */
//------------------------------------------------------------------------------
#ifndef Interface_hpp
#define Interface_hpp

#include "GmatBase.hpp" // inheriting class's header file

class GMAT_API Interface : public GmatBase
{
public:
   Interface(const std::string &type, const std::string &name);
   Interface(const Interface &interf);
   virtual ~Interface();
   
   virtual Integer      Open(const std::string &name = "");
   virtual Integer      Close(const std::string &name = "");
   
   // Parameter IDs
   enum
   {
      InterfaceParamCount = GmatBaseParamCount
   };
   
protected:
   
};

#endif // Interface_hpp

