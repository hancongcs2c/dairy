<!DOCTYPE html>
<html lang="{{ config.language }}">
  <head>
    {% include '_partial/head.swig' %}
    <title>{% block title %}{% endblock %}</title>
  </head>

  <body>
    {%- include '_partial/slideout.swig' %}
    <div class="container" id="mobile-panel">
      <header id="header" class="header">
        {%- include '_partial/header.swig' %}
      </header>

      <main id="main" class="main">
        <div class="content-wrapper">
          <div id="content" class="content">
            {% block content %}{% endblock %}
          </div>
          {% include '_partial/comments.swig' %}
        </div>
      </main>

      <footer id="footer" class="footer">
        {%- include '_partial/footer.swig' %}
      </footer>

      <div class="back-to-top" id="back-to-top">
        <i class="iconfont icon-up"></i>
      </div>
    </div>

    {% include '_script/comments.swig' %}

    {% include '_script/libs.swig' %}
    {% include '_script/theme.swig' %}
    <script src="//cdn1.lncld.net/static/js/3.0.4/av-min.js"></script>
    <script src="//unpkg.com/valine/dist/Valine.min.js"></script>
    <script>
      new Valine({
        el: '#comment' ,
        notify:false,
        verify:false,
        app_id: 'SrabF1tXJrV4acE8KepjoHP4-gzGzoHsz',
        app_key: 'Q2xiILiLtYtKpRTaz9M9RlDo',
        placeholder: '啥？风太大，我听不清～～',
        path:window.location.pathname,
        avatar:'mm',
        guest_info: ['nick', 'mail']
      });
    </script>
  </body>
</html>
