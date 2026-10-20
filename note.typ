#set text(
  font: ("Droid Sans Fallback"),
  lang: "ja"
)

// レベル1の見出し（= 見出し）の前に自動で改ページを挟む設定
#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  it
}

// === 技術ブログ風 コードブロック・スタイリング ===
#show raw.where(block: true): it => {
  // 言語名が指定されている場合は大文字（例: RUST, C, TYPST）、未指定なら "CODE"
  let lang-tag = if it.lang != none { upper(it.lang) } else { "CODE" }

  block(
    width: 100%,
    radius: 6pt,             // 角丸
    clip: true,               // ヘッダーが角丸からはみ出ないように切り抜き
    stroke: 0.5pt + rgb("#334155"), // カード外枠の境界線
    fill: rgb("#0f172a"),     // ダーク背景色（Slate-900）
  )[
    // 1. ヘッダーバー（言語タグ表示）
    #block(
      width: 100%,
      fill: rgb("#1e293b"),   // 少し明るいヘッダー背景色（Slate-800）
      inset: (x: 12pt, y: 6pt),
      stroke: (bottom: 0.5pt + rgb("#334155")), // ヘッダー下の区切り線
    )[
      #text(fill: rgb("#94a3b8"), size: 8.5pt, weight: "bold", font: "DejaVu Sans")[#lang-tag]
    ]

    // 2. コード本文エリア
    #block(
      inset: (x: 12pt, top: 10pt, bottom: 10pt),
      width: 100%,
    )[
      #set text(fill: rgb("#f8fafc")) // 文字色を白系に設定
      #it
    ]
  ]
}

#let include-code(filepath, lang: "text", start: 1, end: none) = {
  let lines = read(filepath).split("\n")
  let slice-end = if end == none { lines.len() } else { end }
  let target-lines = lines.slice(start - 1, slice-end).join("\n")
  raw(target-lines, lang: lang, block: true)
}

= 基本知識

== セクションの意味

#table(
  columns: 3,
  [`.text`], [R-X], [],
  [`.rodata`], [R--], [定数、文字列リテラル],
  [`.bss`], [RW-], [0初期化されるデータ, 初期値がない],
  [`.data`], [RW-], [初期値があるグローバル変数],
)

== 命令

C言語的な代入操作との対応

#table(
  columns: (auto, 1fr),
  align: (left, left),
  stroke: none, // 枠線なしでシンプルに
  fill: (_, row) => if calc.even(row) { rgb("#f8fafc") } else { white },
  
  [ `MOV a, b` ],   [ $a = b$ ],
  [ `MOV a, [b]` ], [ $a = *b$ ],
  [ `MOV [a], b` ],[ $*a = b$ ],
)

== PIE(Position Independent Executable、位置独立実行形式)

https://azelpg.gitlab.io/azsky2/note/prog/asm64/06_data2.html

= 課題の要求

アセンブリの書き方には大きく２つある

- Intel記法

- AT&T記法

= Required Functions

== ft_strlen

// #raw(read("ft_strlen.s"), lang: "asm")

#include-code("ft_strlen.s", lang: "asm", start: 6, end: 15)

```c
size_t ft_strlen(const char *s);

// size_of(char *) = 64bit (8 byte) -> qword
size_t ft_strlen(const char *s) {
  while (*s != '0') {
    eax++;
    s++;
  }
  return eax;
}
```

ナイーブな実装にしています。

