//$Id$
//------------------------------------------------------------------------------
//                           OptimizePanel
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
// Developed jointly by NASA/GSFC and Thinking Systems, Inc.
//
// Author: Linda Jun (NASA/GSFC)
// Created: 2007/01/26
//
/**
 * This class contains the Optimize setup window.
 */
//------------------------------------------------------------------------------
#ifndef OptimizePanel_hpp
#define OptimizePanel_hpp

#include "gmatwxdefs.hpp"
#include "GmatCommand.hpp"
#include "GmatPanel.hpp"

class OptimizePanel : public GmatPanel
{
public:
   // constructor
   OptimizePanel(wxWindow *parent, GmatCommand *cmd);
   ~OptimizePanel();   
   
private:
   
   GmatCommand *theCommand;
   
   wxComboBox *mSolverComboBox;
   wxComboBox *mSolverModeComboBox;
   wxComboBox *mExitModeComboBox;
   wxCheckBox *mProgressWindowCheckBox;
   wxButton   *mApplyCorrectionsButton;
   
   // methods inherited from GmatPanel
   virtual void Create();
   virtual void LoadData();
   virtual void SaveData();
   
   // Combobox event method
   void OnComboBoxChange(wxCommandEvent& event);
   
   // Button press event method
   void OnApplyButtonPress(wxCommandEvent& event);

   // any class wishing to process wxWindows events must use this macro
   DECLARE_EVENT_TABLE();
   
   // IDs for the controls and the menu commands
   enum
   {     
      ID_TEXT = 51000,
      ID_COMBO,
      ID_PROGRESS_CHECKBOX,
      ID_APPLYBUTTON
   };
};

#endif // OptimizePanel_hpp

