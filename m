Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72DE105A57B
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 11:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=igEPK/ltDmq5tWHapyEnDjaRbiBwBVsxb2bmYckqWgg=; b=3C4U03L+Ta18C/
	LFwHZi0AijbwP/j2H85S3Usul412kla4Dy9OC0x5Rf6X7QcztiW9U3/VTSr7aLxueWovW9mFj8uly
	jkOhG5pXEqk8uu9L9eYZVGtHvKplllQ4LwlLxv0OWW26iwVaBz+F8B4xXdCelqy3rZjB7tAIn7YTJ
	CS37hpPqF5Pqg8UmCfYGpqE8c9SNT/N93m9wDXc9JuXbQBWD2wof3WDGbFUVgStpjKZI39+HlR9LU
	9OqmUXDvb1HNzkMAnb6xsYhBQJBS9+GtFvmYcK5izmh+S+0pR8xBnGP8XV9mumPaKX2p/2E7flUvW
	mb/Zmus5zS6kY8f9plXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0do1-0000000DuEj-43k2;
	Thu, 12 Mar 2026 11:02:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dnz-0000000DuEJ-3Vm7;
	Thu, 12 Mar 2026 11:02:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TKIEX/tTmZZzj6V6Q9LOzPYb6+bhVRh9N9evN1bqSfc=; b=an8qvmMRT6e0/uIgvv6SvD7SLo
	4m+UvPB5+18GpbDiaL9IxO3UA1h4nyJ0FZtTMBA4+J8t9buo20vz5+l2obe0Hhuhm03AWzFimVp4D
	YtHlF5LCr5cNGTsUr/nANJN0G/ar8NTW96doAb79xogVjlFtfvWv3tS4G8vgrwid1zRyuKnnoOtRg
	cRE6fVkUPmEULPsE/mtiFGjwxhTv0E57tOdjLrOaPqcviA5Hx/nImdKNCvkkIHyFLP9mr/wm0JSMb
	0Thh4CDgCwqZ4HpWOjjPbbgfQIiKl0MIq4avo+r94PhokRILHHajLVnNT16BcpXuKO/m4C7RcJSQ1
	afukQ/VQ==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dnq-0000000BDV5-3GNL;
	Thu, 12 Mar 2026 11:02:06 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id AC3B5300462; Thu, 12 Mar 2026 12:02:05 +0100 (CET)
Date: Thu, 12 Mar 2026 12:02:05 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Chengwen Feng <fengchengwen@huawei.com>
Subject: Re: [PATCH v6 2/3] x86: Implement acpi_get_cpu_uid()
Message-ID: <20260312110205.GG606826@noisy.programming.kicks-ass.net>
References: <20260312072316.4806-1-fengchengwen@huawei.com>
 <20260312072316.4806-3-fengchengwen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260312072316.4806-3-fengchengwen@huawei.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, heinrich.schuchardt@canonical.com, liuyonglong@huawei.com, anshuman.khandual@arm.com, "Rafael J . Wysocki" <rafael@kernel.org>, Kees Cook <kees@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Eric.VanTassell@amd.com, Somnath Kotur <somnath.kotur@broadcom.com>, Sohil Mehta <sohil.mehta@intel.com>, Kai Huang <kai.huang@intel.com>, Kevin Loughlin <kevinloughlin@google.com>, punit.agrawal@oss.qualcomm.com, "H . Peter Anvin" <hpa@zytor.com>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Thorsten Blum <thorsten.blum@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>, masahiroy@kernel.org, Huacai Chen <chenhuacai@kernel.org>, linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Yanteng Si <si.yanteng@linux.dev>, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org, Zheyun Shen <szy0127@sjtu.edu.cn>, Len Brown <lenb@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, Thomas Huth <thuth@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, ryan.roberts@arm.com, "Ahmed S . Darwish" <darwi@linutronix.de>, Ma Ke <make24@iscas.ac.cn>, suzuki.poulose@arm.com, James Clark <james.clark@linaro.org>, Wei Huang <wei.huang2@amd.com>, Besar Wicaksono <bwicaksono@nvidia.com>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>, Bjorn Helgaas <bhelgaas@google.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xin Li <xin@zytor.com>, Andy Gospodarek <andrew.gospodarek@broadcom.com>, Ingo Molnar <mingo@redhat.com>, wanghuiqiang@huawei.com, Juergen Gross <jgross@suse.com>, wangyuquan1236@phytium.com.cn, Sean Christopherson <seanjc@google.com>, guohanjun@huawei.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-perf-users@vger.kernel.org, wangzhou1@hisilicon.com, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Jonathan Cameron <jonathan.cameron@huawei.com>, chenl311@chinatelecom.cn, Paul Walmsley <pjw@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Mar 12, 2026 at 03:23:15PM +0800, Chengwen Feng wrote:
> Add acpi_get_cpu_uid() implementation for x86, replacing the existing
> cpu_acpi_id() function. This completes the unified ACPI Processor UID
> retrieval interface across all ACPI-enabled architectures.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Chengwen Feng <fengchengwen@huawei.com>
> ---
>  arch/x86/include/asm/cpu.h   |  1 -
>  arch/x86/include/asm/smp.h   |  1 -
>  arch/x86/kernel/cpu/common.c | 15 +++++++++++++++
>  arch/x86/xen/enlighten_hvm.c |  5 +++--
>  include/linux/acpi.h         |  2 --
>  5 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/include/asm/cpu.h b/arch/x86/include/asm/cpu.h
> index ad235dda1ded..57a0786dfd75 100644
> --- a/arch/x86/include/asm/cpu.h
> +++ b/arch/x86/include/asm/cpu.h
> @@ -11,7 +11,6 @@
>  
>  #ifndef CONFIG_SMP
>  #define cpu_physical_id(cpu)			boot_cpu_physical_apicid
> -#define cpu_acpi_id(cpu)			0
>  #endif /* CONFIG_SMP */
>  
>  #ifdef CONFIG_HOTPLUG_CPU
> diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
> index 84951572ab81..05d1d479b4cf 100644
> --- a/arch/x86/include/asm/smp.h
> +++ b/arch/x86/include/asm/smp.h
> @@ -130,7 +130,6 @@ __visible void smp_call_function_interrupt(struct pt_regs *regs);
>  __visible void smp_call_function_single_interrupt(struct pt_regs *r);
>  
>  #define cpu_physical_id(cpu)	per_cpu(x86_cpu_to_apicid, cpu)
> -#define cpu_acpi_id(cpu)	per_cpu(x86_cpu_to_acpiid, cpu)
>  
>  /*
>   * This function is needed by all SMP systems. It must _always_ be valid
> diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> index 1c3261cae40c..3081557542c7 100644
> --- a/arch/x86/kernel/cpu/common.c
> +++ b/arch/x86/kernel/cpu/common.c
> @@ -28,6 +28,7 @@
>  #include <linux/stackprotector.h>
>  #include <linux/utsname.h>
>  #include <linux/efi.h>
> +#include <linux/acpi.h>
>  
>  #include <asm/alternative.h>
>  #include <asm/cmdline.h>
> @@ -57,6 +58,7 @@
>  #include <asm/asm.h>
>  #include <asm/bugs.h>
>  #include <asm/cpu.h>
> +#include <asm/smp.h>
>  #include <asm/mce.h>
>  #include <asm/msr.h>
>  #include <asm/cacheinfo.h>
> @@ -2643,3 +2645,16 @@ void __init arch_cpu_finalize_init(void)
>  	 */
>  	mem_encrypt_init();
>  }
> +
> +int acpi_get_cpu_uid(unsigned int cpu, u32 *uid)
> +{
> +	if (cpu >= nr_cpu_ids)
> +		return -EINVAL;
> +#ifndef CONFIG_SMP
> +	*uid = 0;
> +#else
> +	*uid = per_cpu(x86_cpu_to_acpiid, cpu);
> +#endif
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(acpi_get_cpu_uid);
> diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
> index fe57ff85d004..2f9fa27e5a3c 100644
> --- a/arch/x86/xen/enlighten_hvm.c
> +++ b/arch/x86/xen/enlighten_hvm.c
> @@ -151,6 +151,7 @@ static void xen_hvm_crash_shutdown(struct pt_regs *regs)
>  
>  static int xen_cpu_up_prepare_hvm(unsigned int cpu)
>  {
> +	u32 cpu_uid;
>  	int rc = 0;
>  
>  	/*
> @@ -161,8 +162,8 @@ static int xen_cpu_up_prepare_hvm(unsigned int cpu)
>  	 */
>  	xen_uninit_lock_cpu(cpu);
>  
> -	if (cpu_acpi_id(cpu) != CPU_ACPIID_INVALID)
> -		per_cpu(xen_vcpu_id, cpu) = cpu_acpi_id(cpu);
> +	if (acpi_get_cpu_uid(cpu, &cpu_uid) == 0)
> +		per_cpu(xen_vcpu_id, cpu) = cpu_uid;
>  	else
>  		per_cpu(xen_vcpu_id, cpu) = cpu;
>  	xen_vcpu_setup(cpu);

This doesn't look right, it will now set CPU_ACPIID_INVALID, while
previously it would not.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
