Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C10DE7DEEE
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Feb 2026 14:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L4/Dd3L6GC6E4wtYIS2cCdKGa8pMaAqyOre+7wHveyM=; b=mAVzLv0BL+/4to
	BFjQ2B2boeD0MbMb4/tZPVsxU5K1M6I0+b/EGEohBIWlmZUkuO0XdFe/iFh5fLcEkS5jtT9R/1zlo
	QLx9ZJhrUuSnnKYqa4Zb2XFgfp//t0TQ6EBBPdzao6vJsELyCaU4kohbvmS5pM94fm1NnS8Pe+dP5
	dzkfOfYR1OrUfUDjaeyemxsf5ZwlTNUaz7iFjJ+OEfmfi7Jt+LTSU+7znFoDXfvfdbwBFnnUppapf
	UGc6rIWh4bB7TrEyHmUkDULjwZ28FiCjYmcRqp6iMqU68uFUM6zCXv5GFiDZ/QBz5czINF475N7E7
	50uAqR3VcKpewOQZ6ozQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmuYG-000000054Ly-1KdI;
	Mon, 02 Feb 2026 14:05:17 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmuYD-000000054Ld-37RC
	for linux-riscv@lists.infradead.org;
	Mon, 02 Feb 2026 14:05:15 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vmuYC-0003l2-3s; Mon, 02 Feb 2026 15:05:12 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vmuYA-003kK6-33;
	Mon, 02 Feb 2026 15:05:10 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vmuYA-00000000BVX-0mYa;
	Mon, 02 Feb 2026 15:05:10 +0100
Message-ID: <d17eaa6b5fcb22a4c06f7c36408fb919ec60b45e.camel@pengutronix.de>
Subject: Re: [PATCH v4 2/3] reset: tenstorrent: Add reset controller for
 Atlantis
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, Drew Fustini	
 <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, 
	fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com, 
	npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com,
 	bmasney@redhat.com
Date: Mon, 02 Feb 2026 15:05:10 +0100
In-Reply-To: <20260130-atlantis-clocks-v4-2-46de52d52924@oss.tenstorrent.com>
References: <20260130-atlantis-clocks-v4-0-46de52d52924@oss.tenstorrent.com>
	 <20260130-atlantis-clocks-v4-2-46de52d52924@oss.tenstorrent.com>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_060514_113764_27166826 
X-CRM114-Status: GOOD (  21.83  )
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

On Fr, 2026-01-30 at 11:50 -0600, Anirudh Srinivasan wrote:
> Adds Atlantis Reset Controller and auxiliary device definitions for
> reset to share same regmap interface as prcm (clock controller).
> 
> This version of the reset controller driver covers resets from the RCPU
> prcm.
> 
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
>  MAINTAINERS                                |   2 +
>  drivers/reset/Kconfig                      |  11 ++
>  drivers/reset/Makefile                     |   1 +
>  drivers/reset/reset-tenstorrent-atlantis.c | 160 +++++++++++++++++++++++++++++
>  include/soc/tenstorrent/atlantis-prcm.h    |  31 ++++++
>  5 files changed, 205 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0fc7bc6d0458..0cde1774567d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22537,7 +22537,9 @@ T:	git https://github.com/tenstorrent/linux.git
>  F:	Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm.yaml
>  F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
>  F:	arch/riscv/boot/dts/tenstorrent/
> +F:	drivers/reset/reset-tenstorrent-atlantis.c
>  F:	include/dt-bindings/clock/tenstorrent,atlantis-prcm.h
> +F:	include/soc/tenstorrent/
>  
>  RISC-V THEAD SoC SUPPORT
>  M:	Drew Fustini <fustini@kernel.org>
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 6e5d6deffa7d..cade77717492 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -324,6 +324,17 @@ config RESET_SUNXI
>  	help
>  	  This enables the reset driver for Allwinner SoCs.
>  
> +config RESET_TENSTORRENT_ATLANTIS
> +	tristate "Tenstorrent atlantis reset driver"
> +	depends on ARCH_TENSTORRENT || COMPILE_TEST
> +	select AUXILIARY_BUS
> +	default ARCH_TENSTORRENT
> +	help
> +	  This enables the driver for the reset controller
> +	  present in the Tenstorrent Atlantis SoC.
> +	  Enable this option to be able to use hardware
> +	  resets on Atalantis based systems.
> +
>  config RESET_TH1520
>  	tristate "T-HEAD TH1520 reset controller"
>  	depends on ARCH_THEAD || COMPILE_TEST
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 9c3e484dfd81..a31959da0a88 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -41,6 +41,7 @@ obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
>  obj-$(CONFIG_RESET_SPACEMIT) += reset-spacemit.o
>  obj-$(CONFIG_RESET_SUNPLUS) += reset-sunplus.o
>  obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
> +obj-$(CONFIG_RESET_TENSTORRENT_ATLANTIS) += reset-tenstorrent-atlantis.o
>  obj-$(CONFIG_RESET_TH1520) += reset-th1520.o
>  obj-$(CONFIG_RESET_TI_SCI) += reset-ti-sci.o
>  obj-$(CONFIG_RESET_TI_SYSCON) += reset-ti-syscon.o
> diff --git a/drivers/reset/reset-tenstorrent-atlantis.c b/drivers/reset/reset-tenstorrent-atlantis.c
> new file mode 100644
> index 000000000000..6fe9143ad76c
> --- /dev/null
> +++ b/drivers/reset/reset-tenstorrent-atlantis.c
> @@ -0,0 +1,160 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Tenstorrent Atlantis PRCM Reset Driver
> + *
> + * Copyright (c) 2026 Tenstorrent
> + */
> +
> +#include <dt-bindings/clock/tenstorrent,atlantis-prcm.h>
> +#include <linux/auxiliary_bus.h>
> +#include <linux/reset-controller.h>
> +#include <linux/regmap.h>
> +#include <soc/tenstorrent/atlantis-prcm.h>
> +
> +struct atlantis_reset_data {
> +	u8 bit;
> +	u16 reg;
> +	bool active_low;
> +};
> +
> +struct atlantis_reset_controller_data {
> +	const struct atlantis_reset_data *reset_data;
> +	size_t count;
> +};
> +
> +struct atlantis_reset_controller {
> +	struct reset_controller_dev rcdev;
> +	const struct atlantis_reset_controller_data *data;
> +	struct regmap *regmap;
> +};
> +
> +#define to_atlantis_reset_controller(_rcdev) \
> +	container_of((_rcdev), struct atlantis_reset_controller, rcdev)

Please make this an inline function as well. With that,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Since this patch both depends on patch 1 and is a dependency for patch
3, I suppose this should go through the clock tree.

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
