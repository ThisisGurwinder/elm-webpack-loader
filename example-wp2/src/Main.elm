module Main exposing (..)

import Html exposing (..)
import Bootstrap.CDN as CDN
import Bootstrap.Grid as Grid
import Bootstrap.Form as Form
import Bootstrap.Form.Checkbox as Checkbox
import Bootstrap.Form.Input as Input
import Bootstrap.Button as Button
import Bootstrap.CDN as CDN
import Html.Attributes exposing (..)
import Html.Events exposing (..)

main : Html Msg
main =
    view "" ""

type Msg
    = EmailUpdated String
    | PasswordUpdated String
    | RememberMeToggled Bool
    | SigninPressed

view : String -> String -> Html Msg
view username password =
    Grid.container []
        [ CDN.stylesheet
        , node "link" [ rel "stylesheet", href "http://v4-alpha.getbootstrap.com/examples/signin/signin.css" ] []
        , Form.form [ class "form-signin" ]
            [ h2 [ class "form-signin-heading" ] [ text "Please sign in" ]
            , label [ class "sr-only", for "inputEmail" ] [ text "Email address" ]
            , Input.email
                [ Input.id "inputEmail"
                , Input.placeholder "Email address"
                , Input.attrs [ required True, autofocus True ]
                , Input.onInput EmailUpdated
                , Input.value username
                ]
            , label [ class "sr-only", for "inputPassword" ] [ text "Password" ]
            , Input.password
                [ Input.id "inputPassword"
                , Input.placeholder "Password"
                , Input.attrs [ required True ]
                , Input.onInput PasswordUpdated
                , Input.value password
                ]
            , Checkbox.checkbox [ Checkbox.onCheck RememberMeToggled ]
                "Remember me"
            , Button.button
                [ Button.large
                , Button.block
                , Button.primary
                , Button.attrs [ type_ "submit", onSubmit SigninPressed ]
                ]
                [ text "Sign in" ]
            ]
        ]
