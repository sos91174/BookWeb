<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/2/8
  Time: 14:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--分頁的開始--%>
<div id="page_nav">
    <%--首頁顯示設定--%>
    <c:if test="${requestScope.page.pageNo > 1}">
        <a href="${ requestScope.page.url }&pageNo=1">首頁</a>
        <a href="${ requestScope.page.url }&pageNo=${requestScope.page.pageNo-1}">上一頁</a>
    </c:if>
    <%--頁數輸出設定--%>
    <c:choose>
        <%--狀況1：如果總頁碼小於等於5的情況，頁數的範圍是：1-總頁數--%>
        <c:when test="${ requestScope.page.pageTotal <= 5 }">
            <c:set var="begin" value="1"/>
            <c:set var="end" value="${requestScope.page.pageTotal}"/>
        </c:when>
        <%--情況2：總頁數大於5的情況--%>
        <c:when test="${requestScope.page.pageTotal > 5}">
            <c:choose>
                <%--小情況1：當前頁數為前面3個：1，2，3的情況，頁數範圍是：1-5.--%>
                <c:when test="${requestScope.page.pageNo <= 3}">
                    <c:set var="begin" value="1"/>
                    <c:set var="end" value="5"/>
                </c:when>
                <%--小情況2：當前頁數為最後3個，8，9，10，頁數範圍是：總頁數減4 - 總頁數--%>
                <c:when test="${requestScope.page.pageNo > requestScope.page.pageTotal-3}">
                    <c:set var="begin" value="${requestScope.page.pageTotal-4}"/>
                    <c:set var="end" value="${requestScope.page.pageTotal}"/>
                </c:when>
                <%--小情況3：4，5，6，7，頁數範圍是：當前頁數減2 - 當前頁數加2--%>
                <c:otherwise>
                    <c:set var="begin" value="${requestScope.page.pageNo-2}"/>
                    <c:set var="end" value="${requestScope.page.pageNo+2}"/>
                </c:otherwise>
            </c:choose>
        </c:when>
    </c:choose>

    <c:forEach begin="${begin}" end="${end}" var="i">
        <c:if test="${i == requestScope.page.pageNo}">
            【${i}】
        </c:if>
        <c:if test="${i != requestScope.page.pageNo}">
            <a href="${ requestScope.page.url }&pageNo=${i}">${i}</a>
        </c:if>
    </c:forEach>
    <%--頁數輸出結束--%>


    <%-- 如果已經 是最後一頁，則不顯示下一页，最後一頁 --%>
    <c:if test="${requestScope.page.pageNo < requestScope.page.pageTotal}">
        <a href="${ requestScope.page.url }&pageNo=${requestScope.page.pageNo+1}">下一頁</a>
        <a href="${ requestScope.page.url }&pageNo=${requestScope.page.pageTotal}">最後一頁</a>
    </c:if>

    共${ requestScope.page.pageTotal }頁，目前總共有${ requestScope.page.pageTotalCount }個商品
    到第<input value="${param.pageNo}" name="pn" id="pn_input"/>頁
    <input id="searchPageBtn" type="button" value="確定">

    <script type="text/javascript">

        $(function () {
            // 跳到指定的頁數
            $("#searchPageBtn").click(function () {

                var pageNo = $("#pn_input").val();

                <%--var pageTotal = ${requestScope.page.pageTotal};--%>
                <%--alert(pageTotal);--%>

                // javaScript語言中提供了一個location地址欄對象
                // 它有一個属性叫href.它可以獲取瀏覽器地址欄中的地址
                // href屬性可讀可寫
                location.href = "${pageScope.basePath}${ requestScope.page.url }&pageNo=" + pageNo;

            });
        });

    </script>

</div>
<%--分頁结束--%>


