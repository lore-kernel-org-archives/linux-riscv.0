Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4466EC77B7D
	for <linux-riscv@archiver.kernel.org>; Fri,  5 May 2023 09:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wVRpIZZ0ZOLDWiNqxE7A5cOE+wu3OWpnZGRm2NtSmy4=; b=dktTbPtHBw5CZ0
	DtXjNHpddUnIvsKtu1Gv9nvfR8tsKP7fjPVvTSKCNeq1Qo3EhEPLPXQf/Rl0z50x9ybxox3cOzpwx
	Qyj1mYkySqtgAQf7snlyjDC1kPanU6z4TMYn9oPLgJBQNTPmg0ZnI3PTAHyLsujhABr5SQ9zq/Vx0
	Dj598rvDCPtQ2ElUKSf9HxJAdI53FNeRfre7W19NdVc45h+wNb8DQOatvfiel3meGFjXu2tspJkLk
	qzqeTJz/rhachmIw89JyZPcjTYHY8O5nqiI7Nibo2ZsGJ2InFpT1uoyN8IBiNZlyfZxmEwyexUeoh
	g4le/0CnCK/rxiTWWQoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pusCk-00ADpG-1A;
	Fri, 05 May 2023 09:58:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pusCg-00ADnd-0f;
	Fri, 05 May 2023 09:58:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A0051FB;
	Fri,  5 May 2023 02:58:57 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3BCAE3F64C;
	Fri,  5 May 2023 02:58:11 -0700 (PDT)
Date: Fri, 5 May 2023 10:58:05 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Maksim Kiselev <bigunclemax@gmail.com>
Cc: robh+dt@kernel.org, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: allwinner: d1: Add SPI0 controller node
Message-ID: <20230505105805.548d1a1b@donnerap.cambridge.arm.com>
In-Reply-To: <20230505074701.1030980-1-bigunclemax@gmail.com>
References: <20230505074701.1030980-1-bigunclemax@gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_025818_362511_B88ED9FF 
X-CRM114-Status: GOOD (  22.88  )
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

On Fri,  5 May 2023 10:46:51 +0300
Maksim Kiselev <bigunclemax@gmail.com> wrote:

Hi Maksim,

thanks for sending a patch!

> Some boards form the MangoPi family (MQ\MQ-Dual\MQ-R) may have
> an optional SPI flash that connects to the SPI0 controller.
> This controller is already supported by sun8i-h3-spi driver.
> So let's add its DT node.

Interesting, I see SPI mentioned in the D1 platform support cover letter,
but indeed there is no DT node. From a quick glance at the manuals, it
looks like there are not quite the same, though: the D1/R528/T113s
mentions a SPI_SAMP_DL register @0x28, whereas the older IP has a SPI_CCR
register @0x24 - which is not mentioned in the newer manuals. The driver
relies on that clock control register, so it wouldn't really work
reliably, if that register is not there. It *might* work by pure chance
because of a particular setup or clock rate, though.

Samuel, did you investigate SPI support on the D1/T113s? I see it marked
as "WIP" in the Wiki status page, so where there any patches floating
around?


Regardless of that, one comment that would apply anyway:

> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> ---
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> index 922e8e0e2c09..d2de211d67d7 100644
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
> @@ -447,6 +453,20 @@ mmc2: mmc@4022000 {
>  			#size-cells = <0>;
>  		};
>  
> +		spi0: spi@4025000 {
> +			compatible = "allwinner,sun8i-h3-spi";

Even if it would be compatible, we need to use a more specific compatible
first, with the H3 one as a fallback:

			compatible = "allwinner,sun20i-d1-spi",
				     "allwinner,sun8i-h3-spi";

But that would require that the H3 is a strict subset of the D1 SPI IP.

Cheers,
Andre


> +			reg = <0x04025000 0x300>;
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
> +
>  		usb_otg: usb@4100000 {
>  			compatible = "allwinner,sun20i-d1-musb",
>  				     "allwinner,sun8i-a33-musb";


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
