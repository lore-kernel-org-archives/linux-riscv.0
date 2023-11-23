Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F381FC27C40
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 01:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MgiV+ZrRIxgSZ2lg/4KNFjt/qtptwCqMnC6FfFtPcUk=; b=i0LN8JEBJTO213
	0quBPDeNHkl+WAq7PI+aiDZYCYoVcNj+tD4NFbVFJRHyk8Oj6Mla4L5lJmF/maLfR0sh+cDaEH/on
	MvbVHgMw9/aASRFuYpTy8Niaw78H0IGQEN2WXR+JDbEGd/n31SmUWYfHFDEZS4WwODIRamGWl9jA7
	bPuEoUzha0Gfgp9gvddJFaB/aiJ/nVGA3PXS20DEHbewPaMBau3csl1doql2gPqvTapXsbyN02O1P
	an84ezk9qCDx3CwyoEEsD+MYFfc0yoaAJLKj1V0M8TiXfsxhfv8G+pZ8IEqP1nTaBBjMV4l9TaM6f
	dGEx4q5qT/Xjk4BNqviw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5yBi-003TE3-1M;
	Thu, 23 Nov 2023 01:07:26 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5yBf-003TDF-1M
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 01:07:25 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-58a01a9fad0so193930eaf.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 17:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1700701641; x=1701306441; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dhI6Kj7SOax34YHTzSZB20BhWZZOv5y6Dq/HW0ZZ0cE=;
        b=e5ifCEzLwikhvNoa9uGnIY4IX/RRATpxcl5lDwakL4ww1oK1hWsYvYfztpozkmOfd4
         c7QRNWIZTTISShHhT3auiPj/duDblYQyvQJ4esZ3w1dCZEsG5YTNpeZZe4jc850tXghm
         LM/G2ef5jOxCmZw8I/V6zaLUW7019ttp4u3MdVcHP9jQxdVYsxUAjhTxQJD1zw0IwPBL
         4iVZiNsbquHLI9Q8hjPktd3AbMmjWMZzdLjNjmVu9F/alCBz2UxS/bckbG4W7QPFC+M/
         pSo/oZJPyASQxd/YQLXQ71DyALZBwMGsJTC/EFVBxFsR9jBhYVWh3C/8QIi81xM6ZIOK
         Tmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700701641; x=1701306441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dhI6Kj7SOax34YHTzSZB20BhWZZOv5y6Dq/HW0ZZ0cE=;
        b=pr3t5JVyQjnPxCfAEz7zwjjo57h7Qb4sI5FSECKYfzrl/mcHg+cRmLorcfyee0Dbiy
         7GuMTi4Go0ajjlBLGH5YyUY6O78ji0ZH/k+VS9MAYa5o6mt9VAxt3yxavfI7YyJy4Qbu
         i+HPQDMClbkVjohnyaYMPmktQGumsoVH3sgYO3YWq4F4N5ykU9PpTe/8samnVUAZy9Df
         fef9I2DAk1wth5QXQIrkmHFumw5iO5kahQ0GDtFMiwWXh9stertAZqd6/AbVKawftOu9
         IKRexh688Xa4BwILCG+5GaWb7jEPrMKH3yIjNhv1TRMmQ5RtQXyIGQTKPcOzsfUwaJtv
         mRlg==
X-Gm-Message-State: AOJu0YzPY6S6ZSswDyAvWmvBocyylsWcEYLgexA/+BxVMYbPNMFxUEY2
	j8qFoUIA5tXoOB3h/VdSBYaq9g==
X-Google-Smtp-Source: AGHT+IGtf5Axj1D2CvTbndBHVJQCV0DJBvlAfN1QZAlbbbFDC4Q+5Vxo325iBr8SInwl65y/GBOOYw==
X-Received: by 2002:a05:6808:14d1:b0:3b2:f500:6ee0 with SMTP id f17-20020a05680814d100b003b2f5006ee0mr550134oiw.28.1700701641228;
        Wed, 22 Nov 2023 17:07:21 -0800 (PST)
Received: from ghost (cpe-70-95-50-247.san.res.rr.com. [70.95.50.247])
        by smtp.gmail.com with ESMTPSA id pt9-20020a0568709e4900b001f4d34ae2ecsm70243oab.23.2023.11.22.17.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 17:07:20 -0800 (PST)
Date: Wed, 22 Nov 2023 17:07:18 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, rehn@rivosinc.com,
	paulmck@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, mmaas@google.com, hboehm@google.com,
	striker@us.ibm.com
Subject: Re: [RFC PATCH] membarrier: riscv: Provide core serializing command
Message-ID: <ZV6lxsRmuN7bYFnD@ghost>
References: <mhng-b720eb90-633f-498b-a487-0cfdc9f00ddd@palmer-ri-x1c9>
 <65e98129-0617-49ca-9802-8e3a46d58d29@efficios.com>
 <ZU0sliwUQJyNAH1y@andrea>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZU0sliwUQJyNAH1y@andrea>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_170723_465361_0D139CB5 
X-CRM114-Status: GOOD (  47.32  )
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

On Thu, Nov 09, 2023 at 08:24:58PM +0100, Andrea Parri wrote:
> Mathieu, all,
> 
> Sorry for the delay,
> 
> > AFAIR this patch implements sync_core_before_usermode which gets used by
> > membarrier_mm_sync_core_before_usermode() to handle the uthread->kthread->uthread
> > case. It relies on switch_mm issuing a core serializing instruction as well.
> > 
> > Looking at RISC-V switch_mm(), I see that switch_mm() calls:
> > 
> >   flush_icache_deferred(next, cpu);
> > 
> > which only issues a fence.i if a deferred icache flush was required. We're
> > missing the part that sets the icache_stale_mask cpumask bits when a
> > MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE is invoked.
> 
> [...]
> 
> > The only part where I think you may want to keep some level of deferred
> > icache flushing as you do now is as follows:
> > 
> > - when membarrier MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE is invoked,
> >   call a new architecture hook which sets cpumask bits in the mm context
> >   that tells the next switch_mm on each cpu to issue fence.i for that mm.
> > - keep something like flush_icache_deferred as you have now.
> > 
> > Otherwise, I fear the overhead of a very expensive fence.i would be too
> > much when processes registering with MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED_SYNC_CORE
> > and start doing fence.i on each and every switch_mm().
> > 
> > So you'd basically rely on membarrier to only issue IPIs to the CPUs which are
> > currently running threads belonging to the mm, and handle the switch_mm with
> > the sync_core_before_usermode() for uthread->kthread->uthread case, and implement
> > a deferred icache flush for the typical switch_mm() case.
> 
> I've (tried to) put this together and obtained the two patches reported below.
> Please let me know if this aligns with your intentions and/or there's interest
> in a proper submission.
> 
>   Andrea
> 
> 
> From e7d07a6c04b2565fceedcd71c2175e7df7e11d96 Mon Sep 17 00:00:00 2001
> From: Andrea Parri <parri.andrea@gmail.com>
> Date: Thu, 9 Nov 2023 11:03:00 +0100
> Subject: [PATCH 1/2] locking: Introduce prepare_sync_core_cmd()
> 
> Introduce an architecture function that architectures can use to set
> up ("prepare") SYNC_CORE commands.
> 
> The function will be used by RISC-V to update its "deferred icache-
> flush" data structures (icache_stale_mask).
> 
> Architectures defining prepare_sync_core_cmd() static inline need to
> select ARCH_HAS_PREPARE_SYNC_CORE_CMD.
> 
> Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
> Suggested-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---
>  include/linux/sync_core.h | 16 +++++++++++++++-
>  init/Kconfig              |  3 +++
>  kernel/sched/membarrier.c |  1 +
>  3 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/sync_core.h b/include/linux/sync_core.h
> index 013da4b8b3272..67bb9794b8758 100644
> --- a/include/linux/sync_core.h
> +++ b/include/linux/sync_core.h
> @@ -17,5 +17,19 @@ static inline void sync_core_before_usermode(void)
>  }
>  #endif
>  
> -#endif /* _LINUX_SYNC_CORE_H */
> +#ifdef CONFIG_ARCH_HAS_PREPARE_SYNC_CORE_CMD
> +#include <asm/sync_core.h>
> +#else
> +/*
> + * This is a dummy prepare_sync_core_cmd() implementation that can be used on
> + * all architectures which provide unconditional core serializing instructions
> + * in switch_mm().
> + * If your architecture doesn't provide such core serializing instructions in
> + * switch_mm(), you may need to write your own functions.
> + */
> +static inline void prepare_sync_core_cmd(struct mm_struct *mm)
> +{
> +}
> +#endif
>  
> +#endif /* _LINUX_SYNC_CORE_H */
> diff --git a/init/Kconfig b/init/Kconfig
> index 6d35728b94b2b..61f5f982ca451 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1972,6 +1972,9 @@ source "kernel/Kconfig.locks"
>  config ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
>  	bool
>  
> +config ARCH_HAS_PREPARE_SYNC_CORE_CMD
> +	bool
> +
>  config ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
>  	bool
>  
> diff --git a/kernel/sched/membarrier.c b/kernel/sched/membarrier.c
> index 2ad881d07752c..58f801e013988 100644
> --- a/kernel/sched/membarrier.c
> +++ b/kernel/sched/membarrier.c
> @@ -320,6 +320,7 @@ static int membarrier_private_expedited(int flags, int cpu_id)
>  		      MEMBARRIER_STATE_PRIVATE_EXPEDITED_SYNC_CORE_READY))
>  			return -EPERM;
>  		ipi_func = ipi_sync_core;
> +		prepare_sync_core_cmd(mm);
>  	} else if (flags == MEMBARRIER_FLAG_RSEQ) {
>  		if (!IS_ENABLED(CONFIG_RSEQ))
>  			return -EINVAL;
> -- 
> 2.34.1
> 
> 
> From 617896a1d58a5f8b0e5895dbc928a54e0461d959 Mon Sep 17 00:00:00 2001
> From: Andrea Parri <parri.andrea@gmail.com>
> Date: Tue, 7 Nov 2023 21:08:06 +0100
> Subject: [PATCH 2/2] membarrier: riscv: Provide core serializing command
> 
> RISC-V uses xRET instructions on return from interrupt and to go back
> to user-space; the xRET instruction is not core serializing.
> 
> Use FENCE.I for providing core serialization as follows:
> 
>  - by calling sync_core_before_usermode() on return from interrupt (cf.
>    ipi_sync_core()),
> 
>  - via switch_mm() and sync_core_before_usermode() (respectively, for
>    uthread->uthread and kthread->uthread transitions) to go back to
>    user-space.
> 
> On RISC-V, the serialization in switch_mm() is activated by resetting
> the icache_stale_mask of the mm at prepare_sync_core_cmd().
> 
> Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
> Suggested-by: Palmer Dabbelt <palmer@dabbelt.com>
> ---
>  .../membarrier-sync-core/arch-support.txt     |  2 +-
>  arch/riscv/Kconfig                            |  3 +++
>  arch/riscv/include/asm/sync_core.h            | 23 +++++++++++++++++++
>  3 files changed, 27 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/include/asm/sync_core.h
> 
> diff --git a/Documentation/features/sched/membarrier-sync-core/arch-support.txt b/Documentation/features/sched/membarrier-sync-core/arch-support.txt
> index 23260ca449468..a17117d76e6d8 100644
> --- a/Documentation/features/sched/membarrier-sync-core/arch-support.txt
> +++ b/Documentation/features/sched/membarrier-sync-core/arch-support.txt
> @@ -44,7 +44,7 @@
>      |    openrisc: | TODO |
>      |      parisc: | TODO |
>      |     powerpc: |  ok  |
> -    |       riscv: | TODO |
> +    |       riscv: |  ok  |
>      |        s390: |  ok  |
>      |          sh: | TODO |
>      |       sparc: | TODO |
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 9c48fecc67191..b70a0b9ea3ee7 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -27,14 +27,17 @@ config RISCV
>  	select ARCH_HAS_GCOV_PROFILE_ALL
>  	select ARCH_HAS_GIGANTIC_PAGE
>  	select ARCH_HAS_KCOV
> +	select ARCH_HAS_MEMBARRIER_SYNC_CORE
>  	select ARCH_HAS_MMIOWB
>  	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
>  	select ARCH_HAS_PMEM_API
> +	select ARCH_HAS_PREPARE_SYNC_CORE_CMD
>  	select ARCH_HAS_PTE_SPECIAL
>  	select ARCH_HAS_SET_DIRECT_MAP if MMU
>  	select ARCH_HAS_SET_MEMORY if MMU
>  	select ARCH_HAS_STRICT_KERNEL_RWX if MMU && !XIP_KERNEL
>  	select ARCH_HAS_STRICT_MODULE_RWX if MMU && !XIP_KERNEL
> +	select ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
>  	select ARCH_HAS_SYSCALL_WRAPPER
>  	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>  	select ARCH_HAS_UBSAN_SANITIZE_ALL
> diff --git a/arch/riscv/include/asm/sync_core.h b/arch/riscv/include/asm/sync_core.h
> new file mode 100644
> index 0000000000000..8be5e07d641ab
> --- /dev/null
> +++ b/arch/riscv/include/asm/sync_core.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_RISCV_SYNC_CORE_H
> +#define _ASM_RISCV_SYNC_CORE_H
> +
> +/*
> + * RISC-V implements return to user-space through an xRET instruction,
> + * which is not core serializing.
> + */
> +static inline void sync_core_before_usermode(void)
> +{
> +	asm volatile ("fence.i" ::: "memory");
> +}
> +
> +/*
> + * Ensure the next switch_mm() on every CPU issues a core serializing
> + * instruction for the given @mm.
> + */
> +static inline void prepare_sync_core_cmd(struct mm_struct *mm)
> +{
> +	cpumask_setall(&mm->context.icache_stale_mask);
> +}
> +
> +#endif /* _ASM_RISCV_SYNC_CORE_H */
> -- 
> 2.34.1
> 

This looks good to me, can you send out a non-RFC? I just sent out
patches to support userspace fence.i:
https://lore.kernel.org/linux-riscv/20231122-fencei-v1-0-bec0811cb212@rivosinc.com/T/#t.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
