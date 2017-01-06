$(function() {

    App.Views.CommunityForm = Backbone.View.extend({

        className: "addNation-form",
        vars: {},

        events: {
            "click #formButton": function() {
                document.getElementById("addCommunity").submit();
            },
            "submit form": "setForm"
        },
        template: $('#template-addCommunity').html(),


        render: function() {

            var Nation = this.model
            this.$el.append(_.template(this.template, this.vars));
            if(App.languageDictValue.get('directionOfLang').toLowerCase() == "right")
            {
                $('.heading').append('<a id="addCommunityLabel" href="">' + App.languageDictValue.get("Add_Community") + '</a>  |   <a href="" id="nationBellLabel">' + App.languageDictValue.get("Nation_Bell") + '</a>');
            }
            else
            {
                $('.heading').append('<a href="" id="nationBellLabel">' + App.languageDictValue.get("Nation_Bell") + '</a>  |   <a id="addCommunityLabel" href="">' + App.languageDictValue.get("Add_Community") + '</a>');
            }
            //$('.heading a#nationBellLabel').text(App.languageDictValue.get("Nation_Bell"));
            //$('.heading a#addCommunityLabel').text(App.languageDictValue.get("Add_Community"));
            $('#nation-name').attr('placeholder', App.languageDictValue.get("Name"));
            $('#community-code').attr('placeholder', App.languageDictValue.get("Code"));
            $('#nation-url').attr('placeholder', App.languageDictValue.get("Url"));

            $('#nationForm-container div p:eq(0)').text(App.languageDictValue.get("Sponsoring_Organization"));

            $('#org-name').attr('placeholder', App.languageDictValue.get("Name"));
            $('#org-sponseraddress').attr('placeholder', App.languageDictValue.get("Address"));

            $('#nationForm-container div div p:eq(0)').text(App.languageDictValue.get("General_Manager"));

            $('#org-firstname').attr('placeholder', App.languageDictValue.get("First_Name"));

            $('#org-middlename').attr('placeholder', App.languageDictValue.get("Middle_Names"));
            $('#org-lastname').attr('placeholder', App.languageDictValue.get("Last_Name"));

            $('#org-phone').attr('placeholder', App.languageDictValue.get("Phone"));
            $('#org-email').attr('placeholder', App.languageDictValue.get("Email"));

            $('#nationForm-container div p:eq(3)').text(App.languageDictValue.get("Tech_Support"));

            $('#leader-firstname').attr('placeholder', App.languageDictValue.get("First_Name"));
            $('#leader-middlename').attr('placeholder', App.languageDictValue.get("Middle_Names"));
            $('#leader-lastname').attr('placeholder', App.languageDictValue.get("Last_Name"));
            $('#leader-phone').attr('placeholder', App.languageDictValue.get("Phone_M"));
            $('#leader-email').attr('placeholder', App.languageDictValue.get("Email"));
            $('#leader-ID').attr('placeholder', App.languageDictValue.get("ID"));
            $('#leader-password').attr('placeholder', App.languageDictValue.get("Password"));

            $('#nationForm-container div p:eq(4)').text(App.languageDictValue.get("Nation_Contact"));

            $('#urg-name').attr('placeholder', App.languageDictValue.get("Name"));
            $('#urg-phone').attr('placeholder', App.languageDictValue.get("Url"));

            $('#nationForm-container div p:eq(5)').text(App.languageDictValue.get("Authorized_By"));

            $('#auth-name').attr('placeholder', App.languageDictValue.get("Name"));
            $('#auth-date').attr('placeholder', App.languageDictValue.get("Date"));

            $('#formButton').text(App.languageDictValue.get("Save"));

            if (this.model.id != undefined) {
                buttonText = "Update"

                $('#nation-name').val(Nation.get('Name'))
                $('#community-code').val(Nation.get('Code'))
                $('#nation-url').val(Nation.get('Url'))
                $('#org-name').val(Nation.get('SponserName'))
                $('#org-sponseraddress').val(Nation.get('SponserAddress'))
                $('#org-firstname').val(Nation.get('ContactFirstname'))

                $('#org-middlename').val(Nation.get('ContactMiddlename'))
                $('#org-lastname').val(Nation.get('ContactLastname'))

                $('#org-phone').val(Nation.get('ContactPhone'))
                $('#org-email').val(Nation.get('ContactEmail'))
                $('#leader-firstname').val(Nation.get('LeaderFirstname'))
                $('#leader-middlename').val(Nation.get('LeaderMiddlename'))
                $('#leader-lastname').val(Nation.get('LeaderLastname'))
                $('#leader-phone').val(Nation.get('LeaderPhone'))
                $('#leader-email').val(Nation.get('LeaderEmail'))
                $('#leader-ID').val(Nation.get('LeaderId'))
                $('#leader-password').val(Nation.get('LeaderPassword'))
                $('#urg-name').val(Nation.get('UrgentName'))
                $('#urg-phone').val(Nation.get('UrgentPhone'))
                $('#auth-name').val(Nation.get('AuthName'))
                $('#auth-date').val(Nation.get('AuthDate'))
            }
            var that = this


        },
        setForm: function() {
            this.model.set({
                Name: $.trim($('#nation-name').val()),
                Code: $.trim($('#community-code').val()),
                Url: $('#nation-url').val(),
                SponserName: $('#org-name').val(),
                SponserAddress: $('#org-sponseraddress').val(),
                ContactFirstname: $('#org-firstname').val(),
                ContactMiddlename: $('#org-middlename').val(),
                ContactLastname: $('#org-lastname').val(),
                ContactPhone: $('#org-phone').val(),
                ContactEmail: $('#org-email').val(),
                LeaderFirstname: $('#leader-firstname').val(),
                LeaderMiddlename: $('#leader-middlename').val(),
                LeaderLastname: $('#leader-lastname').val(),
                LeaderPhone: $('#leader-phone').val(),
                LeaderEmail: $('#leader-email').val(),
                LeaderId: $('#leader-ID').val(),
                LeaderPassword: $('#leader-password').val(),
                UrgentName: $('#urg-name').val(),
                UrgentPhone: $('#urg-phone').val(),
                AuthName: $('#auth-name').val(),
                AuthDate: $('#auth-date').val()
            });

            var context = this;
            $.ajax({
                url: '/community/_design/bell/_view/isDuplicateName?include_docs=true&key="' + context.model.get('Name') + '"',
                type: 'GET',
                dataType: "json",
                async: false,
                success: function(result) {
                    // assumption: if control falls to the success function result.rows will never be undefined. it will value of an array
                    if (result.rows.length > 1) { // if more than one community records with same 'Name' i-e duplicate community Name found in DB
                        alert(App.languageDictValue.attributes.Duplicate_CommunityName_Error);
                        return;
                    } else if (result.rows.length === 0) { // if no duplicates found in DB
                        context.model.save();
                        alert(App.languageDictValue.attributes.Success_Saved_Msg);
                        App.startActivityIndicator();
                        Backbone.history.navigate('listCommunity', {
                            trigger: true
                        });
                        App.stopActivityIndicator();
                    } else { // result.rows.length = 1. one duplicate has been found in db but we need to check sth more, this is not enough
                        // the key, community 'Name' passed into the view did find a matching community and returned it
                        // but we must ensure that the community in DB is not the same i-e both of these do not belong to same community record/document
                        var duplicateCommunityInDB = result.rows[0].doc;
                        if ((context.model.id) && (context.model.id === duplicateCommunityInDB._id)) {
                            // its the same community with some edit(s). not a new one which is has same name as another existing community
                            //                            alert("Same community edit");
                            context.model.save();
                            alert(App.languageDictValue.attributes.Success_Saved_Msg);
                            App.startActivityIndicator();
                            Backbone.history.navigate('listCommunity', {
                                trigger: true
                            });
                            App.stopActivityIndicator();
                        } else {
                            alert(App.languageDictValue.attributes.InValid_CommunityName);
                        }
                    }
                },
                error: function() {
                    alert(App.languageDictValue.attributes.Response_Error);
                }
            });

        }

    })

})