Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4CFCCF2C9
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Oct 2026 12:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eNgOFCcpSfCUjgOufeK4vfKJ8ENZ/+SoZzY0ngVKDa4=; b=xfctXmPmqyvJ1F
	4zmBa8kSP3Jq5HtqhQ9r5PKlt4YykPMPOBLL2M1kISFjJRQR6LZnFqoIpbU3pHa7ZG9ajX/idQiLw
	pwkhewA7d2p1kkTEu/O/O/0punjkSHAiE8FN09jO3PsupzF6jNoYEdmAHQO8TDN+qSVONkXnvjIkx
	l0kIxCYyC0wMaWgY1tdGcxyk2K75AsLKYNM/yJ3GwUpUG/AstHtIZTAfUHL0unMt5M0KW3PGw32n/
	rSLwemwStmXMYmGrcWIq+RB34hwe1eXHrKoXnS+gO+kbafVBgQipnE56lTRTcQ2j+qBa0SDM8qexC
	jD199118j/7iEPn+7IFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIPoN-00000005pbg-1gab;
	Sun, 18 Oct 2026 12:16:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIPoL-00000005pba-2KK0
	for linux-riscv@lists.infradead.org;
	Sun, 18 Oct 2026 12:16:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E66DA40A99;
	Sun, 18 Oct 2026 12:16:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 389FC1F000C4;
	Sun, 18 Oct 2026 12:16:06 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v7 6/6] PCI: spacemit-k1: Add Spacemit K3 PCIe host
 controller support
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Frank Li <Frank.Li@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
 Niklas Cassel <cassel@kernel.org>, 
 Christian Bruel <christian.bruel@foss.st.com>, 
 Senchuan Zhang <zhangsenchuan@eswincomputing.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Randolph Lin <randolph@andestech.com>, 
 Xincheng Zhang <zhangxincheng@ultrarisc.com>, 
 Alex Elder <elder@riscstar.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Vidya Sagar <vidyas@nvidia.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, linux-pci@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
In-Reply-To: <arzYt1svE0HtZPSB@inochi.infowork>
References: <20260929083755.458238-1-inochiama@gmail.com>
 <20260929083755.458238-7-inochiama@gmail.com>
 <arzAGOKLOustEW7F@ashevche-desk.local> <arzYt1svE0HtZPSB@inochi.infowork>
Date: Sun, 18 Oct 2026 17:45:53 +0530
Message-Id: <179232575369.2114.17486970950843580484.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3918;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=1+bzX4D83wRXdVGWnDM81hIqRB9iDL/i6XQrXMg469g=;
 b=owGbwMvMwMUYOl/w2b+J574ynlZLYsi6sqOp5HR6+/6Zi9TeXRfUO5ulZG6QrBXsetxa7mLa2
 u26NSZCnYzGLAyMXAyyYoos6UudtRo9Tt9YEqE+HWYQKxPIFAYuTgGYSAsj+z991nLpwsUV2+rf
 zdi2JrNLyc6e5c/J+/72/8zFE3/VRU9PXRcVf9ajXmZ3YvKasOKeyZlnNwgofTH8+TdWWnTH636
 OmUt4Ii6zVSR08SiLc5zjlAhq/v3m/6Owl1ve3+XMTWw38G86l/ZF6myfk92k6HIf+30cFwK3nW
 v4kFAm2XzKLSR95S0JOYbHt8pvfJ/GIWth7L795AHmHV3b1NyVapN/Pvko0Fc5TzFz44HyvfI7f
 d0Vv3TPdEox7fpkzOi2h1Fz/w57v6VXfvNx1yUUVleGeVpVlTV4fWR6yrX7QFioQsAKwTgrxc88
 nVWG79+xh4X4bhdqbfJ6sJrtnfceo97QfweOb2SPZPoIAA==
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
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

On 2026-09-30 17:44 +0800, Inochi Amaoto wrote:
> On Wed, Sep 30, 2026 at 10:54:00AM +0300, Andy Shevchenko wrote:
> > On Tue, Sep 29, 2026 at 04:37:52PM +0800, Inochi Amaoto wrote:
> > > The PCIe controller on Spacemit K3 is almost a standard Synopsys
> > > DesignWare PCIe IP with extra link and reset control. Unlike
> > > the PCIe controller on K1, this controller supports external MSI
> > > interrupt controller and can use multiple PHYs at the same time.
> > > 
> > > Add driver to support PCIe controller on Spacemit K3 PCIe.
> > 
> > ...
> > 
> > > +static int k3_pcie_init(struct dw_pcie_rp *pp)
> > > +{
> > > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > > +	struct k1_pcie *k1 = to_k1_pcie(pci);
> > > +	u32 reset_ctrl = k1->pmu_off + PCIE_CLK_RESET_CONTROL;
> > > +	u32 val;
> > > +	int ret;
> > > +
> > > +	regmap_clear_bits(k1->pmu, reset_ctrl, LTSSM_EN);
> > > +
> > > +	k1_pcie_toggle_soft_reset(k1);
> > > +
> > > +	/* K3: Set IGNORE_PERSTN and drive PERSTN_OE high (assert reset) */
> > > +	regmap_update_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> > > +			   PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE | PCIE_PERSTN_OUT,
> > > +			   PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE);
> > 
> > Would it make sense to define permutations
> > 
> >   PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE
> > 
> > for here...
> > 
> 
> I think it does not make sense, they are two separate fields.
> A combine does not make the thing easier.
> 
> > > +	ret = k1_pcie_enable_resources(k1);
> > > +	if (ret)
> > > +		goto failed_resources;
> > > +
> > > +	regmap_set_bits(k1->pmu, reset_ctrl, PCIE_AUX_PWR_DET);
> > > +	regmap_clear_bits(k1->pmu, reset_ctrl, APP_HOLD_PHY_RST);
> > > +
> > > +	ret = phy_bulk_init(k1->phy_count, k1->phys);
> > > +	if (ret)
> > > +		goto failed_phy_init;
> > > +
> > > +	ret = phy_bulk_power_on(k1->phy_count, k1->phys);
> > > +	if (ret)
> > > +		goto failed_phy_power_on;
> > > +
> > > +	msleep(PCIE_T_PVPERL_MS);
> > > +
> > > +	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> > > +			PCIE_PERSTN_OUT | PCIE_PERSTN_OE);
> > 
> > ...and
> > 
> >   PCIE_PERSTN_OUT | PCIE_PERSTN_OE
> > 
> > for here and elsewhere?
> > 
> > > +	val = dw_pcie_readl_dbi(pci, GEN3_EQ_CONTROL_OFF);
> > 
> > > +	val = u32_replace_bits(val, BIT(7),
> > > +			       GEN3_EQ_CONTROL_OFF_PSET_REQ_VEC);
> > 
> > It's perfectly a single line. Check your editor settings (I believe I have
> > commented on a such in one of the previous rounds).
> > 
> 
> Yes, but it is too hard for me as the intellisense plugin will show
> the argument name so I am toot hard to keep that for a line that near
> 80 chars....
> 

If the line is within 80 chars, then there is no need to break. If your plugin
is the issue, then fix it please.

> > > +	dw_pcie_writel_dbi(pci, GEN3_EQ_CONTROL_OFF, val);
> > > +
> > > +	k1_pcie_set_device_id(k1);
> > > +
> > > +	/* Finally, as a workaround, disable ASPM L1 */
> > > +	k1_pcie_disable_aspm_l1(k1);
> > > +
> > > +	return 0;
> > > +
> > > +failed_phy_power_on:
> > > +	phy_bulk_exit(k1->phy_count, k1->phys);
> > > +failed_phy_init:
> > > +	k1_pcie_disable_resources(k1);
> > > +failed_resources:
> > > +	regmap_update_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> > > +			   PCIE_PERSTN_OUT | PCIE_PERSTN_OE,
> > > +			   PCIE_PERSTN_OE);
> > > +
> > > +	return ret;
> > > +}
> > 
> > ...
> > 
> > You checked everything but regmap IO. Why? Do you except it won't ever fail?
> > Perhaps to add a note about this (if not yet) to the cover letter?
> > 
> 
> It should not fail. IIRC the regmap will not fail for an
> exclusive usage. The regmap here is just as handle for
> the common device, but the device driver only use its
> exclusive area so it should be safe.
> 

Here, regmap on MMIO is just readl+writel, so there is no way it can fail.

- Mani



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
