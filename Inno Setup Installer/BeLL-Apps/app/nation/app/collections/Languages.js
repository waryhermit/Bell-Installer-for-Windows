$(function() {

    App.Collections.Languages = Backbone.Collection.extend({

        initialize: function(e) {
            if (e) {
                this.url = App.Server + '/languages/_all_docs?include_docs=true' + '&limit=' + e.limit
            } else {
                this.url = App.Server + '/languages/_all_docs?include_docs=true'
            }
        },
        setUrl: function(url) {
            this.url = url;
        },
        parse: function(response) {
            var docs = _.map(response.rows, function(row) {
                return row.doc
            })
            return docs
        },



        comparator: function(model) {
            var Name = model.get('Name')
            if (Name) return Name.toLowerCase()
        },
        model: App.Models.Language

    })

})