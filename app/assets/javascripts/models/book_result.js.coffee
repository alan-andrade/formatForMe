App.BookResult = Em.Object.extend
  title: (->
    @volumeInfo.title
  ).property('volumeInfo')

  authors: (->
    @volumeInfo.authors
  ).property('volumeInfo')

  image: (->
    il = @volumeInfo.imageLinks
    il.smallThumbnail or il.thumbnail or il.small
  ).property('volumeInfo')

App.BookResult.reopenClass
  isSearching: false

  _listOfBooks: Em.A()

  _stubBooks: [ \
    volumeInfo:
      title: 'AC/DC',
      authors: ['Jimmy', 'Bob']
      imageLinks:
        small: '/images/rails.png'

    volumeInfo:
      title: 'Metallica'
      imageLinks:
        thumbnail: '/assets/rails.png'
  ]

  search: (query)->
    App.BookResult.isSearching = true
    @_listOfBooks.clear()
    $.getJSON \
      'https://www.googleapis.com/books/v1/volumes',
        key: 'AIzaSyDTJ_7I7E1MLEfqfs6YWvaZJwlcyFHconI',
        q: query,
        (data, textStatus, jqXHR)=>
          data.items.forEach (book)=>
            console.log book
            @_listOfBooks.pushObject App.BookResult.create book

  all: ->
    @_listOfBooks
