Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575311093170
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 03:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rTnI9OZQy6RPJXriVFwecNzJuBXbfhSU/X6cS/vMyo0=; b=bUzVyER7kXSA6P
	JmPZo2nO5e/z6WLKue/PfOM3LTv3cUvmH+arcHR0awxL/j83O/BtSpFWCjYbwxLS4UMJA2FSDcVSX
	TDjtGoAG2EQT5bsJzCDYY1SzH5KT4D1T8fMKjAqJ4QDbtp5OOGNmX08Qxlt0w0aRBm0pOkm3kMdrO
	TOC0yUUMWBaQVTVSBTMLxJyiCcIZ85F4sYQzc8kW9b7wy49dEWZUMquthWzUajqpaZmClG9aRsMH4
	kZ8ptoxwzPy2emrNKlLURq41dkWEM+xXsRN9AoPjALnTmVcAbLoQvc136OYo6ZoQZN4wCtGXbQdbP
	g8ZVZpwolOGxeh8Dsl+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3QQ5-0000000Bzmc-1gYp;
	Fri, 20 Mar 2026 03:21:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3QQ2-0000000BzlQ-2uzU;
	Fri, 20 Mar 2026 03:21:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lktLkGPyIysx/WhMm6zhFs4+/dKUCu1VRaLJ2DTbNKk=; b=fys0YI2COuniD0qA8c75Q0txIJ
	WpAXN4z/DCfQp8Wi6imOc4J+AZ4G2hlFc+J5ZiLpoF+V/0wnPKfUn/0LN6y9mrObdjivDrYDdpZ43
	qzAPoxpigKnZR90Y/NrWrGqXxI0uz1i9Jav5yWDfA4/S5z9I9JqSquoadsGwp0tTpyESu5KLGuSZT
	7/hKdh8e2Fw2oeftaks9vjWCQYn/yhfHwX9ETqnoPqxbKVMUqMsJl4fc99kxLkIvFRy8q0cg+Se3L
	v/NJKUa5b1sVIvl0yJqDoAX3qWmceUPcUgql2ysMyfzTIiBcdKnHzb95a9E+pIF8D31mjUez4yO6k
	ckFiojMA==;
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3QPx-0000000Er14-3sQc;
	Fri, 20 Mar 2026 03:21:01 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=lktLkGPyIysx/WhMm6zhFs4+/dKUCu1VRaLJ2DTbNKk=;
	b=BmbPRJicL0i4h9s8skOHMSkzRHoRkrfIchJvOxTmvfFrO197DbtNbsJ3/cHCjYhsoXNVBbdKq
	OoMYj4CbYb7pX1jqI899B/8GePSsfcvWqXsNyTaDCPL9bpQo/J8OYh712QYGDjmKOlq7aqwKF4y
	zBdbCmbvNplVO//KpM+ko5w=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4fcSNY1G8gz1K96X;
	Fri, 20 Mar 2026 11:14:53 +0800 (CST)
Received: from kwepemk500009.china.huawei.com (unknown [7.202.194.94])
	by mail.maildlp.com (Postfix) with ESMTPS id 356FF40363;
	Fri, 20 Mar 2026 11:20:53 +0800 (CST)
Received: from [10.67.121.161] (10.67.121.161) by
 kwepemk500009.china.huawei.com (7.202.194.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 20 Mar 2026 11:20:50 +0800
Message-ID: <ece36c60-ed45-4cb8-b6f4-8a13e8e55949@huawei.com>
Date: Fri, 20 Mar 2026 11:20:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/7] arm64/acpi: Add acpi_get_cpu_uid() and switch
 arm_cspmu to use it
To: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
References: <20260319065735.45954-1-fengchengwen@huawei.com>
 <20260319065735.45954-2-fengchengwen@huawei.com> <87341vq0u1.fsf@stealth>
Content-Language: en-US
From: fengchengwen <fengchengwen@huawei.com>
In-Reply-To: <87341vq0u1.fsf@stealth>
X-Originating-IP: [10.67.121.161]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk500009.china.huawei.com (7.202.194.94)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_032058_606422_E8ACE05D 
X-CRM114-Status: GOOD (  25.42  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, heinrich.schuchardt@canonical.com, liuyonglong@huawei.com, anshuman.khandual@arm.com, "Rafael J .
 Wysocki" <rafael@kernel.org>, Kees Cook <kees@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Eric.VanTassell@amd.com, Somnath Kotur <somnath.kotur@broadcom.com>, Sohil Mehta <sohil.mehta@intel.com>, Kai Huang <kai.huang@intel.com>, Kevin Loughlin <kevinloughlin@google.com>, chenl311@chinatelecom.cn, "H . Peter Anvin" <hpa@zytor.com>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Thorsten Blum <thorsten.blum@linux.dev>, linux-acpi@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>, masahiroy@kernel.org, Huacai Chen <chenhuacai@kernel.org>, linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Yanteng Si <si.yanteng@linux.dev>, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org, Zheyun Shen <szy0127@sjtu.edu.cn>, Len Brown <lenb@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, Thomas Huth <thuth@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, ryan.roberts@arm.com, "Ahmed S . Darwish" <darwi@linutronix.de>, Ma Ke <make24@iscas.ac.cn>, suzuki.poulose@arm.com, James Clark <james.clark@linaro.org>, Wei Huang <wei.huang2@amd.com>, Besar Wicaksono <bwicaksono@nvidia.com>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>, Bjorn Helgaas <bhelgaas@google.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xin Li <xin@zytor.com>, Andy Gospodarek <andrew.gospodarek@broadcom.com>, Ingo Molnar <mingo@redhat.com>, wanghuiqiang@huawei.com, Juergen Gross <jgross@suse.com>, wangyuquan1236@phytium.com.cn, Sean Christopherson <seanjc@google.com>, guohanjun@huawei.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-perf-users@vger.kernel.org, wangzhou1@hisilicon.com, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Jonathan Cameron <jonathan.cameron@huawei.com>, Paul Walmsley <pjw@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 3/19/2026 11:46 PM, Punit Agrawal wrote:
> Chengwen Feng <fengchengwen@huawei.com> writes:
> 
>> Add arch-specific acpi_get_cpu_uid() for arm64, and update dependent
>> code:
>> - Declare acpi_get_cpu_uid() in arch/arm64/include/asm/acpi.h
>> - Implement acpi_get_cpu_uid() with input parameter validation
>> - Replace get_acpi_id_for_cpu() with acpi_get_cpu_uid() in
>>   drivers/perf/arm_cspmu/arm_cspmu.c
>> - Reimplement get_cpu_for_acpi_id() based on acpi_get_cpu_uid() (to
>>   align with new interface) and move its implementation next to
>>   acpi_get_cpu_uid()
> 
> There is no benefit in describing the code changes like this in the
> commit log. It makes it hard to follow the intent of the patch.
> 
>> This is the first step towards unifying ACPI CPU UID retrieval interface
>> across architectures, while adding input validation for robustness.
> 
> I would simplify the commit log to something along the lines of -
> 
>     As a step towards unifying the interface for retrieving ACPI CPU uid
>     across architectures, introduce a new function
>     acpi_get_cpu_uid(). While at it, also add input validation to make
>     the code more robust.

Thank you for your advice.
I've reviewed all the commit logs and made some optimizations, and done in v10

> 
> Just my 2c.
> 
> The code changes looks fine.
> 
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Chengwen Feng <fengchengwen@huawei.com>
>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>> ---
>>  arch/arm64/include/asm/acpi.h      | 14 ++------------
>>  arch/arm64/kernel/acpi.c           | 30 ++++++++++++++++++++++++++++++
>>  drivers/perf/arm_cspmu/arm_cspmu.c |  6 ++++--
>>  3 files changed, 36 insertions(+), 14 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/acpi.h b/arch/arm64/include/asm/acpi.h
>> index c07a58b96329..2219a3301e72 100644
>> --- a/arch/arm64/include/asm/acpi.h
>> +++ b/arch/arm64/include/asm/acpi.h
>> @@ -118,18 +118,8 @@ static inline u32 get_acpi_id_for_cpu(unsigned int cpu)
>>  {
>>  	return	acpi_cpu_get_madt_gicc(cpu)->uid;
>>  }
>> -
>> -static inline int get_cpu_for_acpi_id(u32 uid)
>> -{
>> -	int cpu;
>> -
>> -	for (cpu = 0; cpu < nr_cpu_ids; cpu++)
>> -		if (acpi_cpu_get_madt_gicc(cpu) &&
>> -		    uid == get_acpi_id_for_cpu(cpu))
>> -			return cpu;
>> -
>> -	return -EINVAL;
>> -}
>> +int acpi_get_cpu_uid(unsigned int cpu, u32 *uid);
>> +int get_cpu_for_acpi_id(u32 uid);
>>  
>>  static inline void arch_fix_phys_package_id(int num, u32 slot) { }
>>  void __init acpi_init_cpus(void);
>> diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
>> index af90128cfed5..24b9d934be54 100644
>> --- a/arch/arm64/kernel/acpi.c
>> +++ b/arch/arm64/kernel/acpi.c
>> @@ -458,3 +458,33 @@ int acpi_unmap_cpu(int cpu)
>>  }
>>  EXPORT_SYMBOL(acpi_unmap_cpu);
>>  #endif /* CONFIG_ACPI_HOTPLUG_CPU */
>> +
>> +int acpi_get_cpu_uid(unsigned int cpu, u32 *uid)
>> +{
>> +	struct acpi_madt_generic_interrupt *gicc;
>> +
>> +	if (cpu >= nr_cpu_ids)
>> +		return -EINVAL;
>> +
>> +	gicc = acpi_cpu_get_madt_gicc(cpu);
>> +	if (!gicc)
>> +		return -ENODEV;
>> +
>> +	*uid = gicc->uid;
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(acpi_get_cpu_uid);
>> +
>> +int get_cpu_for_acpi_id(u32 uid)
>> +{
>> +	u32 cpu_uid;
>> +	int ret;
>> +
>> +	for (int cpu = 0; cpu < nr_cpu_ids; cpu++) {
>> +		ret = acpi_get_cpu_uid(cpu, &cpu_uid);
>> +		if (ret == 0 && uid == cpu_uid)
>> +			return cpu;
>> +	}
>> +
>> +	return -EINVAL;
>> +}
>> diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
>> index 34430b68f602..ed72c3d1f796 100644
>> --- a/drivers/perf/arm_cspmu/arm_cspmu.c
>> +++ b/drivers/perf/arm_cspmu/arm_cspmu.c
>> @@ -1107,15 +1107,17 @@ static int arm_cspmu_acpi_get_cpus(struct arm_cspmu *cspmu)
>>  {
>>  	struct acpi_apmt_node *apmt_node;
>>  	int affinity_flag;
>> +	u32 cpu_uid;
>>  	int cpu;
>> +	int ret;
>>  
>>  	apmt_node = arm_cspmu_apmt_node(cspmu->dev);
>>  	affinity_flag = apmt_node->flags & ACPI_APMT_FLAGS_AFFINITY;
>>  
>>  	if (affinity_flag == ACPI_APMT_FLAGS_AFFINITY_PROC) {
>>  		for_each_possible_cpu(cpu) {
>> -			if (apmt_node->proc_affinity ==
>> -			    get_acpi_id_for_cpu(cpu)) {
>> +			ret = acpi_get_cpu_uid(cpu, &cpu_uid);
>> +			if (ret == 0 && apmt_node->proc_affinity == cpu_uid) {
>>  				cpumask_set_cpu(cpu, &cspmu->associated_cpus);
>>  				break;
>>  			}
> 
> I think cspmu changes go via a separate pull request. You might have to
> split this change into a separate commit.

done in v10

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
