Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90187EEAA54
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 14:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+/2lEhydh0NIvBa294vLhTggPkxCva0g4VZePZuVGlE=; b=fUspbV0RjzbTW0
	tJyqh+MEggv8t3Kza2Mc5xCFLmHS+7RLvvwRsgh/d78l7Ncl7pzIV+QBUN1Ph5Ni8ywye3gptC7EC
	t26/FsSeIaDxorkWwx83jBiAQmEQ7ucSMPD55/9aNmwXneCVL/f2JxAQi+lVhm3yR4065e5q6RANu
	waCojQSGBxh4aFhuYoPWiV4pIuQPRAFdwppC0AbwWNK4ZL9wbjc0UJJxffFBMTweE1PZ1DeVGDXxB
	sB0Wu5P1NA6S4CmMmVW23v99IsdIr19844CCuQ3r/Tr/y1oDCwYM00F73W3PYGmp2H+TtuIYSoSq7
	ucw6DEb/wc/qUFWSqHNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnnx-008iD4-0h;
	Thu, 14 Sep 2023 14:58:53 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnnt-008iAm-10;
	Thu, 14 Sep 2023 14:58:51 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RmgLx17dvz6D8yp;
	Thu, 14 Sep 2023 22:54:01 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 14 Sep
 2023 15:58:41 +0100
Date: Thu, 14 Sep 2023 15:58:40 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-pm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<x86@kernel.org>, Salil Mehta <salil.mehta@huawei.com>, Russell King
	<linux@armlinux.org.uk>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
	<jianyong.wu@arm.com>, <justin.he@arm.com>
Subject: Re: [RFC PATCH v2 28/35] arm64, irqchip/gic-v3, ACPI: Move MADT
 GICC enabled check into a helper
Message-ID: <20230914155840.0000393b@Huawei.com>
In-Reply-To: <20230913163823.7880-29-james.morse@arm.com>
References: <20230913163823.7880-1-james.morse@arm.com>
	<20230913163823.7880-29-james.morse@arm.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_075849_638995_732DFF5F 
X-CRM114-Status: GOOD (  21.33  )
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

On Wed, 13 Sep 2023 16:38:16 +0000
James Morse <james.morse@arm.com> wrote:

> ACPI, irqchip and the architecture code all inspect the MADT
> enabled bit for a GICC entry in the MADT.
> 
> The addition of an 'online capable' bit means all these sites need
> updating.
> 
> Move the current checks behind a helper to make future updates easier.
> 
> Signed-off-by: James Morse <james.morse@arm.com>

Looks good to me and seems fine to add as part of a precursor mini
series to the main one.  (fix Russell's observation of course!)

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  arch/arm64/kernel/smp.c       |  2 +-
>  drivers/acpi/processor_core.c |  2 +-
>  drivers/irqchip/irq-gic-v3.c  | 10 ++++------
>  include/linux/acpi.h          |  5 +++++
>  4 files changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 960b98b43506..8c8f55721786 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -520,7 +520,7 @@ acpi_map_gic_cpu_interface(struct acpi_madt_generic_interrupt *processor)
>  {
>  	u64 hwid = processor->arm_mpidr;
>  
> -	if (!(processor->flags & ACPI_MADT_ENABLED)) {
> +	if (!acpi_gicc_is_usable(processor)) {
>  		pr_debug("skipping disabled CPU entry with 0x%llx MPIDR\n", hwid);
>  		return;
>  	}
> diff --git a/drivers/acpi/processor_core.c b/drivers/acpi/processor_core.c
> index 7dd6dbaa98c3..b203cfe28550 100644
> --- a/drivers/acpi/processor_core.c
> +++ b/drivers/acpi/processor_core.c
> @@ -90,7 +90,7 @@ static int map_gicc_mpidr(struct acpi_subtable_header *entry,
>  	struct acpi_madt_generic_interrupt *gicc =
>  	    container_of(entry, struct acpi_madt_generic_interrupt, header);
>  
> -	if (!(gicc->flags & ACPI_MADT_ENABLED))
> +	if (!acpi_gicc_is_usable(gicc))
>  		return -ENODEV;
>  
>  	/* device_declaration means Device object in DSDT, in the
> diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> index eedfa8e9f077..72d3cdebdad1 100644
> --- a/drivers/irqchip/irq-gic-v3.c
> +++ b/drivers/irqchip/irq-gic-v3.c
> @@ -2367,8 +2367,7 @@ gic_acpi_parse_madt_gicc(union acpi_subtable_headers *header,
>  	u32 size = reg == GIC_PIDR2_ARCH_GICv4 ? SZ_64K * 4 : SZ_64K * 2;
>  	void __iomem *redist_base;
>  
> -	/* GICC entry which has !ACPI_MADT_ENABLED is not unusable so skip */
> -	if (!(gicc->flags & ACPI_MADT_ENABLED))
> +	if (!acpi_gicc_is_usable(gicc))
>  		return 0;
>  
>  	redist_base = ioremap(gicc->gicr_base_address, size);
> @@ -2418,7 +2417,7 @@ static int __init gic_acpi_match_gicc(union acpi_subtable_headers *header,
>  	 * If GICC is enabled and has valid gicr base address, then it means
>  	 * GICR base is presented via GICC
>  	 */
> -	if ((gicc->flags & ACPI_MADT_ENABLED) && gicc->gicr_base_address) {
> +	if (acpi_gicc_is_usable(gicc) && gicc->gicr_base_address) {
>  		acpi_data.enabled_rdists++;
>  		return 0;
>  	}
> @@ -2427,7 +2426,7 @@ static int __init gic_acpi_match_gicc(union acpi_subtable_headers *header,
>  	 * It's perfectly valid firmware can pass disabled GICC entry, driver
>  	 * should not treat as errors, skip the entry instead of probe fail.
>  	 */
> -	if (!(gicc->flags & ACPI_MADT_ENABLED))
> +	if (!acpi_gicc_is_usable(gicc))
>  		return 0;
>  
>  	return -ENODEV;
> @@ -2486,8 +2485,7 @@ static int __init gic_acpi_parse_virt_madt_gicc(union acpi_subtable_headers *hea
>  	int maint_irq_mode;
>  	static int first_madt = true;
>  
> -	/* Skip unusable CPUs */
> -	if (!(gicc->flags & ACPI_MADT_ENABLED))
> +	if (!acpi_gicc_is_usable(gicc))
>  		return 0;
>  
>  	maint_irq_mode = (gicc->flags & ACPI_MADT_VGIC_IRQ_MODE) ?
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index b7ab85857bb7..e3265a9eafae 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -256,6 +256,11 @@ acpi_table_parse_cedt(enum acpi_cedt_type id,
>  int acpi_parse_mcfg (struct acpi_table_header *header);
>  void acpi_table_print_madt_entry (struct acpi_subtable_header *madt);
>  
> +static inline bool acpi_gicc_is_usable(struct acpi_madt_generic_interrupt *gicc)
> +{
> +	return (gicc->flags & ACPI_MADT_ENABLED);
> +}
> +
>  /* the following numa functions are architecture-dependent */
>  void acpi_numa_slit_init (struct acpi_table_slit *slit);
>  


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
