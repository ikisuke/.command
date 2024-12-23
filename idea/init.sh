#!/bin/bash

# memo_vault が未設定の場合は赤色でエラーメッセージを出力して終了
if [ -z "$memo_vault" ]; then
      echo -e "\e[31mError: memo_vault is not set.\e[0m"
      exit 1
fi

# 現在のディレクトリ名を取得
current_dir=$(basename "$PWD")

# 目的のディレクトリパスを設定（memo_vault 内に current_dir と同名のディレクトリを作成）
target_dir="$memo_vault/$current_dir"
echo "The value of memo_vault is: $memo_vault"

# 目的のディレクトリが存在しない場合は作成
if [ ! -d "$target_dir" ]; then
      mkdir -p "$target_dir"
      echo "Created directory: $target_dir"
else
      echo "Directory already exists: $target_dir"
fi

# シンボリックリンクを作成（.memo.local -> target_dir）
ln -sfn "$target_dir" .memo.local
echo "Created symlink: .memo.local -> $target_dir"
