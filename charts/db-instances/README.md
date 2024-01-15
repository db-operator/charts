# db-instances

![Version: 2.2.0](https://img.shields.io/badge/Version-2.2.0-informational?style=flat-square) ![AppVersion: 1.0](https://img.shields.io/badge/AppVersion-1.0-informational?style=flat-square)

Database Instances for db operator

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| dbinstances | object | `{}` |  |
| nodeSelector | object | `{}` |  |
| exporter.postgres.image | string | `"wrouesnel/postgres_exporter:latest"` |  |
| exporter.postgres.query.pg_postmaster.query | string | `"SELECT pg_postmaster_start_time as start_time_seconds from pg_postmaster_start_time()"` |  |
| exporter.postgres.query.pg_postmaster.metrics[0].start_time_seconds.usage | string | `"GAUGE"` |  |
| exporter.postgres.query.pg_postmaster.metrics[0].start_time_seconds.description | string | `"Time at which postmaster started"` |  |
| exporter.postgres.query.pg_stat_user_tables.query | string | `"SELECT schemaname, relname, seq_scan, seq_tup_read, idx_scan, idx_tup_fetch, n_tup_ins, n_tup_upd, n_tup_del, n_tup_hot_upd, n_live_tup, n_dead_tup, n_mod_since_analyze, last_vacuum, last_autovacuum, last_analyze, last_autoanalyze, vacuum_count, autovacuum_count, analyze_count, autoanalyze_count FROM pg_stat_user_tables"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[0].schemaname.usage | string | `"LABEL"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[0].schemaname.description | string | `"Name of the schema that this table is in"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[1].relname.usage | string | `"LABEL"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[1].relname.description | string | `"Name of this table"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[2].seq_scan.usage | string | `"COUNTER"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[2].seq_scan.description | string | `"Number of sequential scans initiated on this table"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[3].seq_tup_read.usage | string | `"COUNTER"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[3].seq_tup_read.description | string | `"Number of live rows fetched by sequential scans"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[4].idx_scan.usage | string | `"COUNTER"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[4].idx_scan.description | string | `"Number of index scans initiated on this table"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[5].idx_tup_fetch.usage | string | `"COUNTER"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[5].idx_tup_fetch.description | string | `"Number of live rows fetched by index scans"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[6].n_tup_ins.usage | string | `"COUNTER"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[6].n_tup_ins.description | string | `"Number of rows inserted"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[7].n_tup_upd.usage | string | `"COUNTER"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[7].n_tup_upd.description | string | `"Number of rows updated"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[8].n_tup_del.usage | string | `"COUNTER"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[8].n_tup_del.description | string | `"Number of rows deleted"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[9].n_tup_hot_upd.usage | string | `"COUNTER"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[9].n_tup_hot_upd.description | string | `"Number of rows HOT updated (i.e., with no separate index update required)"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[10].n_live_tup.usage | string | `"GAUGE"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[10].n_live_tup.description | string | `"Estimated number of live rows"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[11].n_dead_tup.usage | string | `"GAUGE"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[11].n_dead_tup.description | string | `"Estimated number of dead rows"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[12].n_mod_since_analyze.usage | string | `"GAUGE"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[12].n_mod_since_analyze.description | string | `"Estimated number of rows changed since last analyze"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[13].last_vacuum.usage | string | `"GAUGE"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[13].last_vacuum.description | string | `"Last time at which this table was manually vacuumed (not counting VACUUM FULL)"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[14].last_autovacuum.usage | string | `"GAUGE"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[14].last_autovacuum.description | string | `"Last time at which this table was vacuumed by the autovacuum daemon"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[15].last_analyze.usage | string | `"GAUGE"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[15].last_analyze.description | string | `"Last time at which this table was manually analyzed"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[16].last_autoanalyze.usage | string | `"GAUGE"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[16].last_autoanalyze.description | string | `"Last time at which this table was analyzed by the autovacuum daemon"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[17].vacuum_count.usage | string | `"COUNTER"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[17].vacuum_count.description | string | `"Number of times this table has been manually vacuumed (not counting VACUUM FULL)"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[18].autovacuum_count.usage | string | `"COUNTER"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[18].autovacuum_count.description | string | `"Number of times this table has been vacuumed by the autovacuum daemon"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[19].analyze_count.usage | string | `"COUNTER"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[19].analyze_count.description | string | `"Number of times this table has been manually analyzed"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[20].autoanalyze_count.usage | string | `"COUNTER"` |  |
| exporter.postgres.query.pg_stat_user_tables.metrics[20].autoanalyze_count.description | string | `"Number of times this table has been analyzed by the autovacuum daemon"` |  |
| exporter.postgres.query.pg_database.query | string | `"SELECT pg_database.datname, pg_database_size(pg_database.datname) as size FROM pg_database"` |  |
| exporter.postgres.query.pg_database.metrics[0].datname.usage | string | `"LABEL"` |  |
| exporter.postgres.query.pg_database.metrics[0].datname.description | string | `"Name of the database"` |  |
| exporter.postgres.query.pg_database.metrics[1].size.usage | string | `"GAUGE"` |  |
| exporter.postgres.query.pg_database.metrics[1].size.description | string | `"Disk space used by the database"` |  |
| exporter.postgres.query.pg_stat_database.query | string | `"SELECT datname, numbackends, xact_commit, xact_rollback, blks_read, blks_hit, tup_fetched, tup_inserted, tup_updated, tup_deleted, temp_bytes, deadlocks FROM pg_catalog.pg_stat_database;"` |  |
| exporter.postgres.query.pg_stat_database.metrics[0].datname.usage | string | `"LABEL"` |  |
| exporter.postgres.query.pg_stat_database.metrics[0].datname.description | string | `"database NAME"` |  |
| exporter.postgres.query.pg_stat_database.metrics[1].numbackends.usage | string | `"COUNTER"` |  |
| exporter.postgres.query.pg_stat_database.metrics[1].numbackends.description | string | `"Number of backends currently connected to this database."` |  |
| exporter.postgres.query.pg_stat_database.metrics[2].xact_commit.usage | string | `"COUNTER"` |  |
| exporter.postgres.query.pg_stat_database.metrics[2].xact_commit.description | string | `"Number of transactions in this database that have been committed"` |  |
| exporter.postgres.query.pg_stat_database.metrics[3].xact_rollback.usage | string | `"COUNTER"` |  |
| exporter.postgres.query.pg_stat_database.metrics[3].xact_rollback.description | string | `"Number of transactions in this database that have been rolled back"` |  |
| exporter.postgres.query.pg_stat_database.metrics[4].blks_read.usage | string | `"GAUGE"` |  |
| exporter.postgres.query.pg_stat_database.metrics[4].blks_read.description | string | `"Number of disk blocks read in this database"` |  |
| exporter.postgres.query.pg_stat_database.metrics[5].blks_hit.usage | string | `"GAUGE"` |  |
| exporter.postgres.query.pg_stat_database.metrics[5].blks_hit.description | string | `"Number of times disk blocks were found already in the buffer cache, so that a read was not necessary"` |  |
| exporter.postgres.query.pg_stat_database.metrics[6].tup_fetched.usage | string | `"COUNTER"` |  |
| exporter.postgres.query.pg_stat_database.metrics[6].tup_fetched.description | string | `"Number of rows fetched by queries in this database"` |  |
| exporter.postgres.query.pg_stat_database.metrics[7].tup_inserted.usage | string | `"COUNTER"` |  |
| exporter.postgres.query.pg_stat_database.metrics[7].tup_inserted.description | string | `"Number of rows inserted by queries in this database"` |  |
| exporter.postgres.query.pg_stat_database.metrics[8].tup_updated.usage | string | `"COUNTER"` |  |
| exporter.postgres.query.pg_stat_database.metrics[8].tup_updated.description | string | `"Number of rows updated by queries in this database"` |  |
| exporter.postgres.query.pg_stat_database.metrics[9].tup_deleted.usage | string | `"COUNTER"` |  |
| exporter.postgres.query.pg_stat_database.metrics[9].tup_deleted.description | string | `"Number of rows deleted by queries in this database"` |  |
| exporter.postgres.query.pg_stat_database.metrics[10].temp_bytes.usage | string | `"GAUGE"` |  |
| exporter.postgres.query.pg_stat_database.metrics[10].temp_bytes.description | string | `"Total amount of data written to temporary files by queries in this database."` |  |
| exporter.postgres.query.pg_stat_database.metrics[11].deadlocks.usage | string | `"COUNTER"` |  |
| exporter.postgres.query.pg_stat_database.metrics[11].deadlocks.description | string | `"Number of deadlocks detected in this database"` |  |
| exporter.postgres.query.pg_stat_statements.query | string | `"SELECT userid, pgss.dbid, pgdb.datname, queryid, query, calls, total_time, mean_time, rows FROM pg_stat_statements pgss LEFT JOIN (select oid as dbid, datname from pg_database) as pgdb on pgdb.dbid = pgss.dbid WHERE not queryid isnull ORDER BY mean_time desc limit 20"` |  |
| exporter.postgres.query.pg_stat_statements.metrics[0].userid.usage | string | `"LABEL"` |  |
| exporter.postgres.query.pg_stat_statements.metrics[0].userid.description | string | `"User ID"` |  |
| exporter.postgres.query.pg_stat_statements.metrics[1].dbid.usage | string | `"LABEL"` |  |
| exporter.postgres.query.pg_stat_statements.metrics[1].dbid.description | string | `"database ID"` |  |
| exporter.postgres.query.pg_stat_statements.metrics[2].datname.usage | string | `"LABEL"` |  |
| exporter.postgres.query.pg_stat_statements.metrics[2].datname.description | string | `"database NAME"` |  |
| exporter.postgres.query.pg_stat_statements.metrics[3].queryid.usage | string | `"LABEL"` |  |
| exporter.postgres.query.pg_stat_statements.metrics[3].queryid.description | string | `"Query unique Hash Code"` |  |
| exporter.postgres.query.pg_stat_statements.metrics[4].query.usage | string | `"LABEL"` |  |
| exporter.postgres.query.pg_stat_statements.metrics[4].query.description | string | `"Query class"` |  |
| exporter.postgres.query.pg_stat_statements.metrics[5].calls.usage | string | `"COUNTER"` |  |
| exporter.postgres.query.pg_stat_statements.metrics[5].calls.description | string | `"Number of times executed"` |  |
| exporter.postgres.query.pg_stat_statements.metrics[6].total_time.usage | string | `"COUNTER"` |  |
| exporter.postgres.query.pg_stat_statements.metrics[6].total_time.description | string | `"Total time spent in the statement, in milliseconds"` |  |
| exporter.postgres.query.pg_stat_statements.metrics[7].mean_time.usage | string | `"GAUGE"` |  |
| exporter.postgres.query.pg_stat_statements.metrics[7].mean_time.description | string | `"Mean time spent in the statement, in milliseconds"` |  |
| exporter.postgres.query.pg_stat_statements.metrics[8].rows.usage | string | `"COUNTER"` |  |
| exporter.postgres.query.pg_stat_statements.metrics[8].rows.description | string | `"Total number of rows retrieved or affected by the statement"` |  |
| mysql.enabled | bool | `false` |  |
| postgresql.enabled | bool | `false` |  |
| tests | object | `{"serviceMonitor":{"enabled":false}}` | ------------------------------------------------------------------- |

