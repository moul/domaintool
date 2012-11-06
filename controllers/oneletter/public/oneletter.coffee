$(document).ready ->
    $('form').submit (e) ->
        do e.preventDefault
        domains = []
        errors = false
        for input in [ '.letters', '.separator', '.words', '.tlds' ]
            container = $(input).parent().parent()
            container.removeClass('error warning success')
            if not $(input).val().length
                container.addClass 'error'
                errors = true
        if errors
            return
        console.log 42
        for words in $('.words').val()
            console.log $.unique words.split /\n/
         for letters in $('.letters').val()
            for letter in letters.split(',')
                for separator in $('.separator').val()
                    for words in $('.words').val()
                        for word in words.split(/\n/)
                            for tld in $('.tlds').val()
                                domains.push "#{letter}#{separator}#{word}.#{tld}"
        console.log domains
        return false
