$(document).ready ->
    generateWord = (length = 8, beginWithVowers = 1) ->
        vowers = ['a', 'e', 'i', 'o', 'u']
        cons   = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'y', 'z']
        word = ''

        for i in [0...length]
            collection = if (i + beginWithVowers) % 2 then vowers else cons
            word += collection[Math.floor(Math.random() * (collection.length))]
        return word

    $('form').submit (e) ->
        do e.preventDefault
        domains = []

        length = $('#length').val()
        for amount in [0...$('#amount').val()]
            word = generateWord length, Math.floor(Math.random() * 2)
            for tld in $('.tlds').val()
                domains.push "#{word}.#{tld}"
        $('#results tbody').domainTool_query_multiple domains
