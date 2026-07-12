Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD187C43458
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jul 2026 07:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HEfw0vqAUhffr42j4hiIiifwXpXOtJbzTgcx/u+ii/w=; b=m+6KMjixi2elqh
	PEm30AC6ivINCnVVJzBXHxv462T5LCsn+ibvW5UcLZuoZl3LLDg7PdU7QbRjILxfDW6jinRhH4p9i
	uAjF8qMObu0PYBT0N3xvJHKifRuW878oIj7xSezUHJIL3k3PkcZDFUntNihZSYWPAtI57crGqR2/M
	snI8hCZOICBMpiYfz2CLEepieeOFaK4p7e9X7Eskg6TKD1UOkUctL6J7cE7uN3rIHwwALqbmtAlGu
	lgtJb//psqtG/JtsMxTvv5NSij56m/IB51OXZqxnzzwcmg17SdBIHDMzxcGTH0fiN83PibsY3Xi89
	8cFxkuWd6vI4jsENU+NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wioc5-00000007E4L-1GFs;
	Sun, 12 Jul 2026 07:28:33 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wioc3-00000007E3v-0sIT
	for linux-riscv@lists.infradead.org;
	Sun, 12 Jul 2026 07:28:32 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cca0c5799eso21945345ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 12 Jul 2026 00:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783841310; x=1784446110; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lJkGlW1PNIgDL2QJ4YXVngoWTLt4PyzuUrEHmd42bds=;
        b=BI1/iu9IBeYspCn1a73CyNLqdWmArkoPA+Q42sv6jl6IDEEwRvtCD+u9BC3ai+C5Bz
         YMrPwcWH5yoI9wTmy3RB0clkrN3zCxj9XpWpJPd9L+/rqN/TUbnctqTKHqmXhorjQuEx
         bZAII6q2t0gR8FCnI8YST3F5gIGqj6B1heN0qQhR3IlAfJw1MwfC/kkrdGko0rZ8GGEY
         ciR8TI3xJ43ElVyg3GrgaA0jWv85+1mSPTVdCj4Cn21cVjcpYxh5TSPsvI+n1Ak139NU
         /NZ8YLlfvmgMrcg3twGJAw2BMaWmz9fgVRHB/NisFwJZmu3EHNMeFl1y259y36+gP4Fc
         Q3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783841310; x=1784446110;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lJkGlW1PNIgDL2QJ4YXVngoWTLt4PyzuUrEHmd42bds=;
        b=rEVgNF6WXPGmR89itT3Hdz/PaObcunhuPk+Gnw8BkZIHGlHl6fiFIJmxtDhLiHN+Hx
         NyYiWb9L/sGrvQ+YdLbZjsPGdG3xaJ4jNWcoYzEpY4BKgxZjfVESCIctcRYnNT3NIqDn
         jQWvOfu3TWRB6o8b+UeMR0LgwEkC5TvT+sLz6Zv2IfuZ1fiqwXQ0ifFBguXlW9gbd6uQ
         yXKsaof79mPX0BuWSUgxJdZ8rERT6tCZQ8lwAHig6Aes5TPaFpvqj2cFBjn3BQcWXVVK
         WSwJ8LEFafEXvIaaytZ8ewIpjP29GRgrI5TFDoT9x1V6EkNyt8ktuOv12pEuJ1LdqZpz
         WbJg==
X-Forwarded-Encrypted: i=1; AHgh+Ro0D6V1p5iiOKRHoRWSstm1G9/D+6IWl67YTcwDNUbZL39HmaN1f52q9TbXekhJTZNWHuysVy37RqHciw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwhaQ7e2bPnCZWOjmNNnTt448tKQaSmneHSBWzOUWSRegIyJFfl
	R7Pd6Y3/N503/A99fTuAQCgRwSs4p9+zk1y8boMIN0Qrf3DRv0CMGPE1
X-Gm-Gg: AfdE7clCJO94/NGkRS1INSOI5WzpbKygbf9yI1FbTE27qVUTEwVcLWulnMcFidEGWsg
	thay/cuoQ93jcItLN28TIWT6UsatQmOT6lCuYjauPrvZBeoqpq8fUp23DT2jFPdVrCjA3BXp2de
	J/DmkDeweHFvt+rWTz6AAjfYSoAo+dmQ/7XKgZjArRAROLJUn3xB9EoCLk9x7fHHUGCE9PpjDq3
	YQ0aS7EGiJczZ/uPxFgoKaA8i/dgcdFacB32gssDqI4HQn62tuv9yA+duBbLTRV5jkYyp+JSqW1
	/Xgeg0iS+SYBst4R65zHHoeJVbtVYpyFtC6RZo20BCxltqNTWqtMOvmMI98s08VvxT7xkD10AzJ
	hI0Qn8ykZiAfk1lbl8Dw6N7ii10z/lc+pw3dEKd+q+u0taJk6LLSXM7Lj+AcLf3a/
X-Received: by 2002:a17:903:1b08:b0:2ca:17a8:cfce with SMTP id d9443c01a7336-2ce9f2852b2mr53150225ad.29.1783841310195;
        Sun, 12 Jul 2026 00:28:30 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9c25fc0sm82771295ad.36.2026.07.12.00.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 00:28:29 -0700 (PDT)
Date: Sun, 12 Jul 2026 15:27:46 +0800
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
Subject: Re: [PATCH v4 2/6] PCI: spacemit-k1: Add multiple PHY handles support
Message-ID: <alNA03enTCy0RNAt@inochi.infowork>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-3-inochiama@gmail.com>
 <7e8cc486-8d0c-4bb0-ada9-fb4dd53e53e8@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7e8cc486-8d0c-4bb0-ada9-fb4dd53e53e8@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_002831_260190_591B19EB 
X-CRM114-Status: GOOD (  51.00  )
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

On Fri, Jul 10, 2026 at 11:01:23AM -0500, Alex Elder wrote:
> On 7/8/26 11:00 PM, Inochi Amaoto wrote:
> > The PCIe controller on Spacemit K3 may use multiple PHYs at the
> 
> s/use/uses/
> 
> > same time. The feature is not support by the current driver.
> 
> s/support/supported/
> 
> > So extend the PHY definition to support multiple PHY handles.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >   drivers/pci/controller/dwc/pcie-spacemit-k1.c | 70 ++++++++++++++++---
> >   1 file changed, 59 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > index f6ae8ff3589a..e22ecbd09579 100644
> > --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > @@ -55,12 +55,14 @@ struct k1_pcie_device_data {
> >   	const struct dw_pcie_host_ops *host_ops;
> >   	const struct dw_pcie_ops *ops;
> >   	int (*parse_port)(struct k1_pcie *k1);
> > +	unsigned int max_phy_count;
> 
> Is the name "max_phy_count" meant to suggest that there
> could be fewer "actual" PHYs than the number provided in
> this field?  If not--if it is simply "the number of PHYs
> this platform uses"--then just call this phy_count.
> 

Yes.

> >   };
> >   struct k1_pcie {
> >   	struct dw_pcie pci;
> >   	const struct k1_pcie_device_data *data;
> > -	struct phy *phy;
> > +	struct phy **phy;
> > +	unsigned int phy_count;
> 
> If this is always the same as what's in data->max_phy_count,
> you don't need to replicate the value here (since you're
> also keeping the data pointer in this structure).  (But it
> looks like it might be less than max_phy_count.)
> 
> I believe I suggested making this structure use a flexible
> array member for the PHYs.  If that's possible, it should
> go at the end of the structure, and the way you allocate
> it needs to change.
> 
> >   	void __iomem *link;
> >   	struct regmap *pmu;	/* Errors ignored; MMIO-backed regmap */
> >   	u32 pmu_off;
> > @@ -119,6 +121,54 @@ static void k1_pcie_disable_resources(struct k1_pcie *k1)
> >   	clk_bulk_disable_unprepare(ARRAY_SIZE(pci->app_clks), pci->app_clks);
> >   }
> > +static int k1_pcie_get_phy_handle(struct k1_pcie *k1, struct device_node *node)
> 
> I would call this k1_pci_get_phy_handles() (or perhaps
> just k1_pci_get_phys()).  Or even k1_pci_phy_get_all().
> The name you have seems like you're just getting one handle.
> 

OK, it is good for me.

> > +{
> > +	const struct k1_pcie_device_data *data = k1->data;
> > +	struct device *dev = k1->pci.dev;
> > +	unsigned int i;
> > +
> > +	k1->phy = devm_kmalloc_array(dev, data->max_phy_count,
> > +				     sizeof(*k1->phy), GFP_KERNEL);
> 
> Use kzalloc not kmalloc.  Even if you're initializing all fields
> now, a future change might not (and in that case having it zeroed
> is safest).
> 

Thanks.

> Also, if you find fewer than max_phy_count PHYs, I think it
> would be better to only allocate as many needed.  If you
> used a flexible array size, you would need to count the
> number of entries before allocating it.  It would require
> changing the structure a bit--providing a single function
> that would allocate the k1_pcie structure after doing that,
> and most likely initializing the phy array within the same
> function.
> 

Currently, it does not know the phy number before parsing,
the only thing we can is to parse this twice. I think it is
kind of unnecessary.

> > +	if (!k1->phy)
> > +		return -ENOMEM;
> > +
> > +	for (i = 0; i < data->max_phy_count; i++) {
> > +		k1->phy[i] = devm_of_phy_get_by_index(dev, node, i);
> > +		if (IS_ERR(k1->phy[i])) {
> 
> If this returns -ENODEV, you are done getting PHYs.  So
> max_phy_count could be more than the "actual" number.
> 
> Is that reasonable?  You indicate that at least one PHY
> must be found below, but is it OK for a platform to
> define fewer than some expected number of PHYs?
> 
> (Maybe it is.)
> 

Yes

> > +			if (PTR_ERR(k1->phy[i]) == -ENODEV)
> > +				break;
> > +
> > +			return PTR_ERR(k1->phy[i]);
> > +		}
> > +	}
> > +
> > +	k1->phy_count = i;
> > +	if (k1->phy_count == 0)
> > +		return -EINVAL;
> > +
> > +	return 0;
> > +}
> > +
> > +static int k1_pcie_enable_phy(struct k1_pcie *k1)
> 
> I would call this k1_pcie_enable_phys().  But actually,
> because what you're calling within this is phy_init(),
> I'd probably call it k1_pcie_init_phys(), or possibly
> k1_pcie_phy_init_all().
> 

I will take care of this in the next version.

> > +{
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	for (i = 0; i < k1->phy_count; i++) {
> > +		ret = phy_init(k1->phy[i]);
> > +		if (ret)
> > +			goto err_phy;
> > +	}
> > +
> > +	return 0;
> > +
> > +err_phy:
> > +	while (i--)
> > +		phy_exit(k1->phy[i]);
> > +
> > +	return ret;
> > +}
> > +
> >   /* FIXME: Disable ASPM L1 to avoid errors reported on some NVMe drives */
> >   static void k1_pcie_disable_aspm_l1(struct k1_pcie *k1)
> >   {
> > @@ -174,7 +224,7 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
> >   	 */
> >   	regmap_set_bits(k1->pmu, reset_ctrl, DEVICE_TYPE_RC | PCIE_AUX_PWR_DET);
> > -	ret = phy_init(k1->phy);
> > +	ret = k1_pcie_enable_phy(k1);
> >   	if (ret) {
> >   		k1_pcie_disable_resources(k1);
> > @@ -194,12 +244,14 @@ static void k1_pcie_deinit(struct dw_pcie_rp *pp)
> >   {
> >   	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >   	struct k1_pcie *k1 = to_k1_pcie(pci);
> > +	int i;
> >   	/* Assert fundamental reset (drive PERST# low) */
> >   	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
> >   			PCIE_RC_PERST);
> > -	phy_exit(k1->phy);
> > +	for (i = 0; i < k1->phy_count; i++)
> > +		phy_exit(k1->phy[i]);
> 
> Please create an inverse of k1_pcie_enable_phy(), like
> k1_pcie_disable_phy(), to encapsulate this code.
> 

Sound reasonable.

> >   	k1_pcie_disable_resources(k1);
> >   }
> > @@ -266,23 +318,18 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
> >   {
> >   	struct device *dev = k1->pci.dev;
> >   	struct device_node *root_port;
> > -	struct phy *phy;
> > +	int ret;
> >   	/* We assume only one root port */
> 
> Maybe you could get and put the root_port within
> k1_pcie_get_phy_handle(), since that's the only
> place it's needed.
> 

I think it is better to not do that, it is better to keep the function
do the thing as it claims.


> 					-Alex
> 
> >   	root_port = of_get_next_available_child(dev_of_node(dev), NULL);
> >   	if (!root_port)
> >   		return -EINVAL;
> > -	phy = devm_of_phy_get(dev, root_port, NULL);
> > +	ret = k1_pcie_get_phy_handle(k1, root_port);
> >   	of_node_put(root_port);
> > -	if (IS_ERR(phy))
> > -		return PTR_ERR(phy);
> > -
> > -	k1->phy = phy;
> > -
> > -	return 0;
> > +	return ret;
> >   }
> >   static int k1_pcie_probe(struct platform_device *pdev)
> > @@ -358,6 +405,7 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
> >   	.host_ops	= &k1_pcie_host_ops,
> >   	.ops		= &k1_pcie_ops,
> >   	.parse_port	= k1_pcie_parse_port,
> > +	.max_phy_count	= 1,
> >   };
> >   static const struct of_device_id k1_pcie_of_match_table[] = {
> 

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
