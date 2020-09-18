---
title: wordpress依赖Materialist制作论坛形式的子主题（一）
date: 2015-04-22 14:54:56
categories: 随笔
tags: [php,wordpress,画风有变！]

---
让一切从制作子主题开始吧！

——题记

目标：制作一个小清新的wordpress论坛主题。

原因：防止Materialist升级后所作的修改都被清空。

**1、theme文件夹下创建materialist-child文件夹（名称可自选）**

**2、创建style.css，并添加以下代码：**

/*

Theme Name: Materialist Child

Description: Child theme for the Materialist theme 

Author: hancong

Template: Materialist

*/

<br /><br />

@import url("../materialist/style.css");

解析：Theme Name：必填，与其它主题不同的名称；Description：选填；Author：选填；Template：必填，父主题的name；必须引入父主题的style.css，因为有了子主题的style.css，wordpress加载时会跳过父主题的style.css，另外，@import句应该在所有样式语句之前写，否则无效。

<br /><br />

**3、后台启动Materialist Child主题。**

![wordpress依赖Materialist制作论坛形式的子主题（一） - 兔子 - 广莫之野，无何有之乡。](6630798385350560300.png)

**4、创建functions.php，添加以下代码：**

<?php

<br /><br />

function favicon_link() {

echo '<link rel="icon" href="images/llk.png">' . "\n";

}

add_action('wp_head', 'favicon_link');

<br /><br />

?>

为网站添加icon...与style.css跳过加载不同，子主题中的functions.php可以补充／覆盖父主题functions.php中的内容。

效果图如下：

![wordpress依赖Materialist制作论坛形式的子主题（一） - 兔子 - 广莫之野，无何有之乡。](6630798385350560300.png)

**5、为首页文章列表增加评论详情。**

*   修改首页每篇文章显示摘要的字数。

在functions.php中增加以下代码（覆盖父主题对应的方法）：

if( ! function_exists( 'materialist_excerpt_length') ) :

/**

 * Modifying excerpt's length

 * 

 * @return int

 */

function materialist_excerpt_length(){

return 30;

}

endif;

add_filter( 'excerpt_length', 'materialist_excerpt_length' );

*   在每篇文章摘要之后添加评论数量。

复制父主题中的content.php至当前子主题，在class为entry-summary的div后添加：

<div class="entry-comment">

<a href='<?php echo esc_url( get_permalink() )."#comments" ?>'><span class="comment-num"><?php echo number_format_i18n( get_comments_number()+1 ); ?>#</span></a>

</div>

*   修改相应的样式。

style.css中添加：

.entry-comment{

display:inline-block;

background: #fff;

color:#455A64;

position: absolute;

right: 30px;

}

.entry-comment span{

display:inline-block;

padding:0 6px;

border-radius:9px;

font-size:12px;

}

.entry-comment span:after{

content:"";

display:inline-block;

width:30px;

height:30px;

background:url(images/icons.png) no-repeat -235px -100px;

background-size:500px auto;

position:absolute;

left:-30px;

}

鼠标在评论图标区域的效果：

 ![wordpress依赖Materialist制作论坛形式的子主题（一） - 兔子 - 广莫之野，无何有之乡。](6630798385350560300.png)

评论数量添加完毕。

<br /><br />

--茕茕白兔--
---
>评论区：
>**兔子：** ？？？  *[2015-04-23 22:25:44]*
>
