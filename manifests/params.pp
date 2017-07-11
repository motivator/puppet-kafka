# Author::    Liam Bennett  (mailto:lbennett@opentable.com)
# Copyright:: Copyright (c) 2013 OpenTable Inc
# License::   MIT

# == Class kafka::params
#
# This class is meant to be called from kafka::broker
# It sets variables according to platform
#
class kafka::params {
  $version        = '0.9.0.1'
  $scala_version  = '2.11'
  $install_dir    = "/opt/kafka-${scala_version}-${version}"
  $mirror_url     = 'http://mirrors.ukfast.co.uk/sites/ftp.apache.org'
  $install_java   = true
  $package_dir    = '/var/tmp/kafka'
  $package_name   = undef
  $package_ensure = 'present'
  $group_id       = undef
  $user_id        = undef

  $service_requires_zookeeper = true

  $broker_service_install = true
  $broker_service_ensure = 'running'

  $broker_jmx_opts = '-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false \
  -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.port=9990'
  $broker_heap_opts = '-Xmx1G -Xms1G'
  $broker_log4j_opts = '-Dlog4j.configuration=file:/opt/kafka/config/log4j.properties'
  $broker_opts = ''

  $mirror_jmx_opts   = '-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false \
  -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.port=9991'
  $mirror_log4j_opts = $broker_log4j_opts

  $producer_jmx_opts   = '-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false \
  -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.port=9992'
  $producer_log4j_opts = $broker_log4j_opts

  $consumer_jmx_opts   = '-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false \
  -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.port=9993'
  $consumer_log4j_opts = $broker_log4j_opts

  $service_restart = true

  #http://kafka.apache.org/documentation.html#brokerconfigs
  $broker_config_defaults = {
    'zookeeper_connect'                             => '',
    'advertised_host_name'                          => '',
    'advertised_listeners'                          => '',
    'advertised_port'                               => '',
    'auto_create_topics_enable'                     => true,
    'auto_leader_rebalance_enable'                  => true,
    'background_threads'                            => '10',
    'broker_id'                                     => '-1',
    'compression_type'                              => 'producer',
    'delete_topic_enable'                           => false,
    'host_name'                                     => '',
    'leader_imbalance_check_interval_seconds'       => '300',
    'leader_imbalance_per_broker_percentage'        => '10',
    'listeners'                                     => '',
    'log_dir'                                       => '/tmp/kafka-logs',
    'log_dirs'                                      => '',
    'log_flush_interval_messages'                   => '9223372036854775807',
    'log_flush_interval_ms'                         => '',
    'log_flush_offset_checkpoint_interval_ms'       => '60000',
    'log_flush_scheduler_interval_ms'               => '9223372036854775807',
    'log_retention_bytes'                           => '-1',
    'log_retention_hours'                           => '168',
    'log_retention_minutes'                         => '',
    'log_retention_ms'                              => '',
    'log_roll_hours'                                => '168',
    'log_roll_jitter_hours'                         => '0',
    'log_roll_jitter_ms'                            => '',
    'log_roll_ms'                                   => '',
    'log_segment_bytes'                             => '1073741824',
    'log_segment_delete_delay_ms'                   => '60000',
    'message_max_bytes'                             => '1000012',
    'min_insync_replicas'                           => '1',
    'num_io_threads'                                => '8',
    'num_network_threads'                           => '3',
    'num_recovery_threads_per_data_dir'             => '1',
    'num_replica_fetchers'                          => '1',
    'offset_metadata_max_bytes'                     => '4096',
    'offsets_commit_required_acks'                  => '-1',
    'offsets_commit_timeout_ms'                     => '5000',
    'offsets_load_buffer_size'                      => '5242880',
    'offsets_retention_check_interval_ms'           => '600000',
    'offsets_retention_minutes'                     => '1440',
    'offsets_topic_compression_codec'               => '0',
    'offsets_topic_num_partitions'                  => '50',
    'offsets_topic_replication_factor'              => '3',
    'offsets_topic_segment_bytes'                   => '104857600',
    'port'                                          => '9092',
    'queued_max_requests'                           => '500',
    'quota_consumer_default'                        => '9223372036854775807',
    'quota_producer_default'                        => '9223372036854775807',
    'replica_fetch_max_bytes'                       => '1048576',
    'replica_fetch_min_bytes'                       => '1',
    'replica_fetch_wait_max_ms'                     => '500',
    'replica_high_watermark_checkpoint_interval_ms' => '5000',
    'replica_lag_time_max_ms'                       => '10000',
    'replica_socket_receive_buffer_bytes'           => '65536',
    'replica_socket_timeout_ms'                     => '30000',
    'request_timeout_ms'                            => '30000',
    'socket_receive_buffer_bytes'                   => '102400',
    'socket_request_max_bytes'                      => '104857600',
    'socket_send_buffer_bytes'                      => '102400',
    'unclean_leader_election_enable'                => true,
    'zookeeper_connection_timeout_ms'               => '',
    'zookeeper_session_timeout_ms'                  => '6000',
    'zookeeper_set_acl'                             => false,
    'broker_id_generation_enable'                   => true,
    'connections_max_idle_ms'                       => '600000',
    'controlled_shutdown_enable'                    => true,
    'controlled_shutdown_max_retries'               => '3',
    'controlled_shutdown_retry_backoff_ms'          => '5000',
    'controller_socket_timeout_ms'                  => '30000',
    'default_replication_factor'                    => '1',
    'fetch_purgatory_purge_interval_requests'       => '1000',
    'group_max_session_timeout_ms'                  => '30000',
    'group_min_session_timeout_ms'                  => '6000',
    'inter_broker_protocol_version'                 => '0.8.2.2',
    'log_cleaner_backoff_ms'                        => '15000',
    'log_cleaner_dedupe_buffer_size'                => '134217728',
    'log_cleaner_delete_retention_ms'               => '86400000',
    'log_cleaner_enable'                            => true,
    'log_cleaner_io_buffer_load_factor'             => '0_9',
    'log_cleaner_io_buffer_size'                    => '524288',
    'log_cleaner_io_max_bytes_per_second'           => '1_7976931348623157E308',
    'log_cleaner_min_cleanable_ratio'               => '0.5',
    'log_cleaner_threads'                           => '1',
    'log_cleanup_policy'                            => 'delete',
    'log_index_interval_bytes'                      => '4096',
    'log_index_size_max_bytes'                      => '10485760',
    'log_preallocate'                               => false,
    'log_retention_check_interval_ms'               => '300000',
    'max_connections_per_ip'                        => '2147483647',
    'max_connections_per_ip_overrides'              => '',
    'num_partitions'                                => '1',
    'principal_builder_class'                       => 'org.apache.kafka.common.security.auth.DefaultPrincipalBuilder',
    'producer_purgatory_purge_interval_requests'    => '1000',
    'replica_fetch_backoff_ms'                      => '1000',
    'reserved_broker_max_id'                        => '1000',
    'sasl_kerberos_kinit_cmd'                       => '/usr/bin/kinit',
    'sasl_kerberos_min_time_before_relogin'         => '60000',
    'sasl_kerberos_principal_to_local_rules'        => ['DEFAULT'],
    'sasl_kerberos_service_name'                    => '',
    'sasl_kerberos_ticket_renew_jitter'             => '0.05',
    'sasl_kerberos_ticket_renew_window_factor'      => '0.8',
    'security_inter_broker_protocol'                => 'PLAINTEXT',
    'ssl_cipher_suites'                             => '',
    'ssl_client_auth'                               => 'none',
    'ssl_enabled_protocols'                         => ['TLSv1.2', 'TLSv1.1', 'TLSv1'],
    'ssl_key_password'                              => '',
    'ssl_keymanager_algorithm'                      => 'SunX509',
    'ssl_keystore_location'                         => '',
    'ssl_keystore_password'                         => '',
    'ssl_keystore_type'                             => 'JKS',
    'ssl_protocol'                                  => 'TLS',
    'ssl_provider'                                  => '',
    'ssl_trustmanager_algorithm'                    => 'PKIX',
    'ssl_truststore_location'                       => '',
    'ssl_truststore_password'                       => '',
    'ssl_truststore_type'                           => 'JKS',
    'authorizer_class_name'                         => '',
    'metric_reporters'                              => '',
    'metrics_num_samples'                           => '2',
    'metrics_sample_window_ms'                      => '30000',
    'quota_window_num'                              => '11',
    'quota_window_size_seconds'                     => '1',
    'ssl_endpoint_identification_algorithm'         => '',
    'zookeeper_sync_time_ms'                        => '2000',
  }

  #http://kafka.apache.org/documentation.html#consumerconfigs
  $consumer_config_defaults = {
    'group_id'                          => '',
    'zookeeper_connect'                 => '',
    'consumer_id'                       => '',
    'socket_timeout_ms'                 => '30000',
    'socket_receive_buffer_bytes'       => '65536',
    'fetch_message_max_bytes'           => '1048576',
    'num_consumer_fetchers'             => '1',
    'auto_commit_enable'                => true,
    'auto_commit_interval_ms'           => '60000',
    'queued_max_message_chunks'         => '2',
    'rebalance_max_retries'             => '4',
    'fetch_min_bytes'                   => '1',
    'fetch_wait_max_ms'                 => '100',
    'rebalance_backoff_ms'              => '2000',
    'refresh_leader_backoff_ms'         => '200',
    'auto_offset_reset'                 => 'largest',
    'consumer_timeout_ms'               => '-1',
    'exclude_internal_topics'           => true,
    'client_id'                         => '',
    'zookeeper_session_timeout_ms'      => '6000',
    'zookeeper_connection_timeout_ms'   => '6000',
    'zookeeper_sync_time_ms'            => '2000',
    'offsets_storage'                   => 'zookeeper',
    'offsets_channel_backoff_ms'        => '1000',
    'offsets_channel_socket_timeout_ms' => '10000',
    'offsets_commit_max_retries'        => '5',
    'dual_commit_enabled'               => true,
    'partition_assignment_strategy'     => 'range',
  }

  # Disabled because the new consumer is still beta
#  $consumer_config_defaults = {
#    'bootstrap_servers'                        => '',
#    'key_deserializer'                         => '',
#    'value_deserializer'                       => '',
#    'fetch_min_bytes'                          => '1',
#    'group_id'                                 => '',
#    'heartbeat_interval_ms'                    => '3000',
#    'max_partition_fetch_bytes'                => '1048576',
#    'session_timeout_ms'                       => '30000',
#    'ssl_key_password'                         => '',
#    'ssl_keystore_location'                    => '',
#    'ssl_keystore_password'                    => '',
#    'ssl_truststore_location'                  => '',
#    'ssl_truststore_password'                  => '',
#    'auto_offset_reset'                        => 'largest',
#    'connections_max_idle_ms'                  => '540000',
#    'enable_auto_commit'                       => true,
#    'partition_assignment_strategy'            => '[org.apache.kafka.clients.consumer.RangeAssignor]',
#    'receive_buffer_bytes'                     => '32768',
#    'request_timeout_ms'                       => '40000',
#    'sasl_kerberos_service_name'               => '',
#    'security_protocol'                        => 'PLAINTEXT',
#    'send_buffer_bytes'                        => '131072',
#    'ssl_enabled_protocols'                    => '[TLSv1.2, TLSv1.1, TLSv1]',
#    'ssl_keystore_type'                        => 'JKS',
#    'ssl_protocol'                             => 'TLS',
#    'ssl_provider'                             => '',
#    'ssl_truststore_type'                      => 'JKS',
#    'auto_commit_interval_ms'                  => '5000',
#    'check_crcs'                               => true,
#    'client_id'                                => '',
#    'fetch_max_wait_ms'                        => '500',
#    'metadata_max_age_ms'                      => '300000',
#    'metric_reporters'                         => '',
#    'metrics_num_samples'                      => '2',
#    'metrics_sample_window_ms'                 => '30000',
#    'reconnect_backoff_ms'                     => '50',
#    'retry_backoff_ms'                         => '100',
#    'sasl_kerberos_kinit_cmd'                  => '/usr/bin/kinit',
#    'sasl_kerberos_min_time_before_relogin'    => '60000',
#    'sasl_kerberos_ticket_renew_jitter'        => '0.05',
#    'sasl_kerberos_ticket_renew_window_factor' => '0.8',
#    'ssl_cipher_suites'                        => '',
#    'ssl_endpoint_identification_algorithm'    => '',
#    'ssl_keymanager_algorithm'                 => 'SunX509',
#    'ssl_trustmanager_algorithm'               => 'PKIX',
#  }

  #http://kafka_apache_org/documentation_html#producerconfigs
  $producer_config_defaults = {
    'bootstrap_servers'                        => '',
    'key_serializer'                           => '',
    'value_serializer'                         => '',
    'acks'                                     => '1',
    'buffer_memory'                            => '33554432',
    'compression_type'                         => 'none',
    'retries'                                  => '0',
    'ssl_key_password'                         => '',
    'ssl_keystore_location'                    => '',
    'ssl_keystore_password'                    => '',
    'ssl_truststore_location'                  => '',
    'ssl_truststore_password'                  => '',
    'batch_size'                               => '16384',
    'client_id'                                => '',
    'connections_max_idle_ms'                  => '540000',
    'linger_ms'                                => '0',
    'max_block_ms'                             => '60000',
    'max_request_size'                         => '1048576',
    'partitioner_class'                        => 'org.apache.kafka.clients.producer.internals.DefaultPartitioner',
    'receive_buffer_bytes'                     => '32768',
    'request_timeout_ms'                       => '30000',
    'sasl_kerberos_service_name'               => '',
    'security_protocol'                        => 'PLAINTEXT',
    'send_buffer_bytes'                        => '131072',
    'ssl_enabled_protocols'                    => ['TLSv1.2', 'TLSv1.1', 'TLSv1'],
    'ssl_keystore_type'                        => 'JKS',
    'ssl_protocol'                             => 'TLS',
    'ssl_provider'                             => '',
    'ssl_truststore_type'                      => 'JKS',
    'timeout_ms'                               => '30000',
    'block_on_buffer_full'                     => false,
    'max_in_flight_requests_per_connection'    => '5',
    'metadata_fetch_timeout_ms'                => '60000',
    'metadata_max_age_ms'                      => '300000',
    'metric_reporters'                         => '',
    'metrics_num_samples'                      => '2',
    'metrics_sample_window_ms'                 => '30000',
    'reconnect_backoff_ms'                     => '50',
    'retry_backoff_ms'                         => '100',
    'sasl_kerberos_kinit_cmd'                  => '/usr/bin/kinit',
    'sasl_kerberos_min_time_before_relogin'    => '60000',
    'sasl_kerberos_ticket_renew_jitter'        => '0.05',
    'sasl_kerberos_ticket_renew_window_factor' => '0.8',
    'ssl_cipher_suites'                        => '',
    'ssl_endpoint_identification_algorithm'    => '',
    'ssl_keymanager_algorithm'                 => 'SunX509',
    'ssl_trustmanager_algorithm'               => 'PKIX',
  }

  #https://cwiki.apache.org/confluence/pages/viewpage.action?pageId=27846330
  #https://kafka.apache.org/documentation.html#basic_ops_mirror_maker
  $consumer_config = '/opt/kafka/config/consumer-1.properties'
  $producer_config = '/opt/kafka/config/producer.properties'
  $num_streams = 2
  $num_producers = 1
  $abort_on_send_failure = true
  $mirror_max_heap = '256M'
  $whitelist = '.*'
  $blacklist = ''

  $consumer_service_defaults = {
    'blacklist'               => '',
    'csv-reporter-enabled'    => '',
    'delete-consumer-offsets' => '',
    'formatter'               => 'kafka.tools.DefaultMessageFormatter',
    'from-beginning'          => '',
    'max-messages'            => '',
    'metrics-dir'             => '',
    'property'                => '',
    'skip-message-on-error'   => '',
    'topic'                   => '',
    'whitelist'               => '',
    'zookeeper'               => '',
  }

  $producer_service_defaults = {
    'batch-size'                 => '200',
    'broker-list'                => '',
    'compression-codec'          => '',
    'key-serializer'             => 'kafka.serializer.DefaultEncoder',
    'max-memory-bytes'           => '',
    'max-partition-memory-bytes' => '',
    'message-send-max-retries'   => '3',
    'metadata-expiry-ms'         => '',
    'metadata-fetch-timeout-ms'  => '',
    'new-producer'               => '',
    'property'                   => '',
    'queue-enqueuetimeout-ms'    => '2147483647',
    'queue-size'                 => '10000',
    'request-required-acks'      => '0',
    'request-timeout-ms'         => '1500',
    'retry-backoff-ms'           => '100',
    'socket-buffer-size'         => '102400',
    'sync'                       => '',
    'timeout'                    => '1000',
    'topic'                      => '',
    'value-serializer'           => 'kafka.serializer.DefaultEncoder',
  }

  $mirror_url_regex = '^(https?:\/\/)([\da-z\.-]+)\.([a-z\.]{2,6})(:[\d]{2,5})?(\/[\w \.-]*)*\/?$'
}
