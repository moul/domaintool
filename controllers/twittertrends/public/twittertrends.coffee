$(document).ready ->

    delay = (->
        timer = 0
        return (callback, ms) ->
            clearTimeout timer
            timer = setTimeout callback, ms
        )()

    yahooapikey = $('meta[name="yahooapikey"]').attr('value')

    if yahooapikey?.length > 10
        $('#location').keyup ->
            delay (->
                location = $('#location').val()
                url = "http://where.yahooapis.com/v1/places.q('#{location}')?appid=#{yahooapikey}"
                $('.trends').empty().append $('<option/>').attr('disabled', 'disabled').html('-- Loading... --')
                $.ajax
                    url: url
                    dataType: "json"
                    success: (data) ->
                        if data.places.count
                            $('.trends').parent().parent().removeClass().addClass('control-group success')
                            update_trends data.places.place[0].woeid
                        else
                            $('.trends').parent().parent().removeClass().addClass('control-group error')
                            $('.trends').empty().append $('<option/>').attr('disabled', 'disabled').html('-- Location not found --')
            ), 700
    else
        $('#location').attr('disabled', 'disabled')

    update_trends = (woeid = 1) ->
        $.ajax
            url: "https://api.twitter.com/1/trends/#{woeid}.json?callback=?"
            dataType: 'jsonp'
            timeout: 1500
            success: (data) ->
                $('select.trends').empty().append $('<option/>').attr('disabled','disabled').html('-- Trends --')
                for trend in data[0].trends
                    $('select.trends').append $('<option/>').attr('selected', 'selected').html(trend.name)
            error: (data) ->
                $('.trends').parent().parent().removeClass().addClass('control-group error')
                $('.trends').empty().append $('<option/>').attr('disabled', 'disabled').html('-- Location not found --')

    update_trends 1

    $('form').submit (e) ->
        do e.preventDefault
        domains = []

        for trend in $('.trends').val()
            for tld in $('.tlds').val()
                name = "#{cleanName trend}.#{tld}"
                domains.push name
        $('#results tbody').domainTool_query_multiple domains
