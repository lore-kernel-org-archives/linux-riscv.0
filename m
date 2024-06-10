Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4134EC27C5E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 11:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p7JpS2X0kfDptVitpbDvtG7qGymbKZypZJcHFrVzOA4=; b=Ec7jU2xQaMbrYV
	hooDP2ZNyTdGSUDZZO1D5hnC9+My0VqI8hhMKhGj1XipoPoEtYwRrYzutFJ6hkGpJyVVpmBEDbgLP
	Ots2tZtldm66Ir3eztzahyVNuMq4NW9jwfje2GSNYVmh1Hhf551XqOsOwpPVtGbPYHUSOQ9kR8VdE
	wHaJcMp3gP2JWiWBSTflpMp6Zpo3I/TivWlqPlptIhNJGIuRUwkXrGoDLwKuOsSU+pDXGJzBCj7FN
	rzbQfJqpxYFeNEk7ES1OwV+iUf7+SDqFFIf9GiPO1UkG1lcPLUkeS1R5SH0WnE3e/fl8fDMjbAvUa
	bSEQIbQbCpWTcZssquTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGdRC-00000004qgX-2135;
	Mon, 10 Jun 2024 11:43:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGdR9-00000004qeL-213k
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 11:43:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718019823; x=1749555823;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GXGrN8JOjzod6V+6AHh55MPyMPL+RTr2vIDnmW2E4FI=;
  b=Os6FGw/+SDZsxO6KKr5LTUot8//Yfu+K6aJTudFp0aRWikX63TXGkepD
   7X3iRONDBKVklt+FJzYRImyNziFAhN42Kt+jaPFlNvRAjFbHoGUpEjsSf
   xEBPzvMBEoYjtZcPmzjvnT5OmGVhRBMNvBVCFeBqw3Rgn2WAZAAXJYOmD
   NFmLjxiwkYJcRtC2bI7OZjuPUnk8O+pdWqZtP4CUysvzkIEXvHm4fIxGK
   k4/l3K5KA8WY10GDB8Spx2dBSEWjQbPS2CZEOPYblTekLpluazwQvUSGn
   zVq/CFHHv4hYSLxlTPWdGF7kOwkkq9aUsEwourZO7+llOWaRlI9CnIGPk
   Q==;
X-CSE-ConnectionGUID: bqBvcjIJQqGXZZDJOFP4Dw==
X-CSE-MsgGUID: n69PJzP6RBiJ7E+0iG+U6Q==
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="258055430"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jun 2024 04:43:42 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 10 Jun 2024 04:42:38 -0700
Received: from daire-X570 (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 10 Jun 2024 04:42:36 -0700
Date: Mon, 10 Jun 2024 12:42:27 +0100
From: Daire McNamara <daire.mcnamara@microchip.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: <linux-pci@vger.kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof
 =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 1/2] PCI: microchip: Fix outbound address translation
 tables
Message-ID: <Zmbl9ZYyJCI9dXyE@daire-X570>
References: <20240531085333.2501399-2-daire.mcnamara@microchip.com>
 <20240603184516.GA687362@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240603184516.GA687362@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_044343_688699_048333D4 
X-CRM114-Status: GOOD (  38.39  )
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

On Mon, Jun 03, 2024 at 01:45:16PM -0500, Bjorn Helgaas wrote:
> On Fri, May 31, 2024 at 09:53:32AM +0100, Daire McNamara wrote:
> > On Microchip PolarFire SoC (MPFS) the PCIe Root Port can be behind one of
> > three general-purpose Fabric Interface Controller (FIC) buses that
> > encapsulate an AXI-M interface. That FIC is responsible for managing
> > the translations of the upper 32-bits of the AXI-M address. On MPFS,
> > the Root Port driver needs to take account of that outbound address
> > translation done by the parent FIC bus before setting up its own
> > outbound address translation tables.  In all cases on MPFS,
> > the remaining outbound address translation tables are 32-bit only.
> > 
> > Limit the outbound address translation tables to 32-bit only.
> > 
> > Fixes: 6f15a9c9f941 ("PCI: microchip: Add Microchip Polarfire PCIe controller driver")
> > 
> > Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> > ---
> >  drivers/pci/controller/pcie-microchip-host.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/controller/pcie-microchip-host.c
> > index 137fb8570ba2..0795cd122a4a 100644
> > --- a/drivers/pci/controller/pcie-microchip-host.c
> > +++ b/drivers/pci/controller/pcie-microchip-host.c
> > @@ -983,7 +983,8 @@ static int mc_pcie_setup_windows(struct platform_device *pdev,
> >  		if (resource_type(entry->res) == IORESOURCE_MEM) {
> >  			pci_addr = entry->res->start - entry->offset;
> >  			mc_pcie_setup_window(bridge_base_addr, index,
> > -					     entry->res->start, pci_addr,
> > +					     entry->res->start & 0xffffffff,
> > +					     pci_addr & 0xffffffff,
> >  					     resource_size(entry->res));
> 
> Is this masking something that the PCI core needs to be aware of when
> it allocates address space for BARs?
I don't believe so.
> 
> The PCI core knows about the CPU physical address range of each bridge
> window and the corresponding PCI address range.  From this patch, it
> looks like only the low 32 bits of the CPU address are used by the
> Root Port.  That might not be a problem as long as the windows
> described by DT are correct and none of them overlap after masking out
> the upper 32 bits.  But for example, if DT has windows like this:
> 
>   [mem 0x1'0000'0000-0x1'8000'0000]
>   [mem 0x2'0000'0000-0x2'8000'0000]
> 
> the PCI core will assume they are valid and non-overlapping, when
> IIUC, they *do* overlap.
True, but I can't see how that could happen on any real system - in my mind,
a PolarFire Soc designer (or indeed any designer on any chip) will know where
its rootport is actually attached in its memory map. On PolarFire SoC, for
example, a designer can only reach a rootport over a FIC, and - if they were
to attach to the rootport over two FICs at the same time, that would be a
blunder and would be picked up during design phase.  I can't imagine any
reason anyone would release a product with that arrangement.

> 
> But also only the low 32 bits of the PCI address are used, and it
> seems like the PCI core will need to know that so it doesn't program a
> 64-bit BAR with a value above 4GB?
Yeah, I'll send around a v2 shortly to address this - I was rather
over-zealous when I prevented that.
> 
> >  			index++;
> >  		}
> > @@ -1117,8 +1118,8 @@ static int mc_platform_init(struct pci_config_window *cfg)
> >  	int ret;
> >  
> >  	/* Configure address translation table 0 for PCIe config space */
> > -	mc_pcie_setup_window(bridge_base_addr, 0, cfg->res.start,
> > -			     cfg->res.start,
> > +	mc_pcie_setup_window(bridge_base_addr, 0, cfg->res.start & 0xffffffff,
> > +			     cfg->res.start & 0xffffffff,
> >  			     resource_size(&cfg->res));
> >  
> >  	/* Need some fixups in config space */
> > -- 
> > 2.34.1
> > 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
