# libasm

## セクションの意味

| --- | --- | --- |
| .text | R-X | |
| .rodata | R-- | 定数、文字列リテラル | 
| .bss | RW- | 0初期化されるデータ, 初期値がない |
| .data | RW- | 初期値があるグローバル変数 |

読み取り専用データに関してはELF(.rodata)とPE(.rdata)でそれぞれ違う

## 命令

- `MOV a, b`
  a = b
  `MOV a, [b]`
  a = *b
  `MOV [a], b`
  *a = b

## データのサイズ

| --- | --- | --- |
| 1 byte ( 8bit) | byte  | int8_t , char, bool |
| 2 byte (16bit) | word  | int16_t, short |
| 4 byte (32bit) | dword | int32_t, int  |
| 8 byte (64bit) | qword | int64_t, size_t |

## レジスタと呼び出し規約

## 呼び出し規約

https://azelpg.gitlab.io/azsky2/note/prog/asm64/22_systemv.html

https://gitlab.com/x86-psABIs/x86-64-ABI

---

## 要件の関数

### ft_strlen

ナイーブな実装にしたglibcの実装ではsimdを使った最適化をしている

### ft_strcpy


