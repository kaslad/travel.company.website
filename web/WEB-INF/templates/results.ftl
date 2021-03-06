<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="js/jquery-3.2.1.min.js"></script>
    <link href="css/bootstrap.css" type="text/css" rel="stylesheet">
    <script src="js/jquery-ui-1.12.1/"></script>
    <script src="js/bootstrap.js"></script>
    <link href="css/main-style.css" type="text/css" rel="stylesheet">
    <link href="js/jquery-ui-1.12.1/jquery-ui.css" type="text/css" rel="stylesheet">
    <script src="js/jquery-ui-1.12.1/jquery-ui.js"></script>
    <script src="js/main-page-script.js"></script>
    <script src="js/onshowscript.js"></script>
    <script src="js/imageopen.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<#include "base_nav.ftl">

<div class="col-lg-10 col-lg-offset-2">
    <div class="content">
        <div id="search">
            <form class="form-group" method="get">
                <div class="way-group">
                    <div class="col-lg-6 col-md-6">
                        <input class="form-control" type="text" id="form-from-place" placeholder="Where from..."
                               name="from_city" hint="Where from...">
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <input class="form-control" type="text" id="form-to-place"
                               placeholder="Where to..." name="to_city" hint="Where to...">
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 time-group">
                    <input class="form-control" type="datetime" id="form-from-date"
                           placeholder="From..." name="from_date" hint="From..." readonly>
                    <input class="form-control" type="datetime" id="form-to-date"
                           placeholder="To..." name="to_date" hint="To..." readonly>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="col-lg-6 col-md-6">
                        <div class="money-group">
                            <div id="slider"><input name="price" value="0-300" style="display: none"></div>
                            <h3 id="amount" class="centered"></h3>
                        </div>
                    </div>
                </div>
                <div class="full">
                    <input type="submit" value="Search" id="srch" class="form-control">
                </div>
            </form>
        </div>


        <div class="results">
            <ul class="result-list">
            <#if list?has_content>
                <#list list as prop>
                    <li class="well container out-li row" data-toggle="collapse" data-target="#${prop.key.tour.id}">
                        <div class="col-lg-3 col-md-3">
                            <img src="static/hotel.jpg" class="inner-img image">
                        </div>
                        <div class="col-lg-6 col-md-6">

                            <a class="title" href="">${prop.key.tour.fromCity} &rarr; ${prop.key.tour.toCity}</a>
                            <div><a class="htl" href="">${prop.key.hotel.name}</a></div>
                            <#if prop.key.hotel.description?has_content>
                                <button toggled="false"
                                        class="btn-toggle">Main features <span class="caret"></span></button>
                                <ul style="list-style: outside" class="feats collapse" h="0">
                                    <li>${prop.key.hotel.description}</li>
                                </ul>
                            </#if>

                        </div>

                        <div class="col-lg-3 col-md-3 inf">
                            <div class="ratio">
                                9.3 &#9733;
                            </div>
                        </div>
                    </li>
                    <#if prop.value?has_content>
                            <ul class="sublist collapse" id=${prop.key.tour.id}>
                                <#list prop.value as concTour>
                                    <li class="well out-li row">
                                        <div class="col-lg-3">
                                            <a href="/tour?conc_tour_id=${concTour.id}" class="title">
                                                <h3>${prop.key.tour.fromCity} &rarr; ${prop.key.tour.toCity}</h3>
                                            </a>
                                        </div>
                                        <div class="col-lg-6">
                                            <ul class="feats sub">
                                                <il>+ Nutrition type: ${concTour.nutritionType}</il>
                                                <li>+ Airline: ${concTour.airline}</li>
                                            </ul>
                                        </div>
                                        <div class="col-lg-3">
                                            <input class="htl price btn" value="${concTour.price}" type="button">

                                        </div>
                                    </li>
                                </#list>
                            </ul>
                        </#if>
                </#list>
            </#if>
            </ul>
        </div>
    </div>
</div>

<div class="image-modal">
    <span class="close">&times;</span>
    <img class="image-modal-content" src="">
</div>
</body>
</html>