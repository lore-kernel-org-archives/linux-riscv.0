Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE42CAC5A0
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 13:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ZQHMUNBNNbeBTTxIGtzVRzkyL+sYD/2FwMToB5w7Wc=; b=fPMkKI0SmrRwuq
	avdhe0NX4gRrkIRGfhSWnW8A8zPACnvivjnLeZmug/FlB06jSot3IVbDg4HLUIGGv/neQc+lReDZy
	s3XORuX7omS837E/26A0hTSPS9RJ+riW+8b9r62Ko/cTXfN1rjvznFNbgOfxwmMkiAVHpf7Sx5yEw
	hQpx7odOHh+Ve7AkZI8m0hUIcLWq877AvkSLla20WYCyssptJtptcYQEfLUiL3Wa74i/5jt2Bz27/
	fZdnYf3rLwMRJyIiBhvyH13mGHciq9Ajm20DS3YeEbsAxuRpp/1ppUFVurl80DXrv1BWvQHik4Ugg
	lYQuWxYJgEMerbIDgFNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzEkM-0000000HYVP-2doz;
	Thu, 18 Sep 2025 13:32:26 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzEkK-0000000HYUx-1zXT
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 13:32:25 +0000
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 30205341F29;
	Thu, 18 Sep 2025 13:32:22 +0000 (UTC)
Date: Thu, 18 Sep 2025 21:32:09 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: define a SPI controller node
Message-ID: <20250918133209-GYB1273705@gentoo.org>
References: <20250917220724.288127-1-elder@riscstar.com>
 <20250917220724.288127-4-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250917220724.288127-4-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_063224_537245_C3995B62 
X-CRM114-Status: GOOD (  17.85  )
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

Hi Alex,

On 17:07 Wed 17 Sep     , Alex Elder wrote:
> Define a node for the fourth SoC SPI controller (number 3) on
> the SpacemiT K1 SoC.
> 
> Enable it on the Banana Pi BPI-F3 board, which exposes this feature
> via its GPIO block:
>   GPIO PIN 19:  MOSI
>   GPIO PIN 21:  MISO
>   GPIO PIN 23:  SCLK
>   GPIO PIN 24:  SS (inverted)
> 
> Define pincontrol configurations for the pins as used on that board.
> 
> (This was tested using a GigaDevice GD25Q64E SPI NOR chip.)
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  .../boot/dts/spacemit/k1-bananapi-f3.dts      |  6 ++++++
>  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  | 20 +++++++++++++++++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi          | 19 ++++++++++++++++++
>  3 files changed, 45 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index 6013be2585428..380d475d2f3f3 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -44,6 +44,12 @@ &pdma {
>  	status = "okay";
>  };
>  
> +&spi3 {
..
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&ssp3_0_cfg>;
Can you swap the order of these two pinctrl properties?
Yes, we currently have some inconsistency in tree, I plan to fix during next cycle

> +	status = "okay";
> +};
> +
>  &uart0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart0_2_cfg>;
> diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> index 3810557374228..16c953eca2aaa 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> @@ -28,4 +28,24 @@ pwm14-1-pins {
>  			drive-strength = <32>;
>  		};
>  	};
> +
> +	ssp3_0_cfg: ssp3-0-cfg {
> +		ssp3-0-no-pull-pins {
> +			pinmux = <K1_PADCONF(75, 2)>,	/* SCLK */
> +				 <K1_PADCONF(77, 2)>,	/* MOSI  */
> +				 <K1_PADCONF(78, 2)>;	/* MISO */
> +
> +			bias-disable;
> +			drive-strength = <19>;
> +			power-source = <3300>;
> +		};
> +
> +		ssp3-0-frm-pins {
> +			pinmux = <K1_PADCONF(76, 2)>;	/* FRM (frame) */
> +
> +			bias-pull-up = <0>;
> +			drive-strength = <19>;
> +			power-source = <3300>;
> +		};
> +	};
>  };
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 66b33a9110ccd..a826cc1ac83d5 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -834,6 +834,25 @@ storage-bus {
>  			#size-cells = <2>;
>  			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>;
>  
> +			spi3: spi@d401c000 {
> +				compatible = "spacemit,k1-spi";
> +				reg = <0x0 0xd401c000 0x0 0x30>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&syscon_apbc CLK_SSP3>,
> +					 <&syscon_apbc CLK_SSP3_BUS>;
..
> +				clock-names = "core",
> +					      "bus";
can you simply put them together in one line? it's kind of tedious to split..
> +				resets = <&syscon_apbc RESET_SSP3>;
> +				interrupts-extended = <&plic 55>;
why use interrupts-extended?
> +				spacemit,k1-ssp-id = <3>;
> +				dmas = <&pdma 20>,
> +				       <&pdma 19>;
.. em, so the SPI will use pdma, then probably you should also adjust Kconfig to
select PDMA driver?

> +				dma-names = "rx",
> +					    "tx";
> +				status = "disabled";
> +			};
> +
>  			emmc: mmc@d4281000 {
>  				compatible = "spacemit,k1-sdhci";
>  				reg = <0x0 0xd4281000 0x0 0x200>;
> -- 
> 2.48.1
> 
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
