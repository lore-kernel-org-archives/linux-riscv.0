Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB41FC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 17:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GYgTlgS4mqJcpZZm0QViq1JHouA2py33isqLXZsb+aE=; b=cGw9DH7HKHa/XZ
	g+nQBU/tIL7R12lxJ94YNn7DhOt1zKSZAZAbC5gLCajbj3lCXJ4SyOtTCKrVdPfEpyUKiVmJRc6KT
	tiKpvzh17Bx7vzLmq6Bvo9IpXViqtmHPvYYZcLk7dg9tuVkaWBL4zr7ECr7ULSG4kW36cZb1wwJOr
	IT9OTobO9UURKrEoxhOqrZpnk9kOR8lvMLAArmvqY9tHKyYTTdI8AniVEZCHWz4XubeliJSDnMsOe
	048hdbiJj5uz2t5y/rW9YyleDe0aoSygqG9mrzOKSsACTj4RXYkQ/MZtHP8x+pV4A6bv83W6UFjw/
	mPWee01axBAcvux+lsyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDpkV-000xid-1m;
	Thu, 14 Dec 2023 17:43:51 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDpkQ-000xgo-2P;
	Thu, 14 Dec 2023 17:43:49 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4SrfmQ0L9Sz6K7F2;
	Fri, 15 Dec 2023 01:41:42 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 83E611400DB;
	Fri, 15 Dec 2023 01:43:39 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 14 Dec
 2023 17:43:38 +0000
Date: Thu, 14 Dec 2023 17:43:37 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
CC: <linux-pm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<x86@kernel.org>, <acpica-devel@lists.linuxfoundation.org>,
	<linux-csky@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-ia64@vger.kernel.org>, <linux-parisc@vger.kernel.org>, Salil Mehta
	<salil.mehta@huawei.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
	<jianyong.wu@arm.com>, <justin.he@arm.com>, James Morse <james.morse@arm.com>
Subject: Re: [PATCH RFC v3 07/21] ACPI: Rename acpi_processor_hotadd_init
 and remove pre-processor guards
Message-ID: <20231214174337.000042a4@Huawei.com>
In-Reply-To: <E1rDOgN-00DvkE-D8@rmk-PC.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
	<E1rDOgN-00DvkE-D8@rmk-PC.armlinux.org.uk>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_094347_070480_007E5967 
X-CRM114-Status: GOOD (  23.32  )
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

On Wed, 13 Dec 2023 12:49:47 +0000
Russell King (Oracle) <rmk+kernel@armlinux.org.uk> wrote:

> From: James Morse <james.morse@arm.com>
> 
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
> Tested-by: Miguel Luis <miguel.luis@oracle.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Tested-by: Jianyong Wu <jianyong.wu@arm.com>
> ---
> Outstanding comments:
>  https://lore.kernel.org/r/20230914151720.00007105@Huawei.com

If it's not caused a build warning yet, chances are high this is fine.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

>  https://lore.kernel.org/r/b8f430c1-c30f-191f-18c6-f750fa6ba476@redhat.com
>   For this comment, we use IS_ENABLED() in multiple places in the kernel in
>   this way, and it isn't a problem.
> ---
>  drivers/acpi/acpi_processor.c | 14 +++++---------
>  include/linux/acpi.h          |  2 --
>  2 files changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
> index c8e960ff0aca..26e3efb74614 100644
> --- a/drivers/acpi/acpi_processor.c
> +++ b/drivers/acpi/acpi_processor.c
> @@ -183,13 +183,15 @@ static void __init acpi_pcc_cpufreq_init(void) {}
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
> @@ -223,12 +225,6 @@ static int acpi_processor_hotadd_init(struct acpi_processor *pr)
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
> index 36071bc11acd..19d009ca9e7a 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -301,12 +301,10 @@ static inline int acpi_processor_evaluate_cst(acpi_handle handle, u32 cpu,
>  }
>  #endif
>  
> -#ifdef CONFIG_ACPI_HOTPLUG_PRESENT_CPU
>  /* Arch dependent functions for cpu hotplug support */
>  int acpi_map_cpu(acpi_handle handle, phys_cpuid_t physid, u32 acpi_id,
>  		 int *pcpu);
>  int acpi_unmap_cpu(int cpu);
> -#endif /* CONFIG_ACPI_HOTPLUG_PRESENT_CPU */
>  
>  #ifdef CONFIG_ACPI_HOTPLUG_IOAPIC
>  int acpi_get_ioapic_id(acpi_handle handle, u32 gsi_base, u64 *phys_addr);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
