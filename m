Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB2ACF58ED
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Sep 2024 13:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VNeLOH1FWfOrPf+AoM7ocnuGbklZg0H0h443oaFkVm8=; b=Nn0+geA18Zapty
	qQajYVXDBiEc9jk+XiOqgZVmXOeMXJKLocScb1HsyKwwzgP8MlHodebZkXSeo2S1XcbSVBfOTKzUc
	zg33zWa0aJFepfz5FuVbfhnv9rsWR4PkpMaKw5n5epYHce8CMRrF1qeUGbRiI9Y6aaEdDXSxZ8QB3
	D0xipYOxfkeYnkKFzijlLc3zH/ZHY2mg4H2b0/O/ki1EidBT0BLTt6CapEk+bVikggTAyssYVMB0v
	opEY0QlZ5cCNMNI/bu2k5FFH6OqqapxI9okfsTX1/Q3q65I14FQbDJd1dNIjtsNAGq8Sc0UEA5px+
	FyH3+wZ7dDiOehfYT/AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stSTS-00000005TXC-3hzl;
	Wed, 25 Sep 2024 13:54:34 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stSTP-00000005TWB-3cxi
	for linux-riscv@lists.infradead.org;
	Wed, 25 Sep 2024 13:54:33 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a8a789c4fc5so170590066b.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Sep 2024 06:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1727272469; x=1727877269; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sNB/FTWMXFgC6FNYR/I4iwVpyab2JktNBpcKO0l//4w=;
        b=k3CfOg/wgrN+EdW2/DmgAFh5NZKb1wkH/IXHTUPLFQrxR6PL4y8tLrkVdIgHKSmLMW
         hLeodFU2DwLFY4WlyyqedvHyNOsANBJy8M22824WWNq/nOVX0tY+Nc5IMrZHQLFF44HL
         pFHgkDENecFz/a1NUytoXsZUwoohVLbeCjK07zs7NOiZlc2nal2D6PdsiXI1ucsV1C6r
         xMr37ZlO9IqXOhlOm0XQcx1+4B0JHMMpgqeIj6reMpRUlKwhY3sjzyGGeeiD49OEPHMg
         pSlpZeuo9fNUT7Mm5ESZ6ruG78jPdl1L8KM6PGHX7Gu5J7uORN3AVCUU3gTTruzwj39U
         OZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727272470; x=1727877270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNB/FTWMXFgC6FNYR/I4iwVpyab2JktNBpcKO0l//4w=;
        b=OLAv0sutVRgpAIXDW9W9QLRcf1CCFVBsyXeVvbSOfN/Ymn9AGcgA5DbRszS3q55SDP
         cxMN9uY7+RYoGuPSqkbvdgF8xZOROm0oPKbDeNWZj5ptdNNQhmhQyVpSp5YKiY4cxWZy
         4Ak1Agh2z6hXjJXA+h19ZBq3Xo0ai1aq2+uqbhJZSZ3G7s7Mcxrx7KU8oRzeCr9hhOr1
         G4REjJA4ye3G0zDDlqfwi14yoFuQQGJzxLf5HwCLS0AdqvoReNZlMRLgKIO/kKYds+Wp
         0vcJGFgVHVDqpVoX/fs6geu14Eodgv++xE0adStWgg1WGJR0ZM5fhRMteNa0yoI43bKh
         mtCA==
X-Forwarded-Encrypted: i=1; AJvYcCXuH7IefNj7/bfm4BVcRGuptxlH3+9OueIt2l5SNAS3loFp69/D4Nt3OgdFNLtAh5/N/Xoc3pmVd4a6aA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmWUqI+S/BeA9xKihB4dFv1BqUFffaM35J+frW0xmMfpci89mf
	2vJ+WENuSgrieXWfBhV2LxRLL+YuieqSM1ri9D+oWT5soe7wuqU6tdCuEc4XfI4=
X-Google-Smtp-Source: AGHT+IEN2XB0JMyRoNcOOMIEkxwPG/sC/2MttP5xrk3hCZHIidjNVZQ908jcPyvYgV8nIcdxOcAZmQ==
X-Received: by 2002:a17:907:7ea1:b0:a75:7a8:d70c with SMTP id a640c23a62f3a-a93a1685e67mr299483066b.4.1727272469391;
        Wed, 25 Sep 2024 06:54:29 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9392f51e73sm208833666b.72.2024.09.25.06.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 06:54:28 -0700 (PDT)
Date: Wed, 25 Sep 2024 15:54:28 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	andy.chiu@sifive.com, guoren@kernel.org, christoph.muellner@vrull.eu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, lihangjing@bytedance.com, 
	dengliang.1214@bytedance.com, xieyongji@bytedance.com, chaiwen.cc@bytedance.com
Subject: Re: [PATCH v3 1/2] riscv: process: Introduce idle thread using Zawrs
 extension
Message-ID: <20240925-2acd8d9743cf40b999172b40@orel>
References: <20240925131547.42396-1-luxu.kernel@bytedance.com>
 <20240925131547.42396-2-luxu.kernel@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240925131547.42396-2-luxu.kernel@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_065431_933830_6C84752E 
X-CRM114-Status: GOOD (  32.87  )
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

On Wed, Sep 25, 2024 at 09:15:46PM GMT, Xu Lu wrote:
> The Zawrs extension introduces a new instruction WRS.NTO, which will
> register a reservation set and causes the hart to temporarily stall
> execution in a low-power state until a store occurs to the reservation
> set or an interrupt is observed.
> 
> This commit implements new version of idle thread for RISC-V via Zawrs
> extension.
> 
> Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
> Reviewed-by: Hangjing Li <lihangjing@bytedance.com>
> Reviewed-by: Liang Deng <dengliang.1214@bytedance.com>
> Reviewed-by: Wen Chai <chaiwen.cc@bytedance.com>
> ---
>  arch/riscv/Kconfig                 | 10 ++++++++
>  arch/riscv/include/asm/cpuidle.h   | 11 +-------
>  arch/riscv/include/asm/processor.h | 18 +++++++++++++
>  arch/riscv/kernel/cpu.c            |  5 ++++
>  arch/riscv/kernel/process.c        | 41 +++++++++++++++++++++++++++++-
>  5 files changed, 74 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 939ea7f6a228..56cf6000d286 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -23,6 +23,7 @@ config RISCV
>  	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
>  	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
>  	select ARCH_HAS_BINFMT_FLAT
> +	select ARCH_HAS_CPU_FINALIZE_INIT
>  	select ARCH_HAS_CURRENT_STACK_POINTER
>  	select ARCH_HAS_DEBUG_VIRTUAL if MMU
>  	select ARCH_HAS_DEBUG_VM_PGTABLE
> @@ -1153,6 +1154,15 @@ endmenu # "Power management options"
>  
>  menu "CPU Power Management"
>  
> +config RISCV_ZAWRS_IDLE
> +	bool "Idle thread using ZAWRS extensions"
> +	depends on RISCV_ISA_ZAWRS
> +	default y
> +	help
> +		Adds support to implement idle thread using ZAWRS extension.
> +
> +		If you don't know what to do here, say Y.
> +
>  source "drivers/cpuidle/Kconfig"
>  
>  source "drivers/cpufreq/Kconfig"
> diff --git a/arch/riscv/include/asm/cpuidle.h b/arch/riscv/include/asm/cpuidle.h
> index 71fdc607d4bc..94c9ecb46571 100644
> --- a/arch/riscv/include/asm/cpuidle.h
> +++ b/arch/riscv/include/asm/cpuidle.h
> @@ -10,15 +10,6 @@
>  #include <asm/barrier.h>
>  #include <asm/processor.h>
>  
> -static inline void cpu_do_idle(void)
> -{
> -	/*
> -	 * Add mb() here to ensure that all
> -	 * IO/MEM accesses are completed prior
> -	 * to entering WFI.
> -	 */
> -	mb();
> -	wait_for_interrupt();
> -}
> +void cpu_do_idle(void);
>  
>  #endif
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> index efa1b3519b23..d0dcdb7e7392 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -12,6 +12,7 @@
>  
>  #include <vdso/processor.h>
>  
> +#include <asm/insn-def.h>
>  #include <asm/ptrace.h>
>  
>  #define arch_get_mmap_end(addr, len, flags)			\
> @@ -148,6 +149,21 @@ static inline void wait_for_interrupt(void)
>  	__asm__ __volatile__ ("wfi");
>  }
>  
> +static inline void wrs_nto(unsigned long *addr)
> +{
> +	int val;
> +
> +	__asm__ __volatile__(
> +#ifdef CONFIG_64BIT
> +			"lr.d %[p], %[v]\n\t"
> +#else
> +			"lr.w %[p], %[v]\n\t"
> +#endif

val is always 32-bit since it's an int. We should always use lr.w.

> +			ZAWRS_WRS_NTO "\n\t"
> +			: [p] "=&r" (val), [v] "+A" (*addr)

What do 'p' and 'v' represent? If they are pointer and value then they're
backwards. I would just spell them out [val] and [addr].

> +			: : "memory");
> +}
> +
>  extern phys_addr_t dma32_phys_limit;
>  
>  struct device_node;
> @@ -177,6 +193,8 @@ extern int set_unalign_ctl(struct task_struct *tsk, unsigned int val);
>  #define RISCV_SET_ICACHE_FLUSH_CTX(arg1, arg2)	riscv_set_icache_flush_ctx(arg1, arg2)
>  extern int riscv_set_icache_flush_ctx(unsigned long ctx, unsigned long per_thread);
>  
> +extern void select_idle_routine(void);
> +
>  #endif /* __ASSEMBLY__ */
>  
>  #endif /* _ASM_RISCV_PROCESSOR_H */
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index f6b13e9f5e6c..97a7144fa6cd 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -23,6 +23,11 @@ bool arch_match_cpu_phys_id(int cpu, u64 phys_id)
>  	return phys_id == cpuid_to_hartid_map(cpu);
>  }
>  
> +void __init arch_cpu_finalize_init(void)
> +{
> +	select_idle_routine();
> +}

Is there a reason we need to do this at arch_cpu_finalize_init() time?
This seems like the type of thing we have typically done at the bottom of
setup_arch().

> +
>  /*
>   * Returns the hart ID of the given device tree node, or -ENODEV if the node
>   * isn't an enabled and valid RISC-V hart node.
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index e4bc61c4e58a..77769965609e 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -15,6 +15,7 @@
>  #include <linux/tick.h>
>  #include <linux/ptrace.h>
>  #include <linux/uaccess.h>
> +#include <linux/static_call.h>
>  
>  #include <asm/unistd.h>
>  #include <asm/processor.h>
> @@ -35,11 +36,49 @@ EXPORT_SYMBOL(__stack_chk_guard);
>  
>  extern asmlinkage void ret_from_fork(void);
>  
> -void noinstr arch_cpu_idle(void)
> +static __cpuidle void default_idle(void)
> +{
> +	/*
> +	 * Add mb() here to ensure that all
> +	 * IO/MEM accesses are completed prior
> +	 * to entering WFI.
> +	 */
> +	mb();
> +	wait_for_interrupt();
> +}
> +
> +static __cpuidle void wrs_idle(void)
> +{
> +	/*
> +	 * Add mb() here to ensure that all
> +	 * IO/MEM accesses are completed prior
> +	 * to entering WRS.NTO.
> +	 */
> +	mb();
> +	wrs_nto(&current_thread_info()->flags);
> +}
> +
> +DEFINE_STATIC_CALL_NULL(riscv_idle, default_idle);
> +
> +void __cpuidle cpu_do_idle(void)
> +{
> +	static_call(riscv_idle)();
> +}
> +
> +void __cpuidle arch_cpu_idle(void)

Switching the section of this from '.noinstr.text' to 'cpuidle.text'
should probably be a separate patch.

>  {
>  	cpu_do_idle();
>  }
>  
> +void __init select_idle_routine(void)
> +{
> +	if (IS_ENABLED(CONFIG_RISCV_ZAWRS_IDLE) &&
> +			riscv_has_extension_likely(RISCV_ISA_EXT_ZAWRS))
> +		static_call_update(riscv_idle, wrs_idle);
> +	else
> +		static_call_update(riscv_idle, default_idle);

Do we need this 'else'? Can't we set the default at DEFINE_STATIC_CALL*
time?

> +}
> +
>  int set_unalign_ctl(struct task_struct *tsk, unsigned int val)
>  {
>  	if (!unaligned_ctl_available())
> -- 
> 2.20.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
