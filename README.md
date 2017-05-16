## hubot-start

- hubot永続型の起動スクリプトです。
  - hubot/bin/に配置してください。
  - hubot/bin/hubotの代わりに用います。
  - foreverで永続化させています。
  - chatworkアダプターを指定しています

## reply-to-run-script.coffee

- chatOps用です。
- chatworkでのキーワードに対し、スクリプトの実行をします。

## reply-image-to-chatwork.coffee

- 癒し用です。
- chatworkでの特定文言に対し、設定した画像スタンプを送ります。

## notify-by-cron.coffee

- 煽り用です。
- 時限で特定文言をランダム送信します。
