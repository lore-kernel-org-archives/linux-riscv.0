Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140F6EB64DD
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Aug 2023 09:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VcdLxlZb2QqdQGIT5qUpIE1Nk2dw7xnle6Y+YsS4zy4=; b=bi+SOUh23abdeO
	q3oFSv8pcb3/X/DvO3YPtdoe2+oNqAG70KSQnF1ZXueCGy+WwOgUW71JYuugXEL+Pbl10HTfCQ6p/
	mK8SXGtXrjhqiZSGiCLAwWd/5egAZ9dowrSi84b/4ENAFQ6IQIPP3UDWrpXiOpbEy98i4M1du3tpG
	vHUr0QUjR15eKvEQKV/DXiF7nU9/IZF8eVNfzuZBd+jA4hrWqHo5sz3+Gi2g8ADB/9ykPh+qF5STl
	1mmTDqyZJpyP+ieLk8deAGDZuHJyWVsgMVYhUFuYNAFas38d7NMteRjeP9cFgWchAcMKRwtF3mVuS
	bo0w0fhQI8XK4lhDqN6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSwFL-00GXAZ-0Q;
	Mon, 07 Aug 2023 09:09:51 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSwFH-00GX8m-1p
	for linux-riscv@lists.infradead.org;
	Mon, 07 Aug 2023 09:09:49 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 0BDCF8016;
	Mon,  7 Aug 2023 17:09:21 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 7 Aug
 2023 17:09:20 +0800
Received: from [192.168.125.128] (113.72.146.246) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 7 Aug
 2023 17:09:19 +0800
Message-ID: <d89facb4-63f0-b30a-3612-639a81195fef@starfivetech.com>
Date: Mon, 7 Aug 2023 17:04:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v1 5/5] riscv: dts: starfive: Add the nodes and pins of
 I2Srx/I2Stx0/I2Stx1
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Maxim Kochetkov
	<fido_max@inbox.ru>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: Jose Abreu <joabreu@synopsys.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Walker Chen <walker.chen@starfivetech.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <linux-riscv@lists.infradead.org>
References: <20230802084301.134122-1-xingyu.wu@starfivetech.com>
 <20230802084301.134122-6-xingyu.wu@starfivetech.com>
 <8fc27960-fa82-c900-0414-75b10a118f15@linaro.org>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <8fc27960-fa82-c900-0414-75b10a118f15@linaro.org>
X-Originating-IP: [113.72.146.246]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_020947_953279_D8A1D89E 
X-CRM114-Status: GOOD (  10.08  )
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

On 2023/8/6 5:04, Krzysztof Kozlowski wrote:
> On 02/08/2023 10:43, Xingyu Wu wrote:
>> Add I2Srx/I2Stx0/I2Stx1 nodes and pins configuration for the
>> StarFive JH7110 SoC.
>> 
>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>> ---
> 
> ...
> 
>> +
>>  	spi0_pins: spi0-0 {
>>  		mosi-pins {
>>  			pinmux = <GPIOMUX(52, GPOUT_SYS_SPI0_TXD,
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> index 05f843b8ca03..507312eb6053 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> @@ -512,6 +512,30 @@ tdm: tdm@10090000 {
>>  			status = "disabled";
>>  		};
>>  
>> +		i2srx: i2srx@100e0000 {
> 
> Node names should be generic, so:
> i2s@

Will fix. Thanks.

> 
>> +			compatible = "starfive,jh7110-i2srx";
>> +			reg = <0x0 0x100e0000 0x0 0x1000>;
>> +			clocks = <&syscrg JH7110_SYSCLK_I2SRX_BCLK_MST>,
>> +				 <&syscrg JH7110_SYSCLK_I2SRX_APB>,
>> +				 <&syscrg JH7110_SYSCLK_MCLK>,
>> +				 <&syscrg JH7110_SYSCLK_MCLK_INNER>,
>> +				 <&mclk_ext>,
>> +				 <&syscrg JH7110_SYSCLK_I2SRX_BCLK>,
>> +				 <&syscrg JH7110_SYSCLK_I2SRX_LRCK>,
>> +				 <&i2srx_bclk_ext>,
>> +				 <&i2srx_lrck_ext>;
>> +			clock-names = "i2sclk", "apb", "mclk",
>> +				      "mclk_inner", "mclk_ext", "bclk",
>> +				      "lrck", "bclk_ext", "lrck_ext";
>> +			resets = <&syscrg JH7110_SYSRST_I2SRX_APB>,
>> +				 <&syscrg JH7110_SYSRST_I2SRX_BCLK>;
>> +			dmas = <0>, <&dma 24>;
>> +			dma-names = "tx", "rx";
>> +			starfive,syscon = <&sys_syscon 0x18 0x2>;
>> +			#sound-dai-cells = <0>;
>> +			status = "disabled";
>> +		};
>> +
>>  		usb0: usb@10100000 {
>>  			compatible = "starfive,jh7110-usb";
>>  			ranges = <0x0 0x0 0x10100000 0x100000>;
>> @@ -736,6 +760,47 @@ spi6: spi@120a0000 {
>>  			status = "disabled";
>>  		};
>>  
>> +		i2stx0: i2stx0@120b0000 {
> 
> i2s@

Will fix.

> 
>> +			compatible = "starfive,jh7110-i2stx0";
>> +			reg = <0x0 0x120b0000 0x0 0x1000>;
>> +			clocks = <&syscrg JH7110_SYSCLK_I2STX0_BCLK_MST>,
>> +				 <&syscrg JH7110_SYSCLK_I2STX0_APB>,
>> +				 <&syscrg JH7110_SYSCLK_MCLK>,
>> +				 <&syscrg JH7110_SYSCLK_MCLK_INNER>,
>> +				 <&mclk_ext>;
>> +			clock-names = "i2sclk", "apb", "mclk",
>> +				      "mclk_inner","mclk_ext";
>> +			resets = <&syscrg JH7110_SYSRST_I2STX0_APB>,
>> +				 <&syscrg JH7110_SYSRST_I2STX0_BCLK>;
>> +			dmas = <&dma 47>;
>> +			dma-names = "tx";
>> +			#sound-dai-cells = <0>;
>> +			status = "disabled";
>> +		};
>> +
>> +		i2stx1: i2stx1@120c0000 {
> 
> i2s@

Will fix.

Best regards,
Xingyu Wu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
