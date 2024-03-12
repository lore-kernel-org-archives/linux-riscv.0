Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C482C54E5D
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 21:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8FTH3AC62eU+obpQRudEmwCqp7dS+luZX2qT9BfhxQY=; b=3uyLbE48WMEu2C
	7YaJmQHsrsDK24XDpucwH2XzWuVqR/6H2X/3Yafq8EuXA5c1aiIDywDoe54xVfq3DlLcpCEVq7DGD
	M0swMk1wVcAnrV4qUsaasTmh5LuWwroNVIf8B89P4IZGw5wLO/JWn2LJosmur/W7OdyMo8KqVqbYt
	BBRVti/6nMwnpoMeu8KT3CnatBKzXlFKGkm5KnpqGVNw2chfC7ziEZDm5xMMYKyq0GaNh8w41PLKv
	ppfneXUPoEFoY9FC4jy4LQyGZFLdeyzdx2X0eKZHthMfdtVUIChUZIeUURuQZZvEt2ZUZLE3dvmVU
	1izkqwsXSha20ocC7cjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk9QU-00000007ZDj-2c1C;
	Tue, 12 Mar 2024 21:12:46 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk9QR-00000007ZCw-3tvW
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 21:12:45 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6e6adc557f3so799139b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 14:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710277961; x=1710882761; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2hbh6YoVxfJpfQz3NnjG4qjnPOLEs9bpfKBhSSGfsX0=;
        b=IQlI9CdwqHVuvPjoYENyzks2IFxWWOaX2u6HtJrN4BNFr5NlDR9RVFeky8Riyl26AD
         2R+e4YPeoBaSAWTkoBxh5A4I4gozNnF9ChRsYu/oupb0A4KLBJIpyHwi5UEfyZauhlqd
         9zMbO35highF/fdZHCAc5P7usfaZN3Zm0W/eebZIbe7Z7TA/2IARqHBUHS3nHhZYR4ga
         j+lE18e0qWx8xHkpN/LxjvE56BW3SrPO/a8tflGI/PO3LrjbUrggFP6RL1FTzDawMwfV
         mlYNV8ld2dyu523uTMtpLGUoJbdoxmHAYDOndE1Kl4fQ331QBCxxOsJImJmMa4F34LFF
         90IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710277961; x=1710882761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hbh6YoVxfJpfQz3NnjG4qjnPOLEs9bpfKBhSSGfsX0=;
        b=Qf2lcDjTBRJ0bZbrH4zdn3U4LtyyTb27D3IrZi9E8je9z48QuYzWMrjEAK7JYQOMjA
         nFny4pRdgrO5cWaHhXPgOBnp2ffbnBvJmURszgz5MKDQTotFNigtdkJGUDb/WW463tBe
         1Nu9DLIFyD3f7ji34yLMjqrZThSGRcuVi90uuJQbGdEHg2VhtmcHhv9BTS7ZzEI7ynZN
         2DtGVENFirwkcBH774aE1XHMF5yt1redzpD7wVWTb2ixZIQGTePqp7nhKNnDJ0CaBt4J
         MlW8DmFTKljYiBuGjRTW9IVjdZWRnLUjOR9G0KPsZ7aAeSJ4DL5ZvmclYFBktQrfqija
         whjQ==
X-Gm-Message-State: AOJu0YxWcq4RI3XRkuCkOER2wEYVZ1Ziz4YkvxIHaS7cbt4ymH9llFB2
	/CvHZt2AxUWrLFNWnBdLmSbNn292dvi7uhKiIyZw3BTs8w1EWguMCczvyEFJkBk=
X-Google-Smtp-Source: AGHT+IHdMFFcr12HNtPOMCeMLGjv542syr71XycbabM8YsYvIttWk9LnkJCX8iE+5zPJQ5SRfTqtHg==
X-Received: by 2002:a05:6a20:a122:b0:1a3:145e:acf with SMTP id q34-20020a056a20a12200b001a3145e0acfmr9065653pzk.57.1710277961010;
        Tue, 12 Mar 2024 14:12:41 -0700 (PDT)
Received: from ghost ([2600:1010:b06c:41bc:fc4e:6049:fa44:42e1])
        by smtp.gmail.com with ESMTPSA id j16-20020a63cf10000000b005e43cce33f8sm1710874pgg.88.2024.03.12.14.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 14:12:40 -0700 (PDT)
Date: Tue, 12 Mar 2024 14:12:16 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v12 2/4] riscv: Include riscv_set_icache_flush_ctx prctl
Message-ID: <ZfDFMKaNrPlZwQod@ghost>
References: <20240312-fencei-v12-0-0f340f004ce7@rivosinc.com>
 <20240312-fencei-v12-2-0f340f004ce7@rivosinc.com>
 <febde3f3-7df6-4c9a-a1b5-0fae92e018df@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <febde3f3-7df6-4c9a-a1b5-0fae92e018df@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_141244_141960_A1CE8576 
X-CRM114-Status: GOOD (  48.46  )
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

On Tue, Mar 12, 2024 at 03:11:57PM -0500, Samuel Holland wrote:
> On 2024-03-12 2:47 PM, Charlie Jenkins wrote:
> > Support new prctl with key PR_RISCV_SET_ICACHE_FLUSH_CTX to enable
> > optimization of cross modifying code. This prctl enables userspace code
> > to use icache flushing instructions such as fence.i with the guarantee
> > that the icache will continue to be clean after thread migration.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > Reviewed-by: Atish Patra <atishp@rivosinc.com>
> > Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/mmu.h       |  2 +
> >  arch/riscv/include/asm/processor.h | 10 ++++
> >  arch/riscv/include/asm/switch_to.h | 23 ++++++++++
> >  arch/riscv/mm/cacheflush.c         | 94 ++++++++++++++++++++++++++++++++++++++
> >  arch/riscv/mm/context.c            | 17 +++++--
> >  include/uapi/linux/prctl.h         |  6 +++
> >  kernel/sys.c                       |  6 +++
> >  7 files changed, 153 insertions(+), 5 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
> > index 355504b37f8e..60be458e94da 100644
> > --- a/arch/riscv/include/asm/mmu.h
> > +++ b/arch/riscv/include/asm/mmu.h
> > @@ -19,6 +19,8 @@ typedef struct {
> >  #ifdef CONFIG_SMP
> >  	/* A local icache flush is needed before user execution can resume. */
> >  	cpumask_t icache_stale_mask;
> > +	/* Force local icache flush on all migrations. */
> > +	bool force_icache_flush;
> >  #endif
> >  #ifdef CONFIG_BINFMT_ELF_FDPIC
> >  	unsigned long exec_fdpic_loadmap;
> > diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> > index a8509cc31ab2..cca62013c3c0 100644
> > --- a/arch/riscv/include/asm/processor.h
> > +++ b/arch/riscv/include/asm/processor.h
> > @@ -69,6 +69,7 @@
> >  #endif
> >  
> >  #ifndef __ASSEMBLY__
> > +#include <linux/cpumask.h>
> >  
> >  struct task_struct;
> >  struct pt_regs;
> > @@ -123,6 +124,12 @@ struct thread_struct {
> >  	struct __riscv_v_ext_state vstate;
> >  	unsigned long align_ctl;
> >  	struct __riscv_v_ext_state kernel_vstate;
> > +#ifdef CONFIG_SMP
> > +	/* Flush the icache on migration */
> > +	bool force_icache_flush;
> > +	/* A forced icache flush is not needed if migrating to the previous cpu. */
> > +	unsigned int prev_cpu;
> > +#endif
> >  };
> >  
> >  /* Whitelist the fstate from the task_struct for hardened usercopy */
> > @@ -184,6 +191,9 @@ extern int set_unalign_ctl(struct task_struct *tsk, unsigned int val);
> >  #define GET_UNALIGN_CTL(tsk, addr)	get_unalign_ctl((tsk), (addr))
> >  #define SET_UNALIGN_CTL(tsk, val)	set_unalign_ctl((tsk), (val))
> >  
> > +#define RISCV_SET_ICACHE_FLUSH_CTX(arg1, arg2)	riscv_set_icache_flush_ctx(arg1, arg2)
> > +extern int riscv_set_icache_flush_ctx(unsigned long ctx, unsigned long per_thread);
> > +
> >  #endif /* __ASSEMBLY__ */
> >  
> >  #endif /* _ASM_RISCV_PROCESSOR_H */
> > diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
> > index 7efdb0584d47..7594df37cc9f 100644
> > --- a/arch/riscv/include/asm/switch_to.h
> > +++ b/arch/riscv/include/asm/switch_to.h
> > @@ -8,6 +8,7 @@
> >  
> >  #include <linux/jump_label.h>
> >  #include <linux/sched/task_stack.h>
> > +#include <linux/mm_types.h>
> >  #include <asm/vector.h>
> >  #include <asm/cpufeature.h>
> >  #include <asm/processor.h>
> > @@ -72,14 +73,36 @@ static __always_inline bool has_fpu(void) { return false; }
> >  extern struct task_struct *__switch_to(struct task_struct *,
> >  				       struct task_struct *);
> >  
> > +static inline bool switch_to_should_flush_icache(struct task_struct *task)
> > +{
> > +#ifdef CONFIG_SMP
> > +	bool stale_mm = task->mm && task->mm->context.force_icache_flush;
> > +	bool stale_thread = task->thread.force_icache_flush;
> > +	bool thread_migrated = smp_processor_id() != task->thread.prev_cpu;
> > +
> > +	return thread_migrated && (stale_mm || stale_thread);
> > +#else
> > +	return false;
> > +#endif
> > +}
> > +
> > +#ifdef CONFIG_SMP
> > +#define __set_prev_cpu(thread) ((thread).prev_cpu = smp_processor_id())
> > +#else
> > +#define __set_prev_cpu(thread)
> > +#endif
> > +
> >  #define switch_to(prev, next, last)			\
> >  do {							\
> >  	struct task_struct *__prev = (prev);		\
> >  	struct task_struct *__next = (next);		\
> > +	__set_prev_cpu(__prev->thread);			\
> >  	if (has_fpu())					\
> >  		__switch_to_fpu(__prev, __next);	\
> >  	if (has_vector())					\
> >  		__switch_to_vector(__prev, __next);	\
> > +	if (switch_to_should_flush_icache(__next))	\
> > +		local_flush_icache_all();		\
> >  	((last) = __switch_to(__prev, __next));		\
> >  } while (0)
> >  
> > diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> > index 55a34f2020a8..329b95529580 100644
> > --- a/arch/riscv/mm/cacheflush.c
> > +++ b/arch/riscv/mm/cacheflush.c
> > @@ -5,6 +5,7 @@
> >  
> >  #include <linux/acpi.h>
> >  #include <linux/of.h>
> > +#include <linux/prctl.h>
> >  #include <asm/acpi.h>
> >  #include <asm/cacheflush.h>
> >  
> > @@ -152,3 +153,96 @@ void __init riscv_init_cbo_blocksizes(void)
> >  	if (cboz_block_size)
> >  		riscv_cboz_block_size = cboz_block_size;
> >  }
> > +
> > +/**
> > + * riscv_set_icache_flush_ctx() - Enable/disable icache flushing instructions in
> > + * userspace.
> > + * @ctx: Set the type of icache flushing instructions permitted/prohibited in
> > + *	 userspace. Supported values described below.
> > + *
> > + * Supported values for ctx:
> > + *
> > + * * %PR_RISCV_CTX_SW_FENCEI_ON: Allow fence.i in user space.
> > + *
> > + * * %PR_RISCV_CTX_SW_FENCEI_OFF: Disallow fence.i in user space. All threads in
> > + *   a process will be affected when ``scope == PR_RISCV_SCOPE_PER_PROCESS``.
> > + *   Therefore, caution must be taken; use this flag only when you can guarantee
> > + *   that no thread in the process will emit fence.i from this point onward.
> > + *
> > + * @scope: Set scope of where icache flushing instructions are allowed to be
> > + *	   emitted. Supported values described below.
> > + *
> > + * Supported values for scope:
> > + *
> > + * * %PR_RISCV_SCOPE_PER_PROCESS: Ensure the icache of any thread in this process
> > + *                               is coherent with instruction storage upon
> > + *                               migration.
> > + *
> > + * * %PR_RISCV_SCOPE_PER_THREAD: Ensure the icache of the current thread is
> > + *                              coherent with instruction storage upon
> > + *                              migration.
> > + *
> > + * When ``scope == PR_RISCV_SCOPE_PER_PROCESS``, all threads in the process are
> > + * permitted to emit icache flushing instructions. Whenever any thread in the
> > + * process is migrated, the corresponding hart's icache will be guaranteed to be
> > + * consistent with instruction storage. This does not enforce any guarantees
> > + * outside of migration. If a thread modifies an instruction that another thread
> > + * may attempt to execute, the other thread must still emit an icache flushing
> > + * instruction before attempting to execute the potentially modified
> > + * instruction. This must be performed by the user-space program.
> > + *
> > + * In per-thread context (eg. ``scope == PR_RISCV_SCOPE_PER_THREAD``) only the
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
> > +		break;
> > +	case PR_RISCV_CTX_SW_FENCEI_OFF:
> > +		switch (scope) {
> > +		case PR_RISCV_SCOPE_PER_PROCESS:
> > +		case PR_RISCV_SCOPE_PER_THREAD:
> > +			bool stale_cpu;
> > +			cpumask_t *mask;
> > +
> > +			current->mm->context.force_icache_flush = false;
> 
> You still need (at least partially) separate logic for the two scopes, because
> now you're resetting the wrong flag here.

Yes that was hasty of me, thank you.

> 
> > +
> > +			/*
> > +			 * Mark every other hart's icache as needing a flush for
> > +			 * this MM. Maintain the previous value of the current
> > +			 * cpu to handle the case when this function is called
> > +			 * concurrently on different harts.
> > +			 */
> > +			mask = &current->mm->context.icache_stale_mask;
> > +			stale_cpu = cpumask_test_cpu(smp_processor_id(), mask);
> > +
> > +			cpumask_setall(mask);
> > +			assign_bit(cpumask_check(smp_processor_id()), cpumask_bits(mask), stale_cpu);
> > +			break;
> > +		default:
> > +			return -EINVAL;
> > +		}
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +#endif
> > +	return 0;
> 
> I think I brought this up a couple of revisions ago (sorry for not mentioning it
> the last time), but you still need parameter validation for CONFIG_SMP=n. Yes,
> the call is currently a no-op for the combinations of ctx and scope defined so
> far, but if we ever add a new ctx (say, something for Zjid), it may need to do
> something on CONFIG_SMP=n, and older kernels will need to indicate that the new
> ctx is not supported.

Ah, I must not have understood, I will add that.

> 
> > +}
> > diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> > index 217fd4de6134..3e27e5c8c3c6 100644
> > --- a/arch/riscv/mm/context.c
> > +++ b/arch/riscv/mm/context.c
> > @@ -15,6 +15,7 @@
> >  #include <asm/tlbflush.h>
> >  #include <asm/cacheflush.h>
> >  #include <asm/mmu_context.h>
> > +#include <asm/switch_to.h>
> >  
> >  #ifdef CONFIG_MMU
> >  
> > @@ -297,21 +298,27 @@ static inline void set_mm(struct mm_struct *prev,
> >   *
> >   * The "cpu" argument must be the current local CPU number.
> >   */
> > -static inline void flush_icache_deferred(struct mm_struct *mm, unsigned int cpu)
> > +static inline void flush_icache_deferred(struct mm_struct *mm, unsigned int cpu,
> > +					 struct task_struct *task)
> >  {
> >  #ifdef CONFIG_SMP
> >  	cpumask_t *mask = &mm->context.icache_stale_mask;
> >  
> > -	if (cpumask_test_cpu(cpu, mask)) {
> > +	if (cpumask_test_and_clear_cpu(cpu, mask)) {
> >  		cpumask_clear_cpu(cpu, mask);
> 
> Now that you only have one mask, this is clearing the same bit twice.

Thanks for pointing that out!

- Charlie

> 
> Regards,
> Samuel
> 
> > +
> >  		/*
> >  		 * Ensure the remote hart's writes are visible to this hart.
> >  		 * This pairs with a barrier in flush_icache_mm.
> >  		 */
> >  		smp_mb();
> > -		local_flush_icache_all();
> > -	}
> >  
> > +		/*
> > +		 * If cache will be flushed in switch_to, no need to flush here.
> > +		 */
> > +		if (!(task && switch_to_should_flush_icache(task)))
> > +			local_flush_icache_all();
> > +	}
> >  #endif
> >  }
> >  
> > @@ -332,5 +339,5 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
> >  
> >  	set_mm(prev, next, cpu);
> >  
> > -	flush_icache_deferred(next, cpu);
> > +	flush_icache_deferred(next, cpu, task);
> >  }
> > diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
> > index 370ed14b1ae0..524d546d697b 100644
> > --- a/include/uapi/linux/prctl.h
> > +++ b/include/uapi/linux/prctl.h
> > @@ -306,4 +306,10 @@ struct prctl_mm_map {
> >  # define PR_RISCV_V_VSTATE_CTRL_NEXT_MASK	0xc
> >  # define PR_RISCV_V_VSTATE_CTRL_MASK		0x1f
> >  
> > +#define PR_RISCV_SET_ICACHE_FLUSH_CTX	71
> > +# define PR_RISCV_CTX_SW_FENCEI_ON	0
> > +# define PR_RISCV_CTX_SW_FENCEI_OFF	1
> > +# define PR_RISCV_SCOPE_PER_PROCESS	0
> > +# define PR_RISCV_SCOPE_PER_THREAD	1
> > +
> >  #endif /* _LINUX_PRCTL_H */
> > diff --git a/kernel/sys.c b/kernel/sys.c
> > index e219fcfa112d..69afdd8b430f 100644
> > --- a/kernel/sys.c
> > +++ b/kernel/sys.c
> > @@ -146,6 +146,9 @@
> >  #ifndef RISCV_V_GET_CONTROL
> >  # define RISCV_V_GET_CONTROL()		(-EINVAL)
> >  #endif
> > +#ifndef RISCV_SET_ICACHE_FLUSH_CTX
> > +# define RISCV_SET_ICACHE_FLUSH_CTX(a, b)	(-EINVAL)
> > +#endif
> >  
> >  /*
> >   * this is where the system-wide overflow UID and GID are defined, for
> > @@ -2743,6 +2746,9 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
> >  	case PR_RISCV_V_GET_CONTROL:
> >  		error = RISCV_V_GET_CONTROL();
> >  		break;
> > +	case PR_RISCV_SET_ICACHE_FLUSH_CTX:
> > +		error = RISCV_SET_ICACHE_FLUSH_CTX(arg2, arg3);
> > +		break;
> >  	default:
> >  		error = -EINVAL;
> >  		break;
> > 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
