Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B94C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 09:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z1vGVyB7tdT58EIV+SiVvEfSza8Lbn+SibfdkWFOqaE=; b=OJ50zdiqIFbm+X
	5YH/OpUZzXEloT3oyzmXjTM78OPwhyBvbs2PoFIex9Vty2kZVi4VjPYDn47VA6nUkedfEvJGho2et
	P40/Ms1ohfef8f2SknLG9xKbZPnELEAs+qo5jsfob6Uv4P5vxh/oBI6QZYvqBRPuYNvU1+M+1c2by
	KCOeOCSuZd4//73nleTSJRG57ff2hStsVwCAf2btbhUZfJu05wjx/nS0M3fChvKcYmh7qSQk9PVw0
	duCkOMD7Vkv6NOWORAUHxTOaLQUTXblSjpndY6au2Egmpsb1IaBCD3aNrHcG2ckUA7BRcL4Kw1EUq
	RfRyu7rhMfyjzRzDotvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD0Ws-008GlE-8b; Wed, 04 Jan 2023 09:57:50 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD0QY-008E9r-1c
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 09:51:19 +0000
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net ([86.15.83.122] helo=[192.168.0.17])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1pD0QG-00G85N-8X; Wed, 04 Jan 2023 09:51:00 +0000
Message-ID: <49bd7b4a-b0e1-3213-8aed-9f39604f3935@codethink.co.uk>
Date: Wed, 4 Jan 2023 09:50:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC v5.1 6/9] cache,soc: Move SiFive CCache driver & create
 drivers/cache
Content-Language: en-GB
To: Conor Dooley <conor@kernel.org>, arnd@arndb.de, palmer@dabbelt.com,
 prabhakar.csengg@gmail.com
Cc: Conor Dooley <conor.dooley@microchip.com>, ajones@ventanamicro.com,
 aou@eecs.berkeley.edu, apatel@ventanamicro.com, atishp@rivosinc.com,
 biju.das.jz@bp.renesas.com, devicetree@vger.kernel.org,
 geert@linux-m68k.org, guoren@kernel.org, hch@infradead.org, heiko@sntech.de,
 jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-riscv@lists.infradead.org, magnus.damm@gmail.com, nathan@kernel.org,
 paul.walmsley@sifive.com, philipp.tomsich@vrull.eu,
 prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org,
 samuel@sholland.org, soc@kernel.org
References: <Y62nOqzyuUKqYDpq@spud>
 <20230103210400.3500626-7-conor@kernel.org>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20230103210400.3500626-7-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_015118_119732_EA215F00 
X-CRM114-Status: GOOD (  21.34  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 03/01/2023 21:03, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The Zicbo* set of extensions for cache maintenance arrived too late &
> several SoCs exist without them that require non-coherent DMA.
> As things stand, the StarFive JH7100, Microchip PolarFire SoC & Renesas
> RZ/Five all require cache maintenance and lack instructions for this
> purpose.
> Create a subsystem for cache drivers so that vendor specific behaviour
> can be isolated from arch code, but keep the interfaces etc consistent.
> Move the existing SiFive CCache driver to create drivers/cache.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   MAINTAINERS                                   | 15 ++++++++-------
>   drivers/Kconfig                               |  2 ++
>   drivers/Makefile                              |  2 ++
>   drivers/{soc/sifive => cache}/Kconfig         |  8 +++++++-
>   drivers/{soc/sifive => cache}/Makefile        |  0
>   drivers/{soc/sifive => cache}/sifive_ccache.c |  2 +-
>   drivers/edac/sifive_edac.c                    |  2 +-
>   drivers/soc/Kconfig                           |  1 -
>   drivers/soc/Makefile                          |  1 -
>   include/{soc/sifive => cache}/sifive_ccache.h |  0
>   10 files changed, 21 insertions(+), 12 deletions(-)
>   rename drivers/{soc/sifive => cache}/Kconfig (56%)
>   rename drivers/{soc/sifive => cache}/Makefile (100%)
>   rename drivers/{soc/sifive => cache}/sifive_ccache.c (99%)
>   rename include/{soc/sifive => cache}/sifive_ccache.h (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f61eb221415b..4437e96a657b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19054,13 +19054,6 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
>   F:	drivers/dma/sf-pdma/
>   
> -SIFIVE SOC DRIVERS
> -M:	Conor Dooley <conor@kernel.org>
> -L:	linux-riscv@lists.infradead.org
> -S:	Maintained
> -T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
> -F:	drivers/soc/sifive/
> -
>   SILEAD TOUCHSCREEN DRIVER
>   M:	Hans de Goede <hdegoede@redhat.com>
>   L:	linux-input@vger.kernel.org
> @@ -19873,6 +19866,14 @@ S:	Supported
>   T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
>   F:	drivers/staging/
>   
> +STANDALONE CACHE CONTROLLER DRIVERS
> +M:	Conor Dooley <conor@kernel.org>
> +L:	linux-riscv@lists.infradead.org
> +S:	Maintained
> +T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
> +F:	drivers/cache
> +F:	include/cache
I thought the riscv list was subscribers only?

Maybe if we do the suggestion of other cache drivers here we should
either use the main kernel one or find some arch non-specific list.

> +
>   STARFIRE/DURALAN NETWORK DRIVER
>   M:	Ion Badulescu <ionut@badula.org>
>   S:	Odd Fixes
> diff --git a/drivers/Kconfig b/drivers/Kconfig
> index 968bd0a6fd78..e592ba5276ae 100644
> --- a/drivers/Kconfig
> +++ b/drivers/Kconfig
> @@ -241,4 +241,6 @@ source "drivers/peci/Kconfig"
>   
>   source "drivers/hte/Kconfig"
>   
> +source "drivers/cache/Kconfig"
> +
>   endmenu
> diff --git a/drivers/Makefile b/drivers/Makefile
> index bdf1c66141c9..6ff60cf21823 100644
> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@ -38,6 +38,8 @@ obj-y				+= clk/
>   # really early.
>   obj-$(CONFIG_DMADEVICES)	+= dma/
>   
> +obj-y				+= cache/
> +
>   # SOC specific infrastructure drivers.
>   obj-y				+= soc/
>   
> diff --git a/drivers/soc/sifive/Kconfig b/drivers/cache/Kconfig
> similarity index 56%
> rename from drivers/soc/sifive/Kconfig
> rename to drivers/cache/Kconfig
> index ed4c571f8771..bc852f005c10 100644
> --- a/drivers/soc/sifive/Kconfig
> +++ b/drivers/cache/Kconfig
> @@ -1,9 +1,15 @@
>   # SPDX-License-Identifier: GPL-2.0
>   
> -if SOC_SIFIVE
> +menuconfig CACHE_CONTROLLER
> +	bool "Cache controller driver support"
> +	default y if RISCV
> +
> +if CACHE_CONTROLLER
>   
>   config SIFIVE_CCACHE
>   	bool "Sifive Composable Cache controller"
> +	depends on RISCV
> +	default y
>   	help
>   	  Support for the composable cache controller on SiFive platforms.
>   

Maybe we should find and move the ARM PL cache controllers and
have them here too?

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
