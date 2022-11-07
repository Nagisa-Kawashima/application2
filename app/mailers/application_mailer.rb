class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end




# プロパティ	役割
# to	送信先の指定
# cc	一斉送信先の指定
# bcc	非表示送信先の指定
# from	メールの送信元名
# subject	メールタイトル
# date	メールの送信日時
# reply_to	返信用アドレスの指定