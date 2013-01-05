App.Router = Em.Router.extend
  location: 'hash'

  search: Em.Route.transitionTo('root.search')
  addBook: Em.Router.transitionTo('root.books.add')

  root: Em.Route.extend

    index: Em.Route.extend

      route: '/'

      connectOutlets: (router, context)->
        router.get('applicationController').
          connectOutlet 'search', 'search'

        router.get('searchController').
          connectOutlet 'searchResults',
                        'bookResults',
                        App.BookResult.all()

    books: Em.Route.extend
      route: '/'

      connectOutlets: (router, conext)->
        console.log router

      add: Em.Route.extend

        route: '/add'

        connectOutlets: (r,c)->
          console.log r

