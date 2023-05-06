Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B93C77B73
	for <linux-riscv@archiver.kernel.org>; Sat,  6 May 2023 22:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yrtqVwAp8v+KZzBi5loCu8eo1pIKJVH4FQ9qptgYEzQ=; b=xoyIgM2ONHMxuA
	mN4ddtjJgHt/5n89vTo07+yB7SkR/gwtnxMMileKQpPavVDRgsAz5cxC8F4MpK9KlSIJgDADN99O9
	Bc9fBK1a7nO+HJawTJKh/u43/acoOKtFaBjGIGcoxQcicCorhQES3j4WLYzLZSljvFKk6r1Jdz39g
	Po+9pduN9KuP6GCzwX96a6C7BF04odDArUMg2zyHAw+7qUqsxDI7V1TQh++d0PzWQV+gtwXdoiOj1
	RVi6fJjHnsuAqjbxN3udUIG5fxxsE9/z+BeUKFtLaiQx8FTd76ApbTlz3cKTJCEglGOp2l896cbhf
	6Z8DqniPPdDQOuzoI77Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvPwk-00ERde-2w;
	Sat, 06 May 2023 22:00:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvPwg-00ERbe-2a;
	Sat, 06 May 2023 22:00:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1ABA1FB;
	Sat,  6 May 2023 15:00:44 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 822373F5A1;
	Sat,  6 May 2023 14:59:57 -0700 (PDT)
Date: Sat, 6 May 2023 22:59:42 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Maksim Kiselev <bigunclemax@gmail.com>
Cc: Icenowy Zheng <icenowy@aosc.io>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, Maxime Ripard <mripard@kernel.org>,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 6/6] riscv: dts: allwinner: d1: Add SPI0 controller
 node
Message-ID: <20230506225942.017a968f@slackpad.lan>
In-Reply-To: <20230506073018.1411583-7-bigunclemax@gmail.com>
References: <20230506073018.1411583-1-bigunclemax@gmail.com>
	<20230506073018.1411583-7-bigunclemax@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_150002_894803_2A3FF010 
X-CRM114-Status: GOOD (  16.73  )
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

On Sat,  6 May 2023 10:30:14 +0300
Maksim Kiselev <bigunclemax@gmail.com> wrote:

Hi,

> Some boards form the MangoPi family (MQ\MQ-Dual\MQ-R) may have
> an optional SPI flash that connects to the SPI0 controller.
> 
> This controller is the same for R329/D1/R528/T113s SoCs and
> should be supported by the sun50i-r329-spi driver.
> 
> So let's add its DT node.
> 
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> ---
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> index 922e8e0e2c09..a52999240a8e 100644
> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> @@ -108,6 +108,12 @@ rmii_pe_pins: rmii-pe-pins {
>  				function = "emac";
>  			};
>  
> +			/omit-if-no-ref/
> +			spi0_pins: spi0-pins {
> +				pins = "PC2", "PC3", "PC4", "PC5";
> +				function = "spi0";
> +			};
> +
>  			/omit-if-no-ref/
>  			uart1_pg6_pins: uart1-pg6-pins {
>  				pins = "PG6", "PG7";
> @@ -447,6 +453,21 @@ mmc2: mmc@4022000 {
>  			#size-cells = <0>;
>  		};
>  
> +		spi0: spi@4025000 {
> +			compatible = "allwinner,sun20i-d1-spi",
> +				     "allwinner,sun50i-r329-spi";
> +			reg = <0x04025000 0x300>;

The manual (and the other DTs) use 4K, so please use that here as well.

> +			interrupts = <SOC_PERIPHERAL_IRQ(15) IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_SPI0>, <&ccu CLK_SPI0>;
> +			clock-names = "ahb", "mod";
> +			dmas = <&dma 22>, <&dma 22>;
> +			dma-names = "rx", "tx";
> +			resets = <&ccu RST_BUS_SPI0>;
> +			status = "disabled";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};

I think we should add the second SPI controller here as well, using
that DBI fallback compatible string.
Above looks correct when compared to the manual.

Thanks,
Andre


> +
>  		usb_otg: usb@4100000 {
>  			compatible = "allwinner,sun20i-d1-musb",
>  				     "allwinner,sun8i-a33-musb";


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
