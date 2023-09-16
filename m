Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9A5CD37B7
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Sep 2023 08:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qoSXKib8Cnqz/lLLtVFkdN88xjGIQBIaQXFTBLarSlw=; b=O2R3pNkcabid2R
	NeNN2jxScjqMqrKo3I9fEdCo58Cr2sAdP6M0D99giFADoVglJZSLCjkOtneigQnLqhfy6gIDiN0cZ
	VPMDRQqnWQf5rqTjXq3nbhz9JqUEkZ1yR98vbNmZzn7niH32JUwvOI/P2VVRaEpoPyYN80lEedyEv
	j42KiNwhatYBXvPgdVVHfpzI4iIMiSXiRayaxchvIXHn2YzXwHtJznew+CH7Df4jRgk9ibk6ky3dq
	IzA5RsbA0lbqSn8gk5yDj97De3QCS7pAdJ2QyLtPBGrzcAyZutqraODqpe7C3ZlcslntRypvmzupP
	9AF56aK0o0cfvqRIZ/ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhR1t-00CCyL-15;
	Sat, 16 Sep 2023 08:51:53 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhR1q-00CCxs-22
	for linux-riscv@lists.infradead.org;
	Sat, 16 Sep 2023 08:51:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3CFBAB80A71;
	Sat, 16 Sep 2023 08:51:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A06C433C8;
	Sat, 16 Sep 2023 08:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694854308;
	bh=sBLYwExMm0kwbbKuF7H9j3Qpj6omVfe3V1PmoGAgmZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jg8t1lzgoBnQNqwqVbQk92gPDGuziLB22TGq3Svz1GeCVgPmMm58n1hKEbkT/9jzm
	 e2k2J0X969awzEjX06/iugqTqh2WDYP09GMVu6AuUWr10q5/IBgxMh4q70LUHXO7B9
	 82VI9h9Bm6uMCjMDEXEqnY2WIm430o+d7So5udYZ+0VpK2lgTxpJLG6QS/eIXefkRt
	 8LX0voWG2Ps9xb01KmvgR7uLh9rXLpwSK+SWE3XxXteXqegF5/VfpihhLdt4C3DWpP
	 zNfLS+1vK/eECi+OWLTr53eirrGoInxdRQBV4cF6u9pmZ+1EuE+kmYCSmVzpXWoy/9
	 O0BtKeXrC1myQ==
Date: Sat, 16 Sep 2023 16:39:48 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH] RISC-V: Probe misaligned access speed in parallel
Message-ID: <ZQVp1PJb+HuEdu4L@xhacker>
References: <20230915184904.1976183-1-evan@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230915184904.1976183-1-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230916_015150_935374_EF5584A4 
X-CRM114-Status: GOOD (  31.51  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 15, 2023 at 11:49:03AM -0700, Evan Green wrote:
> Probing for misaligned access speed takes about 0.06 seconds. On a
> system with 64 cores, doing this in smp_callin() means it's done
> serially, extending boot time by 3.8 seconds. That's a lot of boot time.
> 
> Instead of measuring each CPU serially, let's do the measurements on
> all CPUs in parallel. If we disable preemption on all CPUs, the
> jiffies stop ticking, so we can do this in stages of 1) everybody
> except core 0, then 2) core 0.
> 
> The measurement call in smp_callin() stays around, but is now
> conditionalized to only run if a new CPU shows up after the round of
> in-parallel measurements has run. The goal is to have the measurement
> call not run during boot or suspend/resume, but only on a hotplug
> addition.
> 
> Signed-off-by: Evan Green <evan@rivosinc.com>

Reported-by: Jisheng Zhang <jszhang@kernel.org>
> 
> ---
> 
> Jisheng, I didn't add your Tested-by tag since the patch evolved from
> the one you tested. Hopefully this one brings you the same result.
> 
> ---
>  arch/riscv/include/asm/cpufeature.h |  3 ++-
>  arch/riscv/kernel/cpufeature.c      | 28 +++++++++++++++++++++++-----
>  arch/riscv/kernel/smpboot.c         | 11 ++++++++++-
>  3 files changed, 35 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> index d0345bd659c9..19e7817eba10 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -30,6 +30,7 @@ DECLARE_PER_CPU(long, misaligned_access_speed);
>  /* Per-cpu ISA extensions. */
>  extern struct riscv_isainfo hart_isa[NR_CPUS];
>  
> -void check_unaligned_access(int cpu);
> +extern bool misaligned_speed_measured;
> +int check_unaligned_access(void *unused);
>  
>  #endif
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 1cfbba65d11a..8eb36e1dfb95 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -42,6 +42,9 @@ struct riscv_isainfo hart_isa[NR_CPUS];
>  /* Performance information */
>  DEFINE_PER_CPU(long, misaligned_access_speed);
>  
> +/* Boot-time in-parallel unaligned access measurement has occurred. */
> +bool misaligned_speed_measured;

This var can be avoided, see below.

> +
>  /**
>   * riscv_isa_extension_base() - Get base extension word
>   *
> @@ -556,8 +559,9 @@ unsigned long riscv_get_elf_hwcap(void)
>  	return hwcap;
>  }
>  
> -void check_unaligned_access(int cpu)
> +int check_unaligned_access(void *unused)
>  {
> +	int cpu = smp_processor_id();
>  	u64 start_cycles, end_cycles;
>  	u64 word_cycles;
>  	u64 byte_cycles;
> @@ -571,7 +575,7 @@ void check_unaligned_access(int cpu)
>  	page = alloc_pages(GFP_NOWAIT, get_order(MISALIGNED_BUFFER_SIZE));
>  	if (!page) {
>  		pr_warn("Can't alloc pages to measure memcpy performance");
> -		return;
> +		return 0;
>  	}
>  
>  	/* Make an unaligned destination buffer. */
> @@ -643,15 +647,29 @@ void check_unaligned_access(int cpu)
>  
>  out:
>  	__free_pages(page, get_order(MISALIGNED_BUFFER_SIZE));
> +	return 0;
> +}
> +
> +static void check_unaligned_access_nonboot_cpu(void *param)
> +{
> +	if (smp_processor_id() != 0)
> +		check_unaligned_access(param);
>  }
>  
> -static int check_unaligned_access_boot_cpu(void)
> +static int check_unaligned_access_all_cpus(void)
>  {
> -	check_unaligned_access(0);
> +	/* Check everybody except 0, who stays behind to tend jiffies. */
> +	on_each_cpu(check_unaligned_access_nonboot_cpu, NULL, 1);
> +
> +	/* Check core 0. */
> +	smp_call_on_cpu(0, check_unaligned_access, NULL, true);
> +
> +	/* Boot-time measurements are complete. */
> +	misaligned_speed_measured = true;
>  	return 0;
>  }
>  
> -arch_initcall(check_unaligned_access_boot_cpu);
> +arch_initcall(check_unaligned_access_all_cpus);
>  
>  #ifdef CONFIG_RISCV_ALTERNATIVE
>  /*
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index 1b8da4e40a4d..39322ae20a75 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -27,6 +27,7 @@
>  #include <linux/sched/mm.h>
>  #include <asm/cpu_ops.h>
>  #include <asm/cpufeature.h>
> +#include <asm/hwprobe.h>
>  #include <asm/irq.h>
>  #include <asm/mmu_context.h>
>  #include <asm/numa.h>
> @@ -246,7 +247,15 @@ asmlinkage __visible void smp_callin(void)
>  
>  	numa_add_cpu(curr_cpuid);
>  	set_cpu_online(curr_cpuid, 1);
> -	check_unaligned_access(curr_cpuid);
> +
> +	/*
> +	 * Boot-time misaligned access speed measurements are done in parallel
> +	 * in an initcall. Only measure here for hotplug.
> +	 */
> +	if (misaligned_speed_measured &&
> +	    (per_cpu(misaligned_access_speed, curr_cpuid) == RISCV_HWPROBE_MISALIGNED_UNKNOWN)) {

I believe this check is for cpu not-booted during boot time but hotplug in
after that, if so I'm not sure whether
misaligned_speed_measured can be replaced with
(system_state == SYSTEM_RUNNING)
then we don't need misaligned_speed_measured at all.

> +		check_unaligned_access(NULL);
> +	}
>  
>  	if (has_vector()) {
>  		if (riscv_v_setup_vsize())
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
