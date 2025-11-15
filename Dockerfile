# Dockerfile

FROM aruneko/texlive:latest

# 修正した .latexmkrc を、latexmk が見つけやすい
# /work ディレクトリ (作業場所) にコピーする
COPY .latexmkrc /work/