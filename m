Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86193C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 17:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1vM+kYLPN49NNnzgN6Ayent82up7KbkbGiprVEWMxP4=; b=rJkp1PL3bJfDdl
	77Fq1BvSYbzolIdV+EkTZXcUHbQzW1AEgUkHbN1i6B0cW552RQVJKgGT82WKOsWLDNBdJkKLttYK5
	KeMx9AJEKwqChrYS72TVYHaoOilz2t5LDNtrYpb71qTYQpl75nozfAfUPiD/yf0TV+BVTZy8q8CKX
	39BmbFzn2k6TvZHiY7h5qHOLzX5SRdaTh1txpwBEs/ZToFzOy5IF5cCzPSRbgiBARMygp91KhvzB4
	0BHNGkXbAglwtQ5R0AxRebSqP5snDOHLqRn4C3ojs8T4NFrWLc3I60vnwouNK9Uz0o+zW9YVnOR31
	NjZLGoxn3NkuxYQWnMUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEBpl-0042rw-18;
	Fri, 15 Dec 2023 17:18:45 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEBpg-0042qG-2A;
	Fri, 15 Dec 2023 17:18:43 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4SsG9z4ZPHz6J9Zx;
	Sat, 16 Dec 2023 01:17:27 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 71F951400DB;
	Sat, 16 Dec 2023 01:18:33 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 15 Dec
 2023 17:18:32 +0000
Date: Fri, 15 Dec 2023 17:18:31 +0000
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
Subject: Re: [PATCH RFC v3 21/21] cpumask: Add enabled cpumask for present
 CPUs that can be brought online
Message-ID: <20231215171831.00004a19@Huawei.com>
In-Reply-To: <E1rDOhX-00Dvlg-Ci@rmk-PC.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
	<E1rDOhX-00Dvlg-Ci@rmk-PC.armlinux.org.uk>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_091841_016309_79B7284A 
X-CRM114-Status: GOOD (  22.65  )
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

On Wed, 13 Dec 2023 12:50:59 +0000
Russell King (Oracle) <rmk+kernel@armlinux.org.uk> wrote:

> From: James Morse <james.morse@arm.com>
> 
> The 'offline' file in sysfs shows all offline CPUs, including those
> that aren't present. User-space is expected to remove not-present CPUs
> from this list to learn which CPUs could be brought online.
> 
> CPUs can be present but not-enabled. These CPUs can't be brought online
> until the firmware policy changes, which comes with an ACPI notification
> that will register the CPUs.
> 
> With only the offline and present files, user-space is unable to
> determine which CPUs it can try to bring online. Add a new CPU mask
> that shows this based on all the registered CPUs.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Tested-by: Miguel Luis <miguel.luis@oracle.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Tested-by: Jianyong Wu <jianyong.wu@arm.com>
> ---

Needs docs
Documentation/ABI/testing/sysfs-devices-system-cpu
seems to have the rest of the similar entries.

> Outstanding comment:
>  https://lore.kernel.org/r/20230914175443.000038f6@Huawei.com
Very fussy reviewer. I'd ignore him on this :)

Code is fine.

Thanks for taking this forwards.  Maybe the end of this saga is
close!

Jonathan

> ---
>  drivers/base/cpu.c      | 10 ++++++++++
>  include/linux/cpumask.h | 25 +++++++++++++++++++++++++
>  kernel/cpu.c            |  3 +++
>  3 files changed, 38 insertions(+)
> 
> diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
> index 13d052bf13f4..a6e96a0a92b7 100644
> --- a/drivers/base/cpu.c
> +++ b/drivers/base/cpu.c
> @@ -95,6 +95,7 @@ void unregister_cpu(struct cpu *cpu)
>  {
>  	int logical_cpu = cpu->dev.id;
>  
> +	set_cpu_enabled(logical_cpu, false);
>  	unregister_cpu_under_node(logical_cpu, cpu_to_node(logical_cpu));
>  
>  	device_unregister(&cpu->dev);
> @@ -273,6 +274,13 @@ static ssize_t print_cpus_offline(struct device *dev,
>  }
>  static DEVICE_ATTR(offline, 0444, print_cpus_offline, NULL);
>  
> +static ssize_t print_cpus_enabled(struct device *dev,
> +				  struct device_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "%*pbl\n", cpumask_pr_args(cpu_enabled_mask));
> +}
> +static DEVICE_ATTR(enabled, 0444, print_cpus_enabled, NULL);
> +
>  static ssize_t print_cpus_isolated(struct device *dev,
>  				  struct device_attribute *attr, char *buf)
>  {
> @@ -413,6 +421,7 @@ int register_cpu(struct cpu *cpu, int num)
>  	register_cpu_under_node(num, cpu_to_node(num));
>  	dev_pm_qos_expose_latency_limit(&cpu->dev,
>  					PM_QOS_RESUME_LATENCY_NO_CONSTRAINT);
> +	set_cpu_enabled(num, true);
>  
>  	return 0;
>  }
> @@ -494,6 +503,7 @@ static struct attribute *cpu_root_attrs[] = {
>  	&cpu_attrs[2].attr.attr,
>  	&dev_attr_kernel_max.attr,
>  	&dev_attr_offline.attr,
> +	&dev_attr_enabled.attr,
>  	&dev_attr_isolated.attr,
>  #ifdef CONFIG_NO_HZ_FULL
>  	&dev_attr_nohz_full.attr,
> diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
> index cfb545841a2c..cc72a0887f04 100644
> --- a/include/linux/cpumask.h
> +++ b/include/linux/cpumask.h
> @@ -92,6 +92,7 @@ static inline void set_nr_cpu_ids(unsigned int nr)
>   *
>   *     cpu_possible_mask- has bit 'cpu' set iff cpu is populatable
>   *     cpu_present_mask - has bit 'cpu' set iff cpu is populated
> + *     cpu_enabled_mask  - has bit 'cpu' set iff cpu can be brought online
>   *     cpu_online_mask  - has bit 'cpu' set iff cpu available to scheduler
>   *     cpu_active_mask  - has bit 'cpu' set iff cpu available to migration
>   *
> @@ -124,11 +125,13 @@ static inline void set_nr_cpu_ids(unsigned int nr)
>  
>  extern struct cpumask __cpu_possible_mask;
>  extern struct cpumask __cpu_online_mask;
> +extern struct cpumask __cpu_enabled_mask;
>  extern struct cpumask __cpu_present_mask;
>  extern struct cpumask __cpu_active_mask;
>  extern struct cpumask __cpu_dying_mask;
>  #define cpu_possible_mask ((const struct cpumask *)&__cpu_possible_mask)
>  #define cpu_online_mask   ((const struct cpumask *)&__cpu_online_mask)
> +#define cpu_enabled_mask   ((const struct cpumask *)&__cpu_enabled_mask)
>  #define cpu_present_mask  ((const struct cpumask *)&__cpu_present_mask)
>  #define cpu_active_mask   ((const struct cpumask *)&__cpu_active_mask)
>  #define cpu_dying_mask    ((const struct cpumask *)&__cpu_dying_mask)
> @@ -993,6 +996,7 @@ extern const DECLARE_BITMAP(cpu_all_bits, NR_CPUS);
>  #else
>  #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)
>  #define for_each_online_cpu(cpu)   for_each_cpu((cpu), cpu_online_mask)
> +#define for_each_enabled_cpu(cpu)   for_each_cpu((cpu), cpu_enabled_mask)
>  #define for_each_present_cpu(cpu)  for_each_cpu((cpu), cpu_present_mask)
>  #endif
>  
> @@ -1015,6 +1019,15 @@ set_cpu_possible(unsigned int cpu, bool possible)
>  		cpumask_clear_cpu(cpu, &__cpu_possible_mask);
>  }
>  
> +static inline void
> +set_cpu_enabled(unsigned int cpu, bool can_be_onlined)
> +{
> +	if (can_be_onlined)
> +		cpumask_set_cpu(cpu, &__cpu_enabled_mask);
> +	else
> +		cpumask_clear_cpu(cpu, &__cpu_enabled_mask);
> +}
> +
>  static inline void
>  set_cpu_present(unsigned int cpu, bool present)
>  {
> @@ -1096,6 +1109,7 @@ static __always_inline unsigned int num_online_cpus(void)
>  	return raw_atomic_read(&__num_online_cpus);
>  }
>  #define num_possible_cpus()	cpumask_weight(cpu_possible_mask)
> +#define num_enabled_cpus()	cpumask_weight(cpu_enabled_mask)
>  #define num_present_cpus()	cpumask_weight(cpu_present_mask)
>  #define num_active_cpus()	cpumask_weight(cpu_active_mask)
>  
> @@ -1104,6 +1118,11 @@ static inline bool cpu_online(unsigned int cpu)
>  	return cpumask_test_cpu(cpu, cpu_online_mask);
>  }
>  
> +static inline bool cpu_enabled(unsigned int cpu)
> +{
> +	return cpumask_test_cpu(cpu, cpu_enabled_mask);
> +}
> +
>  static inline bool cpu_possible(unsigned int cpu)
>  {
>  	return cpumask_test_cpu(cpu, cpu_possible_mask);
> @@ -1128,6 +1147,7 @@ static inline bool cpu_dying(unsigned int cpu)
>  
>  #define num_online_cpus()	1U
>  #define num_possible_cpus()	1U
> +#define num_enabled_cpus()	1U
>  #define num_present_cpus()	1U
>  #define num_active_cpus()	1U
>  
> @@ -1141,6 +1161,11 @@ static inline bool cpu_possible(unsigned int cpu)
>  	return cpu == 0;
>  }
>  
> +static inline bool cpu_enabled(unsigned int cpu)
> +{
> +	return cpu == 0;
> +}
> +
>  static inline bool cpu_present(unsigned int cpu)
>  {
>  	return cpu == 0;
> diff --git a/kernel/cpu.c b/kernel/cpu.c
> index a86972a91991..fe0a5189f8ae 100644
> --- a/kernel/cpu.c
> +++ b/kernel/cpu.c
> @@ -3122,6 +3122,9 @@ EXPORT_SYMBOL(__cpu_possible_mask);
>  struct cpumask __cpu_online_mask __read_mostly;
>  EXPORT_SYMBOL(__cpu_online_mask);
>  
> +struct cpumask __cpu_enabled_mask __read_mostly;
> +EXPORT_SYMBOL(__cpu_enabled_mask);
> +
>  struct cpumask __cpu_present_mask __read_mostly;
>  EXPORT_SYMBOL(__cpu_present_mask);
>  


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
