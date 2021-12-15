Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D4AC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Dec 2021 18:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=/6srONKtGlKOTEBQNGMJfGzJxB+UyEPV96TlNCZIVDg=; b=1NOldL4RKzTQPQ
	xdkhcgROMBymk3Rv8Hu5+ugiDZJR9jrRmCuwzIAxowNibauWJR8UQnc2Gl4+nUuqfE5ZvRpR/dg1w
	tbYFfb5EmDWKuC3pZPiHZ9T7JZd0VrzJSWk6gjaKQUCyW68gDMfkNUzbok4kDdfNCQ7dbAOiXTgEU
	mX4wv4m0eqwoonHP+V9KZkcq7rj6tlLw0TXNC5ChJUnKlZ2lYKG8KQUV/cr+mjluNjNjIrJQdrbiz
	WKmCydQ8gWJjf1IsFrOivCPyvoRgqGWjdRDZAIi5/t7zt3PZdY1tGSrJ9aKGpamjZMZ9OJqsKvo/Q
	a0h1fefglgU1OjaEgZfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxZB2-002H1X-S2; Wed, 15 Dec 2021 18:38:56 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxZB0-002Gzl-46
 for linux-riscv@lists.infradead.org; Wed, 15 Dec 2021 18:38:56 +0000
Received: by mail-pf1-x434.google.com with SMTP id g19so21466115pfb.8
 for <linux-riscv@lists.infradead.org>; Wed, 15 Dec 2021 10:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id;
 bh=GtRrFmJ59dSk24KTwskT20WaVT81BdFYhpMwSo9X6i4=;
 b=DPczdgx1206d/x6Z4y9WN8fvGJfIoIobqgzxdspNZerl1rqvL3C5GPEpF+WgEmfXDA
 suhgoOObTONE9FWw0CQPISfGV8PBky3lVsGjxEnY6SaJI5ck7JabpbLy0uP19HoaXmbb
 gdooj2PQVA7zCKAqdf7rz8nTUbqttm7KZT/JuRiRr79WBPhRnyxNOrr6s1ImMJ4eKoH/
 7gx1GQdou0BxyOQxP/rn0Fog9AkgIkDHEDXMIXufXzkReRPtdlUZ3XHTwYpUJv/HhbHV
 iNs38AGNgxlmuW2Fo3OwMOB3NXm5bFOkXxel7HkuV9yVbfCLZb5iXOPis3pvze52h1Ah
 Wp2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id;
 bh=GtRrFmJ59dSk24KTwskT20WaVT81BdFYhpMwSo9X6i4=;
 b=aBoDEkwXgwfyFfhAaPwIOLDL4f1MbOhoWR2fT4Em0ofdz712KMaPdhQcuu8DO2UxfW
 GLqiOM+BY+GzA2lSymHjs7Ac/bdFIT15TZk7ekoQVIzJUg9eApPRun5TUctp3ezPyZQ2
 XxCXhQV+0VbM532QyST5dlwilvkExspzhiDZFOYQmN4hxdabcBhBp68BLeSjyJ4G2raV
 ft4YlkllJVSbOXfnZhpY0g5acXAii0713+ljx/UREc4e8Vs4voxNUr9d2L79254CkHQq
 oxctdTmdBfsUMtDq1hnq8pJYYwtvJ8leF2dpovhtsle2+NKHQj4xSogtmaekE501+kXA
 LUlQ==
X-Gm-Message-State: AOAM533/CapLUY+mB3hWMdhymuljAGp1OzzHlmmeR5SnLmtf636KfRCP
 nOvbsY3v+1WUhRVx9N92VroX1Q==
X-Google-Smtp-Source: ABdhPJwXgb0w1kWw0SjAskPKDV9BE5r6ckR7XSed0q144od/hZnmIOFwXQI+v4O1KbDhfLGPDaUtFg==
X-Received: by 2002:a63:2bc1:: with SMTP id r184mr8722759pgr.426.1639593525462; 
 Wed, 15 Dec 2021 10:38:45 -0800 (PST)
Received: from localhost ([12.163.77.120])
 by smtp.gmail.com with ESMTPSA id u3sm3729490pfk.32.2021.12.15.10.38.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 10:38:44 -0800 (PST)
Date: Wed, 15 Dec 2021 10:38:44 -0800 (PST)
X-Google-Original-Date: Wed, 15 Dec 2021 10:38:28 PST (-0800)
Subject: Re: [PATCH v9 09/17] riscv: Add task switch support for vector
In-Reply-To: <d2482c426887b79ddb0e6643cf7fc1a05e7225ca.1636362169.git.greentime.hu@sifive.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: greentime.hu@sifive.com
Message-ID: <mhng-3fbb9a3b-289f-4764-99b1-565dbddb5450@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_103854_200508_09F04E40 
X-CRM114-Status: GOOD (  35.87  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 09 Nov 2021 01:48:21 PST (-0800), greentime.hu@sifive.com wrote:
> This patch adds task switch support for vector. It supports partial lazy
> save and restore mechanism. It also supports all lengths of vlen.
>
> [guoren@linux.alibaba.com: First available porting to support vector
> context switching]
> [nick.knight@sifive.com: Rewrite vector.S to support dynamic vlen, xlen and
> code refine]
> [vincent.chen@sifive.com: Fix the might_sleep issue in vstate_save,
> vstate_restore]
> [andrew@sifive.com: Optimize task switch codes of vector]
>
> Suggested-by: Andrew Waterman <andrew@sifive.com>
> Co-developed-by: Nick Knight <nick.knight@sifive.com>
> Signed-off-by: Nick Knight <nick.knight@sifive.com>
> Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  arch/riscv/include/asm/switch_to.h | 65 ++++++++++++++++++++++++
>  arch/riscv/kernel/Makefile         |  1 +
>  arch/riscv/kernel/process.c        | 49 ++++++++++++++++++
>  arch/riscv/kernel/vector.S         | 81 ++++++++++++++++++++++++++++++
>  4 files changed, 196 insertions(+)
>  create mode 100644 arch/riscv/kernel/vector.S
>
> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
> index ec83770b3d98..576204217e0f 100644
> --- a/arch/riscv/include/asm/switch_to.h
> +++ b/arch/riscv/include/asm/switch_to.h
> @@ -7,10 +7,12 @@
>  #define _ASM_RISCV_SWITCH_TO_H
>
>  #include <linux/jump_label.h>
> +#include <linux/slab.h>
>  #include <linux/sched/task_stack.h>
>  #include <asm/processor.h>
>  #include <asm/ptrace.h>
>  #include <asm/csr.h>
> +#include <asm/asm-offsets.h>
>
>  #ifdef CONFIG_FPU
>  extern void __fstate_save(struct task_struct *save_to);
> @@ -68,6 +70,67 @@ static __always_inline bool has_fpu(void) { return false; }
>  #define __switch_to_fpu(__prev, __next) do { } while (0)
>  #endif
>
> +#ifdef CONFIG_VECTOR
> +extern struct static_key_false cpu_hwcap_vector;
> +static __always_inline bool has_vector(void)
> +{
> +	return static_branch_likely(&cpu_hwcap_vector);
> +}
> +extern unsigned long riscv_vsize;
> +extern void __vstate_save(struct __riscv_v_state *save_to, void *datap);
> +extern void __vstate_restore(struct __riscv_v_state *restore_from, void *datap);
> +
> +static inline void __vstate_clean(struct pt_regs *regs)
> +{
> +	regs->status = (regs->status & ~(SR_VS)) | SR_VS_CLEAN;
> +}
> +
> +static inline void vstate_off(struct task_struct *task,
> +			      struct pt_regs *regs)
> +{
> +	regs->status = (regs->status & ~SR_VS) | SR_VS_OFF;
> +}
> +
> +static inline void vstate_save(struct task_struct *task,
> +			       struct pt_regs *regs)
> +{
> +	if ((regs->status & SR_VS) == SR_VS_DIRTY) {
> +		struct __riscv_v_state *vstate = &(task->thread.vstate);
> +
> +		__vstate_save(vstate, vstate->datap);
> +		__vstate_clean(regs);
> +	}
> +}
> +
> +static inline void vstate_restore(struct task_struct *task,
> +				  struct pt_regs *regs)
> +{
> +	if ((regs->status & SR_VS) != SR_VS_OFF) {
> +		struct __riscv_v_state *vstate = &(task->thread.vstate);
> +		__vstate_restore(vstate, vstate->datap);
> +		__vstate_clean(regs);
> +	}
> +}
> +
> +static inline void __switch_to_vector(struct task_struct *prev,
> +				   struct task_struct *next)
> +{
> +	struct pt_regs *regs;
> +
> +	regs = task_pt_regs(prev);
> +	if (unlikely(regs->status & SR_SD))
> +		vstate_save(prev, regs);
> +	vstate_restore(next, task_pt_regs(next));
> +}
> +
> +#else
> +static __always_inline bool has_vector(void) { return false; }
> +#define riscv_vsize (0)
> +#define vstate_save(task, regs) do { } while (0)
> +#define vstate_restore(task, regs) do { } while (0)
> +#define __switch_to_vector(__prev, __next) do { } while (0)
> +#endif
> +
>  extern struct task_struct *__switch_to(struct task_struct *,
>  				       struct task_struct *);
>
> @@ -77,6 +140,8 @@ do {							\
>  	struct task_struct *__next = (next);		\
>  	if (has_fpu())					\
>  		__switch_to_fpu(__prev, __next);	\
> +	if (has_vector())					\
> +		__switch_to_vector(__prev, __next);	\
>  	((last) = __switch_to(__prev, __next));		\
>  } while (0)
>
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index 3397ddac1a30..344078080839 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -40,6 +40,7 @@ obj-$(CONFIG_MMU) += vdso.o vdso/
>
>  obj-$(CONFIG_RISCV_M_MODE)	+= traps_misaligned.o
>  obj-$(CONFIG_FPU)		+= fpu.o
> +obj-$(CONFIG_VECTOR)		+= vector.o
>  obj-$(CONFIG_SMP)		+= smpboot.o
>  obj-$(CONFIG_SMP)		+= smp.o
>  obj-$(CONFIG_SMP)		+= cpu_ops.o
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 03ac3aa611f5..62540815ba1c 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -95,6 +95,25 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
>  		 */
>  		fstate_restore(current, regs);
>  	}
> +
> +	if (has_vector()) {
> +		struct __riscv_v_state *vstate = &(current->thread.vstate);
> +
> +		/* Enable vector and allocate memory for vector registers. */
> +		if (!vstate->datap) {
> +			vstate->datap = kzalloc(riscv_vsize, GFP_KERNEL);
> +			if (WARN_ON(!vstate->datap))
> +				return;
> +		}
> +		regs->status |= SR_VS_INITIAL;
> +
> +		/*
> +		 * Restore the initial value to the vector register
> +		 * before starting the user program.
> +		 */
> +		vstate_restore(current, regs);
> +	}
> +
>  	regs->epc = pc;
>  	regs->sp = sp;
>  }
> @@ -110,15 +129,45 @@ void flush_thread(void)
>  	fstate_off(current, task_pt_regs(current));
>  	memset(&current->thread.fstate, 0, sizeof(current->thread.fstate));
>  #endif
> +#ifdef CONFIG_VECTOR
> +	/* Reset vector state and keep datap pointer. */
> +	vstate_off(current, task_pt_regs(current));
> +	memset(&current->thread.vstate, 0, RISCV_V_STATE_DATAP);
> +	if (current->thread.vstate.datap)
> +		memset(current->thread.vstate.datap, 0, riscv_vsize);
> +#endif
>  }
>
>  int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
>  {
>  	fstate_save(src, task_pt_regs(src));
> +	if (has_vector())
> +		/* To make sure every dirty vector context is saved. */
> +		vstate_save(src, task_pt_regs(src));

Isn't the has_vector() check unnecessary?  It looks to be thes ame as 
fstate_save(), where we can just rely in the internal check.

>  	*dst = *src;
> +	if (has_vector()) {
> +		/* Copy vector context to the forked task from parent. */

Unless I'm missing something, this shouldn't be necessary: we got here 
via some syscall, and since those all follow the standard ABI the V 
registers have all been clobbered.  Thus we should be able to just toss 
the vector state here.  arm64 goes a step farther and explicitly tosses 
the SVE state on syscalls, which seems reasonable to me as that'd allow 
us to avoid some unnecessary save/restore overhead.

A few bits of the V state are defined with thread-duration storage, so 
we'd need to split those out to be saved (I guess we could define them 
as clobbered by syscalls, but that seems like the wrong way to go to 
me).

> +		if ((task_pt_regs(src)->status & SR_VS) != SR_VS_OFF) {
> +			dst->thread.vstate.datap = kzalloc(riscv_vsize, GFP_KERNEL);
> +			/* Failed to allocate memory. */
> +			if (!dst->thread.vstate.datap)
> +				return -ENOMEM;
> +			/* Copy the src vector context to dst. */
> +			memcpy(dst->thread.vstate.datap,
> +			       src->thread.vstate.datap, riscv_vsize);
> +		}
> +	}
> +
>  	return 0;
>  }
>
> +void arch_release_task_struct(struct task_struct *tsk)
> +{
> +	/* Free the vector context of datap. */
> +	if (has_vector())
> +		kfree(tsk->thread.vstate.datap);
> +}
> +
>  int copy_thread(unsigned long clone_flags, unsigned long usp, unsigned long arg,
>  		struct task_struct *p, unsigned long tls)
>  {
> diff --git a/arch/riscv/kernel/vector.S b/arch/riscv/kernel/vector.S
> new file mode 100644
> index 000000000000..7f3e3a838424
> --- /dev/null
> +++ b/arch/riscv/kernel/vector.S
> @@ -0,0 +1,81 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2012 Regents of the University of California
> + * Copyright (C) 2017 SiFive
> + * Copyright (C) 2019 Alibaba Group Holding Limited
> + *
> + *   This program is free software; you can redistribute it and/or
> + *   modify it under the terms of the GNU General Public License
> + *   as published by the Free Software Foundation, version 2.
> + *
> + *   This program is distributed in the hope that it will be useful,
> + *   but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *   GNU General Public License for more details.
> + */
> +
> +#include <linux/linkage.h>
> +
> +#include <asm/asm.h>
> +#include <asm/csr.h>
> +#include <asm/asm-offsets.h>
> +
> +#define vstatep  a0
> +#define datap    a1
> +#define x_vstart t0
> +#define x_vtype  t1
> +#define x_vl     t2
> +#define x_vcsr   t3
> +#define incr     t4
> +#define status   t5
> +
> +ENTRY(__vstate_save)
> +	li      status, SR_VS
> +	csrs    sstatus, status
> +
> +	csrr    x_vstart, CSR_VSTART
> +	csrr    x_vtype, CSR_VTYPE
> +	csrr    x_vl, CSR_VL
> +	csrr    x_vcsr, CSR_VCSR
> +	vsetvli incr, x0, e8, m8
> +	vse8.v   v0, (datap)
> +	add     datap, datap, incr
> +	vse8.v   v8, (datap)
> +	add     datap, datap, incr
> +	vse8.v   v16, (datap)
> +	add     datap, datap, incr
> +	vse8.v   v24, (datap)
> +
> +	REG_S   x_vstart, RISCV_V_STATE_VSTART(vstatep)
> +	REG_S   x_vtype, RISCV_V_STATE_VTYPE(vstatep)
> +	REG_S   x_vl, RISCV_V_STATE_VL(vstatep)
> +	REG_S   x_vcsr, RISCV_V_STATE_VCSR(vstatep)
> +
> +	csrc	sstatus, status
> +	ret
> +ENDPROC(__vstate_save)
> +
> +ENTRY(__vstate_restore)
> +	li      status, SR_VS
> +	csrs    sstatus, status
> +
> +	vsetvli incr, x0, e8, m8
> +	vle8.v   v0, (datap)
> +	add     datap, datap, incr
> +	vle8.v   v8, (datap)
> +	add     datap, datap, incr
> +	vle8.v   v16, (datap)
> +	add     datap, datap, incr
> +	vle8.v   v24, (datap)
> +
> +	REG_L   x_vstart, RISCV_V_STATE_VSTART(vstatep)
> +	REG_L   x_vtype, RISCV_V_STATE_VTYPE(vstatep)
> +	REG_L   x_vl, RISCV_V_STATE_VL(vstatep)
> +	REG_L   x_vcsr, RISCV_V_STATE_VCSR(vstatep)
> +	vsetvl  x0, x_vl, x_vtype
> +	csrw    CSR_VSTART, x_vstart
> +	csrw    CSR_VCSR, x_vcsr
> +
> +	csrc	sstatus, status
> +	ret
> +ENDPROC(__vstate_restore)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
