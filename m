Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3663FC001B0
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 07:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K7VGfh7ikcoIaYH+1YUqo84xZZyey5rjB19rjx9sk4k=; b=Hpd3ael7t35fL5
	OjVUwuu6YsGvtTGIgfj5j9usStA17EYTwZxnCOZ5P/1Yae66EJ+Y01PykK58Fampfpt5wMK4ZdP2R
	GBC0gnhr85TYi55UiQQ6d9RrzyctcaL5nWIDvaAfUQyGPQQKim2zUCxxuyhHPhD0N7VHpRmUMqnyK
	frfqpe3BKAPWOkHE+2mSlJn2DwWzhw4FHs9MdGJn59Tpqb0DCX0i2TTnjgZg9VD/Ak4FJ0s/MvyJg
	r8Ww2TTtxXsCh2Izn09Zqi0DNRI3AOag0TGzHsZ2f56SbbeM5a0hqTrwh80gko8ctT1oH9BhO5V+b
	w/SZ5pGIu5Bye6v6NKxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTHJM-001u5p-0Z;
	Tue, 08 Aug 2023 07:39:24 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTHJH-001u2g-1t
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 07:39:23 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 6733F827D;
	Tue,  8 Aug 2023 15:38:52 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 8 Aug
 2023 15:38:52 +0800
Received: from [192.168.155.152] (202.188.176.82) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 8 Aug
 2023 15:38:47 +0800
Message-ID: <cbc3c9db-6a47-4e4f-5e5d-892d048ef924@starfivetech.com>
Date: Tue, 8 Aug 2023 15:38:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] riscv: dts: starfive - Add crypto and DMA node for
 JH7110
To: Conor Dooley <conor@kernel.org>
CC: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20230808061150.81491-1-jiajie.ho@starfivetech.com>
 <20230808061150.81491-2-jiajie.ho@starfivetech.com>
 <20230808-cilantro-fondue-21485b78e83e@spud>
Content-Language: en-US
From: Jia Jie Ho <jiajie.ho@starfivetech.com>
In-Reply-To: <20230808-cilantro-fondue-21485b78e83e@spud>
X-Originating-IP: [202.188.176.82]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_003919_966821_EBE93D48 
X-CRM114-Status: GOOD (  11.97  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 8/8/2023 3:16 pm, Conor Dooley wrote:
> On Tue, Aug 08, 2023 at 02:11:49PM +0800, Jia Jie Ho wrote:
>> Add hardware crypto module and dedicated dma controller node to StarFive
>> JH7110 SoC.
>> 
>> Co-developed-by: Huan Feng <huan.feng@starfivetech.com>
>> Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
>> Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 28 ++++++++++++++++++++++++
>>  1 file changed, 28 insertions(+)
>> 
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> index a608433200e8..47cd12ccc988 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> @@ -821,6 +821,34 @@ watchdog@13070000 {
>>  				 <&syscrg JH7110_SYSRST_WDT_CORE>;
>>  		};
>>  
>> +		crypto: crypto@16000000 {
>> +			compatible = "starfive,jh7110-crypto";
>> +			reg = <0x0 0x16000000 0x0 0x4000>;
>> +			clocks = <&stgcrg JH7110_STGCLK_SEC_AHB>,
>> +				 <&stgcrg JH7110_STGCLK_SEC_MISC_AHB>;
>> +			clock-names = "hclk", "ahb";
>> +			interrupts = <28>;
>> +			resets = <&stgcrg JH7110_STGRST_SEC_AHB>;
>> +			dmas = <&sdma 1 2>, <&sdma 0 2>;
>> +			dma-names = "tx", "rx";
>> +		};
>> +
>> +		sdma: dma@16008000 {
>> +			compatible = "arm,pl080", "arm,primecell";
>> +			arm,primecell-periphid = <0x00041080>;
>> +			reg = <0x0 0x16008000 0x0 0x4000>;
>> +			interrupts = <29>;
>> +			clocks = <&stgcrg JH7110_STGCLK_SEC_AHB>,
>> +				 <&stgcrg JH7110_STGCLK_SEC_MISC_AHB>;
>> +			clock-names = "hclk", "apb_pclk";
>> +			resets = <&stgcrg JH7110_STGRST_SEC_AHB>;
>> +			lli-bus-interface-ahb1;
>> +			mem-bus-interface-ahb1;
>> +			memcpy-burst-size = <256>;
>> +			memcpy-bus-width = <32>;
>> +			#dma-cells = <2>;
>> +		};
>> +
> 
> Against linux-next, I get these warnings:
> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb: dma@16008000: $nodename:0: 'dma@16008000' does not match '^dma-controller(@.*)?$'
>         from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml#
> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb: dma@16008000: clocks: [[26, 15], [26, 16]] is too long
>         from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml#
> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb: dma@16008000: clock-names: ['hclk', 'apb_pclk'] is too long
>         from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml#
> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb: dma@16008000: Unevaluated properties are not allowed ('#dma-cells' was unexpected)
>         from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml#
> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dtb: dma@16008000: $nodename:0: 'dma@16008000' does not match '^dma-controller(@.*)?$'
>         from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml#
> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dtb: dma@16008000: clocks: [[26, 15], [26, 16]] is too long
>         from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml#
> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dtb: dma@16008000: clock-names: ['hclk', 'apb_pclk'] is too long
>         from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml#
> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dtb: dma@16008000: Unevaluated properties are not allowed ('#dma-cells' was unexpected)
>         from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml#
> 
> Please fix these & submit a tested v2.
> 

Sorry, I missed testing the dma node.
Will fix this in next version.

Regards,
Jia Jie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
