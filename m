Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49077C25B75
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jun 2024 18:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=hI2VJ4tU+sIsrqnWooUZCVkCLlkuLYwT9yiwpNIO5kE=; b=Cx0bSjuKCCmJwA
	FkgH6BVWlXtYK4bRp3ZUtv2BOE4J9Ol1a+Y+dUhVOKUHi3NgnEq2d8s1phVfyV49vDW3Pr6EzSu65
	f7+F8FqED0N7J9DPEMeNyNU2ErS5RC2Wtjm7fpQixO4VdeOjx5P81sFCeZTEcuXG6BmZfhQ88REZp
	jaMK4G6Ss0iO6WFzEXP0GH7xb+xxbSB3EqcbEIaiPdF2ZsRwR9Lh0Kmx95nf93rsyiazMFa+Mqefx
	iIfdn7MGKs0Vbgvt9i34napfYS8Mvpstc8VeCY6EsFz7za3NbwRwU2ApTEch1fdnNnAtoAwoJ07Sd
	NUKruIPMryJ5k0v/w7Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sECgL-000000003z4-0l7a;
	Mon, 03 Jun 2024 18:45:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sECgI-000000003xC-3tEX
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jun 2024 18:45:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6081660F37;
	Mon,  3 Jun 2024 18:45:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8F3BC2BD10;
	Mon,  3 Jun 2024 18:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717440318;
	bh=CYD9CNW0hZo4GzQTwjKIvClwD4HPTw+g0MIeUFCe3Y0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=lgB7SAWG7DZyT4ECryCmxnq/4wdodJoEmymX6A+mU2SJNfhdoxiDi9wcUyi0CZbNf
	 aJrI8sX0L+/RmOMZWOxd/oA4RqT7YdkI3PrOE8mMWb7pyVcLZUDJXqkstRXxyJyv1C
	 SJn4721FDUz4OXwCW5iVAX/NgAAzCe8G9+tfCvQTvWdBQRiWmKxgrVRGfxffUyck/Q
	 Fr98dkDZtI8JRN6OqIzXp3AqTbPHgvjAqV1K1xz87DmuZhyHLAbLlFkUDfZZPbuR1D
	 VCOrRU22ozmOl3skUJcIsz6eg9+cPtpYf7AfCsPT5ChhGL6clybsShOp2aAVUZRRBF
	 7dcZl2qxjB+6Q==
Date: Mon, 3 Jun 2024 13:45:16 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Daire McNamara <daire.mcnamara@microchip.com>
Cc: linux-pci@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] PCI: microchip: Fix outbound address translation
 tables
Message-ID: <20240603184516.GA687362@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240531085333.2501399-2-daire.mcnamara@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_114519_098114_397E2290 
X-CRM114-Status: GOOD (  25.80  )
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

On Fri, May 31, 2024 at 09:53:32AM +0100, Daire McNamara wrote:
> On Microchip PolarFire SoC (MPFS) the PCIe Root Port can be behind one of
> three general-purpose Fabric Interface Controller (FIC) buses that
> encapsulate an AXI-M interface. That FIC is responsible for managing
> the translations of the upper 32-bits of the AXI-M address. On MPFS,
> the Root Port driver needs to take account of that outbound address
> translation done by the parent FIC bus before setting up its own
> outbound address translation tables.  In all cases on MPFS,
> the remaining outbound address translation tables are 32-bit only.
> 
> Limit the outbound address translation tables to 32-bit only.
> 
> Fixes: 6f15a9c9f941 ("PCI: microchip: Add Microchip Polarfire PCIe controller driver")
> 
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> ---
>  drivers/pci/controller/pcie-microchip-host.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/controller/pcie-microchip-host.c
> index 137fb8570ba2..0795cd122a4a 100644
> --- a/drivers/pci/controller/pcie-microchip-host.c
> +++ b/drivers/pci/controller/pcie-microchip-host.c
> @@ -983,7 +983,8 @@ static int mc_pcie_setup_windows(struct platform_device *pdev,
>  		if (resource_type(entry->res) == IORESOURCE_MEM) {
>  			pci_addr = entry->res->start - entry->offset;
>  			mc_pcie_setup_window(bridge_base_addr, index,
> -					     entry->res->start, pci_addr,
> +					     entry->res->start & 0xffffffff,
> +					     pci_addr & 0xffffffff,
>  					     resource_size(entry->res));

Is this masking something that the PCI core needs to be aware of when
it allocates address space for BARs?

The PCI core knows about the CPU physical address range of each bridge
window and the corresponding PCI address range.  From this patch, it
looks like only the low 32 bits of the CPU address are used by the
Root Port.  That might not be a problem as long as the windows
described by DT are correct and none of them overlap after masking out
the upper 32 bits.  But for example, if DT has windows like this:

  [mem 0x1'0000'0000-0x1'8000'0000]
  [mem 0x2'0000'0000-0x2'8000'0000]

the PCI core will assume they are valid and non-overlapping, when
IIUC, they *do* overlap.

But also only the low 32 bits of the PCI address are used, and it
seems like the PCI core will need to know that so it doesn't program a
64-bit BAR with a value above 4GB?

>  			index++;
>  		}
> @@ -1117,8 +1118,8 @@ static int mc_platform_init(struct pci_config_window *cfg)
>  	int ret;
>  
>  	/* Configure address translation table 0 for PCIe config space */
> -	mc_pcie_setup_window(bridge_base_addr, 0, cfg->res.start,
> -			     cfg->res.start,
> +	mc_pcie_setup_window(bridge_base_addr, 0, cfg->res.start & 0xffffffff,
> +			     cfg->res.start & 0xffffffff,
>  			     resource_size(&cfg->res));
>  
>  	/* Need some fixups in config space */
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
