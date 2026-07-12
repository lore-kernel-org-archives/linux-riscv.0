Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09263C43458
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jul 2026 07:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HS50SvnKkl0j9L4trahatOBLb7o6+rmL7K273cVImQI=; b=uPV+qXfonGBwuR
	zKzTmVeoJM4+7gPIlk/f6/2M+B2NC729NxjU5feQ+1LLOKgjxOh/AIP2aLYRDElH/vUR8J8imQ3Vf
	GEjxr8TdY3dXKE1a0cm4YfN6wPbe515FFRRfgRjS90l6ALYz98fpIMDJe59rSDXHbnnNBu7OjO69F
	VoVu7iL+GviQ+K2P41+snC2A/LHvaoUeY7VWPtWjexuvfVaJZxWHiMKc8DePxoIjNj3k9oXfDbGqN
	EYepII7ENDOktQE3NMevysVc7xm3Wh+WeOGXuwbA7oKMuie+M1XN3CcN8t0l2hGgHHl4kUwTLj2c+
	LwKTI5hUruo7mCq/1ASQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wioWZ-00000007Dlh-2DmJ;
	Sun, 12 Jul 2026 07:22:51 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wioWW-00000007DlM-3tap
	for linux-riscv@lists.infradead.org;
	Sun, 12 Jul 2026 07:22:50 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2cca0c5799eso21928145ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 12 Jul 2026 00:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783840968; x=1784445768; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1YVff9t5wehszsbuc81mT3z1iJBzopqdoQscWyTxBF8=;
        b=m1PFe7tbFYLzj9CxG0S6np2+6V9uP0AO7ssbhBziV/lEQeAefeqhlEchEjRgf8yOmU
         fAkGQ67fCDAx431RowrWcPTyxmPtvkjzUp11vA0/bfQ2FfYZC05bHBkGBdjyvhVMJ0CF
         byOaXGz40uVRgrRVEkT8XzzyXWogvT4CaO2kSB/WBl9U+eg4WxYwn1I5fN6lNnXpytEZ
         cMVmA7CzC0mRaHQljKBE3O4pFvOTIVS4wUHjXD8nT0rVSTvMGU7yeOyy4OXfzIz2hjhr
         7Mn+kIFjaSreXZrA1e3RVdwFX/hO1Cw55ipK50h9p41KnrZYj8Q1x5ntdb9JcbZd/Wyh
         +xHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783840968; x=1784445768;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1YVff9t5wehszsbuc81mT3z1iJBzopqdoQscWyTxBF8=;
        b=VZmQuwrSRqf31IwRfss6enJcOObtZ2fzkpqWaNEssnbbSemrFiiZ17k80SqzUHkXZw
         LA2Rhg995U/EmZ7rd4Dp8lpCgErulYqMEDNy1tH7ZcM1dOy9byX+QfRYwuzeG/YwZLfb
         D5i3jo8YXX76/aW5+Nd2uTG4dKIDBHAU2ckliJrvVBm6evFcP47MImdw8+xj7NSmFNXx
         EXVoZ801cWuNZ3+R8uRgYozlgSHudetZF4APGuH+t/UZmo006SiJo52LdetQ7pVwH4m+
         FFu+EAtz4xFRBkFLpgDR3GJEwKfRDyWd4PifT8WXB+Ysl5Lk8ci8NmRi+hkjGUEx+d6A
         881A==
X-Forwarded-Encrypted: i=1; AHgh+RrA7hPVBFNyt2qftRMPFT2gg5z4ioANZ9gn9z9aIxDCJEAWRwzPsGXoQowdtgi9397NT/TDqCfNeXYuVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQBnUdz5ooX71HnPg1rcU0HTUGl9xpbP19WzZ2nW/chb1E+2Kp
	S6PxQceiImL5sHaaaY57dSwWEstRKktVVq8kmqfWYrSQI3ZP8Gaxqami
X-Gm-Gg: AfdE7ckd6P/Q3RUzHjqS23Qje0zdkEUjRUuZOz/1KgxGc5LNknbw/9j3b/8kHCRlDqb
	IeywEjMR6M7YT2kgKccqq68yRua0JMdIqBkbMZ29O4FKpua7M/cwkBZoQsGrm4Li/H4mNCsgw22
	3Y4URpFDrLbyoyd+Ql5xEBA9hSz1Hf9fY6rJ7FNIs4dtlRr6CuWiH04dHbT7ol/+DLE7fl3HI7k
	H5J5BiXKpd24mqnlaOx33CFKk9OAZbCTz5A/PRcoep8qCuTGqzqWwPCCllj/I0zIJFZSV57Gdxb
	JVrofnnxJaUrz6D8QpS4PsYG0xqzz0g47eOuMpdVBYI7vV1YgN1doLikmDflsZ0IxhIZWhTAeMg
	+NSIerYrlUB1e7lIANOLle8xuyvnqGl2DKPGxXMoHIacLo+tEQlqH1PtCoUuB3haa
X-Received: by 2002:a17:903:1aeb:b0:2c9:97a8:aff5 with SMTP id d9443c01a7336-2ce9f4d41acmr56801705ad.46.1783840967850;
        Sun, 12 Jul 2026 00:22:47 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d451sm82121015ad.65.2026.07.12.00.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 00:22:47 -0700 (PDT)
Date: Sun, 12 Jul 2026 15:22:03 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Christian Bruel <christian.bruel@foss.st.com>, Frank Li <Frank.Li@nxp.com>, Nam Cao <namcao@linutronix.de>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Xincheng Zhang <zhangxincheng@ultrarisc.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vidya Sagar <vidyas@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 6/6] PCI: spacemit-k1: Add Spacemit K3 PCIe host
 controller support
Message-ID: <alM8oPEsZ1lJU0DM@inochi.infowork>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-7-inochiama@gmail.com>
 <900e6239-bc00-46b6-aa9f-abe219c039d2@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <900e6239-bc00-46b6-aa9f-abe219c039d2@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_002249_015042_22B16A71 
X-CRM114-Status: GOOD (  70.68  )
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

On Fri, Jul 10, 2026 at 11:01:44AM -0500, Alex Elder wrote:
> On 7/8/26 11:00 PM, Inochi Amaoto wrote:
> > The PCIe controller on Spacemit K3 is almost a standard Synopsys
> > DesignWare PCIe IP with extra link and reset control. Unlike
> > the PCIe controller on K1, this controller supports external MSI
> > interrupt controller and can use multiple PHYs at the same time.
> > 
> > Add driver to support PCIe controller on Spacemit K3 PCIe.
> 
> I think it would be good to summarize how the K3 differs from
> the K1 here as well, since they're sharing code.  It looks
> like it supports up to 6 PHYs, not just 1 (as the K1 does).
> 

Thanks

> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >   drivers/pci/controller/dwc/Kconfig            |   4 +-
> >   drivers/pci/controller/dwc/pcie-spacemit-k1.c | 126 ++++++++++++++++++
> >   2 files changed, 128 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> > index aa0b784c85b4..dacbac5cc35c 100644
> > --- a/drivers/pci/controller/dwc/Kconfig
> > +++ b/drivers/pci/controller/dwc/Kconfig
> > @@ -440,7 +440,7 @@ config PCIE_SOPHGO_DW
> >   	  Sophgo SoCs.
> >   config PCIE_SPACEMIT_K1
> > -	tristate "SpacemiT K1 PCIe controller (host mode)"
> > +	tristate "SpacemiT PCIe controller (host mode)"
> >   	depends on ARCH_SPACEMIT || COMPILE_TEST
> >   	depends on HAS_IOMEM
> >   	select PCIE_DW_HOST
> > @@ -448,7 +448,7 @@ config PCIE_SPACEMIT_K1
> >   	default ARCH_SPACEMIT
> >   	help
> >   	  Enables support for the DesignWare based PCIe controller in
> > -	  the SpacemiT K1 SoC operating in host mode.  Three controllers
> > +	  the SpacemiT SoC operating in host mode. Three controllers
> >   	  are available on the K1 SoC; the first of these shares a PHY
> >   	  with a USB 3.0 host controller (one or the other can be used).
> > diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > index 31aac056b68e..680acc93f539 100644
> > --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > @@ -23,6 +23,7 @@
> >   #define PCI_VENDOR_ID_SPACEMIT		0x201f
> >   #define PCI_DEVICE_ID_SPACEMIT_K1	0x0001
> > +#define PCI_DEVICE_ID_SPACEMIT_K3	0x0002
> >   /* Offsets and field definitions for link management registers */
> >   #define K1_PHY_AHB_IRQ_EN			0x0000
> > @@ -32,8 +33,18 @@
> >   #define SMLH_LINK_UP			BIT(1)
> >   #define RDLH_LINK_UP			BIT(12)
> > +#define INTR_STATUS				0x0010
> 
> This register offset should probably be named K3_PHY_INTR_STATUS
> (or maybe it's just K3_INTR_STATUS?).  I see that INTR_ENABLE
> doesn't have a prefix, and I don't know why--that should have
> a similar name.  (Please fix that in your next version as well;
> I think it's OK to included it with this patch with a simple
> mention in the patch description.)
> 

I suggest not adding prefix here, as you have added a INTR_ENABLE,
I guess they are a pair. The thing I am sure is the INTR_STATUS1,
it should be K3 specific.

> > +
> >   #define INTR_ENABLE				0x0014
> >   #define MSI_CTRL_INT			BIT(11)
> > +#define RDLH_LINK_UP_INT		BIT(20)
> > +
> > +#define K3_PHY_AHB_IRQSTATUS_INTX		0x0008
> 
> So is this enabling INTX support?  If so, you should do that
> first in a separate patch that only applies to K1 (and that
> should be verified to work correctly).  If all you're doing
> is ensuring the status is cleared, that's OK here, but if
> you don't enable it I'm not sure it matters.
> 

No, it is just cleared.

> > +
> > +#define K3_ADDR_INTR_STATUS1			0x0018
> > +
> > +#define K3_CACHE_MSTR_AWCACHE_MODE	GENMASK(14, 11)
> > +#define K3_CACHE_MSTR_AWCACHE_BEHAVIOR	0xf
> >   /* Some controls require APMU regmap access */
> >   #define SYSCON_APMU			"spacemit,apmu"
> > @@ -48,6 +59,9 @@
> >   #define PCIE_CONTROL_LOGIC			0x0004
> >   #define PCIE_SOFT_RESET			BIT(0)
> > +#define PCIE_PERSTN_OE			BIT(24)
> > +#define PCIE_PERSTN_OUT			BIT(25)
> > +#define PCIE_IGNORE_PERSTN		BIT(31)
> >   struct k1_pcie;
> > @@ -340,6 +354,109 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
> >   	return ret;
> >   }
> 
> I ask a few questions in this function; I'm basically
> asking "are you *sure* this must be different for K3
> than K1?"  Because for the most part this function looks
> very similar to k1_pcie_init().
> 

Actually I was told from the vendor, and I had limit detail
about the regsiter. So I have to treat them as different
chip. And there is no public evidence that show they share
a similar design.

In my personal view, the common part of the IP should be
the same as they are both desingware IP, but for the vendor
specific part, I think the vendor does change something
heavily.

By checking your following advice, I found you stepped into
a bad design that reuse everything without checking its logic.
I agree with the common function point should be abstracted
and reused. But I do not think it is a good way to reuse the
a logic sequence as it improve nothing and make the reader
confused.

Also, Improving K1 is beyond this patchset , this patchset
only add the K3 support and reuse some obvious things. This
will following the minimal change. And since I know nothing
about K1 PCIe and you, as the author of this driver, should
know more details about K1 than me. Stop asking me for 
anything about improving K1. It is not the part of this
patchset ane make you silly.

> > +static int k3_pcie_init(struct dw_pcie_rp *pp)
> > +{
> > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > +	struct k1_pcie *k1 = to_k1_pcie(pci);
> > +	u32 reset_ctrl = k1->pmu_off + PCIE_CLK_RESET_CONTROL;
> > +	u32 val;
> > +	int ret;
> > +
> > +	regmap_clear_bits(k1->pmu, reset_ctrl, LTSSM_EN);
> 
> Would it be OK to clear this bit in the reset control
> register for K1 as well?
> 
> > +
> > +	k1_pcie_toggle_soft_reset(k1);
> > +
> > +	ret = k1_pcie_enable_resources(k1);
> > +	if (ret)
> > +		return ret;
> > +
> > +	regmap_set_bits(k1->pmu, reset_ctrl, PCIE_AUX_PWR_DET);
> > +	regmap_clear_bits(k1->pmu, reset_ctrl, APP_HOLD_PHY_RST);
> > +
> > +	ret = k1_pcie_enable_phy(k1);
> > +	if (ret) {
> > +		k1_pcie_disable_resources(k1);
> > +		return ret;
> > +	}
> > +
> 
> The handling of PERSTN looks different for K3 than K1.  Could you
> implement a helper function that abstracts the differences?
> 
> I don't really understand what's happening here, but if it's
> comparable to this for K1:
> 
>         /* Deassert fundamental reset (drive PERST# high) */
>         regmap_clear_bits(k1->pmu, reset_ctrl, PCIE_RC_PERST);
> 
> ...then a callback function (similar to parse_port) in the device
> data might be able to be called for both platforms, allowing
> the init function to be common for both.
> 
> > +	/* K3: Set IGNORE_PERSTN and drive PERSTN_OE high (assert reset) */
> > +	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> > +			PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE | PCIE_PERSTN_OUT);
> > +	usleep_range(1000, 2000);
> > +	regmap_clear_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC, PCIE_PERSTN_OUT);
> > +
> > +	msleep(PCIE_T_PVPERL_MS);
> > +
> > +	/*
> > +	 * Put the controller in root complex mode, and indicate that
> > +	 * Vaux (3.3v) is present.
> 
> Here too, you could abstract what's happening and that might
> allow the init function to be common for both (all) platforms.
> 

The comment will be removed as it does not reflect on the real
logic.

> > +	 */
> > +	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> > +			PCIE_PERSTN_OUT | PCIE_PERSTN_OE);
> > +
> > +	val = dw_pcie_readl_dbi(pci, GEN3_EQ_CONTROL_OFF);
> > +	val = u32_replace_bits(val, BIT(7),
> > +			       GEN3_EQ_CONTROL_OFF_PSET_REQ_VEC);
> > +	dw_pcie_writel_dbi(pci, GEN3_EQ_CONTROL_OFF, val);
> > +
> > +	k1_pcie_set_device_id(k1);
> 
> This is done earlier in k1_pcie_init().  Could it be done at the
> same time for both platforms?
> 

It can move, but I think it is necessary. See the consideration 
above.

> > +
> > +	/* Finally, as a workaround, disable ASPM L1 */
> > +	k1_pcie_disable_aspm_l1(k1);
> > +
> > +	return 0;
> > +}
> > +
> > +static int k3_pcie_msi_host_init(struct dw_pcie_rp *pp)
> 
> Why is this needed for K3, but not for K1?  Does this
> enable any functionality that K1 could use and benefit
> from?
> 
> > +{
> > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > +	u32 val;
> > +
> > +	dw_pcie_dbi_ro_wr_en(pci);
> > +
> > +	val = dw_pcie_readl_dbi(pci, COHERENCY_CONTROL_3_OFF);
> > +	val = u32_replace_bits(val, K3_CACHE_MSTR_AWCACHE_BEHAVIOR,
> > +			       K3_CACHE_MSTR_AWCACHE_MODE);
> > +	dw_pcie_writel_dbi(pci, COHERENCY_CONTROL_3_OFF, val);
> > +
> > +	dw_pcie_dbi_ro_wr_dis(pci);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct dw_pcie_host_ops k3_pcie_host_ops = {
> > +	.init		= k3_pcie_init,
> > +	.deinit		= k1_pcie_deinit,
> > +	.msi_init	= k3_pcie_msi_host_init,
> > +};
> > +
> > +static const struct dw_pcie_ops k3_pcie_ops = {
> 
> This is identical to k1_pcie_ops, so isn't needed.
> 

OK for me.

> > +	.link_up	= k1_pcie_link_up,
> > +	.start_link	= k1_pcie_start_link,
> > +	.stop_link	= k1_pcie_stop_link,
> > +};
> > +
> > +static void k3_pcie_clear_irq_status(struct k1_pcie *k1,
> > +				     u32 *status0, u32 *status1, u32 *status2)
> 
> I don't see any value in this helper function, at
> least not based on how it's used now.  It is used
> exactly once, to clear (by writing) three interrupt
> status registers.  Just do that inline.
> 
> Even if you want to use this helper function in a
> second place (when handling the itnerrupt), don't
> pass in these status arguments, they're not needed
> in the caller.  Just define them here.
> 
> Also you could read/write each register, and use
> a single local variable (status) to hold the value
> read and written.
> 

It fine for me. I will merge it in to the probe function.

> > +{
> > +	*status0 = readl_relaxed(k1->link + K3_PHY_AHB_IRQSTATUS_INTX);
> > +	*status1 = readl_relaxed(k1->link + INTR_STATUS);
> > +	*status2 = readl_relaxed(k1->link + K3_ADDR_INTR_STATUS1);
> > +
> > +	writel_relaxed(*status0, k1->link + K3_PHY_AHB_IRQSTATUS_INTX);
> > +	writel_relaxed(*status1, k1->link + INTR_STATUS);
> > +	writel_relaxed(*status2, k1->link + K3_ADDR_INTR_STATUS1);
> > +}
> > +
> > +static int k3_pcie_parse_port(struct k1_pcie *k1)
> > +{
> > +	u32 status0, status1, status2;
> > +
> > +	k3_pcie_clear_irq_status(k1, &status0, &status1, &status2);
> 
> Is it really necessary to clear the IRQ status *only* for K3?
> It seems like it would be a good idea (or at least harmless)
> to do it for K1 as well.  And in that case, it should just be
> added to the existing k1_pcie_parse_port() function.
> 
> > +
> > +	return k1_pcie_parse_port(k1);
> > +}
> > +
> >   static int k1_pcie_probe(struct platform_device *pdev)
> >   {
> >   	const struct k1_pcie_device_data *data;
> > @@ -417,8 +534,17 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
> >   	.device_id	= PCI_DEVICE_ID_SPACEMIT_K1,
> >   };
> > +static const struct k1_pcie_device_data k3_pcie_device_data = {
> > +	.host_ops	= &k3_pcie_host_ops,
> > +	.ops		= &k3_pcie_ops,
> 
> I think ops could just point to k1_pcie_ops here.
> 
> 					-Alex
> 
> > +	.parse_port	= k3_pcie_parse_port,
> > +	.max_phy_count	= 6,
> > +	.device_id	= PCI_DEVICE_ID_SPACEMIT_K3,
> > +};
> > +
> >   static const struct of_device_id k1_pcie_of_match_table[] = {
> >   	{ .compatible = "spacemit,k1-pcie", .data = &k1_pcie_device_data},
> > +	{ .compatible = "spacemit,k3-pcie", .data = &k3_pcie_device_data},
> >   	{ }
> >   };
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
