# Dockerfile

FROM aruneko/texlive:latest
RUN apt-get update && apt-get install -y biber && apt-get clean

# 以下の COPY 行を削除（またはコメントアウト）してください
# COPY .latexmkrc /work/