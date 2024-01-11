# zhihu-block

一键拉黑烦人的知乎官方账号

## 使用方式

### 1. 获取 Z_C0

从 Cookie 中获取 Z_C0 的值。

![](./resources/1.png)

```sh
echo 'Z_C0="获取到的Z_C0"' > .env
```

### 2. 运行脚本

```bash
bash -x ./zhihu-block.sh
```

看到类似以下结果就是拉黑成功了

```
HTTP/2 204
server: CLOUD ELB 1.0.0
date: Thu, 11 Jan 2024 02:57:15 GMT
content-type: text/html; charset=UTF-8
expires: Fri, 02 Jan 2000 00:00:00 GMT
pragma: no-cache
x-backend-response: 0.156
vary: Accept-Encoding
referrer-policy: no-referrer-when-downgrade
x-secng-response: 0.16499996185303
set-cookie: _xsrf=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; path=/; domain=zhihu.com; expires=Mon, 29-Jun-26 02:57:15 GMT
x-lb-timing: 0.165
x-idc-id: 2
set-cookie: KLBRSID=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|1704941835|1704941835; Path=/
cache-control: private, must-revalidate, no-cache, no-store, max-age=0
x-nws-log-uuid: xxxxxxxxxxxxxxxxxxxx
x-cache-lookup: Cache Miss
x-edge-timing: 0.210
x-cdn-provider: tencent
```
