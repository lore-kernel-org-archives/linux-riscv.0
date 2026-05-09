Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A7ECD3447
	for <linux-riscv@archiver.kernel.org>; Sat,  9 May 2026 07:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M8ZCePWtzozoglC2OYtouGvZl2GUg43G4tOHLq6O3yg=; b=3gMwhj7joU+/72
	lzrrx2UP5Kuj0aG/dfNle4wI0cZlqiYeQo3WGsvm5CNec/km07LRQDEnQ2Juc0Br0+hS2BjDEhubV
	ONbI9rzJbmnVlBVQiSBXAB/ZT+UyZYfjHEhBWozIdMvl9bUsSUJWs5bm6ItgtADqWddtxX9pUjUbo
	JiVdofavUQzwhqxxJrcimzsazMCkfJs+WYQOSTQ6GsNLkiMkb+Sx5zqrHhwYNGVvr88cg/l1lgdTO
	Ll01OOm1wWh58qoPz1yxui6awR23EKWfGtDrdzAuvqYBnbZANdRohXfakWi62S4QjWw+FEa4Rsa2r
	GFP7eEfHnfAAgZvBUW9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLcBY-00000008UXf-22qA;
	Sat, 09 May 2026 07:33:16 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLcBW-00000008UX1-0xs9
	for linux-riscv@lists.infradead.org;
	Sat, 09 May 2026 07:33:15 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-837c09d2268so1207106b3a.0
        for <linux-riscv@lists.infradead.org>; Sat, 09 May 2026 00:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778311993; x=1778916793; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4rrWX8PR+HWUg34CwgZ0qTRfJ+rZargOz41FLZiRD60=;
        b=lxU+SzLRzWKHH/g4FZXo2AtslWVSIXxxgyG6V2jTDquIWO+WXskjNuVw9lzDAIfnES
         beNe4Y3UlVF49A1iVP9pWyhhwZCMWZr2iFSBy6IU0jKq4Q4C4PycqNsGNXiqpu1SY/o6
         v4IXAWKyqdLfu6+j8/5VJwR2qR6ofNZBsw9hDSOYd83FxoC1FBeeC8qMpVC1VK8/2STl
         gRlaLoNF4Gw33yBLD+VKNjHYH65TafJ8NOTUBrIzLpJYqe1mFKXQj2WAg1m5l2s1/Erz
         Qjygbq1Ml8skBJP7PocXEl87a5owmXC3BZBYwfNVStXiRP3ustqzLjYPn9Fz181b2B9s
         bGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778311993; x=1778916793;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rrWX8PR+HWUg34CwgZ0qTRfJ+rZargOz41FLZiRD60=;
        b=PBFDr4vQ3MzFhIjQ+NMDJiGnfUVOLQLeAakoYxBiD+S63aTPKOalDa1aLT/PIB78I9
         9geIB66pjAWVIr4s3mgO3UZTNTmnJ/BXZys+lubnwauITlMndHx7vANihOORbeGEPb38
         w5TAmqPgaBT8EW1oTczAm/ZA7RFGG4zodbbCbMYipI7FoVYNQpGXK37ez3q0dIA80/fx
         PzBGKGh5kBpcmFfpxGlBInyDKm437vzD8L53bBGlUT1ialCo3P061XY9VV02Y+fBGKtM
         lL1KHbRpyyNCIhBk/lKLDMAmINfjCIflred7ciqc8ficdWMaXunDVZoDHpL0+dkCip+t
         lsKA==
X-Forwarded-Encrypted: i=1; AFNElJ/PZpK/Rfv5Mw5+UxVb5JninRbdnydmNW3YBfHXM0r+JpqPtZlPydGTKaejsEk0zcvcTMi66DHgVozLlA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5fDNYPCB4Yg94KbLVddh1F5xr17MfdP6msSUTUYtIFBdvukOl
	Fovomnz6qz1kjZR9Bt9xwKc3qN/HrM0N1sFGa52ijjt7V17y+1SI8prG
X-Gm-Gg: Acq92OE13mSAVuwSdPArZqwT9cWirTnSE7AWiI6dqVy7jF6bGEVYxkvICa+CYhJ8ln3
	fNbyshcGVRWmhW6g03Vmu8skJ/8Q1lcKxVkQmnIkXAYriKWvwtkuN1UKIVX5kvg4zREZ7xN8gds
	tykQIpd3vLWR1PF4qCFLnVRvBkdLIS23KwFL7iz0bOgwhoQDFQy/D5n4G0Lty2ev5x7LTML68Uy
	FiVYzMZ2SgNv2leAEsGXlymXay+MglxVIAiTimwXCVhTFNAFVzaaEkv1TXoMXShVGdb4CadHlA8
	R+J6C5/71KV4LBrJJoh7ehG54838FqulWiHNzU4U4O1dXgW6nq6MxOpMhP8/K67HRhyugl8dBTV
	E4Dpf5pN0amH50iemj67xRtN8Jg/3NCtmpfuUti1OXr2nOfUZA0AYnKe3yyR6+upy1EYdoZTwOk
	GD4BzpqDx7Lsr6616pbR8HfoFypquIpjPh5w==
X-Received: by 2002:a05:6a00:1407:b0:837:eaa9:381f with SMTP id d2e1a72fcca58-83a57c7782dmr15579899b3a.0.1778311993011;
        Sat, 09 May 2026 00:33:13 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbf67fsm14681697b3a.47.2026.05.09.00.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 00:33:12 -0700 (PDT)
Date: Sat, 9 May 2026 15:32:52 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alex Elder <elder@riscstar.com>, 
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 5/5] PCI: spacemit-k1: Add Spacemit K3 PCIe host
 controller support
Message-ID: <af7fu8xuv3faMhPe@inochi.infowork>
References: <20260502101319.2364052-6-inochiama@gmail.com>
 <20260507224217.GA48780@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260507224217.GA48780@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_003314_277553_FD34D662 
X-CRM114-Status: GOOD (  42.91  )
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

On Thu, May 07, 2026 at 05:42:17PM -0500, Bjorn Helgaas wrote:
> On Sat, May 02, 2026 at 06:13:18PM +0800, Inochi Amaoto wrote:
> > The PCIe controller on Spacemit K3 is almost a standard Synopsys
> > Designware PCIe IP with extra link and reset control. Unlike
> > the PCIe controller on K1, this controller supports external MSI
> > interrupt controller and can use multiple phy at the same time.
> > 
> > Add driver to support PCIe controller on Spacemit K3 PCIe.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> 
> Sashiko had some good questions:
> https://sashiko.dev/#/patchset/20260502101319.2364052-1-inochiama%40gmail.com
> 
> Looks like the CONFIG_PCIE_SPACEMIT_K1 menu item and help text
> drivers/pci/controller/dwc/Kconfig should be updated to include K3.
> 
> The "CONFIG_PCIE_SPACEMIT_K1" name itself should stay the same.
> 
> s/Designware/DesignWare/, also in 4/5 commit log
> s/phy/PHY/ here and other patches and subject lines
> s/msi/MSI/ in 3/5 subject and commit log when it's a stand-alone word
> s/pci:/PCI:/ in 4/5 subject to match history (and patch 3/5)
> 

See it, thanks, I will take care of that

> > +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> 
> > +#define INTR_STATUS				0x0010
> > +
> >  #define INTR_ENABLE				0x0014
> >  #define MSI_CTRL_INT			BIT(11)
> > +#define RDLH_LINK_UP_INT		BIT(20)
> > +
> > +#define K3_PHY_AHB_IRQSTATUS_INTX		0x0008
> > +
> > +#define K3_PHY_AHB_IRQENABLE_SET_INTX		0x000c
> > +#define LEG_EP_INTERRUPTS		(BIT(6) | BIT(7) | BIT(8) | BIT(9))
> 
> Would be nicer to use "INTX" rather than "LEG" here since we use
> "INTX" in K3_PHY_AHB_IRQENABLE_SET_INTX, in the comments, etc.
> 
> > +#define K3_PHY_AHB_IRQENABLE_SET_MSI		0x0014
> > +/* MSI defined as BIT(11) in existing INTR_ENABLE, reusing */
> > +
> > +#define K3_ADDR_INTR_STATUS1			0x0018
> > +
> > +#define K3_ADDR_INTR_ENABLE1			0x001C
> 
> You're using a mix of upper- and lower-case hex here.  Be consistent
> and match the existing code.
> 
> Seems a little weird to have a mix of "IRQ" names (e.g.,
> K1_PHY_AHB_IRQ_EN, K3_PHY_AHB_IRQSTATUS_INTX,
> K3_PHY_AHB_IRQENABLE_SET_INTX) and "INTR" names (e.g., INTR_STATUS,
> INTR_ENABLE, K3_ADDR_INTR_STATUS1, K3_ADDR_INTR_ENABLE1) when I think
> they're really talking about the same concept.
> 
> And why do the new K3 names have "ADDR" in the middle when the
> existing "INTR_ENABLE" names don't?  It's obvious these are addresses
> (well, actually I think they're *offsets*, but no need to be that
> detailed).
> 

In fact I have no detailed document about these name, but reference
to their comments, I think it is a register for some link features.
So it could be more accurate to be named with "LINK"

> > +static int k3_pcie_init(struct dw_pcie_rp *pp)
> > +{
> > ...
> > +	val = dw_pcie_readl_dbi(pci, GEN3_EQ_CONTROL_OFF);
> > +	val &= ~(0xffff << 8);
> > +	val |= ((0x1 << 4) << 8);
> 
> Can you use FIELD_MODIFY and some #defines here?

It is fine for me.

> 
> > +	dw_pcie_writel_dbi(pci, GEN3_EQ_CONTROL_OFF, val);
> > +
> > +	/* Set the PCI vendor and device ID */
> 
> Superfluous comment since the code is obvious.
> 

OK, I will remove it

> > +	dw_pcie_dbi_ro_wr_en(pci);
> > +	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
> > +	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, PCI_DEVICE_ID_SPACEMIT_K3);
> > +	dw_pcie_dbi_ro_wr_dis(pci);
> > +
> > +	/* Finally, as a workaround, disable ASPM L1 */
> 
> I guess this means a device erratum?  It advertises L1 but it doesn't
> actually work?
> 
> > +	k1_pcie_disable_aspm_l1(k1);
> 
> > +static int k3_pcie_msi_host_init(struct dw_pcie_rp *pp)
> > +{
> > ...
> > +	val = dw_pcie_readl_dbi(pci, COHERENCY_CONTROL_3_OFF);
> > +	val |= (0xf << 11);
> 
> FIELD_MODIFY and some #defines here?
> 

OK.

> > +static int k3_pcie_start_link(struct dw_pcie *pci)
> > +{
> > +	struct k1_pcie *k1 = to_k1_pcie(pci);
> > +	u32 val;
> > +
> > +	k1_pcie_start_link(pci);
> > +
> > +	/* Enable INTx */
> > +	val = readl_relaxed(k1->link + K3_PHY_AHB_IRQENABLE_SET_INTX);
> > +	val |= LEG_EP_INTERRUPTS;
> > +	writel_relaxed(val, k1->link + K3_PHY_AHB_IRQENABLE_SET_INTX);
> > +
> > +	/* Enable MSI/MSIX specific to K3 */
> 
> s/MSIX/MSI-X/ to match spec usage.
> 
> > +	val = readl_relaxed(k1->link + K3_ADDR_INTR_ENABLE1);
> > +	val |= (MSI_INT | MSIX_INT);
> > +	writel_relaxed(val, k1->link + K3_ADDR_INTR_ENABLE1);
> 
> Generally speaking I think the interrupt setup belongs somewhere other
> than .start_link().  Usually .start_link() only enables LTSSM.
> 

Yes, this logic are not needed any more after I recheck the vendor
code. Only thing related to the link will be left.

With this, the macro like LEG_EP_INTERRUPTS can be removed.

> > +	return 0;
> > +}
> 
> > +static irqreturn_t k3_pcie_irq_thread(int irq, void *data)
> > +{
> > +	struct k1_pcie *k1 = data;
> > +	struct dw_pcie_rp *pp = &k1->pci.pp;
> > +	struct device *dev = k1->pci.dev;
> > +	u32 status0, status1, status2;
> > +
> > +	k3_pcie_clear_irq_status(k1, &status0, &status1, &status2);
> > +
> > +	writel_relaxed(status0, k1->link + K3_PHY_AHB_IRQSTATUS_INTX);
> > +	writel_relaxed(status1, k1->link + INTR_STATUS);
> > +	writel_relaxed(status2, k1->link + K3_ADDR_INTR_STATUS1);
> > +
> > +	if (FIELD_GET(RDLH_LINK_UP_INT, status1)) {
> > +		msleep(PCIE_RESET_CONFIG_WAIT_MS);
> > +		/* Rescan the bus to enumerate endpoint devices */
> > +		pci_lock_rescan_remove();
> > +		pci_rescan_bus(pp->bridge->bus);
> 
> This is the *only* driver that uses pci_rescan_bus() this way, which
> automatically makes it suspicous.  Maybe it's the first hardware that
> implements or is willing to use RDLH_LINK_UP_INT for this, but somehow
> I doubt it.
>

I am going to remove this. At least I do not think it is very proper
to add this in the first version. 
The vendor explained that they use this interrupt to speed up the
device link up check. This depends on a feature that make dwc skip
the link up delay. And this feature is removed in v7.0. In commit
142d5869f6ee ("Revert "PCI: dwc: Don't wait for link up if driver
can detect Link Up event"")

Regards,
Inochi
 
> > +		pci_unlock_rescan_remove();
> > +	} else if (!status0 && !status1 && !status2)
> > +		dev_WARN_ONCE(dev, true,
> > +			      "Received unknown event. status0=0x%08x status1=0x%08x status2=0x%08x\n",
> > +			      status0, status1, status2);
> > +
> > +	return IRQ_HANDLED;
> > +}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
