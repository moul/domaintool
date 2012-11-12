$(document).ready ->
    update_trends = ->
        console.log 'test'
        $.ajax
            url: 'https://api.twitter.com/1/trends/1.json?callback=?'
            dataType: 'json'
            success: (data) ->
                $('select.trends').empty().append $('<option/>').attr('disabled','disabled').html('-- Trends --')
                for trend in data[0].trends
                    $('select.trends').append $('<option/>').attr('selected', 'selected').html(trend.name)
        console.log 'test'

    do update_trends

    $('form').submit (e) ->
        do e.preventDefault
        domains = []

        for trend in $('.trends').val()
            for tld in $('.tlds').val()
                name = "#{cleanName trend}.#{tld}"
                domains.push name
        $('#results tbody').domainTool_query_multiple domains
