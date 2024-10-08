$(window).on("load", function(){
    let posY=0; //pan의 Y좌표값
    let isScroll=false;
    $(".pan").on("wheel",function(e){
        if(isScroll){
            return;
        }
        isScroll=true;
        //console.log(e.originalEvent.deltaY);
        //jQuery하고 js는 방식이 다르다.
        var delta=e.originalEvent.deltaY;   //휠의 방향
        if(delta>0){
            posY-=100;
        }else if(delta<0){
            posY+=100;
        }
        if(posY<-500){
            posY=-500;
        }
        if(posY>0){
            posY=0;
        }
        $(".pan").animate({"top":posY+"%"},{duration:1000, complete:function(){
            isScroll=false;
        }});
        let number = (posY-100)/-100;
        dotAni(number);
    });//마우스 휠에 반응해서 화면을 움직이는 기능

    $(".navi > div").click(function(){
        let data=$(this).attr("id");
        let number=data.charAt(data.length-1);
        posY=(number-1)*-100;
        isScroll=true;
        $(".pan").animate({"top":posY+"%"},{duration:1000, complete:function(){
            isScroll=false;
        }});
        dotAni(number);
    });//네비 클릭 시 해당 위치로 이동하는 기능

    function dotAni(number){
        $(".navi > div").removeClass();
        $(".navi > div:nth-child("+number+")").attr("class","selected");
        //다른요소에 있던 속성을 또다른 요소로 이전시키려면
        //가장 간단한 방법은 모두 지우고 옮길 요소에게 속성을 주면 된다.
    }//네비게이션 깜빡임 처리
});//이 아래로는 아무것도 적지 말것