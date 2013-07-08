# Description

A chef cookbook to install Sharepoint 2013.

**Note:** This is a work-in-progress & was done more as a learning experience / proof-of-concept, it is not yet intended for production use. Proceed with caution.

I would like to eventually make this cookbook data-driven & able to install any configuration, but for now I'm sticking to Sharepoint Foundation 2013 & Sharepoint Server 2013 running in a single server (demo) setup.

I'm a complete Windows Server n00b, and will most likely get things wrong. Pull requests & issues are definitely welcomed!


Also, this cookbook was created through Berkshelf, but I don't yet have access to Windows Server VMs, so there are no tests, yet.

# Requirements

This has only been tested with Sharepoint Foundation 2013 & Sharepoint Server 2013, running on Windows Server 2012 Datacenter on top of Windows Azure.

# Usage

Add the relevant recipe to a role. Possibly set some attributes.

# Attributes

`node['sharepoint']['product_key']` = your product key. defaults to free trial key.
`node['sharepoint']['server_role']` = the server role, should be one of SINGLESERVER (single server mode), or APPLICATION (farm mode)

# Recipes

default.rb - does nothing yet, haven't decided on a sane default yet.

foundation.rb - installs Sharepoint Foundation 2013.

single-server.rb - installs Sharepoint Server 2013 as a single server.

# Author

Author:: Mark Bate (mark.bate@mac.com)
