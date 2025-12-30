Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F939E95A79
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 12:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mRDCWdei38ab2It+FVM2vOGv2h09CUSx69/2inSDw9I=; b=2o88HraiQ14Z/5
	25nCrt64gulFu0AJ4XqMew52YlLY6bA3OOPzAEUIES6N8Ak6wsBjjy2PRtHc2axgjMgP/KOxOL0In
	3QT1Epd7Wduh4PYAEwJBg1fP9CDHtemJUmbRUPSdhVnQXdTNVo3kaJy55bmdmPXKrli9+LZV2PFva
	oCL8EEzwwbr+5p2fov63TUNrq3OfUwQsxScjzUOcNNbgkaYFyJoOZNGLjGXm0TVHGZJudGD5004ON
	LKzb0nXYy5qSzUIdJcpNaH1VVKAsu8GL6uc2rvh7yBu1Ng1MkppObdwptR8gmsf6F7j/pGhG/ReTx
	NCGpqvP0cCXgkwH/f5fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaYkz-00000004nS4-1qEf;
	Tue, 30 Dec 2025 12:23:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaYky-00000004nRx-1aRz
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 12:23:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D0EF60017;
	Tue, 30 Dec 2025 12:23:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95C3FC113D0;
	Tue, 30 Dec 2025 12:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767097399;
	bh=KFozgOwkrIP/8Wz1bCtD0xpMQq74yr5RcYSF5oOZAt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nnXdwon3E7LB89cjTgmRlwiX2Cqg39jwTEiP+ZsJX8pw5726+4VYVhWmZJFo9EkCB
	 lyb5/EU0JHJX7hTz7Be+na9tECb/8qFsIV9a1dW5PoSIwDrgBPGg8GQZolDjpPNqhp
	 4EpaDGMTWgW7N/UZeNcLy1uZAFPabvXZmni+uqZTNHIfTu/Ul3to+rQzyZpYnIOZxk
	 yJhSJuEnrFkllvVUox8L8jwSTpZXhtUgNz2VNgzZpNgo+FOdC+vWAt8ykXzHSqs4WU
	 3NRPURcyJK7rhRhzAOyu7Y1e8XPBEAs8ofMMaWBvmg3LZzoqyM7Cre2Zz80wVLKSkL
	 4iHenOQXlsWKg==
Date: Tue, 30 Dec 2025 13:23:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 3/4] reset: spacemit: Extract common K1 reset code
Message-ID: <20251230-dashing-black-skink-45e5a6@quoll>
References: <20251229-k3-reset-v1-0-eda0747bded3@riscstar.com>
 <20251229-k3-reset-v1-3-eda0747bded3@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251229-k3-reset-v1-3-eda0747bded3@riscstar.com>
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

On Mon, Dec 29, 2025 at 07:04:06PM +0800, Guodong Xu wrote:
> Extract the common reset controller code from the K1 driver into
> separate reset-spacemit-common.{c,h} files. This prepares for
> additional SpacemiT SoCs that share the same reset controller
> architecture.
> 
> The common code now includes handlers for reset assert
> deassert operations and probing for auxiliary bus devices.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
>  drivers/reset/spacemit/Kconfig                 |  17 +++-
>  drivers/reset/spacemit/Makefile                |   2 +
>  drivers/reset/spacemit/reset-spacemit-common.c |  79 +++++++++++++++++
>  drivers/reset/spacemit/reset-spacemit-common.h |  53 ++++++++++++
>  drivers/reset/spacemit/reset-spacemit-k1.c     | 113 +++----------------------
>  5 files changed, 158 insertions(+), 106 deletions(-)
> 
> diff --git a/drivers/reset/spacemit/Kconfig b/drivers/reset/spacemit/Kconfig
> index 552884e8b72a..56a4858b30e1 100644
> --- a/drivers/reset/spacemit/Kconfig
> +++ b/drivers/reset/spacemit/Kconfig
> @@ -1,10 +1,20 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
> -config RESET_SPACEMIT_K1
> -	tristate "SpacemiT K1 reset driver"
> +menu "Reset support for SpacemiT platforms"
>  	depends on ARCH_SPACEMIT || COMPILE_TEST
> -	depends on SPACEMIT_K1_CCU
> +
> +config RESET_SPACEMIT_COMMON
> +	tristate
>  	select AUXILIARY_BUS
> +	help
> +	  Common reset controller infrastructure for SpacemiT SoCs.
> +	  This provides shared code and helper functions used by
> +	  reset drivers for various SpacemiT SoC families.
> +
> +config RESET_SPACEMIT_K1
> +	tristate "Support for SpacemiT K1 SoC"
> +	depends on SPACEMIT_K1_CCU
> +	select RESET_SPACEMIT_COMMON
>  	default SPACEMIT_K1_CCU
>  	help
>  	  Support for reset controller in SpacemiT K1 SoC.
> @@ -12,3 +22,4 @@ config RESET_SPACEMIT_K1
>  	  unit (CCU) driver to provide reset control functionality
>  	  for various peripherals and subsystems in the SoC.
>  
> +endmenu
> diff --git a/drivers/reset/spacemit/Makefile b/drivers/reset/spacemit/Makefile
> index de7e358c74fd..fecda9f211b2 100644
> --- a/drivers/reset/spacemit/Makefile
> +++ b/drivers/reset/spacemit/Makefile
> @@ -1,3 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_RESET_SPACEMIT_COMMON)	+= reset-spacemit-common.o
> +
>  obj-$(CONFIG_RESET_SPACEMIT_K1)		+= reset-spacemit-k1.o
>  
> diff --git a/drivers/reset/spacemit/reset-spacemit-common.c b/drivers/reset/spacemit/reset-spacemit-common.c
> new file mode 100644
> index 000000000000..e4b3f0e2c59d
> --- /dev/null
> +++ b/drivers/reset/spacemit/reset-spacemit-common.c
> @@ -0,0 +1,79 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/* SpacemiT reset controller driver - common implementation */
> +
> +#include <linux/container_of.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +
> +#include <soc/spacemit/ccu.h>
> +
> +#include "reset-spacemit-common.h"
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
> +const struct reset_control_ops spacemit_reset_control_ops = {
> +	.assert		= spacemit_reset_assert,
> +	.deassert	= spacemit_reset_deassert,
> +};
> +EXPORT_SYMBOL_GPL(spacemit_reset_control_ops);
> +
> +static int spacemit_reset_controller_register(struct device *dev,
> +					      struct ccu_reset_controller *controller)
> +{
> +	struct reset_controller_dev *rcdev = &controller->rcdev;
> +
> +	rcdev->ops = &spacemit_reset_control_ops;
> +	rcdev->owner = THIS_MODULE;

So who is now the owner? This module or actual driver calling and using
this?

This feels buggy, assuming this is a module and your
MODULE_DESCRIPTION() clearly suggests that.


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
