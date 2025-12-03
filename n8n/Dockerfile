FROM n8nio/n8n:latest

USER root

# ✅ 크롤링 필수 패키지
RUN apk add --no-cache \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    nodejs \
    npm

# ✅ Node 크롤링 라이브러리 일괄 설치
RUN npm install \
    cheerio \
    axios \
    puppeteer \
    pdf-parse \
    iconv-lite

# ✅ Puppeteer에서 시스템 Chromium 사용
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV CHROMIUM_PATH=/usr/bin/chromium-browser

USER node
