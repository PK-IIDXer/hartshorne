# Dockerfile

FROM aruneko/texlive:latest
# tlmgr のリモートが TeX Live 2025 へ進んでおり、ベースイメージの TL 2023 からの
# クロスリリース更新が失敗するため、2023 の最終リポジトリに固定してから操作する。
# GitHub Actions で特定ミラーが落ちている場合があるので、明示ミラーとフォールバックを用意。
RUN (tlmgr option repository https://mirrors.rit.edu/CTAN/systems/texlive/2023/tlnet-final \
  || tlmgr option repository https://mirror.ctan.org/systems/texlive/2023/tlnet-final) \
 && tlmgr update --self \
 && tlmgr install biber \
 && tlmgr update biber biblatex \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 以下の COPY 行を削除（またはコメントアウト）してください
# COPY .latexmkrc /work/