Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54C6C46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jan 2024 19:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nGqi2TKMZbiXgPbnLKl6rIRMf/gCIq08UgLnC5lPj20=; b=QTRmKvL+YjB1an
	G3Cw6X4yT0J2A/3aaCI37Vnmwa+KXuaU7sFNAL/d+f4ngPEMq+Z06GJdk0jppunaXmH+iIry+Vi+X
	vFK704CXw1pxAdPKtQgxkU0vE813OM4lRqY46AdjBzNGA5mHSPYLRSxfU1MVEofz8XXMcZKu5cJPk
	20cIxWSMv+pvcmuyKcOZd3MZDSlj74Mf+QASjTK4couUP6ZWP/ZMDSCi64ld43sTmekHO3R+T2/q4
	nGjI8PxVodzfHXlpCUfheCPXNyuLmEAjY8zS6YISt7lg/dWbig0th/P/QRuisK0lvkVXMDVgfPOlv
	Dw9G7x7h0CpmHIskcq/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSixM-004sHz-20;
	Wed, 24 Jan 2024 19:30:40 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSixJ-004sHH-2L
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jan 2024 19:30:40 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1d751bc0c15so33314535ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jan 2024 11:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706124636; x=1706729436; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5UEbpXa+K1WhYj4WIljNhDZkQbLwF2tYZ2YIh8V0PBM=;
        b=A4y864hbegyNdA+46fZrxz1ghWbb58/FUauCgV7OH84qA3i3xtEIIKl/mIa9iixeMM
         gZAIWo/yF4qqUgAJwbED0kFtPCho/9DbQ2NEarsB8JBBeH4R+7NbMkwR28EhYll8iM9Y
         GX6jTYn5HVzWUHGt3vijJChPMl3jWCjIfTLJZbaJPPDhzMNZR2d19xbPiMZMauu4P/Nd
         4K7v9k7KRdz7n1oR4poDeuJSYw4ggq+wET20KAVZFEyvTTM2sMszQNj0fyXovHJU2GWu
         rSJQ9GaLP2JhY+IGeGJP6LOGPZOTDvLoOTyJR8drId45nSQ83Vgx8kpqD+w+AdyAUSYj
         Bhqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706124636; x=1706729436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UEbpXa+K1WhYj4WIljNhDZkQbLwF2tYZ2YIh8V0PBM=;
        b=b5bNPVkpKxpKaRDlaz9da85vqvcm1VA2qjFu2JQ4DemzagjQ8CC5SK2RQIv0XtqslB
         +4QuZpfxwYxrF8AjhwdCEUHHmrd+3x0RlaCn8U/hugLFmFpIlO7a5tKQWBreSCvadLkU
         UslXQmiy/XWOjNSBlxCuVBhjiN4WD7lNyDijQ+pKXTT3L3/KFtX7g9SwJNGsVsRL3iE6
         vKlFqsleUW8a2yMnpaIHxBgPZb7POGSwlzuueUr3p93/q10aKr6MYYD2QBawUMjl435f
         XcIenUeCxJGmZBzk458k7KTg9UzujYS4sTtJV5dPDZENLm38IWP9nA+5rDT4w8g2yvp9
         t89A==
X-Gm-Message-State: AOJu0YydSORv7TxSwJLIaK1NXfB3OEipFeSibWnZBkVJheZ85WGH1r6Z
	wzZF9Db1KXvQRz+yaH2GIALkkMQgbe81hgX2r2waRULM5YAu9THBfaJcnj8VlcM=
X-Google-Smtp-Source: AGHT+IGk1XnvT3RPqNVCWyaOVEaE2pSUQkhaU8okXXLrzEcWcUeoyUWyY2B6jc2c1Pb5gdSsBS+Oug==
X-Received: by 2002:a17:902:d2c4:b0:1d7:8f44:45 with SMTP id n4-20020a170902d2c400b001d78f440045mr1038299plc.0.1706124635837;
        Wed, 24 Jan 2024 11:30:35 -0800 (PST)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id 4-20020a170902e9c400b001d706e373a9sm10595766plk.292.2024.01.24.11.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 11:30:34 -0800 (PST)
Date: Wed, 24 Jan 2024 11:30:32 -0800
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
Subject: Re: [PATCH v9 1/2] riscv: Include riscv_set_icache_flush_ctx prctl
Message-ID: <ZbFlWFPFgzcxJg1z@ghost>
References: <20240123-fencei-v9-0-71411bfe8d71@rivosinc.com>
 <20240123-fencei-v9-1-71411bfe8d71@rivosinc.com>
 <7b15e9c0-58f5-4bc3-899e-671ce2c31548@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7b15e9c0-58f5-4bc3-899e-671ce2c31548@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_113037_772493_31BBC194 
X-CRM114-Status: GOOD (  45.39  )
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

On Wed, Jan 24, 2024 at 08:12:57AM +0100, Alexandre Ghiti wrote:
> Hi Charlie,
> 
> On 24/01/2024 00:29, Charlie Jenkins wrote:
> > Support new prctl with key PR_RISCV_SET_ICACHE_FLUSH_CTX to enable
> > optimization of cross modifying code. This prctl enables userspace code
> > to use icache flushing instructions such as fence.i with the guarantee
> > that the icache will continue to be clean after thread migration.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > Reviewed-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >   arch/riscv/include/asm/mmu.h       |  2 ++
> >   arch/riscv/include/asm/processor.h |  7 ++++
> >   arch/riscv/include/asm/switch_to.h | 13 ++++++++
> >   arch/riscv/mm/cacheflush.c         | 67 ++++++++++++++++++++++++++++++++++++++
> >   arch/riscv/mm/context.c            | 14 ++++++--
> >   include/uapi/linux/prctl.h         |  6 ++++
> >   kernel/sys.c                       |  6 ++++
> >   7 files changed, 112 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
> > index 355504b37f8e..60be458e94da 100644
> > --- a/arch/riscv/include/asm/mmu.h
> > +++ b/arch/riscv/include/asm/mmu.h
> > @@ -19,6 +19,8 @@ typedef struct {
> >   #ifdef CONFIG_SMP
> >   	/* A local icache flush is needed before user execution can resume. */
> >   	cpumask_t icache_stale_mask;
> > +	/* Force local icache flush on all migrations. */
> > +	bool force_icache_flush;
> >   #endif
> >   #ifdef CONFIG_BINFMT_ELF_FDPIC
> >   	unsigned long exec_fdpic_loadmap;
> > diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> > index f19f861cda54..1cad05f579ad 100644
> > --- a/arch/riscv/include/asm/processor.h
> > +++ b/arch/riscv/include/asm/processor.h
> > @@ -84,6 +84,10 @@ struct thread_struct {
> >   	unsigned long vstate_ctrl;
> >   	struct __riscv_v_ext_state vstate;
> >   	unsigned long align_ctl;
> > +#ifdef CONFIG_SMP
> > +	bool force_icache_flush;
> > +	unsigned int prev_cpu;
> > +#endif
> >   };
> >   /* Whitelist the fstate from the task_struct for hardened usercopy */
> > @@ -145,6 +149,9 @@ extern int set_unalign_ctl(struct task_struct *tsk, unsigned int val);
> >   #define GET_UNALIGN_CTL(tsk, addr)	get_unalign_ctl((tsk), (addr))
> >   #define SET_UNALIGN_CTL(tsk, val)	set_unalign_ctl((tsk), (val))
> > +#define RISCV_SET_ICACHE_FLUSH_CTX(arg1, arg2)	riscv_set_icache_flush_ctx(arg1, arg2)
> > +extern int riscv_set_icache_flush_ctx(unsigned long ctx, unsigned long per_thread);
> > +
> >   #endif /* __ASSEMBLY__ */
> >   #endif /* _ASM_RISCV_PROCESSOR_H */
> > diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
> > index f90d8e42f3c7..72c032d4277e 100644
> > --- a/arch/riscv/include/asm/switch_to.h
> > +++ b/arch/riscv/include/asm/switch_to.h
> > @@ -8,6 +8,7 @@
> >   #include <linux/jump_label.h>
> >   #include <linux/sched/task_stack.h>
> > +#include <linux/mm_types.h>
> >   #include <asm/vector.h>
> >   #include <asm/cpufeature.h>
> >   #include <asm/processor.h>
> > @@ -73,6 +74,15 @@ static __always_inline bool has_fpu(void) { return false; }
> >   extern struct task_struct *__switch_to(struct task_struct *,
> >   				       struct task_struct *);
> > +static inline bool switch_to_should_flush_icache(struct task_struct *task)
> > +{
> > +	bool stale_mm = task->mm && (task->mm->context.force_icache_flush);
> > +	bool stale_thread = task->thread.force_icache_flush &&
> > +			    (smp_processor_id() != task->thread.prev_cpu);
> > +
> > +	return stale_mm || stale_thread;
> 
> 
> Here stale_mm will flush the icache even if there isn't any migration, you
> should check if there is a migration and then check if either the process or
> the thread is setup to flush the icache. So the condition should be:
> 
> return ((smp_processor_id() != task->thread.prev_cpu) && ((task->mm &&
> (task->mm->context.force_icache_flush)) || task->thread.force_icache_flush);
> 
> 
> > +}
> > +
> >   #define switch_to(prev, next, last)			\
> >   do {							\
> >   	struct task_struct *__prev = (prev);		\
> > @@ -81,7 +91,10 @@ do {							\
> >   		__switch_to_fpu(__prev, __next);	\
> >   	if (has_vector())					\
> >   		__switch_to_vector(__prev, __next);	\
> > +	if (switch_to_should_flush_icache(__next))	\
> > +		local_flush_icache_all();		\
> >   	((last) = __switch_to(__prev, __next));		\
> > +	__next->thread.prev_cpu = smp_processor_id();	\
> 
> 
> Hmm shouldn't you save prev_cpu *before* __switch_to()? Because here, you
> save prev_cpu only after __prev is actually rescheduled right? And then
> __next may have been rescheduled already or __prev may be rescheduled on
> another cpu.

I forgot to respond to this in my last email. Is this condition
possible? switch_to is locked on both sides with prepare_task_switch and
finish_task_switch so my understanding is that the state of __prev and
__next is not racy inside of switch_to.

Nonetheless, I can move the assignment to the beginning of the macro.

- Charlie

> 
> 
> >   } while (0)
> >   #endif /* _ASM_RISCV_SWITCH_TO_H */
> > diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> > index 55a34f2020a8..ff545f19f07a 100644
> > --- a/arch/riscv/mm/cacheflush.c
> > +++ b/arch/riscv/mm/cacheflush.c
> > @@ -5,6 +5,7 @@
> >   #include <linux/acpi.h>
> >   #include <linux/of.h>
> > +#include <linux/prctl.h>
> >   #include <asm/acpi.h>
> >   #include <asm/cacheflush.h>
> > @@ -152,3 +153,69 @@ void __init riscv_init_cbo_blocksizes(void)
> >   	if (cboz_block_size)
> >   		riscv_cboz_block_size = cboz_block_size;
> >   }
> > +
> > +/**
> > + * riscv_set_icache_flush_ctx() - Enable/disable icache flushing instructions in
> > + * userspace.
> > + * @ctx: Set the type of icache flushing instructions permitted/prohibited in
> > + *	 userspace. Supported values described below.
> > + *
> > + * Supported values for ctx:
> > + *
> > + * * %PR_RISCV_CTX_SW_FENCEI_ON: Allow fence.i in userspace.
> > + *
> > + * * %PR_RISCV_CTX_SW_FENCEI_OFF: Disallow fence.i in userspace. When ``scope ==
> > + *   PR_RISCV_SCOPE_PER_PROCESS``, this will effect all threads in a process.
> > + *   Therefore, caution must be taken -- only use this flag when you can
> > + *   guarantee that no thread in the process will emit fence.i from this point
> > + *   onward.
> > + *
> > + * @scope: Set scope of where icache flushing instructions are allowed to be
> > + *	   emitted. Supported values described below.
> > + *
> > + * Supported values for scope:
> > + *
> > + * * PR_RISCV_SCOPE_PER_PROCESS: Ensure the icache of any thread in this process
> > + *                               is coherent with instruction storage upon
> > + *                               migration.
> > + *
> > + * * PR_RISCV_SCOPE_PER_THREAD: Ensure the icache of the current thread is
> > + *                              coherent with instruction storage upon
> > + *                              migration.
> > + *
> > + * When ``scope == PR_RISCV_SCOPE_PER_PROCESS``, all threads in the process are
> > + * permitted to emit icache flushing instructions. Whenever any thread in the
> > + * process is migrated, the corresponding hart's icache will be guaranteed to be
> > + * consistent with instruction storage. Note this does not enforce any
> > + * guarantees outside of migration. If a thread modifies an instruction that
> > + * another thread may attempt to execute, the other thread must still emit an
> > + * icache flushing instruction before attempting to execute the potentially
> > + * modified instruction. This must be performed by the userspace program.
> > + *
> > + * In per-thread context (eg. ``scope == PR_RISCV_SCOPE_PER_THREAD``), only the
> > + * thread calling this function is permitted to emit icache flushing
> > + * instructions. When the thread is migrated, the corresponding hart's icache
> > + * will be guaranteed to be consistent with instruction storage.
> > + *
> > + * On kernels configured without SMP, this function is a nop as migrations
> > + * across harts will not occur.
> > + */
> > +int riscv_set_icache_flush_ctx(unsigned long ctx, unsigned long scope)
> > +{
> > +#ifdef CONFIG_SMP
> > +	switch (ctx) {
> > +	case PR_RISCV_CTX_SW_FENCEI_ON:
> > +		switch (scope) {
> > +		case PR_RISCV_SCOPE_PER_PROCESS:
> > +			current->mm->context.force_icache_flush = true;
> > +			break;
> > +		case PR_RISCV_SCOPE_PER_THREAD:
> > +			current->thread.force_icache_flush = true;
> > +			break;
> > +		default:
> > +			return -EINVAL;
> > +		}
> > +	}
> > +#endif
> > +	return 0;
> > +}
> > diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> > index 217fd4de6134..b059dc0fae91 100644
> > --- a/arch/riscv/mm/context.c
> > +++ b/arch/riscv/mm/context.c
> > @@ -15,6 +15,7 @@
> >   #include <asm/tlbflush.h>
> >   #include <asm/cacheflush.h>
> >   #include <asm/mmu_context.h>
> > +#include <asm/switch_to.h>
> >   #ifdef CONFIG_MMU
> > @@ -297,19 +298,26 @@ static inline void set_mm(struct mm_struct *prev,
> >    *
> >    * The "cpu" argument must be the current local CPU number.
> >    */
> > -static inline void flush_icache_deferred(struct mm_struct *mm, unsigned int cpu)
> > +static inline void flush_icache_deferred(struct mm_struct *mm, unsigned int cpu,
> > +					 struct task_struct *task)
> >   {
> >   #ifdef CONFIG_SMP
> >   	cpumask_t *mask = &mm->context.icache_stale_mask;
> >   	if (cpumask_test_cpu(cpu, mask)) {
> >   		cpumask_clear_cpu(cpu, mask);
> > +
> 
> 
> ^ newline here
> 
> 
> >   		/*
> >   		 * Ensure the remote hart's writes are visible to this hart.
> >   		 * This pairs with a barrier in flush_icache_mm.
> >   		 */
> >   		smp_mb();
> > -		local_flush_icache_all();
> > +
> > +		/*
> > +		 * If cache will be flushed in switch_to, no need to flush here.
> > +		 */
> > +		if (!(task && switch_to_should_flush_icache(task)))
> > +			local_flush_icache_all();
> >   	}
> >   #endif
> > @@ -332,5 +340,5 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
> >   	set_mm(prev, next, cpu);
> > -	flush_icache_deferred(next, cpu);
> > +	flush_icache_deferred(next, cpu, task);
> >   }
> > diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
> > index 370ed14b1ae0..524d546d697b 100644
> > --- a/include/uapi/linux/prctl.h
> > +++ b/include/uapi/linux/prctl.h
> > @@ -306,4 +306,10 @@ struct prctl_mm_map {
> >   # define PR_RISCV_V_VSTATE_CTRL_NEXT_MASK	0xc
> >   # define PR_RISCV_V_VSTATE_CTRL_MASK		0x1f
> > +#define PR_RISCV_SET_ICACHE_FLUSH_CTX	71
> > +# define PR_RISCV_CTX_SW_FENCEI_ON	0
> > +# define PR_RISCV_CTX_SW_FENCEI_OFF	1
> > +# define PR_RISCV_SCOPE_PER_PROCESS	0
> > +# define PR_RISCV_SCOPE_PER_THREAD	1
> > +
> >   #endif /* _LINUX_PRCTL_H */
> > diff --git a/kernel/sys.c b/kernel/sys.c
> > index 420d9cb9cc8e..e806a8a67c36 100644
> > --- a/kernel/sys.c
> > +++ b/kernel/sys.c
> > @@ -146,6 +146,9 @@
> >   #ifndef RISCV_V_GET_CONTROL
> >   # define RISCV_V_GET_CONTROL()		(-EINVAL)
> >   #endif
> > +#ifndef RISCV_SET_ICACHE_FLUSH_CTX
> > +# define RISCV_SET_ICACHE_FLUSH_CTX(a, b)	(-EINVAL)
> > +#endif
> >   /*
> >    * this is where the system-wide overflow UID and GID are defined, for
> > @@ -2739,6 +2742,9 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
> >   	case PR_RISCV_V_GET_CONTROL:
> >   		error = RISCV_V_GET_CONTROL();
> >   		break;
> > +	case PR_RISCV_SET_ICACHE_FLUSH_CTX:
> > +		error = RISCV_SET_ICACHE_FLUSH_CTX(arg2, arg3);
> > +		break;
> >   	default:
> >   		error = -EINVAL;
> >   		break;
> > 
> 
> Thanks,
> 
> Alex
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
