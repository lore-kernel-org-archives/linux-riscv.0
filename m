Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3FEC021AA
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 09:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q+p0EGsdqPGbvlV2aa7dr+i/6QdkHljKQETToqOtsYI=; b=bVZ4otQPstNZF8
	ta8Ko+V1nxR2SCXf+mDY1CELOFU96Vsb5An8oT3Q7b9xpEYvEDRYuK/GzM7AYdkfNCyIzmvVUYhVD
	Ev8swycXa3zO5h5vxDJQb/G6IyeXG71BXuH+XMHhxv/YTGn0Hl0VT8t/lCBkLssUi81xssXoZuexX
	Ukn2NRuBnF6j3lGs80ARVCbuFVxfEXfHbQFre3XK8LAqquMiUT1Ea7lmduhTOWQ04FnhAfQoYOwin
	XKALLIfaNhNRHOWFTkf3qu9SMwm0KWjYd2wjGhP3wEM6wBaB0rGjIitBPou0pOQzjx94Wy0a/Uzq2
	GKFE8tJWOh7Dlf+EqFNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlP1q-00000004qiZ-1OGJ;
	Fri, 21 Feb 2025 09:09:02 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlP1B-00000004qZt-3ASw
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 09:08:23 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tlP0n-0006M5-JE; Fri, 21 Feb 2025 10:07:57 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tlP0k-0024nY-2Z;
	Fri, 21 Feb 2025 10:07:54 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tlP0k-0002L0-29;
	Fri, 21 Feb 2025 10:07:54 +0100
Message-ID: <d31a48ebfc0f91de615af75e313caa6afbdd597d.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] PCI: sophgo-dwc: Add Sophgo SG2044 PCIe driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Inochi Amaoto <inochiama@gmail.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>,  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Niklas Cassel <cassel@kernel.org>,  Shashank Babu
 Chinta Venkata <quic_schintav@quicinc.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li
	 <looong.bin@gmail.com>
Date: Fri, 21 Feb 2025 10:07:54 +0100
In-Reply-To: <20250221013758.370936-3-inochiama@gmail.com>
References: <20250221013758.370936-1-inochiama@gmail.com>
	 <20250221013758.370936-3-inochiama@gmail.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_010821_792830_D604081F 
X-CRM114-Status: GOOD (  13.90  )
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

On Fr, 2025-02-21 at 09:37 +0800, Inochi Amaoto wrote:
> Add support for DesignWare-based PCIe controller in SG2044 SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  drivers/pci/controller/dwc/Kconfig          |  10 +
>  drivers/pci/controller/dwc/Makefile         |   1 +
>  drivers/pci/controller/dwc/pcie-dw-sophgo.c | 282 ++++++++++++++++++++
>  3 files changed, 293 insertions(+)
>  create mode 100644 drivers/pci/controller/dwc/pcie-dw-sophgo.c
> 
[...]
> diff --git a/drivers/pci/controller/dwc/pcie-dw-sophgo.c b/drivers/pci/controller/dwc/pcie-dw-sophgo.c
> new file mode 100644
> index 000000000000..a4ca4f1e26e0
> --- /dev/null
> +++ b/drivers/pci/controller/dwc/pcie-dw-sophgo.c
> @@ -0,0 +1,282 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * PCIe host controller driver for Sophgo SoCs.
> + *
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/irqchip/chained_irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/phy/phy.h>
> +#include <linux/property.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>

Drop this ...

> +
> +#include "pcie-designware.h"
> +
> +#define to_sophgo_pcie(x)		dev_get_drvdata((x)->dev)
> +
> +#define PCIE_INT_SIGNAL			0xc48
> +#define PCIE_INT_EN			0xca0
> +
> +#define PCIE_SIGNAL_INTX_SHIFT		5
> +
> +#define PCIE_INT_EN_INTX_SHIFT		1
> +#define PCIE_INT_EN_INT_SII		BIT(0)
> +#define PCIE_INT_EN_INT_INTA		BIT(1)
> +#define PCIE_INT_EN_INT_INTB		BIT(2)
> +#define PCIE_INT_EN_INT_INTC		BIT(3)
> +#define PCIE_INT_EN_INT_INTD		BIT(4)
> +#define PCIE_INT_EN_INT_MSI		BIT(5)
> +
> +struct sophgo_pcie {
> +	struct dw_pcie pci;
> +	void __iomem *app_base;
> +	struct clk_bulk_data *clks;
> +	unsigned int clk_cnt;
> +	struct reset_control *rst;

... and this. It is unused.


regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
