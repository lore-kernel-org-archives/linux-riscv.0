Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11F4C46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Dec 2023 16:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DnH+7L6QgOiT0ZlddpdqDy369IAUBB6ZiNiyjEH2gNo=; b=oTbJQwCNbF/FhA
	V50VbeIR3ZTOty0gbtBZD1S36ybtPIXWCvdXHjrkAMCqQ0A2/9/usIS6GbR+Mmsbtetb9SficQBzy
	JuAyW7qewaHgPLwifgu8zraSYEY4WRAheKDAxh2/79zGh0GgHmvT/5ebt3JVtD76rzmIalKkuMA9x
	044/GyfKD97ZjF3Lja0lFBmJkcKV8uH9ihQv0x+1yDOECoLXJu89XooQUOl3VlVXV0cEJhxZFgjZf
	GBXpzI8JuUlyVD0UzpIRMriZSJmQynwnJwik6z4u23ZKFVClZQBaHk2SUM/zYR+2zXdKjtaZ2sL48
	KEmleNlP7VLhEebKZu+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIWpY-00F5jV-0t;
	Wed, 27 Dec 2023 16:32:28 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIWpR-00F5fc-0g
	for linux-riscv@lists.infradead.org;
	Wed, 27 Dec 2023 16:32:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 876B9CE12A4;
	Wed, 27 Dec 2023 16:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27BEEC433C7;
	Wed, 27 Dec 2023 16:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703694726;
	bh=qHvz5PL3DyDEfU+agFYX2QOF0tgzoXWZYQyMsGW40TU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lcjkANPKjExwr803GzRvl1JFa34rtgCRR1O6vN32Xs0xwwZ+KriSey1zZDQvO2ZRz
	 1sINaVMrj6NFi2oziIcG85CHdEis6o13Hjf4F9wJGr0AomWH+QoicIJZbZPkhsMj8j
	 E3gyv2DCCF/CTnyg8mIpttCF91pTnXQ2Eo2bXBJ/umzGPnk+wJLpXafzrb891BzDLz
	 oqCX1s2mFdo18yY1obKZLH1dqqlctgX+RWC8Hk/1qktPXEmKlLggKt1t/D38pca72q
	 /smMH4j3jhpkkcFBSFjV6LVmRX7fESsfugWIPwSU957gTkYgjMGWpjugIw/GGhJrnt
	 fWp7u40P9Jq6g==
Date: Wed, 27 Dec 2023 17:31:59 +0100
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
Subject: Re: [PATCH v13 14/21] PCI: microchip: Add get_events() callback and
 add PLDA get_event()
Message-ID: <ZYxRf8d0+gSoqeRs@lpieralisi>
References: <20231214072839.2367-1-minda.chen@starfivetech.com>
 <20231214072839.2367-15-minda.chen@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231214072839.2367-15-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_083221_700176_35DF9CB4 
X-CRM114-Status: GOOD (  27.60  )
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

On Thu, Dec 14, 2023 at 03:28:32PM +0800, Minda Chen wrote:
> PolarFire implements its own PCIe interrupts, additional to the regular
> PCIe interrupts, due to lack of an MSI controller, so the interrupt to
> event number mapping is different to the PLDA local interrupts,

I am sorry I don't understand what you mean here.

"its own PCIe interrupts" ?

"regular PCIe interrupts" ?

"PLDA local interrupts" ?

Can you spell out what those are referring to please ?

Thanks,
Lorenzo

> necessitating a custom get_events() implementation.
> 
> plda_get_events() adds interrupt register to PLDA local event num mapping
> codes except DMA engine interrupt events. The DMA engine interrupt events
> are implemented by vendors.
> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../pci/controller/plda/pcie-microchip-host.c | 35 ++++++++++++++++++-
>  drivers/pci/controller/plda/pcie-plda.h       | 33 +++++++++++++++++
>  2 files changed, 67 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/plda/pcie-microchip-host.c b/drivers/pci/controller/plda/pcie-microchip-host.c
> index 00250781b11c..fd0d92c3d03f 100644
> --- a/drivers/pci/controller/plda/pcie-microchip-host.c
> +++ b/drivers/pci/controller/plda/pcie-microchip-host.c
> @@ -627,6 +627,26 @@ static u32 mc_get_events(struct plda_pcie_rp *port)
>  	return events;
>  }
>  
> +static u32 plda_get_events(struct plda_pcie_rp *port)
> +{
> +	u32 events, val, origin;
> +
> +	origin = readl_relaxed(port->bridge_addr + ISTATUS_LOCAL);
> +
> +	/* Error events and doorbell events */
> +	events = (origin & ERROR_AND_DOORBELL_MASK) >> A_ATR_EVT_POST_ERR_SHIFT;
> +
> +	/* INTx events */
> +	if (origin & PM_MSI_INT_INTX_MASK)
> +		events |= BIT(EVENT_PM_MSI_INT_INTX);
> +
> +	/* MSI event and sys events */
> +	val = (origin & SYS_AND_MSI_MASK) >> PM_MSI_INT_MSI_SHIFT;
> +	events |= val << EVENT_PM_MSI_INT_MSI;
> +
> +	return events;
> +}
> +
>  static irqreturn_t mc_event_handler(int irq, void *dev_id)
>  {
>  	struct plda_pcie_rp *port = dev_id;
> @@ -657,7 +677,7 @@ static void plda_handle_event(struct irq_desc *desc)
>  
>  	chained_irq_enter(chip, desc);
>  
> -	events = mc_get_events(port);
> +	events = port->event_ops->get_events(port);
>  
>  	for_each_set_bit(bit, &events, port->num_events)
>  		generic_handle_domain_irq(port->event_domain, bit);
> @@ -751,6 +771,10 @@ static struct irq_chip mc_event_irq_chip = {
>  	.irq_unmask = mc_unmask_event_irq,
>  };
>  
> +static const struct plda_event_ops plda_event_ops = {
> +	.get_events = plda_get_events,
> +};
> +
>  static int plda_pcie_event_map(struct irq_domain *domain, unsigned int irq,
>  			       irq_hw_number_t hwirq)
>  {
> @@ -816,6 +840,10 @@ static int mc_request_event_irq(struct plda_pcie_rp *plda, int event_irq,
>  				0, event_cause[event].sym, plda);
>  }
>  
> +static const struct plda_event_ops mc_event_ops = {
> +	.get_events = mc_get_events,
> +};
> +
>  static const struct plda_event mc_event = {
>  	.request_event_irq = mc_request_event_irq,
>  	.intx_event        = EVENT_LOCAL_PM_MSI_INT_INTX,
> @@ -932,6 +960,9 @@ static int plda_init_interrupts(struct platform_device *pdev,
>  	int i, intx_irq, msi_irq, event_irq;
>  	int ret;
>  
> +	if (!port->event_ops)
> +		port->event_ops = &plda_event_ops;
> +
>  	ret = plda_pcie_init_irq_domains(port);
>  	if (ret) {
>  		dev_err(dev, "failed creating IRQ domains\n");
> @@ -1008,6 +1039,8 @@ static int mc_platform_init(struct pci_config_window *cfg)
>  	if (ret)
>  		return ret;
>  
> +	port->plda.event_ops = &mc_event_ops;
> +
>  	/* Address translation is up; safe to enable interrupts */
>  	ret = plda_init_interrupts(pdev, &port->plda, &mc_event);
>  	if (ret)
> diff --git a/drivers/pci/controller/plda/pcie-plda.h b/drivers/pci/controller/plda/pcie-plda.h
> index fba7343f9a96..dd8bc2750bfc 100644
> --- a/drivers/pci/controller/plda/pcie-plda.h
> +++ b/drivers/pci/controller/plda/pcie-plda.h
> @@ -40,6 +40,7 @@
>  #define  P_ATR_EVT_DISCARD_ERR_SHIFT		22
>  #define  P_ATR_EVT_DOORBELL_MASK		0x00000000u
>  #define  P_ATR_EVT_DOORBELL_SHIFT		23
> +#define  ERROR_AND_DOORBELL_MASK		GENMASK(23, 16)
>  #define  PM_MSI_INT_INTA_MASK			0x01000000u
>  #define  PM_MSI_INT_INTA_SHIFT			24
>  #define  PM_MSI_INT_INTB_MASK			0x02000000u
> @@ -58,6 +59,7 @@
>  #define  PM_MSI_INT_EVENTS_SHIFT		30
>  #define  PM_MSI_INT_SYS_ERR_MASK		0x80000000u
>  #define  PM_MSI_INT_SYS_ERR_SHIFT		31
> +#define  SYS_AND_MSI_MASK			GENMASK(31, 28)
>  #define  NUM_LOCAL_EVENTS			15
>  #define ISTATUS_LOCAL				0x184
>  #define IMASK_HOST				0x188
> @@ -102,6 +104,36 @@
>  #define EVENT_PM_MSI_INT_SYS_ERR		12
>  #define NUM_PLDA_EVENTS				13
>  
> +/*
> + * PLDA local interrupt register
> + *
> + * 31         27     23              15           7          0
> + * +--+--+--+-+------+-+-+-+-+-+-+-+-+-----------+-----------+
> + * |12|11|10|9| intx |7|6|5|4|3|2|1|0| DMA error | DMA end   |
> + * +--+--+--+-+------+-+-+-+-+-+-+-+-+-----------+-----------+
> + * 0:  AXI post error
> + * 1:  AXI fetch error
> + * 2:  AXI discard error
> + * 3:  AXI doorbell
> + * 4:  PCIe post error
> + * 5:  PCIe fetch error
> + * 6:  PCIe discard error
> + * 7:  PCIe doorbell
> + * 8:  4 INTx interruts
> + * 9:  MSI interrupt
> + * 10: AER event
> + * 11: PM/LTR/Hotplug
> + * 12: System error
> + * DMA error : reserved for vendor implement
> + * DMA end : reserved for vendor implement
> + */
> +
> +struct plda_pcie_rp;
> +
> +struct plda_event_ops {
> +	u32 (*get_events)(struct plda_pcie_rp *pcie);
> +};
> +
>  struct plda_msi {
>  	struct mutex lock;		/* Protect used bitmap */
>  	struct irq_domain *msi_domain;
> @@ -117,6 +149,7 @@ struct plda_pcie_rp {
>  	struct irq_domain *event_domain;
>  	raw_spinlock_t lock;
>  	struct plda_msi msi;
> +	const struct plda_event_ops *event_ops;
>  	void __iomem *bridge_addr;
>  	int num_events;
>  };
> -- 
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
