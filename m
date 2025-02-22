Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E2AC021B3
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Feb 2025 00:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=irqt5e1DntaKqK1AGJvIHT4FHvenrNZzPuv22toczEI=; b=TruRGfqpHJLFPz
	TvKFcmdwEXtxI75/ZFp59BqLVgwbcsOwB8O8pM3VnpEVQp1OrdbMlh4CfP1XfDd/fQbcNGPiBxOpn
	WUYasFa5W++zCeORUjU6Wv3TJSH3RoO1xQuUxa6yBHLKzWNDPgUegAzRf6qutnnhSnAmRzIT03u/n
	JacwP3tDQFRqVfwtaSWbsZpTgJw5NTOzpRKwbY4l9W7ZIZu2o7CnrkMtZxVliu/uK5wWDayjTtPMD
	jRCqssuGKcGSbr4coI/jpA/Ln1BH15M3RqypEGAxJStR9Fl7d9hd2tucb7NiE7dj8cyYsYpkpNBc3
	Fq+Ebd5kbkInl/ochCrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tldcl-00000007F57-0tuU;
	Sat, 22 Feb 2025 00:44:07 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tldcj-00000007F4V-0iMc
	for linux-riscv@lists.infradead.org;
	Sat, 22 Feb 2025 00:44:06 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7c0893f9aa6so246692385a.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Feb 2025 16:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740185044; x=1740789844; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0mfYiMV8kidUXmGLYF/BaWuuheQWf14kVQL8yo9io9o=;
        b=hF58intfqExnYBo76QZx0W/0FsafruhdaX2K+1mVa5IB4WGH3jcnIkKnGD7Zl/0t5v
         ZAdpT6VnWLZh7jw2rGvYwHFsKPwm6UMwRRo5r0u7alNE+4zeqvnglq+InlPZp2R0VtGf
         0F5VvkzBU2INlFkUyvJxLKtMKCv7wi+6P/wC+DZcrW7eRfk/VDU1n0tZf5ES7rKJSw7Z
         R220jpeFjnG4tQ6Iww3viFa2bZHIkULOO0qg3P8XkgOiZfI1fY/DNjXh+XhTiNbcU5bT
         PMdFRrMYSyuX0Srkp0tFQhbgkYhDxA2aGp2Lpeh6imQK9yntI/gZohyWpcpJ1HuzKkXA
         5I1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740185044; x=1740789844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0mfYiMV8kidUXmGLYF/BaWuuheQWf14kVQL8yo9io9o=;
        b=SlgKMqAdA+wDbC6RjEflRqnwyZh3wsfYWWZEmsyPf5mku33NdGIJHLVJ9oHtAMtOCp
         rr9WUwzAjwhJuQe0phmdkIwgNqAKbWpKSAQypGmCWbioddOKspTDVz497Zuk9dJLRpXZ
         CN4zG844NqEM6p6wBH6jHhw9KblcS8UVWyz6ri8FCLqtow7LkwR+4TIX0a+1zQH6TjID
         WZL4WFKS9VPbPheGgAWkG9DeukdRA6+mQjoj2hcRhvDr4/LMa4Fyrk7NCHUZKWzuv1fk
         HMz9zhBtwHRAKNwjbj5i3lsNSwByKQH1PwEBzDmKJuqYSSQS9fzTyO8W7XtQ4Oe4iDEZ
         2jDw==
X-Forwarded-Encrypted: i=1; AJvYcCUuZexgiTv3rh3p0BsWpL9oBIwIPJAiNERmLZAGgAqP8Rh5rgAc+l3iucUVxGxmPk3i1detzCdLUs//eA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxpPfN6/Ydw4mstRSbNxH+4KkSw8voDSJxhkR6vnRK3OunCJwVA
	QQYWUSAuZAaOPkwaf2Uk9qsOqNEAp6zS8kexDSETxM55LPNs3cM9
X-Gm-Gg: ASbGnctUzevkxb1FW2urMuz9kcHT9flVLc5zIDzLHB5XJ7GU/JjIsTbnXV9cEJDi1B5
	m92dFcbXswHtdiG66vFTnEIIHh7SkLGfbOOwskgxuqC9msipHn9EZ/zo90VHg8aEncsEkf/Xpbb
	y4lACzwn8dw/WALdGJOufs4bHhacljGwTiTNV9PQDCIUtMg+SkVy3K7gUcjXCYPkEWUR0TB10Cj
	RtgCvdKbgpOvpDMNHk9Wxe8jgjNzQuQprJP7Nc/ZE3f0FHRc8mD/sjMMCXNyC0ydwJOwe/ygWrx
	HA==
X-Google-Smtp-Source: AGHT+IFzV+P0z5pv+ZCpM8NN+jOatwS5dJ8bp2X5/A+AMv3Hu8hpM6OiyB0lB2UVj8l8h5auvYUeaw==
X-Received: by 2002:a05:620a:801b:b0:7c0:c42a:7078 with SMTP id af79cd13be357-7c0cf96d0f1mr710092885a.52.1740185043862;
        Fri, 21 Feb 2025 16:44:03 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c096443dc4sm721179685a.60.2025.02.21.16.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 16:44:02 -0800 (PST)
Date: Sat, 22 Feb 2025 08:43:46 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Niklas Cassel <cassel@kernel.org>, 
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/2] PCI: sophgo-dwc: Add Sophgo SG2044 PCIe driver
Message-ID: <fanm6m6fx6cqwalhdvrxmjzsluiyptbvrwbi5ufwbqmxsf62xl@lntprhkjv6tm>
References: <20250221013758.370936-3-inochiama@gmail.com>
 <20250221234958.GA372914@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250221234958.GA372914@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_164405_229786_E211FFEB 
X-CRM114-Status: GOOD (  27.06  )
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

On Fri, Feb 21, 2025 at 05:49:58PM -0600, Bjorn Helgaas wrote:
> On Fri, Feb 21, 2025 at 09:37:56AM +0800, Inochi Amaoto wrote:
> > Add support for DesignWare-based PCIe controller in SG2044 SoC.
> 
> > @@ -341,6 +341,16 @@ config PCIE_ROCKCHIP_DW_EP
> >  	  Enables support for the DesignWare PCIe controller in the
> >  	  Rockchip SoC (except RK3399) to work in endpoint mode.
> >  
> > +config PCIE_SOPHGO_DW
> > +	bool "SOPHGO DesignWare PCIe controller"
> 
> What's the canonical styling of "SOPHGO"?  I see "Sophgo" in the
> subject line and in Chen Wang's SG2042 series.  Pick the official
> styling and use it consistently.
> 

This is my mistake. It should be "Sophgo", I will change it.

> Reorder this so the menuconfig menu items remain alphabetically
> sorted.
> 

I think this order is applied to the entry title in menuconfig,
and is not the config key? If so, I will change it.

> > +	depends on ARCH_SOPHGO || COMPILE_TEST
> > +	depends on PCI_MSI
> > +	depends on OF
> > +	select PCIE_DW_HOST
> > +	help
> > +	  Enables support for the DesignWare PCIe controller in the
> > +	  SOPHGO SoC.
> > +
> >  config PCI_EXYNOS
> >  	tristate "Samsung Exynos PCIe controller"
> >  	depends on ARCH_EXYNOS || COMPILE_TEST
> 
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * PCIe host controller driver for Sophgo SoCs.
> 
> Looks too generic, since Chen Wang's series says Sophgo SG2042 SoC is
> Cadence-based, so this driver apparently doesn't cover all Sophgo
> SoCs.
> 

OK, I will change the description to point it only cover
the controller based on the DesignWare core.

> > + *
> 
> Spurious blank line.
> 
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/irqchip/chained_irq.h>
> > +#include <linux/irqdomain.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/module.h>
> > +#include <linux/phy/phy.h>
> > +#include <linux/property.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/reset.h>
> > +
> > +#include "pcie-designware.h"
> > +
> > +#define to_sophgo_pcie(x)		dev_get_drvdata((x)->dev)
> > +
> > +#define PCIE_INT_SIGNAL			0xc48
> > +#define PCIE_INT_EN			0xca0
> > +
> > +#define PCIE_SIGNAL_INTX_SHIFT		5
> > +#define PCIE_INT_EN_INTX_SHIFT		1
> 
> Define masks with GENMASK() and get rid of the _SHIFT #defines.
> 
> > +#define PCIE_INT_EN_INT_SII		BIT(0)
> > +#define PCIE_INT_EN_INT_INTA		BIT(1)
> > +#define PCIE_INT_EN_INT_INTB		BIT(2)
> > +#define PCIE_INT_EN_INT_INTC		BIT(3)
> > +#define PCIE_INT_EN_INT_INTD		BIT(4)
> 
> These are unused, drop them.
> 
> > +#define PCIE_INT_EN_INT_MSI		BIT(5)
> > +
> > +struct sophgo_pcie {
> > +	struct dw_pcie pci;
> > +	void __iomem *app_base;
> > +	struct clk_bulk_data *clks;
> > +	unsigned int clk_cnt;
> > +	struct reset_control *rst;
> > +	struct irq_domain *irq_domain;
> 
> Indent the member names to align vertically as most other drivers do.
> 
> > +};
> > +
> > +static int sophgo_pcie_readl_app(struct sophgo_pcie *sophgo, u32 reg)
> > +{
> > +	return readl_relaxed(sophgo->app_base + reg);
> > +}
> > +
> > +static void sophgo_pcie_writel_app(struct sophgo_pcie *sophgo, u32 val, u32 reg)
> > +{
> > +	writel_relaxed(val, sophgo->app_base + reg);
> > +}
> > +
> > +static void sophgo_pcie_intx_handler(struct irq_desc *desc)
> > +{
> > +	struct dw_pcie_rp *pp = irq_desc_get_handler_data(desc);
> > +	struct irq_chip *chip = irq_desc_get_chip(desc);
> > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > +	struct sophgo_pcie *sophgo = to_sophgo_pcie(pci);
> > +	unsigned long hwirq = PCIE_SIGNAL_INTX_SHIFT;
> > +	unsigned long reg;
> > +
> > +	chained_irq_enter(chip, desc);
> > +
> > +	reg = sophgo_pcie_readl_app(sophgo, PCIE_INT_SIGNAL);
> > +
> > +	for_each_set_bit_from(hwirq, &reg, PCI_NUM_INTX + PCIE_SIGNAL_INTX_SHIFT)
> 
> Use FIELD_GET() here and iterate through PCI_NUM_INTX.  Then you don't
> need for_each_set_bit_from() and shouldn't need PCIE_SIGNAL_INTX_SHIFT
> here and below.
> 

OK, I will change it

> > +		generic_handle_domain_irq(sophgo->irq_domain,
> > +					  hwirq - PCIE_SIGNAL_INTX_SHIFT);
> > +
> > +	chained_irq_exit(chip, desc);
> > +}
> > +
> > +static void sophgo_intx_mask(struct irq_data *d)
> > +{
> > +	struct dw_pcie_rp *pp = irq_data_get_irq_chip_data(d);
> > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > +	struct sophgo_pcie *sophgo = to_sophgo_pcie(pci);
> > +	unsigned long flags;
> > +	u32 val;
> > +
> > +	raw_spin_lock_irqsave(&pp->lock, flags);
> > +
> > +	val = sophgo_pcie_readl_app(sophgo, PCIE_INT_EN);
> > +	val &= ~BIT(d->hwirq + PCIE_INT_EN_INTX_SHIFT);
> 
> FIELD_PREP().
> 
> > +	sophgo_pcie_writel_app(sophgo, val, PCIE_INT_EN);
> > +
> > +	raw_spin_unlock_irqrestore(&pp->lock, flags);
> > +};
> > +
> > +static void sophgo_intx_unmask(struct irq_data *d)
> > +{
> > +	struct dw_pcie_rp *pp = irq_data_get_irq_chip_data(d);
> > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > +	struct sophgo_pcie *sophgo = to_sophgo_pcie(pci);
> > +	unsigned long flags;
> > +	u32 val;
> > +
> > +	raw_spin_lock_irqsave(&pp->lock, flags);
> > +
> > +	val = sophgo_pcie_readl_app(sophgo, PCIE_INT_EN);
> > +	val |= BIT(d->hwirq + PCIE_INT_EN_INTX_SHIFT);
> 
> Ditto.
> 
> > +	sophgo_pcie_writel_app(sophgo, val, PCIE_INT_EN);
> > +
> > +	raw_spin_unlock_irqrestore(&pp->lock, flags);
> > +};
> > +
> > +static void sophgo_intx_eoi(struct irq_data *d)
> > +{
> > +}
> > +
> > +static struct irq_chip sophgo_intx_irq_chip = {
> > +	.name			= "INTx",
> > +	.irq_mask		= sophgo_intx_mask,
> > +	.irq_unmask		= sophgo_intx_unmask,
> > +	.irq_eoi		= sophgo_intx_eoi,
> 
> Name these ending with the irq_chip field names, e.g.,
> sophgo_intx_irq_mask(), to make them easier to find with grep.
> 
> Bjorn

Thanks, I will take all the comments and improve the driver.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
