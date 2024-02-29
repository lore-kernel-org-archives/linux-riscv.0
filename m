Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5B0C48BF6
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 15:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l22lFMsHVH+PxwGeOUMUnIqCiyicRHBfJk0lEzZprTU=; b=WNZDrlymh0VF/L
	9TMlmtm8gIq4F0ZYAeWjAm7y35NC+Nd7Xrk4G9i4a7VKISRAO1gW+Ms4MLVfdwrU6COkW7kOd7+Vd
	ME91DxHTs9WGITMpNqXgZ+TYH1Gtqn5pA4SNPRaIahRRmxTqEsTHERLBx6O5BQWJLwrsQ5BepDbTI
	Hyj2yEJVvp5xcGIh2S8DA6fsesFX0hNwA3B2XHkz+6GUdjVGeYmgnCg/rysJ8UnSSH6vc1v75mB4E
	JEI6gCEiaDFq6r6ZW3EfQkDSpZyQVskncfzMNu8fhLwIldQExcHYzj+QdX5eLgUhuwJVOHfUVWCyA
	UFeZnVobGpGRdQVJNSjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfi1n-0000000Dzig-3AAZ;
	Thu, 29 Feb 2024 15:08:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfi1k-0000000Dzhy-1mmr
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 15:08:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B30ED60BC8;
	Thu, 29 Feb 2024 15:08:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C5DC43394;
	Thu, 29 Feb 2024 15:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709219331;
	bh=1Zyw6/15dc8py4UHaheILppIr29j2DVuoJ+GnLmxmI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qbE142naa92rUgW7jL/DgquUxvIA8orHcRMgUTDyddce65pfDrm5hqA2gW1XhNEW1
	 M9mhn4t1LH5FmGr+9vxIZj3lWezTgwutUTT9MFvgOEbxD3MUXBEe2+gj4i08VwWHnU
	 AZRLl0FrHrOBNbBj3B9joRiitw1QbIUaM58sENEelec+3rzJe+v9gtvOJ1DxJBcLVC
	 Q992XY0FVty+LT18+GMGFLjH+GGFEJ1RwHcuUU8sIFGQGNxQ6B3B/4vFkw5Aq7alGS
	 57Xq1IPbNKu1IcM0c12i1Q/3MttMRGg6tdlxmEibgCn3P5lMdEJsiugpx10dhXtF+l
	 hPvdF3nQRkfWg==
Date: Thu, 29 Feb 2024 16:08:43 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Conor Dooley <conor@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
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
Subject: Re: [PATCH v15,RESEND 22/23] PCI: starfive: Offload the NVMe timeout
 workaround to host drivers.
Message-ID: <ZeCd+xqE6x2ZFtJN@lpieralisi>
References: <20240227103522.80915-1-minda.chen@starfivetech.com>
 <20240227103522.80915-23-minda.chen@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240227103522.80915-23-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_070852_591101_5CC07349 
X-CRM114-Status: GOOD (  24.43  )
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

On Tue, Feb 27, 2024 at 06:35:21PM +0800, Minda Chen wrote:
> From: Kevin Xie <kevin.xie@starfivetech.com>
> 
> As the Starfive JH7110 hardware can't keep two inbound post write in
> order all the time, such as MSI messages and NVMe completions. If the
> NVMe completion update later than the MSI, an NVMe IRQ handle will miss.

Please explain what the problem is and what "NVMe completions" means
given that you are talking about posted writes.

If you have a link to an erratum write-up it would certainly help.

This looks completely broken to me, if the controller can't guarantee
PCIe transactions ordering it is toast, there is not even a point
considering mainline merging.

> As a workaround, we will wait a while before going to the generic
> handle here.
> 
> Verified with NVMe SSD, USB SSD, R8169 NIC.
> The performance are stable and even higher after this patch.

I assume this is a joke even though it does not make me laugh.

Thanks,
Lorenzo

> 
> Signed-off-by: Kevin Xie <kevin.xie@starfivetech.com>
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> ---
>  drivers/pci/controller/plda/pcie-plda-host.c | 12 ++++++++++++
>  drivers/pci/controller/plda/pcie-plda.h      |  1 +
>  drivers/pci/controller/plda/pcie-starfive.c  |  1 +
>  3 files changed, 14 insertions(+)
> 
> diff --git a/drivers/pci/controller/plda/pcie-plda-host.c b/drivers/pci/controller/plda/pcie-plda-host.c
> index a18923d7cea6..9e077ddf45c0 100644
> --- a/drivers/pci/controller/plda/pcie-plda-host.c
> +++ b/drivers/pci/controller/plda/pcie-plda-host.c
> @@ -13,6 +13,7 @@
>  #include <linux/msi.h>
>  #include <linux/pci_regs.h>
>  #include <linux/pci-ecam.h>
> +#include <linux/delay.h>
>  
>  #include "pcie-plda.h"
>  
> @@ -44,6 +45,17 @@ static void plda_handle_msi(struct irq_desc *desc)
>  			       bridge_base_addr + ISTATUS_LOCAL);
>  		status = readl_relaxed(bridge_base_addr + ISTATUS_MSI);
>  		for_each_set_bit(bit, &status, msi->num_vectors) {
> +			/*
> +			 * As the Starfive JH7110 hardware can't keep two
> +			 * inbound post write in order all the time, such as
> +			 * MSI messages and NVMe completions.
> +			 * If the NVMe completion update later than the MSI,
> +			 * an NVMe IRQ handle will miss.
> +			 * As a workaround, we will wait a while before
> +			 * going to the generic handle here.
> +			 */
> +			if (port->msi_quirk_delay_us)
> +				udelay(port->msi_quirk_delay_us);
>  			ret = generic_handle_domain_irq(msi->dev_domain, bit);
>  			if (ret)
>  				dev_err_ratelimited(dev, "bad MSI IRQ %d\n",
> diff --git a/drivers/pci/controller/plda/pcie-plda.h b/drivers/pci/controller/plda/pcie-plda.h
> index 04e385758a2f..feccf285dfe8 100644
> --- a/drivers/pci/controller/plda/pcie-plda.h
> +++ b/drivers/pci/controller/plda/pcie-plda.h
> @@ -186,6 +186,7 @@ struct plda_pcie_rp {
>  	int msi_irq;
>  	int intx_irq;
>  	int num_events;
> +	u16 msi_quirk_delay_us;
>  };
>  
>  struct plda_event {
> diff --git a/drivers/pci/controller/plda/pcie-starfive.c b/drivers/pci/controller/plda/pcie-starfive.c
> index 9bb9f0e29565..5cfc30572b7f 100644
> --- a/drivers/pci/controller/plda/pcie-starfive.c
> +++ b/drivers/pci/controller/plda/pcie-starfive.c
> @@ -391,6 +391,7 @@ static int starfive_pcie_probe(struct platform_device *pdev)
>  
>  	plda->host_ops = &sf_host_ops;
>  	plda->num_events = PLDA_MAX_EVENT_NUM;
> +	plda->msi_quirk_delay_us = 1;
>  	/* mask doorbell event */
>  	plda->events_bitmap = GENMASK(PLDA_INT_EVENT_NUM - 1, 0)
>  			     & ~BIT(PLDA_AXI_DOORBELL)
> -- 
> 2.17.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
