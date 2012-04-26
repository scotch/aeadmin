from aerest.resources import NDBResource
from aerest.authentication import AECoreAuthentication
from aerest.authorization import AdminAuthorization
from aecore.models import Config


class ConfigResource(NDBResource):
    # We are using the Config from aecore as a resource.
    # The only requirement for a  resource is that it stores its values
    # in a ``data`` property, which ``aecore.models.Config`` does.
    resource_model = Config
    # This sets the resource_name. Urls are pluralized so the url
    # becomes configs
    resource_name = 'config'
    # resource_name_plural is used in urls.
    # We are setting this here to demonstrate the property. When the plural
    # form simply adds an "s" this property will automatically be created.
    resource_name_plural = 'configs'
    # Keys are strings i.e. 'aecore', 'aeauth'
    id_type = str
    # Ensure a User is logged in.
    authentication = AECoreAuthentication
    # Require admin rights to modify
    authorization = [AdminAuthorization]
