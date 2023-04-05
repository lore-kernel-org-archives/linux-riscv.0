Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324A9C76188
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Apr 2023 11:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N2JXP8kxtKcXyHzfQQ9r3jZc1pRiKk4+Yzm4Z3rX6bc=; b=iA9jFyJoy+Qm/b
	nXGeIbZBdXLf7mz6myHgWAmlMYesr0bUytvsWmP+AoiEmnlYkg+n5kKPBEMB54AqiKOQ9fpggRPiW
	+KmUZZ+lSTuh6F+s5TiTel2s7uxb1jRAFfq4/DCam1SKq4HU2OhjvZB1UORktmoM91LYLsTqR0rJx
	LeFj7SjThrCTGNJAdtzADne3Wby3kVgGXrSwOOISKJ9Q93EfLR5Zbrcz/vm4TILjsV6VztQPQwiEt
	WwanCxXXnP4Cu85qH3HYjUV8H7bAfUpx5AA6c1xMmMlsOMj2QLQgK3qXR9hyDHxLSKZdkK8FD1ADw
	kVpFHurVW2PYuvAwsaqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk1d8-004Jzn-1o;
	Wed, 05 Apr 2023 11:48:46 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk1d5-004Jyq-1c
	for linux-riscv@lists.infradead.org;
	Wed, 05 Apr 2023 11:48:44 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pk1d2-0006eI-Mo; Wed, 05 Apr 2023 13:48:40 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Ben Dooks <ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org,
 Hal Feng <hal.feng@starfivetech.com>
Subject:  Re: [PATCH v7 03/22] clk: starfive: Replace SOC_STARFIVE with ARCH_STARFIVE
Date: Wed, 05 Apr 2023 13:48:39 +0200
Message-ID: <23535525.6Emhk5qWAg@diego>
In-Reply-To: <20230401111934.130844-4-hal.feng@starfivetech.com>
References:  <20230401111934.130844-1-hal.feng@starfivetech.com>
 <20230401111934.130844-4-hal.feng@starfivetech.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_044843_536657_703BD86B 
X-CRM114-Status: GOOD (  17.28  )
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

Am Samstag, 1. April 2023, 13:19:15 CEST schrieb Hal Feng:
> Using ARCH_FOO symbol is preferred than SOC_FOO.
> Set obj-y for starfive/ in Makefile, so the StarFive drivers
> can be compiled with COMPILE_TEST=y but ARCH_STARFIVE=n.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>

> ---
>  drivers/clk/Makefile         | 2 +-
>  drivers/clk/starfive/Kconfig | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index e3ca0d058a25..3bed88d67a3a 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -117,7 +117,7 @@ obj-$(CONFIG_PLAT_SPEAR)		+= spear/
>  obj-y					+= sprd/
>  obj-$(CONFIG_ARCH_STI)			+= st/
>  obj-$(CONFIG_ARCH_STM32)		+= stm32/
> -obj-$(CONFIG_SOC_STARFIVE)		+= starfive/
> +obj-y					+= starfive/
>  obj-$(CONFIG_ARCH_SUNXI)		+= sunxi/
>  obj-y					+= sunxi-ng/
>  obj-$(CONFIG_ARCH_TEGRA)		+= tegra/
> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> index 003bd2d56ce7..ef3517f4a276 100644
> --- a/drivers/clk/starfive/Kconfig
> +++ b/drivers/clk/starfive/Kconfig
> @@ -2,8 +2,8 @@
>  
>  config CLK_STARFIVE_JH7100
>  	bool "StarFive JH7100 clock support"
> -	depends on SOC_STARFIVE || COMPILE_TEST
> -	default SOC_STARFIVE
> +	depends on ARCH_STARFIVE || COMPILE_TEST
> +	default ARCH_STARFIVE
>  	help
>  	  Say yes here to support the clock controller on the StarFive JH7100
>  	  SoC.
> @@ -11,7 +11,7 @@ config CLK_STARFIVE_JH7100
>  config CLK_STARFIVE_JH7100_AUDIO
>  	tristate "StarFive JH7100 audio clock support"
>  	depends on CLK_STARFIVE_JH7100
> -	default m if SOC_STARFIVE
> +	default m if ARCH_STARFIVE
>  	help
>  	  Say Y or M here to support the audio clocks on the StarFive JH7100
>  	  SoC.
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
