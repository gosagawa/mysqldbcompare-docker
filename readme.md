
# この記事について
mysqldbcompareを利用するためのdocker設定です

以下で詳細な解説をしています。

環境に依存せずに、二つのDBのデータとスキーマの差分を取る方法
https://qiita.com/go_sagawa/items/4957a9c8f5bf83f74ba4

# 使用準備

- ローカルでmysqldumpを使えるようにしてください。
- conf/dbConnection.conf.orgを参考にdbConection_dev.conf,conf/dbConnection_stg.confにDBの接続情報を記載してください
- conf/dbName.conf.orgを参考に、conf/dbName.confにDB名を記載してください
- conf/masterList.conf.orgを参考に、conf/masterList.confに確認したいテーブル一覧を記載してください
- docker-compose buildを実行する

# 使用方法

-make compare_[dev|stg]_[dev|stg]
-make compare_dev_stgだと表示されるのはdevからqaにデータをあげようとした時のSQLです。

```
# docker-compose up -d
# make dump_all
# make ready
# make compare_dev_stg
```

やっている事は以下の通りです。
- 1.ダンプする
- 2.ダンプしたものをDBに入れる
- 3.mysqlcompareを走らす
