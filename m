Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13751C54E41
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 15:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AwzybeRmCaOpJbvm2ZLCuap75gu7NlOy2JNHiUBiNks=; b=N1fvvuVdKKRVey
	yzQLEggkDwAGVtoIzzOVOA1xiWq8nQcAfaAU64vp663h4wDwt6LCFPXBcjs6bPxXR9b0yv/PbP+JG
	YejgZSNwLya9cdpP9LqTpzonSzFuGwto62WK4IK8wW8168Sh6WXUFJpyetWFA9hVOooV1QMAGqIBW
	70ZYyWh/cWLbltaGawqwRJXIhtdzTZSH8hmatW+TMsMfVPv8aA7H/vjlLN3PV22A1x34CG9NHo4zF
	smfZP7w1iCDgxRc/z2HCBiUI5EJtoyVoyEu2X5Gr7Ju44aqowFGW5A2bzDAIp3DfQCcsTW8dV6Swc
	49vOyIF3o84OR8ClrcLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhX6y-0000000ELyB-2BQh;
	Tue, 05 Mar 2024 15:53:48 +0000
Received: from out162-62-57-252.mail.qq.com ([162.62.57.252])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhPWR-0000000CR6T-0Qze
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 07:47:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1709624839; bh=g5kgWxn1NIxh/U33f+1njLKEvQkBSk5gIYUqK8r5evU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=LCDGbDCwYGUQi+o2l4zqRcEZaCrkX297/Y6vTVxmHzBk4eepQgpJx2YPZgJkb+d0T
	 z55wijeuGIrkDXeRIk38CZ9/FufV354Ql58pax6cLzTv+Y7Jaka7yJKN0W8SI13wyt
	 NAe3FZK4vqAzxBNDf38xUfUetxUzxGId+P2i/OFU=
Received: from [IPV6:2001:da8:c800:d084:f0c8:5d03:8100:4abe] ([2001:da8:c800:d084:f0c8:5d03:8100:4abe])
	by newxmesmtplogicsvrszb9-1.qq.com (NewEsmtp) with SMTP
	id BCFB4E35; Tue, 05 Mar 2024 15:47:15 +0800
X-QQ-mid: xmsmtpt1709624835t312y5jks
Message-ID: <tencent_E56A833916E00EC7B4840C34FAF1250ADE0A@qq.com>
X-QQ-XMAILINFO: MRMtjO3A6C9Xa8SSBDSIszojUPOQR3Pu/YiSKnZ9CLUlp33j5I4BOid6UBpNni
	 k0FZVOccwXNfc6U3Gk2ep4umWe2WreSNJpgnico/BladWbJulFvtIJ640xgIS6L++jcew4UWTlR3
	 V2udqtjWFqXUEm9nO4o3JHRxrm1mluMwBFtOY4M5WX7+8f8lKJdebMzqlKAy7X36UnyoTyCvhKN5
	 33mfbM1t2mzcDPa1IX8cuJDiE9h2pwMBYQJHFyMjXIJTpq2RxmIG1Neq4hjT9Y5L0tMBo5d3aOCx
	 xFYL/rarWRKEZv46xrrJRt1ZGxUxXT5Jses+xQWME63PA8pp7wS9Px6RFi7KzY3YBt3rH7qTwa82
	 UCV/zNu89FpSV6notQosadR8xoHVIfjjVBoNcyDHdtehGS46YrMmS+xsRqcVpOtASGLJBbquX/2O
	 xDjp64aZmsiaX++BnbZ2jwdFBY6lQmGEysXk+PuvBcMWHdNpA91T5phc6DofwzNz8TAaHxEllH0w
	 B1IaCKoPS0kRkQvXNQuEnWfoX30Yo+wZ4WXFK0/RNi0MrahUmAdDGpzpoGjY0Dai9aPKuxDiZR7w
	 bZ+ZblwIu91JhbF/9yHCjYiiCWDC20A+6DKuVSj/+aKUzRkGJFTyiTX8Nx4KXlW4DCsf1P3eRSNn
	 IZ1GXAimu3gC4vA624z8JqOhJMzOUvefatPu8x5alvcYp2rnl4fklz+Mp4SIRSonX+85Zl/V9n0y
	 N7QEO0tGlzjCy+fu64bi39/zRM4nnzKrUdnr6LoeOO3FQkUJw5YwAEy5+c/YjuCDEDN8rsNgN5EF
	 X5eKadoM9zjR7g2sGtWApTsOVwcYXiwEBZzUcrE0V8TbVgm0JBxO+xa4yxeb0FKUyIOQcMkWJUa6
	 6cPUPjSOePfkVTLQdM5//+UipMwTU8uVv0mr3y8BQY/yn2Bni+o2SfWIt/4oyOB+jCwGwEzGH7zG
	 rQqUipDJK2veb7DniAdVVtPRM1MTQhkYXalaxZLVKUcV22g8Y+DQ==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-OQ-MSGID: <cd8da084-4021-4bcb-86da-e7295589c8f1@cyyself.name>
Date: Tue, 5 Mar 2024 15:47:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] riscv: Kconfig.socs: Allow SOC_CANAAN with MMU for
 K230
Content-Language: en-US
To: Damien Le Moal <dlemoal@kernel.org>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <tencent_BB2364BBF1812F4E304F7BDDD11E57356605@qq.com>
 <tencent_0432DA968E39B81431F921F38D747C008208@qq.com>
 <ef8df22f-dac8-4652-bf17-d10254e6abfb@kernel.org>
From: Yangyu Chen <cyy@cyyself.name>
In-Reply-To: <ef8df22f-dac8-4652-bf17-d10254e6abfb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_234735_737425_7C6D53C5 
X-CRM114-Status: GOOD (  15.96  )
X-Mailman-Approved-At: Tue, 05 Mar 2024 07:53:46 -0800
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2024/3/5 07:46, Damien Le Moal wrote:
> On 3/5/24 06:05, Yangyu Chen wrote:
>> Since K230 was released, SOC_CANAAN is no longer only referred to the K210.
>> Remove it depends on !MMU will allow building dts for K230 and remove the
>> K210 string from the help message.
>>
>> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>   arch/riscv/Kconfig.socs | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
>> index 623de5f8a208..b4e9b7f75510 100644
>> --- a/arch/riscv/Kconfig.socs
>> +++ b/arch/riscv/Kconfig.socs
>> @@ -75,13 +75,12 @@ config ARCH_CANAAN
>>   	def_bool SOC_CANAAN
>>   
>>   config SOC_CANAAN
>> -	bool "Canaan Kendryte K210 SoC"
>> -	depends on !MMU
> 
> This seems wrong to me. The k210 support does require no-mmu. So why remove
> this ?

It just allows SOC_CANAAN to be selected when MMU=y. With this patch, 
nommu_k210_defconfig still works.

> Does the k230 have MMU support ? If yes, then I do not think these 2 can
> fall under the same SOC_CANAAN.
> 

Yes, K230 has MMU, you can see the bootlog from the cover letter and the 
dts patch [6/7]. Could you provide some reasons why it can fall? I 
didn't see any differences in .config after this change after executing 
'make ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- nommu_k210_defconfig'.

>> +	bool "Canaan Kendryte SoC"
>>   	select CLINT_TIMER if RISCV_M_MODE
>>   	select ARCH_HAS_RESET_CONTROLLER
>>   	select PINCTRL
>>   	select COMMON_CLK
>>   	help
>> -	  This enables support for Canaan Kendryte K210 SoC platform hardware.
>> +	  This enables support for Canaan Kendryte SoC platform hardware.
>>   
>>   endmenu # "SoC selection"
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
