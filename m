Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F958C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Sep 2022 12:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mT+Raf4NZX/hBF6i2UTCRVYJvaFzcMACKuPNNaqz17c=; b=w2ReGQh4pYT61b
	7+8mf8zDWSJS4h+INtB4eX0pCb1q2KFvTwsA/lk39V3tCrZMkiIY7UnRCKOJAiMb2F+l72WPskk5K
	kktJiNZ4Hm8+oB+Bs7zCmiLqD5XEHU7f8Mlyxjk2bCPy+0YyoYcirWwTERa1SJsQAjFzVdUjfi9Jf
	NsKBbkidIxKnVIKTu+o+6I5G+XYedStHshcFKY3VKHFwrB/uuFdjoNJTkJ/mI5sCCjIL1vEYkKj7Z
	byBI+8inpLWlXKHTHOkpCTjyOUfC9RpgRaM9zlSAtv0brWnxM+WL8R6CUD7vNhBJNF/9JZGI4Te4H
	TYVn+vW6u9P+qiQLpFLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeFHI-009Bxq-VW; Fri, 30 Sep 2022 12:38:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeFHE-009Bus-4B
	for linux-riscv@lists.infradead.org; Fri, 30 Sep 2022 12:38:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664541480; x=1696077480;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g97BiHM6o59FUlv7BemhsBNGyRYECFjXlvWFuEOzmqo=;
  b=kSP3f8WqA56kEBmjwNSx09psTs7R+qcPbTMV0SfLvHIDg6furamPZ2LN
   GDZSM9pXr8DV4HKvHAdxK7WZAuxq3yFp0OzbbXbJeMN2cNuxgCqM2Whhk
   jCTdJetTvNAjR9GbJmjgRkHMCaLO7ZznajUTjMXB+TLoBHt+DKCAhBtJF
   U7NfS095DkN4ixbY4ZyCDBU5hW/i1drR/BjZN+UMVdyiigjyAzDFScszm
   j29K7D+r8tMb78ZEjH834z4gvFXMMlHgiDVPmPa2MrBb28dt1sYX9/haO
   qR1+wzIjJZH/ZE7Gpxjkd29Zm5uIMdxPRTbqT9riJLWVknEICC38mvL21
   g==;
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; 
   d="scan'208";a="182692375"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Sep 2022 05:37:56 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 30 Sep 2022 05:37:55 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Fri, 30 Sep 2022 05:37:51 -0700
Date: Fri, 30 Sep 2022 13:37:28 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Hal Feng <hal.feng@linux.starfivetech.com>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-gpio@vger.kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas
 Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Emil
 Renner Berthing <kernel@esmil.dk>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 30/30] RISC-V: Add StarFive JH7100 and JH7110 SoC
 Kconfig options
Message-ID: <YzbjCIfoxjsFCuD1@wendy>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220930122318.9244-1-hal.feng@linux.starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220930122318.9244-1-hal.feng@linux.starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_053800_198984_B9377D83 
X-CRM114-Status: GOOD (  23.66  )
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

On Fri, Sep 30, 2022 at 08:23:18PM +0800, Hal Feng wrote:
> Add Kconfig options to select the specified StarFive SoC. Select
> necessary Kconfig options required by the specified SoC for booting.
> 
> Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
> ---
>  arch/riscv/Kconfig.socs               | 27 ++++++++++++++++++++++++++-
>  arch/riscv/boot/dts/starfive/Makefile |  4 ++--
>  drivers/clk/starfive/Kconfig          | 14 ++++++--------
>  drivers/pinctrl/starfive/Kconfig      |  6 ++----
>  drivers/reset/Kconfig                 |  1 -

Firstly, you cannot change all of these files in one commit, sorry.

>  5 files changed, 36 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 10f68a4359f9..321c448e7b6f 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -22,10 +22,35 @@ config SOC_STARFIVE
>  	bool "StarFive SoCs"
>  	select PINCTRL
>  	select RESET_CONTROLLER
> +	select RESET_STARFIVE

Secondly, we are trying to get rid of selects in arch/riscv at the
moment, not add them. use "default SOC_STARFIVE" in
drivers/reset/kconfig instead please.

> +	help
> +	  This enables support for StarFive SoC platform hardware.
> +
> +if SOC_STARFIVE

I don't think we want to have per soc selection menus in arch code,
I think this should move to drivers/soc (a la Renesas) if you want to
have a per soc selection menu or else just do "default SOC_STARFIVE"
for both clock and pinctrl drivers in the clk and pinctrl Kconfig
entries.

Thanks,
Conor.

> +
> +config SOC_JH7100
> +	bool "StarFive JH7100 SoC support"
> +	depends on SOC_STARFIVE
>  	select SIFIVE_L2
>  	select SIFIVE_PLIC
> +	select CLK_STARFIVE_JH7100
> +	select PINCTRL_STARFIVE_JH7100
> +	default SOC_STARFIVE
>  	help
> -	  This enables support for StarFive SoC platform hardware.
> +	  This enables support for StarFive JH7100 SoC.
> +
> +config SOC_JH7110
> +	bool "StarFive JH7110 SoC support"
> +	depends on SOC_STARFIVE
> +	select SIFIVE_L2
> +	select SIFIVE_PLIC
> +	select CLK_STARFIVE_JH7110_SYS
> +	select PINCTRL_STARFIVE_JH7110
> +	default SOC_STARFIVE
> +	help
> +	  This enables support for StarFive JH7110 SoC.
> +
> +endif
>  
>  config SOC_VIRT
>  	bool "QEMU Virt Machine"
> diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
> index e1237dbc6aac..a6ecd3c2ec7d 100644
> --- a/arch/riscv/boot/dts/starfive/Makefile
> +++ b/arch/riscv/boot/dts/starfive/Makefile
> @@ -1,3 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0
> -dtb-$(CONFIG_SOC_STARFIVE) += jh7100-beaglev-starlight.dtb
> -dtb-$(CONFIG_SOC_STARFIVE) += jh7110-starfive-visionfive-v2.dtb
> +dtb-$(CONFIG_SOC_JH7100) += jh7100-beaglev-starlight.dtb
> +dtb-$(CONFIG_SOC_JH7110) += jh7110-starfive-visionfive-v2.dtb
> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> index 42aad3b553cb..d0490e9f42db 100644
> --- a/drivers/clk/starfive/Kconfig
> +++ b/drivers/clk/starfive/Kconfig
> @@ -5,36 +5,34 @@ config CLK_STARFIVE
>  
>  config CLK_STARFIVE_JH7100
>  	bool "StarFive JH7100 clock support"
> -	depends on SOC_STARFIVE || COMPILE_TEST
> +	depends on SOC_JH7100 || COMPILE_TEST
>  	select CLK_STARFIVE
> -	default SOC_STARFIVE
>  	help
>  	  Say yes here to support the clock controller on the StarFive JH7100
>  	  SoC.
>  
>  config CLK_STARFIVE_JH7100_AUDIO
>  	tristate "StarFive JH7100 audio clock support"
> -	depends on SOC_STARFIVE || COMPILE_TEST
> +	depends on SOC_JH7100 || COMPILE_TEST
>  	select CLK_STARFIVE
> -	default m if SOC_STARFIVE
> +	default m if SOC_JH7100
>  	help
>  	  Say Y or M here to support the audio clocks on the StarFive JH7100
>  	  SoC.
>  
>  config CLK_STARFIVE_JH7110_SYS
>  	bool "StarFive JH7110 system clock support"
> -	depends on SOC_STARFIVE || COMPILE_TEST
> +	depends on SOC_JH7110 || COMPILE_TEST
>  	select CLK_STARFIVE
> -	default SOC_STARFIVE
>  	help
>  	  Say yes here to support the system clock controller on the
>  	  StarFive JH7110 SoC.
>  
>  config CLK_STARFIVE_JH7110_AON
>  	tristate "StarFive JH7110 always-on clock support"
> -	depends on SOC_STARFIVE || COMPILE_TEST
> +	depends on SOC_JH7110 || COMPILE_TEST
>  	select CLK_STARFIVE
> -	default m if SOC_STARFIVE
> +	default m if SOC_JH7110
>  	help
>  	  Say yes here to support the always-on clock controller on the
>  	  StarFive JH7110 SoC.
> diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
> index fde39f4a7922..d09bdf6d3029 100644
> --- a/drivers/pinctrl/starfive/Kconfig
> +++ b/drivers/pinctrl/starfive/Kconfig
> @@ -2,7 +2,7 @@
>  
>  config PINCTRL_STARFIVE_JH7100
>  	tristate "Pinctrl and GPIO driver for the StarFive JH7100 SoC"
> -	depends on SOC_STARFIVE || COMPILE_TEST
> +	depends on SOC_JH7100 || COMPILE_TEST
>  	depends on OF
>  	select GENERIC_PINCTRL_GROUPS
>  	select GENERIC_PINMUX_FUNCTIONS
> @@ -10,7 +10,6 @@ config PINCTRL_STARFIVE_JH7100
>  	select GPIOLIB
>  	select GPIOLIB_IRQCHIP
>  	select OF_GPIO
> -	default SOC_STARFIVE
>  	help
>  	  Say yes here to support pin control on the StarFive JH7100 SoC.
>  	  This also provides an interface to the GPIO pins not used by other
> @@ -28,10 +27,9 @@ config PINCTRL_STARFIVE
>  
>  config PINCTRL_STARFIVE_JH7110
>  	bool "Pinctrl and GPIO driver for the StarFive JH7110 SoC"
> -	depends on SOC_STARFIVE || COMPILE_TEST
> +	depends on SOC_JH7110 || COMPILE_TEST
>  	depends on OF
>  	select PINCTRL_STARFIVE
> -	default SOC_STARFIVE
>  	help
>  	  Say yes here to support pin control on the StarFive JH7110 SoC.
>  	  This also provides an interface to the GPIO pins not used by other
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 8121de5ecc3c..c001879bd890 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -228,7 +228,6 @@ config RESET_SOCFPGA
>  config RESET_STARFIVE
>  	bool "StarFive SoC Reset Driver"
>  	depends on SOC_STARFIVE || COMPILE_TEST
> -	default SOC_STARFIVE
>  	help
>  	  This enables the reset controller driver for the StarFive SoCs.
>  
> -- 
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
