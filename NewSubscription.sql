-----------------BEGIN: Script to be run at Publisher 'HP-VPR\S16'-----------------
use [cuponera]
exec sp_addsubscription @publication = N'CuponeraPRT', @subscriber = N'HP-VPR\S16', @destination_db = N'cuponeraRT', @subscription_type = N'Push', @sync_type = N'automatic', @article = N'all', @update_mode = N'read only', @subscriber_type = 0, @memory_optimized = 1
exec sp_addpushsubscription_agent @publication = N'CuponeraPRT', @subscriber = N'HP-VPR\S16', @subscriber_db = N'cuponeraRT', @job_login = N'HP-VPR\vidapogosoft', @job_password = null, @subscriber_security_mode = 0, @subscriber_login = N'sa', @subscriber_password = null, @frequency_type = 64, @frequency_interval = 0, @frequency_relative_interval = 0, @frequency_recurrence_factor = 0, @frequency_subday = 0, @frequency_subday_interval = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 20200323, @active_end_date = 99991231, @enabled_for_syncmgr = N'False', @dts_package_location = N'Distributor'
GO
-----------------END: Script to be run at Publisher 'HP-VPR\S16'-----------------

