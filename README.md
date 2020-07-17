# simple_flow_mutations

## 概要

* 『次世代シークエンサーDRY解析教本　改訂第2版』
  * https://github.com/misshie/ngsdat2

上記ワークフローの一部を抜粋してシンプルにしたものです。

|ファイル名    | 内容                                                          |
|--------------|---------------------------------------------------------------|
| 0_config.sh  | 設定ファイル                                                  |
| 1_bwa_mem.sh | bwaを用いてマッピングを行う                                   |
| 2_bam.sh     | bamをソートしてインデックスをつける                           |
| 3_gatk_m.sh  | deduplication. PCRの増幅によるエラーを避けるために、同一箇所からスタートするリードは塩基ごとに品質スコアが最も高いものを残して無視するマークをつける。|
| 4_gatk_h.sh  | SNVとindelの検出を行う                                        |
| 5_gatk_g.sh  | GenotypeGVCFs                                                 |
| 6_select_variants.sh | SNVとindelのみを含むVCFファイルに分離する             |
| 7_filter_variants.sh | SNV と indel で異なる基準でバリアント品質を VCF ファイルの filter カラムに書き加える。ここには低品質なら満たさなかった基準名を、それ以外なら PASS が入る。|
| 8_merge_variants.sh  | SNV と indel を一つのファイルにまとめる               |
| 9_annovar.sh | アノテーション情報の付加を行う                                |

## ngsdat2 のワークフローから省略しているところ

* `picard MarkDuplicates` のかわりに `gatk MarkDuplicates` を使用している。
* 塩基ごとの品質スコアの再構成をしていない。
* 日本人のゲノムに合わせたカスタマイズをあまりしていない。

## License

MIT License
kojix2
