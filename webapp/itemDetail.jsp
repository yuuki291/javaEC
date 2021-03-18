<%@ page import="java.util.Iterator"%>
<%@ page import="javaweb.Item"%>
<%@ page import="javaweb.ItemDetailViewModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
   function setVisiblity(isVisible){

	   if(isVisible){
		   document.getElementById('cart-container').style.display = "block";
	   }else{
		   document.getElementById('cart-container').style.display = "none";
	   }
   }
</script>
<style>

 *{
   box-sizing: border-box;
   padding: 0;
  }

 .cart-container{
     height: 100%;
     width: 100%;
     background: rgba(0,0,0,0.5);
     position: absolute;
     top: 0;
     left: 0;
     padding: 1.5rem;
     display: none;
  }
  .shopping-cart{
     height: 100%;
     width: 100%;
     background: rgba(255,255,255,1.0);
     position: relative;
     top: 0;
     left: 0;
     padding: 1.0rem;
  }

  table {
    width: 50%;
    border-collapse: collapse;
  }

  thead tr {
       background-color: #80cfcf;
  }

  td{
     border-bottom: 1px solid #000000;
  }

</style>

</head>


 <body onload="setVisiblity(<%= (Boolean)request.getAttribute("cartVisiblity") %>)">
       <%
        ItemDetailViewModel vm = (ItemDetailViewModel)request.getAttribute(ItemDetailViewModel.class.getSimpleName());
        Item item = vm.itemDetail();
       %>

       <h1><%= item.getProduct_Cd() %></h1>
       <img src = "./img/<%= item.getProduct_Img()%>">
       <h2><%= item.getProduct_Nm() %></h2>
       <b>価格：<%= item.getUnit_Price() %>円</b>
       <div style = "margin:1.0rem 0;"><%= item.getDescription() %></div>


       <div class="cart-container" id="cart-container">
           <div class="shopping-cart">
               <div style="height: 5%; font-weight: bold; font-size: 1.25rem;">ショッピングカート</div>
               <div style="height: 90%; overflow-y: auto;">

                  <table>
                   <thead>
                      <tr>
                         <td>商品コード</td>
                         <td>商品名</td>
                         <td>単価</td>
                      </tr>
                   </thead>

                   <tbody>
                    <%
                     Iterator<Item> iterator = vm.shoppingCart().iterator();
                     while(iterator.hasNext()){
                    	 Item currentItem = iterator.next();
                     %>
                        <tr>
                           <td><%= currentItem.getProduct_Cd() %></td>
                           <td><%= currentItem.getProduct_Nm() %></td>
                           <td><%= currentItem.getUnit_Price() %></td>
                        </tr>
                     <%
                       }
                     %>

                   </tbody>
                  </table>

           </div>
           <div style="height: 5%">
               <button type="button" onclick="setVisiblity(false)">閉じる</button>
           </div>
         </div>
       </div>

       <form method="post" action="addItem">
          <input type="hidden" name="currentItemCd" value="<%= item.getProduct_Cd() %>">
          <button style="margin: 10px 0"type="submit">この商品をカートに追加</button>
       </form>
       <a href = "items.jsp">Back</a>
 </body>
</html>
