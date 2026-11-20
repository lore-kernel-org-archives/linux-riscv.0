Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E67E60A2610
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 00:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wq1OKn1m;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bLm/MCFL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GKOkOg5GTigUGJbdssyczfGjy0SdY1N3GCVa791bGeg=; b=Wq1OKn1mIdPYibIq3rEoJILSHt
	jhxUeMmrgGAib14iNRFe2B+2YwZyEVwDN/JtwDRIqo2Aj1xB+R3iyCy6UJTFe+IYZCAnqvAyvk/3Q
	fqZOeJR8EM1FGQiEBL4qLjbvy4cvAaQ9raPhiAaDqqOCOlzZe14UkPxgRkGxI8YGczZg3t2fvDYHa
	hHjICz61DPH6ag8jaRca+d9wLjuiDtTXRmBjRK81lfUje8Y2SYN3umKLAlT6Idjkv3PiqjzY0Ajnc
	a3xpjEXq9g1asqMw1b5Mr9LkHXMd/O/3VBsRcs/lTBvxNUg9QCfaVxHxDuFETavS6OZrPJwSMcYMF
	p3/EINYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUCVy-0000000DkT4-318C;
	Fri, 20 Nov 2026 00:30:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUCVx-0000000DkSx-2jIR
	for linux-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 00:30:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BBFBB60D86;
	Fri, 20 Nov 2026 00:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B12AB1F000C4;
	Fri, 20 Nov 2026 00:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795134604;
	bh=spQYeU6542V64iaRZJYUdLSnSLYK38L77Q167Rmh7/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bLm/MCFLyl61eg8R9ubKDw53/mPhRc0aUoTOqic5Ongt+RE2EGkPf24KJsGYOBP38
	 8fKO2+FVv+Y9WbQS/IHYuuf2O7byIf8qrDc4ogud9nb5R5r7gSFXs8gLHNIdP/Uv7Q
	 zB7escgWn70lmZTG/sxWh9/4MzhZP4fY1JFYJx8KFhqCBsX0xBUjzL9arZSEi31W0D
	 +zhIOA6R7T+L/5Mrr+9kB74pBA8OOreoKPr3Q3x2IutxfG34ysfsklPrPTbTKs+3/O
	 k+GX0xOVAf8ANgJd6NnJte7esVlut+jBwVA2PxQPC/KW0rbqASgCYnr5pVSKv+/nvK
	 u3YLIOiieiHHw==
Date: Thu, 19 Nov 2026 16:30:02 -0800
From: Drew Fustini <fustini@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atish.patra@linux.dev>,
	Babu Moger <babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>,
	Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>,
	Gong Shuai <gong.shuai@sanechips.com.cn>,
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
	James Morse <james.morse@arm.com>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Peter Newman <peternewman@google.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sunil V L <sunilvl@oss.qualcomm.com>,
	Tony Luck <tony.luck@intel.com>, Weiwei Li <liwei1518@gmail.com>,
	yunhui cui <cuiyunhui@bytedance.com>,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zeng Heng <zengheng@picoheart.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, x86@kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v12 5/5] riscv_cbqri: Add CBQRI capacity allocation
 platform driver
Message-ID: <av-Uip0Yp4NGYGEM@thelio>
References: <20261114-dfustini-atl-sc-cbqri-dt-v12-0-6ef1f627072d@kernel.org>
 <20261114-dfustini-atl-sc-cbqri-dt-v12-5-6ef1f627072d@kernel.org>
 <20261119000000.1b43ba35@jic23-hlaptop>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261119000000.1b43ba35@jic23-hlaptop>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 12:00:00AM +0000, Jonathan Cameron wrote:
> On Sat, 14 Nov 2026 14:06:25 -0800
> Drew Fustini <fustini@kernel.org> wrote:
> 
> > Add a platform driver for CBQRI capacity controllers described in
> > device tree with the riscv,cbqri-capacity-controller compatible.
> > 
> > The controller node points at the cache it governs with a
> > riscv,cbqri-cache phandle. The driver maps the register block, looks
> > that cache up in cacheinfo and uses its cache id as the resctrl domain
> > id, so the binding does not need to carry a CPU mask. The controller is
> > then handed to the CBQRI core, which probes its capabilities and decides
> > whether to expose it through resctrl. Only an L2 or L3 cache is
> > accepted, since those are the cache levels resctrl has resources for.
> > 
> > Nothing is vendor-specific and reg is the CBQRI register block itself,
> > so any SoC that describes a CBQRI capacity controller in device tree can
> > use the driver unchanged.
> > 
> > Tested-by: Chen Pei <cp0613@linux.alibaba.com>
> > Tested-by: Zeng Heng <zengheng@picoheart.com>
> > Reviewed-by: Zeng Heng <zengheng@picoheart.com>
> > Signed-off-by: Drew Fustini <fustini@kernel.org>
> 
> Sorry, late to the game and pretty much a drive by review.
> 
> Still a few things below that will leave you with more readable
> and probably less fragile code.
> 
> Jonathan

Thanks!

> 
> > diff --git a/drivers/resctrl/cbqri_capacity.c b/drivers/resctrl/cbqri_capacity.c
> > new file mode 100644
> > index 000000000000..6f3d06c4f74b
> > --- /dev/null
> > +++ b/drivers/resctrl/cbqri_capacity.c
> 
> > +static int cbqri_capacity_probe(struct platform_device *pdev)
> > +{
> 
> Noted in the ACPI patch that you can save some effort there
> by a few tweaks that probably make sense here anyway.

Yeah, I'll make the changes in this patch so there is less churn in the
RQSC series.

> > +	struct device *dev = &pdev->dev;
> > +	struct cbqri_controller_info info = {};
> > +	struct device_node *cache_np;
> > +	struct resource *res;
> > +	void __iomem *base;
> > +	u32 rcid_count, cache_level, cache_id;
> > +	bool found = false;
> > +	int cpu, ret;
> > +
> > +	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> > +	if (IS_ERR(base))
> > +		return PTR_ERR(base);
> > +
> > +	ret = of_property_read_u32(dev->of_node, "riscv,cbqri-rcid", &rcid_count);
> > +	if (ret) {
> > +		dev_err(dev, "missing riscv,cbqri-rcid\n");
> It's a probe, use
> 		return dev_err_probe(dev, ret, "missing riscv,cbqri-rcid\n);
> same for all these paths.  Sure we won't defer but it does nice formatting
> and tends to save a couple of lines every time!
> 
> With the __free() magic, you can do this for all the returns in this
> function.

Sure, will do.

> > +	cache_np = of_parse_phandle(dev->of_node, "riscv,cbqri-cache", 0);
> Follow on from glancing at the acpi and then finding this elsewhere in my
> inbox.
> 	struct device_node *cache_np __free(device_node) =
> 		of_parse_phandle(dev->of_node, "riscv,cbqri-cache", 0);
> and drop all the goto iritiations.

Will do.

> > +	info.type = CBQRI_CONTROLLER_TYPE_CAPACITY;
> > +	info.base = base;
> > +	info.addr = res->start;
> > +	info.size = resource_size(res);
> > +	info.rcid_count = rcid_count;
> > +	info.cache_id = cache_id;
> > +	info.cache_level = cache_level;
> 	info = (struct cbqri_controller_info) {
> 		.type = CBQRI_CONTROLLER_TYPE_CAPACITY,
> 		.base = base,
> 		.addr = res->start,
> 		.size = resource_size,
> 	...
> 
> Might as well as you nicely set everything here.
> It's more readable and also makes it clear anything not set
> is zeroed without anyone having to go check the = { }; above.

Good idea, will do.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
