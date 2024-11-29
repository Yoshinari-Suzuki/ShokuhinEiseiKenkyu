# ShokuhinEiseiKenkyu
食品衛生研究の補足情報 
<br>
## ≪はじめに≫
本リポジトリは、食品衛生研究 Vol.228, No.1, 2023における私が解説した「[食品を介した有害元素の摂取量推定](https://www.jstage.jst.go.jp/article/ffij/228/1/228_025/_article/-char/ja/)」内のシミュレーション等を実行するためのコード等を補足するためのものです。<br>
ここで示したプロジェクトは、食事由来のばく露量推定を行うことを前提としたもので、確率論的ばく露量推定と不検出値を含むデータに対する確率密度分布の推定方法、ならびにそれらの結果を用いて二次元モンテカルロシミュレーションを行う一連の流れ、定量的なリスク評価を行う方法を記述したものです。<br>
ばく露評価を行っている方ならびに、濃度関連の調査・研究を行っている方で、"不検出"の扱いをどのようにすればよいのか疑問を抱えている方への一助となれば幸いです。

## ≪著作権および免責事項≫
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

## ≪製作環境≫
このRプロジェクトを作成した環境は以下の通りです。
* OS: Windows10
* R: 4.1.0
* Rstudio: "Cranberry Hibiscus" Release (c8fc7aee, 2024-09-16) for windows
* cmdstanr: ver. 0.53

## ≪ファイル構成≫
* 2D-MCS.zip: 2D-MCSを実行したプロジェクトです。
* 2D-MCS.html: 2D-MCS.Rmdファイルの解析をKnit機能を用いてアウトプットしたものです。設定に問題が無ければ、このファイルと同じ解析結果が得られるはずです。
* 2D-MCS.Rmd: Rマークダウンファイル。Rのコードが書いてある。
* 2D-MCS.Rproj: RStudioのプロジェクトファイル。
* 2D-MCS.png: 2D-MCSにより得られた乱数のヒストグラムと確率密度分布曲線。
* Conc_Lognorm.stan: Stanコードが書いてある。
* data.xlsx: Excelで用意したデータの例。Rmdファイル内にはExcelファイルのインポート例を記載しています (コメントアウトしてある)。
* Excel.xlsx: Excelを用いたモンテカルロシミュレーション () と最尤推定 () の例を示したファイルです。

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
{cmdstanr}のインストールおよび実行方法は下記のサイトを参考にして下さい。<br>
<https://mc-stan.org/cmdstanr/><br>
<https://norimune.net/3609>
## ≪使用方法≫
RStudioを起動して、フォルダ内の"2D-MCS.Rproj"を開いて下さい。<br>
右下ペインのFileタブより、"2D-MCS.Rmd"をクリックしRmdファイルを開いて下さい。<br>
左上ペインの"2D-MCS.Rmd"タブを選択し、チャンク (コードが書いてある灰色の領域) の右上にある緑三角をクリックすると、チャンク内のコードが順番に実行されます。<br>
順番にチャンク内のコードを実行してください。<br>
"#"記号以降の文字は実行されない、メモ欄になります。<br>
<br>
右下ペインのFileタブより、"Conc_Lognorm.stan"をクリックしてStanファイルを開くと、Stanコードが記載されています。<br>
"//"以降の文字は実行されないメモ欄です。RStudioのKnit機能を使って出力を検討している場合は、日本語の使用を避けて下さい。<br>

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
