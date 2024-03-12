Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5972AC54E58
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 20:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N4tAmRJoLxN75cyi+cgjzBf9Qo7BC9bYr3mdsJdG3dg=; b=DYd2YDnY/11dLO
	68yxX88ZSYqToH24sXBv3epQCRtaH2UE+oazdUhZa1iREvokd89q8qTPa2M6yy+ZEzRzaRt8cizDb
	tumWR+IorD+jpqU1aclCmkxjhV3GnI1X4U0N9fYLkz/qdqQdBGQe3XEIeAOIpBQpQXjraBzV217FC
	T09J5jOjpm0EgyGsAm3gf6dpgcTIjilmokXhr6jtm5y4j/7uemmnPut8ImcYdCIR5D8wF8SgzlIpN
	12Ae/eXl+goEj7UGg1gvD+ovA2ZCUNHSBhpOozVIw07rLM+noKwjOvGYZdOZ1rsWo8w8pwZY/CjFo
	QACzYbMpoeiNl8NlcD9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk8Tm-00000007QWY-13wa;
	Tue, 12 Mar 2024 20:12:06 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk8Ti-00000007QV2-1FSm
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 20:12:03 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7884a9a404fso328766085a.3
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 13:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710274319; x=1710879119; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MnHHGL8Rk7CC2xf+iGr8uOaDj7elDk3WlKFGmrHlJpc=;
        b=i/ssUyd6GkrrFL+Bt3t7G25C9sutdISpBVZxTd0WSjFKqAmpa3BbcYUgBvjBYoLNPC
         laEldsSdNd/IxSKGDJWCqVWyeJEHzd/6U7E9zMtIpb7dg42qENN2yNEGT0fkvtH367Hh
         3FPKM64Y11zwqIzy8EHpBThkObK4jA7HoiqUMaCcJiEqNCL1iu6DIBRl0kSEZluWbEIL
         s5BGz8xK9EOaE2xvjB3YCpcCgymfJkWyIi/NClsNT/ggWCrM+GDm0cAaSKXcX3XLJoyP
         28xn4QrOneNJD/yCsD19wJraBNglZ5Q0bXcCfifcibyyRPGVw/xeT+th5HcYiovoCjDy
         ekNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710274319; x=1710879119;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MnHHGL8Rk7CC2xf+iGr8uOaDj7elDk3WlKFGmrHlJpc=;
        b=wTnfLW+35KbEq13wtPclTTRe7GdB7G6mQJoNX/mWFZkiR8POrPTw4Hxq6XT4V47HeH
         d9zfFu0o3vFDHOfvreysiFmTgV10w6XPz7xFD0fo2HL7aVgiFqIXJ7sF9fmGoXiVGiId
         v3h2pyORY4EDfn7yH+v1W5Hs9vcQge+ebB4wN0B3wCGLOdoweSHNq3RyNSOdzCmUvcUj
         Jjp2O6+zqhlwQ/ybBkjiXKrCWxG32d2slir7pOx0j26kbiYXMSiYy2NYB9I2zu9mMwfJ
         xYHa9A7uPxNd8TuKXXh6etWTnYiUdoWIMUX9mXm6pPomi5nbHI+Q6Rgc6vykwKFjCpjI
         oBKA==
X-Gm-Message-State: AOJu0Yxt0roh8HHAY4qcVVhgCZfp8ZY69BkQEO8jOx3D6vu0iHl6eJTv
	zFOn4VAgI6LrynLG3IEppX2H5K6dLsfkvT/KJkWbJ5BlWDQFOt21pRl7SWRxHLA=
X-Google-Smtp-Source: AGHT+IHn+D2b3VFoUuC25A22wToCBAG5NyxdF+v1kIMRKU5wW8QZXDPLrob9xhKs09oUjOJN2QouMA==
X-Received: by 2002:a05:620a:4888:b0:788:22c7:edd8 with SMTP id ea8-20020a05620a488800b0078822c7edd8mr13718199qkb.5.1710274319269;
        Tue, 12 Mar 2024 13:11:59 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.8.176])
        by smtp.gmail.com with ESMTPSA id a23-20020a05620a02f700b0078821519902sm3988608qko.20.2024.03.12.13.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 13:11:58 -0700 (PDT)
Message-ID: <febde3f3-7df6-4c9a-a1b5-0fae92e018df@sifive.com>
Date: Tue, 12 Mar 2024 15:11:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/4] riscv: Include riscv_set_icache_flush_ctx prctl
Content-Language: en-US
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Atish Patra <atishp@rivosinc.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>,
 Alexandre Ghiti <alex@ghiti.fr>
References: <20240312-fencei-v12-0-0f340f004ce7@rivosinc.com>
 <20240312-fencei-v12-2-0f340f004ce7@rivosinc.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240312-fencei-v12-2-0f340f004ce7@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_131202_450409_983E3B87 
X-CRM114-Status: GOOD (  41.30  )
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

On 2024-03-12 2:47 PM, Charlie Jenkins wrote:
> Support new prctl with key PR_RISCV_SET_ICACHE_FLUSH_CTX to enable
> optimization of cross modifying code. This prctl enables userspace code
> to use icache flushing instructions such as fence.i with the guarantee
> that the icache will continue to be clean after thread migration.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/mmu.h       |  2 +
>  arch/riscv/include/asm/processor.h | 10 ++++
>  arch/riscv/include/asm/switch_to.h | 23 ++++++++++
>  arch/riscv/mm/cacheflush.c         | 94 ++++++++++++++++++++++++++++++++++++++
>  arch/riscv/mm/context.c            | 17 +++++--
>  include/uapi/linux/prctl.h         |  6 +++
>  kernel/sys.c                       |  6 +++
>  7 files changed, 153 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
> index 355504b37f8e..60be458e94da 100644
> --- a/arch/riscv/include/asm/mmu.h
> +++ b/arch/riscv/include/asm/mmu.h
> @@ -19,6 +19,8 @@ typedef struct {
>  #ifdef CONFIG_SMP
>  	/* A local icache flush is needed before user execution can resume. */
>  	cpumask_t icache_stale_mask;
> +	/* Force local icache flush on all migrations. */
> +	bool force_icache_flush;
>  #endif
>  #ifdef CONFIG_BINFMT_ELF_FDPIC
>  	unsigned long exec_fdpic_loadmap;
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> index a8509cc31ab2..cca62013c3c0 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -69,6 +69,7 @@
>  #endif
>  
>  #ifndef __ASSEMBLY__
> +#include <linux/cpumask.h>
>  
>  struct task_struct;
>  struct pt_regs;
> @@ -123,6 +124,12 @@ struct thread_struct {
>  	struct __riscv_v_ext_state vstate;
>  	unsigned long align_ctl;
>  	struct __riscv_v_ext_state kernel_vstate;
> +#ifdef CONFIG_SMP
> +	/* Flush the icache on migration */
> +	bool force_icache_flush;
> +	/* A forced icache flush is not needed if migrating to the previous cpu. */
> +	unsigned int prev_cpu;
> +#endif
>  };
>  
>  /* Whitelist the fstate from the task_struct for hardened usercopy */
> @@ -184,6 +191,9 @@ extern int set_unalign_ctl(struct task_struct *tsk, unsigned int val);
>  #define GET_UNALIGN_CTL(tsk, addr)	get_unalign_ctl((tsk), (addr))
>  #define SET_UNALIGN_CTL(tsk, val)	set_unalign_ctl((tsk), (val))
>  
> +#define RISCV_SET_ICACHE_FLUSH_CTX(arg1, arg2)	riscv_set_icache_flush_ctx(arg1, arg2)
> +extern int riscv_set_icache_flush_ctx(unsigned long ctx, unsigned long per_thread);
> +
>  #endif /* __ASSEMBLY__ */
>  
>  #endif /* _ASM_RISCV_PROCESSOR_H */
> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
> index 7efdb0584d47..7594df37cc9f 100644
> --- a/arch/riscv/include/asm/switch_to.h
> +++ b/arch/riscv/include/asm/switch_to.h
> @@ -8,6 +8,7 @@
>  
>  #include <linux/jump_label.h>
>  #include <linux/sched/task_stack.h>
> +#include <linux/mm_types.h>
>  #include <asm/vector.h>
>  #include <asm/cpufeature.h>
>  #include <asm/processor.h>
> @@ -72,14 +73,36 @@ static __always_inline bool has_fpu(void) { return false; }
>  extern struct task_struct *__switch_to(struct task_struct *,
>  				       struct task_struct *);
>  
> +static inline bool switch_to_should_flush_icache(struct task_struct *task)
> +{
> +#ifdef CONFIG_SMP
> +	bool stale_mm = task->mm && task->mm->context.force_icache_flush;
> +	bool stale_thread = task->thread.force_icache_flush;
> +	bool thread_migrated = smp_processor_id() != task->thread.prev_cpu;
> +
> +	return thread_migrated && (stale_mm || stale_thread);
> +#else
> +	return false;
> +#endif
> +}
> +
> +#ifdef CONFIG_SMP
> +#define __set_prev_cpu(thread) ((thread).prev_cpu = smp_processor_id())
> +#else
> +#define __set_prev_cpu(thread)
> +#endif
> +
>  #define switch_to(prev, next, last)			\
>  do {							\
>  	struct task_struct *__prev = (prev);		\
>  	struct task_struct *__next = (next);		\
> +	__set_prev_cpu(__prev->thread);			\
>  	if (has_fpu())					\
>  		__switch_to_fpu(__prev, __next);	\
>  	if (has_vector())					\
>  		__switch_to_vector(__prev, __next);	\
> +	if (switch_to_should_flush_icache(__next))	\
> +		local_flush_icache_all();		\
>  	((last) = __switch_to(__prev, __next));		\
>  } while (0)
>  
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index 55a34f2020a8..329b95529580 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -5,6 +5,7 @@
>  
>  #include <linux/acpi.h>
>  #include <linux/of.h>
> +#include <linux/prctl.h>
>  #include <asm/acpi.h>
>  #include <asm/cacheflush.h>
>  
> @@ -152,3 +153,96 @@ void __init riscv_init_cbo_blocksizes(void)
>  	if (cboz_block_size)
>  		riscv_cboz_block_size = cboz_block_size;
>  }
> +
> +/**
> + * riscv_set_icache_flush_ctx() - Enable/disable icache flushing instructions in
> + * userspace.
> + * @ctx: Set the type of icache flushing instructions permitted/prohibited in
> + *	 userspace. Supported values described below.
> + *
> + * Supported values for ctx:
> + *
> + * * %PR_RISCV_CTX_SW_FENCEI_ON: Allow fence.i in user space.
> + *
> + * * %PR_RISCV_CTX_SW_FENCEI_OFF: Disallow fence.i in user space. All threads in
> + *   a process will be affected when ``scope == PR_RISCV_SCOPE_PER_PROCESS``.
> + *   Therefore, caution must be taken; use this flag only when you can guarantee
> + *   that no thread in the process will emit fence.i from this point onward.
> + *
> + * @scope: Set scope of where icache flushing instructions are allowed to be
> + *	   emitted. Supported values described below.
> + *
> + * Supported values for scope:
> + *
> + * * %PR_RISCV_SCOPE_PER_PROCESS: Ensure the icache of any thread in this process
> + *                               is coherent with instruction storage upon
> + *                               migration.
> + *
> + * * %PR_RISCV_SCOPE_PER_THREAD: Ensure the icache of the current thread is
> + *                              coherent with instruction storage upon
> + *                              migration.
> + *
> + * When ``scope == PR_RISCV_SCOPE_PER_PROCESS``, all threads in the process are
> + * permitted to emit icache flushing instructions. Whenever any thread in the
> + * process is migrated, the corresponding hart's icache will be guaranteed to be
> + * consistent with instruction storage. This does not enforce any guarantees
> + * outside of migration. If a thread modifies an instruction that another thread
> + * may attempt to execute, the other thread must still emit an icache flushing
> + * instruction before attempting to execute the potentially modified
> + * instruction. This must be performed by the user-space program.
> + *
> + * In per-thread context (eg. ``scope == PR_RISCV_SCOPE_PER_THREAD``) only the
> + * thread calling this function is permitted to emit icache flushing
> + * instructions. When the thread is migrated, the corresponding hart's icache
> + * will be guaranteed to be consistent with instruction storage.
> + *
> + * On kernels configured without SMP, this function is a nop as migrations
> + * across harts will not occur.
> + */
> +int riscv_set_icache_flush_ctx(unsigned long ctx, unsigned long scope)
> +{
> +#ifdef CONFIG_SMP
> +	switch (ctx) {
> +	case PR_RISCV_CTX_SW_FENCEI_ON:
> +		switch (scope) {
> +		case PR_RISCV_SCOPE_PER_PROCESS:
> +			current->mm->context.force_icache_flush = true;
> +			break;
> +		case PR_RISCV_SCOPE_PER_THREAD:
> +			current->thread.force_icache_flush = true;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +		break;
> +	case PR_RISCV_CTX_SW_FENCEI_OFF:
> +		switch (scope) {
> +		case PR_RISCV_SCOPE_PER_PROCESS:
> +		case PR_RISCV_SCOPE_PER_THREAD:
> +			bool stale_cpu;
> +			cpumask_t *mask;
> +
> +			current->mm->context.force_icache_flush = false;

You still need (at least partially) separate logic for the two scopes, because
now you're resetting the wrong flag here.

> +
> +			/*
> +			 * Mark every other hart's icache as needing a flush for
> +			 * this MM. Maintain the previous value of the current
> +			 * cpu to handle the case when this function is called
> +			 * concurrently on different harts.
> +			 */
> +			mask = &current->mm->context.icache_stale_mask;
> +			stale_cpu = cpumask_test_cpu(smp_processor_id(), mask);
> +
> +			cpumask_setall(mask);
> +			assign_bit(cpumask_check(smp_processor_id()), cpumask_bits(mask), stale_cpu);
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +#endif
> +	return 0;

I think I brought this up a couple of revisions ago (sorry for not mentioning it
the last time), but you still need parameter validation for CONFIG_SMP=n. Yes,
the call is currently a no-op for the combinations of ctx and scope defined so
far, but if we ever add a new ctx (say, something for Zjid), it may need to do
something on CONFIG_SMP=n, and older kernels will need to indicate that the new
ctx is not supported.

> +}
> diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> index 217fd4de6134..3e27e5c8c3c6 100644
> --- a/arch/riscv/mm/context.c
> +++ b/arch/riscv/mm/context.c
> @@ -15,6 +15,7 @@
>  #include <asm/tlbflush.h>
>  #include <asm/cacheflush.h>
>  #include <asm/mmu_context.h>
> +#include <asm/switch_to.h>
>  
>  #ifdef CONFIG_MMU
>  
> @@ -297,21 +298,27 @@ static inline void set_mm(struct mm_struct *prev,
>   *
>   * The "cpu" argument must be the current local CPU number.
>   */
> -static inline void flush_icache_deferred(struct mm_struct *mm, unsigned int cpu)
> +static inline void flush_icache_deferred(struct mm_struct *mm, unsigned int cpu,
> +					 struct task_struct *task)
>  {
>  #ifdef CONFIG_SMP
>  	cpumask_t *mask = &mm->context.icache_stale_mask;
>  
> -	if (cpumask_test_cpu(cpu, mask)) {
> +	if (cpumask_test_and_clear_cpu(cpu, mask)) {
>  		cpumask_clear_cpu(cpu, mask);

Now that you only have one mask, this is clearing the same bit twice.

Regards,
Samuel

> +
>  		/*
>  		 * Ensure the remote hart's writes are visible to this hart.
>  		 * This pairs with a barrier in flush_icache_mm.
>  		 */
>  		smp_mb();
> -		local_flush_icache_all();
> -	}
>  
> +		/*
> +		 * If cache will be flushed in switch_to, no need to flush here.
> +		 */
> +		if (!(task && switch_to_should_flush_icache(task)))
> +			local_flush_icache_all();
> +	}
>  #endif
>  }
>  
> @@ -332,5 +339,5 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
>  
>  	set_mm(prev, next, cpu);
>  
> -	flush_icache_deferred(next, cpu);
> +	flush_icache_deferred(next, cpu, task);
>  }
> diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
> index 370ed14b1ae0..524d546d697b 100644
> --- a/include/uapi/linux/prctl.h
> +++ b/include/uapi/linux/prctl.h
> @@ -306,4 +306,10 @@ struct prctl_mm_map {
>  # define PR_RISCV_V_VSTATE_CTRL_NEXT_MASK	0xc
>  # define PR_RISCV_V_VSTATE_CTRL_MASK		0x1f
>  
> +#define PR_RISCV_SET_ICACHE_FLUSH_CTX	71
> +# define PR_RISCV_CTX_SW_FENCEI_ON	0
> +# define PR_RISCV_CTX_SW_FENCEI_OFF	1
> +# define PR_RISCV_SCOPE_PER_PROCESS	0
> +# define PR_RISCV_SCOPE_PER_THREAD	1
> +
>  #endif /* _LINUX_PRCTL_H */
> diff --git a/kernel/sys.c b/kernel/sys.c
> index e219fcfa112d..69afdd8b430f 100644
> --- a/kernel/sys.c
> +++ b/kernel/sys.c
> @@ -146,6 +146,9 @@
>  #ifndef RISCV_V_GET_CONTROL
>  # define RISCV_V_GET_CONTROL()		(-EINVAL)
>  #endif
> +#ifndef RISCV_SET_ICACHE_FLUSH_CTX
> +# define RISCV_SET_ICACHE_FLUSH_CTX(a, b)	(-EINVAL)
> +#endif
>  
>  /*
>   * this is where the system-wide overflow UID and GID are defined, for
> @@ -2743,6 +2746,9 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
>  	case PR_RISCV_V_GET_CONTROL:
>  		error = RISCV_V_GET_CONTROL();
>  		break;
> +	case PR_RISCV_SET_ICACHE_FLUSH_CTX:
> +		error = RISCV_SET_ICACHE_FLUSH_CTX(arg2, arg3);
> +		break;
>  	default:
>  		error = -EINVAL;
>  		break;
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
