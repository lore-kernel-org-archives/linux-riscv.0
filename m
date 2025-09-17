Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52CFCAC59A
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 21:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=k9NlErNl8ysbz28VsCpAaVSa+CTRVH6kTohwi4e+50E=; b=vukVoSHsGw0Iti
	G1aTnXRJbblW8Q+9CkiGtacSxnYuH+WScPNelVgwSZEEyntwsraWW2qII83joY9sHaqbH1ONY9W4Q
	mJu6Jzr8nSNlj1ERU8IWh/Sg8PstnP4sHO9pFI8BBMTxKYiE2QiECoNotxPcxOTZZEh2Sv9gnOfQB
	lBiGuw/IKR/sHbNVoxNMBfiOSh7Y5LwGhA0xP5LufBHWyN6I4nZS9uRto+BBjOfj8kU7CX+1oQk7S
	S3t/OrQhS3vI4Ycy/pXnfIZyPj+c99vCEasRqXjTe5DYIuBml+fA2FZZ9nayPvvwvYLmL766E+jSR
	ESX4UOhtDRmkYqkiPamQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz09X-0000000F4MJ-3157;
	Wed, 17 Sep 2025 21:57:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz09V-0000000F4L0-22mE
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 21:57:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5408444857;
	Wed, 17 Sep 2025 21:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00465C4CEE7;
	Wed, 17 Sep 2025 21:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758146244;
	bh=HhzyC0ZZquIaoVW0wTN6cNxHYwm1q26N31dr9FfEXU4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=vEgvKat0epe6kqqVZtBbn30bTqELyhZ2f8QkxJejKvL25YakygsCf0EO8+P1S10wT
	 2XijqumznfrXxiFuWsNcr+dewYFNcGCyu8TeRuTHzFEtL1dF0Gy6F0TcL5Bz9o1xNo
	 UvXQkwn29eTB79mNiGuGtpuyNcX86BzG1McYGBe2YNUaVhV5A+BOLkAIcqrgtz5fTR
	 w5KtoqrV64Vm24hu/rQlgTgEgFJIS3ZoI3Qwb7+QlNA8flyA3G2FsHhNN+nT929R0T
	 M9h0d3zG5ZngswmHGVak/0tKnGp9fJwpVGjuVvxPCUEQbnxjSxZmT57c9hXeE2RZri
	 FSiHwkIFqcKqQ==
Date: Wed, 17 Sep 2025 16:57:22 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Randolph Lin <randolph@andestech.com>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org,
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, alex@ghiti.fr,
	aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
	ben717@andestech.com, inochiama@gmail.com,
	thippeswamy.havalige@amd.com, namcao@linutronix.de,
	shradha.t@samsung.com, randolph.sklin@gmail.com,
	tim609@andestech.com
Subject: Re: [PATCH v2 4/5] PCI: andes: Add Andes QiLai SoC PCIe host driver
 support
Message-ID: <20250917215722.GA1876729@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aMqmmd381sySCGnY@swlinux02>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_145725_568497_D7D61B50 
X-CRM114-Status: GOOD (  41.20  )
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

On Wed, Sep 17, 2025 at 08:16:25PM +0800, Randolph Lin wrote:
> On Tue, Sep 16, 2025 at 09:46:52AM -0500, Bjorn Helgaas wrote:
> > On Tue, Sep 16, 2025 at 06:04:16PM +0800, Randolph Lin wrote:
> > > Add driver support for DesignWare based PCIe controller in Andes
> > > QiLai SoC. The driver only supports the Root Complex mode.

> > > +          Say Y here to enable PCIe controller support on Andes QiLai SoCs,
> > > +       which operate in Root Complex mode. The Andes QiLai SoCs PCIe
> > > +       controller is based on DesignWare IP (5.97a version) and therefore
> > > +       the driver re-uses the DesignWare core functions to implement the
> > > +       driver. The Andes QiLai SoC has three Root Complexes (RCs): one
> > > +       operates on PCIe 4.0 with 4 lanes at 0x80000000, while the other
> > > +       two operate on PCIe 4.0 with 2 lanes at 0xA0000000 and 0xC0000000,
> > > +       respectively.
> > 
> > I assume these addresses come from devicetree, so I don't think
> > there's any need to include them here.
> 
> I will add num-lanes property in the devicetree.

Don't add num-lanes to devicetree unless your driver requires it.
dw_pcie_host_init() uses dw_pcie_link_get_max_link_width() try to get
the lane width from PCI_EXP_LNKCAP.

> > > +static
> > > +bool qilai_pcie_outbound_atu_addr_valid(struct dw_pcie *pci,
> > > +                                     const struct dw_pcie_ob_atu_cfg *atu,
> > > +                                     u64 *limit_addr)
> > > +{
> > > +     u64 parent_bus_addr = atu->parent_bus_addr;
> > > +
> > > +     *limit_addr = parent_bus_addr + atu->size - 1;
> > > +
> > > +     /*
> > > +      * Addresses below 4 GB are not 1:1 mapped; therefore, range checks
> > > +      * only need to ensure addresses below 4 GB match pci->region_limit.
> > > +      */
> > > +     if (lower_32_bits(*limit_addr & ~pci->region_limit) !=
> > > +         lower_32_bits(parent_bus_addr & ~pci->region_limit) ||
> > > +         !IS_ALIGNED(parent_bus_addr, pci->region_align) ||
> > > +         !IS_ALIGNED(atu->pci_addr, pci->region_align) || !atu->size)
> > > +             return false;
> > 
> > Seems a little bit strange.  Is this something that could be expressed
> > via devicetree?  Or something peculiar about QiLai that's different
> > from all the other DWC-based controllers?
> 
> After reviewing both the code history and the bug tracking system,
> it turns out that this code doesn't even qualify as a valid
> workaround.  Apologies for having submitted it as a patch.
> 
> The root cause is that the iATU limits were not configured
> correctly.  The original design assumed at least 32GB or 128GB of
> BAR resource assignment, but the actual chip sets the iATU limit to
> only 4GB.  As a result, region_limit is always constrained by this
> 4GB boundary.
> 
> The correct workaround should be to program the iATU only for the
> 32-bit address space and skip iATU programming for the 64-bit space.
> A simple way to implement this workaround is to parse the
> num-viewport property from the devicetree and use this value
> directly, instead of relying on the result of reading
> PCIE_ATU_VIEWPORT.
> 
> I will attempt to implement it this way, but the correct method is
> not yet well-defined. Do you have any suggestions on how to modify
> the num-viewport property from the devicetree for use in the driver?
> It seems it will be modified in pcie-designware.c.

Nope, I don't know enough about DWC to give any advice, sorry!

> > > +static struct platform_driver qilai_pcie_driver = {
> > > +     .probe = qilai_pcie_probe,
> > > +     .driver = {
> > > +             .name   = "qilai-pcie",
> > > +             .of_match_table = qilai_pcie_of_match,
> > > +             /* only test passed at PROBE_DEFAULT_STRATEGY */
> > > +             .probe_type = PROBE_DEFAULT_STRATEGY,
> > 
> > This is the only use of PROBE_DEFAULT_STRATEGY in the entire tree, so
> > I doubt you need it.  If you do, please explain why in more detail.
> 
> In the V1 patch, the reviewer, Manivannan, suggested:
> "You should start using PROBE_PREFER_ASYNCHRONOUS."
> However, after setting up PROBE_PREFER_ASYNCHRONOUS, numerous errors
> were encountered during the EP device probe flow.
> Therefore, we would prefer to continue using PROBE_DEFAULT_STRATEGY.

I don't really know the details of probe_type.  But it sounds like the
errors with PROBE_PREFER_ASYNCHRONOUS should probably be debugged and
fixed.

If PROBE_PREFER_ASYNCHRONOUS can't be made to work, it sounds like you
should specify PROBE_FORCE_SYNCHRONOUS, because the comments suggest
that using PROBE_DEFAULT_STRATEGY means the driver should work with
either PROBE_FORCE_SYNCHRONOUS or PROBE_PREFER_ASYNCHRONOUS:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/device/driver.h?id=v6.16#n24

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
