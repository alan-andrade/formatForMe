App.SearchBoxView = Em.TextField.extend
  disabledObserver: (->
    @set 'disabled', App.BookResult.isSearching
  ).observes("App.BookResult.isSearching")

  value: ''

  placeholder: 'Search your book'

  keyPress: (e)->
    if e.keyCode is 13 and @value isnt ''
      App.BookResult.search @value
      false
