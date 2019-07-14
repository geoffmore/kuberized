# Usage
1. Populate `nextcloud-inventory.ini` with the following variables
  * nc_trusted_domains (no defaults, failure to set this *WILL* prohibit access
  * nc_svc_type (defaults to `ClusterIP`)
  * nc_user (defaults to `nextcloud`)
2. Run `deploy.sh`
3. Make the service accessible (highly dependant on service type and
   infrastructure)
4. Done
    
# Errata
* NextCloud pods currently do not listen on 443
* All-In-One Configuration is provided, but the app needs to be decoupled from
  its database
* Lifecycle management is not present (more knowledge of the app is necessary
  for this)
