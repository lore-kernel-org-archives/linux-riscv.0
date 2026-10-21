Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80711606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 07:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MozxxMHp;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R7E1fYqW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BKehDCjtAd6ENV3EgeKbzAAiOOM7BmzhzozLtlgmq5g=; b=MozxxMHpyPxS63
	8TD7wslExVOZ9ZTAQtNYVBIWT3NwH+dnvHxLj67nSonZQqJh68XMRliJZyBzTqbsyMXKgH1alw8GA
	ICAJkVl+gYfYwPFiVVT3RR48VQO3dW+pqdzcgX6/I3HAYSta8bupVquoxYjbvCCjBB0QkvQm/QCwe
	+wNN/2aRJDiwAk0FeS7BkJonDcLfJqbkGf9d1ESzBr7KKdtLkohUCTSSLmF1bfN1gqQhl+DRZPiv/
	AYQxOWhMukG7DlH2oufprRj66AB0BiVL6Ksk1zWTb0NJz+ed2icLOqy5wgtw60O+fZmrQPY/XJIyS
	EJ31ge07CR4FQIqghxKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJR7F-0000000BH78-05qG;
	Wed, 21 Oct 2026 07:52:05 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJR7C-0000000BH6n-3YqF
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 07:52:04 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8a070755c8cso199583b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2026 00:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792569122; x=1793173922; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wqrxv5Q2RTtnjt7+05qzteet1T1PNZiaTDIMGMTA4x4=;
        b=R7E1fYqWHIJSYZY2J7kSjQHc/j633X0iwC2x+yvBlxk7G0/rEA2iJX/0B9FM1GYd1p
         jzXtjxmqhpbi0T6EYmcx67JmV6ZdNGrWfKyYuy1P4cfyigpwj5HVnaPVfBBYFLWIgoSR
         VeZc6Sckd/dnImhNo3DaRZSV4NpiAnUAiJ0HsQfSI8+nPo8mAEZhShe3H7lfwB87KUc4
         0uJ7pOB+h8lVRGeiuIYOqOhEsg5SY5X/smfPnsPlyPvoLER9NjKcbwG1UQEkDmbBFK20
         Jc+XPfEeNtvC9biigL8x3ZSlMJjZw+SjbU2F7SQfYBvtVz3xK1JUVu8d9hs3lWRk2MuC
         YsQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569122; x=1793173922;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wqrxv5Q2RTtnjt7+05qzteet1T1PNZiaTDIMGMTA4x4=;
        b=V9G4SEETnN89A/XIi0Rl2xfirFL2K5ZnHYCNTgFueEAcgzsyZEa6ckB70AnahSo16H
         KVz3u36q1FH512A4ZxRL1VysTdzP4MT15DSSMfMfW3XGv0z7oAFYQPhkVqYAdDtZ4Do5
         wsN8uHprcgp8o/BUIlQJwM0+2s2M7MaekEwAbPYMXlprQHNqq4bDpjepj7eg7/dyCd4z
         Jqu0APta12Yy6TrcuRV19uw/SISXkVPvtzhXOXCp1lMfSNrgL6NZpE3NZM4tYgmyuTAk
         pKqmSZQFRv4yF2xtSwE/smHam6CH2YhyARCJJjXhMv5cRoGt0zyALoL6S0kKZy907TRA
         /wAA==
X-Forwarded-Encrypted: i=1; AKwUvByxafqtmyMpf58eeV3YVETHHz5NLt/HGfeq1sGjMeInvXCDoedAwjLKklXDPcYn6wMiHmncOxXDX+f2vA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLriYodzsKUgE3fhd4SpeHcQBNyQ4aABdwZQkkqSs2T6I2k33bZ
	5xAbmwxDbkb7euQDh7fEdZxVN+FaNWcAM7rjmI91ycqYkbNZ2UBfeHFy
X-Gm-Gg: AYBFou2f7JmC0ah1GTfsm8TXTA1sFipsA7whpNHXac5jO4CejGbcAwB9ggm2yVtY2Tj
	ecF62Eo5ttvYijxZtYDdAbYpNUP/NcBfj6W4tu6T06VbsL5BskN7aRm/WVqe4Z/WEgz4U/jraev
	U9eH8YYjQo7A8EOmf3G6+uE6IlvehWyfvEYaQVV7OLUkn9y7CRj+yKZIi+OepT1YlUtfADpvdEa
	QHqY544Be22iI96IRXotls/lBMEw/Rs7W3h5HT9Vf7Jmb5Ws92slINMYJr4Nm2bMh0wp1DoQlht
	DXV+LKZHW+3WYBphEUOSD4VHXyk69B7Emr1r0b7Q/mPTiIOCfa8kmzQq6FSsfukS2TqWXCchFmt
	KYedFiuiCdJDoptJa5VqgoJ/obv8HqIjmlR5RdteyyutceKS/CLKk/ozc9zc9Iyx0qZl88oaMJg
	DTbzT26vzYMbsPEUpHrDifoUpCgBUlwpoWhLMflEu6qMzIuR0xl1MF+Q0wtOlbWTht0OeeqdDCD
	8ZlMi82ulYK+8PMNfIvj5GY8Ol/TDRFa8pKe1t0sU78Obg4erjhMA==
X-Received: by 2002:a05:6a00:a90b:b0:89e:a122:fa28 with SMTP id d2e1a72fcca58-8a089e1f48dmr1074589b3a.12.1792569121569;
        Wed, 21 Oct 2026 00:52:01 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895fb005sm548529b3a.49.2026.10.21.00.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:52:01 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:51:20 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Frank Li <Frank.Li@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
	Niklas Cassel <cassel@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Randolph Lin <randolph@andestech.com>, Xincheng Zhang <zhangxincheng@ultrarisc.com>, 
	Alex Elder <elder@riscstar.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Vidya Sagar <vidyas@nvidia.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v7 1/6] PCI: spacemit-k1: Add device data support
Message-ID: <athuYJjPMkrecGm3@inochi.infowork>
References: <20260929083755.458238-2-inochiama@gmail.com>
 <20261019164108.GA2177470@bhelgaas>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261019164108.GA2177470@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_005202_896206_4744D918 
X-CRM114-Status: GOOD (  25.73  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 11:41:08AM -0500, Bjorn Helgaas wrote:
> On Tue, Sep 29, 2026 at 04:37:47PM +0800, Inochi Amaoto wrote:
> > To reuse the K1 PCIe driver logic for K3 PCIe controller, add device
> > data to handle the K1 specific logic and make room for the incoming
> > logic for K3.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/pci/controller/dwc/pcie-spacemit-k1.c | 30 ++++++++++++++++---
> >  1 file changed, 26 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > index 0564c46e2f48..ab2953ad8f56 100644
> > --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > @@ -45,8 +45,17 @@
> >  #define PCIE_CONTROL_LOGIC			0x0004
> >  #define PCIE_SOFT_RESET			BIT(0)
> >  
> > +struct k1_pcie;
> > +
> > +struct k1_pcie_device_data {
> > +	const struct dw_pcie_host_ops *host_ops;
> > +	const struct dw_pcie_ops *ops;
> > +	int (*parse_port)(struct k1_pcie *k1);
> > +};
> 
> Does the "const" here add anything useful?  This patch suggests maybe
> not:
> 
>   https://lore.kernel.org/all/20260911233541.1650895-2-james.quinlan@broadcom.com/
> 

I am not sure whether the compiler can make use it.
And I have not seen any explaination for why no reason
for that. It is good to have a clarification.

Regards,
Inochi


> > +
> >  struct k1_pcie {
> >  	struct dw_pcie pci;
> > +	const struct k1_pcie_device_data *data;
> >  	struct phy *phy;
> >  	void __iomem *link;
> >  	struct regmap *pmu;	/* Errors ignored; MMIO-backed regmap */
> > @@ -274,14 +283,21 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
> >  
> >  static int k1_pcie_probe(struct platform_device *pdev)
> >  {
> > +	const struct k1_pcie_device_data *data;
> >  	struct device *dev = &pdev->dev;
> >  	struct k1_pcie *k1;
> >  	int ret;
> >  
> > +	data = device_get_match_data(dev);
> > +	if (!data)
> > +		return -ENODATA;
> > +
> >  	k1 = devm_kzalloc(dev, sizeof(*k1), GFP_KERNEL);
> >  	if (!k1)
> >  		return -ENOMEM;
> >  
> > +	k1->data = data;
> > +
> >  	k1->pmu = syscon_regmap_lookup_by_phandle_args(dev_of_node(dev),
> >  						       SYSCON_APMU, 1,
> >  						       &k1->pmu_off);
> > @@ -295,11 +311,11 @@ static int k1_pcie_probe(struct platform_device *pdev)
> >  				     "failed to map \"link\" registers\n");
> >  
> >  	k1->pci.dev = dev;
> > -	k1->pci.ops = &k1_pcie_ops;
> > +	k1->pci.ops = data->ops;
> >  	k1->pci.pp.num_vectors = MAX_MSI_IRQS;
> >  	dw_pcie_cap_set(&k1->pci, REQ_RES);
> >  
> > -	k1->pci.pp.ops = &k1_pcie_host_ops;
> > +	k1->pci.pp.ops = data->host_ops;
> >  
> >  	/* Hold the PHY in reset until we start the link */
> >  	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
> > @@ -316,7 +332,7 @@ static int k1_pcie_probe(struct platform_device *pdev)
> >  
> >  	platform_set_drvdata(pdev, k1);
> >  
> > -	ret = k1_pcie_parse_port(k1);
> > +	ret = data->parse_port(k1);
> >  	if (ret)
> >  		return dev_err_probe(dev, ret, "failed to parse root port\n");
> >  
> > @@ -334,8 +350,14 @@ static void k1_pcie_remove(struct platform_device *pdev)
> >  	dw_pcie_host_deinit(&k1->pci.pp);
> >  }
> >  
> > +static const struct k1_pcie_device_data k1_pcie_device_data = {
> > +	.host_ops	= &k1_pcie_host_ops,
> > +	.ops		= &k1_pcie_ops,
> > +	.parse_port	= k1_pcie_parse_port,
> > +};
> > +
> >  static const struct of_device_id k1_pcie_of_match_table[] = {
> > -	{ .compatible = "spacemit,k1-pcie", },
> > +	{ .compatible = "spacemit,k1-pcie", .data = &k1_pcie_device_data },
> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(of, k1_pcie_of_match_table);
> > -- 
> > 2.55.0
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
