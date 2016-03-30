# CarrierWaveExample
CarrierWaveを利用したファイルのアップロードを行うサンプルです。

# プロジェクトの目的について
このプロジェクトでは PictureStore のScaffoldを作成し以下の機能が実現できることを確認します。

1. 新規登録時に画像ファイルをアップロードしてデータベースに保存する。
1. 詳細表示でアップロードした画像ファイルを表示する。

# 作成手順
以下の手順でサンプルを作成しました。

1. PictureStoreのscaffoldを作成する。
1. CarrierWaveのUploaderクラスを生成する。
1. Viewに設定を追加する。


## PictureStoreのscaffoldを作成する。
`store_name`と`picture`を列に持つモデルについてscaffoldを生成します。

```shell
$ rails g scaffold picture_store store_name:string picture:string
Running via Spring preloader in process 38468
      invoke  active_record
      create    db/migrate/20160330120340_create_picture_stores.rb
      create    app/models/picture_store.rb
      invoke  resource_route
       route    resources :picture_stores
      invoke  scaffold_controller
      create    app/controllers/picture_stores_controller.rb
      invoke    erb
      create      app/views/picture_stores
      create      app/views/picture_stores/index.html.erb
      create      app/views/picture_stores/edit.html.erb
      create      app/views/picture_stores/show.html.erb
      create      app/views/picture_stores/new.html.erb
      create      app/views/picture_stores/_form.html.erb
      invoke    helper
      create      app/helpers/picture_stores_helper.rb
      invoke    jbuilder
      create      app/views/picture_stores/index.json.jbuilder
      create      app/views/picture_stores/show.json.jbuilder
      invoke  assets
      invoke    coffee
      create      app/assets/javascripts/picture_stores.coffee
      invoke    scss
      create      app/assets/stylesheets/picture_stores.scss
      invoke  scss
   identical    app/assets/stylesheets/scaffolds.scss

```

## CarrierWaveのUploaderクラスを生成しモデルに設定する
CarrierWaveのUploaderクラスを生成します。この時、生成するUploaderクラスは対象となるモデルの列名と一致するようにします。

```shell
$ rails g uploader picture
Running via Spring preloader in process 38544
      create  app/uploaders/picture_uploader.rb
```

次に、生成したuploaderをモデルで利用できるように設定します。

```rb
class PictureStore < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
end
```

## Viewに設定を追加する。
Viewの`_form.html.erb`を以下の通り変更し、画像ファイルをアップロードできるようにします。

```rb
<%= form_for(@picture_store) do |f| %>
  <% if @picture_store.errors.any? %>
    <div id="error_explanation">
      <h2><%= pluralize(@picture_store.errors.count, "error") %> prohibited this picture_store from being saved:</h2>

      <ul>
      <% @picture_store.errors.full_messages.each do |message| %>
        <li><%= message %></li>
      <% end %>
      </ul>
    </div>
  <% end %>

  <div class="field">
    <%= f.label :store_name %><br>
    <%= f.text_field :store_name %>
  </div>
  <div class="field">
    <%= f.label :picture %><br>
    <%= f.file_field :picture %>
    <%= f.hidden_field :picture_cache %>
  </div>
  <div class="actions">
    <%= f.submit %>
  </div>
<% end %>
```

次に、登録された画像を表示するため以下のとおり`show.html.erb`を修正します。
```rb
<p>
  <strong>Picture:</strong>
  <%= image_tag @picture_store.picture.url %>
</p>
```

