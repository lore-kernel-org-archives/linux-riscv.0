Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9DECD37B4
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Sep 2023 22:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=iEihRBIOrLofAvJwtuQBABkbwo9r0IFMoFnJJMl9vF0=; b=1PCj7Npq1GTox/hDq+Xqn3Jg8o
	jAPYHIeExXxh2nNZjPZ3YkMYdDtHJPrxjkaB5y2Ov3wGomaNtSpE+6q9/aYaOJ5mSUR6SOG6gnhcE
	4ytV0Wc9LldxKNYQILhSqwgjd2GYVdovv9fR+Lfk0NWPOyqglN+85+3IGNCrSgh6a5KqNgUE9z1ta
	VdMFB+oXpf4LOPVuAZ3/2BANVaX3BSYQ5X7WMNT/YGqlBUcPzofMgj9yPcROP+M4ay8IDiNU9zNpB
	et3TU5MJt2fA/JljxfV7vcfpBVqAhDop2thxfKIXI0n4jLz1s4IV8/3Yk7+meNM3xRYYYX4Pyui3A
	TC6e6rOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi0Wq-00E6E1-1l;
	Sun, 17 Sep 2023 22:46:12 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi0Wk-00E6Cg-3C
	for linux-riscv@lists.infradead.org;
	Sun, 17 Sep 2023 22:46:11 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 040683F682
	for <linux-riscv@lists.infradead.org>; Sun, 17 Sep 2023 22:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1694990760;
	bh=adOo4FRviXb28KWdA8otRonF2VEmbfWYur20KX0COuI=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=LGUb/pVJvZrq99or/E/9rQzExf7zQTu0BIjKNi9cqSe6oekVapYzigHqqAm59wO27
	 g3Z3uzLuWa0B3T5q8E8uu+2NGrrCthgQnfaWnmpZnQOD1XcHF6ChqDQjD8oFdtP8X4
	 scEHG6c1aEWCRLVkHZjeuYQa+hXkw5Fi0/sn3r1wHijrbbsP1dNGEH7/pY4e7y6v5a
	 vxrmsm6PeoFVSVRzqdfLUaZjOgoADptkTab7a12I1THup+e3V00sHGklej1rad271Y
	 Rb82LU9zr2PD9VMpYcrG8Sj/sVWJQkBgb47yUABKhI1T+xUIHqpyselXkpjij7hpuy
	 kaDAvfrfBiaJw==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-414bbfbdf37so45923311cf.1
        for <linux-riscv@lists.infradead.org>; Sun, 17 Sep 2023 15:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694990757; x=1695595557;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=adOo4FRviXb28KWdA8otRonF2VEmbfWYur20KX0COuI=;
        b=wm/jKj+v/hTmvdP7hWjVeJlcyrRY4KwTGW8XIQ3AZsy8j8WNQYK4AYG/CSawRc1Qyv
         IsDDoU457ttpMzdnbiq0WlJ/WflQm6Hg7zAcTly+k+vJ4swfluTXLYpPiPGfwSf5KB4o
         b1rXjYeyTmDj86sCtbl1mvK8ezmoIFSaOKsy50iKlUeSo/8amNvO+qzxSGgFNuw/mEcn
         cTJHAao0g+ujk7WntJ1rLf86MXbAgOB85dFNr3/swD3ATW8Y9fWPsN05WbI2kf1eGgQU
         q1jRnE6TBDcZlErkyjMNl2zDw1/L79+zUkF83v9eGv0IonPKkirjf0DmnwVT2jwrfrsK
         Jj8Q==
X-Gm-Message-State: AOJu0YwmRCcMZY3bDsPhC9gZj6H1odzxnLMDATFpEuvIKCIY/31ab3Cm
	XY6HPlCQB9UTwK9k0qI4YpA+ubN7dxbqZ7aG77Oazpqq6b2OvgkrXDOpBpoMkr/bOf80GSmbvUI
	/HnJW6r9Axg1aR5JCDXc5fG0bar8mrAhD8UGqA2Mx6+xAkU1bo+FM3LbIjWJIqg==
X-Received: by 2002:a05:622a:1302:b0:412:2f9c:668a with SMTP id v2-20020a05622a130200b004122f9c668amr10889367qtk.57.1694990757232;
        Sun, 17 Sep 2023 15:45:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHt0cz9k7AF6FAHvF0DVOz8jPCvqc/EGwEO8ffOLxDdkWRjv6xnCIfuk1vyxEcc2JzipFIjyceX/qG9uZwUOuU=
X-Received: by 2002:a05:622a:1302:b0:412:2f9c:668a with SMTP id
 v2-20020a05622a130200b004122f9c668amr10889360qtk.57.1694990756988; Sun, 17
 Sep 2023 15:45:56 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 17 Sep 2023 15:45:56 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20230915102243.59775-8-minda.chen@starfivetech.com>
References: <20230915102243.59775-1-minda.chen@starfivetech.com> <20230915102243.59775-8-minda.chen@starfivetech.com>
Mime-Version: 1.0
Date: Sun, 17 Sep 2023 15:45:56 -0700
Message-ID: <CAJM55Z-wD4+TUJCsXsbgR49Zux5fuMZQmJ5bXEVW96QVNJbBFQ@mail.gmail.com>
Subject: Re: [PATCH v6 07/19] PCI: plda: Move the setup functions to pcie-plda-host.c
To: Minda Chen <minda.chen@starfivetech.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mason Huo <mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	Kevin Xie <kevin.xie@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_154607_688260_17ED683E 
X-CRM114-Status: GOOD (  23.20  )
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

Minda Chen wrote:
> Move setup functions to common pcie-plda-host.c.
>
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/pci/controller/plda/Kconfig           |  4 +
>  drivers/pci/controller/plda/Makefile          |  1 +
>  .../pci/controller/plda/pcie-microchip-host.c | 59 -------------
>  drivers/pci/controller/plda/pcie-plda-host.c  | 82 +++++++++++++++++++
>  drivers/pci/controller/plda/pcie-plda.h       |  6 ++
>  5 files changed, 93 insertions(+), 59 deletions(-)
>  create mode 100644 drivers/pci/controller/plda/pcie-plda-host.c
>
> diff --git a/drivers/pci/controller/plda/Kconfig b/drivers/pci/controller/plda/Kconfig
> index 5cb3be4fc98c..e54a82ee94f5 100644
> --- a/drivers/pci/controller/plda/Kconfig
> +++ b/drivers/pci/controller/plda/Kconfig
> @@ -3,10 +3,14 @@
>  menu "PLDA-based PCIe controllers"
>  	depends on PCI
>
> +config PCIE_PLDA_HOST
> +	bool
> +
>  config PCIE_MICROCHIP_HOST
>  	tristate "Microchip AXI PCIe controller"
>  	depends on PCI_MSI && OF
>  	select PCI_HOST_COMMON
> +	select PCIE_PLDA_HOST
>  	help
>  	  Say Y here if you want kernel to support the Microchip AXI PCIe
>  	  Host Bridge driver.
> diff --git a/drivers/pci/controller/plda/Makefile b/drivers/pci/controller/plda/Makefile
> index e1a265cbf91c..4340ab007f44 100644
> --- a/drivers/pci/controller/plda/Makefile
> +++ b/drivers/pci/controller/plda/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_PCIE_PLDA_HOST) += pcie-plda-host.o
>  obj-$(CONFIG_PCIE_MICROCHIP_HOST) += pcie-microchip-host.o
> diff --git a/drivers/pci/controller/plda/pcie-microchip-host.c b/drivers/pci/controller/plda/pcie-microchip-host.c
> index 1d253acd6bc2..ac7126b0bacf 100644
> --- a/drivers/pci/controller/plda/pcie-microchip-host.c
> +++ b/drivers/pci/controller/plda/pcie-microchip-host.c
> @@ -837,65 +837,6 @@ static int mc_pcie_init_irq_domains(struct plda_pcie_rp *port)
>  	return mc_allocate_msi_domains(port);
>  }
>
> -static void plda_pcie_setup_window(void __iomem *bridge_base_addr, u32 index,
> -				   phys_addr_t axi_addr, phys_addr_t pci_addr,
> -				   size_t size)
> -{
> -	u32 atr_sz = ilog2(size) - 1;
> -	u32 val;
> -
> -	if (index == 0)
> -		val = PCIE_CONFIG_INTERFACE;
> -	else
> -		val = PCIE_TX_RX_INTERFACE;
> -
> -	writel(val, bridge_base_addr + (index * ATR_ENTRY_SIZE) +
> -	       ATR0_AXI4_SLV0_TRSL_PARAM);
> -
> -	val = lower_32_bits(axi_addr) | (atr_sz << ATR_SIZE_SHIFT) |
> -			    ATR_IMPL_ENABLE;
> -	writel(val, bridge_base_addr + (index * ATR_ENTRY_SIZE) +
> -	       ATR0_AXI4_SLV0_SRCADDR_PARAM);
> -
> -	val = upper_32_bits(axi_addr);
> -	writel(val, bridge_base_addr + (index * ATR_ENTRY_SIZE) +
> -	       ATR0_AXI4_SLV0_SRC_ADDR);
> -
> -	val = lower_32_bits(pci_addr);
> -	writel(val, bridge_base_addr + (index * ATR_ENTRY_SIZE) +
> -	       ATR0_AXI4_SLV0_TRSL_ADDR_LSB);
> -
> -	val = upper_32_bits(pci_addr);
> -	writel(val, bridge_base_addr + (index * ATR_ENTRY_SIZE) +
> -	       ATR0_AXI4_SLV0_TRSL_ADDR_UDW);
> -
> -	val = readl(bridge_base_addr + ATR0_PCIE_WIN0_SRCADDR_PARAM);
> -	val |= (ATR0_PCIE_ATR_SIZE << ATR0_PCIE_ATR_SIZE_SHIFT);
> -	writel(val, bridge_base_addr + ATR0_PCIE_WIN0_SRCADDR_PARAM);
> -	writel(0, bridge_base_addr + ATR0_PCIE_WIN0_SRC_ADDR);
> -}
> -
> -static int plda_pcie_setup_iomems(struct pci_host_bridge *bridge,
> -				  struct plda_pcie_rp *port)
> -{
> -	void __iomem *bridge_base_addr = port->bridge_addr;
> -	struct resource_entry *entry;
> -	u64 pci_addr;
> -	u32 index = 1;
> -
> -	resource_list_for_each_entry(entry, &bridge->windows) {
> -		if (resource_type(entry->res) == IORESOURCE_MEM) {
> -			pci_addr = entry->res->start - entry->offset;
> -			plda_pcie_setup_window(bridge_base_addr, index,
> -					       entry->res->start, pci_addr,
> -					       resource_size(entry->res));
> -			index++;
> -		}
> -	}
> -
> -	return 0;
> -}
> -
>  static inline void mc_clear_secs(struct mc_pcie *port)
>  {
>  	void __iomem *ctrl_base_addr = port->axi_base_addr + MC_PCIE_CTRL_ADDR;
> diff --git a/drivers/pci/controller/plda/pcie-plda-host.c b/drivers/pci/controller/plda/pcie-plda-host.c
> new file mode 100644
> index 000000000000..f0c7636f1f64
> --- /dev/null
> +++ b/drivers/pci/controller/plda/pcie-plda-host.c
> @@ -0,0 +1,82 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * PLDA PCIe XpressRich host controller driver
> + *
> + * Copyright (C) 2023 Microchip Co. Ltd
> + *		      StarFive Co. Ltd.
> + *
> + * Author: Daire McNamara <daire.mcnamara@microchip.com>
> + * Author: Minda Chen <minda.chen@starfivetech.com>
> + */
> +
> +#include <linux/irqchip/chained_irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/msi.h>
> +#include <linux/of_address.h>
> +#include <linux/of_pci.h>
> +#include <linux/pci_regs.h>
> +#include <linux/pci-ecam.h>
> +#include <linux/platform_device.h>
> +
> +#include "pcie-plda.h"
> +
> +void plda_pcie_setup_window(void __iomem *bridge_base_addr, u32 index,
> +			    phys_addr_t axi_addr, phys_addr_t pci_addr,
> +			    size_t size)
> +{
> +	u32 atr_sz = ilog2(size) - 1;
> +	u32 val;
> +
> +	if (index == 0)
> +		val = PCIE_CONFIG_INTERFACE;
> +	else
> +		val = PCIE_TX_RX_INTERFACE;
> +
> +	writel(val, bridge_base_addr + (index * ATR_ENTRY_SIZE) +
> +	       ATR0_AXI4_SLV0_TRSL_PARAM);
> +
> +	val = lower_32_bits(axi_addr) | (atr_sz << ATR_SIZE_SHIFT) |
> +			    ATR_IMPL_ENABLE;
> +	writel(val, bridge_base_addr + (index * ATR_ENTRY_SIZE) +
> +	       ATR0_AXI4_SLV0_SRCADDR_PARAM);
> +
> +	val = upper_32_bits(axi_addr);
> +	writel(val, bridge_base_addr + (index * ATR_ENTRY_SIZE) +
> +	       ATR0_AXI4_SLV0_SRC_ADDR);
> +
> +	val = lower_32_bits(pci_addr);
> +	writel(val, bridge_base_addr + (index * ATR_ENTRY_SIZE) +
> +	       ATR0_AXI4_SLV0_TRSL_ADDR_LSB);
> +
> +	val = upper_32_bits(pci_addr);
> +	writel(val, bridge_base_addr + (index * ATR_ENTRY_SIZE) +
> +	       ATR0_AXI4_SLV0_TRSL_ADDR_UDW);
> +
> +	val = readl(bridge_base_addr + ATR0_PCIE_WIN0_SRCADDR_PARAM);
> +	val |= (ATR0_PCIE_ATR_SIZE << ATR0_PCIE_ATR_SIZE_SHIFT);

I know this code is just a straight copy, but for future cleanups are we
guaranteed that this field is always zero?

Otherwise it looks a little suspicious to do read-modify-write, but just
set the (0x25 << 1) bits without clearing the field first.

> +	writel(val, bridge_base_addr + ATR0_PCIE_WIN0_SRCADDR_PARAM);
> +	writel(0, bridge_base_addr + ATR0_PCIE_WIN0_SRC_ADDR);
> +}
> +EXPORT_SYMBOL_GPL(plda_pcie_setup_window);
> +
> +int plda_pcie_setup_iomems(struct pci_host_bridge *bridge,
> +			   struct plda_pcie_rp *port)
> +{
> +	void __iomem *bridge_base_addr = port->bridge_addr;
> +	struct resource_entry *entry;
> +	u64 pci_addr;
> +	u32 index = 1;
> +
> +	resource_list_for_each_entry(entry, &bridge->windows) {
> +		if (resource_type(entry->res) == IORESOURCE_MEM) {
> +			pci_addr = entry->res->start - entry->offset;
> +			plda_pcie_setup_window(bridge_base_addr, index,
> +					       entry->res->start, pci_addr,
> +					       resource_size(entry->res));
> +			index++;
> +		}
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(plda_pcie_setup_iomems);
> diff --git a/drivers/pci/controller/plda/pcie-plda.h b/drivers/pci/controller/plda/pcie-plda.h
> index d04a571404b9..3deefd35fa5a 100644
> --- a/drivers/pci/controller/plda/pcie-plda.h
> +++ b/drivers/pci/controller/plda/pcie-plda.h
> @@ -119,4 +119,10 @@ struct plda_pcie_rp {
>  	struct plda_msi msi;
>  	void __iomem *bridge_addr;
>  };
> +
> +void plda_pcie_setup_window(void __iomem *bridge_base_addr, u32 index,
> +			    phys_addr_t axi_addr, phys_addr_t pci_addr,
> +			    size_t size);
> +int plda_pcie_setup_iomems(struct pci_host_bridge *bridge,
> +			   struct plda_pcie_rp *port);
>  #endif
> --
> 2.17.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
