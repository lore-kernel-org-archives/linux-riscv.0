Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50F4CAC5AC
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 00:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nDUCs0eDvkK56XaRMOpL8GNVOsza/o4NOd6XkqTdV8A=; b=I9aVuGZo5SRUAu
	hXSKVs4AtlqYNf3WJDU+fDZQiUzz0nB4GxxjXt8KUOM0RFNxqP+zOzXzlxb+LTj2a2k2xn1UPUw8E
	UEeaO9GNr3kjWozeXmRfewL59Di9aVy4tYH5BnThxLZe+AkKqc6yJ4NvbL42r2WU8KUkpnw+YgDyh
	UAMXpd8ufz3Fa4EYx+YZngQciooGZHMQxToBH8iFkG6luAetHaUMpMCqlqqM33/kHWmoDdiQm2XMS
	O9SeQ1+zs5WC13Jl5rmJ7x+a/RganI1AAbDzlVNqQNVO6slV0BG5IXbzYv+U/cCeXkiKGG6eZRo2n
	enTKPKNp2F+lCrKBWyVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0qku-0000000BspW-33FU;
	Tue, 23 Sep 2025 00:19:40 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0qkq-0000000BsoP-2pj5
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 00:19:38 +0000
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id BE58B340F71;
	Tue, 23 Sep 2025 00:19:34 +0000 (UTC)
Date: Tue, 23 Sep 2025 08:19:30 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ziyao@disroot.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] riscv: dts: spacemit: define a SPI controller node
Message-ID: <20250923001930-GYB1303776@gentoo.org>
References: <20250922161717.1590690-1-elder@riscstar.com>
 <20250922161717.1590690-4-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250922161717.1590690-4-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_171936_742222_258347C1 
X-CRM114-Status: GOOD (  20.25  )
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

On 11:17 Mon 22 Sep     , Alex Elder wrote:
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
> v3: - Moved the SPI controller into the dma-bus memory region
> 
>  .../boot/dts/spacemit/k1-bananapi-f3.dts      |  7 +++++++
>  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  | 20 +++++++++++++++++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi          | 16 +++++++++++++++
>  3 files changed, 43 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index 2aaaff77831e1..d9d865fbe320e 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -14,6 +14,7 @@ aliases {
>  		ethernet0 = &eth0;
>  		ethernet1 = &eth1;
>  		serial0 = &uart0;
> +		spi3 = &spi3;
>  	};
>  
>  	chosen {
> @@ -92,6 +93,12 @@ &pdma {
>  	status = "okay";
>  };
>  
> +&spi3 {
> +	pinctrl-0 = <&ssp3_0_cfg>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
>  &uart0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart0_2_cfg>;
> diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> index aff19c86d5ff3..205c201a3005c 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> @@ -76,4 +76,24 @@ pwm14-1-pins {
>  			drive-strength = <32>;
>  		};
>  	};
> +
> +	ssp3_0_cfg: ssp3-0-cfg {
..
> +		ssp3-0-no-pull-pins {
I'd prefer not to enforce "pull" info inside the name, you can't embed
all property info, besides, what's if you want to change/override later?

how about just name it as ssp3-0-defaul-pins or simply ssp3-0-pins?

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
> index 6cdcd80a7c83b..eb8a14dd72ea4 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -797,6 +797,22 @@ uart9: serial@d4017800 {
>  				status = "disabled";
>  			};
>  
> +			spi3: spi@d401c000 {
> +				compatible = "spacemit,k1-spi";
> +				reg = <0x0 0xd401c000 0x0 0x30>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&syscon_apbc CLK_SSP3>,
> +					 <&syscon_apbc CLK_SSP3_BUS>;
> +				clock-names = "core", "bus";
> +				resets = <&syscon_apbc RESET_SSP3>;
> +				interrupts = <55>;
..
> +				dmas = <&pdma 20>,
> +				       <&pdma 19>;
can we also squash the dmas into one line? but, do split if there are too many..

yes, it's simply a style change that I'd like to keep them consistent at DT level,
besides you might also want to adjust dt-binding examples to align with them here..

thanks

> +				dma-names = "rx", "tx";
> +				status = "disabled";
> +			};
> +
>  			/* sec_uart1: 0xf0612000, not available from Linux */
>  		};
>  
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
