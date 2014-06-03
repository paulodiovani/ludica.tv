exports.install = (framework) ->
  framework.route "/", view_homepage
  framework.route "#400", error400
  framework.route "#401", error401
  framework.route "#403", error403
  framework.route "#404", error404
  framework.route "#408", error408
  framework.route "#431", error431
  framework.route "#500", error500
  return

# Bad Request
error400 = ->
  self = this
  self.status = 400
  self.plain utils.httpStatus(self.status)
  return

# Unauthorized
error401 = ->
  self = this
  self.status = 401
  self.plain utils.httpStatus(self.status)
  return

# Forbidden
error403 = ->
  self = this
  self.status = 403
  self.plain utils.httpStatus(self.status)
  return

# Not Found
error404 = ->
  self = this
  self.status = 404
  self.plain utils.httpStatus(self.status)
  return

# Request Timeout
error408 = ->
  self = this
  self.status = 408
  self.plain utils.httpStatus(self.status)
  return

# Request Header Fields Too Large
error431 = ->
  self = this
  self.status = 431
  self.plain utils.httpStatus(self.status)
  return

# Internal Server Error
error500 = ->
  self = this
  self.status = 500
  self.plain utils.httpStatus(self.status)
  return

# View homepage
view_homepage = ->
  self = this
  self.view "home"
  return
