Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189EFD262B0
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 07:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=csgTgwR/V85yKIBOwhkx7cxe4W8aNxFCAvdn+6IdAsc=; b=0ureBM+cgMN5eQ
	UDnrVyhqGKKQNCSkidjGdZoX1NSkrU/PvvIbp8pRrdMNcvozbXGF5gH1Js/050l/64NfIBmCH00lR
	w2qisS32xInAwUxgEIMEZ4fwLljpa6vnl6LANMs4uYYjok27NuTMH1njUqXgePl1UUg1sZwn/a8rV
	jpydcep0jnFvgxJ5nVRpjSAgK0rIF8Zyl2EM2/IbJxImN+FSJkRqNHZP5XZFSs1rrU5YzQnG+ishn
	EL17/KXszNgPuDBeCP57Dugmlqh4lE41LwgY+S+Y8dyDinfdGGEuHm8gDLygp6HMAoDDxM6A5Yj2C
	3I1zkcmctdo42sPoDwpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSJB-00000004zAj-0U6r;
	Wed, 21 Jan 2026 07:07:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSJ8-00000004zAA-14Cr;
	Wed, 21 Jan 2026 07:07:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E902143839;
	Wed, 21 Jan 2026 07:07:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00CB8C116D0;
	Wed, 21 Jan 2026 07:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768979231;
	bh=D/qLyHaqemYuzX/6TqYrPD10JkyadCvZeTQHZMRgjjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AQAfKaGx2l7So5vR6Sb/9yAdfiXnVwSwF7BVyCPT5Gl8dlA4guXULV9JwgaAi+XZu
	 cZbwYCiY2CzQog11d8mqnHB8RefvzDr8V1Rr2XWCRZqAI5JQT9K+hLMT62h2TbTANq
	 cuK5tk6kEyswVLuJ0nKOBmSolo5nSHyZeq6hY9DXx/ROoQ6n0tYrgRQo2gpwpLtjbp
	 vtpSyfmx6vyN5zynOP4RcK4CR6snVv6/eSa4Svpv85wX454t0zUGWjcmESxBxXUoiX
	 QjQrec+8G9xkT8Ptv0B5PZcDftAh4NcpIzUMNLKg2ulrtNpVu4pJQKsqyC7bU/Dmjl
	 0jORLJgIQmepw==
Date: Wed, 21 Jan 2026 12:37:06 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Cc: gregkh@linuxfoundation.org, conor@kernel.org, neil.armstrong@linaro.org,
	robh@kernel.org, krzk+dt@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] phy: usb: Add driver for Canaan K230 USB 2.0 PHY
Message-ID: <aXB7GqQaxtgKReVa@vaman>
References: <20260120143243.71937-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20260120143243.71937-4-jiayu.riscv@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260120143243.71937-4-jiayu.riscv@isrc.iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_230714_357612_8429186B 
X-CRM114-Status: GOOD (  22.03  )
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

On 20-01-26, 22:32, Jiayu Du wrote:
> Add driver for the USB 2.0 PHY in Canaan K230 SoC, which supports PHY
> initialization and power management.
> 
> Add Kconfig/Makefile under drivers/phy/canaan/.
> 
> Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> ---
>  drivers/phy/Kconfig               |   1 +
>  drivers/phy/Makefile              |   1 +
>  drivers/phy/canaan/Kconfig        |  14 ++
>  drivers/phy/canaan/Makefile       |   2 +
>  drivers/phy/canaan/phy-k230-usb.c | 283 ++++++++++++++++++++++++++++++
>  5 files changed, 301 insertions(+)
>  create mode 100644 drivers/phy/canaan/Kconfig
>  create mode 100644 drivers/phy/canaan/Makefile
>  create mode 100644 drivers/phy/canaan/phy-k230-usb.c
> 
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 142e7b0ef2ef..e37bcceef65a 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -150,6 +150,7 @@ source "drivers/phy/amlogic/Kconfig"
>  source "drivers/phy/apple/Kconfig"
>  source "drivers/phy/broadcom/Kconfig"
>  source "drivers/phy/cadence/Kconfig"
> +source "drivers/phy/canaan/Kconfig"
>  source "drivers/phy/freescale/Kconfig"
>  source "drivers/phy/hisilicon/Kconfig"
>  source "drivers/phy/ingenic/Kconfig"
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index dcbb060c8207..8cef0a447986 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -22,6 +22,7 @@ obj-y					+= allwinner/	\
>  					   apple/	\
>  					   broadcom/	\
>  					   cadence/	\
> +					   canaan/	\
>  					   freescale/	\
>  					   hisilicon/	\
>  					   ingenic/	\
> diff --git a/drivers/phy/canaan/Kconfig b/drivers/phy/canaan/Kconfig
> new file mode 100644
> index 000000000000..1ff8831846d5
> --- /dev/null
> +++ b/drivers/phy/canaan/Kconfig
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Phy drivers for Canaan platforms
> +#
> +config PHY_CANAAN_USB
> +	tristate "Canaan USB2 PHY Driver"
> +	depends on (ARCH_CANAAN || COMPILE_TEST) && OF
> +	select GENERIC_PHY
> +	help
> +	Enable this driver to support the USB 2.0 PHY controller
> +	on Canaan K230 RISC-V SoCs. This PHY controller
> +	provides physical layer functionality for USB 2.0 devices.
> +	If you have a Canaan K230 board and need USB 2.0 support,
> +	say Y or M here.
> diff --git a/drivers/phy/canaan/Makefile b/drivers/phy/canaan/Makefile
> new file mode 100644
> index 000000000000..d73857ba284e
> --- /dev/null
> +++ b/drivers/phy/canaan/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_PHY_CANAAN_USB)		+= phy-k230-usb.o
> diff --git a/drivers/phy/canaan/phy-k230-usb.c b/drivers/phy/canaan/phy-k230-usb.c
> new file mode 100644
> index 000000000000..350950563f60
> --- /dev/null
> +++ b/drivers/phy/canaan/phy-k230-usb.c
> @@ -0,0 +1,283 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Canaan usb PHY driver
> + *
> + * Copyright (C) 2025 Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>

2026 now!

> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/io.h>
> +#include <linux/of_address.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +
> +#define MAX_PHYS		2
> +
> +/* Register offsets within the HiSysConfig system controller */
> +#define K230_USB0_TEST_REG_BASE     0x70
> +#define K230_USB0_CTL_REG_BASE      0xb0
> +#define K230_USB1_TEST_REG_BASE     0x90
> +#define K230_USB1_CTL_REG_BASE      0xb8
> +
> +/* Relative offsets within each PHY's control/test block */
> +#define CTL0_OFFSET		0x00
> +#define CTL1_OFFSET		0x04
> +#define TEST_CTL3_OFFSET	0x0c
> +
> +/* Bit definitions for TEST_CTL3 */
> +#define USB_IDPULLUP0		BIT(4)
> +#define USB_DMPULLDOWN0		BIT(8)
> +#define USB_DPPULLDOWN0		BIT(9)
> +
> +/* USB control register 0 in HiSysConfig system controller */
> +/* PLL Integral Path Tune */
> +#define USB_CTL0_PLLITUNE_MASK		GENMASK(23, 22)
> +
> +/* PLL Proportional Path Tune */
> +#define USB_CTL0_PLLPTUNE_MASK		GENMASK(21, 18)
> +
> +/* PLL Bandwidth Adjustment */
> +#define USB_CTL0_PLLBTUNE_MASK		GENMASK(17, 17)
> +
> +/* VReg18 Bypass Control */
> +#define USB_CTL0_VREGBYPASS_MASK	GENMASK(16, 16)
> +
> +/* Retention Mode Enable */
> +#define USB_CTL0_RETENABLEN_MASK	GENMASK(15, 15)
> +
> +/* Reserved Request Input */
> +#define USB_CTL0_RESREQIN_MASK		GENMASK(14, 14)
> +
> +/* External VBUS Valid Select */
> +#define USB_CTL0_VBUSVLDEXTSEL0_MASK	GENMASK(13, 13)
> +
> +/* OTG Block Disable Control */
> +#define USB_CTL0_OTGDISABLE0_MASK	GENMASK(12, 12)
> +
> +/* Drive VBUS Enable */
> +#define USB_CTL0_DRVVBUS0_MASK		GENMASK(11, 11)
> +
> +/* Autoresume Mode Enable */
> +#define USB_CTL0_AUTORSMENB0_MASK	GENMASK(10, 10)
> +
> +/* HS Transceiver Asynchronous Control */
> +#define USB_CTL0_HSXCVREXTCTL0_MASK	GENMASK(9, 9)
> +
> +/* USB 1.1 Transmit Data */
> +#define USB_CTL0_FSDATAEXT0_MASK	GENMASK(8, 8)
> +
> +/* USB 1.1 SE0 Generation */
> +#define USB_CTL0_FSSE0EXT0_MASK		GENMASK(7, 7)
> +
> +/* USB 1.1 Data Enable */
> +#define USB_CTL0_TXENABLEN0_MASK	GENMASK(6, 6)
> +
> +/* Disconnect Threshold */
> +#define USB_CTL0_COMPDISTUNE0_MASK	GENMASK(5, 3)
> +
> +/* Squelch Threshold */
> +#define USB_CTL0_SQRXTUNE0_MASK		GENMASK(2, 0)
> +
> +/* USB control register 1 in HiSysConfig system controller */
> +/* Data Detect Voltage */
> +#define USB_CTL1_VDATREFTUNE0_MASK	GENMASK(23, 22)
> +
> +/* VBUS Valid Threshold */
> +#define USB_CTL1_OTGTUNE0_MASK		GENMASK(21, 19)
> +
> +/* Transmitter High-Speed Crossover */
> +#define USB_CTL1_TXHSXVTUNE0_MASK	GENMASK(18, 17)
> +
> +/* FS/LS Source Impedance */
> +#define USB_CTL1_TXFSLSTUNE0_MASK	GENMASK(16, 13)
> +
> +/* HS DC Voltage Level */
> +#define USB_CTL1_TXVREFTUNE0_MASK	GENMASK(12, 9)
> +
> +/* HS Transmitter Rise/Fall Time */
> +#define USB_CTL1_TXRISETUNE0_MASK	GENMASK(8, 7)
> +
> +/* USB Source Impedance */
> +#define USB_CTL1_TXRESTUNE0_MASK	GENMASK(6, 5)
> +
> +/* HS Transmitter Pre-Emphasis Current Control */
> +#define USB_CTL1_TXPREEMPAMPTUNE0_MASK	GENMASK(4, 3)
> +
> +/* HS Transmitter Pre-Emphasis Duration Control */
> +#define USB_CTL1_TXPREEMPPULSETUNE0_MASK	GENMASK(2, 2)
> +
> +/* charging detection */
> +#define USB_CTL1_CHRGSRCPUENB0_MASK	GENMASK(1, 0)
> +
> +#define K230_PHY_CTL0_VAL \
> +( \
> +	FIELD_PREP(USB_CTL0_PLLITUNE_MASK, 0x0) | \
> +	FIELD_PREP(USB_CTL0_PLLPTUNE_MASK, 0xc) | \
> +	FIELD_PREP(USB_CTL0_PLLBTUNE_MASK, 0x1) | \
> +	FIELD_PREP(USB_CTL0_VREGBYPASS_MASK, 0x1) | \
> +	FIELD_PREP(USB_CTL0_RETENABLEN_MASK, 0x1) | \
> +	FIELD_PREP(USB_CTL0_RESREQIN_MASK, 0x0) | \
> +	FIELD_PREP(USB_CTL0_VBUSVLDEXTSEL0_MASK, 0x0) | \
> +	FIELD_PREP(USB_CTL0_OTGDISABLE0_MASK, 0x0) | \
> +	FIELD_PREP(USB_CTL0_DRVVBUS0_MASK, 0x1) | \
> +	FIELD_PREP(USB_CTL0_AUTORSMENB0_MASK, 0x0) | \
> +	FIELD_PREP(USB_CTL0_HSXCVREXTCTL0_MASK, 0x0) | \
> +	FIELD_PREP(USB_CTL0_FSDATAEXT0_MASK, 0x0) | \
> +	FIELD_PREP(USB_CTL0_FSSE0EXT0_MASK, 0x0) | \
> +	FIELD_PREP(USB_CTL0_TXENABLEN0_MASK, 0x0) | \
> +	FIELD_PREP(USB_CTL0_COMPDISTUNE0_MASK, 0x3) | \
> +	FIELD_PREP(USB_CTL0_SQRXTUNE0_MASK, 0x3) \
> +)
> +
> +#define K230_PHY_CTL1_VAL \
> +( \
> +	FIELD_PREP(USB_CTL1_VDATREFTUNE0_MASK, 0x1) | \
> +	FIELD_PREP(USB_CTL1_OTGTUNE0_MASK, 0x3) | \
> +	FIELD_PREP(USB_CTL1_TXHSXVTUNE0_MASK, 0x3) | \
> +	FIELD_PREP(USB_CTL1_TXFSLSTUNE0_MASK, 0x3) | \
> +	FIELD_PREP(USB_CTL1_TXVREFTUNE0_MASK, 0x3) | \
> +	FIELD_PREP(USB_CTL1_TXRISETUNE0_MASK, 0x1) | \
> +	FIELD_PREP(USB_CTL1_TXRESTUNE0_MASK, 0x1) | \
> +	FIELD_PREP(USB_CTL1_TXPREEMPAMPTUNE0_MASK, 0x0) | \
> +	FIELD_PREP(USB_CTL1_TXPREEMPPULSETUNE0_MASK, 0x0) | \
> +	FIELD_PREP(USB_CTL1_CHRGSRCPUENB0_MASK, 0x0) \
> +)
> +
> +struct k230_usb_phy_instance {
> +	struct k230_usb_phy_global *global;
> +	struct phy *phy;
> +	u32 test_offset;
> +	u32 ctl_offset;
> +	int index;
> +};
> +
> +struct k230_usb_phy_global {
> +	struct k230_usb_phy_instance phys[MAX_PHYS];
> +	void __iomem *base;
> +};
> +
> +static int k230_usb_phy_power_on(struct phy *phy)
> +{
> +	struct k230_usb_phy_instance *inst = phy_get_drvdata(phy);
> +	struct k230_usb_phy_global *global = inst->global;
> +	void __iomem *base = global->base;
> +	u32 val;

blank line here please

> +	/* Apply recommended settings */
> +	writel(K230_PHY_CTL0_VAL, base + inst->ctl_offset + CTL0_OFFSET);
> +	writel(K230_PHY_CTL1_VAL, base + inst->ctl_offset + CTL1_OFFSET);
> +
> +    /* Configure test register (pull-ups/pull-downs) */

wrong alignment above, pls fix it

-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
