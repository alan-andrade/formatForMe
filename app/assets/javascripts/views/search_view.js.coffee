App.SearchView = Em.View.extend
  templateName: 'search'
  layout: Em.Handlebars.compile "<div style='width:500px; float: left'>{{ yield }}</div>"

  addBook: (e)->
    console.log e
    false
