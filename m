Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE69C3ABBE
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 09:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PC0Ov9Htl+Wl70nmGhHbAocNIajwOrt+Yn2r+VVI7vE=; b=sPFvwNSe2gyzd1
	7sssWiG+P2ymoxbftWqaUn2fPNCeNlQbC4ypGF1dqSNQoX99CKugYl3i8LllkBMzxRm2Zge4sdFBE
	mGtQ8ldzKM1c7Z8UIHYO9SbNzluXARsHtUGnS5RUw5MOsRyLviL9iqfYWNzAc8ZGR7IVS/H8TB2ti
	Y3NvASQPmJa7uFemQFSvXx1jLDOHNS44RFRTjidymFDwCCAWCZsseecfIiuYkoPK/5gukSoBZgwpk
	/u1aXKZDrOIMvOFL25gCpyYFeoQAyJT8IAIWf80veQ1YZUbzgIQiV8sU0G+L3ozS7QtlawoDhiv64
	9B9WuQu0Uxi4f8EWoogQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCxST-00000000FBm-0iVu;
	Thu, 08 May 2025 09:22:25 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCx8x-00000000CIA-2jLN
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 09:02:17 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uCx8b-0008Qf-0D; Thu, 08 May 2025 11:01:53 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uCx8Z-001hI1-0c;
	Thu, 08 May 2025 11:01:51 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uCx8Z-0003Eh-0J;
	Thu, 08 May 2025 11:01:51 +0200
Message-ID: <8b5d8045041f2f07b68066e4e541d5e42282fa9b.camel@pengutronix.de>
Subject: Re: [PATCH v6 4/6] reset: spacemit: add support for SpacemiT CCU
 resets
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Alex Elder <elder@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr,  dlan@gentoo.org
Cc: heylenay@4d2.org, inochiama@outlook.com, guodong@riscstar.com, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 spacemit@lists.linux.dev,  linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Thu, 08 May 2025 11:01:50 +0200
In-Reply-To: <20250506210638.2800228-5-elder@riscstar.com>
References: <20250506210638.2800228-1-elder@riscstar.com>
	 <20250506210638.2800228-5-elder@riscstar.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_020215_852777_864BD761 
X-CRM114-Status: GOOD (  26.11  )
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

On Di, 2025-05-06 at 16:06 -0500, Alex Elder wrote:
> Implement reset support for SpacemiT CCUs.  The code is structured to
> handle SpacemiT resets generically, while defining the set of specific
> reset controllers and their resets in an SoC-specific source file.

Are you confident that future SpacemiT CCUs will be sufficiently
similar for this split to make sense? This feels like it could be a
premature abstraction to me.

> A SpacemiT reset controller device is an auxiliary device associated with
> a clock controller (CCU).
> 
> This initial patch defines the reset controllers for the MPMU, APBC, and
> MPMU CCUs, which already defined clock controllers.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  drivers/reset/Kconfig           |   1 +
>  drivers/reset/Makefile          |   1 +
>  drivers/reset/spacemit/Kconfig  |  12 +++
>  drivers/reset/spacemit/Makefile |   7 ++
>  drivers/reset/spacemit/core.c   |  61 +++++++++++
>  drivers/reset/spacemit/core.h   |  39 +++++++
>  drivers/reset/spacemit/k1.c     | 177 ++++++++++++++++++++++++++++++++
>  7 files changed, 298 insertions(+)
>  create mode 100644 drivers/reset/spacemit/Kconfig
>  create mode 100644 drivers/reset/spacemit/Makefile
>  create mode 100644 drivers/reset/spacemit/core.c
>  create mode 100644 drivers/reset/spacemit/core.h
>  create mode 100644 drivers/reset/spacemit/k1.c
> 
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 99f6f9784e686..b1f1af50ca10b 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -354,6 +354,7 @@ source "drivers/reset/amlogic/Kconfig"
>  source "drivers/reset/starfive/Kconfig"
>  source "drivers/reset/sti/Kconfig"
>  source "drivers/reset/hisilicon/Kconfig"
> +source "drivers/reset/spacemit/Kconfig"
>  source "drivers/reset/tegra/Kconfig"
>  
>  endif
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 31f9904d13f9c..6c19fd875ff13 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -2,6 +2,7 @@
>  obj-y += core.o
>  obj-y += amlogic/
>  obj-y += hisilicon/
> +obj-y += spacemit/
>  obj-y += starfive/
>  obj-y += sti/
>  obj-y += tegra/
> diff --git a/drivers/reset/spacemit/Kconfig b/drivers/reset/spacemit/Kconfig
> new file mode 100644
> index 0000000000000..4ff3487a99eff
> --- /dev/null
> +++ b/drivers/reset/spacemit/Kconfig
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config RESET_SPACEMIT
> +	bool
> +
> +config RESET_SPACEMIT_K1
> +	tristate "SpacemiT K1 reset driver"
> +	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	select RESET_SPACEMIT
> +	default ARCH_SPACEMIT
> +	help
> +	  This enables the reset controller driver for the SpacemiT K1 SoC.

Does the size of the K1 specific parts even warrant this per-SoC
Kconfig option? I suggest to only have a user visible tristate
RESET_SPACEMIT option.

> diff --git a/drivers/reset/spacemit/Makefile b/drivers/reset/spacemit/Makefile
> new file mode 100644
> index 0000000000000..3a064e9d5d6b4
> --- /dev/null
> +++ b/drivers/reset/spacemit/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_RESET_SPACEMIT)			+= reset_spacemit.o
> +
> +reset_spacemit-y				:= core.o
> +
> +reset_spacemit-$(CONFIG_RESET_SPACEMIT_K1)	+= k1.o
> diff --git a/drivers/reset/spacemit/core.c b/drivers/reset/spacemit/core.c
> new file mode 100644
> index 0000000000000..5cd981eb3f097
> --- /dev/null
> +++ b/drivers/reset/spacemit/core.c
> @@ -0,0 +1,61 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/* SpacemiT reset driver core */
> +
> +#include <linux/container_of.h>
> +#include <linux/regmap.h>
> +#include <linux/reset-controller.h>
> +#include <linux/types.h>
> +
> +#include "core.h"
> +
> +static int spacemit_reset_update(struct reset_controller_dev *rcdev,
> +				 unsigned long id, bool assert)
> +{
> +	struct ccu_reset_controller *controller;
> +	const struct ccu_reset_data *data;
> +	u32 mask;
> +	u32 val;
> +
> +	controller = container_of(rcdev, struct ccu_reset_controller, rcdev);
> +	data = &controller->data->reset_data[id];
> +	mask = data->assert_mask | data->deassert_mask;
> +	val = assert ? data->assert_mask : data->deassert_mask;
> +
> +	return regmap_update_bits(controller->regmap, data->offset, mask, val);
> +}
> +
> +static int spacemit_reset_assert(struct reset_controller_dev *rcdev,
> +				 unsigned long id)
> +{
> +	return spacemit_reset_update(rcdev, id, true);
> +}
> +
> +static int spacemit_reset_deassert(struct reset_controller_dev *rcdev,
> +				   unsigned long id)
> +{
> +	return spacemit_reset_update(rcdev, id, false);
> +}
> +
> +static const struct reset_control_ops spacemit_reset_control_ops = {
> +	.assert		= spacemit_reset_assert,
> +	.deassert	= spacemit_reset_deassert,
> +};
> +
> +/**
> + * spacemit_reset_controller_register() - register a reset controller
> + * @dev:	Device that's registering the controller
> + * @controller:	SpacemiT CCU reset controller structure
> + */
> +int spacemit_reset_controller_register(struct device *dev,
> +				       struct ccu_reset_controller *controller)
> +{
> +	struct reset_controller_dev *rcdev = &controller->rcdev;
> +
> +	rcdev->ops = &spacemit_reset_control_ops;
> +	rcdev->owner = THIS_MODULE;
> +	rcdev->of_node = dev->of_node;
> +	rcdev->nr_resets = controller->data->count;
> +
> +	return devm_reset_controller_register(dev, &controller->rcdev);
> +}
> diff --git a/drivers/reset/spacemit/core.h b/drivers/reset/spacemit/core.h
> new file mode 100644
> index 0000000000000..a71f835ccb779
> --- /dev/null
> +++ b/drivers/reset/spacemit/core.h
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +/* SpacemiT reset driver core */
> +
> +#ifndef __RESET_SPACEMIT_CORE_H__
> +#define __RESET_SPACEMIT_CORE_H__
> +
> +#include <linux/device.h>

This include can be replaced by forward declarations for struct device
and struct regmap.

> +#include <linux/reset-controller.h>
> +#include <linux/types.h>
> +
> +struct ccu_reset_data {
> +	u32 offset;
> +	u32 assert_mask;
> +	u32 deassert_mask;
> +};
> +
> +#define RESET_DATA(_offset, _assert_mask, _deassert_mask)	\
> +	{							\
> +		.offset		= (_offset),			\
> +		.assert_mask	= (_assert_mask),		\
> +		.deassert_mask	= (_deassert_mask),		\
> +	}
> +
> +struct ccu_reset_controller_data {
> +	const struct ccu_reset_data *reset_data;	/* array */
> +	size_t count;
> +};
> +
> +struct ccu_reset_controller {
> +	struct reset_controller_dev rcdev;
> +	const struct ccu_reset_controller_data *data;
> +	struct regmap *regmap;
> +};
> +
> +extern int spacemit_reset_controller_register(struct device *dev,
> +			      struct ccu_reset_controller *controller);

Drop the extern keyword.

> +
> +#endif /* __RESET_SPACEMIT_CORE_H__ */
> diff --git a/drivers/reset/spacemit/k1.c b/drivers/reset/spacemit/k1.c
> new file mode 100644
> index 0000000000000..19a34f151b214
> --- /dev/null
> +++ b/drivers/reset/spacemit/k1.c
> @@ -0,0 +1,177 @@
[...]
> +static int spacemit_k1_reset_probe(struct auxiliary_device *adev,
> +				   const struct auxiliary_device_id *id)
> +{
> +	struct spacemit_ccu_adev *rdev = to_spacemit_ccu_adev(adev);
> +	const void *data = (void *)id->driver_data;
> +	struct ccu_reset_controller *controller;
> +	struct device *dev = &adev->dev;
> +
> +	controller = devm_kzalloc(dev, sizeof(*controller), GFP_KERNEL);
> +	if (!controller)
> +		return -ENODEV;

-ENOMEM, this is a failed memory allocation.

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
