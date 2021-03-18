<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>E-kuru</title>
  <link rel="shortcut icon" href="../resources/img/HatchfulExport-All/ekuru_logo.ico">
  <link rel="stylesheet" href="../resources/font/NotoSansCJKjp-Black.otf">
  <link rel="stylesheet" href="../resources/css/header_Origin.css">
  <link rel="stylesheet" href="../resources/css/main-footer.css">
  <link rel="stylesheet" href="../resources/css/request-readForm.css">
  <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-grid.css">
  <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-reboot.css">
  <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
    body {
      margin: 0;
      background-color: #FFDFB9;
    }

    * {
      font-family: 'NotoSansCJKjp-Black', sans-serif;
      box-sizing: border-box;
    }
    #imgsize{
    	width: 570px;
    	height: 380px;
    }
  </style>
  <script type="text/javascript">
	function openRequestMain(){
		location.href="/request/request_main";
	}
	function openRewriteForm(reqNum){
		location.href="/request/request_rewriteForm?reqNum="+reqNum;
	}
	function deleteComment(reqCommentNum){
		location.href="/request/request_deleteComment?reqCommentNum="+reqCommentNum;
	}
	function deleteReadForm(reqNum){
		location.href="/request/request_deleteRequest?reqNum="+reqNum;
	}
  </script>
  
</head>

<body>
   <!-- header -->
    <header class="header---">
        <div class="wrapper">
            <a href="/">
                <img src="../resources/img/HatchfulExport-All/ekuru_logo.png" style="width: 4%; position: absolute;">
            </a>
            <nav>
                <ul class="menu">
                    <li class="menu-list headli">
                        <a class="menu-a" href="/user/mypageMain">My Page</a>
                        <ul class="menu-sub">
                            <li class="headli">Recently viewed items</li>
                            <li class="headli"><a href="/user/chatForm">My Chat</a></li>
                            <li class="headli"><a class="sub-a"  href="/user/mypagerequest">My Cart</a></li>
                        </ul>
                    </li>
                    <li class="headli"><a class="menu-a" href="/ad/superplan">SPlan?</a></li>
                    <%-- <li class="headli"><a class="menu-a" href="">Board</a></li> --%>
                    <li class="headli"><a class="menu-a" href="/user/mypagePoint">${sessionScope.userPoint }P</a></li>
                    <li class="headli"><a class="menu-a" href="/user/logout">Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <!-- header -->
    <!-- header -->
  <div class="container" style="margin-top: 10%;">
    <hr class="line line-sty" style="margin-top: 5%;">
    <div class="row">
      <!-- 요청글 사진 슬라이드 -->
      <div class="slideshow-container" style="width: 50%; margin-left: 5%;">

        <div class="mySlides fade">
          <div class="numbertext">1 / 3</div>
          <img id="imgsize" src="../resources/upload/file/${vo.getReqOriginalPic1() }" style="width:100%">
        </div>
        
        <div class="mySlides fade">
          <div class="numbertext">2 / 3</div>
          <img id="imgsize" src="../resources/upload/file/${vo.getReqOriginalPic2() }" style="width:100%">
        </div>
        
        <div class="mySlides fade">
          <div class="numbertext">3 / 3</div>
          <img id="imgsize" src="../resources/upload/file/${vo.getReqOriginalPic3() }" style="width:100%">

        </div>
        
        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
        <a class="next" onclick="plusSlides(1)">&#10095;</a>
        
      </div>
      <!-- 요청 설명글 -->
      <div class="card" style="width: 40%;">
        <div class="card-body">
          <h5 class="card-title ">[ ${vo.reqTitle } ]</h5>
          <h6 class="card-subtitle mb-2 text-muted ">ID : ${vo.userId }</h6>
          <h5 class="card-title con-margin" style="margin-top:5%">Information</h5>
          <p class="card-text">> ${vo.reqContent }</p>
        </div>
      </div>
    </div>
    <hr class="line line-sty">
    <!-- 댓글 입력창 -->
    <form action="/request/request_comment?reqNum=${vo.reqNum }" method="post">
	    <div class="row mb-3">
	      <input type="text" name="reqComment" class="form-control comment-sty" id="exampleFormControlInput1" placeholder="Leave your comment">
	      <button type="submit" class="btn btn-secondary btn-sty">comment</button>
	    </div>
    </form>
    <!-- 구분선 -->
    <hr class="line">
    <!-- 댓글창 -->
    <c:forEach var="comment" items="${comment }">
	    <div class="card comtWrite-sty">
	      <div class="card-body">
	        <div class="row justify-content-between">
	          <h5 class="card-title col-4">${comment.userId }</h5>
	          <c:if test="${sessionScope.userId ==comment.userId }">
	         	<button type="button" class="btn btn-outline-danger col-4-sm" style="margin-left: 40%" onclick="deleteComment('${comment.reqCommentNum }');">Delete</button>
	          </c:if>
	          
	          <c:if test="${sessionScope.userId ==vo.userId }">
		          <button type="button" class="btn btn-outline-danger col-4-sm" style="margin-right: 2%;">Request</button>
	          </c:if>
	          
	          <form action="/user/createChat" method="post">
		        <input type="hidden" name="chId" value="${sessionScope.userId }">
		        <input type="hidden" name="userId" value="${vo.userId }">
		      	<input type="submit" class="btn btn-outline-danger col-4-sm" style="margin-right: 2%;" value="Request">
		      </form>
	          
	        </div>
	        <p>${comment.reqComment }</p>
	      </div>
	    </div>
    </c:forEach>

  </div>
  <!-- 리스트로 가기 버튼 -->
  <div class="container" style="text-align: center; margin-top: 5%;">
    <button type="button" class="btn btn-secondary content-center" onclick="openRequestMain();">Go to the List</button>
    <c:if test="${sessionScope.userId==vo.userId }">
      <button type="button" class="btn btn-danger btn-sty" onclick="openRewriteForm('${vo.reqNum}');">Rewrite</button>
      <button type="button" class="btn btn-danger btn-sty" onclick="deleteReadForm('${vo.reqNum}');">Delete</button>
    </c:if>
  </div>
  
  
  <!-- include tag Footer Start -->
  <div class="footer">
    <div class="container">
        <div class="row">
            <div class="col-lg-7">
                <div class="row">
                    <!-- 주소지 -->
                    <div class="col-md-6">
                        <div class="footer-contact">
                            <h2>Our Head Office</h2>
                            <p><i class="fa fa-map-marker-alt"></i>서울 강남구 영동대로 513</p>
                            <p><i class="fa fa-phone-alt"></i>02-6000-0114</p>
                            <p><i class="fa fa-envelope"></i>E-kuru co.</p>
                            <div class="footer-social">
                                <a href=""><i class="fab fa-twitter"></i></a>
                                <a href=""><i class="fab fa-facebook-f"></i></a>
                                <a href=""><i class="fab fa-youtube"></i></a>
                                <a href=""><i class="fab fa-instagram"></i></a>
                                <a href=""><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- 회사 방침 링크 -->
                    <div class="col-md-6">
                        <div class="footer-link">
                            <h2>Quick Links</h2>
                            <a href="">How to use</a>
                            <a href="">Privacy policy</a>
                            <a href="">Help</a>
                            <a href="">FQAs</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 서포트 이메일 받는란 -->
            <div class="col-lg-5">
                <div class="footer-newsletter">
                    <h2>Support us</h2>
                    <p>
                        If you are interested in this business, send your email to us.<br>
                        Thank you for supporting.
                    </p>
                </div>
                <div>
                    <form class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="Email@email.com"
                            aria-label="Email@email.com aria-describedby=" button-addon2">
                        <button class="btn btn-secondary" type="submit" id="button-addon2">submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- 저작권 부분 -->
    <div class="container copyright">
        <div class="row">
            <div class="col-md-6">
                <p>&copy; <a href="#">E-kuru</a>, All Right Reserved.</p>
            </div>
            <div class="col-md-6">
                <p>Designed By <a href="https://htmlcodex.com">HTML Codex</a></p>
            </div>
        </div>
    </div>
</div>
<!-- Footer End -->

</body>
<script>
  var slideIndex = 1;
  showSlides(slideIndex);
  
  function plusSlides(n) {
    showSlides(slideIndex += n);
  }
  
  function currentSlide(n) {
    showSlides(slideIndex = n);
  }
  
  function showSlides(n) {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    if (n > slides.length) {slideIndex = 1}    
    if (n < 1) {slideIndex = slides.length}
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";  
    }
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
  }
  </script>

</html>