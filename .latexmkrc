# .latexmkrc

# uplatex を使用し、pbibtex を使う設定
$latex = 'uplatex -interaction=nonstopmode -file-line-error %O %S';
$bibtex = 'pbibtex %B';
$dvipdf = 'dvipdfmx %O -o %D %S';
$pdf_mode = 4; # DVI -> PDF のモード (uplatex には必須)

# 出力先を 'out' ディレクトリに指定（VS Code設定と統一）
$out_dir = 'out';
# CI/CD 強制更新用ダミーコメント