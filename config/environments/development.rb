require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded any time
  # it changes. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :local

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise exceptions for disallowed deprecations.
  config.active_support.disallowed_deprecation = :raise

  # Tell Active Support which deprecation messages to disallow.
  config.active_support.disallowed_deprecation_warnings = []

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations.
  # config.i18n.raise_on_missing_translations = true

  # Annotate rendered view with file names.
  # config.action_view.annotate_rendered_view_with_filenames = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
  # config.hosts << "a8c9cb2b77b24968bf1f0967084f4a3f.vfs.cloud9.us-east-1.amazonaws.com"
  config.hosts.clear
  # Uncomment if you wish to allow Action Cable access from any origin.
  # config.action_cable.disable_request_forgery_protection = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_caching = false
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  #deviseが認証用のURLなどを生成するのに必要になる（らしい）
  # config.action_mailer.smtp_settings = { address: 'localhost', port: 1025 }
  config.action_mailer.delivery_method = :smtp
  #送信方法を指定（この他に:sendmail/:file/:testなどがあります)
  config.action_mailer.smtp_settings = {
    port:                 587,
    address:              'smtp.gmail.com',
    domain:               'gmail.com',
    user_name:            ENV['MAIL_ADDRESS'],#Gmailのアドレス これは管理人のメアドじゃないと
    password:             ENV['MAIL_PASSWORD'],#後述！大苦戦しました！
    authentication:       'plain',
    enable_starttls_auto: true
  }

 #gmail利用時はaddress,domain,portは下記で固定

#   port => SMTPサーバーのポート番号
# address => SMTPサーバーのホスト名
# domain => HELOドメイン
# user_name => メール送信に使用するgmailのアカウント
# password => メール送信に使用するgmailのパスワード
# authentication => 認証方法
# enable_starttls_auto => メールの送信にTLS認証を使用するか



# dotenv-railsとは、環境変数を管理する事が出来る便利なgemのこと
# 環境変数とは、全てのプログラムに共有して使うことが出来るOSが提供する変数のこと
# 環境変数は、.envファイルに定義してENV['環境変数名']で参照する事が出来る
# .envファイルは、 Git管理下から除外する為に必ず.gitignoreファイルに指定しよう
end
