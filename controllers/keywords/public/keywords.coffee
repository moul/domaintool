$(document).ready ->
    $('form').submit (e) ->
        do e.preventDefault
        domains = []
        errors = false
        for input in [ '.wordsa' ]
            container = $(input).parent().parent()
            container.removeClass().addClass('control-group')
            if not $(input).val().length
                container.addClass 'error'
                errors = true
        if errors
            return

        for worda in $('.wordsa').val().split(/\n/)
            for separatora in $('.separatora').val()
                for wordb in $('.wordsb').val().split(/\n/)
                    for separatorb in $('.separatorb').val()
                        for wordc in $('.wordsc').val().split(/\n/)
                            for tld in $('.tlds').val()
                                domains.push "#{worda}#{separatora}#{wordb}#{separatorb}#{wordc}.#{tld}"
        $('#results tbody').domainTool_query_multiple domains
