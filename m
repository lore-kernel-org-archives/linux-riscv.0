Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9E2EEAA47
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 14:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qUoXSH0UTquCMdrkPar4mrEASv0kO1P6LGA/iBjmZ/s=; b=2ZaYMaq20XPEWe
	sYhVnpszS0+DRBtt+CjXZtLh85cNEigYNi45Q9SB5lJ4/cyM1JfP6R2R6/g7SDcN5D5KjtVdLElhI
	rD8QnjH18i5K8vAHpdPCZyMxVTRkdCEpBPi9bk7uJPEKDNghUtaM0TTkj2SCh5KJ7SiophEAh/WOu
	OsTsF8t3JvcuKAc+4L505CwCL+U1S5Gxs8ujSnNRfdKNmKutuUuuHMlH2tZl3PUq91lIrrnUlBAXC
	nztYWv90SIMMI1CM8QuZNqxQuxyRWTfppN6y4q+rBSYeggBKRrsi8VaU3aFOap1MZoUuUVGSMrN7e
	iO1zgOsxLozmbZPa3WUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnNK-008dq8-0H;
	Thu, 14 Sep 2023 14:31:22 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnNG-008dop-1N;
	Thu, 14 Sep 2023 14:31:20 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Rmfqw1fxwz6FGNN;
	Thu, 14 Sep 2023 22:30:36 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 14 Sep
 2023 15:31:11 +0100
Date: Thu, 14 Sep 2023 15:31:10 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-pm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<x86@kernel.org>, Salil Mehta <salil.mehta@huawei.com>, Russell King
	<linux@armlinux.org.uk>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
	<jianyong.wu@arm.com>, <justin.he@arm.com>
Subject: Re: [RFC PATCH v2 22/35] ACPI: Check _STA present bit before making
 CPUs not present
Message-ID: <20230914153110.00003e38@Huawei.com>
In-Reply-To: <20230913163823.7880-23-james.morse@arm.com>
References: <20230913163823.7880-1-james.morse@arm.com>
	<20230913163823.7880-23-james.morse@arm.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_073118_748999_A20E8906 
X-CRM114-Status: GOOD (  27.91  )
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

On Wed, 13 Sep 2023 16:38:10 +0000
James Morse <james.morse@arm.com> wrote:

> When called acpi_processor_post_eject() unconditionally make a CPU
> not-present and unregisters it.
> 
> To add support for AML events where the CPU has become disabled, but
> remains present, the _STA method should be checked before calling
> acpi_processor_remove().
> 
> Rename acpi_processor_post_eject() acpi_processor_remove_possible(), and
> check the _STA before calling.
> 
> Adding the function prototype for arch_unregister_cpu() allows the
> preprocessor guards to be removed.
> 
> After this change CPUs will remain registered and visible to
> user-space as offline if buggy firmware triggers an eject-request,
> but doesn't clear the corresponding _STA bits after _EJ0 has been
> called.
Will be fun to see how many such buggy firmwares are out there.

> 
> Signed-off-by: James Morse <james.morse@arm.com>

Comment inline but not directly related to this patch so with or
without that change
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/acpi/acpi_processor.c | 31 +++++++++++++++++++++++++------
>  include/linux/cpu.h           |  1 +
>  2 files changed, 26 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
> index 00dcc23d49a8..2cafea1edc24 100644
> --- a/drivers/acpi/acpi_processor.c
> +++ b/drivers/acpi/acpi_processor.c
> @@ -457,13 +457,12 @@ static int acpi_processor_add(struct acpi_device *device,
>  	return result;
>  }
>  
> -#ifdef CONFIG_ACPI_HOTPLUG_PRESENT_CPU
>  /* Removal */
> -static void acpi_processor_post_eject(struct acpi_device *device)
> +static void acpi_processor_make_not_present(struct acpi_device *device)
>  {
>  	struct acpi_processor *pr;
>  
> -	if (!device || !acpi_driver_data(device))
> +	if (!IS_ENABLED(CONFIG_ACPI_HOTPLUG_PRESENT_CPU))

Would it be possible to do all the ifdef to IS_ENABLED changes in a separate
patch?  I haven't figure out if any of them have dependencies on the other
changes, but they do create a bunch of noise I'd rather not see in the more
complex corners of this.

>  		return;
>  
>  	pr = acpi_driver_data(device);
> @@ -501,7 +500,29 @@ static void acpi_processor_post_eject(struct acpi_device *device)
>  	free_cpumask_var(pr->throttling.shared_cpu_map);
>  	kfree(pr);
>  }
> -#endif /* CONFIG_ACPI_HOTPLUG_PRESENT_CPU */
> +
> +static void acpi_processor_post_eject(struct acpi_device *device)
> +{
> +	struct acpi_processor *pr;
> +	unsigned long long sta;
> +	acpi_status status;
> +
> +	if (!device)
> +		return;
> +
> +	pr = acpi_driver_data(device);
> +	if (!pr || pr->id >= nr_cpu_ids || invalid_phys_cpuid(pr->phys_id))
> +		return;
> +
> +	status = acpi_evaluate_integer(pr->handle, "_STA", NULL, &sta);
> +	if (ACPI_FAILURE(status))
> +		return;
> +
> +	if (cpu_present(pr->id) && !(sta & ACPI_STA_DEVICE_PRESENT)) {
> +		acpi_processor_make_not_present(device);
> +		return;
> +	}
> +}
>  
>  #ifdef CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC
>  bool __init processor_physically_present(acpi_handle handle)
> @@ -626,9 +647,7 @@ static const struct acpi_device_id processor_device_ids[] = {
>  static struct acpi_scan_handler processor_handler = {
>  	.ids = processor_device_ids,
>  	.attach = acpi_processor_add,
> -#ifdef CONFIG_ACPI_HOTPLUG_PRESENT_CPU
>  	.post_eject = acpi_processor_post_eject,
> -#endif
>  	.hotplug = {
>  		.enabled = true,
>  	},
> diff --git a/include/linux/cpu.h b/include/linux/cpu.h
> index a71691d7c2ca..e117c06e0c6b 100644
> --- a/include/linux/cpu.h
> +++ b/include/linux/cpu.h
> @@ -81,6 +81,7 @@ struct device *cpu_device_create(struct device *parent, void *drvdata,
>  				 const struct attribute_group **groups,
>  				 const char *fmt, ...);
>  extern int arch_register_cpu(int cpu);
> +extern void arch_unregister_cpu(int cpu);
>  #ifdef CONFIG_HOTPLUG_CPU
>  extern void unregister_cpu(struct cpu *cpu);
>  extern ssize_t arch_cpu_probe(const char *, size_t);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
