<%@page import="org.apache.commons.lang3.ObjectUtils"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/jsp/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <style>
    .tab-content{
        display: none;
    }
    .tab-content.active{
        display: block;
    }
    </style>
    <script type="text/javascript">
        function tabDefault() {
            $('.tabs-contents').find('#tabContent1').addClass('active').siblings().removeClass('active');
            x(0,1);
        }

        function tabChange(){
            $('.nav-pills li').click(function () {
                var _id=$(this).attr('data-id');
                $('.tabs-contents').find('#'+_id).addClass('active').siblings().removeClass('active');
                switch (_id) {
                    case "tabContent1":
                        x(1,1);
                        break;
                    case "tabContent2":
                        x(0,2);
                        break;
                    case "tabContent3":
                        x(2,3);
                        break;
                }
            });
        }

        function OperatorInfo(beforeId,afterId) {
            window.location.href = "${context}/review/OperatorInfo?beforeId=" + beforeId+"&afterId="+afterId ;
        }

        function changeAdv(adId, state) {
            window.location.href = "${context}/review/changeAdv?adId=" + adId + "&state=" + state + "&page=${page}";
            alert("审核成功！")
        }

        function changeNew(newsId, state) {
            window.location.href = "${context}/review/changeNew?newsId=" + newsId + "&state=" + state + "&page=${page}";
            alert("操作成功！")
        }
        $.bindViewer(".viewer-item");  //支持绑定到动态生成的元素
        function info(productId,tabNum)
        {
            $('#reviewProductTabInfo'+tabNum).bootstrapTable('destroy');
            $('#reviewProductTabInfo'+tabNum).bootstrapTable({
                url: '${context}/review/getdatarecord?productId='+productId,
                striped: true,
                sortable: true,
                pagination: true,
                showLoading: true,
                sidePagination: "server",
                sortName: "RecordId",
                sortOrder: "desc",
                pageNumber: 1,
                pageSize: 7,
                pageList:[7,14],
                queryParamsType: 'limit',
                queryParams: function (params) {
                    return params;
                },
                onSort: function (name, order) {

                },
                onLoadSuccess: function (data) {

                },
                onLoadError: function (status) {

                },
                columns: [{
                    field:'recordID',
                    title:'记录编号',
                    sortable:true,
                    order:'asc',
                    valign:'middle',
                    align:'center'
                },{
                    field:'userName',
                    title:'操作账户',
                    sortable:true,
                    order:'asc',
                    valign:'middle',
                    align:'center'
                },{
                    field:'operateType',
                    title:'操作类型',
                    sortable:true,
                    order:'asc',
                    valign:'middle',
                    align:'center'
                },{
                    field:'createDate',
                    title:'时间',
                    sortable:true,
                    order:'asc',
                    valign:'middle',
                    align:'center'
                },{
                    field:'comment',
                    title:'意见',
                    sortable:true,
                    order:'asc',
                    valign:'middle',
                    align:'center'
                },]
            })
        }
    </script>
    <script src="${context}/js/jquery/jq.js"></script>
    <script src="${context}/js/jquery/imgViewer.js"></script>

</head>
<body onload="tabDefault()">
    <ul id="checktab" class="nav nav-pills">
        <li class="active" data-id="tabContent1"><a href="#"  onclick="tabChange()" data-toggle="tab">设备商分组2</a></li>
<%--        <li data-id="tabContent2"><a href="#"  onclick="tabChange()" data-toggle="tab" >离线</a></li>
        <li data-id="tabContent3"><a href="#" onclick="tabChange()" data-toggle="tab">欠费</a></li>--%>
    </ul>

<!-- 广告位申请 选项卡-->
    </br>
    <div class="tabs-contents">
        <div class="tab-content" id="tabContent1" style="margin:-10px 10px 5px">
            <table class="table table-hover" id="adsTab1">
            </table>
        </div>
<%--        <div class="tab-content" id="tabContent2">
            <table class="table table-hover" id="adsTab2">
            </table>
        </div>
        <div class="tab-content" id="tabContent3">
            <table class="table table-hover" id="adsTab3">
            </table>
        </div>
    </div>--%>
    <div class="modal fade" id="ShowReviewInfo1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width: 700px">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                </div>
                <div class="modal-body" style="margin-bottom:20px;" id="reviewTabContent" >
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" >
                            <span style="font-size:14px;color:black; font-family:微软雅黑">运营商基本信息</span>
                        </a>
                    </ul>
                    <table  class="table table-hover table-condensed" align="center" style="text-align: center">
                        <tr>
                            <td width="30%" align="right">编号:</td>
                            <td align="left">${clientuser.name}</td>
                        </tr>
                        <tr>

                            <td width="30%" align="right">经销商:</td>
                            <td align="left">${company.companyName}</td>
                        </tr>
                        <tr>

                            <td width="30%" align="right">联系人:</td>
                            <td align="left">${company.legalPerson}</td>
                        </tr>
                        <tr>

                            <td width="30%" align="right">地址:</td>
                            <td align="left" >${company.companyAddress}</td>
                        </tr>
                        <tr>

                            <td width="30%" align="right">联系电话:</td>
                            <td align="left">${company.phoneNumber}</td>
                        </tr>
                        <tr>

                            <td width="30%" align="right">传真:</td>
                            <td align="left">${company.companyFax}</td>
                        </tr>
                        <tr>

                            <td width="30%" align="right">邮箱:</td>
                            <td align="left">${company.companyEmail}</td>
                        </tr>
                    </table>
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" >
                            <span style="font-size:14px;color:black; font-family :微软雅黑">使用统计</span>
                        </a>
                        </li>
                    </ul>
                    <table width="730px" class="table table-hover table-condensed" align=center style="table-layout: fixed">
                        <tr>
                            <td width="80px" align="right">未结算次数:</td>
                            <td width="100px" align="left">${company.legalPerson}</td>
                            <td width="10px" align="left">次</td>
                            <td width="80" align="right">单价:</td>
                            <td width="100" align="left">${company.legalPerson}</td>
                            <td width="10px" align="left">元</td>
                            <td width="80" align="right">金额:</td>
                            <td width="100" align="left">${company.legalPerson}</td>
                            <td width="10px" align="left">元</td>
                        </tr>
                        <tr>
                            <td width="80px" align="right">已结算次数:</td>
                            <td width="100px" align="left">${company.legalPerson}</td>
                            <td width="10px" align="left">次</td>
                            <td width="80" align="right">单价:</td>
                            <td width="100" align="left">${company.legalPerson}</td>
                            <td width="10px" align="left">元</td>
                            <td width="80" align="right">金额:</td>
                            <td width="100" align="left">${company.legalPerson}</td>
                            <td width="10px" align="left">元</td>
                        </tr>
                        <tr>
                            <td width="80px" align="right">累计:</td>
                            <td width="100px" align="left">${company.legalPerson}</td>
                            <td width="10px" align="left">次</td>
                            <td width="80" align="right">总额:</td>
                            <td width="100" align="left">${company.legalPerson}</td>
                            <td width="10px" align="left">元</td>
                        </tr>
                    </table>

                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" >
                            <span style="font-size:14px;color:black; font-family:微软雅黑">自动催缴设置</span>
                        </a>
                        </li>
                    </ul>
                    <from>
                        <table class="table table-hover table-condensed" align="center"
                               style="text-align: center">
                            <tr>
                                <td width="80px" align="right">是否自动:</td>
                                <td width="100px" align="left">${company.legalPerson}</td>
                                <td width="80" align="right">设置:</td>
                                <td width="100" align="left">${company.legalPerson}</td>
                                <td width="10px" align="left">次</td>
                                <td width="80" align="right">金额:</td>
                                <td width="100" align="left">${company.legalPerson}</td>
                                <td width="10px" align="left">元</td>
                            </tr>
                            <tr>
                                <td width="80px" align="right">是否锁机:</td>
                                <td width="100px" align="left">${company.legalPerson}</td>
                                <td width="80" align="right">设置:</td>
                                <td width="100" align="left">${company.legalPerson}</td>
                                <td width="10px" align="left">次</td>
                                <td width="80" align="right">金额:</td>
                                <td width="100" align="left">${company.legalPerson}</td>
                                <td width="10px" align="left">元</td>
                            </tr>
                        </table>
                    </from>
                    </div><!-- /.modal-body -->
                </div><!-- /.modal-contxent -->
            </div><!-- /.modal-dialog -->
        </div>
</body>

<script>
    function x(reviewState,tabNum){
        $("#adsTab"+tabNum).bootstrapTable({
        url:'${context}/review/getDataCompany?reviewState='+reviewState,
        striped: true,
        sortable: true,
        pagination: true,
        showLoading: true,
        search:true,
        showRefresh: true,
        sidePagination:'server',
        sortName:'id',
        sortOrder:'asc',
        pageNumber:1,
        pageSize:5,
        pageList:[5,10],
        queryParamsType:'limit',
        queryParams: function (params) {
            return params;
        },
        rowStyle: function rowStyle(row, index) {
            var classes = ['active', 'success', 'info', 'warning', 'danger'];
            if (index % 2 === 0 && index / 2 < classes.length) {
                return {
                    classes: classes[index / 2]
                };
            }
            return {};
        },
        onSort: function (name, order) {

        },
        onLoadSuccess: function (data) {

        },
        onLoadError: function (status) {

        },
        onPageChange: function (number, size) {
            $('#adsTab'+tabNum).bootstrapTable('removeAll')//页面改变时清空表数据
        },
        columns:[{
            field:'companyName',
            title:'统一简称',
            sortable: true,
            order:'asc',
            valign: 'middle',
            align: 'center'
        },{
            field: 'companyId',
            title: '运营编号',
            valign: 'middle',
            align: 'center'
        },{
            field: 'phoneNumber',
            title: '电话',
            valign: 'middle',
            align: 'center'
        }, {
            field: 'legalPerson',
            title: '联系人',
            valign: 'middle',
            align:'center'
        },{
            field: 'reviewState',
            title: '在线数量',
            valign: 'middle',
            align: 'center',
            formatter: function (value, row, index) {
                if (row.reviewState===1){
                    return '在线';
                }else if (row.reviewState===3){
                    return '欠费';
                }else if (row.reviewState===2){
                    return '欠费'
                }else if (row.reviewState===0){
                    return '离线'
                }
            }
        },{
            field: 'operate',
            title: '操作',
            valign: 'middle',
            align: 'center',
            formatter: function (value, row, index){
                var id=row.id;
                var path=row.adsImgPath;
                if (row.reviewState===0){
                    return' <button type="button" class="btn btn-default" onclick=OperatorInfo(912202011,245116621)>详情查看</button>\n'+
                        '<button type="button" class="btn btn-default" data-toggle="modal" data-target="#ShowReviewInfo1">信息</button>' ;
                }else if (row.reviewState===1){
                    return ' <button type="button" class="btn btn-default" onclick="changeAdv('+id+',1)">通过</button>\n' +
                        '<button type="button" class="btn btn-default" onclick="changeAdv('+id+',2)">不通过</button>\n\r'+
                        '<button type="button" class="btn btn-default"><a href="${context}/companyQualificationDown?&path='+path+'">下载</a></button>';
                }else {
                    return '<button type="button" class="btn btn-default"><a href="${context}/companyQualificationDown?&path='+path+'">下载</a></button>\n'+
                        '<button  type="button" class="btn btn-default" data-toggle="modal" data-target="#ShowReviewInfo2" onclick=info('+id+',2)>记录</button>' +
                        ' <div class="modal fade" id="ShowReviewInfo2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">\n' +
                        '   <div class="modal-dialog">\n' +
                        '       <div class="modal-content">\n' +
                        '           <div class="modal-header">\n' +
                        '               <button type="button" class="close" data-dismiss="modal" aria-hidden="true">\n' +
                        '                   &times;\n' +
                        '               </button>\n' +
                        '               <p style="float:left;">记录信息如下：</p>\n' +
                        '           </div>\n' +
                        '           <div class="modal-body" style="margin-bottom:20px;" id="reviewTabContent" >\n' +
                        '               <table class="table table-hover" id="reviewProductTabInfo2">\n' +
                        '               </table>\n' +
                        '           </div>\n' +
                        '       </div><!-- /.modal-content -->\n' +
                        '   </div><!-- /.modal-dialog -->\n' +
                        '</div>\n';
                }
            }
        }]
    });
    }

    function b(x){
        var r=confirm("是否确认撤销审核通过");
        if (r===true){
            changeAdv(x,3)
        }
    }
</script>
</html>
