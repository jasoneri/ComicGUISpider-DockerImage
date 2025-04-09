FROM python:3.12

# 安装Node.js最新版
RUN curl -fsSL https://deb.nodesource.com/setup_current.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g npm@latest

# 设置 pip 镜像源
RUN python -m pip config set global.progress_bar off

# 安装基础依赖
RUN python -m pip install coverage pytest httpx colorama loguru PyYAML \
    Scrapy tqdm brotli markdown lxml Pillow jsonpath_rw

# 推荐添加以下优化项
RUN pip cache purge && \
    find /usr/local -type f -name '*.pyc' -delete && \
    find /usr/local -type d -name '__pycache__' -delete