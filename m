Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131C6C4828F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Feb 2024 18:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=673rX/OEqdCV0a6wQ6YesEUWWjeTqokOeDw8efxy+u4=; b=GzNBSssOWCYvh8
	aCmQCQ0HWu5ZvUq5PRPXqD/yDkg1oSFA9Xf8GjyGSYPjEp4DvJ4x3PGdKe9+OMVjtCVmekG/Yob+O
	6q85xjJgD3dPALnfyJsbjDyoOtjpKfOJjZD+3EiDZUXxqamUb66AYdQJQKNOrH31u9K7e5JAS8D3B
	NUTHygb0WQHqYrzdndzjysgB4/RD3fld0DVaFW2f2JxGXsUOigfkru15EC+cSorXUDc6T3f2BWcgx
	v44eh2RV/P0KAXMc2mgOgEEUvXO1fwh/3ZCYXk1e5LDltGIPXS4n9VQAB6kFzMkFB8asVj/binuh5
	iGVtyYnyL46JUK8zgE9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXn52-0000000BZ0u-3sq4;
	Wed, 07 Feb 2024 18:55:32 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXn4z-0000000BYzW-1NRe
	for linux-riscv@lists.infradead.org;
	Wed, 07 Feb 2024 18:55:30 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-68c814135a9so5023656d6.1
        for <linux-riscv@lists.infradead.org>; Wed, 07 Feb 2024 10:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1707332126; x=1707936926; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hVo14LHJX9hV59s9XRS5nW47IOrE1cAZjBWBuKBM0uY=;
        b=BQJPa3W4ZQdkQpN8EtqwF2nnII+prpjANCDI8RAEVGhMtD/qaL+8riJFGNJ6BxdO9C
         Yjqq8nqhL+HEd94aQAbFiZuXdPCEU/20aNCeaE2h7bH5+YJlfZ/ULHMle3dR3LxD09MH
         9x3bZi9eDGKX0jz+g6BIWDutiul4PyHNuxy0qMuRO1dLl9RTc1x19XHKzDniXgzDwkJ7
         5xjxqQIkxpf3ckHdumE6Vq/s15VPrRXiW8/34PdhzLK+skM9X8MTwlsxEIIIilmmY5eX
         2lPJ5GvlB5lkdzTgzv0SUCtCrSOd9tk9jzEbgEIlQ2JpATmbFTsWqBoaxU5Zf3GoXrNk
         m66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707332126; x=1707936926;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hVo14LHJX9hV59s9XRS5nW47IOrE1cAZjBWBuKBM0uY=;
        b=t6Z2sYhIwwyNLSP0D1xR8exKCKx9Zj9W3zcLmU20JkZeDSthU/ygfpGXKJikFBqkYx
         jAzrKjfhNMCV+XwFaqgbEZD6TfzXqkm1oKzOXlUmWntrgCTBF0kogrCh8v0LGJyB0ul9
         j4OTipS8IygsQQwSXqptM924Rd6MkMn0EOeYXBD+xHF5iFdZTqWtGigm3yneUUjmG8cj
         EoPf4B5IMKzwP9VYUXdiZQHhLUJ4JZnwD569HxsMEmvSXr2YV7pwJfV1WAKQ/jOzyWj4
         yHaoZmbN67uIGj2bwIN8A+leif1T/Ka8ZAgfeUpEEQeGHlEftcwQidF2rvrvMYKEfk89
         EArA==
X-Gm-Message-State: AOJu0YxXuO2poY6oaJjaG8RH14kBFiHkm+lJipCczaKqESngOVKwTtes
	6FDBif5XcbMaPh7ot9xyVM+l7ymCLu+x6/MiMqMHNGKf1I6bmlzCT+5nP1oxZ9k=
X-Google-Smtp-Source: AGHT+IEEWAotBdu+h1jvmSCvyQLUMyrS3eTCBTnK/But89mqLeqP9OI6OnXuxHGLlDBsN77wJPZV1Q==
X-Received: by 2002:a05:6214:f03:b0:68c:c345:dc0c with SMTP id gw3-20020a0562140f0300b0068cc345dc0cmr1121961qvb.41.1707332126550;
        Wed, 07 Feb 2024 10:55:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW3zU0fI5Rxqv1JYH04ssIiqZZNRIjwrt4vZuMBtT0rfd+kBcTBI1Zm51bqY7XMUG15j3VKxOgnwyeUHy+dZjl/9krw2T+1Dj+by5MDOWW6j4i3To+9TbdO+LkT7C0IEMdtqEszEEnItc/XlehxgJgMBW/ZlUp/VgqYzLZcl5btSu8TkOicTYx3anQBAYSsyAySOsTNNC/Umoa6iJGJbyZQ3U2Ht1yac6gqNUEwZHWhnC065I4M7K3UuI0lmbUXKq7Rn8zqmM9/SKtxDO93Jp+Y3d8BVg7jzkG0dNHm8wzwSaP45i/8wZ3otlhkUbzcY96NKi3ofF1WMlXRB5j0oo5pfdoa4xvco2nk57rqG1SScHQaLeuWqMgR5bfMsxauk8v53eau2coP8lGQdhB7IhcmdjLhPQqhWkmeyciEs5ey
Received: from [100.64.0.1] ([170.85.8.192])
        by smtp.gmail.com with ESMTPSA id om6-20020a0562143d8600b0068cb05e910fsm850867qvb.5.2024.02.07.10.55.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Feb 2024 10:55:26 -0800 (PST)
Message-ID: <5849b66f-d7c4-4011-b556-10725ac0958e@sifive.com>
Date: Wed, 7 Feb 2024 12:55:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/2] riscv: Include riscv_set_icache_flush_ctx prctl
Content-Language: en-US
To: Charlie Jenkins <charlie@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Atish Patra <atishp@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>
References: <20240124-fencei-v10-0-a25971f4301d@rivosinc.com>
 <20240124-fencei-v10-1-a25971f4301d@rivosinc.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240124-fencei-v10-1-a25971f4301d@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_105529_611831_C51DBBF5 
X-CRM114-Status: GOOD (  37.85  )
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

Hi Charlie,

On 2024-01-24 10:23 PM, Charlie Jenkins wrote:
> Support new prctl with key PR_RISCV_SET_ICACHE_FLUSH_CTX to enable
> optimization of cross modifying code. This prctl enables userspace code
> to use icache flushing instructions such as fence.i with the guarantee
> that the icache will continue to be clean after thread migration.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/mmu.h       |  2 ++
>  arch/riscv/include/asm/processor.h |  7 ++++
>  arch/riscv/include/asm/switch_to.h | 13 ++++++++
>  arch/riscv/mm/cacheflush.c         | 67 ++++++++++++++++++++++++++++++++++++++
>  arch/riscv/mm/context.c            | 13 ++++++--
>  include/uapi/linux/prctl.h         |  6 ++++
>  kernel/sys.c                       |  6 ++++
>  7 files changed, 111 insertions(+), 3 deletions(-)
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
> index a8509cc31ab2..816cdc2395f4 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -123,6 +123,10 @@ struct thread_struct {
>  	struct __riscv_v_ext_state vstate;
>  	unsigned long align_ctl;
>  	struct __riscv_v_ext_state kernel_vstate;
> +#ifdef CONFIG_SMP
> +	bool force_icache_flush;
> +	unsigned int prev_cpu;
> +#endif
>  };
>  
>  /* Whitelist the fstate from the task_struct for hardened usercopy */
> @@ -184,6 +188,9 @@ extern int set_unalign_ctl(struct task_struct *tsk, unsigned int val);
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
> index 7efdb0584d47..ac99ab64499c 100644
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
> @@ -72,14 +73,26 @@ static __always_inline bool has_fpu(void) { return false; }
>  extern struct task_struct *__switch_to(struct task_struct *,
>  				       struct task_struct *);
>  
> +static inline bool switch_to_should_flush_icache(struct task_struct *task)
> +{
> +	bool stale_mm = task->mm && (task->mm->context.force_icache_flush);

No parentheses needed here.

> +	bool stale_thread = task->thread.force_icache_flush;
> +	bool thread_migrated = smp_processor_id() != task->thread.prev_cpu;

This fails to compile when SMP is disabled:

In file included from arch/riscv/kernel/ptrace.c:14:
./arch/riscv/include/asm/switch_to.h:78:49: error: no member named
'force_icache_flush' in 'mm_context_t'
        bool stale_mm = task->mm && (task->mm->context.force_icache_flush);
                                     ~~~~~~~~~~~~~~~~~ ^
./arch/riscv/include/asm/switch_to.h:79:35: error: no member named
'force_icache_flush' in 'struct thread_struct'
        bool stale_thread = task->thread.force_icache_flush;
                            ~~~~~~~~~~~~ ^
./arch/riscv/include/asm/switch_to.h:80:60: error: no member named 'prev_cpu' in
'struct thread_struct'
        bool thread_migrated = smp_processor_id() != task->thread.prev_cpu;
                                                     ~~~~~~~~~~~~ ^
  CC      arch/riscv/kernel/sys_hwprobe.o

> +
> +	return thread_migrated && (stale_mm || stale_thread);
> +}
> +
>  #define switch_to(prev, next, last)			\
>  do {							\
>  	struct task_struct *__prev = (prev);		\
>  	struct task_struct *__next = (next);		\
> +	__next->thread.prev_cpu = smp_processor_id();	\

Shouldn't this instead update __prev (the task being scheduled out)?

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
> index 55a34f2020a8..2d5e1575f6c1 100644
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
> @@ -152,3 +153,69 @@ void __init riscv_init_cbo_blocksizes(void)
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
> + * * %PR_RISCV_CTX_SW_FENCEI_ON: Allow fence.i in userspace.
> + *
> + * * %PR_RISCV_CTX_SW_FENCEI_OFF: Disallow fence.i in userspace. All threads in
> + *   a process will be affected when ``scope == PR_RISCV_SCOPE_PER_PROCESS``.
> + *   Therefore, caution must be taken -- only use this flag when you can
> + *   guarantee that no thread in the process will emit fence.i from this point
> + *   onward.
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
> + * consistent with instruction storage. Note this does not enforce any
> + * guarantees outside of migration. If a thread modifies an instruction that
> + * another thread may attempt to execute, the other thread must still emit an
> + * icache flushing instruction before attempting to execute the potentially
> + * modified instruction. This must be performed by the userspace program.
> + *
> + * In per-thread context (eg. ``scope == PR_RISCV_SCOPE_PER_THREAD``), only the
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

At some point you dropped the implementation for PR_RISCV_CTX_SW_FENCEI_OFF.
It's still documented, so I don't think that was intentional.

Also, PR_RISCV_CTX_SW_FENCEI_OFF needs to mark the icache on all other CPUs as
stale, as in flush_icache_mm(). Consider the following sequence:
 1. Migrate from CPU A to CPU B
 2. CMODX on CPU B
 3. fence.i in userspace on CPU B
 4. prctl(PR_RISCV_CTX_SW_FENCEI_OFF) on CPU B
 5. Migrate back to CPU A -- force_icache_flush is false, no flush happens
 6. Execute the modified code -- fails, because CPU A's I$ never got flushed

> +	}
> +#endif
> +	return 0;

This makes the prtcl() call silently succeed for invalid ctx values, whereas it
should fail for those instead.

Regards,
Samuel

> +}
> diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> index 217fd4de6134..5cabbc449080 100644
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
> @@ -297,7 +298,8 @@ static inline void set_mm(struct mm_struct *prev,
>   *
>   * The "cpu" argument must be the current local CPU number.
>   */
> -static inline void flush_icache_deferred(struct mm_struct *mm, unsigned int cpu)
> +static inline void flush_icache_deferred(struct mm_struct *mm, unsigned int cpu,
> +					 struct task_struct *task)
>  {
>  #ifdef CONFIG_SMP
>  	cpumask_t *mask = &mm->context.icache_stale_mask;
> @@ -309,7 +311,12 @@ static inline void flush_icache_deferred(struct mm_struct *mm, unsigned int cpu)
>  		 * This pairs with a barrier in flush_icache_mm.
>  		 */
>  		smp_mb();
> -		local_flush_icache_all();
> +
> +		/*
> +		 * If cache will be flushed in switch_to, no need to flush here.
> +		 */
> +		if (!(task && switch_to_should_flush_icache(task)))
> +			local_flush_icache_all();
>  	}
>  
>  #endif
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
