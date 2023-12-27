Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29401C46CD4
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Dec 2023 16:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GsreIO09nEpjCeYNUHwq7Xx7gPtQx3I14obZF5d1P5o=; b=LvqpqirkX2bWaE
	840I8NRLoVKxaFBIGvs4jYTOdz7Lz88uyzmSJr0weyYKL143+e79TyYRVJQ7japLJtJ+6aK01rkCo
	+aWGTFOCy1qZq0eQ575/pjR3W196kre/4by07VEvxXxV5Ivp3ZOMVietQ1kTb9XPI/OxXzz/R1gbh
	uhh0OtuqbmEi41eqCU7YweymzzvEvdx4ARBDAOOi+CJ3U3IuvdUPOmF0kiHeqcID3S/ckHvUpvmTc
	zKkXjuRED0SRInmjQcqDtK2DN4eQ7rRlcTSUukh8hcwuyF8zJTe5GqXa4x4vy5Q7a2725HouvSamo
	fTCmMQdHElfGwNoVR9XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIWLw-00F0Y3-0R;
	Wed, 27 Dec 2023 16:01:52 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIWLs-00F0X0-2F
	for linux-riscv@lists.infradead.org;
	Wed, 27 Dec 2023 16:01:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 26792B80D30;
	Wed, 27 Dec 2023 16:01:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E58BDC433C8;
	Wed, 27 Dec 2023 16:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703692906;
	bh=7a+WYRcymZpVJwO2xqRNQ9oKeNvlyPKazAZWNEeClp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RDUSz3x7DMcbqrF+oP0YkyMUhLwNJJxE/Dz4TDUif8Y+lpEMUwb5QUzgGDUjLbwYH
	 ER3L2Dp84YwnNioNSnTedOYugjwvxlvbhqFjyKvpIvUfrA6qZWaF/5VmFL1mlxUMzz
	 i5aRWIbwA4UQZLqe+eVhkHh9QwOSousYdOvFejTqFva3AdeT7TyGDYnHAS6XmfXawK
	 7wF+PujrT784ySN0YF+40/zR5yAftS5ZJYZLtnkot3wW/UipZILEw88Ka2YQV86flL
	 BLRVuP+nZd37/cT+wdAN4SElBwPp09z2XTol3qjgweuz4oVfhBhRR961NRT/glKFQw
	 1qb76U0TsIzCA==
Date: Wed, 27 Dec 2023 17:01:38 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Conor Dooley <conor@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v13 12/21] PCI: microchip: Add request_event_irq()
 callback function
Message-ID: <ZYxKYhVycTOfbDTI@lpieralisi>
References: <20231214072839.2367-1-minda.chen@starfivetech.com>
 <20231214072839.2367-13-minda.chen@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231214072839.2367-13-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_080149_020019_1B9E01E1 
X-CRM114-Status: GOOD (  24.31  )
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

On Thu, Dec 14, 2023 at 03:28:30PM +0800, Minda Chen wrote:
> PolarFire implements specific PCIe interrupts except PLDA local interrupt.

Please explain to me what you want to say here.

> For lack of MSI controller, these interrupts have to be added to global
> event field. PolarFire PCIe driver also register additional interrupt
> symbol name.

And here.

> PolarFire PCIe contain total 28 interrupts event while PLDA contain 13
> local interrupts event, interrupt to event num mapping is different.

It "is different" in different platforms ? Is that correct ?

> So add a callback function to support different IRQ register function.
> Also Add PLDA default handler function, which will be moved to pcie-
> plda-host.c in moving codes patch.

As I said before, a patch is a single self-contained change, don't
refer to other patches, they may or may not be merged or even exist
by the time this one hits mainline.

Lorenzo

> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../pci/controller/plda/pcie-microchip-host.c | 31 ++++++++++++++++---
>  drivers/pci/controller/plda/pcie-plda.h       |  5 +++
>  2 files changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/plda/pcie-microchip-host.c b/drivers/pci/controller/plda/pcie-microchip-host.c
> index 7b3f4f74745d..624e4e2e97d3 100644
> --- a/drivers/pci/controller/plda/pcie-microchip-host.c
> +++ b/drivers/pci/controller/plda/pcie-microchip-host.c
> @@ -643,6 +643,11 @@ static irqreturn_t mc_event_handler(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> +static irqreturn_t plda_event_handler(int irq, void *dev_id)
> +{
> +	return IRQ_HANDLED;
> +}
> +
>  static void plda_handle_event(struct irq_desc *desc)
>  {
>  	struct plda_pcie_rp *port = irq_desc_get_handler_data(desc);
> @@ -804,6 +809,17 @@ static int mc_pcie_init_clks(struct device *dev)
>  	return 0;
>  }
>  
> +static int mc_request_event_irq(struct plda_pcie_rp *plda, int event_irq,
> +				int event)
> +{
> +	return devm_request_irq(plda->dev, event_irq, mc_event_handler,
> +				0, event_cause[event].sym, plda);
> +}
> +
> +static const struct plda_event mc_event = {
> +	.request_event_irq = mc_request_event_irq,
> +};
> +
>  static int plda_pcie_init_irq_domains(struct plda_pcie_rp *port)
>  {
>  	struct device *dev = port->dev;
> @@ -905,7 +921,9 @@ static void mc_disable_interrupts(struct mc_pcie *port)
>  	writel_relaxed(GENMASK(31, 0), bridge_base_addr + ISTATUS_HOST);
>  }
>  
> -static int plda_init_interrupts(struct platform_device *pdev, struct plda_pcie_rp *port)
> +static int plda_init_interrupts(struct platform_device *pdev,
> +				struct plda_pcie_rp *port,
> +				const struct plda_event *event)
>  {
>  	struct device *dev = &pdev->dev;
>  	int irq;
> @@ -929,8 +947,13 @@ static int plda_init_interrupts(struct platform_device *pdev, struct plda_pcie_r
>  			return -ENXIO;
>  		}
>  
> -		ret = devm_request_irq(dev, event_irq, mc_event_handler,
> -				       0, event_cause[i].sym, port);
> +		if (event->request_event_irq)
> +			ret = event->request_event_irq(port, event_irq, i);
> +		else
> +			ret = devm_request_irq(dev, event_irq,
> +					       plda_event_handler,
> +					       0, NULL, port);
> +
>  		if (ret) {
>  			dev_err(dev, "failed to request IRQ %d\n", event_irq);
>  			return ret;
> @@ -984,7 +1007,7 @@ static int mc_platform_init(struct pci_config_window *cfg)
>  		return ret;
>  
>  	/* Address translation is up; safe to enable interrupts */
> -	ret = plda_init_interrupts(pdev, &port->plda);
> +	ret = plda_init_interrupts(pdev, &port->plda, &mc_event);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/pci/controller/plda/pcie-plda.h b/drivers/pci/controller/plda/pcie-plda.h
> index e3d35cef9894..28ed1374e1de 100644
> --- a/drivers/pci/controller/plda/pcie-plda.h
> +++ b/drivers/pci/controller/plda/pcie-plda.h
> @@ -121,6 +121,11 @@ struct plda_pcie_rp {
>  	int num_events;
>  };
>  
> +struct plda_event {
> +	int (*request_event_irq)(struct plda_pcie_rp *pcie,
> +				 int event_irq, int event);
> +};
> +
>  void plda_pcie_setup_window(void __iomem *bridge_base_addr, u32 index,
>  			    phys_addr_t axi_addr, phys_addr_t pci_addr,
>  			    size_t size);
> -- 
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
