#!/bin/bash

source .env

Z_C0=${Z_C0:-}
COOKIE="z_c0=${Z_C0};"

block() {
    USER_ID=${1}
    curl -iL -X POST \
        https://www.zhihu.com/api/v4/members/${USER_ID}/actions/block \
        -H "cookie: ${COOKIE}"
}

USER_IDS=(
    "hua-ti-xiao-zhu-shou" # 话题小助手
    "zhi-hu-yan-xiu-ban" # 知乎知学堂
    "zhi-hu-you-xi-jun-33" # 知乎游戏君
    "AnonymousLive" # 知乎盐选会员
    "reseted1636191193711" # 知乎训练营
    "zhi-hu-qi-che" # 知乎汽车
    "zhihu-haowutuijian" # 知乎好物推荐
    "zhi-hu-cheng-chang-ji-hua" # 知乎成长计划
    "zhi-hu-dian-jing" # 知乎电竞
    "zhi-hu-mei-zhuang" # 知乎美装
    "zhi-hu-mei-shi-96" # 知乎美食
    "zhi-hu-tu-shu-91" # 知乎图书
    "fu-fei-zi-xun-xiao-zhu-shou" # 知乎付费咨询小助手
    "zhi-hu-jian-kang-65" # 知乎健康
    "zhi-hu-shang-ye" # 知乎商业
    "zhi-hu-jia-dian-34" # 知乎家电
    "chao-zan-bao-xiao-zhu-shou" # 超赞包小助手

    # Reference: https://zhuanlan.zhihu.com/p/127021293
    "zhi-hu-14-94-58" # 知乎
    "liu-kan-shan-78" # 刘看山
    "xiao-zhi-tong-xue-88-53" # 小直同学
    "zhi-hu-xiao-zhi-80" # 知乎小知
    "-5-2" # 刘看山福利社
    "zhihuadmin" # 知乎小管家
    "yan-xuan-zuo-zhe-xiao-guan-jia" # 盐选作者小管家
    "zhi-hu-shang-ye-xiao-guan-jia" # 知乎商业小管家
    "zhi-hu-mcnxiao-guan-jia" # 知乎 MCN 小管家
    "zhujiangren" # 盐选推荐
    "zhi-hu-dian-zi-shu" # 知乎盐选创作者
    "liu-kan-shan-78-51" # 盐选成长计划
    "qin-li-zhe-shuo" # 亲历者说
    "liu-kan-shan-50-89" # 盐选会员精品
    "liu-kan-shan-82" # 盐选文学甄选
    "liu-kan-shan-98-70" # 盐选奇妙物语
    "liu-kan-shan-20-53" # 盐选科技前沿
    "liu-kan-shan-18-19" # 盐选职场
    "liu-kan-shan-9-68" # 盐选博物馆
    "liu-kan-shan-51" # 盐选生活馆
    "liu-kan-shan-68-21" # 盐选心理
    "liu-kan-shan-94-42" # 盐选健康必修课
    "AnonymousLive" # 知乎盐选会员
    "yan-xuan-ke-pu-28" # 盐选科普
    "liu-kan-shan-12-91" # 盐选点金
    "yan-xuan-ke-pu" # 宫墙往事
    "liu-kan-shan-71-80" # 真实职业故事
    "zhi-jia-zi-xuan" # 知乎知+自选
    "gu-shi-li-de-xiao-huang-hua-45-89" # 编辑小助手一号
    "ai-ru-chao-shui-49-77" # 编辑小助手二号
    "zhi-hu-xiao-mi-shu" # 知乎付费咨询
    "St.Pancras" # 知乎机构号团队
    "zhi-hu-dian-zi-shu" # 知乎电子书
    "zhihu_marketing" # 知乎市场团队
    "yan-sha-long" # 知乎盐沙龙
    "zhi-shi-ku-21-42" # 知识库
    "zhi-hu-ri-bao-51-41" # 知乎日报
    "verycool" # 知一声
    "zhihubanquan" # 知乎版权
    "zhi-hu-zhong-ce" # 知乎众测
    "zhi-hu-ke-tang" # 知乎课堂
    "zhi-hu-quan-zi" # 知乎圈子
    "zhi-hu-shi-pin" # 知乎视频
    "zhi-hu-shu-dian" # 知乎读书卡
    "zhihu_question_shop" # 知乎问题商店
    "gu-shi-dang-an-ju" # 知乎故事大赛
    "gu-shi-dang-an-ju-71" # 故事档案局
    "zhihu-haowutuijian" # 知乎好物推荐
    "zhi-hu-hao-jia" # 知乎好价
    "zhi-hu-qian-dai" # 知乎钱袋
    "zhi-hu-ren-wen" # 知乎人文
    "zhi-hu-sheng-huo" # 知乎生活
    "zhi-hu-si-liu-ji" # 知乎四六级
    "zhi-hu-yu-le" # 知乎娱乐
    "zhi-hu-cai-jing" # 知乎财经
    "zhi-hu-xin-li-xue-89" # 知乎心理
    "zhi-hu-qing-gan-jun" # 知乎情感君
    "zhi-hu-man-hua" # 知乎漫画
    "zhi-hu-you-xi" # 知乎游戏
    "zhi-hu-dong-hua" # 知乎动画
    "zhi-hu-ju-zong" # 知乎剧综
    "zhi-hu-dian-ying-72" # 知乎电影
    "zhi-hu-zhi-chang" # 知乎职场
    "zhao-pin-xiao-zhu-shou-59" # 知乎求职
    "zhi-hu-ke-xue" # 知乎科学
    "zhi-ke-ji-13" # 知乎科技
    "zhi-hu-ti-yu" # 知乎体育
    "zhi-hu-xiao-yuan-46" # 知乎校园
    "zhi-hu-qi-che" # 知乎汽车
    "zhi-qing-24-68" # 知擎
    "zhi-hu-qin-zi" # 知乎亲子
    "zhi-hu-meng-chong" # 知乎萌宠
    "zhi-hu-kao-yan" # 知乎考研
    "zhi-hu-zheng-wu" # 知乎政务
    "zhi-hu-shi-shang" # 知乎时尚
    "zhi-hu-ya-si" # 知乎雅思
    "zhi-hu-lu-xing-96" # 知乎旅行
    "zhi-hu-fa-lu" # 知乎法律
    "zhi-hu-ying-xiao" # 知乎营销
    "zhi-hu-cheng-shi" # 知乎城市
    "zhi-hu-cheng-shi-nan-jing" # 知乎城市-南京
    "zhi-hu-cheng-shi-cheng-du" # 知乎城市-成都
    "zhi-hu-cheng-shi-tian-jin" # 知乎城市-天津
    "zhi-hu-cheng-shi-xi-an" # 知乎城市-西安
    "zhi-hu-zhao-pin" # 知乎范儿
)

for USER_ID in ${USER_IDS[@]}; do
    echo "blocking ${USER_ID}"
    block "${USER_ID}"
done
