import webapp2
import os
from aerest.api import Api
from aeadmin.resources import ConfigResource
from webapp2_extras.routes import PathPrefixRoute
from webapp2_extras.routes import RedirectRoute

api_v1 = Api()
api_v1.register(ConfigResource)

routes = [
    PathPrefixRoute(r'/admin/api/v1', api_v1.get_routes()),
    RedirectRoute(r'/admin', redirect_to='/admin/'),
    webapp2.Route(r'/admin/', handler='aeadmin.handlers.PageHandler:root', name='admin-root'),

    webapp2.Route(r'/_ah/admin/memcache/clear', handler='aeadmin.handlers.UtilHandler:memcache_clear', name='admin-memcache-clear'),

    ]

template_path = os.path.join(os.path.dirname(__file__), 'templates')

config = {
    'webapp2_extras.jinja2': {
        'template_path': ['templates', template_path],
        },
    }


application = webapp2.WSGIApplication(routes, config=config)
