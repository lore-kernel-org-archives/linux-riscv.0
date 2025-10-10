Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBF7CCA476
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 17:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qZDSC3Vl2aw6s5Dv+1PAJ/mv6axEKtrESXCibW2ICho=; b=xDECuaG89OTHn2
	EYMHKZ8ToYeBRjavAfXwVOC9wk9u65FxFoYBCByc3kzWBMbx7vweDAyU1QGgl/JgttpNIq1mILgDg
	xdLhWSxt7zoSY1KIF9i9EitBhi/VU6wcKqU/RbdbogpFjWSS3mXfljNXbWx+LTIT4sEi5xHl7sANy
	KErzQTqXeSkXM88R5vmMyXBOMi/b5faw7Z3rxsw0CtWe9nJneW6eQA/MgnlT9ayffGIKTS7nSFgTe
	sOfkgakcRkgznDrpWJfn8B+GhCs9HC7zHOoBGZYfMg3R48cwUNyO5xuEFgXZTXFRXh5rlrPtG+ohm
	R105TN3oZ6CkS2rlfXhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7HE2-000000096En-3cg8;
	Fri, 10 Oct 2025 17:48:18 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7HE0-000000096EG-2nAS
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 17:48:17 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-7970e8d1cfeso31366296d6.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 Oct 2025 10:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760118495; x=1760723295; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0HDKcRyh3PZKdHNMvnRZkTba9f0/5qU6T/Ayx2+vV5I=;
        b=lPN4rpn6s44r0Qw9sPdVrpK0x7TLGhH7VGostvGFnIk2CTPB/3lJYt9ERv50urV7oG
         0qKpkGffJ50BiQNEvYqku/fBy4+C2RphyHwCA17ugzu5iMQdt/MHm6Nqn5rNZZg3YsNh
         OMc9+5Lz+3EFBzyu9pBYA3K2DepLkMCN/sKDaAYN5si/Che47Lc+JiJs+yfBEaRAqfrF
         0aoggaLuEk7qxgVpcJzm7irICFrN0h2b4ih9Lb5zpmJUX+gHLNozULssegZRAjiiwu5T
         TmRfQme/Xs2R1PBrBknVkomd1ldYChr9hOksifFG9kbDiZqHiIrr9edu5EtzS8fYcDK5
         P90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760118495; x=1760723295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HDKcRyh3PZKdHNMvnRZkTba9f0/5qU6T/Ayx2+vV5I=;
        b=j9rM9ULZfc7j5G9YV1QYFZgHc1nAqVVWwTgBW5oI3tw3wHfFmDPJzZCAR9Fmg1sXoh
         3iNebwKa1QRnMCuvLQjxUcdkrSjgUNMMFPsmgb1N4Z+97Reh5H3fqbhG2WfZ+CQHO3kb
         F7ihuI1HtQVQEHVdq/bFmDX5Tl+3LXK/GAOItQTeagFaWBBFDYAn0NM7RBPTBaRIGl4k
         u8bCbuOltBVgNwQdUEJ+xvwnwmQ0L7Kitm/d4LRxjpD8qh7vbLbObrPyTouLYuP8wyiF
         QPQfgxCf4IzKEEs0ycaBH8o7uGRItkf9Y1kPGmNKvzbR6LYf6aDbyktnSvSWv8IY4Rcl
         2STg==
X-Forwarded-Encrypted: i=1; AJvYcCXo62mVE2ZEFOIsCW0almcqj+PZSY963KsUBzOe+0vGepLwwst4z+KoT5h4MFXI3bSoyHsnYjEcxHob+g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxblZX33ItwFgNW5AS06m9zSdvuTpkm1xpmk90n0AznfiWLunU7
	g1fcJCVFGlpp1UO2efiwRiQzkYbiblm+Bl2VRZ6NEkQ4nlgWUNYi0mtY
X-Gm-Gg: ASbGnctzWLsCuDm2k2kmE0dymo0AZ8lSC5G4FSIOCsCqB7oMbx7LHhGU25QUJ2hlFeO
	wZIjPT9hPbG3fIWI97JSrw/zxO2445Y2VHl4ha79x/gAXV3HS1EWSams2Rqcln+PaDgAZs4thQF
	/y/HPmpMb67jqkh+1QlHuitU0DavB6m/NAf9EfqCz44fH+fi7FKBnrqH5LK9AfVYYax4DHbpB2D
	NY6DXhYtHdf8sAhEt4H8aOEiriHQXTPUSvPafifbZCLBdlHi71EvgeegApQ8Accqvmo1BZHL2e1
	sTPCJ8BajW588hOf5WaKDXCLocUQRMiCMwWXVwdh1YBhO6rEXHNEM66IQCfRlbC5EL9NS2UvBUV
	XxF+Ae5c3u4SMWzfz8MInxiDX9ompbyqkInI9LXFtwzYdz+nv
X-Google-Smtp-Source: AGHT+IHt1fltqSOQNAwaJvgXJiJNUt/Iy268/HwGtU21DjWYu9BdYiR8Fuy0ro1CN7LEJs+CaTZBBA==
X-Received: by 2002:ac8:5751:0:b0:4de:74f8:b2a4 with SMTP id d75a77b69052e-4e6ead7789cmr174443161cf.53.1760118494834;
        Fri, 10 Oct 2025 10:48:14 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87bc3574e7esm20215986d6.41.2025.10.10.10.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 10:48:14 -0700 (PDT)
Date: Fri, 10 Oct 2025 13:48:12 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, rostedt@goodmis.org, mhiramat@kernel.org,
	mark.rutland@arm.com, peterz@infradead.org, jpoimboe@kernel.org,
	jbaron@akamai.com, ardb@kernel.org, willy@infradead.org,
	guoren@kernel.org, ziy@nvidia.com, akpm@linux-foundation.org,
	bjorn@rivosinc.com, ajones@ventanamicro.com, parri.andrea@gmail.com,
	cleger@rivosinc.com, yongxuan.wang@sifive.com, inochiama@gmail.com,
	samuel.holland@sifive.com, charlie@rivosinc.com,
	conor.dooley@microchip.com, yikming2222@gmail.com,
	andybnac@gmail.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] riscv: add support for Ziccid
Message-ID: <aOlG3Mb6_vN4uuA7@yury>
References: <20251009134514.8549-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251009134514.8549-1-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_104816_736927_8FB4F707 
X-CRM114-Status: GOOD (  26.08  )
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

On Thu, Oct 09, 2025 at 09:45:14PM +0800, Yunhui Cui wrote:
> The Ziccid extension provides hardware synchronization between
> Dcache and Icache. With this hardware support, there's no longer
> a need to trigger remote hart execution of fence.i via IPI.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  arch/riscv/include/asm/cacheflush.h |  4 ++--
>  arch/riscv/include/asm/hwcap.h      |  1 +
>  arch/riscv/include/asm/switch_to.h  | 10 ++++++++++
>  arch/riscv/kernel/cpufeature.c      |  1 +
>  arch/riscv/kernel/ftrace.c          |  2 +-
>  arch/riscv/kernel/hibernate.c       |  2 +-
>  arch/riscv/kernel/jump_label.c      |  2 +-
>  arch/riscv/mm/cacheflush.c          | 16 ++++++++++++++--
>  8 files changed, 31 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> index 0092513c3376c..3a8cdf30bb4b1 100644
> --- a/arch/riscv/include/asm/cacheflush.h
> +++ b/arch/riscv/include/asm/cacheflush.h
> @@ -68,7 +68,7 @@ static inline void flush_cache_vmap(unsigned long start, unsigned long end)
>  
>  #else /* CONFIG_SMP */
>  
> -void flush_icache_all(void);
> +void flush_icache_all(bool force);
>  void flush_icache_mm(struct mm_struct *mm, bool local);
>  
>  #endif /* CONFIG_SMP */
> @@ -80,7 +80,7 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
>  #define flush_icache_range flush_icache_range
>  static inline void flush_icache_range(unsigned long start, unsigned long end)
>  {
> -	flush_icache_all();
> +	flush_icache_all(false);
>  }
>  
>  extern unsigned int riscv_cbom_block_size;
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index affd63e11b0a3..ad97d8955b501 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -106,6 +106,7 @@
>  #define RISCV_ISA_EXT_ZAAMO		97
>  #define RISCV_ISA_EXT_ZALRSC		98
>  #define RISCV_ISA_EXT_ZICBOP		99
> +#define RISCV_ISA_EXT_ZICCID		100
>  
>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
>  
> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
> index 0e71eb82f920c..b8a9e455efe9e 100644
> --- a/arch/riscv/include/asm/switch_to.h
> +++ b/arch/riscv/include/asm/switch_to.h
> @@ -98,7 +98,17 @@ static inline bool switch_to_should_flush_icache(struct task_struct *task)
>  	bool stale_thread = task->thread.force_icache_flush;
>  	bool thread_migrated = smp_processor_id() != task->thread.prev_cpu;
>  
> +	asm goto(ALTERNATIVE("nop", "j %l[ziccid]", 0, RISCV_ISA_EXT_ZICCID, 1)
> +		 : : : : ziccid);
> +

Instead of opencoded 'asm goto', can you try the riscv_has_extension() here
and everywhere?

	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZICCID))
          	return thread_migrated && (stale_mm || stale_thread);
        else
        	return thread_migrated && stale_thread;

Thanks,
Yury
                

>  	return thread_migrated && (stale_mm || stale_thread);
> +
> +ziccid:
> +	/*
> +	 * Process switching writes to SATP, which flushes the pipeline,
> +	 * so only the thread scenario is considered.
> +	 */
> +	return thread_migrated && stale_thread;
>  #else
>  	return false;
>  #endif
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 67b59699357da..2da82aa2dbf0a 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -540,6 +540,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
>  	__RISCV_ISA_EXT_DATA(svvptc, RISCV_ISA_EXT_SVVPTC),
> +	__RISCV_ISA_EXT_DATA(ziccid, RISCV_ISA_EXT_ZICCID),
>  };
>  
>  const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
> diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
> index 8d18d6727f0fc..431448e818363 100644
> --- a/arch/riscv/kernel/ftrace.c
> +++ b/arch/riscv/kernel/ftrace.c
> @@ -43,7 +43,7 @@ void arch_ftrace_update_code(int command)
>  {
>  	command |= FTRACE_MAY_SLEEP;
>  	ftrace_modify_all_code(command);
> -	flush_icache_all();
> +	flush_icache_all(false);
>  }
>  
>  static int __ftrace_modify_call(unsigned long source, unsigned long target, bool validate)
> diff --git a/arch/riscv/kernel/hibernate.c b/arch/riscv/kernel/hibernate.c
> index 671b686c01587..388f10e187bae 100644
> --- a/arch/riscv/kernel/hibernate.c
> +++ b/arch/riscv/kernel/hibernate.c
> @@ -153,7 +153,7 @@ int swsusp_arch_suspend(void)
>  	} else {
>  		suspend_restore_csrs(hibernate_cpu_context);
>  		flush_tlb_all();
> -		flush_icache_all();
> +		flush_icache_all(true);
>  
>  		/*
>  		 * Tell the hibernation core that we've just restored the memory.
> diff --git a/arch/riscv/kernel/jump_label.c b/arch/riscv/kernel/jump_label.c
> index b4c1a6a3fbd28..680b29f4c09c4 100644
> --- a/arch/riscv/kernel/jump_label.c
> +++ b/arch/riscv/kernel/jump_label.c
> @@ -51,5 +51,5 @@ bool arch_jump_label_transform_queue(struct jump_entry *entry,
>  
>  void arch_jump_label_transform_apply(void)
>  {
> -	flush_icache_all();
> +	flush_icache_all(false);
>  }
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index d83a612464f6c..01f9f7a45e8d2 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -12,19 +12,24 @@
>  #ifdef CONFIG_SMP
>  
>  #include <asm/sbi.h>
> +#include <asm/alternative-macros.h>
>  
>  static void ipi_remote_fence_i(void *info)
>  {
>  	return local_flush_icache_all();
>  }
>  
> -void flush_icache_all(void)
> +void flush_icache_all(bool force)
>  {
>  	local_flush_icache_all();
>  
>  	if (num_online_cpus() < 2)
>  		return;
>  
> +	if (!force)
> +		asm goto(ALTERNATIVE("nop", "j %l[ziccid]", 0,
> +			RISCV_ISA_EXT_ZICCID, 1)
> +			: : : : ziccid);
>  	/*
>  	 * Make sure all previous writes to the D$ are ordered before making
>  	 * the IPI. The RISC-V spec states that a hart must execute a data fence
> @@ -41,6 +46,7 @@ void flush_icache_all(void)
>  		sbi_remote_fence_i(NULL);
>  	else
>  		on_each_cpu(ipi_remote_fence_i, NULL, 1);
> +ziccid:;
>  }
>  EXPORT_SYMBOL(flush_icache_all);
>  
> @@ -61,13 +67,17 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
>  
>  	preempt_disable();
>  
> +	local_flush_icache_all();
> +
> +	asm goto(ALTERNATIVE("nop", "j %l[ziccid]", 0, RISCV_ISA_EXT_ZICCID, 1)
> +		 : : : : ziccid);
> +
>  	/* Mark every hart's icache as needing a flush for this MM. */
>  	mask = &mm->context.icache_stale_mask;
>  	cpumask_setall(mask);
>  	/* Flush this hart's I$ now, and mark it as flushed. */
>  	cpu = smp_processor_id();
>  	cpumask_clear_cpu(cpu, mask);
> -	local_flush_icache_all();
>  
>  	/*
>  	 * Flush the I$ of other harts concurrently executing, and mark them as
> @@ -91,6 +101,8 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
>  		on_each_cpu_mask(&others, ipi_remote_fence_i, NULL, 1);
>  	}
>  
> +ziccid:;
> +
>  	preempt_enable();
>  }
>  
> -- 
> 2.39.5

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
