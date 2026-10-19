Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB19606A31D
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2026 16:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Sy7bg9Fz;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iJoCE9DB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=CFzyGy65JTiSGwEmxoRsg8WkZ6PQ0A0r4FR7zyuS8Jg=; b=Sy7bg9FzxCLNE3
	U4pgoNWYDo9cqwQiErPrELT4Hw5F7sC6ZiqpIF+wa5d4teRotnAXXUdokaStwuVeWSSRO6JrFmjgi
	XDLb8DLk14W+phSk6r8A13fsc7eyOPf+jWYMR92beUESJ1sKShz7iR0fIAgb/PkjM1jCwq6SkU/I2
	siesTZF2fYy6imeWd7ZnOMnQs/6hdnH9MnuZU7mjdrWl9RlxyYd3H1oOjXNM+IQffTFXkw3BrvWGY
	I2LyECnEksZE8ojFnADsoVuEDMjvlwRGgqmqi+xLK10d4uk+jiI6U5gQX9hK4TV91fY7ITXeIQwgi
	+HVGDKbCCq5/Lp95x8Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIqQB-00000007zxj-2M6M;
	Mon, 19 Oct 2026 16:41:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIqQA-00000007zxZ-22Jj
	for linux-riscv@lists.infradead.org;
	Mon, 19 Oct 2026 16:41:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C743429C6;
	Mon, 19 Oct 2026 16:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 360D71F000C4;
	Mon, 19 Oct 2026 16:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792428069;
	bh=rbdfVHO0AKwNo2sneKiVEbPJk3OuiQ8lKgq/D/YXIj4=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=iJoCE9DB2Dexn5w31cqx1Is7Akz7QHS7QDtEZIpsTaGyksewCOPOZTkDqQFoFXl+3
	 jBRd8C4q7edopIozvLloPBDNK3De5o3NttHYOvP8Eo008bFd8/DnmmMrUrm4nB41BG
	 MIvMGQ4PSLNxua+sGZCv85rrFQ1T7HEmNPZ9g/qrAyRvDH8TiGgsTMuFEvWG04rQq+
	 jk4MA9aJ9cBcS3saD9IRKX4TpRZX/gP0WD5D8ngtDXmn4E8uMaDvVWOm+MM4eIyPBy
	 ykoktRYSXdG5lGcbVm3YRyoxpty48Z9EQLQI68IEg4ZBND6XSDDirexkSRygLMrqLR
	 U1juSrQeIUKsA==
Date: Mon, 19 Oct 2026 11:41:08 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
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
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Vidya Sagar <vidyas@nvidia.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v7 1/6] PCI: spacemit-k1: Add device data support
Message-ID: <20261019164108.GA2177470@bhelgaas>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260929083755.458238-2-inochiama@gmail.com>
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Sep 29, 2026 at 04:37:47PM +0800, Inochi Amaoto wrote:
> To reuse the K1 PCIe driver logic for K3 PCIe controller, add device
> data to handle the K1 specific logic and make room for the incoming
> logic for K3.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  drivers/pci/controller/dwc/pcie-spacemit-k1.c | 30 ++++++++++++++++---
>  1 file changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> index 0564c46e2f48..ab2953ad8f56 100644
> --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> @@ -45,8 +45,17 @@
>  #define PCIE_CONTROL_LOGIC			0x0004
>  #define PCIE_SOFT_RESET			BIT(0)
>  
> +struct k1_pcie;
> +
> +struct k1_pcie_device_data {
> +	const struct dw_pcie_host_ops *host_ops;
> +	const struct dw_pcie_ops *ops;
> +	int (*parse_port)(struct k1_pcie *k1);
> +};

Does the "const" here add anything useful?  This patch suggests maybe
not:

  https://lore.kernel.org/all/20260911233541.1650895-2-james.quinlan@broadcom.com/

> +
>  struct k1_pcie {
>  	struct dw_pcie pci;
> +	const struct k1_pcie_device_data *data;
>  	struct phy *phy;
>  	void __iomem *link;
>  	struct regmap *pmu;	/* Errors ignored; MMIO-backed regmap */
> @@ -274,14 +283,21 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
>  
>  static int k1_pcie_probe(struct platform_device *pdev)
>  {
> +	const struct k1_pcie_device_data *data;
>  	struct device *dev = &pdev->dev;
>  	struct k1_pcie *k1;
>  	int ret;
>  
> +	data = device_get_match_data(dev);
> +	if (!data)
> +		return -ENODATA;
> +
>  	k1 = devm_kzalloc(dev, sizeof(*k1), GFP_KERNEL);
>  	if (!k1)
>  		return -ENOMEM;
>  
> +	k1->data = data;
> +
>  	k1->pmu = syscon_regmap_lookup_by_phandle_args(dev_of_node(dev),
>  						       SYSCON_APMU, 1,
>  						       &k1->pmu_off);
> @@ -295,11 +311,11 @@ static int k1_pcie_probe(struct platform_device *pdev)
>  				     "failed to map \"link\" registers\n");
>  
>  	k1->pci.dev = dev;
> -	k1->pci.ops = &k1_pcie_ops;
> +	k1->pci.ops = data->ops;
>  	k1->pci.pp.num_vectors = MAX_MSI_IRQS;
>  	dw_pcie_cap_set(&k1->pci, REQ_RES);
>  
> -	k1->pci.pp.ops = &k1_pcie_host_ops;
> +	k1->pci.pp.ops = data->host_ops;
>  
>  	/* Hold the PHY in reset until we start the link */
>  	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
> @@ -316,7 +332,7 @@ static int k1_pcie_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, k1);
>  
> -	ret = k1_pcie_parse_port(k1);
> +	ret = data->parse_port(k1);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to parse root port\n");
>  
> @@ -334,8 +350,14 @@ static void k1_pcie_remove(struct platform_device *pdev)
>  	dw_pcie_host_deinit(&k1->pci.pp);
>  }
>  
> +static const struct k1_pcie_device_data k1_pcie_device_data = {
> +	.host_ops	= &k1_pcie_host_ops,
> +	.ops		= &k1_pcie_ops,
> +	.parse_port	= k1_pcie_parse_port,
> +};
> +
>  static const struct of_device_id k1_pcie_of_match_table[] = {
> -	{ .compatible = "spacemit,k1-pcie", },
> +	{ .compatible = "spacemit,k1-pcie", .data = &k1_pcie_device_data },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, k1_pcie_of_match_table);
> -- 
> 2.55.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
