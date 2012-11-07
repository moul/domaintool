$(document).ready ->
    $('form').submit (e) ->
        do e.preventDefault
        domains = []
        errors = false
        for input in [ '.letters', '.separator', '.words', '.tlds' ]
            container = $(input).parent().parent()
            container.removeClass().addClass('control-group')
            if not $(input).val().length
                container.addClass 'error'
                errors = true
        if errors
            return
        for letters in $('.letters').val()
            for letter in letters.split(',')
                for separator in $('.separator').val()
                    for word in $('.words').val().split(/\n/)
                        for tld in $('.tlds').val()
                            domains.push "#{letter}#{separator}#{word}.#{tld}"
        $('#results tbody').domainTool_query_multiple domains
