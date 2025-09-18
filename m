Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45882CAC59A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 13:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fVi9klR9vNxq53be8ixFThixQTpXFqquDO8YzHo4fkM=; b=dDUTtm+T0AJ6y/
	ZJxNAXiW/E6akoRxq/Lhg9slMqBQNS0M89bl28w3QbAAoPlFsaaa1xKaSOQuy/cUC5+WblVkCPDqx
	9XFeYpf+YPTCmHKsPWU6lj1FVmtt8ElbehrP7uNpI0tUI3NViq5+uowKdr1yyS9eTIepzaiY2t45h
	mc/dQABsEWXB2ujWn2F0kk1ILHH77j5nmBBvnF0zRDOc+6S1awPz66bS8L4wG1+nEClYIUOnH2IA7
	A7SXzqQZCaIWYhmG/wts6qtCGnzGtKzMrq0K5e7lJVVIZmYk5bCLmq4ma301ZahKZs+iewJPqpW3X
	PXDzUAgxoVD/zqWQgNAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzEEt-0000000HTxE-2o9I;
	Thu, 18 Sep 2025 12:59:55 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzEEs-0000000HTuu-27is
	for linux-riscv@bombadil.infradead.org;
	Thu, 18 Sep 2025 12:59:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=v7pMfnY2RGkeVqEO5HCl4NOOZsJaD/CUB1Wum/Joivs=; b=HX2t6mB3/fixAVizlPzB9OdnbK
	UsHbqqVsidgJ7+KnH8pyl2yktHxChhrn0YudRJCXRLxTuA71KNUhurx6EUVgsaXU2y7pyhIhkLjik
	UL+cD6s7lIlA9MHztFk/XQacGCo2siK3GU04WUau3A6DXYM4BFhXnlviPuKzWTd4yKk5PvpwgYjnE
	BXsAu7RcATHI+JY5e0ix+Dqp2W6t8I5TzEQuvgbuDb3DZjnoU0ZFQkoLBW0sNRw2xgfEIDrI3ly/w
	nFn+OImQvTARkBpOrIpBpkEF4/ynP96EptkkqTD9eGJ27q5A5I1hxTbsx06btDCy4sxl538jZX3Rs
	EfVUL+Tg==;
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzEES-000000034AY-0uAf
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 12:59:40 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 58ICsllo009181
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Sep 2025 20:54:47 +0800 (+08)
	(envelope-from randolph@andestech.com)
Received: from swlinux02 (10.0.15.183) by ATCPCS31.andestech.com (10.0.1.89)
 with Microsoft SMTP Server id 14.3.498.0; Thu, 18 Sep 2025 20:54:47 +0800
Date: Thu, 18 Sep 2025 20:54:40 +0800
From: Randolph Lin <randolph@andestech.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <jingoohan1@gmail.com>, <mani@kernel.org>, <lpieralisi@kernel.org>,
        <kwilczynski@kernel.org>, <robh@kernel.org>, <bhelgaas@google.com>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alex@ghiti.fr>,
        <aou@eecs.berkeley.edu>, <palmer@dabbelt.com>,
        <paul.walmsley@sifive.com>, <ben717@andestech.com>,
        <inochiama@gmail.com>, <thippeswamy.havalige@amd.com>,
        <namcao@linutronix.de>, <shradha.t@samsung.com>,
        <randolph.sklin@gmail.com>, <tim609@andestech.com>
Subject: Re: [PATCH v2 4/5] PCI: andes: Add Andes QiLai SoC PCIe host driver
 support
Message-ID: <aMwBEBNo0AAxlfHx@swlinux02>
References: <aMqmmd381sySCGnY@swlinux02>
 <20250917215722.GA1876729@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250917215722.GA1876729@bhelgaas>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 58ICsllo009181
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_135928_804617_2DF001B1 
X-CRM114-Status: GOOD (  38.42  )
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

Hi Bjorn,

On Wed, Sep 17, 2025 at 04:57:22PM -0500, Bjorn Helgaas wrote:
> [EXTERNAL MAIL]
> 
> On Wed, Sep 17, 2025 at 08:16:25PM +0800, Randolph Lin wrote:
> > On Tue, Sep 16, 2025 at 09:46:52AM -0500, Bjorn Helgaas wrote:
> > > On Tue, Sep 16, 2025 at 06:04:16PM +0800, Randolph Lin wrote:
> > > > Add driver support for DesignWare based PCIe controller in Andes
> > > > QiLai SoC. The driver only supports the Root Complex mode.
> 
> > > > +          Say Y here to enable PCIe controller support on Andes QiLai SoCs,
> > > > +       which operate in Root Complex mode. The Andes QiLai SoCs PCIe
> > > > +       controller is based on DesignWare IP (5.97a version) and therefore
> > > > +       the driver re-uses the DesignWare core functions to implement the
> > > > +       driver. The Andes QiLai SoC has three Root Complexes (RCs): one
> > > > +       operates on PCIe 4.0 with 4 lanes at 0x80000000, while the other
> > > > +       two operate on PCIe 4.0 with 2 lanes at 0xA0000000 and 0xC0000000,
> > > > +       respectively.
> > >
> > > I assume these addresses come from devicetree, so I don't think
> > > there's any need to include them here.
> >
> > I will add num-lanes property in the devicetree.
> 
> Don't add num-lanes to devicetree unless your driver requires it.
> dw_pcie_host_init() uses dw_pcie_link_get_max_link_width() try to get
> the lane width from PCI_EXP_LNKCAP.
>

ok.

> > > > +static
> > > > +bool qilai_pcie_outbound_atu_addr_valid(struct dw_pcie *pci,
> > > > +                                     const struct dw_pcie_ob_atu_cfg *atu,
> > > > +                                     u64 *limit_addr)
> > > > +{
> > > > +     u64 parent_bus_addr = atu->parent_bus_addr;
> > > > +
> > > > +     *limit_addr = parent_bus_addr + atu->size - 1;
> > > > +
> > > > +     /*
> > > > +      * Addresses below 4 GB are not 1:1 mapped; therefore, range checks
> > > > +      * only need to ensure addresses below 4 GB match pci->region_limit.
> > > > +      */
> > > > +     if (lower_32_bits(*limit_addr & ~pci->region_limit) !=
> > > > +         lower_32_bits(parent_bus_addr & ~pci->region_limit) ||
> > > > +         !IS_ALIGNED(parent_bus_addr, pci->region_align) ||
> > > > +         !IS_ALIGNED(atu->pci_addr, pci->region_align) || !atu->size)
> > > > +             return false;
> > >
> > > Seems a little bit strange.  Is this something that could be expressed
> > > via devicetree?  Or something peculiar about QiLai that's different
> > > from all the other DWC-based controllers?
> >
> > After reviewing both the code history and the bug tracking system,
> > it turns out that this code doesn't even qualify as a valid
> > workaround.  Apologies for having submitted it as a patch.
> >
> > The root cause is that the iATU limits were not configured
> > correctly.  The original design assumed at least 32GB or 128GB of
> > BAR resource assignment, but the actual chip sets the iATU limit to
> > only 4GB.  As a result, region_limit is always constrained by this
> > 4GB boundary.
> >
> > The correct workaround should be to program the iATU only for the
> > 32-bit address space and skip iATU programming for the 64-bit space.
> > A simple way to implement this workaround is to parse the
> > num-viewport property from the devicetree and use this value
> > directly, instead of relying on the result of reading
> > PCIE_ATU_VIEWPORT.
> >
> > I will attempt to implement it this way, but the correct method is
> > not yet well-defined. Do you have any suggestions on how to modify
> > the num-viewport property from the devicetree for use in the driver?
> > It seems it will be modified in pcie-designware.c.
> 
> Nope, I don't know enough about DWC to give any advice, sorry!
> 
> > > > +static struct platform_driver qilai_pcie_driver = {
> > > > +     .probe = qilai_pcie_probe,
> > > > +     .driver = {
> > > > +             .name   = "qilai-pcie",
> > > > +             .of_match_table = qilai_pcie_of_match,
> > > > +             /* only test passed at PROBE_DEFAULT_STRATEGY */
> > > > +             .probe_type = PROBE_DEFAULT_STRATEGY,
> > >
> > > This is the only use of PROBE_DEFAULT_STRATEGY in the entire tree, so
> > > I doubt you need it.  If you do, please explain why in more detail.
> >
> > In the V1 patch, the reviewer, Manivannan, suggested:
> > "You should start using PROBE_PREFER_ASYNCHRONOUS."
> > However, after setting up PROBE_PREFER_ASYNCHRONOUS, numerous errors
> > were encountered during the EP device probe flow.
> > Therefore, we would prefer to continue using PROBE_DEFAULT_STRATEGY.
> 
> I don't really know the details of probe_type.  But it sounds like the
> errors with PROBE_PREFER_ASYNCHRONOUS should probably be debugged and
> fixed.
> 
> If PROBE_PREFER_ASYNCHRONOUS can't be made to work, it sounds like you
> should specify PROBE_FORCE_SYNCHRONOUS, because the comments suggest
> that using PROBE_DEFAULT_STRATEGY means the driver should work with
> either PROBE_FORCE_SYNCHRONOUS or PROBE_PREFER_ASYNCHRONOUS:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/device/driver.h?id=v6.16#n24

refer to the following patches:
    91703041697c ("PCI: Allow built-in drivers to use async initial probing")
    8e77d3d59d7b ("Revert "usb: xhci-pci: Set PROBE_PREFER_ASYNCHRONOUS"")

We can continue using PROBE_PREFER_ASYNCHRONOUS.
When used with drivers that support it, such as NVMe, the system behaves as
expected. In the past, we primarily used Renesas xHCI controller.

Sincerely,
Randolph

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
