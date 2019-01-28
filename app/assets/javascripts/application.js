// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require_tree .
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs

$(function(){

  var menu = $('#slide_menu'), //スライドインするメニューを指定
  menuBtn = $('#button'),
  body = $(document.body),
  menuWidth = menu.outerWidth();  // 要素の外部の幅（borderとpaddingは含める）を取得します。(true)だったらmarginも含める。

  menuBtn.on('click',function(){ //クリックした時、
  body.toggleClass('open'); //bodyにopenクラスを付与する、toggleclass => 指定したclass'open'が要素に無ければ追加し、あれば削除する。
  	if(body.hasClass('open')){ //openクラスが body についてたら
  		body.animate({'left' : menuWidth}, 250); //メニューをスライドインする
  		menu.animate({'left' : 0 }, 250);
  	}else{
  		menu.animate({'left' : -menuWidth},250);  //ついてなかったらスライドアウトさせる
  		body.animate({'left' : 0 }, 250);
  	}
  });
	//スライドメニュー fin


	//検索

//   searchWord = function(){
//     var searchResult,
//         searchText = $(this).val(), // 検索ボックスに入力された
//         targetText,
//         hitNum;

//     // 検索結果を格納するための配列を用意
//     searchResult = [];

//     // 検索結果エリアの表示を空にする
//     $('#search-result__list').empty();
//     $('.search-result__hit-num').empty();

//     // 検索ボックスに値が入ってる場合
//     if (searchText != '') {
//       $('.books_index_box_article').each(function() {
//         targetText = $(this).text();

//         // 検索対象となるリストに入力された文字列が存在するかどうかを判断
//         if (targetText.indexOf(searchText) != -1) {
//           // 存在する場合はそのリストのテキストを用意した配列に格納
//           searchResult.push(targetText);
//         }
//       });

//       // 検索結果をページに出力
//       for (var i = 0; i < searchResult.length; i ++) {
//         $('<ul>').text(searchResult[i]).appendTo('#search-result__list');
//       }

//       // ヒットの件数をページに出力
//       hitNum = '<span>検索結果</span>：' + searchResult.length + '件見つかりました。';
//       $('.search-result__hit-num').append(hitNum);
//     }
//   };

//   // searchWordの実行
//   $('#search-text').on('input', searchWord);
// // 検索 fin


//user_show検索画面

// searchWord = function(){
//   var searchText = $(this).val(),
//       targetText;

//       $('.user_show_bookmark_box_t2 h3').each(function(){
//         targetText = $(this).text();

//         if (targetText.indexOf(searchText)!= -1){
//           $(this).removeClass('hidden');
//         }else{
//           $(this).addClass('hidden');
//         }
//       });
//   };
//   $('#search-text').on('input',searchWord);





//user_show検索 fin

//backボタン
  $('#back a').on('click',function(){
    $('body, html').animate({
      scrollTop:0
    }, 1500);
      return false;
  });



// //自動スクロール
// var option = {
//   section : '.js-section', // 対象を指定
//   easing: "swing", // イージングをしてい(jQueryのanimation)
//   scrollSpeed: 600, // スクロール時の速度
//   scrollbars: true, // スクロールバーを表示するか
// };

// $(function() {
//   $.scrollify(option); // scrollifyの実行
// });



//load画面
$(window).load(function(){
  $('.loading').fadeOut();
});


//books_show コメント画面
$('#book_show_tab_contents .tab[id !="tab1"]').hide();
$('#book_show_tab-menu a').on('click', function(){
  $("#book_show_tab_contents .tab").hide();
  $("#book_show_tab-menu .active").removeClass("active");
  $(this).addClass("active");
  $($(this).attr("href")).show();
  return false;
});







//books_indexの画像切り替わり
function slideSwitch() {
   var $active = $('#slideshow p.active');

   if ( $active.length == 0 ) $active = $('#slideshow p:last');

   var $next =  $active.next().length ? $active.next()
      : $('#slideshow p:first');

   $active.addClass('last-active');

   $next.css({opacity: 0.0})
      .addClass('active')
      .animate({opacity: 1.0}, 1000, function() {
         $active.removeClass('active last-active');
      });
}

$(function() {
   setInterval( "slideSwitch()", 5000 );
});



//books_indexカテゴリ切り替え

$('#books_index_bookmarks2 .index_tab[id != "tab1"]').hide();
 
$('#books_index_tab-menu a').on('click', function() {
  $("#books_index_bookmarks2 .index_tab").hide();
  $("#books_index_tab-menu .active").removeClass("active");
  $(this).addClass("active");
  $($(this).attr("href")).show();
  return false;
});

//books_indexカテゴリ切り替え　fin



});


// $(function(){
//   $('.like_btn').on('click',function(){
//     var $likeBtn = $(this);
//     var $postId = $likeBtn.attr("book_id");
//     var $like = $(this).find('i');
//     var $btnClass = $like.attr("class");

//     var url = $btnClass == 'far fa-heart unlike' ? '/create' : '/destroy';

//     $.ajax({
//       url: '/favorites/'+ $postId + url,
//       type:'POST',
//     }).done(function(data){
//       if($like.hasClass('unlike')){
//         $like.removeClass('far unlike').addClass('fas like');
//       }else{
//         $like.removeClass('fas like').addClass('far unlike');
//       }
//     });
//   });
// });