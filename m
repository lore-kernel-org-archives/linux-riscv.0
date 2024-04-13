Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71658C4345F
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Apr 2024 10:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0BcPsUmMog8qibYdE1dm9lwSz/tkRJoNa0k4nwOb2U0=; b=zWfhRvulEk+Um9
	rHUwplKiqKeaH6nVUTHh7k6mGJoTnbhSr6S7PMM/RUxa6jnBeWSxrnlFzoufuIDwuawgnD2GKFZOd
	ZN8Ncl3Z9ZTOlXYIGbWmr7+0B+iyqZVOm8DlOZAhLEgY7Al1DFwnYGcB+QQgPoSxyTUkgu54Pneuy
	3Vcxc8AcS63yzv6zoEohPeI2ALUlE6lD4y8n0Rn8GUIZ0shFiszWweLo/YvkE926kdbtyFDuz9qng
	COMKJoa9yAiCLROP+1KGRg3zxqh1sa6h+fZrOrjcs5OeOAX1c5nfe9fEmLmaE1TWXY90+bAMn9oZS
	Z5U09Cjbgl9CT5DMGmYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvaPr-00000002vYr-3Fb2;
	Sat, 13 Apr 2024 10:15:24 +0000
Received: from rockwork.org ([45.32.92.205])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvaPo-00000002vYG-3LDG
	for linux-riscv@lists.infradead.org;
	Sat, 13 Apr 2024 10:15:22 +0000
Received: from [IPV6:2408:8340:c42:16f0:eb78:1cb0:d0a9:e8e3] (unknown [IPv6:2408:8340:c42:16f0:eb78:1cb0:d0a9:e8e3])
	by rockwork.org (Postfix) with ESMTPSA id 6537B5DD4A;
	Sat, 13 Apr 2024 10:15:11 +0000 (UTC)
Message-ID: <2688421d-37c2-4038-8d03-24ae175f137e@rockwork.org>
Date: Sat, 13 Apr 2024 18:15:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] RISC-V: drivers/iommu: Add RISC-V IOMMU - Ziommu
 support.
To: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux@rivosinc.com, linux-kernel@vger.kernel.org,
 Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev,
 Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>,
 linux-riscv@lists.infradead.org
References: <cover.1689792825.git.tjeznach@rivosinc.com>
 <c33c24036c06c023947ecb47177da273569b3ac7.1689792825.git.tjeznach@rivosinc.com>
Content-Language: en-US
From: Xingyou Chen <rockrush@rockwork.org>
In-Reply-To: <c33c24036c06c023947ecb47177da273569b3ac7.1689792825.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240413_031520_903436_42DA88DB 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 7/20/23 03:33, Tomasz Jeznach wrote:
> ... > +#endif /* _RISCV_IOMMU_BITS_H_ */
> diff --git a/drivers/iommu/riscv/iommu-pci.c b/drivers/iommu/riscv/iommu-pci.c
> new file mode 100644
> index 000000000000..c91f963d7a29
> --- /dev/null
> +++ b/drivers/iommu/riscv/iommu-pci.c
> @@ -0,0 +1,134 @@
> ...
> +
> +static struct pci_driver riscv_iommu_pci_driver = {
> +	.name = KBUILD_MODNAME,
> +	.id_table = riscv_iommu_pci_tbl,
> +	.probe = riscv_iommu_pci_probe,
> +	.remove = riscv_iommu_pci_remove,
> +	.driver = {
> +		   .pm = pm_sleep_ptr(&riscv_iommu_pm_ops),
> +		   .of_match_table = riscv_iommu_of_match,
> +		   },
> +};
> +
> +module_driver(riscv_iommu_pci_driver, pci_register_driver, pci_unregister_driver);

There's helper macro to be considered, and not forced to:
   module_pci_driver(riscv_iommu_pci_driver);

> diff --git a/drivers/iommu/riscv/iommu-platform.c b/drivers/iommu/riscv/iommu-platform.c
> new file mode 100644
> index 000000000000..e4e8ca6711e7
> --- /dev/null
> +++ b/drivers/iommu/riscv/iommu-platform.c
> @@ -0,0 +1,94 @@
> ...
> +
> +static struct platform_driver riscv_iommu_platform_driver = {
> +	.driver = {
> +		   .name = "riscv,iommu",
> +		   .of_match_table = riscv_iommu_of_match,
> +		   .suppress_bind_attrs = true,
> +		   },
> +	.probe = riscv_iommu_platform_probe,
> +	.remove_new = riscv_iommu_platform_remove,
> +	.shutdown = riscv_iommu_platform_shutdown,
> +};
> +
> +module_driver(riscv_iommu_platform_driver, platform_driver_register,
> +	      platform_driver_unregister);

And also:
   module_platform_driver(riscv_iommu_platform_driver);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
