Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1250AC2A09B
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 20:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bjq4R1STCxdBOCZg4TCWfvFkuXqt9VmBeSngZWxaST4=; b=YscFppRErNFTGu
	62io/quNFFoI8sSgnduexDKeq9dt8kq9n5IofpxaTgqXAHqCZHiXRsOzYtVL7VIcf7DFEvZ5+/PD/
	f4T6IvU24kZ79MuE4raA5/RpUDycqfHJDUsPoVn1Cg6E2RT2Is6BHq6ZDMzt+BGaDAv+SB1Nnm6TJ
	CqdtJFYdu3xbuu7fhBwC/Q7E2X6h3MfbqEYmLz+kZh/V+iT696ZJmGfuArKd45FbC3dFlxudfT7PW
	VYF0albH7RfL6mEnrE6941rW/bZ703II/oUxTf3H0Yiv5S8V2bOvEC5o+fvFOyBLdafMcIolEswcS
	BY4QG8mycjC6JV0hyypw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsREr-00000008jCa-0pCV;
	Fri, 07 Aug 2026 20:32:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsREp-00000008jCS-3uLL
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 20:32:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BD47A60DB5;
	Fri,  7 Aug 2026 20:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C37021F000E9;
	Fri,  7 Aug 2026 20:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786134738;
	bh=3uOAPVT4qIKiHepPHx+S+k3QDO+sKm4WKIfRNtKoaZ0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=jxk/6jV4NqTB0UBMFmlgnHtdnp48iifIbhgKlkCsH4hiAZ5JWjm0Bp9fNGxy/2Hft
	 c5hOavgmztTex8PDi9yBGxiXgqOiqGu5rHhmRuZnWRVHoREWMxnI0m110sh9nHE6si
	 WkKoFc4VNicCiX1I+gmcJD1hSOprtb/8EsCj3cpFxEUsTcKeyaaajVX6/NsgBqg/2a
	 HYYL7C6gY9esKgxSGwjZMdkgu5McYsdsgIyoqNPLWoO1dlI5t7hNZLAUNGWSIPkbwa
	 2KBBxi1fP1fyzNTBQg6jf8q1hitOkNdrZCjqEULpPIj9dDq6WMGt8S1aARAMR3vk7g
	 HH+9l7FX1M+Nw==
From: Thomas Gleixner <tglx@kernel.org>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>,
 linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
 tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
 will@kernel.org, robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
 anup@brainfault.org, kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v3 07/19] iommu/riscv: Add IRQ domain for interrupt
 remapping
In-Reply-To: <20260807181713.228535-8-andrew.jones@oss.qualcomm.com>
References: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
 <20260807181713.228535-8-andrew.jones@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 22:32:15 +0200
Message-ID: <875x1lekog.ffs@fw13>
MIME-Version: 1.0
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

On Fri, Aug 07 2026 at 20:17, Andrew Jones wrote:
> +static int riscv_iommu_ir_irq_domain_alloc_irqs(struct irq_domain *irqdomain,
> +						unsigned int irq_base, unsigned int nr_irqs,
> +						void *arg)
> +{
> +	struct irq_data *data;
> +	int i, ret;
> +
> +	ret = irq_domain_alloc_irqs_parent(irqdomain, irq_base, nr_irqs, arg);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < nr_irqs; i++) {

for (unsigned int i = 0; .....

nr_irqs is unsigned after all

The struct irq_data declaration want's to be inside the loop as that's
the scope where it is used.

> +		data = irq_domain_get_irq_data(irqdomain, irq_base + i);


> +		data->chip = &riscv_iommu_ir_irq_chip;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct irq_domain_ops riscv_iommu_ir_irq_domain_ops = {
> +	.alloc = riscv_iommu_ir_irq_domain_alloc_irqs,
> +	.free = irq_domain_free_irqs_parent,

https://docs.kernel.org/process/maintainer-tip.html#struct-declarations-and-initializers

> +};
> +
> +static const struct msi_parent_ops riscv_iommu_ir_msi_parent_ops = {
> +	.prefix			= "IR-",
> +	.supported_flags	= MSI_GENERIC_FLAGS_MASK |
> +				  MSI_FLAG_PCI_MSIX,
> +	.required_flags		= MSI_FLAG_USE_DEF_DOM_OPS |
> +				  MSI_FLAG_USE_DEF_CHIP_OPS |
> +				  MSI_FLAG_PCI_MSI_MASK_PARENT,
> +	.chip_flags		= MSI_CHIP_FLAG_SET_ACK,
> +	.init_dev_msi_info	= msi_parent_init_dev_msi_info,
> +};
> +
> +struct irq_domain *riscv_iommu_ir_irq_domain_create(struct device *dev,
> +						    struct riscv_iommu_info *info)

You have 100 characters, please use them.

> +{
> +	struct irq_domain *irqparent = dev_get_msi_domain(dev);
> +	struct irq_domain *irqdomain;
> +	struct fwnode_handle *fn;
> +	char *fwname __free(kfree) = NULL;

https://docs.kernel.org/process/maintainer-tip.html#variable-declarations

> +	if (!irqparent)
> +		return NULL;
> +
> +	fwname = kasprintf(GFP_KERNEL, "IOMMU-IR-%s", dev_name(dev));
> +	if (!fwname)
> +		return ERR_PTR(-ENOMEM);
> +
> +	fn = irq_domain_alloc_named_fwnode(fwname);
> +	if (!fn)
> +		return ERR_PTR(-ENOMEM);
> +
> +	irqdomain = irq_domain_create_hierarchy(irqparent, 0, 0, fn,
> +						&riscv_iommu_ir_irq_domain_ops,
> +						info);

100 chars.

> +	if (!irqdomain) {
> +		irq_domain_free_fwnode(fn);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	/*
> +	 * The RISC-V IOMMU doesn't validate MSI data, so we can't set
> +	 * IRQ_DOMAIN_FLAG_ISOLATED_MSI. This means VFIO requires
> +	 * allow_unsafe_interrupts.

what is allow_unsafe_interrupts? A variable, a function a parameter or
what?

Please write comments which do not require to grep the tree.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
