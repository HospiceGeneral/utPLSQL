create or replace type ut_has_message_in_message_stack under  ut_comparison_matcher(
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

  Minimum_Level             VARCHAR2(20),
  
  member procedure init(self in out nocopy ut_has_message_in_message_stack, a_expected ut_data_value, pv_Minimum_Level VARCHAR2),
  member function test_pile(self in out nocopy ut_has_message_in_message_stack) return Boolean,
  constructor function ut_has_message_in_message_stack(self in out nocopy ut_has_message_in_message_stack, a_expected Boolean, pv_Minimum_Level VARCHAR2) return self as result,
  constructor function ut_has_message_in_message_stack(self in out nocopy ut_has_message_in_message_stack,a_expected Boolean) return self as result,
  
  overriding member function run_matcher(self in out nocopy ut_has_message_in_message_stack, a_actual ut_data_value) return boolean,
  overriding member function failure_message(a_actual ut_data_value) return varchar2,
  overriding member function failure_message_when_negated(a_actual ut_data_value) return varchar2
)
/
