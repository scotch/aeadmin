<!DOCTYPE HTML>
html
  head
    title | {{ application.title }} Admin
    meta charset="utf-8" /
    meta name="description" content="" /
    meta name="author" content="" /
    meta name="viewport" content="width=device-width, initial-scale=1.0" /
    link rel="stylesheet" href="/admin/static/styles/css/admin.css" /

    <!--
    This section is added for demo purposes and may safely be removed
    -->
    link href="/admin/static/google-code-prettify/prettify.css" type="text/css" rel="stylesheet" /
    script type="text/javascript" src="/static/google-code-prettify/prettify.js" |

    <!--[if lt IE 8]>
      script src="http://cdnjs.cloudflare.com/ajax/libs/json2/20110223/json2.js" |
    <![endif]-->
    <!--[if lt IE 9]>
      script type="text/javascript" src="//html5shiv.googlecode.com/svn/trunk/html5.js" |
    <![endif]-->

    <!--
    uncomment to server require.js from cdnjs
    script src="http://cdnjs.cloudflare.com/ajax/libs/require.js/1.0.5/require.min.js" |
    -->
    script src="/admin/static/scripts/lib/require.js" |

    script
      | require.config({
      |   baseUrl: "/admin/static/scripts/",
      |   paths: {
      |    //Comment out this line to go back to loading
      |    //the optimized admin-build.js source file.
      |    //"admin": "/admin/static/scripts/admin-built"
      |    "admin": "/admin/static/scripts/admin"
      |  }
      |  });
      |  //require(["https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js", "admin"]);
      |  require(["/admin/static/scripts/lib/jquery.min.js", "admin"]);

  body

    #content
      .navbar
        .navbar-inner.navbar
          .container
            a.brand href="/admin/" | {{ application.title }} Admin
      .init-loading |

    footer.footer
      .container
        p > small | <a href="http://www.enginestarter.org/projects/enginestarter" target="_blank">EngineStarter</a> by <a href="http://www.scotchmedia.com" target="_blank">Scotch Media</a>.

