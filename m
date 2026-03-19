Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B265107526D
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 07:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7cTsh48L+ZXM4G+Hb50lAb5Xuu2IFdh+H5C8kwwGogc=; b=0IvyIZdLoHWLF5
	aSAezQ2cZryy9hrBmMkkUvkesM5hkGqnbIS/ipv9Pf70XoMqs0qZz123KAJz8k8QMLay6pgWc32h/
	q+yP/8Wwz+zj+FCgktIs8cYvbm2FXIWP+Dfbog0+XxKRLkEMuJ7+m1Kvf6G/+ErqAJRqi54M/d3tB
	1o0bK72FQnEyKhnKajJSAXV86PoazN8tOtbVkziFTM8DPqf4N5IfTiSvNa5+S4EGiFxADNiVdpRs5
	iq1fIm5gSjNSMKlt/C5Vg3aGE8NkDg2QqQIHqyeFpYotLKoxy2pJEHc0NIlPTgCnlxFnfdDMtcODY
	UvpT+dxh3L+kHn/BBmVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w37Zn-0000000A6oq-2AWB;
	Thu, 19 Mar 2026 07:13:51 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w37Zk-0000000A6oQ-1FWl;
	Thu, 19 Mar 2026 07:13:49 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=rOgEX5LRjbf3VsJc30kly4+FTpT24EGUmpEIfFvp8FU=;
	b=RRC8Qk+vDk32R8JHqebkm1tGtkV6aqC7Rw/5tqI1aHILlK2h2Fd3giMbyZt1JjR+/2C5nr3jN
	LCoxznkWL7DSqvcKp14FgIYEdmkocS9XrRO5OVujVzcsJ5/bSzagK1Q0OB6Ne0iQgcMvxD/5fTO
	P3k1x2ro3WxAtvbL88NnXM8=
Received: from canpmsgout09.his.huawei.com (unknown [172.19.92.135])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4fbxjW2ybdz1BG9P;
	Thu, 19 Mar 2026 15:12:47 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=rOgEX5LRjbf3VsJc30kly4+FTpT24EGUmpEIfFvp8FU=;
	b=RRC8Qk+vDk32R8JHqebkm1tGtkV6aqC7Rw/5tqI1aHILlK2h2Fd3giMbyZt1JjR+/2C5nr3jN
	LCoxznkWL7DSqvcKp14FgIYEdmkocS9XrRO5OVujVzcsJ5/bSzagK1Q0OB6Ne0iQgcMvxD/5fTO
	P3k1x2ro3WxAtvbL88NnXM8=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4fbxcD4jF6z1cyPP;
	Thu, 19 Mar 2026 15:08:12 +0800 (CST)
Received: from kwepemk500009.china.huawei.com (unknown [7.202.194.94])
	by mail.maildlp.com (Postfix) with ESMTPS id 8543840363;
	Thu, 19 Mar 2026 15:13:12 +0800 (CST)
Received: from [10.67.121.161] (10.67.121.161) by
 kwepemk500009.china.huawei.com (7.202.194.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 19 Mar 2026 15:13:10 +0800
Message-ID: <264525a9-aa36-4848-80c0-f8cf246f93b8@huawei.com>
Date: Thu, 19 Mar 2026 15:13:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] ACPI: Refactor get_acpi_id_for_cpu() to
 acpi_get_cpu_uid() on non-x86
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20260318213458.GA474040@bhelgaas>
Content-Language: en-US
From: fengchengwen <fengchengwen@huawei.com>
In-Reply-To: <20260318213458.GA474040@bhelgaas>
X-Originating-IP: [10.67.121.161]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk500009.china.huawei.com (7.202.194.94)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_001348_647902_0CFD6172 
X-CRM114-Status: GOOD (  20.71  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, liuyonglong@huawei.com, anshuman.khandual@arm.com, "Rafael J .
 Wysocki" <rafael@kernel.org>, Kees Cook <kees@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Eric.VanTassell@amd.com, Somnath Kotur <somnath.kotur@broadcom.com>, Sohil Mehta <sohil.mehta@intel.com>, Kai Huang <kai.huang@intel.com>, Kevin Loughlin <kevinloughlin@google.com>, punit.agrawal@oss.qualcomm.com, guohanjun@huawei.com, Ilkka Koskinen <ilkka@os.amperecomputing.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Thorsten Blum <thorsten.blum@linux.dev>, linux-acpi@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, masahiroy@kernel.org, Yanteng Si <si.yanteng@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org, Zheyun Shen <szy0127@sjtu.edu.cn>, Len Brown <lenb@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, Thomas Huth <thuth@redhat.com>, ryan.roberts@arm.com, "Ahmed S . Darwish" <darwi@linutronix.de>, Ma Ke <make24@iscas.ac.cn>, suzuki.poulose@arm.com, James Clark <james.clark@linaro.org>, Wei Huang <wei.huang2@amd.com>, Besar Wicaksono <bwicaksono@nvidia.com>, loongarch@lists.linux.dev, Jonathan Cameron <jonathan.cameron@huawei.com>, Bjorn Helgaas <bhelgaas@google.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xin Li <xin@zytor.com>, Andy Gospodarek <andrew.gospodarek@broadcom.com>, Ingo Molnar <mingo@redhat.com>, wanghuiqiang@huawei.com, Juergen Gross <jgross@suse.com>, wangyuquan1236@phytium.com.cn, Sean Christopherson <seanjc@google.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-perf-users@vger.kernel.org, wangzhou1@hisilicon.com, heinrich.schuchardt@canonical.com, chenl311@chinatelecom.cn, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 3/19/2026 5:34 AM, Bjorn Helgaas wrote:
> On Wed, Mar 18, 2026 at 02:01:49PM +0800, Chengwen Feng wrote:
>> Unify CPU ACPI ID retrieval interface across architectures by
>> refactoring get_acpi_id_for_cpu() to acpi_get_cpu_uid() on
>> arm64/riscv/loongarch:
>> - Add input parameter validation
>> - Adjust interface to int acpi_get_cpu_uid(unsigned int cpu, u32 *uid)
>>   (old: u32 get_acpi_id_for_cpu(unsigned int cpu), no input check)
>>
>> This refactoring (not a pure rename) enhances interface robustness while
>> preparing for consistent ACPI Processor UID retrieval across all
>> ACPI-enabled platforms. Valid inputs retain original behavior.
>>
>> Note: Move the ARM64-specific get_cpu_for_acpi_id() implementation to
>>       arch/arm64/kernel/acpi.c to fix compilation errors from circular
>>       header dependencies introduced by the rename.
>>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Chengwen Feng <fengchengwen@huawei.com>
>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>> ---
>>  arch/arm64/include/asm/acpi.h      | 16 +---------
>>  arch/arm64/kernel/acpi.c           | 30 ++++++++++++++++++
>>  arch/loongarch/include/asm/acpi.h  |  5 ---
>>  arch/loongarch/kernel/acpi.c       |  9 ++++++
>>  arch/riscv/include/asm/acpi.h      |  4 ---
>>  arch/riscv/kernel/acpi.c           | 16 ++++++++++
>>  arch/riscv/kernel/acpi_numa.c      |  9 ++++--
>>  drivers/acpi/pptt.c                | 50 ++++++++++++++++++++++--------
>>  drivers/acpi/riscv/rhct.c          |  7 ++++-
>>  drivers/perf/arm_cspmu/arm_cspmu.c |  6 ++--
>>  include/linux/acpi.h               | 13 ++++++++
>>  11 files changed, 122 insertions(+), 43 deletions(-)
> 
> There's a lot going on in this single patch, which makes it hard to
> review.  I think this might make more sense as several patches:
> 
>   - arm64: declare acpi_get_cpu_uid() in arch/arm64/include, implement
>     it, and use in drivers/perf/arm_cspmu/arm_cspmu.c
> 
>   - loongarch: declare acpi_get_cpu_uid() in arch/loongarch/include
>     and implement
> 
>   - riscv: declare acpi_get_cpu_uid() in arch/riscv/include, implement
>     it, and use in rhct.c, riscv/kernel/acpi_numa.c
> 
>   - x86: declare acpi_get_cpu_uid() in arch/x86/include, implement it,
>     and use in xen
> 
>   - declare acpi_get_cpu_uid() in include/linux/acpi.h, remove
>     declarations from arm64, loongarch, riscv, x86
> 
>   - convert acpi/pptt.c to use acpi_get_cpu_uid(), remove unused
>     get_acpi_id_for_cpu() from arm64, loongarch, riscv
> 
>   - use acpi_get_cpu_uid() in tph.c

Thanks for the detailed guidance, done in v9

> 
> Doc nit below.
> 

...

>> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
>> index 4d2f0bed7a06..035094a55f18 100644
>> --- a/include/linux/acpi.h
>> +++ b/include/linux/acpi.h
>> @@ -324,6 +324,19 @@ int acpi_unmap_cpu(int cpu);
>>  
>>  acpi_handle acpi_get_processor_handle(int cpu);
>>  
>> +#ifndef CONFIG_X86
>> +/*
>> + * acpi_get_cpu_uid() - Get ACPI Processor UID of a specified CPU from MADT table
>> + * @cpu: Logical CPU number (0-based)
>> + * @uid: Pointer to store the ACPI Processor UID (valid only on successful return)
> 
> This would normally go at the implementation, but it probably does
> make sense here because each arch has its own implementation.
> 
> Should start with "/**" to make it kernel-doc though.
> 
> Wrap to fit in 78 columns, like other comments in this file.

done in v9

Thanks

> 
>> + * Return: 0 on successful retrieval (the ACPI Processor ID is stored in *uid);
>> + *         -EINVAL if the CPU number is invalid or out of range;
>> + *         -ENODEV if the ACPI Processor UID for the specified CPU is not found.
>> + */
>> +int acpi_get_cpu_uid(unsigned int cpu, u32 *uid);
>> +#endif
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
