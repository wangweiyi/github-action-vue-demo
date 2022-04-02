FROM node:14

# 指定容器的工作目录为 容器根目录下的 project目录, /代表容器根目录, 
# 容器可以想像成一个沙箱, / 就是这个沙箱的根目录
WORKDIR /usr/project
# 将当前目录(Dockerfile文件所在的目录)的内容复制到 容器内的/project目录下
COPY . /usr/project

# 设置容器的环境变量, 可选
ENV AUTHOR_NAME=Cathy

# 声明容器监听的端口, 只是声明, 并不会改变端口
EXPOSE 8080

# 镜像的构建命令
# 每一次RUN都会在镜像上新建一层, 可以使用 \ 换行, 用 && 符号连接多条命令，这样只会创建一层镜像
# 设置时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && npm install

# 容器启动时执行的命令, 
# 只能有一条, 且必须是会阻塞控制台的命令, 否则执行完后容器就退出了
CMD echo 'image made by ${AUTHOR_NAME}' && npm run serve
