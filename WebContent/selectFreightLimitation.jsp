<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!--声明文档兼容模式，表示使用IE浏览器的最新模式-->
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<!--设置视口的宽度(值为设备的理想宽度)，页面初始缩放值<理想宽度/可见宽度>-->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- 这3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
		<title>运费时效查询</title>
		<!-- 引入Bootstrap核心样式文件 -->
		<link href="../css/bootstrap.min.css" rel="stylesheet">
		<!-- 引入jQuery核心js文件 -->
		<script src="../js/jquery-1.11.0.min.js"></script>
		<!-- 引入BootStrap核心js文件 -->
		<script src="../js/bootstrap.min.js"></script>
<script type="text/javascript">
function selectFreightLimitationResult(){
			alert("由于当前开发人员能力不足 该功能实现不了！敬请谅解！");

}

</script>
</head>
<body >
<div align="center" style="padding-top: 50px;">
		<form action="javascript:selectFreightLimitationResult()" method="post" >
		<table  width="740" height="500" style=" background-color: rgba(246,246,246,0.5);" >
			<tr height="200"></tr>
			<tr height="30" style="margin-top:200px;">
				<td width="20%"></td>
				<td width="20%" colspan="2" align="center" style="color:red"><h1><b>运费时效查询</b></h1></td>
				<td width="40%"></td>
			</tr>
			<tr height="30" style="margin-top:200px;">
				<td width="20%"></td>
				<td width="20%" align="center">寄件地：</td>
				<td><input style="border-color:red" type="text" class="cityinput" value="${jjd }" name="jjd" id="jjd"
			 placeholder="请输入详细地址"></td>
				<td width="40%"></td>
			</tr>
			<tr height="30">
				<td width="40%"></td>
				<td width="10%" align="center">收件地：</td>
				<td><input style="border-color:red" type="text" class="cityinput" value="${sjd }" name="sjd" id="sjd"
			 placeholder="请输入详细地址"></td>
				<td width="30%"></td>
			</tr>
			<tr height="30">
				<td width="40%"></td>
				<td width="10%" align="center" >重量（单位kg）：</td>
				<td><input style="border-color:red" type="text" class="cityinput" value="${zl }" name="zl" id="zl" placeholder="请输入重量"/></td>
				<td width="30%"></td>
			</tr>
			<tr height="30">
				<td width="40%"></td>
				<td width="40%">时间（格式YYYYMMDD）：</td>
				<td><input style="border-color:red" type="text" class="cityinput" value="${zl }" name="zl" id="zl" placeholder="请输入重量"/></td>
				<td width="30%"></td>
			</tr>
			<tr height="30">
				<td width="40%"></td>
				<td width="10%" colspan="2" align="center" ><input type="submit" value="查询"  /></td>
				<td width="30%"></td>
			</tr>
			
			<tr >
				<td></td>
			</tr>
		</table>
		
		</form>
		
	</div>
	<div style="background-color: #FFF;border-radius: 4px;padding: 20px;" class=" main-content-row news-content content-page ">
  		<p><strong>运费计算基于以下计费规则：</strong></p>
		<p><strong>一、 体积重量计算方法</strong></p>
		<p>托寄物的计费重量取体积重量与实际重量两者之间的较大值，体积重量的计算方法为：</p>
		<p>1、【<strong>dd即日/次晨/标快</strong>】</p>
		<p>同城、省内件以及经济区域内互寄，体积重量=长(CM)×宽(CM)×高(CM)÷12000；</p>
		<p>省外跨经济区域互寄，体积重量=长(CM)×宽(CM)×高(CM)÷6000；</p>
		<p>(经济区域包含：京津冀区域，江浙沪皖区域,，川渝区域，黑吉辽区域)</p>
		<p>2、【<strong>dd特惠</strong>】 体积重量=长(CM)×宽(CM)×高(CM)÷12000；</p>
		<p>3、【<strong>重货包裹/小票零担/冷仓速配/冷冻到家</strong>】 体积重量=长(CM)×宽(CM)×高(CM)÷6000；</p>
		<p>4、【<strong>冷运零担</strong>】 体积重量=长(CM)×宽(CM)×高(CM)÷3000；</p>
		<p>5、【<strong>港澳台/国际产品（服务）</strong>】 体积重量=长(CM)×宽(CM)×高(CM)÷6000</p>
		<p>其他产品计算方法请致电95338或咨询当地收派员。</p>
		<p><strong>二. 计费重量小数点进位处理方式</strong></p>
		<p>1、【<strong>中国大陆互寄业务</strong>】</p>
		<p>100KG以下，续重以0.5KG为计重单位，不足0.5kg，按0.5kg计；100KG及以上，四舍五入取整数。</p>
		<p>2、【<strong>港澳本地业务</strong>】</p>
		<p>续重以0.5KG为计重单位，不足0.5kg，按0.5kg计。</p>
		<p>3、【<strong>跨境业务</strong>】</p>
		<p>【中国大陆始发至港澳台业务】100KG以下, 续重以0.5KG为计重单位，不足0.5kg，按0.5kg计；100KG及以上，以1KG为计重单位，小数点后尾数大于零的，向上进位至下一个1KG。</p>
		<p>除以上流向的其他跨境业务，按以下方式处理：</p>
		<p>20KG以下, 续重以0.5KG为计重单位，不足0.5kg，按0.5kg计；20KG及以上，以1KG为计重单位，小数点后尾数大于零的，向上进位至下一个1KG</p>
		<p><strong>三. 运费计算结果处理方式</strong></p>
		<p>1、运费计算结果按四舍五入取整数值；</p>
		<p>2、不同产品起始重量各有差异，不足起重的快件将按起重计费并显示。</p>
		<p>以上计费规则可能因服务（产品）或所在地区不同而有所差异，详情致电95338或与当地收派员进行咨询。</p>
		<p>&nbsp;</p>
		<p><strong>温馨提示：</strong></p>
		<p><strong>始发地或目的地任一方为港澳台地区</strong><strong>：</strong></p>
		<p style="padding-left: 30px;">1、此价格供参考。更多收费和服务详情，详情请致电中国内地客户服务热线&nbsp;<strong>666</strong>。</p>
		<p style="padding-left: 30px;">2、台湾地区寄往中国内地的特殊包裹品项及价格请<a href="http://www.sf-express.com/cn/sc/download/20181211-Dynamic_function-pric-TW-C-type.pdf">按此</a>查询，参考时效在dd标快产品基础上加时<span lang="EN-US">3-5</span>天；。</p>
		<p style="padding-left: 30px;">3、对于约定由收件人（或第三方）付费（含运费及增值服务费）的快件，在快件签收之前，可提出对费用付款方式变更为寄方付。对于需要更改付款方式的快件，寄件人除需要支付运费外，每票需另外支付更改付款方式服务费。（<a href="http://www.sf-express.com/cn/sc/express/express_service/added_service/change_payment_method/">收费标准</a>）</p>
		<p style="padding-left: 30px;">4、如收派件地址为<a href="http://www.sf-express.com/cn/sc/download/20190305-HongKongResidentialSurcharge_SC.pdf">香港地区住宅地址</a>或<a href="http://www.sf-express.com/cn/sc/download/20190306-HK_RemoteArea_SC.pdf">香港地区偏远地区</a>，上门收派每票另收港币（住宅附加费$20，香港偏远件$30），附加费可寄付或到付，收派件时效需加0.5-1个工作日。</p>
		<p style="padding-left: 30px;">5、台湾地区部分地区收派时效需加0.5-1工作日，可<a href="http://www.sf-express.com/cn/sc/download/TW_Remote_area_TC01.PDF">按此</a>查阅详情。</p>
		<p style="padding-left: 30px;">6、以上由香港、澳门及台湾地区寄件至中国内地、港澳台地区之运费不含燃油附加费，请<a href="http://www.sf-express.com/cn/sc/download/Fuel-Surcahrge-1903-CN.pdf">按此</a>了解更多燃油附加费的资料。</p>
		<p><strong>始发地或目的地任一方为海外国家</strong><strong>:</strong></p>
		<p style="padding-left: 30px;">1、海外进出口流向价格与时效仅参考。更多收费与服务详情，请致电大陆国际业务客服专线9533883.</p>
		<p style="padding-left: 30px;">2、海外进出口流向运费豁免燃油附加费，但未包含清关税费、偏远地区附加费、特殊处理费等可能产生的其他费用。</p>
		<p style="padding-left: 30px;">3、海外进出口流向时效标准天数是指工作日，不包含收件日，不包括周末和节假日。具体派送时效以目的地邮编为准。如遇偏远地区或郊区、航班延误、清关异常等情形，时效会额外增加。</p>
		<p>&nbsp;</p>
	</div>
	
<br>

</body>
</html>