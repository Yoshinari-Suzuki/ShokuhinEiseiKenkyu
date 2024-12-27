# 食品衛生研究の補足情報 <br> 
&nbsp;<br>
## ≪はじめに≫<br>
本リポジトリは、食品衛生研究 Vol.228, No.1, 2025における私の解説記事「[化学物質の食事性ばく露評価における確率論的アプローチ](http://suishinka.shop15.makeshop.jp/shopbrand/category02/)」内で紹介したシミュレーション等を実行するためのコード等を補足するためのものです。<br>
ここで示したプロジェクトは、食事由来のばく露量推定を行うことを前提としたもので、確率論的ばく露量推定と不検出値を含むデータに対する確率密度分布の推定方法、ならびにそれらの結果を用いて二次元モンテカルロシミュレーションを行う一連の流れを記述したものです。<br>
ばく露評価を行っている方ならびに、濃度関連の調査・研究を行っている方で、"不検出"の扱いをどのようにすればよいのか疑問を抱えている方への一助となれば幸いです。
<br>
## ≪著作権および免責事項≫<br>
本フォルダ内のコードは自由に使用して下さい。<br>
論文等に使用される際には、以下の論文を引用して頂けますと幸いです。<br>
<br>
**不検出例を含むデータに対するベイズ推定法の有用性について**<br>
* [Suzuki, Y., Tanaka, N. and Akiyama, H., Attempt of Bayesian Estimation from Left-censoredData Using the Markov Chain Monte Carlo Method: Exploring Cr(VI) Concentrations in Mineral  Water Products. Food Safety, 8(4), 67-89, DOI: 10.14252/foodsafetyfscj.D-20-00007, (2020)](https://www.jstage.jst.go.jp/article/foodsafetyfscj/8/4/8_D-20-00007/_article).<br>

**ベイズ推定を用いた二次元モンテカルロシミュレーションについて**<br>
* [鈴木美成, 近藤翠, 北山育子, 穐山浩, 堤智昭, 二次元モンテカルロシミュレーションを用いた食事性鉛曝露量分布の推定:トータルダイエット試料への適用の試み, 食品衛生学雑誌, 64(1), 1-12 (2023)](https://www.jstage.jst.go.jp/article/shokueishi/64/1/64_1/_article/-char/ja).<br>
* [鈴木美成, 食品を介した有害元素の摂取量推定, FFIジャーナル, 228(1), 025-034 (2023)](https://www.jstage.jst.go.jp/article/ffij/228/1/228_025/_article/-char/ja/).
<br>
なお、本Repositry内のコードを実行したことによって生じたすべての障害・損害・不具合等に関しては、私と私の関係者および私の所属するいかなる団体・組織とも、一切の責任を負いません。
各自の責任においてご使用下さい。<br>

## ≪製作環境≫<br>
このRプロジェクトを作成した環境は以下の通りです。
* OS: Windows11
* R: 4.4.2
* Rtools: 4.4
* Rstudio: RStudio 2024.12.0+467 "Kousa Dogwood"
* Cmdstan: ver. 2.36.0
* cmdstanr: ver. 0.8.1.9000

## ≪リポジトリの構成≫<br>
| フォルダ/ファイル名 | 説明 |
| :-- | :-- | 
| . |    |  |
| ├── 3.3 1D-MCS | 1D-MCSの実装例 |
| │ <code>&nbsp;</code> ├──  3.3 1D-MCS.Rmd   | Rマークダウンファイル。Rのコードが記載 |
| │ <code>&nbsp;</code> └── 3.3 1D-MCS.Rproj | RStudioのプロジェクトファイル |
| ├── 4.1 MLE for censored data | 打ち切りデータの最尤推定実装例 |
| │ <code>&nbsp;</code> ├── 4.1 MLE for censored data.Rmd | Rマークダウンファイル。Rのコードが記載 |
| │ <code>&nbsp;</code> ├── 4.1 MLE for censored data.Rproj | RStudioのプロジェクトファイル |
| │ <code>&nbsp;</code> └── Excel_simulation.xlsx | 解析に使用するデータ |
| ├── 4.2 BE for censored data | 打ち切りデータのベイズ推定実装例 |
| │ <code>&nbsp;</code> ├── 4.2 BE for censored data.Rmd | Rマークダウンファイル。Rのコードが記載 |
| │ <code>&nbsp;</code> ├── 4.2 BE for censored data.Rproj | RStudioのプロジェクトファイル |
| │ <code>&nbsp;</code> ├── Excel_simulation.xlsx | 解析に使用するデータ |
| │ <code>&nbsp;</code> └── Lognormal_Censored.stan | Stanコードが書いてある。|
| ├── 4.4 2D-MCS | 打ち切りデータをベイズ推定して2D-MCSまで行う実装例 |
| │ <code>&nbsp;</code> ├── 4.4 2D-MCS.Rmd | Rマークダウンファイル。Rのコードが記載 |
| │ <code>&nbsp;</code> ├── 4.4 2D-MCS.Rproj | RStudioのプロジェクトファイル |
| │ <code>&nbsp;</code> ├── Gamma_Censored.stan | Stanコードが書いてある。|
| │ <code>&nbsp;</code> ├── Lognormal_Censored.stan | Stanコードが書いてある|
| │ <code>&nbsp;</code> └── Simulation data.xlsx | 解析に使用するデータ|
| ├── 5 QRA | 論文化した後アップロード予定 |
| ├── Excel_simulation.xlsx <br> │ | Excelを用いたモンテカルロシミュレーションと最尤推定の実装例 <br> 3.2および4.1の内容 |
| └── README.md| 今読んでいるファイル | 


## ≪インストール方法≫
緑色のCodeボタンをクリック⇒"Download ZIP"を選択し本プロジェクトのファイルが保存されているzipファイルをダウンロードして下さい。zipファイルを解凍して任意の場所に保存して下さい。<br>
日本語が使用されているディレクトリへの保存は避けた方が無難です。<br>

## ≪実行環境の整備について≫
ソフトウェアとしてはRとRStudioを想定しています。<br>
Rのインストール後、自身の環境にあったRStudioをインストールして下さい。<br>
RとRStudioのダウンロード先は以下のとおりです。<br>
<br>
R: <https://www.r-project.org/><br>
RStudio: <https://www.rstudio.com/products/rstudio/download/><br>
<br>
このRプロジェクトでは、{cmdstanr}パッケージを使用しています。<br>
Cmdstanおよび{cmdstanr}パッケージのインストールおよび実行方法は下記のサイトを参考にして下さい。<br>
<https://mc-stan.org/cmdstanr/><br>
Cmdstan ver. 2.35.0以降と、それに対応していない古いバージョンのrstanを使用している場合には、本リポジトリ内のコードが上手く動かない可能性があります。<br>

## ≪使用方法≫
RStudioを起動して、フォルダ内のRprojファイルを開いて下さい。<br>
右下ペインのFileタブより、Rmdファイルをクリックして開いて下さい。<br>
左上ペインにRmdがロードされるので、Rmdファイルのタブを選択し、チャンク (コードが書いてある灰色の領域) の右上にある緑三角をクリックすると、チャンク内のコードが順番に実行されます。<br>
上から順番にチャンク内のコードを実行してください。<br>
"#"記号以降の文字は実行されない、メモ欄です。<br>
<br>
右下ペインのFileタブより、Stanファイルを開くと、記載されたStanコードが確認できます。<br>
"//"以降の文字は実行されないメモ欄です。<br>

## ≪アンインストール方法≫
フォルダごと削除ください。<br>
RおよびRStudioのアンインストールは、公式のHPを参照してください<br>
<br>
## ≪履歴≫
* 2024/11/25: 作製
* 2023/3/23: Publicに変更

## ≪作者≫
鈴木美成<br>
<br>
