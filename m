Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED6B106FD66
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 02:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DmRIgASjcl9jKrjTR0ec9kRfEKZw2JaUGetN+RJ4VlE=; b=pipQC5mO8SWIM9
	tYB8UkkLWXVsF/bxi8SdFkp8uv5CkjfkXPpm67mb4SxMD1WOFWMVDePajxBMKeDu+2DS9DL6cRqHf
	obUmKiDGISAXoAFjYTsNi7tQPqbD29+2QMYBL/RVjQVoKkiGGuYQwNizCSpwhp/v2l2jIxpWRX4tN
	GPlyz1WlaM6M7j2TAsrOnphjohP+MyLORSsN7dC63Zir36rRJy7G5Ga2a2qDiPh5FKCGjQem9CgO0
	QwGudmqVZya3IZxZtWw8yTHt1V4ifqNrt3aEoDKDMJxPuG0M3QRP8FihNiveWUaLUjpJ2J/aIgNDK
	G2vX0k8Pgy87LmMrLfWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0sKU-0000000GFRq-1dO7;
	Fri, 13 Mar 2026 02:32:46 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0sKQ-0000000GFOY-1zq9;
	Fri, 13 Mar 2026 02:32:44 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=droVX0NUC4A+GNH3y57ZGeXheGPpw9m67aw4WCFjXtI=;
	b=kwa1qp22L/gdJGPkqfbGAAXcu+LyOqhrEw20HKvhNdqzvoQKMdK9OzPtPhARsHhl6j2D6P+Zr
	j6GC+HeoE9kX8IxSB+U4y21CjsurYvoSHiov38HwUlAKYHAcTB7jnvqfYq4tyu+pAfwUx7PDu7P
	JI+N0ZgVvFlAzWAcsIeXyiI=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4fX7gG3N0zzRhQS;
	Fri, 13 Mar 2026 10:27:38 +0800 (CST)
Received: from kwepemk500009.china.huawei.com (unknown [7.202.194.94])
	by mail.maildlp.com (Postfix) with ESMTPS id 0A2E040569;
	Fri, 13 Mar 2026 10:32:34 +0800 (CST)
Received: from [10.67.121.161] (10.67.121.161) by
 kwepemk500009.china.huawei.com (7.202.194.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 13 Mar 2026 10:32:31 +0800
Message-ID: <90505ea3-d842-4092-9743-6ed58c59ca55@huawei.com>
Date: Fri, 13 Mar 2026 10:32:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] x86: Implement acpi_get_cpu_uid()
To: Peter Zijlstra <peterz@infradead.org>
References: <20260312072316.4806-1-fengchengwen@huawei.com>
 <20260312072316.4806-3-fengchengwen@huawei.com>
 <20260312110205.GG606826@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: fengchengwen <fengchengwen@huawei.com>
In-Reply-To: <20260312110205.GG606826@noisy.programming.kicks-ass.net>
X-Originating-IP: [10.67.121.161]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk500009.china.huawei.com (7.202.194.94)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_193243_214127_4228B41F 
X-CRM114-Status: GOOD (  17.26  )
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
 Wysocki" <rafael@kernel.org>, Kees Cook <kees@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Eric.VanTassell@amd.com, Somnath Kotur <somnath.kotur@broadcom.com>, Sohil Mehta <sohil.mehta@intel.com>, Kai Huang <kai.huang@intel.com>, Kevin Loughlin <kevinloughlin@google.com>, punit.agrawal@oss.qualcomm.com, "H . Peter Anvin" <hpa@zytor.com>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Thorsten Blum <thorsten.blum@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>, masahiroy@kernel.org, Huacai Chen <chenhuacai@kernel.org>, linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Yanteng Si <si.yanteng@linux.dev>, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org, Zheyun Shen <szy0127@sjtu.edu.cn>, Len Brown <lenb@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, Thomas Huth <thuth@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, ryan.roberts@arm.com, "Ahmed S .
 Darwish" <darwi@linutronix.de>, Ma Ke <make24@iscas.ac.cn>, suzuki.poulose@arm.com, James Clark <james.clark@linaro.org>, Wei Huang <wei.huang2@amd.com>, Besar Wicaksono <bwicaksono@nvidia.com>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>, Bjorn Helgaas <bhelgaas@google.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xin Li <xin@zytor.com>, Andy Gospodarek <andrew.gospodarek@broadcom.com>, Ingo Molnar <mingo@redhat.com>, wanghuiqiang@huawei.com, Juergen Gross <jgross@suse.com>, wangyuquan1236@phytium.com.cn, Sean Christopherson <seanjc@google.com>, guohanjun@huawei.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-perf-users@vger.kernel.org, wangzhou1@hisilicon.com, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Jonathan Cameron <jonathan.cameron@huawei.com>, chenl311@chinatelecom.cn, Paul Walmsley <pjw@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 3/12/2026 7:02 PM, Peter Zijlstra wrote:
> On Thu, Mar 12, 2026 at 03:23:15PM +0800, Chengwen Feng wrote:
>> Add acpi_get_cpu_uid() implementation for x86, replacing the existing
>> cpu_acpi_id() function. This completes the unified ACPI Processor UID
>> retrieval interface across all ACPI-enabled architectures.
>>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Chengwen Feng <fengchengwen@huawei.com>
>> ---
>>  arch/x86/include/asm/cpu.h   |  1 -
>>  arch/x86/include/asm/smp.h   |  1 -
>>  arch/x86/kernel/cpu/common.c | 15 +++++++++++++++
>>  arch/x86/xen/enlighten_hvm.c |  5 +++--
>>  include/linux/acpi.h         |  2 --
>>  5 files changed, 18 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/x86/include/asm/cpu.h b/arch/x86/include/asm/cpu.h
>> index ad235dda1ded..57a0786dfd75 100644
>> --- a/arch/x86/include/asm/cpu.h
>> +++ b/arch/x86/include/asm/cpu.h
>> @@ -11,7 +11,6 @@
>>  
>>  #ifndef CONFIG_SMP
>>  #define cpu_physical_id(cpu)			boot_cpu_physical_apicid
>> -#define cpu_acpi_id(cpu)			0
>>  #endif /* CONFIG_SMP */
>>  
>>  #ifdef CONFIG_HOTPLUG_CPU
>> diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
>> index 84951572ab81..05d1d479b4cf 100644
>> --- a/arch/x86/include/asm/smp.h
>> +++ b/arch/x86/include/asm/smp.h
>> @@ -130,7 +130,6 @@ __visible void smp_call_function_interrupt(struct pt_regs *regs);
>>  __visible void smp_call_function_single_interrupt(struct pt_regs *r);
>>  
>>  #define cpu_physical_id(cpu)	per_cpu(x86_cpu_to_apicid, cpu)
>> -#define cpu_acpi_id(cpu)	per_cpu(x86_cpu_to_acpiid, cpu)
>>  
>>  /*
>>   * This function is needed by all SMP systems. It must _always_ be valid
>> diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
>> index 1c3261cae40c..3081557542c7 100644
>> --- a/arch/x86/kernel/cpu/common.c
>> +++ b/arch/x86/kernel/cpu/common.c
>> @@ -28,6 +28,7 @@
>>  #include <linux/stackprotector.h>
>>  #include <linux/utsname.h>
>>  #include <linux/efi.h>
>> +#include <linux/acpi.h>
>>  
>>  #include <asm/alternative.h>
>>  #include <asm/cmdline.h>
>> @@ -57,6 +58,7 @@
>>  #include <asm/asm.h>
>>  #include <asm/bugs.h>
>>  #include <asm/cpu.h>
>> +#include <asm/smp.h>
>>  #include <asm/mce.h>
>>  #include <asm/msr.h>
>>  #include <asm/cacheinfo.h>
>> @@ -2643,3 +2645,16 @@ void __init arch_cpu_finalize_init(void)
>>  	 */
>>  	mem_encrypt_init();
>>  }
>> +
>> +int acpi_get_cpu_uid(unsigned int cpu, u32 *uid)
>> +{
>> +	if (cpu >= nr_cpu_ids)
>> +		return -EINVAL;
>> +#ifndef CONFIG_SMP
>> +	*uid = 0;
>> +#else
>> +	*uid = per_cpu(x86_cpu_to_acpiid, cpu);
>> +#endif
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(acpi_get_cpu_uid);
>> diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
>> index fe57ff85d004..2f9fa27e5a3c 100644
>> --- a/arch/x86/xen/enlighten_hvm.c
>> +++ b/arch/x86/xen/enlighten_hvm.c
>> @@ -151,6 +151,7 @@ static void xen_hvm_crash_shutdown(struct pt_regs *regs)
>>  
>>  static int xen_cpu_up_prepare_hvm(unsigned int cpu)
>>  {
>> +	u32 cpu_uid;
>>  	int rc = 0;
>>  
>>  	/*
>> @@ -161,8 +162,8 @@ static int xen_cpu_up_prepare_hvm(unsigned int cpu)
>>  	 */
>>  	xen_uninit_lock_cpu(cpu);
>>  
>> -	if (cpu_acpi_id(cpu) != CPU_ACPIID_INVALID)
>> -		per_cpu(xen_vcpu_id, cpu) = cpu_acpi_id(cpu);
>> +	if (acpi_get_cpu_uid(cpu, &cpu_uid) == 0)
>> +		per_cpu(xen_vcpu_id, cpu) = cpu_uid;
>>  	else
>>  		per_cpu(xen_vcpu_id, cpu) = cpu;
>>  	xen_vcpu_setup(cpu);
> 
> This doesn't look right, it will now set CPU_ACPIID_INVALID, while
> previously it would not.

This is indeed an issue, it has been fixed in v7 (by treating CPU_ACPIID_INVALID as an error).

Thanks

> 
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
