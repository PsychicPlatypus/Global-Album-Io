module Main exposing (..)

import Browser
import Html exposing (Html, a, button, div, h2, i, img, nav, text)
import Html.Attributes exposing (class, href, id, src, style, type_)
import Html.Events exposing (onClick)


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }


init : Model
init =
    { isDataNav = False }



-- Model


type alias Model =
    { isDataNav : Bool
    }



-- Msg


type Msg
    = ToggleDataNav



-- Update


update : Msg -> Model -> Model
update msg model =
    case msg of
        ToggleDataNav ->
            { model | isDataNav = not model.isDataNav }


navLinks : String -> String -> Html msg
navLinks locationName image =
    a [ class "nav-link", href "#" ]
        [ h2 [ class "nav-link-label rubik-font" ] [ text locationName ]
        , img [ class "nav-link-image", src image ] []
        ]


mainCard : Bool -> String -> Html msg
mainCard isNav image =
    let
        changePosition =
            if isNav then
                style "transform" "translateY(-50%)"

            else
                style "" ""
    in
    div [ class "card-container", changePosition, style "background-image" ("url(" ++ image ++ ")") ]
        []


navBar : Bool -> Html msg
navBar isNav =
    let
        changePosition =
            if isNav then
                style "transform" "translateY(0%) scale(1)"

            else
                style "" ""
    in
    nav [ id "nav" ]
        [ div [ id "nav-links", changePosition ]
            [ navLinks "Stockholm" "https://picsum.photos/1600/500"
            , navLinks "Malmo" "https://picsum.photos/1600/500"
            , navLinks "Coppenhagen" "https://picsum.photos/1600/500"
            , navLinks "Lund" "https://picsum.photos/1600/500"
            , navLinks "Helsingborg" "https://picsum.photos/1600/500"
            , navLinks "Hell" "https://picsum.photos/1600/500"
            ]
        ]


view : Model -> Html Msg
view model =
    div []
        [ mainCard model.isDataNav "https://picsum.photos/3840/2160"
        , navBar model.isDataNav
        , button [ id "nav-toggle", type_ "button", onClick ToggleDataNav ]
            [ if model.isDataNav then
                i [ class "close fa-solid fa-xmark" ] []

              else
                i [ class "open fa-solid fa-bars-staggered" ] []
            ]
        ]
