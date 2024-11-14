#!/bin/bash

# 現在のディレクトリ名を取得
current_dir=$(basename "$PWD")

# TODO: 目的のディレクトリパスを受け付ける必要がありそう
# ex, zsh env file, or command args
# init "/path/to/your/folder/"

# 目的のディレクトリパスを設定
target_dir="/path/to/your/folder/${current_dir}"

# 目的のディレクトリが存在しない場合は作成
if [ ! -d "$target_dir" ]; then
  mkdir -p "$target_dir"
  echo "Created directory: $target_dir"
else
  echo "Directory already exists: $target_dir"
fi

# シンボリックリンクを作成
ln -sfn "$target_dir" .memo.local
echo "Created symlink: .memo.local -> $target_dir"
