# Dockerfile

FROM aruneko/texlive:latest
# tlmgr のリモートが TeX Live 2025 へ進んでおり、ベースイメージの TL 2023 からの
# クロスリリース更新が失敗するため、2023 の最終リポジトリに固定してから操作する。
# GitHub Actions で特定ミラーが落ちている場合があるので、複数ミラーを順番に試す。
RUN set -e; \
    mirrors="\
https://mirror.ctan.org/systems/texlive/2023/tlnet-final \
http://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2023/tlnet-final \
https://ftp.jaist.ac.jp/pub/CTAN/systems/texlive/2023/tlnet-final \
https://ctan.math.illinois.edu/systems/texlive/2023/tlnet-final"; \
    success=0; \
    for m in $mirrors; do \
      echo "Trying TL repo: $m"; \
      if tlmgr option repository "$m" && tlmgr update --self; then \
        success=1; break; \
      fi; \
      echo "Mirror failed: $m"; \
    done; \
    if [ "$success" -ne 1 ]; then exit 1; fi; \
    tlmgr install biber \
 && tlmgr update biber biblatex \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 以下の COPY 行を削除（またはコメントアウト）してください
# COPY .latexmkrc /work/