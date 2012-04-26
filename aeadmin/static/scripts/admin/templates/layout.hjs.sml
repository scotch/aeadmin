
.navbar
  .navbar-inner.navbar
    .container
      <!-- .btn-navbar is used as the toggle for collapsed navbar content -->
      a.btn.btn-navbar data-toggle="collapse" data-target=".nav-collapse"
        span.icon-bar |
        span.icon-bar |
        span.icon-bar |

      <!-- Be sure to leave the brand out there if you want it shown -->
      a.brand href="/admin/" | {{App.siteConfigController.content.title}} Admin

      <!-- Everything you want hidden at 940px or less, place within here -->
      .nav-collapse
        ul.nav
          li > a href="#config" | config

.container
  {{dynamicView}}

.push |

