Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4CCC25B78
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 22:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=LD0O9V9hB/5yUPGjgvea+shmRLzTnWJyIwakcv2Yecg=; b=SC+QJK10xggwvy
	fZRMHyaioC4BicGc9iw+GVkRNHZUZBWewCvzK1dbPnuZXVTZwv+iVy2XVUsouAJqiHtH6R/veZLnH
	85s3CY3zDm9erCWhpsMnI5I/xIFII3569o0q2Xz9GGGwW44dR4M1QgBKXZUXKAAPPikqdYA7KjbKh
	B7mrROPUUmq+fwSq7VnTotAIlQwN43U/y0WYMbEpX/SKvSpjsBrGx77dFeTdTKDARW1sTMxf157Pa
	weIS16GKlQg0QFwm6lIPHOqfDw9/EMN8GFwOVxsJCvcZ6hpHzVwJU4lDoc8G03frMBbBzga75Ybg4
	c2dnzx1jj4lfRxKwUkRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9uAT-00000004EIS-2EHT;
	Wed, 22 May 2024 22:10:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9uAQ-00000004EHp-24tp
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 22:10:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CC8B962B60;
	Wed, 22 May 2024 22:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A5CAC2BBFC;
	Wed, 22 May 2024 22:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716415836;
	bh=78lSOt435SpzlKtYFJRnRC9xals+PsmCRmkOx4okULU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=QG9l8swAl+2uLJlTgqBUAn1o2pxnCYHODesOdRxMEAL+yKCPO/ptqgxYEmtcEWHza
	 2Ttp0uF6DOs/G/2dn6c5nT8/MuORHjJXMXq8en+AaL4Rx9QNMBLwgH3sH1pqLkZ0sU
	 /yzJtJGaq8erEVBauiQaBlmSVXWip0wwdZPtvuXVEOGNLorpqdz3hb7uKhWOpI6DtM
	 E7VeoG7Lv6MpKiUJqMo8bLHMbIB6qKbniCDkIsFmWaJxi9JN7encYqT8WsB3v+j2H/
	 Th3B+Ik4ds12hJz3pXKtiAQikPmd5iyPC6hHTNWHxweBaIKxKHeFPTUoNJ9F2giBKy
	 /7+hB7Ceb732w==
Date: Wed, 22 May 2024 17:10:34 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjE2IDA4?=
 =?utf-8?Q?=2F22=5D_PCI?= =?utf-8?Q?=3A?= microchip: Change the argument of
 plda_pcie_setup_iomems()
Message-ID: <20240522221034.GA83828@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SHXPR01MB086351396027D8A443BB6068E6EB2@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_151038_720420_B25EA3F2 
X-CRM114-Status: GOOD (  38.59  )
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

On Wed, May 22, 2024 at 01:50:57AM +0000, Minda Chen wrote:
> > The patch is OK, but the subject line is not very informative.  It
> > should be useful all by itself even without the commit log.
> > "Change the argument of X" doesn't say anything about why we would
> > want to do that.
> > 
> > On Thu, Mar 28, 2024 at 05:18:21PM +0800, Minda Chen wrote:
> > > If other vendor do not select PCI_HOST_COMMON, the driver data is not
> > > struct pci_host_bridge.
> > 
> > Also, I don't think this is the real problem.  Your PCIE_MICROCHIP_HOST
> > Kconfig selects PCI_HOST_COMMON, and the driver calls
> > pci_host_common_probe(), so the driver wouldn't even build without
> > PCI_HOST_COMMON.
> > 
> > This patch is already applied and ready to go, but if you can tell
> > us what's really going on here, I'd like to update the commit log.
> > 
> It is modified for Starfive code. Starfive JH7110 PCIe do not select
> PCI_HOST_COMMON
> plda_pcie_setup_iomems() will be changed to common plda code.
> 
> I think I can modify the title and commit log like this.
> 
> Title: 
> PCI: microchip: Get struct pci_host_bridge pointer from platform code
> 
> Since plda_pcie_setup_iomems() will be a common PLDA core driver
> function, but the argument0 is a struct platform_device pointer.
> plda_pcie_setup_iomems() actually using struct pci_host_bridge
> pointer other than platform_device pointer. Further more if a new
> PLDA core PCIe driver do not select PCI_HOST_COMMON, the platform
> driver data is not struct pci_host_bridge pointer. So get struct
> pci_host_bridge pointer from platform code function
> mc_platform_init() and make it to be an argument of
> plda_pcie_setup_iomems().

OK, I see what you're doing.  This actually has nothing to do with
whether PCI_HOST_COMMON is *enabled*.  It has to do with whether
drivers use pci_host_common_probe().  Here's what I propose:

  PCI: plda: Pass pci_host_bridge to plda_pcie_setup_iomems()

  plda_pcie_setup_iomems() needs the bridge->windows list from struct
  pci_host_bridge and is currently used only by pcie-microchip-host.c.  This
  driver uses pci_host_common_probe(), which sets a pci_host_bridge as the
  drvdata, so plda_pcie_setup_iomems() used platform_get_drvdata() to find
  the pci_host_bridge.

  But we also want to use plda_pcie_setup_iomems() in the new pcie-starfive.c
  driver, which does not use pci_host_common_probe() and will have struct
  starfive_jh7110_pcie as its drvdata, so pass the pci_host_bridge directly
  to plda_pcie_setup_iomems() so it doesn't need platform_get_drvdata() to
  find it.

> > > Move calling platform_get_drvdata() to mc_platform_init().
> > >
> > > Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> > >  drivers/pci/controller/plda/pcie-microchip-host.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/pci/controller/plda/pcie-microchip-host.c
> > > b/drivers/pci/controller/plda/pcie-microchip-host.c
> > > index 9b367927cd32..805870aed61d 100644
> > > --- a/drivers/pci/controller/plda/pcie-microchip-host.c
> > > +++ b/drivers/pci/controller/plda/pcie-microchip-host.c
> > > @@ -876,11 +876,10 @@ static void plda_pcie_setup_window(void __iomem
> > *bridge_base_addr, u32 index,
> > >  	writel(0, bridge_base_addr + ATR0_PCIE_WIN0_SRC_ADDR);  }
> > >
> > > -static int plda_pcie_setup_iomems(struct platform_device *pdev,
> > > +static int plda_pcie_setup_iomems(struct pci_host_bridge *bridge,
> > >  				  struct plda_pcie_rp *port)
> > >  {
> > >  	void __iomem *bridge_base_addr = port->bridge_addr;
> > > -	struct pci_host_bridge *bridge = platform_get_drvdata(pdev);
> > >  	struct resource_entry *entry;
> > >  	u64 pci_addr;
> > >  	u32 index = 1;
> > > @@ -1018,6 +1017,7 @@ static int mc_platform_init(struct
> > > pci_config_window *cfg)  {
> > >  	struct device *dev = cfg->parent;
> > >  	struct platform_device *pdev = to_platform_device(dev);
> > > +	struct pci_host_bridge *bridge = platform_get_drvdata(pdev);
> > >  	void __iomem *bridge_base_addr =
> > >  		port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
> > >  	int ret;
> > > @@ -1031,7 +1031,7 @@ static int mc_platform_init(struct
> > pci_config_window *cfg)
> > >  	mc_pcie_enable_msi(port, cfg->win);
> > >
> > >  	/* Configure non-config space outbound ranges */
> > > -	ret = plda_pcie_setup_iomems(pdev, &port->plda);
> > > +	ret = plda_pcie_setup_iomems(bridge, &port->plda);
> > >  	if (ret)
> > >  		return ret;
> > >
> > > --
> > > 2.17.1
> > >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
