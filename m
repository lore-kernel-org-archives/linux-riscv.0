Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DC3C47DDB
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 22:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LhujMflyMk13aKaYZPsG9JlN+JRb0n9EC1tUnSLxb/E=; b=NaXWgFbk43XFRX
	a3hmIy7Y/+8GEzNks4Pu8tWahJwJRuN5fWnK5Y+5f6/ZKpXEPZa9YCN8ChhNa8DOCz0W4Ri7NaxCX
	yxPtPlkJ8MC+tSrqk1908hHCRQp0ggwSe+Ug2vYQ85Eu/xnstlHeHyaOppzxkkpoAxtlAeDoEsfBF
	R7Jga63TjjAqFXSiC/Xp7rEYlIMgxWva2jBwmUxhbT8lcrPlGYx9ClhI0pfwhHMymlU1LASFvbxwP
	4G8tVAZ0TwnI9I4Q0lDjDLC/hGPU2BYg9fmalOrdW+PpWwM/jXw6+xsjqGTpNeVesv5kJmT4z/YRV
	wylOLh0mqXCPzeuMOGhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSPEE-000fbG-2Q;
	Tue, 23 Jan 2024 22:26:46 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSPE2-000fPc-15
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jan 2024 22:26:37 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1d71cb97937so29326925ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 23 Jan 2024 14:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706048791; x=1706653591; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pc8A5oejpYUD2W2KPDiigNa9zXHkgchRV77l/FwyI5Q=;
        b=gcANqeax6nUY1Pu/A04qvei69SiAiCN4LSU3mZs1J/DUjb19XibPyk75KG4rfT+hwj
         Me5lxXCBjBWrr/nKofrdniz/3aHu9HffxhFXGq9MZpPOsIb+qhJx8HrOnxWoFdIZkAP9
         +b53ZL82PCbnlhLIDeYPKMdSExTMFYsXeO7ozES9Wl+qch6YoTkzz8Rg5dkH2NhojlcG
         kcHWbvypComR3LMNdgtTkaSj5Q01HKd4pgLvEAJmbDbXTu5pe1gLWJzeQ/taFD3tq3qH
         JDboIKIhIaMui4nDKn5yTJmGxh3tvgPRK0elP8bPj3A7mf8oS+e/byyCvkC93pp61UKZ
         aKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706048791; x=1706653591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pc8A5oejpYUD2W2KPDiigNa9zXHkgchRV77l/FwyI5Q=;
        b=NM0yOhtXhmXvhLxKPm9JRO4FA9mtG1X/9Qfg0JsQxAAmnXZ0xT2fX0YKUF82g/ccKe
         l/Jqc2FcmQippvuKCoWAbwkveg3gflxxsd7OBTCAQ1Tw/krRbFFRdeE+14m7pLz+9NF1
         T7N7EvbmzFx5GDWsCbktM7xaqc40gM0lzeG+Lpny1huKi8ZnDAgouJ+jkRjxbP4W6cEX
         /RCCKnDibHvwY1j6UilI6uqwCaLp0u/77ogfdZLIGaep5MhZznjIUe4qxci565NlX10M
         OaRKezvuHr7s1ZdjxoqZ5eYR3ZESfE6QQZww/uB3Pcmva4CGYiybVEiT4G8iAJYY/yIG
         dW4w==
X-Gm-Message-State: AOJu0Yw5UCGHbkq5hadGrBAagCkz7J2J42LYlN3WOeTiMbgFaKz2Oiux
	2a9HyoRYvkfWC2oE1LtFeFEgDsLHJ+C7i5z89yDoU4iCqnuwMbzq2hBakVsBXrU=
X-Google-Smtp-Source: AGHT+IFnghR+77a9/bQbcbPBKB52nAiJfqgk1c4EqblgmNbkAfEJk1wIc/rowhWUgbWLXoS5XNpZvg==
X-Received: by 2002:a17:903:228d:b0:1d7:3f0e:6c3 with SMTP id b13-20020a170903228d00b001d73f0e06c3mr4354389plh.63.1706048790841;
        Tue, 23 Jan 2024 14:26:30 -0800 (PST)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id s18-20020a170902c65200b001d7252fef6bsm6980189pls.299.2024.01.23.14.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 14:26:30 -0800 (PST)
Date: Tue, 23 Jan 2024 14:26:28 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v8 1/2] riscv: Include riscv_set_icache_flush_ctx prctl
Message-ID: <ZbA9FL9xCuJnalTn@ghost>
References: <20240116-fencei-v8-0-43a42134f021@rivosinc.com>
 <20240116-fencei-v8-1-43a42134f021@rivosinc.com>
 <bb0e976d-7475-4c42-b87e-bf1af389ba5f@ghiti.fr>
 <Zamxac0S7JnPmJdD@ghost>
 <069ac01f-9d41-45fc-b26f-38f2d8cec787@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <069ac01f-9d41-45fc-b26f-38f2d8cec787@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_142634_385342_C1BEF0C6 
X-CRM114-Status: GOOD (  53.69  )
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

On Fri, Jan 19, 2024 at 09:05:12AM +0100, Alexandre Ghiti wrote:
> On 19/01/2024 00:16, Charlie Jenkins wrote:
> > On Wed, Jan 17, 2024 at 09:42:43AM +0100, Alexandre Ghiti wrote:
> > > Hi Charlie,
> > > 
> > > On 17/01/2024 03:54, Charlie Jenkins wrote:
> > > > Support new prctl with key PR_RISCV_SET_ICACHE_FLUSH_CTX to enable
> > > > optimization of cross modifying code. This prctl enables userspace code
> > > > to use icache flushing instructions such as fence.i with the guarantee
> > > > that the icache will continue to be clean after thread migration.
> > > > 
> > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > > Reviewed-by: Atish Patra <atishp@rivosinc.com>
> > > > ---
> > > >    arch/riscv/include/asm/mmu.h         |  4 +++
> > > >    arch/riscv/include/asm/mmu_context.h |  3 ++
> > > >    arch/riscv/include/asm/processor.h   |  7 ++++
> > > >    arch/riscv/include/asm/switch_to.h   | 17 +++++++++
> > > >    arch/riscv/mm/cacheflush.c           | 67 ++++++++++++++++++++++++++++++++++++
> > > >    arch/riscv/mm/context.c              | 14 ++++++--
> > > >    include/uapi/linux/prctl.h           |  6 ++++
> > > >    kernel/sys.c                         |  6 ++++
> > > >    8 files changed, 121 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
> > > > index 355504b37f8e..f437b9a7f5b3 100644
> > > > --- a/arch/riscv/include/asm/mmu.h
> > > > +++ b/arch/riscv/include/asm/mmu.h
> > > > @@ -19,6 +19,10 @@ typedef struct {
> > > >    #ifdef CONFIG_SMP
> > > >    	/* A local icache flush is needed before user execution can resume. */
> > > >    	cpumask_t icache_stale_mask;
> > > > +	/* Force local icache flush on all migrations. */
> > > > +	bool force_icache_flush;
> > > > +	/* The most recent cpu a thread in this mm has been migrated to. */
> > > > +	unsigned int prev_cpu;
> > > 
> > > Why would we need a prev_cpu on mm? Why don't we only need to have a
> > > prev_cpu per thread, i.e. per task_struct? It makes little sense to me to
> > > have that on mm since it's shared by multiple threads (by definition), so
> > > the prev_cpu on mm could be anything.
> > > 
> > Yes you are correct, I will remove that.
> > 

To add more context to the case that I was overlooking when I wrote this
code, this is the case that fails. I will send out a new version without
prev_cpu on mm.

- Thread A is migrated to CPU A so the mm sets prev_cpu to CPU A.
- Thread B is doing cmodx on CPU B so the icache is not synchronized with instruction storage on CPU A or CPU B.
- Thread A doesn't flush the icache.
- Thread B migrates to CPU A and the icache is not flushed because prev_cpu is CPU A.
- CPU A icache is still not synchronized with instruction storage.

- Charlie

> > > >    #endif
> > > >    #ifdef CONFIG_BINFMT_ELF_FDPIC
> > > >    	unsigned long exec_fdpic_loadmap;
> > > > diff --git a/arch/riscv/include/asm/mmu_context.h b/arch/riscv/include/asm/mmu_context.h
> > > > index 7030837adc1a..195a2e90f3f9 100644
> > > > --- a/arch/riscv/include/asm/mmu_context.h
> > > > +++ b/arch/riscv/include/asm/mmu_context.h
> > > > @@ -29,6 +29,9 @@ static inline int init_new_context(struct task_struct *tsk,
> > > >    {
> > > >    #ifdef CONFIG_MMU
> > > >    	atomic_long_set(&mm->context.id, 0);
> > > > +#endif
> > > > +#ifdef CONFIG_SMP
> > > > +	mm->context.prev_cpu = tsk->thread.prev_cpu;
> > > >    #endif
> > > >    	return 0;
> > > >    }
> > > > diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> > > > index f19f861cda54..1cad05f579ad 100644
> > > > --- a/arch/riscv/include/asm/processor.h
> > > > +++ b/arch/riscv/include/asm/processor.h
> > > > @@ -84,6 +84,10 @@ struct thread_struct {
> > > >    	unsigned long vstate_ctrl;
> > > >    	struct __riscv_v_ext_state vstate;
> > > >    	unsigned long align_ctl;
> > > > +#ifdef CONFIG_SMP
> > > > +	bool force_icache_flush;
> > > > +	unsigned int prev_cpu;
> > > > +#endif
> > > >    };
> > > >    /* Whitelist the fstate from the task_struct for hardened usercopy */
> > > > @@ -145,6 +149,9 @@ extern int set_unalign_ctl(struct task_struct *tsk, unsigned int val);
> > > >    #define GET_UNALIGN_CTL(tsk, addr)	get_unalign_ctl((tsk), (addr))
> > > >    #define SET_UNALIGN_CTL(tsk, val)	set_unalign_ctl((tsk), (val))
> > > > +#define RISCV_SET_ICACHE_FLUSH_CTX(arg1, arg2)	riscv_set_icache_flush_ctx(arg1, arg2)
> > > > +extern int riscv_set_icache_flush_ctx(unsigned long ctx, unsigned long per_thread);
> > > > +
> > > >    #endif /* __ASSEMBLY__ */
> > > >    #endif /* _ASM_RISCV_PROCESSOR_H */
> > > > diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
> > > > index f90d8e42f3c7..6a94431dc193 100644
> > > > --- a/arch/riscv/include/asm/switch_to.h
> > > > +++ b/arch/riscv/include/asm/switch_to.h
> > > > @@ -8,6 +8,7 @@
> > > >    #include <linux/jump_label.h>
> > > >    #include <linux/sched/task_stack.h>
> > > > +#include <linux/mm_types.h>
> > > >    #include <asm/vector.h>
> > > >    #include <asm/cpufeature.h>
> > > >    #include <asm/processor.h>
> > > > @@ -73,6 +74,17 @@ static __always_inline bool has_fpu(void) { return false; }
> > > >    extern struct task_struct *__switch_to(struct task_struct *,
> > > >    				       struct task_struct *);
> > > > +static inline bool switch_to_should_flush_icache(struct task_struct *task)
> > > > +{
> > > > +	unsigned int cpu = smp_processor_id();
> > > > +	bool stale_mm = task->mm && (task->mm->context.force_icache_flush &&
> > > > +				     (cpu != task->mm->context.prev_cpu));
> > > > +	bool stale_thread = task->thread.force_icache_flush &&
> > > > +			    (cpu != task->thread.prev_cpu);
> > > > +
> > > > +	return stale_mm || stale_thread;
> > > 
> > > Here the test would become:
> > > 
> > > return ((task->mm && task->mm->context.force_icache_flush) ||
> > > task->thread.force_icache_flush) && (cpu != task->thread.prev_cpu);
> > > 
> > > And do we really need to check task->mm is not null?
> > mm can be null if the task is associated with a kernel thread. So the
> > check is necessary.
> 
> 
> Yes, you're right, thanks
> 
> 
> > > 
> > > > +}
> > > > +
> > > >    #define switch_to(prev, next, last)			\
> > > >    do {							\
> > > >    	struct task_struct *__prev = (prev);		\
> > > > @@ -81,7 +93,12 @@ do {							\
> > > >    		__switch_to_fpu(__prev, __next);	\
> > > >    	if (has_vector())					\
> > > >    		__switch_to_vector(__prev, __next);	\
> > > > +	if (switch_to_should_flush_icache(__next))	\
> > > > +		local_flush_icache_all();		\
> > > >    	((last) = __switch_to(__prev, __next));		\
> > > > +	__next->thread.prev_cpu = smp_processor_id();	\
> > > > +	if (__next->mm)					\
> > > > +		__next->mm->context.prev_cpu = smp_processor_id();	\
> > > >    } while (0)
> > > 
> > > And just to make sure I understand this: you moved the test in switch_to()
> > > because 2 threads with the same mm could be scheduled one after the other on
> > > the same cpu and then switch_mm() would not be called?
> > > 
> > Yes exactly.
> 
> 
> Very good catch then!
> 
> Thanks,
> 
> Alex
> 
> 
> > 
> > - Charlie
> > 
> > > >    #endif /* _ASM_RISCV_SWITCH_TO_H */
> > > > diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> > > > index 55a34f2020a8..ff545f19f07a 100644
> > > > --- a/arch/riscv/mm/cacheflush.c
> > > > +++ b/arch/riscv/mm/cacheflush.c
> > > > @@ -5,6 +5,7 @@
> > > >    #include <linux/acpi.h>
> > > >    #include <linux/of.h>
> > > > +#include <linux/prctl.h>
> > > >    #include <asm/acpi.h>
> > > >    #include <asm/cacheflush.h>
> > > > @@ -152,3 +153,69 @@ void __init riscv_init_cbo_blocksizes(void)
> > > >    	if (cboz_block_size)
> > > >    		riscv_cboz_block_size = cboz_block_size;
> > > >    }
> > > > +
> > > > +/**
> > > > + * riscv_set_icache_flush_ctx() - Enable/disable icache flushing instructions in
> > > > + * userspace.
> > > > + * @ctx: Set the type of icache flushing instructions permitted/prohibited in
> > > > + *	 userspace. Supported values described below.
> > > > + *
> > > > + * Supported values for ctx:
> > > > + *
> > > > + * * %PR_RISCV_CTX_SW_FENCEI_ON: Allow fence.i in userspace.
> > > > + *
> > > > + * * %PR_RISCV_CTX_SW_FENCEI_OFF: Disallow fence.i in userspace. When ``scope ==
> > > > + *   PR_RISCV_SCOPE_PER_PROCESS``, this will effect all threads in a process.
> > > > + *   Therefore, caution must be taken -- only use this flag when you can
> > > > + *   guarantee that no thread in the process will emit fence.i from this point
> > > > + *   onward.
> > > > + *
> > > > + * @scope: Set scope of where icache flushing instructions are allowed to be
> > > > + *	   emitted. Supported values described below.
> > > > + *
> > > > + * Supported values for scope:
> > > > + *
> > > > + * * PR_RISCV_SCOPE_PER_PROCESS: Ensure the icache of any thread in this process
> > > > + *                               is coherent with instruction storage upon
> > > > + *                               migration.
> > > > + *
> > > > + * * PR_RISCV_SCOPE_PER_THREAD: Ensure the icache of the current thread is
> > > > + *                              coherent with instruction storage upon
> > > > + *                              migration.
> > > > + *
> > > > + * When ``scope == PR_RISCV_SCOPE_PER_PROCESS``, all threads in the process are
> > > > + * permitted to emit icache flushing instructions. Whenever any thread in the
> > > > + * process is migrated, the corresponding hart's icache will be guaranteed to be
> > > > + * consistent with instruction storage. Note this does not enforce any
> > > > + * guarantees outside of migration. If a thread modifies an instruction that
> > > > + * another thread may attempt to execute, the other thread must still emit an
> > > > + * icache flushing instruction before attempting to execute the potentially
> > > > + * modified instruction. This must be performed by the userspace program.
> > > > + *
> > > > + * In per-thread context (eg. ``scope == PR_RISCV_SCOPE_PER_THREAD``), only the
> > > > + * thread calling this function is permitted to emit icache flushing
> > > > + * instructions. When the thread is migrated, the corresponding hart's icache
> > > > + * will be guaranteed to be consistent with instruction storage.
> > > > + *
> > > > + * On kernels configured without SMP, this function is a nop as migrations
> > > > + * across harts will not occur.
> > > > + */
> > > > +int riscv_set_icache_flush_ctx(unsigned long ctx, unsigned long scope)
> > > > +{
> > > > +#ifdef CONFIG_SMP
> > > > +	switch (ctx) {
> > > > +	case PR_RISCV_CTX_SW_FENCEI_ON:
> > > > +		switch (scope) {
> > > > +		case PR_RISCV_SCOPE_PER_PROCESS:
> > > > +			current->mm->context.force_icache_flush = true;
> > > > +			break;
> > > > +		case PR_RISCV_SCOPE_PER_THREAD:
> > > > +			current->thread.force_icache_flush = true;
> > > > +			break;
> > > > +		default:
> > > > +			return -EINVAL;
> > > > +		}
> > > > +	}
> > > > +#endif
> > > > +	return 0;
> > > > +}
> > > > diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> > > > index 217fd4de6134..b059dc0fae91 100644
> > > > --- a/arch/riscv/mm/context.c
> > > > +++ b/arch/riscv/mm/context.c
> > > > @@ -15,6 +15,7 @@
> > > >    #include <asm/tlbflush.h>
> > > >    #include <asm/cacheflush.h>
> > > >    #include <asm/mmu_context.h>
> > > > +#include <asm/switch_to.h>
> > > >    #ifdef CONFIG_MMU
> > > > @@ -297,19 +298,26 @@ static inline void set_mm(struct mm_struct *prev,
> > > >     *
> > > >     * The "cpu" argument must be the current local CPU number.
> > > >     */
> > > > -static inline void flush_icache_deferred(struct mm_struct *mm, unsigned int cpu)
> > > > +static inline void flush_icache_deferred(struct mm_struct *mm, unsigned int cpu,
> > > > +					 struct task_struct *task)
> > > >    {
> > > >    #ifdef CONFIG_SMP
> > > >    	cpumask_t *mask = &mm->context.icache_stale_mask;
> > > >    	if (cpumask_test_cpu(cpu, mask)) {
> > > >    		cpumask_clear_cpu(cpu, mask);
> > > > +
> > > >    		/*
> > > >    		 * Ensure the remote hart's writes are visible to this hart.
> > > >    		 * This pairs with a barrier in flush_icache_mm.
> > > >    		 */
> > > >    		smp_mb();
> > > > -		local_flush_icache_all();
> > > > +
> > > > +		/*
> > > > +		 * If cache will be flushed in switch_to, no need to flush here.
> > > > +		 */
> > > > +		if (!(task && switch_to_should_flush_icache(task)))
> > > > +			local_flush_icache_all();
> > > >    	}
> > > >    #endif
> > > > @@ -332,5 +340,5 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
> > > >    	set_mm(prev, next, cpu);
> > > > -	flush_icache_deferred(next, cpu);
> > > > +	flush_icache_deferred(next, cpu, task);
> > > >    }
> > > > diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
> > > > index 370ed14b1ae0..524d546d697b 100644
> > > > --- a/include/uapi/linux/prctl.h
> > > > +++ b/include/uapi/linux/prctl.h
> > > > @@ -306,4 +306,10 @@ struct prctl_mm_map {
> > > >    # define PR_RISCV_V_VSTATE_CTRL_NEXT_MASK	0xc
> > > >    # define PR_RISCV_V_VSTATE_CTRL_MASK		0x1f
> > > > +#define PR_RISCV_SET_ICACHE_FLUSH_CTX	71
> > > > +# define PR_RISCV_CTX_SW_FENCEI_ON	0
> > > > +# define PR_RISCV_CTX_SW_FENCEI_OFF	1
> > > > +# define PR_RISCV_SCOPE_PER_PROCESS	0
> > > > +# define PR_RISCV_SCOPE_PER_THREAD	1
> > > > +
> > > >    #endif /* _LINUX_PRCTL_H */
> > > > diff --git a/kernel/sys.c b/kernel/sys.c
> > > > index 420d9cb9cc8e..e806a8a67c36 100644
> > > > --- a/kernel/sys.c
> > > > +++ b/kernel/sys.c
> > > > @@ -146,6 +146,9 @@
> > > >    #ifndef RISCV_V_GET_CONTROL
> > > >    # define RISCV_V_GET_CONTROL()		(-EINVAL)
> > > >    #endif
> > > > +#ifndef RISCV_SET_ICACHE_FLUSH_CTX
> > > > +# define RISCV_SET_ICACHE_FLUSH_CTX(a, b)	(-EINVAL)
> > > > +#endif
> > > >    /*
> > > >     * this is where the system-wide overflow UID and GID are defined, for
> > > > @@ -2739,6 +2742,9 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
> > > >    	case PR_RISCV_V_GET_CONTROL:
> > > >    		error = RISCV_V_GET_CONTROL();
> > > >    		break;
> > > > +	case PR_RISCV_SET_ICACHE_FLUSH_CTX:
> > > > +		error = RISCV_SET_ICACHE_FLUSH_CTX(arg2, arg3);
> > > > +		break;
> > > >    	default:
> > > >    		error = -EINVAL;
> > > >    		break;
> > > > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
