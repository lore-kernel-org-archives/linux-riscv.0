Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8726EEAA44
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 14:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TzxOQLaAOt8ZvW6yNgF1yOiNo36k/AubtR2VsFC5q5k=; b=tgMx/tAZCqfO/s
	r5ICzeDKSO8u5I0gGrE6xJuYEIMxgS/BIODJ4b+TGI/hyQ4qTWLT0C9dRajCBP3Tr1nZwgtajxdL6
	hx9FqhBkz+TKnUmnQjR2VUPHmcdjOgxyTpE3fMNQyDEdo0kAw+X5qvGrT3aNFE64P5tikHH73sUb+
	/KDIIBopnXmEoU9paUD6fOCKQ9Dx4P3PjgsdSNA/M1AGwakN/ED0u329YRWYQdjOBBIpy9R7xFHlA
	mjO28b9U/HoMIC0+I9il7WwbfJ3KxKTbIXF506Ix7bYWNtUGthIRCT+HDKYfi02Sa9NUQ7ziuUBE3
	Eh0PF7rurLMrgMyyn59w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgn9t-008buv-0e;
	Thu, 14 Sep 2023 14:17:29 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgn9p-008btV-1R;
	Thu, 14 Sep 2023 14:17:27 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RmfRD5nVkz6D8gq;
	Thu, 14 Sep 2023 22:12:40 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 14 Sep
 2023 15:17:21 +0100
Date: Thu, 14 Sep 2023 15:17:20 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-pm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<x86@kernel.org>, Salil Mehta <salil.mehta@huawei.com>, Russell King
	<linux@armlinux.org.uk>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
	<jianyong.wu@arm.com>, <justin.he@arm.com>
Subject: Re: [RFC PATCH v2 20/35] ACPI: Rename acpi_processor_hotadd_init
 and remove pre-processor guards
Message-ID: <20230914151720.00007105@Huawei.com>
In-Reply-To: <20230913163823.7880-21-james.morse@arm.com>
References: <20230913163823.7880-1-james.morse@arm.com>
	<20230913163823.7880-21-james.morse@arm.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_071725_770114_B631E154 
X-CRM114-Status: GOOD (  22.24  )
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

On Wed, 13 Sep 2023 16:38:08 +0000
James Morse <james.morse@arm.com> wrote:

> acpi_processor_hotadd_init() will make a CPU present by mapping it
> based on its hardware id.
> 
> 'hotadd_init' is ambiguous once there are two different behaviours
> for cpu hotplug. This is for toggling the _STA present bit. Subsequent
> patches will add support for toggling the _STA enabled bit, named
> acpi_processor_make_enabled().
> 
> Rename it acpi_processor_make_present() to make it clear this is
> for CPUs that were not previously present.
> 
> Expose the function prototypes it uses to allow the preprocessor
> guards to be removed. The IS_ENABLED() check will let the compiler
> dead-code elimination pass remove this if it isn't going to be
> used.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>  drivers/acpi/acpi_processor.c | 14 +++++---------
>  include/linux/acpi.h          |  2 --
>  2 files changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
> index 75257fae10e7..22a15a614f95 100644
> --- a/drivers/acpi/acpi_processor.c
> +++ b/drivers/acpi/acpi_processor.c
> @@ -182,13 +182,15 @@ static void __init acpi_pcc_cpufreq_init(void) {}
>  #endif /* CONFIG_X86 */
>  
>  /* Initialization */
> -#ifdef CONFIG_ACPI_HOTPLUG_PRESENT_CPU
> -static int acpi_processor_hotadd_init(struct acpi_processor *pr)
> +static int acpi_processor_make_present(struct acpi_processor *pr)
>  {
>  	unsigned long long sta;
>  	acpi_status status;
>  	int ret;
>  
> +	if (!IS_ENABLED(CONFIG_ACPI_HOTPLUG_PRESENT_CPU))
> +		return -ENODEV;
> +
>  	if (invalid_phys_cpuid(pr->phys_id))
>  		return -ENODEV;
>  
> @@ -222,12 +224,6 @@ static int acpi_processor_hotadd_init(struct acpi_processor *pr)
>  	cpu_maps_update_done();
>  	return ret;
>  }
> -#else
> -static inline int acpi_processor_hotadd_init(struct acpi_processor *pr)
> -{
> -	return -ENODEV;
> -}
> -#endif /* CONFIG_ACPI_HOTPLUG_PRESENT_CPU */
>  
>  static int acpi_processor_get_info(struct acpi_device *device)
>  {
> @@ -335,7 +331,7 @@ static int acpi_processor_get_info(struct acpi_device *device)
>  	 *  because cpuid <-> apicid mapping is persistent now.
>  	 */
>  	if (invalid_logical_cpuid(pr->id) || !cpu_present(pr->id)) {
> -		int ret = acpi_processor_hotadd_init(pr);
> +		int ret = acpi_processor_make_present(pr);
>  
>  		if (ret)
>  			return ret;
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index 651dd43976a9..b7ab85857bb7 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -316,12 +316,10 @@ static inline int acpi_processor_evaluate_cst(acpi_handle handle, u32 cpu,
>  }
>  #endif
>  
> -#ifdef CONFIG_ACPI_HOTPLUG_PRESENT_CPU
>  /* Arch dependent functions for cpu hotplug support */
>  int acpi_map_cpu(acpi_handle handle, phys_cpuid_t physid, u32 acpi_id,
>  		 int *pcpu);
>  int acpi_unmap_cpu(int cpu);

I've lost track somewhat but I think the definitions of these are still under ifdefs
which is messy if nothing else and might cause build issues.

> -#endif /* CONFIG_ACPI_HOTPLUG_PRESENT_CPU */
>  
>  #ifdef CONFIG_ACPI_HOTPLUG_IOAPIC
>  int acpi_get_ioapic_id(acpi_handle handle, u32 gsi_base, u64 *phys_addr);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
