--------------------------------------------------------------------------------------------------------------------------------
--                  
--  Script name :	grant_utpackages.sql
--  -------------
--
--  Purpose :	grant des package UT pour les tests 
--  ---------	
--
--  Notes :		
--  -------      
--
--  History
--  -------
--  DD.MM.YYYY      Author           Comment
--  ----------     -------------	--------------------------------------------------------------------------------------------
--	06.04.2022     JEBARSKE         Création
--  06.07.2022     JEBARSKE         Ajout grant to public to genrate tests files from pl/Sql                 
--------------------------------------------------------------------------------------------------------------------------------

--public API
grant execute on hg_test_nr.ut to public;
grant execute on hg_test_nr.ut_runner to public;
grant execute on hg_test_nr.ut_file_mappings to public;
grant execute on hg_test_nr.ut_file_mapping to public;
grant execute on hg_test_nr.ut_file_mapper to public;
grant execute on hg_test_nr.ut_suite_items_info to public;
grant execute on hg_test_nr.ut_suite_item_info to public;
grant execute on hg_test_nr.ut_run_info to public;
grant execute on hg_test_nr.ut_coverage_options to public;

--generic types
grant execute on hg_test_nr.ut_varchar2_list to public;
grant execute on hg_test_nr.ut_varchar2_rows to public;
grant execute on hg_test_nr.ut_integer_list to public;
grant execute on hg_test_nr.ut_key_value_pairs to public;
grant execute on hg_test_nr.ut_key_value_pair to public;

--expectations
grant execute on hg_test_nr.ut_expectation to public;
grant execute on hg_test_nr.ut_expectation_compound to public;
grant execute on hg_test_nr.ut_expectation_json to public;

--matchers
grant execute on hg_test_nr.ut_matcher to public;
grant execute on hg_test_nr.ut_be_between to public;
grant execute on hg_test_nr.ut_be_empty to public;
grant execute on hg_test_nr.ut_be_false to public;
grant execute on hg_test_nr.ut_be_greater_or_equal to public;
grant execute on hg_test_nr.ut_be_greater_than to public;
grant execute on hg_test_nr.ut_be_less_or_equal to public;
grant execute on hg_test_nr.ut_be_less_than to public;
grant execute on hg_test_nr.ut_be_like to public;
grant execute on hg_test_nr.ut_be_not_null to public;
grant execute on hg_test_nr.ut_be_null to public;
grant execute on hg_test_nr.ut_be_true to public;
grant execute on hg_test_nr.ut_be_within to public;
grant execute on hg_test_nr.ut_be_within_pct to public;
grant execute on hg_test_nr.ut_contain to public;
grant execute on hg_test_nr.ut_equal to public;
grant execute on hg_test_nr.ut_have_count to public;
grant execute on hg_test_nr.ut_match to public;

--reporters - test results
grant execute on hg_test_nr.ut_teamcity_reporter to public;
grant execute on hg_test_nr.ut_xunit_reporter to public;
grant execute on hg_test_nr.ut_junit_reporter to public;
grant execute on hg_test_nr.ut_tfs_junit_reporter to public;
grant execute on hg_test_nr.ut_documentation_reporter to public;
grant execute on hg_test_nr.ut_sonar_test_reporter to public;
grant execute on hg_test_nr.ut_realtime_reporter to public;
--reporters - coverage
grant execute on hg_test_nr.ut_coverage_html_reporter to public;
grant execute on hg_test_nr.ut_coverage_sonar_reporter to public;
grant execute on hg_test_nr.ut_coveralls_reporter to public;
grant execute on hg_test_nr.ut_coverage_cobertura_reporter to public;
--reporters - debug
grant execute on hg_test_nr.ut_debug_reporter to public;

--reporters - base types
grant execute on hg_test_nr.ut_reporters to public;
grant execute on hg_test_nr.ut_reporter_base to public;
grant execute on hg_test_nr.ut_output_reporter_base to public;
grant execute on hg_test_nr.ut_coverage_reporter_base to public;
grant execute on hg_test_nr.ut_console_reporter_base to public;

--outputs
grant execute on hg_test_nr.ut_output_buffer_base to public;
grant execute on hg_test_nr.ut_output_table_buffer to public;
grant execute on hg_test_nr.ut_output_clob_table_buffer to public;

--needed internally for selecting from annotation objects within packages that use invoker rights
grant execute on hg_test_nr.ut_annotation_objs_cache_info to public;
grant execute on hg_test_nr.ut_annotation_obj_cache_info to public;

--other grants
grant execute on hg_test_nr.ut_executables to public;
grant execute on hg_test_nr.ut_executable_test to public;
grant execute on hg_test_nr.ut_suite_cache_row to public;
grant execute on hg_test_nr.ut_suite_cache_rows to public;

grant select, insert, delete, update on hg_test_nr.dbmspcc_blocks to public;
grant select, insert, delete, update on hg_test_nr.dbmspcc_runs   to public;
grant select, insert, delete, update on hg_test_nr.dbmspcc_units  to public;
grant select  on hg_test_nr.ut_coverage_runs   to public;
grant execute on hg_test_nr.ut_matcher_options to public;
grant execute on hg_test_nr.ut_matcher_options_items to public;