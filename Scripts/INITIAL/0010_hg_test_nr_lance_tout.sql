--------------------------------------------------------------------------------------------------------------------------------
--	
--	Script name :	0010_utplsql_lance_tout.sql
--	-------------
--	
--	Purpose :		Les fichiers <sequence>_<user>_lance_tout.sql sont utilisés pour déployer des évolutions ou des
--	---------		corrections dans une base de données cible !
--					
--					Lors d'un déploiement, la personne en charge (le DBA pour l'environnement de PROD) exécute tous les
--					<sequence>_<user>_lance_tout.sql dans l'odre du numéro de séquence <sequence> indiqué dans le nom
--					des scripts.
--					
--					Pour l'instant encore, mais plus pour longtemps (je l'espère /* PSR le 01/10/2019 */), chacun de ces
--					scripts est exécuté avec l'utilisateur Oracle indiqué par <user> dans le nom du scripts.
--					
--	Notes :			
--	-------			
--					
--	Remarks :		1./ S'il devait falloir utiliser le caractère '&' dans des scripts, il faudrait :
--	---------			* Soit faire une SET DEFINE OFF puis ON, dans le fichier en question
--						* Soit utiliser un caractère d'echappement et remplacer toutes les
--						occurences de '&' par '<caractère d'échappement>&'.
--						Par exemple, on peut définir le caractère d'échappement comme étant le point d'exclamation '!' avec
--						la commande SQL*PLUS : SET ESACPE !
--						Et remplacer toutes les occurences de '&' par '!&' dans les scripts concernés.
--	
--	History
--	-------
--	DD.MM.YYYY	Author       	Comment
--	----------	-------------	--------------------------------------------------------------------------------
--	23.12.2019	XXX_Auteur   	Génération du script à partir du template "start_automate.template".
--	
--------------------------------------------------------------------------------------------------------------------------------
@conf
@spool_name "0010_utplsql_lance_tout"

-- Base DUNIQUE user EHG
--------------------------------------------------------------------------------------------------------------------------------
@log "****************************************** DEBUT ******************************************"

@log "A lancer sur HG_TEST_NR@DUNIQUE"
Select Sys_Context('USERENV', 'DB_UNIQUE_NAME') As "instance", Sys_Context('USERENV', 'CURRENT_USER') As "user" From SYS.DUAL;

--------------------------------------------------------------------------------------------------------------------------------
@log "Démarrage session ADMINISTRA ..."
--------------------------------------------------------------------------------------------------------------------------------
Execute Session_Manager.start_Session('ADMINISTRA', Null, 'Install UT');


--------------------------------------------------------------------------------------------------------------------------------
@log "Grant HG_TEST_HG..."
--------------------------------------------------------------------------------------------------------------------------------
@lance "./grant_utplsql_owner.sql"

--------------------------------------------------------------------------------------------------------------------------------
@log "Set HG_TEST_HG..."
--------------------------------------------------------------------------------------------------------------------------------
alter session set current_schema = HG_TEST_NR;

--------------------------------------------------------------------------------------------------------------------------------
@log "dbms_output buffer cache table..."
--------------------------------------------------------------------------------------------------------------------------------
@lance "./../../source/core/ut_dbms_output_cache.sql"

--------------------------------------------------------------------------------------------------------------------------------
@log "common utilities ..."
--------------------------------------------------------------------------------------------------------------------------------
@lance "./../../source/core/types/ut_varchar2_list.tps"
@lance "./../../source/core/types/ut_varchar2_rows.tps"
@lance "./../../source/core/types/ut_integer_list.tps"
@lance "./../../source/core/types/ut_object_name.tps"
@lance "./../../source/core/types/ut_object_name.tpb"
@lance "./../../source/core/types/ut_object_names.tps"
@lance "./../../source/core/types/ut_key_value_pair.tps"
@lance "./../../source/core/types/ut_key_value_pairs.tps"
@lance "./../../source/core/types/ut_reporter_info.tps"
@lance "./../../source/core/types/ut_reporters_info.tps"
@lance "./../../source/core/ut_utils.pks"
@lance "./../../source/core/ut_metadata.pks"
@lance "./../../source/core/ut_savepoint_seq.sql"
@lance "./../../source/core/ut_utils.pkb"
@lance "./../../source/core/ut_metadata.pkb"
@lance "./../../source/reporters/ut_ansiconsole_helper.pks"
@lance "./../../source/reporters/ut_ansiconsole_helper.pkb"

@lance "./../../source/api/ut_suite_item_info.tps"
@lance "./../../source/api/ut_suite_item_info.tpb"
@lance "./../../source/api/ut_suite_items_info.tps"

--------------------------------------------------------------------------------------------------------------------
@log "event manager objects ..."
--------------------------------------------------------------------------------------------------------------------
@lance "./../../source/core/events/ut_event_item.tps"
@lance "./../../source/core/events/ut_event_listener.tps"
@lance "./../../source/core/events/ut_event_manager.pks"
@lance "./../../source/core/events/ut_event_manager.pkb"

--------------------------------------------------------------------------------------------------------------------
@log "core types ..."
--------------------------------------------------------------------------------------------------------------------
@lance "./../../source/core/types/ut_run_info.tps"
@lance "./../../source/core/types/ut_run_info.tpb"
@lance "./../../source/core/types/ut_expectation_result.tps"
@lance "./../../source/core/types/ut_expectation_results.tps"
@lance "./../../source/core/types/ut_results_counter.tps"
@lance "./../../source/core/types/ut_suite_item.tps"
@lance "./../../source/core/types/ut_suite_items.tps"
@lance "./../../source/core/types/ut_executable.tps"
@lance "./../../source/core/types/ut_executables.tps"
@lance "./../../source/core/types/ut_executable_test.tps"
@lance "./../../source/core/types/ut_test.tps"
@lance "./../../source/core/types/ut_logical_suite.tps"
@lance "./../../source/core/types/ut_suite.tps"
@lance "./../../source/core/types/ut_suite_context.tps"
@lance "./../../source/core/types/ut_file_mapping.tps"
@lance "./../../source/core/types/ut_file_mappings.tps"
@lance "./../../source/core/types/ut_coverage_options.tps"
@lance "./../../source/core/types/ut_run.tps"
@lance "./../../source/core/types/ut_reporter_base.tps"
@lance "./../../source/core/types/ut_reporters.tps"


@lance "./../../source/expectations/json_objects_specs.sql"
@lance "./../../source/expectations/matchers/ut_matcher_options_items.tps"
@lance "./../../source/expectations/matchers/ut_matcher_options.tps"
@lance "./../../source/expectations/data_values/ut_data_value.tps"
@lance "./../../source/expectations/data_values/ut_key_anyval_pair.tps"
@lance "./../../source/expectations/data_values/ut_key_anyval_pairs.tps"
@lance "./../../source/expectations/data_values/ut_key_anyvalues.tps"

--------------------------------------------------------------------------------------------------------------------
@log "session_context ..."
--------------------------------------------------------------------------------------------------------------------
@lance "./../../source/core/session_context/ut_session_context.pks"
@lance "./../../source/core/session_context/ut_session_context.pkb"
@lance "./../../source/core/session_context/ut_session_info.tps"
@lance "./../../source/core/session_context/ut_session_info.tpb"

--------------------------------------------------------------------------------------------------------------------
@log "output buffer table ..."
--------------------------------------------------------------------------------------------------------------------
@lance "./../../source/core/output_buffers/ut_output_buffer_info_tmp.sql"
@lance "./../../source/core/output_buffers/ut_output_buffer_tmp.sql"
@lance "./../../source/core/output_buffers/ut_output_clob_buffer_tmp.sql"

--------------------------------------------------------------------------------------------------------------------
@log "output buffer base api ..."
--------------------------------------------------------------------------------------------------------------------
@lance "./../../source/core/output_buffers/ut_output_data_row.tps"
@lance "./../../source/core/output_buffers/ut_output_data_rows.tps"
@lance "./../../source/core/output_buffers/ut_output_buffer_base.tps"
@lance "./../../source/core/output_buffers/ut_output_buffer_base.tpb"

--------------------------------------------------------------------------------------------------------------------
@log "output buffer table api ..."
--------------------------------------------------------------------------------------------------------------------
@lance "./../../source/core/output_buffers/ut_output_table_buffer.tps"
@lance "./../../source/core/output_buffers/ut_output_table_buffer.tpb"
@lance "./../../source/core/output_buffers/ut_output_clob_table_buffer.tps"
@lance "./../../source/core/output_buffers/ut_output_clob_table_buffer.tpb"

@lance "./../../source/core/types/ut_output_reporter_base.tps"

--------------------------------------------------------------------------------------------------------------------
@log "annotations ..."
--------------------------------------------------------------------------------------------------------------------
@lance "./../../source/core/annotations/ut_trigger_check.pks"
@lance "./../../source/core/annotations/ut_trigger_check.pkb"
@lance "./../../source/core/annotations/ut_annotation.tps"
@lance "./../../source/core/annotations/ut_annotations.tps"
@lance "./../../source/core/annotations/ut_annotated_object.tps"
@lance "./../../source/core/annotations/ut_annotated_objects.tps"
@lance "./../../source/core/annotations/ut_annotation_obj_cache_info.tps"
@lance "./../../source/core/annotations/ut_annotation_objs_cache_info.tps"
@lance "./../../source/core/annotations/ut_annotation_cache_seq.sql"
@lance "./../../source/core/annotations/ut_annotation_cache_schema.sql"
@lance "./../../source/core/annotations/ut_annotation_cache_info.sql"
@lance "./../../source/core/annotations/ut_annotation_cache.sql"
@lance "./../../source/core/annotations/ut_annotation_cache_manager.pks"
@lance "./../../source/core/annotations/ut_annotation_cache_manager.pkb"
@lance "./../../source/core/annotations/ut_annotation_parser.pks"
@lance "./../../source/core/annotations/ut_annotation_parser.pkb"
@lance "./../../source/core/annotations/ut_annotation_manager.pks"
@lance "./../../source/core/annotations/ut_annotation_manager.pkb"

--------------------------------------------------------------------------------------------------------------------
@log "suite builder ..."
--------------------------------------------------------------------------------------------------------------------
@lance "./../../source/core/types/ut_suite_cache_row.tps"
@lance "./../../source/core/types/ut_suite_cache_rows.tps"
@lance "./../../source/core/ut_suite_cache_schema.sql"
@lance "./../../source/core/ut_suite_cache_package.sql"
@lance "./../../source/core/ut_suite_cache_seq.sql"
@lance "./../../source/core/ut_suite_cache.sql"

@lance "./../../source/core/ut_suite_cache_manager.pks"
@lance "./../../source/core/ut_suite_cache_manager.pkb"
@lance "./../../source/core/ut_suite_builder.pks"
@lance "./../../source/core/ut_suite_builder.pkb"

--------------------------------------------------------------------------------------------------------------------
@log "suite manager ..."
--------------------------------------------------------------------------------------------------------------------
@lance "./../../source/core/ut_suite_manager.pks"
@lance "./../../source/core/ut_suite_manager.pkb"

--------------------------------------------------------------------------------------------------------------------
@log "expectations execution state interface ..."
--------------------------------------------------------------------------------------------------------------------                               
@lance "./../../source/core/ut_expectation_processor.pks"
@lance "./../../source/core/ut_expectation_processor.pkb"

@lance "./../../source/core/coverage/proftab.sql"
@lance "./../../source/core/coverage/dbms_plssqlcode.sql"

@lance "./../../source/core/ut_file_mapper.pks"
@lance "./../../source/core/ut_file_mapper.pkb"

--------------------------------------------------------------------------------------------------------------------
@log "gathering coverage ..."
-------------------------------------------------------------------------------------------------------------------- 
@lance "./../../source/core/coverage/ut_coverage_sources_tmp.sql"
@lance "./../../source/core/coverage/ut_coverage_runs.sql"
@lance "./../../source/core/coverage/ut_coverage_helper.pks"
@lance "./../../source/core/coverage/ut_coverage_helper_block.pks"
@lance "./../../source/core/coverage/ut_coverage_helper_profiler.pks"
@lance "./../../source/core/coverage/ut_coverage.pks"
@lance "./../../source/core/coverage/ut_coverage_block.pks"
@lance "./../../source/core/coverage/ut_coverage_profiler.pks"
@lance "./../../source/core/coverage/ut_coverage_reporter_base.tps"
@lance "./../../source/core/coverage/ut_coverage_helper.pkb"
@lance "./../../source/core/coverage/ut_coverage_helper_block.pkb"
@lance "./../../source/core/coverage/ut_coverage_helper_profiler.pkb"
@lance "./../../source/core/coverage/ut_coverage.pkb"
@lance "./../../source/core/coverage/ut_coverage_block.pkb"
@lance "./../../source/core/coverage/ut_coverage_profiler.pkb"
@lance "./../../source/core/coverage/ut_coverage_reporter_base.tpb"

--------------------------------------------------------------------------------------------------------------------
@log "core type bodies ..."
-------------------------------------------------------------------------------------------------------------------- 
@lance "./../../source/core/types/ut_results_counter.tpb"
@lance "./../../source/core/types/ut_suite_item.tpb"
@lance "./../../source/core/types/ut_test.tpb"
@lance "./../../source/core/types/ut_logical_suite.tpb"
@lance "./../../source/core/types/ut_suite.tpb"
@lance "./../../source/core/types/ut_suite_context.tpb"
@lance "./../../source/core/types/ut_coverage_options.tpb"
@lance "./../../source/core/types/ut_run.tpb"
@lance "./../../source/core/types/ut_expectation_result.tpb"
@lance "./../../source/core/types/ut_reporter_base.tpb"
@lance "./../../source/core/types/ut_output_reporter_base.tpb"
@lance "./../../source/core/types/ut_file_mapping.tpb"
@lance "./../../source/core/types/ut_executable.tpb"
@lance "./../../source/core/types/ut_executable_test.tpb"
@lance "./../../source/core/types/ut_console_reporter_base.tps"
@lance "./../../source/core/types/ut_console_reporter_base.tpb"

--------------------------------------------------------------------------------------------------------------------
@log "expectations and matchers  ..."
--------------------------------------------------------------------------------------------------------------------
@lance "./../../source/expectations/data_values/ut_compound_data_tmp.sql"
@lance "./../../source/expectations/data_values/ut_compound_data_diff_tmp.sql"
@lance "./../../source/expectations/data_values/ut_json_data_diff_tmp.sql"
@lance "./../../source/expectations/data_values/ut_compound_data_value.tps"
@lance "./../../source/expectations/data_values/ut_json_leaf.tps"
@lance "./../../source/expectations/data_values/ut_json_leaf_tab.tps"
@lance "./../../source/expectations/data_values/ut_json_tree_details.tps"
@lance "./../../source/expectations/data_values/ut_cursor_column.tps"
@lance "./../../source/expectations/data_values/ut_cursor_column_tab.tps"
@lance "./../../source/expectations/data_values/ut_cursor_details.tps"
@lance "./../../source/expectations/data_values/ut_data_value_blob.tps"
@lance "./../../source/expectations/data_values/ut_data_value_boolean.tps"
@lance "./../../source/expectations/data_values/ut_data_value_clob.tps"
@lance "./../../source/expectations/data_values/ut_data_value_date.tps"
@lance "./../../source/expectations/data_values/ut_data_value_dsinterval.tps"
@lance "./../../source/expectations/data_values/ut_data_value_number.tps"
@lance "./../../source/expectations/data_values/ut_data_value_refcursor.tps"
@lance "./../../source/expectations/data_values/ut_data_value_anydata.tps"
@lance "./../../source/expectations/data_values/ut_data_value_timestamp.tps"
@lance "./../../source/expectations/data_values/ut_data_value_timestamp_tz.tps"
@lance "./../../source/expectations/data_values/ut_data_value_timestamp_ltz.tps"
@lance "./../../source/expectations/data_values/ut_data_value_varchar2.tps"
@lance "./../../source/expectations/data_values/ut_data_value_yminterval.tps"
@lance "./../../source/expectations/data_values/ut_data_value_xmltype.tps"
@lance "./../../source/expectations/data_values/ut_compound_data_helper.pks"
@lance "./../../source/expectations/data_values/ut_data_value_json.tps"
@lance "./../../source/expectations/matchers/ut_matcher_base.tps"
@lance "./../../source/expectations/ut_expectation_base.tps"
@lance "./../../source/expectations/matchers/ut_matcher.tps"
@lance "./../../source/expectations/matchers/ut_comparison_matcher.tps"
@lance "./../../source/expectations/matchers/ut_be_within_pct.tps"
@lance "./../../source/expectations/matchers/ut_be_within.tps"
@lance "./../../source/expectations/matchers/ut_be_within_helper.pks"
@lance "./../../source/expectations/ut_expectation.tps"
@lance "./../../source/expectations/matchers/ut_be_false.tps"
@lance "./../../source/expectations/matchers/ut_be_greater_or_equal.tps"
@lance "./../../source/expectations/matchers/ut_be_greater_than.tps"
@lance "./../../source/expectations/matchers/ut_be_less_or_equal.tps"
@lance "./../../source/expectations/matchers/ut_be_less_than.tps"
@lance "./../../source/expectations/matchers/ut_be_like.tps"
@lance "./../../source/expectations/matchers/ut_be_not_null.tps"
@lance "./../../source/expectations/matchers/ut_be_null.tps"
@lance "./../../source/expectations/matchers/ut_be_true.tps"
@lance "./../../source/expectations/matchers/ut_equal.tps"
@lance "./../../source/expectations/matchers/ut_contain.tps"
@lance "./../../source/expectations/matchers/ut_have_count.tps"
@lance "./../../source/expectations/matchers/ut_be_between.tps"
@lance "./../../source/expectations/matchers/ut_be_empty.tps"
@lance "./../../source/expectations/matchers/ut_match.tps"
@lance "./../../source/expectations/data_values/ut_json_leaf.tpb"
@lance "./../../source/expectations/data_values/ut_json_tree_details.tpb"
@lance "./../../source/expectations/data_values/ut_cursor_column.tpb"
@lance "./../../source/expectations/data_values/ut_cursor_details.tpb"
@lance "./../../source/expectations/ut_expectation_compound.tps"
@lance "./../../source/expectations/ut_expectation_json.tps"
@lance "./../../source/expectations/ut_has_message_in_message_stack.tps"

@lance "./../../source/expectations/matchers/ut_matcher_options_items.tpb"
@lance "./../../source/expectations/matchers/ut_matcher_options.tpb"
@lance "./../../source/expectations/data_values/ut_data_value.tpb"
@lance "./../../source/expectations/data_values/ut_compound_data_value.tpb"
@lance "./../../source/expectations/data_values/ut_compound_data_helper.pkb"
@lance "./../../source/expectations/data_values/ut_data_value_blob.tpb"
@lance "./../../source/expectations/data_values/ut_data_value_boolean.tpb"
@lance "./../../source/expectations/data_values/ut_data_value_clob.tpb"
@lance "./../../source/expectations/data_values/ut_data_value_date.tpb"
@lance "./../../source/expectations/data_values/ut_data_value_dsinterval.tpb"
@lance "./../../source/expectations/data_values/ut_data_value_number.tpb"
@lance "./../../source/expectations/data_values/ut_data_value_refcursor.tpb"
@lance "./../../source/expectations/data_values/ut_data_value_anydata.tpb"
@lance "./../../source/expectations/data_values/ut_data_value_timestamp.tpb"
@lance "./../../source/expectations/data_values/ut_data_value_timestamp_tz.tpb"
@lance "./../../source/expectations/data_values/ut_data_value_timestamp_ltz.tpb"
@lance "./../../source/expectations/data_values/ut_data_value_varchar2.tpb"
@lance "./../../source/expectations/data_values/ut_data_value_yminterval.tpb"
@lance "./../../source/expectations/data_values/ut_data_value_xmltype.tpb"
@lance "./../../source/expectations/data_values/ut_data_value_json.tpb"
@lance "./../../source/expectations/matchers/ut_matcher.tpb"
@lance "./../../source/expectations/matchers/ut_comparison_matcher.tpb"
@lance "./../../source/expectations/matchers/ut_be_false.tpb"
@lance "./../../source/expectations/matchers/ut_be_greater_or_equal.tpb"
@lance "./../../source/expectations/matchers/ut_be_greater_than.tpb"
@lance "./../../source/expectations/matchers/ut_be_less_or_equal.tpb"
@lance "./../../source/expectations/matchers/ut_be_less_than.tpb"
@lance "./../../source/expectations/matchers/ut_be_like.tpb"
@lance "./../../source/expectations/matchers/ut_be_not_null.tpb"
@lance "./../../source/expectations/matchers/ut_be_null.tpb"
@lance "./../../source/expectations/matchers/ut_be_true.tpb"
@lance "./../../source/expectations/matchers/ut_equal.tpb"
@lance "./../../source/expectations/matchers/ut_be_within_pct.tpb"
@lance "./../../source/expectations/matchers/ut_be_within.tpb"
@lance "./../../source/expectations/matchers/ut_be_within_helper.pkb"
@lance "./../../source/expectations/matchers/ut_contain.tpb"
@lance "./../../source/expectations/matchers/ut_have_count.tpb"
@lance "./../../source/expectations/matchers/ut_be_between.tpb"
@lance "./../../source/expectations/matchers/ut_be_empty.tpb"
@lance "./../../source/expectations/matchers/ut_match.tpb"
@lance "./../../source/expectations/ut_expectation_base.tpb"
@lance "./../../source/expectations/ut_expectation.tpb"
@lance "./../../source/expectations/ut_expectation_compound.tpb"
@lance "./../../source/expectations/ut_expectation_json.tpb"
@lance "./../../source/expectations/data_values/ut_key_anyvalues.tpb"
@lance "./../../source/expectations/ut_has_message_in_message_stack.tpb"

--------------------------------------------------------------------------------------------------------------------
@log "core reporter  ..."
--------------------------------------------------------------------------------------------------------------------
@lance "./../../source/reporters/ut_documentation_reporter.tps"
@lance "./../../source/reporters/ut_documentation_reporter.tpb"

--------------------------------------------------------------------------------------------------------------------
@log "plugin interface API for running utPLSQL  ..."
--------------------------------------------------------------------------------------------------------------------
@lance "./../../source/api/ut_runner.pks"
@lance "./../../source/api/ut_runner.pkb"

--------------------------------------------------------------------------------------------------------------------
@log "developer interface for expectations and running utPLSQL  ..."
--------------------------------------------------------------------------------------------------------------------
@lance "./../../source/api/ut.pks"
@lance "./../../source/api/ut.pkb"

--------------------------------------------------------------------------------------------------------------------
@log "additional reporters  ..."
--------------------------------------------------------------------------------------------------------------------
@lance "./../../source/reporters/ut_debug_reporter.tps"
@lance "./../../source/reporters/ut_debug_reporter.tpb"
@lance "./../../source/reporters/ut_teamcity_reporter.tps"
@lance "./../../source/reporters/ut_teamcity_reporter_helper.pks"
@lance "./../../source/reporters/ut_teamcity_reporter_helper.pkb"
@lance "./../../source/reporters/ut_teamcity_reporter.tpb"
@lance "./../../source/reporters/ut_junit_reporter.tps"
@lance "./../../source/reporters/ut_junit_reporter.tpb"
@lance "./../../source/reporters/ut_tfs_junit_reporter.tps"
@lance "./../../source/reporters/ut_tfs_junit_reporter.tpb"
@lance "./../../source/reporters/ut_xunit_reporter.tps"
@lance "./../../source/reporters/ut_xunit_reporter.tpb"
@lance "./../../source/reporters/ut_sonar_test_reporter.tps"
@lance "./../../source/reporters/ut_sonar_test_reporter.tpb"

@lance "./../../source/reporters/ut_coverage_html_reporter.tps"
@lance "./../../source/reporters/ut_coverage_report_html_helper.pks"
@lance "./../../source/reporters/ut_coverage_report_html_helper.pkb"
@lance "./../../source/reporters/ut_coverage_html_reporter.tpb"
@lance "./../../source/reporters/ut_coverage_sonar_reporter.tps"
@lance "./../../source/reporters/ut_coverage_sonar_reporter.tpb"
@lance "./../../source/reporters/ut_coveralls_reporter.tps"
@lance "./../../source/reporters/ut_coveralls_reporter.tpb"
@lance "./../../source/reporters/ut_coverage_cobertura_reporter.tps"
@lance "./../../source/reporters/ut_coverage_cobertura_reporter.tpb"
@lance "./../../source/reporters/ut_realtime_reporter.tps"
@lance "./../../source/reporters/ut_realtime_reporter.tpb"

@lance "./../../source/api/be_between.syn"
@lance "./../../source/api/be_empty.syn"
@lance "./../../source/api/be_false.syn"
@lance "./../../source/api/be_greater_or_equal.syn"
@lance "./../../source/api/be_greater_than.syn"
@lance "./../../source/api/be_less_or_equal.syn"
@lance "./../../source/api/be_less_than.syn"
@lance "./../../source/api/be_like.syn"
@lance "./../../source/api/be_not_null.syn"
@lance "./../../source/api/be_null.syn"
@lance "./../../source/api/be_true.syn"
@lance "./../../source/api/be_within_pct.syn"
@lance "./../../source/api/be_within.syn"
@lance "./../../source/api/equal.syn"
@lance "./../../source/api/have_count.syn"
@lance "./../../source/api/match.syn"
@lance "./../../source/api/contain.syn"

--------------------------------------------------------------------------------------------------------------------------------
@log "Set HG_DEV_DEPLOY..."
--------------------------------------------------------------------------------------------------------------------------------
alter session set current_schema = HG_DEV_DEPLOY;

----------------------------------------------------------------------------------------------------------------------------
@log "Recompilation des invalides ..."
----------------------------------------------------------------------------------------------------------------------------
Execute recompiler_Objets_Invalides();
	
----------------------------------------------------------------------------------------------------------------------------
@log "Fin de session ADMINISTRA ..."
----------------------------------------------------------------------------------------------------------------------------
Execute Session_Manager.stop_Session;
	
----------------------------------------------------------------------------------------------------------------------------
@log "************************************* Fin script HG_TEST_NR *************************************"
----------------------------------------------------------------------------------------------------------------------------

spool off
