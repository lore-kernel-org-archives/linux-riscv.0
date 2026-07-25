Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D52C531D0
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 13:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m+7LMwUkInf+keXo2J/SbfDnbUHmFUX3uNkXE4TnC4s=; b=G4M5N4/KlokCaS
	nkhtQYARYDNi8Wn+9uKBxV9LY+MlH979FpZ9YylJLK7WdlpIYQbBg03eQRgqY8N3HFCaZkuXlmDV9
	e1FbdRCGWjpJ3hacI//frgjlHspCe2DFbj7A2UnYHaCsnATissdlcTVcfPIDKTLZ/9CC0uNg5axyX
	BOCmpCK1ToUPh0D53cYjTXYHuc8Mga6mgbH5dASosVDU8o7lbgI3OgMy2E+2Cu+pJdN/MONMn4UkM
	9jVxjy/FfzpX/zcBhWqHqxmjA+pVfD+XI0J+1XbZzZoqBC6n3GFFvHt+yRtzzcXxBn19PTDEdd5Vv
	gPLLsUSGBV3mHouzFIJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wncCQ-00000000Mml-0Skk;
	Sat, 25 Jul 2026 13:13:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wncCO-00000000Mmf-2kS7
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 13:13:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2899243AF5;
	Sat, 25 Jul 2026 13:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 829371F000E9;
	Sat, 25 Jul 2026 13:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784985232;
	bh=j+kTo6kY0mhTML33kxN6aZC9o+YRDsN5TZ49E2l5lW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fZRGultstwiuYxU+EJDJTssXezN1d4sWZq328ZGIHIGQDjqjd5ltSyFn5hUEgXMw2
	 VCIjmReTZLg6GAfCXhntN3Hsu6wTwOj/tkFp0EOb8biA6AOZXqcr2M67w+H4O60n8n
	 Kmf7Kue+wTXKHn3yIxyq1I4N7ywALBhqnpZ7tWnmvZUJQ1tO3UtKa4nnabTdDnNLpp
	 W7BAiNCCXbFyJGVAzUCL6xjLjaebBCq9v2PCSE7kWCNdwaKNq7UHTiDJN/7F7gnIh0
	 DHBE45foWoIktqi75vmphApK5oibocJcdS86P9uuIcD2Ff7z/VWDOreY6lEXePeSzA
	 /peY5TSLygB9w==
Date: Sat, 25 Jul 2026 13:13:49 +0000
From: Yixun Lan <dlan@kernel.org>
To: Zhengyu He <hezhy472013@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Mark Brown <broonie@kernel.org>, Alex Elder <elder@kernel.org>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org, wefu@redhat.com,
	Cody Kang <cody.kang.hk@outlook.com>
Subject: Re: [PATCH 4/4] riscv: dts: spacemit: enable SPI0 on K3 CoM260-IFX
Message-ID: <20260725131349-GKD77545@kernel.org>
References: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-0-969a1b0f783f@gmail.com>
 <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-4-969a1b0f783f@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-4-969a1b0f783f@gmail.com>
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

Hi Zhengyu,


On 07:45 Fri 17 Jul     , Zhengyu He wrote:
> SPI0 is the first enabled PDMA consumer on CoM260-IFX, so enable the
> PDMA controller together with SPI0.
> 
> The board exposes SPI0 on its 40-pin header:
> 
>   pin 19: MOSI
>   pin 21: MISO
>   pin 23: SCLK
>   pin 24: CS0
> 
> Define the pinctrl state used by this header wiring, and describe the SPI
> NOR on chip select 0 for the current validation setup.
> 
> (This was tested using a Winbond W25Q64JV SPI NOR chip.)
> 
It's fine to test spi controller with an external attached NOR flash,
but doesn't make sense to enable it permanently in board dts level.

I think it's probably better to provide as an independent dtso file,
which more flexible to let user decide to enable it or not..

Anyway, I will leave out this patch for further discussion, and
only pick patch 1 & 3 for now, thanks

> Signed-off-by: Cody Kang <cody.kang.hk@outlook.com>
> Signed-off-by: Zhengyu He <hezhy472013@gmail.com>
> ---
>  arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 13 ++++++++++++-
>  arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi   | 21 +++++++++++++++++++++
>  2 files changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> index 238bb03d0e9e..01a7135df864 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> @@ -11,11 +11,22 @@ / {
>  	compatible = "spacemit,k3-com260-ifx", "spacemit,k3-com260", "spacemit,k3";
>  
>  	aliases {
> -		serial0 = &uart0;
>  		ethernet0 = &eth1;
> +		serial0 = &uart0;
> +		spi0 = &spi0;
>  	};
>  
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  };
> +
> +&pdma {
> +	status = "okay";
> +};
> +
> +&spi0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&ssp0_2_cfg>;
> +	status = "okay";
> +};

..
> diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
> index 3ee1471f3798..9b7617f3846c 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
> @@ -679,6 +679,27 @@ pwm19-2-pins {
>  		};
>  	};
>  
> +	/omit-if-no-ref/
> +	ssp0_2_cfg: ssp0-2-cfg {
> +		ssp0-0-pins {
> +			pinmux = <K3_PADCONF(104, 1)>,  /* ssp0 tx */
> +				 <K3_PADCONF(105, 1)>,  /* ssp0 rx */
> +				 <K3_PADCONF(106, 1)>;  /* ssp0 clk */
> +
> +			bias-disable;
> +			drive-strength = <25>;
> +			power-source = <1800>;
> +		};
> +
> +		ssp0-1-pins {
> +			pinmux = <K3_PADCONF(107, 1)>;  /* ssp0 frm */
> +
> +			bias-pull-up = <0>;
> +			drive-strength = <25>;
> +			power-source = <1800>;
> +		};
> +	};
> +
If you can put spi pinctrl data as a separate patch, then I'd be happy
to include, just be sure to list all spi controller pinctrl info

>  	/omit-if-no-ref/
>  	uart0_0_cfg: uart0-0-cfg {
>  		uart0-0-pins {
> 
> -- 
> 2.53.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
