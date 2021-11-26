Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60916C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 04:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CAkr3W4H/iMZZ3ZBalb7agJpNuHvIO8+k/RCHEwl7Q0=; b=HwNWMW97kBIsae
	Kb/t0qT9JI/UWsK4bdEO6q2Zj7T6ak875L5oMJkvKkspw9DxBMqTnBpPPP8LgTGRYKqBzBewZsOxH
	yBjUVSF6fwELCzjT13AXNNFsZlXWsEhyHYgb5LHSRT6MOc18Kk21MdfylkrS/E/wT/XEKGgxfI0OQ
	RJO0yjZYmfH0NNAXTcA9YxN+TEqxKzcRTxfXWy76p8fgsrcu1FSfn7Kat4Hrmohm35Bk+jps0ecEU
	GbfbDL4Xz/bewtY8A59e9trm4S7LVpyy0B9aUQOdZQleHajBtv/IjFsb4S5/jGhGZQNdQumxzxWHD
	eZXjVkE61UEi7z+Xmpsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqT4U-009Asp-6K; Fri, 26 Nov 2021 04:42:50 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqT4R-009AsF-DH
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 04:42:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1637901767; x=1669437767;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Ik1lF/XZVpMWQiIdsqFBUkYBaFMbEyYXPm42STW4A9k=;
 b=VQ36Q//4mFXESyd9aAPeeUaJXEEKfDVjUBKuWC9zT1qA0H3tQ4BfOT66
 PzIQ1y0M+B1h5oGN5be8se9yw8XBcvkrkSgJKbwnR+s+v7q/s+LIiY6qk
 w9rCYq4EiJNFSQCYZM2BAqoqy6AEcZRMILPvoZAi/JejF6XXyPyZd6dJn
 xISztJG/H4Db3bVeai0jPfrF5p4DcffgPQZhpdyUN0MEbBayAYnnzBvM2
 TZzYaLzocFu6WH7iLX7Ca1UhpbUgtFZCSGy+KnVJSnKIGUi82FhO6++rz
 KfLtGMJljtMz/7l77Hr8JqIhDIDJ8JLxvOnq2AH9Ck7K55olqUZN8c5f2 w==;
X-IronPort-AV: E=Sophos;i="5.87,263,1631548800"; d="scan'208";a="290640607"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Nov 2021 12:42:45 +0800
IronPort-SDR: BsgeJLphw9XclxZp99of9F1ddRCwvrg2gaUJji1un5BsKmuzhZevzfMFAAdgqlFItPkmxWRsQx
 K2b2Ky5v4HoXlLbPm4rEQSePaPBOzEuvDuWY46NAzF1k89MolwjAc43iyeppFkzJ4cgQ4zSL7t
 adaj3EI3zx4ddIT8qZ6W7DOR6cA3PXxSQN9fQjSCuWWBxQioK5Loh9oDnFgeCLN4iHztEOxnRz
 KpkoiEN1t+1PfDtu+UC1GPGWbtmZDv5AfjOetdzrMgAm7b46Dig/DwWDq0nFesm9vgC+xzmBG4
 IaI+btAtEmyQ8nBRPxGPMJ57
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 20:17:36 -0800
IronPort-SDR: KSZlm/jlLS7PP41YFeBnQ+AgG+UGHhmPrEROzAlnYRRgUhy/Cu33DiVXOgwhXF8MED5avQzMgh
 +9OvZNA4zlUrY2ACgiwPBVy8INW4Xs6vfsudSbOEgFBy6KFNeqnsIXceuLXVIY3NPnO6mj/B00
 AzPy2K/40Swp0hseldIkXkzZPxBw6RI/81lVb3LVMDMOu0mYm3DB4gKcDW/kUDCfG2H8Lhn+nX
 WVrgiXdkBW1JKFK7J1i5Xx4YYT6+dIHfRWcIujgWYUiJOtIrHPwbHxLBy8H0w0/k9GT8OQtGCM
 Ozw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 20:42:45 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4J0htr577Bz1RtW0
 for <linux-riscv@lists.infradead.org>; Thu, 25 Nov 2021 20:42:44 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1637901763; x=1640493764; bh=Ik1lF/XZVpMWQiIdsqFBUkYBaFMbEyYXPm4
 2STW4A9k=; b=RWMbiAchF73M7AOQOyKDu8Rz9fmuZaXAsUbRZUq1XtGVd/ivXRR
 IhNyvhldPXUZB3WseIJBTXoQuH80YLnKcCaCRvLsniLrx70upOyj05nERPSw5yTQ
 hkery0b8AmZAkAQ4Sl/HgvDLrwmuRGzxpI+NMXRNNm3RhqA6wGMrgDBNd9PJqtdt
 D19ok5iAZXpESL8KQmgSNXKAI8WShAyvogy5CtQm4EzqLNXtqsoBa/63wSybsqsB
 toiqudG4+FHjjiVVfjS5LTm8RreUW9Q1m7ga/I6R3WYMJ6sea4XrdpQb/ZKdittz
 eB5JhkZQsaTKKH0b96NXEnCm4kP3wGHbZHw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id 8ZBpYJiE0x_o for <linux-riscv@lists.infradead.org>;
 Thu, 25 Nov 2021 20:42:43 -0800 (PST)
Received: from [10.225.54.48] (unknown [10.225.54.48])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4J0htp2C6tz1RtVl;
 Thu, 25 Nov 2021 20:42:42 -0800 (PST)
Message-ID: <853018bd-8c5e-4a03-9876-ca9f8a412ea5@opensource.wdc.com>
Date: Fri, 26 Nov 2021 13:42:40 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH 2/9] riscv: dts: canaan: Group tuples in interrupt
 properties
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Lewis Hanly <lewis.hanly@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <20211125153131.163533-1-geert@linux-m68k.org>
 <20211125153131.163533-3-geert@linux-m68k.org>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital
In-Reply-To: <20211125153131.163533-3-geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_204247_549008_EFEFCC4E 
X-CRM114-Status: GOOD (  16.52  )
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

On 2021/11/26 0:31, Geert Uytterhoeven wrote:
> To improve human readability and enable automatic validation, the tuples
> in the various properties containing interrupt specifiers should be
> grouped.
> 
> Fix this by grouping the tuples of "interrupts" and
> "interrupts-extended" properties using angle brackets.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  arch/riscv/boot/dts/canaan/k210.dtsi | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
> index 5e8ca8142482153b..56f57118c633b91a 100644
> --- a/arch/riscv/boot/dts/canaan/k210.dtsi
> +++ b/arch/riscv/boot/dts/canaan/k210.dtsi
> @@ -103,8 +103,8 @@ rom0: nvmem@1000 {
>  		clint0: timer@2000000 {
>  			compatible = "canaan,k210-clint", "sifive,clint0";
>  			reg = <0x2000000 0xC000>;
> -			interrupts-extended = <&cpu0_intc 3 &cpu0_intc 7
> -					      &cpu1_intc 3 &cpu1_intc 7>;
> +			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
> +					      <&cpu1_intc 3>, <&cpu1_intc 7>;
>  		};
>  
>  		plic0: interrupt-controller@c000000 {
> @@ -113,7 +113,7 @@ plic0: interrupt-controller@c000000 {
>  			compatible = "canaan,k210-plic", "sifive,plic-1.0.0";
>  			reg = <0xC000000 0x4000000>;
>  			interrupt-controller;
> -			interrupts-extended = <&cpu0_intc 11 &cpu1_intc 11>;
> +			interrupts-extended = <&cpu0_intc 11>, <&cpu1_intc 11>;
>  			riscv,ndev = <65>;
>  		};
>  
> @@ -130,10 +130,11 @@ gpio0: gpio-controller@38001000 {
>  			compatible = "canaan,k210-gpiohs", "sifive,gpio0";
>  			reg = <0x38001000 0x1000>;
>  			interrupt-controller;
> -			interrupts = <34 35 36 37 38 39 40 41
> -				      42 43 44 45 46 47 48 49
> -				      50 51 52 53 54 55 56 57
> -				      58 59 60 61 62 63 64 65>;
> +			interrupts = <34>, <35>, <36>, <37>, <38>, <39>, <40>,
> +				     <41>, <42>, <43>, <44>, <45>, <46>, <47>,
> +				     <48>, <49>, <50>, <51>, <52>, <53>, <54>,
> +				     <55>, <56>, <57>, <58>, <59>, <60>, <61>,
> +				     <62>, <63>, <64>, <65>;
>  			gpio-controller;
>  			ngpios = <32>;
>  		};
> @@ -141,7 +142,7 @@ gpio0: gpio-controller@38001000 {
>  		dmac0: dma-controller@50000000 {
>  			compatible = "snps,axi-dma-1.01a";
>  			reg = <0x50000000 0x1000>;
> -			interrupts = <27 28 29 30 31 32>;
> +			interrupts = <27>, <28>, <29>, <30>, <31>, <32>;
>  			#dma-cells = <1>;
>  			clocks = <&sysclk K210_CLK_DMA>, <&sysclk K210_CLK_DMA>;
>  			clock-names = "core-clk", "cfgr-clk";
> @@ -316,7 +317,7 @@ fpioa: pinmux@502b0000 {
>  			timer0: timer@502d0000 {
>  				compatible = "snps,dw-apb-timer";
>  				reg = <0x502D0000 0x100>;
> -				interrupts = <14 15>;
> +				interrupts = <14>, <15>;
>  				clocks = <&sysclk K210_CLK_TIMER0>,
>  					 <&sysclk K210_CLK_APB0>;
>  				clock-names = "timer", "pclk";
> @@ -326,7 +327,7 @@ timer0: timer@502d0000 {
>  			timer1: timer@502e0000 {
>  				compatible = "snps,dw-apb-timer";
>  				reg = <0x502E0000 0x100>;
> -				interrupts = <16 17>;
> +				interrupts = <16>, <17>;
>  				clocks = <&sysclk K210_CLK_TIMER1>,
>  					 <&sysclk K210_CLK_APB0>;
>  				clock-names = "timer", "pclk";
> @@ -336,7 +337,7 @@ timer1: timer@502e0000 {
>  			timer2: timer@502f0000 {
>  				compatible = "snps,dw-apb-timer";
>  				reg = <0x502F0000 0x100>;
> -				interrupts = <18 19>;
> +				interrupts = <18>, <19>;
>  				clocks = <&sysclk K210_CLK_TIMER2>,
>  					 <&sysclk K210_CLK_APB0>;
>  				clock-names = "timer", "pclk";
> 

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Tested-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
