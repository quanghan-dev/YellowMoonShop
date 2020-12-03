<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <title>Yellow Moon Shop</title>
        <!--/tags -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <script>
            addEventListener("load", function () {
                setTimeout(hideURLbar, 0);
            }, false);

            function hideURLbar() {
                window.scrollTo(0, 1);
            }
        </script>
        <!--//tags -->
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/font-awesome.css" rel="stylesheet">
        <!--pop-up-box-->
        <link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
        <!--//pop-up-box-->
        <!-- price range -->
        <link rel="stylesheet" type="text/css" href="css/jquery-ui1.css">
        <!-- fonts -->
        <link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800" rel="stylesheet">
    </head>
    <body>
        <!-- //top-header -->
        <!-- header-bot-->
        <div class="header-bot">
            <div class="header-bot_inner_wthreeinfo_header_mid" >
                <!-- header-bot -->
                <div class="col-md-12 header" style="justify-content: center; text-align: right;">
                    <!-- header lists -->
                    <ul>
                        <c:if test="${requestScope.ADD_CART_SUCCESS != null}">
                            <li>
                                <div class="alert-success" style="margin-left: 5px; font-size: 13px; padding: 5px 0;">${requestScope.ADD_CART_SUCCESS}</div>
                            </li>
                        </c:if>
                        <c:if test="${requestScope.SAVE_CART_MESSAGE != null}">
                            <li>
                                <div class="alert-success" style="margin-left: 5px; font-size: 13px; padding: 5px 0;">${requestScope.SAVE_CART_MESSAGE}</div>
                            </li>
                        </c:if>
                        <c:if test="${requestScope.INVALID_QUANTITY != null}">
                            <li>
                                <div class="alert-danger" style="margin-left: 5px; font-size: 13px; padding: 5px 0;">${requestScope.INVALID_QUANTITY}</div>
                            </li>
                        </c:if>
                        <c:if test="${requestScope.QUANTITY_ERR != null}">
                            <li>
                                <div class="alert-danger" style="margin-left: 5px; font-size: 13px; padding: 5px 0;">${requestScope.QUANTITY_ERR}</div>
                            </li>
                        </c:if>
                        <c:if test="${requestScope.INVALID_DATE != null}">
                            <li>
                                <div class="alert-danger" style="margin-left: 5px; font-size: 13px; padding: 5px 0;">${requestScope.INVALID_DATE}</div>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.ROLE != 'admin'}">
                            <li style="padding: 0;">
                                <button class="w3view-cart" data-toggle="modal" data-target="#myModal3" value="" style="font-size: 20px; height: 36px; width: 90%; border-radius: 25px;">
                                    <i class="fa fa-cart-arrow-down" aria-hidden="true"></i>
                                </button>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.ROLE eq 'user'}">
                            <li>
                                <!-- data-toggle="modal" data-target="#myModal1"  -->
                                <a href="#" style="font-size: 16px;">
                                    <span class="fa fa-truck" aria-hidden="true"></span>Track Order</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.ROLE eq 'admin'}">
                            <li>
                                <a href="#" data-toggle="modal" data-target="#myModal2" style="font-size: 16px;">
                                    <span class="fa fa-plus" aria-hidden="true"></span>Create Cake</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.USER == null}" var="checkLogin">
                            <li>
                                <a href="#" data-toggle="modal" data-target="#myModal1" style="font-size: 16px;">
                                    <span class="fa fa-unlock-alt" aria-hidden="true"></span> Sign In </a>
                                    <c:if test="${requestScope.INVALID != null}">
                                    <br/><div class="alert-danger" style="font-size: 14px;">${requestScope.INVALID}</div></c:if>
                                </li>
                        </c:if>
                        <c:if test="${!checkLogin}">
                            <li>
                                <div class="dropdown" style="font-size: 16px;">
                                    <form action="LOGOUT" method="post">
                                        <button class="dropdown-toggle" data-toggle="dropdown" type="button" 
                                                style="border: none; background: #FFF;">
                                            <span class="fa fa-user"></span>
                                            ${sessionScope.USER.name}
                                            <span class="caret"></span>
                                        </button>
                                        <div class="dropdown-menu"><span class="fa fa-sign-out"></span><input type="submit" value="Log Out"></div>
                                    </form>
                                </div>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Sign Up -->
        <div class="modal fade" id="myModal1" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body modal-body-sub_agile">
                        <div class="main-mailposi">
                            <span class="fa fa-envelope-o" aria-hidden="true"></span>
                        </div>
                        <div class="modal_body_left modal_body_left1">
                            <h3 class="agileinfo_sign">Sign In </h3>
                            <p>
                                Sign In now, Let's start your Moon Cake Shopping.
                            </p>
                            <form action="LOGIN" method="post">
                                <div class="styled-input agile-styled-input-top">
                                    <input type="email" placeholder="Email" name="txtEmail" required value="${requestScope.EMAIL}" id="email">
                                </div>
                                <div class="styled-input">
                                    <input type="password" placeholder="Password" name="txtPassword" required id="password">
                                </div>
                                <input type="submit" value="Sign In">
                            </form>
                            <div class="clearfix"></div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Add Cake -->
        <div class="modal fade" id="myModal2" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body modal-body-sub_agile">
                        <div class="modal_body_left modal_body_left1">
                            <h3 class="agileinfo_sign">Add Cake</h3>
                            <form action="ADD_CAKE" method="post" enctype="multipart/form-data">
                                <div class="styled-input agile-styled-input-top">
                                    <label for="CakeName">Name</label>
                                    <input type="text" placeholder="Name of cake" name="txtName" required value="${requestScope.CAKE.name}" id="CakeName">
                                </div>
                                <div class="styled-input">
                                    <label for="Price">Price (VND)</label>
                                    <input type="number" min="0" step="any" placeholder="Price" name="txtPrice" required value="${requestScope.CAKE.price}" id="Price">
                                </div>
                                <div class="styled-input agile-styled-input-top">
                                    <label for="Description">Description</label>
                                    <input type="text" placeholder="Description" name="txtDescription" required value="${requestScope.CAKE.description}" id="Description">
                                </div>
                                <div class="styled-input">
                                    <label for="numberOfCake">Number</label>    
                                    <input type="number" min="0" step="1" placeholder="Quantity" name="txtQuantity" required value="${requestScope.CAKE.quantity}"id="numberOfCake">
                                </div>
                                <div class="styled-input">
                                    <label for="CreateDate">Create Date</label>
                                    <input type="date" name="txtCreateDate" required value="${requestScope.CAKE.createDate}" id="CreateDate">
                                </div>
                                <div class="styled-input">
                                    <label for="ExDate">Expiration Date</label>
                                    <input type="date" name="txtExDate" required value="${requestScope.CAKE.expirationDate}" id="ExDate" min="${param.txtCreatedDate}">
                                </div>
                                <div class="styled-input" style="padding: 10px 0;">
                                    <label for="category">Category</label>
                                    <select name="category" id="category">
                                        <c:forEach items="${sessionScope.LIST_CATEGORY}" var="category">
                                            <option value="${category.categoryID}">${category.categoryName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="styled-input">
                                    <label for="Image">Image</label>
                                    <input id="file-upload" type="file" name="txtImage" accept=".png, .jpeg, .jpg" id="Image"/>                               
                                </div>
                                <input type="submit" value="Add Cake">
                            </form>
                            <div class="clearfix"></div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <!-- //Modal content-->
            </div>
        </div>

        <!-- View Cart -->
        <div class="modal fade" id="myModal3" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body modal-body-sub_agile">
                        <div class="modal_body_left modal_body_left1">
                            <c:if test="${sessionScope.CART != null}" var="checkCart">
                                <h3 class="agileinfo_sign">Your cart ^^</h3>

                                <c:forEach items="${sessionScope.CART.cart}" var="cart" varStatus="counter">
                                    <div style="width: 100%; display: flex;">
                                        <form action="UPDATE_CART" method="post" style="width: 90%;" id="formUpdateQuantity_${counter.count}" class="updateQuantityInCart">
                                            <div style="width: 100%; display: flex;">
                                                <div style="width: 65%; padding: 5px 2px; background: #efefef; margin: 5px 0; display: flex;">
                                                    <font class="styled-input" style="padding: 10px 10px;">${cart.key.name}</font>
                                                </div>
                                                <div style="width: 10%; padding: 5px 2px; background: #efefef; margin: 5px 0;">
                                                    <input type="number" min="1" name="txtQuantity" style="margin-bottom: 0;" value="${cart.value}">
                                                </div>
                                                <div style="width: 25%; padding: 5px 2px; background: #efefef; margin: 5px 0; display: flex;">
                                                    <font class="styled-input" style="padding: 10px 10px; text-align: right; width: 100%;"><fmt:formatNumber value="${cart.key.price}" minFractionDigits="0" maxFractionDigits="0"/> &#8363;</font>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <input type="hidden" name="type" value="Quantity"/>
                                            <input type="hidden" name="cakeID" value="${cart.key.cakeID}"/>
                                            <input type="submit" value="" style="display: none;">
                                        </form>
                                        <div style="width: 10%; padding: 5px 2px; background: #efefef; margin: 5px 0; display: flex; justify-content: center;">
                                            <form action="UPDATE_CART" method="post" id="formDelete_${counter.count}" class="deleteCakeInCart">
                                                <button type="button" class="btnDelete" style="border: none; padding: 5px 2px; margin: 5px 0;">
                                                    <i class="fa fa-trash"></i>
                                                </button>
                                                <input type="hidden" name="cakeID" value="${cart.key.cakeID}"/>
                                                <input type="hidden" name="type" value="Delete"/>
                                            </form>
                                        </div>
                                    </div>
                                </c:forEach>
                                <script type="text/javascript">
                                    let updateForms = document.querySelectorAll('form[class=updateQuantityInCart]');
                                    for (let i = 0; i < updateForms.length; i++) {
                                        updateForms[i].addEventListener('keypress', function (e) {
                                            if (e.key === 'Enter') {
                                                let formUpdateID = "formUpdateQuantity_" + (i + 1);
                                                document.getElementById(formUpdateID).submit();
                                            }
                                        });
                                    }
                                    ;
                                    let deleteForms = document.querySelectorAll('form[class=deleteCakeInCart]');
                                    for (let i = 0; i < deleteForms.length; i++) {
                                        deleteForms[i].addEventListener('click', function () {
                                            let confirmed = confirm("Are you sure you want to delete this cake?");
                                            if (confirmed) {
                                                let formDeleteID = "formDelete_" + (i + 1);
                                                document.getElementById(formDeleteID).submit();
                                            }
                                        });
                                    }
                                    ;
                                </script>
                                <div style="margin: 10px 0; display: flex; width: 100%">
                                    <label>Total: <fmt:formatNumber value="${sessionScope.TOTAL}" minFractionDigits="0" maxFractionDigits="0"/> &#8363;</label>
                                </div>
                                <button type="submit" value="" style="width: 100%; border: none; font-size: 16px; padding: 5px 5px; margin-top: 10px;background: #FF8964; color: #FFF;" data-toggle="modal" data-target="#myModal4">
                                    <span class="span">Confirm</span>
                                </button>
                                <div class="clearfix"></div>
                            </c:if>
                            <c:if test="${!checkCart}">
                                <div class="modal_body_left modal_body_left1">
                                    <p>Your cart is empty now :(</p>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="myModal4" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body modal-body-sub_agile">
                        <div class="modal_body_left modal_body_left1">
                            <h3 class="agileinfo_sign">Order Info</h3>
                            <form action="SAVE_CART" method="post">
                                <div class="styled-input agile-styled-input-top">
                                    <input type="text" placeholder="Name" name="txtNameCart" required value="${sessionScope.USER.name}">
                                </div>
                                <div class="styled-input">
                                    <input type="text" maxlength="20" placeholder="Phone Number (10 digits)" name="txtPhone" pattern="[0-9]{10}"required value="${sessionScope.USER.phoneNum}">
                                </div>
                                <div class="styled-input">
                                    <input type="text" placeholder="Address" name="txtAddress" required value="${requestScope.ADDRESS}">
                                </div>
                                Payment: <select name="payment" id="category">
                                    <option value="Cash">Cash</option>
                                    <option value="Card">Card</option>
                                </select>

                                <input type="submit" value="ORDER" style="width: 100%;">
                            </form>
                            <div class="clearfix"></div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="ads-grid">
            <div class="container">
                <!-- //tittle heading -->
                <!-- product left -->
                <div class="side-bar col-md-3">
                    <div class="search-hotel">
                        <h3 class="agileits-sear-head">Search Here..</h3>
                        <form action="SEARCH" method="post">
                            <input type="text" placeholder="Product name..." name="txtSearch" style="width: 81%; font-size: 13px; border: none; padding: 11px 10px;" value="${requestScope.TXT_SEARCH}">
                            <input type="hidden" value="name" name="searchType">
                            <input type="submit" value=" ">
                        </form>
                    </div>
                    <div class="left-side">
                        <h3 class="agileits-sear-head">Price</h3>
                        <div class="search-hotel">
                            <form action="SEARCH" method="post">
                                <div style="width: 100%;">
                                    <input type="number" name="From" placeholder="From" min="0" required value="${requestScope.FROM}" style="width: 100%; padding: 5px 5px; margin-bottom: 10px; border: none;">
                                </div>
                                <div style="width: 100%;">
                                    <input type="number" name="To" placeholder="To" min="${param.From}" required value="${requestScope.TO}"style="width: 100%; padding: 5px 5px; margin-bottom: 10px; border: none;">
                                    <input type="hidden" value="price" name="searchType">
                                </div>
                                <div style="width: 100%; text-align: right;">
                                    <input type="submit" value=""/>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- //price -->

                    <!-- cuisine -->
                    <div class="left-side">
                        <h3 class="agileits-sear-head">Categories</h3>
                        <ul>
                            <c:forEach items="${sessionScope.LIST_CATEGORY}" var="category">
                                <li>
                                    <form action="SEARCH" method="post">
                                        <button type="submit"name="searchByCategory" value="${category.categoryID}" style="width: 100%; border: none; font-size: 16px; padding: 5px 5px; margin-bottom: 10px;
                                                <c:if test="${requestScope.CATEGORY eq category}">background: #FF8964; color: #FFF;</c:if>">
                                                    <input type="hidden" value="category" name="searchType">
                                                    <span class="span">${category.categoryName}</span>
                                        </button>
                                    </form>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <!-- //cuisine -->

                </div>
                <!-- //product left -->
                <!-- product right -->
                <div class="agileinfo-ads-display col-md-9">
                    <div class="wrapper">
                        <!-- first section (nuts) -->
                        <div class="product-sec1">
                            <c:if test="${not empty requestScope.LIST_CAKE}" var="checkListCake">
                                <c:if test="${requestScope.SEARCH_TYPE eq 'category'}" var="check">
                                    <h3 class="heading-tittle">${requestScope.CATEGORY.categoryName}</h3>
                                </c:if>
                                <c:if test="${!check}">
                                    <h3 class="heading-tittle">Newest</h3>
                                </c:if>
                                <c:forEach items="${requestScope.LIST_CAKE}" var="cake">
                                    <div class="col-md-4 product-men" style="max-height: 322px; max-width: 261.66px;">
                                        <div class="men-pro-item simpleCart_shelfItem">
                                            <div class="men-thumb-item">
                                                <img src="images/${cake.picture}" alt="" style="width: 80%; min-height: 148px;">
                                                <div class="men-cart-pro">
                                                    <div class="inner-men-cart-pro">
                                                        <a href="#" class="link-product-add-cart">Quick View</a>
                                                    </div>
                                                </div>
                                                <span class="product-new-top">New</span>
                                            </div>
                                            <div class="item-info-product ">
                                                <h4>
                                                    <a href="single.html">${cake.name}</a>
                                                </h4>
                                                <div class="info-product-price">
                                                    <span class="item_price"><fmt:formatNumber value="${cake.price}" minFractionDigits="0" maxFractionDigits="0"/> &#8363;</span><br/>
                                                    <del><fmt:formatNumber value="${cake.price + cake.price*10/100}" minFractionDigits="0" maxFractionDigits="0"/> &#8363;</del>
                                                </div>
                                                    <c:if test="${sessionScope.ROLE != 'admin'}" var="checkRole">
                                                    <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                                                        <form action="CART" method="post">
                                                            <input type="hidden" name="cakeID" value="${cake.cakeID}" />
                                                            <input type="hidden" name="searchType" value="${requestScope.SEARCH_TYPE}">
                                                            <input type="hidden" name="txtSearch" value="${param.txtSearch}">
                                                            <input type="hidden" name="From" value="${param.From}">
                                                            <input type="hidden" name="To" value="${param.To}">
                                                            <input type="hidden" name="searchByCategory" value="${requestScope.CATEGORY.categoryID}">
                                                            <input type="submit" name="submit" value="Add to cart" class="button"/>
                                                        </form>
                                                    </div>
                                                </c:if>
                                                    <c:if test="${!checkRole}">
                                                        <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out"><form action="#"><input class="button" style="background: none;"/></form></div>
                                                    </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <c:if test="${!checkListCake}">
                                <div class="alert-danger" style="text-align: center;">No Cake Found</div>
                            </c:if>
                            <div class="clearfix"></div>
                            <div style="text-align: center;">
                                <c:if test="${requestScope.LIST_CAKE != null}">
                                    <c:if test="${not empty requestScope.LIST_CAKE}">
                                        <ul class="pagination justify-content-center">
                                            <c:forEach begin="1" end="${requestScope.CAKE_COUNT}" varStatus="counter">
                                                <c:url value="SEARCH" var="pageNum">
                                                    <c:param name="pageID" value="${counter.count}"/>
                                                    <c:if test="${requestScope.SEARCH_TYPE eq 'name'}">
                                                        <c:param name="txtSearch" value="${param.txtSearch}"/>
                                                        <c:param name="searchType" value="name"/>
                                                    </c:if>
                                                    <c:if test="${requestScope.SEARCH_TYPE eq 'price'}">
                                                        <c:param name="searchType" value="price"/>
                                                    </c:if>
                                                    <c:if test="${requestScope.SEARCH_TYPE eq 'category'}">
                                                        <c:param name="searchType" value="category"/>
                                                    </c:if>
                                                </c:url>
                                                <li class="page-item
                                                    <c:if test="${requestScope.CURRENT_PAGE == counter.count}">
                                                        active
                                                    </c:if>">
                                                    <a class="page-link" href="${pageNum}">${counter.count}</a>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </c:if>
                                </c:if> 
                            </div>
                        </div>
                    </div>
                </div>
                <!-- //product right -->
            </div>
        </div>
        <!-- //top products -->
        <!-- js-files -->
        <!-- jquery -->
        <script src="js/jquery-2.1.4.min.js"></script>
        <!-- //jquery -->

        <!-- popup modal (for signin & signup)-->
        <script src="js/jquery.magnific-popup.js"></script>
        <script>
                                    $(document).ready(function () {
                                        $('.popup-with-zoom-anim').magnificPopup({
                                            type: 'inline',
                                            fixedContentPos: false,
                                            fixedBgPos: true,
                                            overflowY: 'auto',
                                            closeBtnInside: true,
                                            preloader: false,
                                            midClick: true,
                                            removalDelay: 300,
                                            mainClass: 'my-mfp-zoom-in'
                                        });
                                    });
        </script>

        <script src="js/jquery.flexisel.js"></script>
        <script>
                                    $(window).load(function () {
                                        $("#flexiselDemo1").flexisel({
                                            visibleItems: 3,
                                            animationSpeed: 1000,
                                            autoPlay: true,
                                            autoPlaySpeed: 3000,
                                            pauseOnHover: true,
                                            enableResponsiveBreakpoints: true,
                                            responsiveBreakpoints: {
                                                portrait: {
                                                    changePoint: 480,
                                                    visibleItems: 1
                                                },
                                                landscape: {
                                                    changePoint: 640,
                                                    visibleItems: 2
                                                },
                                                tablet: {
                                                    changePoint: 768,
                                                    visibleItems: 2
                                                }
                                            }
                                        });
                                    });
        </script>

        <script src="js/SmoothScroll.min.js"></script>
        <!-- //smoothscroll -->

        <!-- start-smooth-scrolling -->
        <script src="js/move-top.js"></script>
        <script src="js/easing.js"></script>
        <script>
                                    jQuery(document).ready(function ($) {
                                        $(".scroll").click(function (event) {
                                            event.preventDefault();
                                            $('html,body').animate({
                                                scrollTop: $(this.hash).offset().top
                                            }, 1000);
                                        });
                                    });
        </script>
        <!-- //end-smooth-scrolling -->

        <!-- smooth-scrolling-of-move-up -->
        <script>
            $(document).ready(function () {
                /*
                 var defaults = {
                 containerID: 'toTop', // fading element id
                 containerHoverID: 'toTopHover', // fading element hover id
                 scrollSpeed: 1200,
                 easingType: 'linear' 
                 };
                 */
                $().UItoTop({
                    easingType: 'easeOutQuart'
                });
            });
        </script>
        <!-- //smooth-scrolling-of-move-up -->

        <!-- for bootstrap working -->
        <script src="js/bootstrap.js"></script>
        <!-- //for bootstrap working -->
        <!-- //js-files -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>

    </body>

</html>