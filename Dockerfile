# Dockerfile

FROM aruneko/texlive:latest
# biblatex 3.19 に対応する biber (2.19) を tlmgr から導入・更新
RUN tlmgr update --self \
 && tlmgr install biber \
 && tlmgr update biber biblatex \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 以下の COPY 行を削除（またはコメントアウト）してください
# COPY .latexmkrc /work/