Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261CFC46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jan 2024 19:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UFMKnam+TYN7x0dKtHCbN4An9EfCIN7/ffWRV7iCMg8=; b=i0w9spLpymKMew
	CAXkj++PmAYvwiHFEAI8IdYv7Wi7TbBg/U45bZCaNlQ91udnwUMLV5aBLkpYEZ2i8jOvCXQ9XvyeR
	lBsqbyoVd8m9/mDfRRvpljE+GLWs/krWlAY/JbHImyjn7ieW3QLdUQvnKWG5l1jHLgIFSgVG3CBiA
	WkNo6+Tzwya2ZIuBoyhUG282QZ6O9/LKhjtg84XimbebEs8rR9V3fP1etmvUlHpWoE409WUT7/0y/
	RnGZTsT7n8m8NzcDbYSG/UEL4J/vUJypWqxsR8PP3uc7nDLg6jmBWipCd6vgcYdeG1ngJrvUgJ0vy
	RxhNVt2W2mm+Oah8OZFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSiTs-004nNW-0G;
	Wed, 24 Jan 2024 19:00:12 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSiTn-004nLc-15
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jan 2024 19:00:10 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2909a632e40so2270621a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jan 2024 11:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706122804; x=1706727604; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WWKGvWOdaFDDeu6rBekd7VhbEJip7cO1DihHBm0wDFo=;
        b=JmbsfP69iJ4Lc214O80ZS70VE43aKmPirN4tg+tB2ZLLL9bZA3Xf5BsM2i2ZEJQ9fB
         tvkf6BuY0oZ0ReVm5gDgFH2RI7i95bgFjLHP9uNr2AIrDjP+NiSZSOM5oqLo7UD14R/c
         FxNEduMIUUPh89de+9+yi1hfdn5Qbs6iFW4oqxbyhD1I4KCTZDcbC00qkiAM0Ok4nOsS
         /TTKM0ImYQITLaKbmsd926t1nbTzFRq4BhX06fq7izIZhyCYSdtvY38Kp98WTO5KdR+L
         FjL+Os3qkzR9c/p2c9PVj2mgTUa/sDwAnhHLv5ZW2NkmFY0bbtsUH9WaD0ToFs4Fkaaq
         7TYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706122804; x=1706727604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WWKGvWOdaFDDeu6rBekd7VhbEJip7cO1DihHBm0wDFo=;
        b=VlntDaZkUFgxgwSCgCHa/kBak1JKq8jdXAxArNGqMpuxwVE2oFTFHszdj2iniTIwJT
         FjwPfh/XddRxpneo2aFSruCLixk2b0pjb0of22ozt2tSBNZ+ir1Bg1axbc5LhIVIKXxm
         xtYCXROnEAVswXrVBi+Vcvy9HCkqHxVcTeKeSsa6TmsJu9WgLJVcf8JG6ibCrGWEOHAV
         gpizp/YwYe43T+6IIgxaNla2DNv5wSYsOC3qvIdPY/+y7WOpOPwk6UBsCLwVmHyXqU+d
         Tm1TBN9JVCKxOiO9Tui3tbAgLLB68HYbAqKIqX+ZGMckl8Iz4a6Z67bwinoFJDVZQju5
         QV0w==
X-Gm-Message-State: AOJu0YzQmrjMzyac6fDoBDIY5R8oHb3TwNFSzw/IihwspWJzxsPRdT3X
	TLUGh42+VD6kHopKw5cbka9u4THIqf8rXcfOMss+sbeZViLC6odWZoxmZzvA47h7Gr+TgcVb23d
	IZqg=
X-Google-Smtp-Source: AGHT+IHVhDitRvLhUw8tw9CaJQmF6O+yrcAm+SFfQz+y9w+NG94k6pQb2YkSol4e9t74SpY6zCe2nw==
X-Received: by 2002:a17:90a:178f:b0:28b:de50:b4a7 with SMTP id q15-20020a17090a178f00b0028bde50b4a7mr3912541pja.76.1706122804206;
        Wed, 24 Jan 2024 11:00:04 -0800 (PST)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id x4-20020a17090ab00400b00290ea280b12sm2208929pjq.50.2024.01.24.11.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 11:00:03 -0800 (PST)
Date: Wed, 24 Jan 2024 11:00:01 -0800
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
Message-ID: <ZbFeMVCEgLhgDc7j@ghost>
References: <20240123-fencei-v9-0-71411bfe8d71@rivosinc.com>
 <20240123-fencei-v9-1-71411bfe8d71@rivosinc.com>
 <7b15e9c0-58f5-4bc3-899e-671ce2c31548@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7b15e9c0-58f5-4bc3-899e-671ce2c31548@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_110007_393910_00B77F87 
X-CRM114-Status: GOOD (  43.99  )
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

Aha! That is what I have been missing, thank you for helping me solve
this.

- Charlie

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
