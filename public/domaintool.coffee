socket = false
domainTools_containers = []

$(document).ready ->
    socket = io.connect "http://#{window.location.hostname}", { port: parseInt $('meta[name="ioport"]').attr('value') }
    socket.on 'connect', -> console.log 'on connect'
    socket.on 'reconnect', -> console.log 'on reconnect'
    socket.on 'disconnect', -> console.log 'on disconnect'
    socket.on 'domainTool_result', (domain, result) ->
        for container in domainTools_containers
            entry = container.find("[data-domain='#{domain}']")
            entry.removeClass().addClass(result.class)
            entry.find('.info').html result.state

$.fn.domainTool_query_multiple = (domains) ->
    passed = []
    container = $(@)
    container.parent().find('.remove-all').click -> container.empty()
    container.parent().find('.remove-unavailable').click -> container.find('.error').remove()
    domainTools_containers.push container
    for domain in domains
        domainTd = $("[data-domain='#{domain}']", container)
        if domainTd.length
            if not (domainTd.hasClass('success') or domainTd.hasClass('error'))
                passed.push domain
        else
            passed.push domain
            row = $('<tr></tr>').attr('data-domain', domain).addClass('info')
            row.append $('<td></td>').addClass('domain').html domain
            row.append $('<td></td>').addClass('info').html 'in progress...'
            container.append row
    socket.emit 'domainTool_query_multiple', passed

window.cleanName = (s) ->
    r = s.toLowerCase()
    r = r.replace(new RegExp(/\s/g),"")
    r = r.replace(new RegExp(/[àáâãäå]/g),"a")
    r = r.replace(new RegExp(/æ/g),"ae")
    r = r.replace(new RegExp(/ç/g),"c")
    r = r.replace(new RegExp(/[èéêë]/g),"e")
    r = r.replace(new RegExp(/[ğ]/g),"g")
    r = r.replace(new RegExp(/[ìíîïı]/g),"i")
    r = r.replace(new RegExp(/ñ/g),"n")
    r = r.replace(new RegExp(/[òóôõö]/g),"o")
    r = r.replace(new RegExp(/œ/g),"oe")
    r = r.replace(new RegExp(/[ş]/g),"s")
    r = r.replace(new RegExp(/[ùúûü]/g),"u")
    r = r.replace(new RegExp(/[ýÿ]/g),"y")
    r = r.replace(new RegExp(/[#\'\"]/g),"")
    #r = r.replace(new RegExp(/\W+/g),"")
    #r = r.replace(new RegExp(/^\W/g), "")
    #r = r.replace(new RegExp(/\W$/g), "")
    return r
