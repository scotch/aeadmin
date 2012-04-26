from aecore.handlers import Jinja2Handler
from aecore.decorators import admin_required
import webapp2

class PageHandler(Jinja2Handler):

    @admin_required
    def root(self):
        self.render_template('admin/root.html', {})

class UtilHandler(webapp2.RedirectHandler):

    def memcache_clear(self):
        """
        The is method clears the memcache. This is especially useful with ndb
        models, where changes to the datastore will not reflect until the
        memcache key has been reset.

        :return: a redirect to '/'

        """
        from google.appengine.api import memcache
        import logging

        try:
            memcache.flush_all()
            logging.info('Memecache cleared successfully')
        except Exception, e:
            logging.error(
                'An Error occurred while attempting to clear ' \
                'the memcache. {}'.format(e))

        return self.redirect('/')
