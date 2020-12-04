Return-Path: <SRS0=IlQS=FI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E8AC4361A
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Dec 2020 10:49:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8076E229CA
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Dec 2020 10:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8076E229CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LpSZ8IOlfIvq0sRneGUTNu4vfQpOzlfvJTb3HZfOimg=; b=Ffr04KA247vJFFyNp21fRDTDc
	oCiurS0D7E26CPQ4WZ2yzWGc/InR5533NcbMaUEWKY031+I5df3q25dRVKNqAD35+4ao+mpU3ZoBB
	MiRADxxRDzlpgRudvtgLG5R0onbUNqU0/KKYnjymAnOORhyYwKx70gdkqwP5s2C3nLI5Ufg1CvU08
	aJPLJKlvT+IMAoMJSugBTM9ChNkq6yqLYYARigkpIuGRnyqQj3YbrEf/WJkQZhRK0eZii8nxgSvLc
	kUjz5HW09gsJ66hsv6oE/fGiArfaGVw1fvaBcyB2P+bo3I0UKRTna+vtRSatmbxXbU4gXzzWOgjd0
	9/f/tbu0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl8eV-0000MB-Jd; Fri, 04 Dec 2020 10:49:27 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl8eT-0000LM-Fs
 for linux-riscv@lists.infradead.org; Fri, 04 Dec 2020 10:49:26 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kl8eP-0003gF-BW; Fri, 04 Dec 2020 11:49:21 +0100
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kl8eN-0005n7-VC; Fri, 04 Dec 2020 11:49:19 +0100
Message-ID: <aad38b7cbaa2b22092ad466cf01ec7e0c1f08b72.camel@pengutronix.de>
Subject: Re: [PATCH v4 13/21] riscv: Add Canaan Kendryte K210 reset controller
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Damien Le Moal <damien.lemoal@wdc.com>, Palmer Dabbelt
 <palmer@dabbelt.com>,  linux-riscv@lists.infradead.org, Rob Herring
 <robh+dt@kernel.org>,  devicetree@vger.kernel.org, Stephen Boyd
 <sboyd@kernel.org>,  linux-clk@vger.kernel.org, Linus Walleij
 <linus.walleij@linaro.org>,  linux-gpio@vger.kernel.org
Date: Fri, 04 Dec 2020 11:49:19 +0100
In-Reply-To: <20201202032500.206346-14-damien.lemoal@wdc.com>
References: <20201202032500.206346-1-damien.lemoal@wdc.com>
 <20201202032500.206346-14-damien.lemoal@wdc.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_054925_577936_D847A9DB 
X-CRM114-Status: GOOD (  23.70  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Damien,

On Wed, 2020-12-02 at 12:24 +0900, Damien Le Moal wrote:
> Add a reset controller driver for the Canaan Kendryte K210 SoC. This
> driver relies on its syscon compatible parent node (sysctl) for its
> register mapping. Automatically select this driver for compilation
> when the SOC_CANAAN option is selected.
> 
> The MAINTAINERS file is updated, adding the entry "CANAAN/KENDRYTE K210
> SOC RESET CONTROLLER DRIVER" with myself listed as maintainer for this
> driver.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  MAINTAINERS                |   8 +++
>  arch/riscv/Kconfig.socs    |   3 +
>  drivers/reset/Kconfig      |   9 +++
>  drivers/reset/Makefile     |   1 +
>  drivers/reset/reset-k210.c | 141 +++++++++++++++++++++++++++++++++++++
>  5 files changed, 162 insertions(+)
>  create mode 100644 drivers/reset/reset-k210.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a059ab02fa8a..c2b3d6e48cd5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3837,6 +3837,14 @@ L:	linux-gpio@vger.kernel.org (pinctrl driver)
>  F:	Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml
>  F:	drivers/pinctrl/pinctrl-k210.c
>  
> +CANAAN/KENDRYTE K210 SOC RESET CONTROLLER DRIVER
> +M:	Damien Le Moal <damien.lemoal@wdc.com>
> +L:	linux-kernel@vger.kernel.org
> +L:	linux-riscv@lists.infradead.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml
> +F:	drivers/reset/reset-k210.c
> +
>  CANAAN/KENDRYTE K210 SOC SYSTEM CONTROLLER DRIVER
>  M:	Damien Le Moal <damien.lemoal@wdc.com>
>  L:	linux-riscv@lists.infradead.org
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 68bdd664b5c2..b3cd253ec2c2 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -33,6 +33,9 @@ config SOC_CANAAN
>  	select CLK_K210
>  	select PINCTRL
>  	select PINCTRL_K210
> +	select ARCH_HAS_RESET_CONTROLLER
> +	select RESET_CONTROLLER
> +	select RESET_K210
>  	help
>  	  This enables support for Canaan Kendryte K210 SoC platform hardware.
>  
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 07d162b179fc..529d206cfdfd 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -245,6 +245,15 @@ config RESET_ZYNQ
>  	help
>  	  This enables the reset controller driver for Xilinx Zynq SoCs.
>  
> +config RESET_K210
> +	bool "Reset controller driver for Canaan Kendryte K210 SoC"
> +	depends on RISCV && SOC_CANAAN
> +	depends on OF && MFD_SYSCON
> +	help
> +	  Support for the Canaan Kendryte K210 RISC-V SoC reset controller.
> +	  Say Y if you want to control reset signals provided by this
> +	  controller.
> +
>  source "drivers/reset/sti/Kconfig"
>  source "drivers/reset/hisilicon/Kconfig"
>  source "drivers/reset/tegra/Kconfig"
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 16947610cc3b..1730a31e6871 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -33,4 +33,5 @@ obj-$(CONFIG_RESET_UNIPHIER) += reset-uniphier.o
>  obj-$(CONFIG_RESET_UNIPHIER_GLUE) += reset-uniphier-glue.o
>  obj-$(CONFIG_RESET_ZYNQ) += reset-zynq.o
>  obj-$(CONFIG_ARCH_ZYNQMP) += reset-zynqmp.o
> +obj-$(CONFIG_RESET_K210) += reset-k210.o
>  
> diff --git a/drivers/reset/reset-k210.c b/drivers/reset/reset-k210.c
> new file mode 100644
> index 000000000000..2cf9a63c763d
> --- /dev/null
> +++ b/drivers/reset/reset-k210.c
> @@ -0,0 +1,141 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 Western Digital Corporation or its affiliates.
> + */
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
> +#include <linux/delay.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/regmap.h>
> +#include <soc/canaan/k210-sysctl.h>
> +
> +#include <dt-bindings/reset/k210-rst.h>
> +
> +#define K210_RST_MASK	0x27FFFFFF
> +
> +struct k210_rst {
> +	struct regmap *map;
> +	struct reset_controller_dev rcdev;
> +};
> +
> +static inline struct k210_rst *
> +to_k210_rst(struct reset_controller_dev *rcdev)
> +{
> +	return container_of(rcdev, struct k210_rst, rcdev);
> +}
> +
> +static inline int k210_rst_assert(struct reset_controller_dev *rcdev,
> +				  unsigned long id)
> +{
> +	struct k210_rst *ksr = to_k210_rst(rcdev);
> +	u32 bit = BIT(id);
> +
> +	if (!(bit & K210_RST_MASK))
> +		return -EINVAL;

Instead of checking this mask in the k210_rst_assert/deassert/status()
functions, you could implement a custom .of_xlate callback and disallow
requesting invalid resets in the first place.

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
