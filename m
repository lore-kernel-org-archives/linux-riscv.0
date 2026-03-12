Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0663C105A583
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 11:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ilxAGEc3tpfEKiLr/bEuFjbUvAHN/ScDDVAafNeCPQ=; b=agAUrr8/+C0g6h
	ICNA8hPGCT+/Ca68JXLAdD6kxhwsc2kfg4EXitKMQNRcR54VD9b8xgh0JsJlR3SRVBNk/acf5+a8P
	hFzrCW4Bb8oWZQbr9WWAUD9Ra8H7XWg2rlUvJ6HxMNQPZ88apbfZirmVfm3QsBllshUvDa1qjBCOd
	WP29XlfhPgKNnc9kDGslndinmmye4lq9V7ySqmYorfB8dWTujV/Oj4ziLfU9EWSOQRmnsS3A/cXMv
	DLigpNiNUeT5bgwqodSKD4Ajssn4ypM5Si9h/CrTBWarhwAc7QRfll8FFkxWJxNbrwtJ0xVWvInH/
	mexVBGrKMyLrri8dxXoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dtU-0000000Dujy-0kR2;
	Thu, 12 Mar 2026 11:07:56 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dtQ-0000000DujW-3bOM;
	Thu, 12 Mar 2026 11:07:54 +0000
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fWlFh4gmtzHnH8v;
	Thu, 12 Mar 2026 19:07:36 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 29C2E40584;
	Thu, 12 Mar 2026 19:07:46 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 12 Mar
 2026 11:07:43 +0000
Date: Thu, 12 Mar 2026 11:07:42 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Chengwen Feng <fengchengwen@huawei.com>
Subject: Re: [PATCH v6 1/3] ACPI: Rename get_acpi_id_for_cpu() to
 acpi_get_cpu_uid() on non-x86
Message-ID: <20260312110742.00002716@huawei.com>
In-Reply-To: <20260312072316.4806-2-fengchengwen@huawei.com>
References: <20260312072316.4806-1-fengchengwen@huawei.com>
	<20260312072316.4806-2-fengchengwen@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_040753_223008_752BED5F 
X-CRM114-Status: GOOD (  35.04  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, liuyonglong@huawei.com, anshuman.khandual@arm.com, "Rafael J .
 Wysocki" <rafael@kernel.org>, Kees Cook <kees@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Eric.VanTassell@amd.com, Somnath Kotur <somnath.kotur@broadcom.com>, Sohil Mehta <sohil.mehta@intel.com>, Kai Huang <kai.huang@intel.com>, Kevin Loughlin <kevinloughlin@google.com>, punit.agrawal@oss.qualcomm.com, "H . Peter Anvin" <hpa@zytor.com>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, WANG
 Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Thorsten Blum <thorsten.blum@linux.dev>, linux-acpi@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>, masahiroy@kernel.org, Huacai Chen <chenhuacai@kernel.org>, linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Yanteng Si <si.yanteng@linux.dev>, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org, Zheyun Shen <szy0127@sjtu.edu.cn>, Len Brown <lenb@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, Thomas Huth <thuth@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, ryan.roberts@arm.com, "Ahmed S .
 Darwish" <darwi@linutronix.de>, Ma Ke <make24@iscas.ac.cn>, suzuki.poulose@arm.com, James Clark <james.clark@linaro.org>, Wei Huang <wei.huang2@amd.com>, Besar Wicaksono <bwicaksono@nvidia.com>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>, Bjorn Helgaas <bhelgaas@google.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xin Li <xin@zytor.com>, Andy Gospodarek <andrew.gospodarek@broadcom.com>, Ingo Molnar <mingo@redhat.com>, wanghuiqiang@huawei.com, Juergen Gross <jgross@suse.com>, wangyuquan1236@phytium.com.cn, Sean Christopherson <seanjc@google.com>, guohanjun@huawei.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-perf-users@vger.kernel.org, wangzhou1@hisilicon.com, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, heinrich.schuchardt@canonical.com, chenl311@chinatelecom.cn, Paul Walmsley <pjw@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 12 Mar 2026 15:23:14 +0800
Chengwen Feng <fengchengwen@huawei.com> wrote:

> To unify the CPU ACPI ID retrieval interface across architectures,
> rename the existing get_acpi_id_for_cpu() function to
> acpi_get_cpu_uid() on arm64/riscv/loongarch platforms.
> 
> This is a pure rename with no functional change, preparing for a

It's not just a rename.  This should mention that the addition of error
checks and hence the resulting signature change.

> consistent ACPI Processor UID retrieval interface across all ACPI-enabled
> platforms.
> 
> Note: Move the ARM64-specific get_cpu_for_acpi_id() implementation to
>       arch/arm64/kernel/acpi_numa.c to fix compilation errors from
>       circular header dependencies introduced by the rename.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Chengwen Feng <fengchengwen@huawei.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
From a reread, a few minor style consistency things inline.

> ---
>  arch/arm64/include/asm/acpi.h      | 16 +---------
>  arch/arm64/kernel/acpi.c           | 16 ++++++++++
>  arch/arm64/kernel/acpi_numa.c      | 15 ++++++++++
>  arch/loongarch/include/asm/acpi.h  |  5 ----
>  arch/loongarch/kernel/acpi.c       |  9 ++++++
>  arch/riscv/include/asm/acpi.h      |  4 ---
>  arch/riscv/kernel/acpi.c           | 16 ++++++++++
>  arch/riscv/kernel/acpi_numa.c      |  8 +++--
>  drivers/acpi/pptt.c                | 47 +++++++++++++++++++++---------
>  drivers/acpi/riscv/rhct.c          |  7 ++++-
>  drivers/perf/arm_cspmu/arm_cspmu.c |  6 ++--
>  include/linux/acpi.h               | 13 +++++++++
>  12 files changed, 120 insertions(+), 42 deletions(-)

> diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
> index af90128cfed5..984a11788265 100644
> --- a/arch/arm64/kernel/acpi.c
> +++ b/arch/arm64/kernel/acpi.c
> @@ -458,3 +458,19 @@ int acpi_unmap_cpu(int cpu)
>  }
>  EXPORT_SYMBOL(acpi_unmap_cpu);
>  #endif /* CONFIG_ACPI_HOTPLUG_CPU */
> +
> +int acpi_get_cpu_uid(unsigned int cpu, u32 *uid)
> +{
> +	struct acpi_madt_generic_interrupt *gicc;
> +
> +	if (cpu >= nr_cpu_ids)
> +		return -EINVAL;
> +
> +	gicc = acpi_cpu_get_madt_gicc(cpu);
> +	if (gicc == NULL)

Seems local style for null pointer checks is
	if (!gicc)
Just for consistency we should follow that.

> +		return -ENODEV;
> +
> +	*uid = gicc->uid;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(acpi_get_cpu_uid);
> diff --git a/arch/arm64/kernel/acpi_numa.c b/arch/arm64/kernel/acpi_numa.c
> index 2465f291c7e1..56e2e486e49b 100644
> --- a/arch/arm64/kernel/acpi_numa.c
> +++ b/arch/arm64/kernel/acpi_numa.c
> @@ -34,6 +34,21 @@ int __init acpi_numa_get_nid(unsigned int cpu)
>  	return acpi_early_node_map[cpu];
>  }
>  
> +int get_cpu_for_acpi_id(u32 uid)
> +{
> +	u32 cpu_uid;
> +	int cpu;
> +	int ret;
> +
> +	for (cpu = 0; cpu < nr_cpu_ids; cpu++) {

Given more recent acceptance of the following perhaps it is neater here.

	for (int cpu = 0; cpu < nr_cpu_ids; cpu++) {

Amazingly there aren't any for loops in this file so we can do what we
like from a consistency point of view.


> +		ret = acpi_get_cpu_uid(cpu, &cpu_uid);
> +		if (ret == 0 && uid == cpu_uid)
> +			return cpu;
> +	}
> +
> +	return -EINVAL;
> +}
> +
>  static int __init acpi_parse_gicc_pxm(union acpi_subtable_headers *header,
>  				      const unsigned long end)
>  {


> diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
> index 71698ee11621..bde810d02c4f 100644
> --- a/arch/riscv/kernel/acpi.c
> +++ b/arch/riscv/kernel/acpi.c
> @@ -337,3 +337,19 @@ int raw_pci_write(unsigned int domain, unsigned int bus,
>  }
>  
>  #endif	/* CONFIG_PCI */
> +
> +int acpi_get_cpu_uid(unsigned int cpu, u32 *uid)
> +{
> +	struct acpi_madt_rintc *rintc;
> +
> +	if (cpu >= nr_cpu_ids)
> +		return -EINVAL;
> +
> +	rintc = acpi_cpu_get_madt_rintc(cpu);
> +	if (rintc == NULL)

Similar to above. Local style for NULL checks is
	if (!rintc)
so this should follow that.
> +		return -ENODEV;
> +
> +	*uid = rintc->uid;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(acpi_get_cpu_uid);
> diff --git a/arch/riscv/kernel/acpi_numa.c b/arch/riscv/kernel/acpi_numa.c
> index 130769e3a99c..cd8adc9857e3 100644
> --- a/arch/riscv/kernel/acpi_numa.c
> +++ b/arch/riscv/kernel/acpi_numa.c
> @@ -37,11 +37,15 @@ static int __init acpi_numa_get_nid(unsigned int cpu)
>  
>  static inline int get_cpu_for_acpi_id(u32 uid)
>  {
> +	u32 cpu_uid;
>  	int cpu;
> +	int ret;
>  
> -	for (cpu = 0; cpu < nr_cpu_ids; cpu++)
> -		if (uid == get_acpi_id_for_cpu(cpu))
> +	for (cpu = 0; cpu < nr_cpu_ids; cpu++) {

Can pull the int into the loop her as well.

> +		ret = acpi_get_cpu_uid(cpu, &cpu_uid);
> +		if (ret == 0 && uid == cpu_uid)
>  			return cpu;
> +	}
>  
>  	return -EINVAL;
>  }
> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
> index de5f8c018333..d034a217e85b 100644
> --- a/drivers/acpi/pptt.c
> +++ b/drivers/acpi/pptt.c

>  static int check_acpi_cpu_flag(unsigned int cpu, int rev, u32 flag)
>  {
>  	struct acpi_table_header *table;
> -	u32 acpi_cpu_id = get_acpi_id_for_cpu(cpu);
> +	u32 acpi_cpu_id;
>  	struct acpi_pptt_processor *cpu_node = NULL;
>  	int ret = -ENOENT;
>  
> +	if (acpi_get_cpu_uid(cpu, &acpi_cpu_id) != 0)
> +		return -ENOENT;
> +
>  	table = acpi_get_pptt();
>  	if (!table)
>  		return -ENOENT;
> @@ -651,7 +661,8 @@ static int check_acpi_cpu_flag(unsigned int cpu, int rev, u32 flag)
>   * in the PPTT. Errors caused by lack of a PPTT table, or otherwise, return 0
>   * indicating we didn't find any cache levels.
>   *
> - * Return: -ENOENT if no PPTT table or no PPTT processor struct found.
> + * Return: -ENOENT if no PPTT table, can't get CPU's ACPI Process UID or no PPTT
> + *	   processor struct found.
>   *	   0 on success.
>   */
>  int acpi_get_cache_info(unsigned int cpu, unsigned int *levels,
> @@ -671,7 +682,8 @@ int acpi_get_cache_info(unsigned int cpu, unsigned int *levels,
>  
>  	pr_debug("Cache Setup: find cache levels for CPU=%d\n", cpu);
>  
> -	acpi_cpu_id = get_acpi_id_for_cpu(cpu);
> +	if (acpi_get_cpu_uid(cpu, &acpi_cpu_id))
> +		return -ENOENT;
I'd put a blank line here (similar to the code you added just above).
>  	cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
>  	if (!cpu_node)
>  		return -ENOENT;
> @@ -780,8 +792,9 @@ int find_acpi_cpu_topology_package(unsigned int cpu)
>   * It may not exist in single CPU systems. In simple multi-CPU systems,
>   * it may be equal to the package topology level.
>   *
> - * Return: -ENOENT if the PPTT doesn't exist, the CPU cannot be found
> - * or there is no toplogy level above the CPU..
> + * Return: -ENOENT if the PPTT doesn't exist, can't get CPU's ACPI
> + * Processor UID, the CPU cannot be found or there is no toplogy level
> + * above the CPU.
>   * Otherwise returns a value which represents the package for this CPU.
>   */
>  
> @@ -797,7 +810,8 @@ int find_acpi_cpu_topology_cluster(unsigned int cpu)
>  	if (!table)
>  		return -ENOENT;
>  
> -	acpi_cpu_id = get_acpi_id_for_cpu(cpu);
> +	if (acpi_get_cpu_uid(cpu, &acpi_cpu_id) != 0)
> +		return -ENOENT;
Again, I'd put a blank line here.

>  	cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
>  	if (!cpu_node || !cpu_node->parent)
>  		return -ENOENT;
> @@ -872,7 +886,8 @@ static void acpi_pptt_get_child_cpus(struct acpi_table_header *table_hdr,
>  	cpumask_clear(cpus);
>  
>  	for_each_possible_cpu(cpu) {
> -		acpi_id = get_acpi_id_for_cpu(cpu);
> +		if (acpi_get_cpu_uid(cpu, &acpi_id) != 0)
> +			continue;
and here.
>  		cpu_node = acpi_find_processor_node(table_hdr, acpi_id);
>  
>  		while (cpu_node) {



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
