# .latexmkrc

# uplatex を使用し、biber を使う設定
$latex = 'uplatex -interaction=nonstopmode -file-line-error %O %S';
$bibtex = 'biber %B';
$dvipdf = 'dvipdfmx %O -o %D %S';
$pdf_mode = 4; # DVI -> PDF のモード (uplatex には必須)

# 出力先を 'build' ディレクトリに指定
$out_dir = 'build';
# CI/CD 強制更新用ダミーコメント