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
//= require turbolinks
//= require_tree .
//= require jquery
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