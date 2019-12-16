<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!doctype html>
<html>
<head>
<title>${pageName}</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<link rel="icon" href="/resources/img/head.png" />
<style>
html {
    height: 100%;
}
body {
    height: 100%;
    margin: 0;
}

body {
    font-family: "Helvetica Neue";
    font-size: 20px;
    font-weight: normal;
}

section {
    max-width: 450px;
    margin: 50px auto;
}

.speech-buble {
    position: fixed;
    margin: 0 auto;
    margin-left: 250px;
    margin-top: 15px;



    max-width: 255px;
    max-width: 160px;
    word-wrap: break-word;
    margin-bottom: 20px;
    line-height: 24px;
    
    /*position: relative;*/
    padding: 10px 20px;
    padding: 0px 15px;
    color: white;
    background: #0B93F6;;
    border-radius: 25px;
    float: right;
}
.speech-buble:before {
    content: "";
    position: absolute;
    z-index: 2;
    bottom: -2px;
    left: -7px;
    height: 20px;
    border-left: 20px solid #0B93F6;;
    border-bottom-right-radius: 16px 14px;
    -webkit-transform: translate(0, -2px);
}
.speech-buble:after {
    content: "";
    position: absolute;
    z-index: 3;
    bottom: -2px;
    left: 4px;
    width: 26px;
    height: 20px;
    background: white;
    border-bottom-right-radius: 10px;
    -webkit-transform: translate(-30px, -2px);
}

.speech-buble p {
    margin: 10px 0;
}
</style>
</head>
<body>
<div style="height: 100%;  max-width: 440px; width: 100%; margin: 0 auto;">
    <img id="speaking-joo" src="/resources/img/joo_with_jacket.png" width="50%" style="position: fixed; margin: 0 auto; max-width: 220px;">
    <div class="speech-buble">
        <p>Wow! It's speech buble!<br/>Joo you are a very talented developer.</p>
    </div>

    <div class="speech-buble" style="margin-top: 300px;">
        <p>It's really awesome!<br/>Joo you are a very talented developer2222</p>
    </div>

    <div style="height: 100%; width: 100%; background-color: rgb(255, 255, 255, 0.5); float: right;"></div>
    <div style="height: 100%; width: 100%; background-color: rgb(0, 255, 255, 0.5); float: right;">green</div>
    <div style="height: 100%; width: 100%; background-color: rgb(255, 0, 255, 0.5); float: right;">red</div>
    <div style="height: 100%; width: 100%; background-color: rgb(255, 255, 0, 0.5); float: right;">yellow</div>
    <div style="height: 100%; width: 100%; background-color: rgb(0, 0, 255, 0.5); float: right;">blue</div>
    <div style="height: 100%; width: 100%; background-color: rgb(0, 255, 0, 0.5); float: right;">green</div>
    <div style="height: 100%; width: 100%; background-color: rgb(255, 0, 0, 0.5); float: right;">red</div>
    <div style="height: 100%; width: 100%; background-color: rgb(0, 0, 0, 0.5); float: right;">black</div>
</div>
<script>
//alert(window.innerHeight);
//alert(window.innerWidth);

window.onload=function() {
    var speechBubles = document.getElementsByClassName("speech-buble");

    if(window.innerWidth < 440) {    
        for(var i = 0; i < speechBubles.length; i++) {
            speechBubles[i].style.maxWidth = (window.innerWidth / 2) - 60 + 'px';
            speechBubles[i].style.marginLeft = (window.innerWidth / 2) + 20 + 'px';
            speechBubles[i].style.display = 'none';
        }
    }

    document.getElementById('speaking-joo').style.marginTop = (speechBubles[0].getBoundingClientRect().top + speechBubles[0].clientHeight) / 3 * 2 + 'px';

    window.on('scroll', function() {
        var scrollTop = window.scrollY || document.documentElement.scrollTop;
        if(scrollTop > window.innerHeight) {
            alert("good");
        }
    });


}





</script>
</body>

</html>