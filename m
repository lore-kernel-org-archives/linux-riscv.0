Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F901C53219
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 12:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kLCE6+EnEWNWzfDsAEFrk0a8jtt8l06bGmbF8tMuVto=; b=2y6QysargTYSPJ
	A4MeB782xuV3y32QUlHckJaNKpwTD5rK917e2Kpbr5L536w6LVxsPGbnLE4abTzzzOw/oL+frzMKw
	dBuOby6hxd5XS5r9EVLJXPsgcf03e1VFMuvlGLyjGQ5X/BO8QPvKTDovlqCdJCyrkrcRH/YU6dunb
	K/ofbjzreGJs6CAY8K6KjsYcNAUwNf0Kp9WQJIYGohmjlL8cZe3o6ZsS9GhtlkfgMgGUU6k356s0q
	iBXPHyFUnVCzTXSU878uue/lVvBENTrawPfmjzy83yXo2YXfBmPcCLtDLjbc0Z8RwKv32axbir64V
	DA1BCRw6mkcrvlmMF6OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKG9-00000002ekH-20Je;
	Mon, 27 Jul 2026 12:16:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKG7-00000002ejw-0cza
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jul 2026 12:16:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 073C6143D;
	Mon, 27 Jul 2026 05:16:33 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D9F63F86F;
	Mon, 27 Jul 2026 05:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785154597; bh=u/HkEzRSxdAuIWmGLmZolqvndE/5M56vYFrl7/onTrA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jRPBSX8523HYzuq9mEZ4tBpDcCEIOuY8nGIZLll2N/iyTDSTON14lutYhB2kSPrXl
	 Pp+npgjIBlaeq7jkEgRFs6VLB2dVFa9ItA/rlJWG6BmZp2fjyzTz4qesaWKGQrI2c8
	 btq1HjVgpM3Y5wm0Wa+l+l314JxumS9qxwUB39jY=
Message-ID: <71fd5b46-4388-4106-aee9-b4510069975f@arm.com>
Date: Mon, 27 Jul 2026 13:16:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] driver core: platform: Setup device MSI domain just
 before driver probe
To: Anup Patel <anup.patel@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, Thomas Gleixner <tglx@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Tomasz Jeznach
 <tomasz.jeznach@linux.dev>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>
Cc: Saket Dumbre <saket.dumbre@intel.com>, Rahul Pathak
 <rahul@summations.net>, Atish Patra <atish.patra@linux.dev>,
 Anup Patel <anup@brainfault.org>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>, linux-acpi@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, driver-core@lists.linux.dev,
 iommu@lists.linux.dev, acpica-devel@lists.linux.dev,
 Sunil V L <sunilvl@oss.qualcomm.com>
References: <20260727084003.1951324-1-anup.patel@oss.qualcomm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260727084003.1951324-1-anup.patel@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_051639_279638_D63C5A72 
X-CRM114-Status: GOOD (  41.77  )
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

On 27/07/2026 9:40 am, Anup Patel wrote:
> On RISC-V, the MSI controller (aka RISC-V IMSIC) is probed as a regular
> platform device and MSI client drivers are always probed after the MSI
> controller driver using fw_devlink. Unfortunately, this is not sufficient
> to ensure device MSI domain is set for MSI client devices before driver
> probe because OF framework sets device MSI domain at the time of platform
> device creation whereas ACPI framework expects arch specific code to set
> the device MSI domain at the time of platform device creation.
> 
> Currently, to address the problem of device MSI domain being not set
> correctly, various RISC-V MSI client drivers explicitly set device
> MSI domain in the driver probe function using below code pattern:
> 
> 	/*
> 	 * The device MSI domain for platform devices on RISC-V architecture
> 	 * is only available after the MSI controller driver is probed so,
> 	 * explicitly configure here.
> 	 */
> 	if (!dev_get_msi_domain(dev)) {
> 		/*
> 		 * The device MSI domain for OF devices is only set at the
> 		 * time of populating/creating OF device. If the device MSI
> 		 * domain is discovered later after the OF device is created
> 		 * then we need to set it explicitly before using any platform
> 		 * MSI functions.
> 		 */
> 		if (is_of_node(fwnode)) {
> 			of_msi_configure(dev, dev_of_node(dev));
> 		} else if (is_acpi_device_node(fwnode)) {
> 			struct irq_domain *msi_domain;
> 			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
> 							      DOMAIN_BUS_PLATFORM_MSI);
> 			dev_set_msi_domain(dev, msi_domain);
> 		}
> 
> 		if (!dev_get_msi_domain(dev))
> 			return -EPROBE_DEFER;

I stand by my previous comment that relying on ACPI initcall order and 
assuming fw_devlink is enabled doesn't really seem robust enough to 
justify dropping proper handling of this case, especially if pretending 
it's a generic interface.

Thanks,
Robin.

> 	}
> 
> Instead of the above approach, extend the platform_dma_configure() to set
> device MSI domain for both OF and ACPI based platform devices before driver
> probe and remove the duplicate code pattern from RISC-V MSI client drivers.
> 
> Co-developed-by: Sunil V L <sunilvl@oss.qualcomm.com>
> Signed-off-by: Sunil V L <sunilvl@oss.qualcomm.com>
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> ---
> Changes since v1:
>   - Rebased on Linux-7.2-rc5
>   - Minor improvement to commit description
> ---
>   drivers/acpi/riscv/irq.c                | 13 +++++++++++
>   drivers/acpi/scan.c                     | 10 +++++++++
>   drivers/base/platform.c                 |  4 ++++
>   drivers/iommu/riscv/iommu-platform.c    |  9 --------
>   drivers/irqchip/irq-riscv-aplic-msi.c   | 27 -----------------------
>   drivers/irqchip/irq-riscv-rpmi-sysmsi.c | 29 -------------------------
>   drivers/mailbox/riscv-sbi-mpxy-mbox.c   | 29 -------------------------
>   include/acpi/acpi_bus.h                 |  1 +
>   include/linux/acpi.h                    | 10 +++++++++
>   9 files changed, 38 insertions(+), 94 deletions(-)
> 
> diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
> index 9b88d0993e88..17fa5dcdd2c0 100644
> --- a/drivers/acpi/riscv/irq.c
> +++ b/drivers/acpi/riscv/irq.c
> @@ -5,8 +5,11 @@
>    */
>   
>   #include <linux/acpi.h>
> +#include <linux/device.h>
>   #include <linux/sort.h>
>   #include <linux/irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/irqchip/riscv-imsic.h>
>   
>   #include "init.h"
>   
> @@ -397,6 +400,16 @@ static u32 riscv_acpi_add_irq_dep(acpi_handle handle)
>   	return count;
>   }
>   
> +void acpi_arch_msi_configure(struct device *dev)
> +{
> +	struct irq_domain *msi_domain;
> +
> +	msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
> +					      DOMAIN_BUS_PLATFORM_MSI);
> +	if (msi_domain)
> +		dev_set_msi_domain(dev, msi_domain);
> +}
> +
>   u32 arch_acpi_add_auto_dep(acpi_handle handle)
>   {
>   	if (acpi_has_method(handle, "_PRT"))
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index 9a7ac2eb9ce0..75c52f6bbbe8 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -1650,6 +1650,16 @@ static int acpi_iommu_configure_id(struct device *dev, const u32 *id_in)
>   
>   #endif /* !CONFIG_IOMMU_API */
>   
> +/**
> + * acpi_msi_configure - Set-up MSI domain for the device.
> + * @dev: The pointer to the device
> + */
> +void acpi_msi_configure(struct device *dev)
> +{
> +	acpi_arch_msi_configure(dev);
> +}
> +EXPORT_SYMBOL_GPL(acpi_msi_configure);
> +
>   /**
>    * acpi_dma_configure_id - Set-up DMA configuration for the device.
>    * @dev: The pointer to the device
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index fb9120b0bcfe..965ed6ae5bb5 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -1477,8 +1477,12 @@ static int platform_dma_configure(struct device *dev)
>   	int ret = 0;
>   
>   	if (is_of_node(fwnode)) {
> +		if (!dev_get_msi_domain(dev))
> +			of_msi_configure(dev, dev->of_node);
>   		ret = of_dma_configure(dev, to_of_node(fwnode), true);
>   	} else if (is_acpi_device_node(fwnode)) {
> +		if (!dev_get_msi_domain(dev))
> +			acpi_msi_configure(dev);
>   		attr = acpi_get_dma_attr(to_acpi_device_node(fwnode));
>   		ret = acpi_dma_configure(dev, attr);
>   	}
> diff --git a/drivers/iommu/riscv/iommu-platform.c b/drivers/iommu/riscv/iommu-platform.c
> index 399ba8fe1b3e..ddc6370b96b0 100644
> --- a/drivers/iommu/riscv/iommu-platform.c
> +++ b/drivers/iommu/riscv/iommu-platform.c
> @@ -48,7 +48,6 @@ static int riscv_iommu_platform_probe(struct platform_device *pdev)
>   	enum riscv_iommu_igs_settings igs;
>   	struct device *dev = &pdev->dev;
>   	struct riscv_iommu_device *iommu = NULL;
> -	struct irq_domain *msi_domain;
>   	struct resource *res = NULL;
>   	int vec, ret;
>   
> @@ -74,14 +73,6 @@ static int riscv_iommu_platform_probe(struct platform_device *pdev)
>   	switch (igs) {
>   	case RISCV_IOMMU_CAPABILITIES_IGS_BOTH:
>   	case RISCV_IOMMU_CAPABILITIES_IGS_MSI:
> -		if (is_of_node(dev_fwnode(dev))) {
> -			of_msi_configure(dev, to_of_node(dev->fwnode));
> -		} else {
> -			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
> -							      DOMAIN_BUS_PLATFORM_MSI);
> -			dev_set_msi_domain(dev, msi_domain);
> -		}
> -
>   		if (!dev_get_msi_domain(dev)) {
>   			dev_warn(dev, "failed to find an MSI domain\n");
>   			goto msi_fail;
> diff --git a/drivers/irqchip/irq-riscv-aplic-msi.c b/drivers/irqchip/irq-riscv-aplic-msi.c
> index fb8d1838609f..2cf5d42cd66a 100644
> --- a/drivers/irqchip/irq-riscv-aplic-msi.c
> +++ b/drivers/irqchip/irq-riscv-aplic-msi.c
> @@ -175,7 +175,6 @@ static const struct msi_domain_template aplic_msi_template = {
>   int aplic_msi_setup(struct device *dev, void __iomem *regs)
>   {
>   	const struct imsic_global_config *imsic_global;
> -	struct irq_domain *msi_domain;
>   	struct aplic_priv *priv;
>   	struct aplic_msicfg *mc;
>   	phys_addr_t pa;
> @@ -245,32 +244,6 @@ int aplic_msi_setup(struct device *dev, void __iomem *regs)
>   	/* Setup global config and interrupt delivery */
>   	aplic_init_hw_global(priv, true);
>   
> -	/* Set the APLIC device MSI domain if not available */
> -	if (!dev_get_msi_domain(dev)) {
> -		/*
> -		 * The device MSI domain for OF devices is only set at the
> -		 * time of populating/creating OF device. If the device MSI
> -		 * domain is discovered later after the OF device is created
> -		 * then we need to set it explicitly before using any platform
> -		 * MSI functions.
> -		 *
> -		 * In case of APLIC device, the parent MSI domain is always
> -		 * IMSIC and the IMSIC MSI domains are created later through
> -		 * the platform driver probing so we set it explicitly here.
> -		 */
> -		if (is_of_node(dev->fwnode)) {
> -			of_msi_configure(dev, to_of_node(dev->fwnode));
> -		} else {
> -			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
> -							      DOMAIN_BUS_PLATFORM_MSI);
> -			if (msi_domain)
> -				dev_set_msi_domain(dev, msi_domain);
> -		}
> -
> -		if (!dev_get_msi_domain(dev))
> -			return -EPROBE_DEFER;
> -	}
> -
>   	if (!msi_create_device_irq_domain(dev, MSI_DEFAULT_DOMAIN, &aplic_msi_template,
>   					  priv->nr_irqs + 1, priv, priv)) {
>   		dev_err(dev, "failed to create MSI irq domain\n");
> diff --git a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
> index 612f3972f7af..e6cdb4b635a6 100644
> --- a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
> +++ b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
> @@ -260,35 +260,6 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
>   			riscv_acpi_update_gsi_range(priv->gsi_base, priv->nr_irqs);
>   	}
>   
> -	/*
> -	 * The device MSI domain for platform devices on RISC-V architecture
> -	 * is only available after the MSI controller driver is probed so,
> -	 * explicitly configure here.
> -	 */
> -	if (!dev_get_msi_domain(dev)) {
> -		/*
> -		 * The device MSI domain for OF devices is only set at the
> -		 * time of populating/creating OF device. If the device MSI
> -		 * domain is discovered later after the OF device is created
> -		 * then we need to set it explicitly before using any platform
> -		 * MSI functions.
> -		 */
> -		if (is_of_node(fwnode)) {
> -			of_msi_configure(dev, dev_of_node(dev));
> -		} else if (is_acpi_device_node(fwnode)) {
> -			struct irq_domain *msi_domain;
> -
> -			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
> -							      DOMAIN_BUS_PLATFORM_MSI);
> -			dev_set_msi_domain(dev, msi_domain);
> -		}
> -
> -		if (!dev_get_msi_domain(dev)) {
> -			mbox_free_channel(priv->chan);
> -			return -EPROBE_DEFER;
> -		}
> -	}
> -
>   	if (!msi_create_device_irq_domain(dev, MSI_DEFAULT_DOMAIN,
>   					  &rpmi_sysmsi_template,
>   					  priv->nr_irqs, priv, priv)) {
> diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
> index 7c9c006b7244..759512aba19f 100644
> --- a/drivers/mailbox/riscv-sbi-mpxy-mbox.c
> +++ b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
> @@ -902,35 +902,6 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
>   
>   	/* Setup MSIs for mailbox (if required) */
>   	if (mbox->msi_count) {
> -		/*
> -		 * The device MSI domain for platform devices on RISC-V architecture
> -		 * is only available after the MSI controller driver is probed so,
> -		 * explicitly configure here.
> -		 */
> -		if (!dev_get_msi_domain(dev)) {
> -			struct fwnode_handle *fwnode = dev_fwnode(dev);
> -
> -			/*
> -			 * The device MSI domain for OF devices is only set at the
> -			 * time of populating/creating OF device. If the device MSI
> -			 * domain is discovered later after the OF device is created
> -			 * then we need to set it explicitly before using any platform
> -			 * MSI functions.
> -			 */
> -			if (is_of_node(fwnode)) {
> -				of_msi_configure(dev, dev_of_node(dev));
> -			} else if (is_acpi_device_node(fwnode)) {
> -				struct irq_domain *msi_domain;
> -
> -				msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
> -								      DOMAIN_BUS_PLATFORM_MSI);
> -				dev_set_msi_domain(dev, msi_domain);
> -			}
> -
> -			if (!dev_get_msi_domain(dev))
> -				return -EPROBE_DEFER;
> -		}
> -
>   		mbox->msi_index_to_channel = devm_kcalloc(dev, mbox->msi_count,
>   							  sizeof(*mbox->msi_index_to_channel),
>   							  GFP_KERNEL);
> diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
> index 714d111d8053..d971d6bc14d7 100644
> --- a/include/acpi/acpi_bus.h
> +++ b/include/acpi/acpi_bus.h
> @@ -750,6 +750,7 @@ bool acpi_dma_supported(const struct acpi_device *adev);
>   enum dev_dma_attr acpi_get_dma_attr(struct acpi_device *adev);
>   int acpi_iommu_fwspec_init(struct device *dev, u32 id,
>   			   struct fwnode_handle *fwnode);
> +void acpi_msi_configure(struct device *dev);
>   int acpi_dma_get_range(struct device *dev, const struct bus_dma_region **map);
>   int acpi_dma_configure_id(struct device *dev, enum dev_dma_attr attr,
>   			   const u32 *input_id);
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index 60ab50cb8930..5e2e377c48b4 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -260,6 +260,12 @@ acpi_numa_processor_affinity_init(struct acpi_srat_cpu_affinity *pa) { }
>   
>   void acpi_numa_x2apic_affinity_init(struct acpi_srat_x2apic_cpu_affinity *pa);
>   
> +#if defined(CONFIG_RISCV)
> +void acpi_arch_msi_configure(struct device *dev);
> +#else
> +static inline void acpi_arch_msi_configure(struct device *dev) { }
> +#endif
> +
>   #if defined(CONFIG_ARM64) || defined(CONFIG_LOONGARCH)
>   void acpi_arch_dma_setup(struct device *dev);
>   #else
> @@ -1060,6 +1066,10 @@ static inline int acpi_dma_get_range(struct device *dev, const struct bus_dma_re
>   	return -ENODEV;
>   }
>   
> +static inline void acpi_msi_configure(struct device *dev)
> +{
> +}
> +
>   static inline int acpi_dma_configure(struct device *dev,
>   				     enum dev_dma_attr attr)
>   {


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
