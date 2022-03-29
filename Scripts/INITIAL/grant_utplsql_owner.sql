--------------------------------------------------------------------------------------------------------------------------------
--                  
--  Script name :	create_utplsql_owner.sql
--  -------------
--
--  Purpose :	Cr�ation du user de test pour l'installation d'UTPLSQL
--  ---------	
--
--  Notes :		Bas� sur le script ./source/create_utplsql_owner   utPLSQL - Version 3 
--  -------      Licensed under the Apache License, Version 2.0 (the "License"):   http://www.apache.org/licenses/LICENSE-2.0
--
--  History
--  -------
--  DD.MM.YYYY      Author           Comment
--  ----------     -------------	--------------------------------------------------------------------------------------------
--	24.03.2022      JEBARSKE         Cr�ation
--                  
--------------------------------------------------------------------------------------------------------------------------------
Grant Select Any table to HG_TEST_NR;
Grant Insert Any table to HG_TEST_NR;
Grant Update Any table to HG_TEST_NR;
Grant Delete Any table to HG_TEST_NR;

