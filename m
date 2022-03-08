Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96D3C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Mar 2022 07:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nd6THCZPrN91mKcvn/BuvrMZ1I+L4YWE5Xg/wKapoLs=; b=tss8JmTh4AFCPl
	YsoQqcrkieq0wviJA8PUVMdZeA1YzAs1vlUQl/Zj5wP3Bg836F2GPcsb2C5kmghCt7On/5ot412Hq
	EAUWhc+XahtOY+d7fSTLlhq0FRo8QiJqJoR/VrNd8loLw5vmat6yud4pFWfRyiLC1ruIqwweUiXDe
	OdB2YuGBCKH8DQjYoDTFfViRfAEIO+mZ4AmGf/ebs2KqmOfmFkUz8wk65rrPrcW86zdYLF6U9pD42
	R65z+2QCly6yAdULcf+D7KoOYLpAIUO0EDacw5JB3zIuzGPV070zznqygYMYGwFjsPUAbcmB4RSH3
	a1CaBsQr5GyGsBN0qYzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRUhW-0037fE-Tc; Tue, 08 Mar 2022 07:56:10 +0000
Received: from isilmar-4.linta.de ([136.243.71.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRUhP-0037bz-1X
 for linux-riscv@lists.infradead.org; Tue, 08 Mar 2022 07:56:05 +0000
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
Received: from owl.dominikbrodowski.net (owl.brodo.linta [10.2.0.111])
 by isilmar-4.linta.de (Postfix) with ESMTPSA id 4FA7B2013FA;
 Tue,  8 Mar 2022 07:55:55 +0000 (UTC)
Received: by owl.dominikbrodowski.net (Postfix, from userid 1000)
 id DF9BF801EA; Tue,  8 Mar 2022 08:55:50 +0100 (CET)
Date: Tue, 8 Mar 2022 08:55:50 +0100
From: Dominik Brodowski <linux@dominikbrodowski.net>
To: conor.dooley@microchip.com
Cc: mpm@selenic.com, herbert@gondor.apana.org.au, lewis.hanly@microchip.com,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] hwrng: mpfs - add polarfire soc hwrng support
Message-ID: <YicMBhn81HmtJMiF@owl.dominikbrodowski.net>
References: <20220307154023.813158-1-conor.dooley@microchip.com>
 <20220307154023.813158-2-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220307154023.813158-2-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_235603_286022_D4093854 
X-CRM114-Status: GOOD (  26.97  )
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

Am Mon, Mar 07, 2022 at 03:40:23PM +0000 schrieb conor.dooley@microchip.com:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add a driver to access the hardware random number generator on the
> Polarfire SoC. The hwrng can only be accessed via the system controller,
> so use the mailbox interface the system controller exposes to access the
> hwrng.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/char/hw_random/Kconfig    |  13 ++++
>  drivers/char/hw_random/Makefile   |   1 +
>  drivers/char/hw_random/mpfs-rng.c | 103 ++++++++++++++++++++++++++++++
>  3 files changed, 117 insertions(+)
>  create mode 100644 drivers/char/hw_random/mpfs-rng.c
> 
> diff --git a/drivers/char/hw_random/Kconfig b/drivers/char/hw_random/Kconfig
> index 9704963f9d50..69f1fd538589 100644
> --- a/drivers/char/hw_random/Kconfig
> +++ b/drivers/char/hw_random/Kconfig
> @@ -385,6 +385,19 @@ config HW_RANDOM_PIC32
>  
>  	  If unsure, say Y.
>  
> +config HW_RANDOM_POLARFIRE_SOC
> +	tristate "Microchip PolarFire SoC Random Number Generator support"
> +	depends on HW_RANDOM && POLARFIRE_SOC_SYS_CTRL
> +	help
> +	  This driver provides kernel-side support for the Random Number
> +	  Generator hardware found on PolarFire SoC (MPFS).
> +
> +	  To compile this driver as a module, choose M here. The
> +	  module will be called mfps_rng.
> +
> +	  If unsure, say N.
> +
> +
>  config HW_RANDOM_MESON
>  	tristate "Amlogic Meson Random Number Generator support"
>  	depends on HW_RANDOM
> diff --git a/drivers/char/hw_random/Makefile b/drivers/char/hw_random/Makefile
> index 584d47ba32f7..3e948cf04476 100644
> --- a/drivers/char/hw_random/Makefile
> +++ b/drivers/char/hw_random/Makefile
> @@ -46,3 +46,4 @@ obj-$(CONFIG_HW_RANDOM_CCTRNG) += cctrng.o
>  obj-$(CONFIG_HW_RANDOM_XIPHERA) += xiphera-trng.o
>  obj-$(CONFIG_HW_RANDOM_ARM_SMCCC_TRNG) += arm_smccc_trng.o
>  obj-$(CONFIG_HW_RANDOM_CN10K) += cn10k-rng.o
> +obj-$(CONFIG_HW_RANDOM_POLARFIRE_SOC) += mpfs-rng.o
> diff --git a/drivers/char/hw_random/mpfs-rng.c b/drivers/char/hw_random/mpfs-rng.c
> new file mode 100644
> index 000000000000..a103c765d021
> --- /dev/null
> +++ b/drivers/char/hw_random/mpfs-rng.c
> @@ -0,0 +1,103 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Microchip PolarFire SoC (MPFS) hardware random driver
> + *
> + * Copyright (c) 2020-2022 Microchip Corporation. All rights reserved.
> + *
> + * Author: Conor Dooley <conor.dooley@microchip.com>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/hw_random.h>
> +#include <linux/platform_device.h>
> +#include <soc/microchip/mpfs.h>
> +
> +#define CMD_OPCODE	0x21
> +#define CMD_DATA_SIZE	0U
> +#define CMD_DATA	NULL
> +#define MBOX_OFFSET	0U
> +#define RESP_OFFSET	0U
> +#define RNG_RESP_BYTES	32U
> +
> +struct mpfs_rng {
> +	struct mpfs_sys_controller *sys_controller;
> +	struct hwrng rng;
> +};
> +
> +static int mpfs_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
> +{
> +	struct mpfs_rng *rng_priv = container_of(rng, struct mpfs_rng, rng);
> +	u32 response_msg[RNG_RESP_BYTES / sizeof(u32)];
> +	unsigned int count = 0, copy_size_bytes;
> +	int ret;
> +
> +	struct mpfs_mss_response response = {
> +		.resp_status = 0U,
> +		.resp_msg = (u32 *)response_msg,
> +		.resp_size = RNG_RESP_BYTES
> +	};
> +	struct mpfs_mss_msg msg = {
> +		.cmd_opcode = CMD_OPCODE,
> +		.cmd_data_size = CMD_DATA_SIZE,
> +		.response = &response,
> +		.cmd_data = CMD_DATA,
> +		.mbox_offset = MBOX_OFFSET,
> +		.resp_offset = RESP_OFFSET
> +	};
> +
> +	while (count < max) {
> +		ret = mpfs_blocking_transaction(rng_priv->sys_controller, &msg);
> +		if (ret)
> +			return ret;
> +
> +		copy_size_bytes = max - count > RNG_RESP_BYTES ? RNG_RESP_BYTES : max - count;
> +		memcpy(buf + count, response_msg, copy_size_bytes);
> +
> +		count += copy_size_bytes;
> +		if (!wait)
> +			break;
> +	}
> +
> +	return count;
> +}
> +
> +static int mpfs_rng_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mpfs_rng *rng_priv;
> +	int ret;
> +
> +	rng_priv = devm_kzalloc(dev, sizeof(*rng_priv), GFP_KERNEL);
> +	if (!rng_priv)
> +		return -ENOMEM;
> +
> +	rng_priv->sys_controller =  mpfs_sys_controller_get(&pdev->dev);
> +	if (IS_ERR(rng_priv->sys_controller))
> +		return dev_err_probe(dev, PTR_ERR(rng_priv->sys_controller),
> +				     "Failed to register system controller hwrng sub device\n");
> +
> +	rng_priv->rng.read = mpfs_rng_read;
> +	rng_priv->rng.name = pdev->name;

Is there also some quality estimation, or should this hwrng only be trusted
if it passes validation by userspace?

Thanks,
	Dominik

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
