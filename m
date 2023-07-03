Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910B8EB64D9
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 01:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ajMg9LOUuQDXO7p9oTuidNQYXglrDqRIbTTHyCc5eXM=; b=V/llkOGTju3VFU
	fMOFODvKdHn4GvZfyJpzimFx3g15iPb25LDVfg0rIKQ/gt6ZyKUOWm99wCDQiO0F/aSJEz3EA4rRE
	1njx4lzvLCCHQwvUoWu/EnEcrw0DEh0b5CjRvcQE8t+npxIBSHiQCoJdjNo4oTOCic1yeQBG3wK6K
	bFmCy80888Cc8uLalMvoRnWAa4U7gq5FdOhMk56IefSrLdnCMcFyrEZgsRtQgUm8QKgC32wwCJV3/
	tBJ7nWisxPoQaadldFwAvVOzgOeD/BPXBglDgRG1N5p2gScXw4JsVaV1Q+vf0ThOnG/HlCRB0Omzz
	2ZP3kxBtmf75re/SjMbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qG8UW-0090kq-1x;
	Mon, 03 Jul 2023 01:36:36 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qG8UQ-0090hI-27
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 01:36:35 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 50EA48086;
	Mon,  3 Jul 2023 09:35:49 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 3 Jul
 2023 09:35:49 +0800
Received: from [192.168.125.124] (113.72.144.31) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 3 Jul
 2023 09:35:47 +0800
Message-ID: <d490987c-0d58-b38a-1886-decba64ba6a0@starfivetech.com>
Date: Mon, 3 Jul 2023 09:35:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 4/4] riscv: dts: starfive: add dma controller node
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul
	<vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Emil
 Renner Berthing" <emil.renner.berthing@canonical.com>,
	<dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230322094820.24738-1-walker.chen@starfivetech.com>
 <20230322094820.24738-5-walker.chen@starfivetech.com>
 <ZKCiOQ0IuptKO8kr@aurel32.net>
Content-Language: en-US
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <ZKCiOQ0IuptKO8kr@aurel32.net>
X-Originating-IP: [113.72.144.31]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_183631_061796_27EEAEE2 
X-CRM114-Status: GOOD (  12.30  )
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


On 2023/7/2 6:01, Aurelien Jarno wrote:
> On 2023-03-22 17:48, Walker Chen wrote:
>> Add the dma controller node for the Starfive JH7110 SoC.
>> 
>> Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
>> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
>> ---
>>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>> 
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> index 17220576b21c..b503b6137743 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> @@ -510,6 +510,24 @@
>>  			#gpio-cells = <2>;
>>  		};
>>  
>> +		dma: dma-controller@16050000 {
>> +			compatible = "starfive,jh7110-axi-dma";
>> +			reg = <0x0 0x16050000 0x0 0x10000>;
>> +			clocks = <&stgcrg JH7110_STGCLK_DMA1P_AXI>,
>> +				 <&stgcrg JH7110_STGCLK_DMA1P_AHB>;
>> +			clock-names = "core-clk", "cfgr-clk";
>> +			resets = <&stgcrg JH7110_STGRST_DMA1P_AXI>,
>> +				 <&stgcrg JH7110_STGRST_DMA1P_AHB>;
>> +			interrupts = <73>;
>> +			#dma-cells = <1>;
>> +			dma-channels = <4>;
>> +			snps,dma-masters = <1>;
>> +			snps,data-width = <3>;
>> +			snps,block-size = <65536 65536 65536 65536>;
>> +			snps,priority = <0 1 2 3>;
>> +			snps,axi-max-burst-len = <16>;
>> +		};
>> +
>>  		aoncrg: clock-controller@17000000 {
>>  			compatible = "starfive,jh7110-aoncrg";
>>  			reg = <0x0 0x17000000 0x0 0x10000>;
> 
> It appears that this patch has never been applied, although the rest of
> the series has already been merged. Unfortunately it doesn't apply
> anymore due to other changes to that file.
> 
> Could you please rebase and repost it?
> 
Of course I will repost it, but this depends on whether the stg clock is merged.

Regards,
Walker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
