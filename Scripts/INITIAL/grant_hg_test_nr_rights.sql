--------------------------------------------------------------------------------------------------------------------------------
--                  
--  Script name :	grant_hg_test_nr_rights.sql
--  -------------
--
--  Purpose :	grant des droits du user hg_test_nr pour les tests 
--  ---------	
--
--  Notes :		
--  -------      
--
--  History
--  -------
--  DD.MM.YYYY      Author           Comment
--  ----------     -------------	--------------------------------------------------------------------------------------------
--	06.04.2022      JEBARSKE         Création
--                  
--------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE CONTEXT HG_TEST_NR_INFO Using HG_TEST_NR.UT_SESSION_CONTEXT;

grant create any synonym  to HG_TEST_NR;
grant create any procedure  to HG_TEST_NR;
grant create any type  to HG_TEST_NR;
grant create any trigger  to HG_TEST_NR;

Grant Select Any table to HG_TEST_NR;
Grant Insert Any table to HG_TEST_NR;
Grant Update Any table to HG_TEST_NR;
Grant Delete Any table to HG_TEST_NR;