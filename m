Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F5DFCCF9E0
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 08:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xmQJzkcGa3Um28r+9Lemy8FrCcwij/B9FFFaGh4Y+bI=; b=ssQvqNtjlUr94Ti8iXFe5HUqSz
	ubfeWCUHUMp+fZqIMTe7FtZZa6QA6zt3aS9wv3Z2VwYG0lrotxMTcWExJ+8TDZC+GOn5cghL6FB1u
	DBfF7O8eHt3vX+Z1wnXCqcDTIKWfp4obabPI7cepKhBg6UbvpSB2fQSKV1Y+9C2MuwZ/iLMm02G+l
	/dQVXlxTGFLKXCSxtKYPkDgHRAf8JsnfUcaBEWhOUbL/Io0gVRMzPIlP2Bhi99497Vf0I7f38xwE0
	eP6nqfBaGJZJi+rN8HnnSvKtb/ozKkJFz2YtmCaNfexuNeX+O5qqgW1Rl7M/zsy2wA6lV2lFLmK3X
	ddkmkaTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDfBb-0000000FYcC-3yPR;
	Tue, 28 Oct 2025 08:36:11 +0000
Received: from out-186.mta0.migadu.com ([2001:41d0:1004:224b::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDfBV-0000000FYbe-0KHJ
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 08:36:10 +0000
Message-ID: <0f7e6be5-f9ac-4019-93c6-295a068046a8@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761640558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jQQzhmZR1maF++whUcF7mYPtgUN1DSb8cYmCvPeH5rw=;
	b=FZmVYX4RsSHDCCkZVM0T5gMdsRunXkOs9KLexay+RnS0snHdHDyH+MKyeEDH8nJNnPOhli
	lzX74B3An2s845eQwln8PiJJJEqe5D2VwMkUZioaTUKaUs2C1cT80dQ6HZM+sZiijk7vdf
	87QoWcEXxPqlmr1qSyr1okLsGjLWCNo=
Date: Tue, 28 Oct 2025 01:35:53 -0700
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: Enable HOTPLUG_PARALLEL for secondary CPUs
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
References: <20250905122512.71684-1-apatel@ventanamicro.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
Content-Language: en-US
In-Reply-To: <20250905122512.71684-1-apatel@ventanamicro.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_013605_540400_3AA690FC 
X-CRM114-Status: GOOD (  21.80  )
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
Cc: Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 9/5/25 5:25 AM, Anup Patel wrote:
> The core kernel already supports parallel bringup of secondary
> CPUs (aka HOTPLUG_PARALLEL). The x86 and MIPS architectures
> already use HOTPLUG_PARALLEL and ARM is also moving toward it.
>
> On RISC-V, there is no arch specific global data accessed in the
> RISC-V secondary CPU bringup path so enabling HOTPLUG_PARALLEL for
> RISC-V would only requires:
> 1) Providing RISC-V specific arch_cpuhp_kick_ap_alive()
> 2) Calling cpuhp_ap_sync_alive() from smp_callin()
>
> This patch is tested natively with OpenSBI on QEMU RV64 virt machine
> with 64 cores and also tested with KVM RISC-V guest with 32 VCPUs.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   arch/riscv/Kconfig          |  2 +-
>   arch/riscv/kernel/smpboot.c | 15 +++++++++++++++
>   2 files changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index a4b233a0659e..d5800d6f9a15 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -196,7 +196,7 @@ config RISCV
>   	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
>   	select HAVE_STACKPROTECTOR
>   	select HAVE_SYSCALL_TRACEPOINTS
> -	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
> +	select HOTPLUG_PARALLEL if HOTPLUG_CPU
>   	select IRQ_DOMAIN
>   	select IRQ_FORCED_THREADING
>   	select KASAN_VMALLOC if KASAN
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index 601a321e0f17..d85916a3660c 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -39,7 +39,9 @@
>   
>   #include "head.h"
>   
> +#ifndef CONFIG_HOTPLUG_PARALLEL
>   static DECLARE_COMPLETION(cpu_running);
> +#endif
>   
>   void __init smp_prepare_cpus(unsigned int max_cpus)
>   {
> @@ -179,6 +181,12 @@ static int start_secondary_cpu(int cpu, struct task_struct *tidle)
>   	return -EOPNOTSUPP;
>   }
>   
> +#ifdef CONFIG_HOTPLUG_PARALLEL
> +int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *tidle)
> +{
> +	return start_secondary_cpu(cpu, tidle);
> +}
> +#else
>   int __cpu_up(unsigned int cpu, struct task_struct *tidle)
>   {
>   	int ret = 0;
> @@ -199,6 +207,7 @@ int __cpu_up(unsigned int cpu, struct task_struct *tidle)
>   
>   	return ret;
>   }
> +#endif
>   
>   void __init smp_cpus_done(unsigned int max_cpus)
>   {
> @@ -225,6 +234,10 @@ asmlinkage __visible void smp_callin(void)
>   	mmgrab(mm);
>   	current->active_mm = mm;
>   
> +#ifdef CONFIG_HOTPLUG_PARALLEL
> +	cpuhp_ap_sync_alive();
> +#endif
> +
>   	store_cpu_topology(curr_cpuid);
>   	notify_cpu_starting(curr_cpuid);
>   
> @@ -243,7 +256,9 @@ asmlinkage __visible void smp_callin(void)
>   	 */
>   	local_flush_icache_all();
>   	local_flush_tlb_all();
> +#ifndef CONFIG_HOTPLUG_PARALLEL
>   	complete(&cpu_running);
> +#endif

LGTM.

Reviewed-by: Atish Patra <atishp@rivosinc.com>

Have you tried with 128 harts ? I was not able to boot 128 harts in Qemu 
with NR_CPUS=256.
This is unrelated to this patch though. I can reproduce the issue on 
upstream with 6.18-rc3.


>   	/*
>   	 * Disable preemption before enabling interrupts, so we don't try to
>   	 * schedule a CPU that hasn't actually started yet.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
