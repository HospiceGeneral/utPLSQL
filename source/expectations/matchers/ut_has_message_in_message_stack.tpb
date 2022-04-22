create or replace type body ut_has_message_in_message_stack as
  /*
  utPLSQL - Version 3
  Copyright 2016 - 2021 utPLSQL Project

  Licensed under the Apache License, Version 2.0 (the "License"):
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
  
    usage:  check sthe stack of message 
  */
  member procedure init(self in out nocopy ut_has_message_in_message_stack, a_expected ut_data_value,  pv_Minimum_Level VARCHAR2) Is
  Begin
    self.self_type := $$plsql_unit;
    self.Minimum_Level  := pv_Minimum_Level;
    self.expected  := a_expected;
  End;
  
  constructor function ut_has_message_in_message_stack(self in out nocopy ut_has_message_in_message_stack,  a_expected Boolean, pv_Minimum_Level VARCHAR2) return self as result is
  begin
    init(ut_data_value_boolean(a_expected),pv_Minimum_Level);
    return;
  end;
  
  constructor function ut_has_message_in_message_stack(self in out nocopy ut_has_message_in_message_stack, a_expected Boolean) return self as result is
  begin
    init(ut_data_value_boolean(a_expected),null);
    return;
  end;

  member function test_pile(self in out nocopy ut_has_message_in_message_stack) return Boolean is
  
     l_result boolean;
  Begin 
   if self.Minimum_Level is null or self.Minimum_Level not in ( HG_UTILITIES.Logger.V_LEVEL_ERROR,HG_UTILITIES.Logger.V_LEVEL_CRITICAL) Then 
      l_result := HG_UTILITIES.Logger.a_Des_Messages_Dans_La_Pile;
   Else
      l_result := HG_UTILITIES.Logger.a_Des_Erreurs_Dans_La_Pile;
   end if;
   
   return l_result;
  End;
    
  overriding member function run_matcher(self in out nocopy ut_has_message_in_message_stack, a_actual ut_data_value) return boolean is
    l_result boolean;
    l_result_expectation Boolean;
    l_result_pile Boolean;
  begin
    l_result_pile := test_pile();
    l_result_expectation :=  ut_utils.int_to_boolean( treat(self.expected as ut_data_value_boolean).data_value);

   If l_result_expectation = l_result_pile Then 
      l_result := True;
   Else
      l_result := False;
   End If;

    return l_result;
  end;

  overriding member function failure_message(a_actual ut_data_value) return varchar2 is
  begin
     return (self as ut_matcher).failure_message(a_actual) || ': '|| expected.to_string_report();
  end;

  overriding member function failure_message_when_negated(a_actual ut_data_value) return varchar2 is
  begin
    return (self as ut_matcher).failure_message_when_negated(a_actual) || ': '|| expected.to_string_report();
  end;

end;
/
