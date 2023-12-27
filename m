Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADAEC46CD4
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Dec 2023 01:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L8LLep1fauckqrQgPEJivswOnHTuByFHnYz6LPlI0G8=; b=3o5T3n7XkFxdFz
	F+WL5ff8YDUGlWZSrsiT4xm8O+eKk0duTm+xwONt/QsQq4wISC1dwW4wH+rZhu4Bio7amR0ZqFFQd
	hXwip/K4WCM0NsCIVMKZtoVYO8/qJsfkJPqqt4vs4IJxaYjg6CLi6QN+WCPNDvQzYwubIUAWFGJ2O
	Y5m8kO/dQWlEHBq4aJfeUVyFBuA0EHjQGW/LKh79z9XX46qRSuxL4Db23PsjBo/Jjss7HP0n3uSCh
	1bPb8isq7CD0lZCC1yFfU6Cm1i9rKnuDtsOUglWcn6IMW9bCBWmMcU74T/x0BEIXIh0S/uohTe+hL
	HUivxDMpNco8Dsq2OKww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIIqX-00DmAr-2D;
	Wed, 27 Dec 2023 01:36:33 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIIqU-00DmAC-1F
	for linux-riscv@lists.infradead.org;
	Wed, 27 Dec 2023 01:36:32 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-28b6218d102so3680981a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 Dec 2023 17:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703640989; x=1704245789; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5DyGN/dE9FLixGhE7eLcgPPhWl/O0kHD7yiPILUjOkc=;
        b=YCR8nxrWF2+CGm5MKyZru8kXJ2X9vFZWla4GfFcpMAopSN1y/I2cSs5+sgrsJ3P/6d
         6vvGx5mq+cECtVJpwTyImmBAM93YMB3VPPDpSp9jceZJWupEmiquqVwwjhxyCufATjGO
         v3XisJK0siMhu32qR0r5xL+KRAIFH5MMxd6zqaIt1jA2hRePVmzHxWWWuWXYJOGOWwfW
         0WG1lUxd8SAbjlDd0lMfY5dfNZ6dS8lMvbwSPlTpurPiUOMmyR3n16ArKdPNQqcSg4Kz
         XPK7smt0ctZt0pYkFLRv3LBVBPMOw6CNMgEgOGySw6xt7c2U6sin76WuBoZcoO7RsEfm
         52HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703640989; x=1704245789;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5DyGN/dE9FLixGhE7eLcgPPhWl/O0kHD7yiPILUjOkc=;
        b=DJlFOpM4+43kDCVpyW3yjx4BMip47atlltuLBdPLDz/+eev+UiN3c0NHxBhyIP3bZA
         x/ypk6gYMHNiu8G47TT6YGiha9BJMp3p/nmmTJTPBGXnOZ5pdyvI2UMxGEyRZE9TqIGf
         K9Pmm1ZZF8+lA5ZxjtfF9TKxidufVxJqA5IY8KHXpb8c++rZzsRQj3e7C06QugvSf1vD
         tcDNMCrnUd1TouhC/b8oUKlHg1KcjMcVajngcrhyCEy0hOVtokZVBhcEdroFEVBFjqRY
         1QPI7RBaSuRhH3omeW9dPlCAp8muFduO4actX6qr6CEg0M+aMBqAIjcNy9hvRr7Z/Jh4
         jhMA==
X-Gm-Message-State: AOJu0Yy6ucIzYq3CSQAXe55Wt+4Rlf6MAeDF6Jaxrpw5VyX7Mv5L+IUs
	J99LzQA+JoWBm1i9Ull2QAlTJCRHHt8hLQ==
X-Google-Smtp-Source: AGHT+IE6TqUWILWUQlImuTAt7u7d00Vh30vidDh50X0DB8GfMs7N/ekc7vlOmhxyoTLthugmBF1u3g==
X-Received: by 2002:a17:902:eb8d:b0:1d4:4ca8:eef7 with SMTP id q13-20020a170902eb8d00b001d44ca8eef7mr5336167plg.103.1703640989156;
        Tue, 26 Dec 2023 17:36:29 -0800 (PST)
Received: from ghost (070-095-050-247.res.spectrum.com. [70.95.50.247])
        by smtp.gmail.com with ESMTPSA id x19-20020a170902821300b001d4816958c2sm31045pln.166.2023.12.26.17.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Dec 2023 17:36:28 -0800 (PST)
Date: Tue, 26 Dec 2023 17:36:25 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, bjorn@kernel.org, ardb@kernel.org,
	arnd@arndb.de, peterz@infradead.org, tglx@linutronix.de,
	ebiggers@kernel.org, Vincent Chen <vincent.chen@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>,
	Baoquan He <bhe@redhat.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Guo Ren <guoren@kernel.org>, Xiao Wang <xiao.w.wang@intel.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Evan Green <evan@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [v8, 01/10] riscv: Add support for kernel mode vector
Message-ID: <ZYt/mdjRp7fNNLvc@ghost>
References: <20231223042914.18599-1-andy.chiu@sifive.com>
 <20231223042914.18599-2-andy.chiu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231223042914.18599-2-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231226_173630_448277_F46E2801 
X-CRM114-Status: GOOD (  38.03  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Dec 23, 2023 at 04:29:05AM +0000, Andy Chiu wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
> =

> Add kernel_vector_begin() and kernel_vector_end() function declarations
> and corresponding definitions in kernel_mode_vector.c
> =

> These are needed to wrap uses of vector in kernel mode.
> =

> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
> Changelog v8:
>  - Refactor unnecessary whitespace change (Eric)
> Changelog v7:
>  - fix build fail for allmodconfig
> Changelog v6:
>  - Use 8 bits to track non-preemptible vector context to provide better
>    WARN coverage.
> Changelog v4:
>  - Use kernel_v_flags and helpers to track vector context.
> Changelog v3:
>  - Reorder patch 1 to patch 3 to make use of
>    {get,put}_cpu_vector_context later.
>  - Export {get,put}_cpu_vector_context.
>  - Save V context after disabling preemption. (Guo)
>  - Fix a build fail. (Conor)
>  - Remove irqs_disabled() check as it is not needed, fix styling. (Bj=F6r=
n)
> Changelog v2:
>  - 's/kernel_rvv/kernel_vector' and return void in kernel_vector_begin
>    (Conor)
>  - export may_use_simd to include/asm/simd.h
> ---
>  arch/riscv/include/asm/processor.h     | 17 ++++-
>  arch/riscv/include/asm/simd.h          | 44 ++++++++++++
>  arch/riscv/include/asm/vector.h        | 21 ++++++
>  arch/riscv/kernel/Makefile             |  1 +
>  arch/riscv/kernel/kernel_mode_vector.c | 95 ++++++++++++++++++++++++++
>  arch/riscv/kernel/process.c            |  1 +
>  6 files changed, 178 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/include/asm/simd.h
>  create mode 100644 arch/riscv/kernel/kernel_mode_vector.c
> =

> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/=
processor.h
> index f19f861cda54..15781e2232e0 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -73,6 +73,20 @@
>  struct task_struct;
>  struct pt_regs;
>  =

> +/*
> + * We use a flag to track in-kernel Vector context. Currently the flag h=
as the
> + * following meaning:
> + *
> + *  - bit 0-7 indicates whether the in-kernel Vector context is active. =
The
> + *    activation of this state disables the preemption. On a non-RT kern=
el, it
> + *    also disable bh. Currently only 0 and 1 are valid value for this f=
ield.
> + *    Other values are reserved for future uses.
> + */
> +
> +#define RISCV_KERNEL_MODE_V_MASK	0xff
> +
> +#define RISCV_KERNEL_MODE_V	0x1
> +
>  /* CPU-specific state of a task */
>  struct thread_struct {
>  	/* Callee-saved registers */
> @@ -81,7 +95,8 @@ struct thread_struct {
>  	unsigned long s[12];	/* s[0]: frame pointer */
>  	struct __riscv_d_ext_state fstate;
>  	unsigned long bad_cause;
> -	unsigned long vstate_ctrl;
> +	u32 riscv_v_flags;
> +	u32 vstate_ctrl;
>  	struct __riscv_v_ext_state vstate;
>  	unsigned long align_ctl;
>  };
> diff --git a/arch/riscv/include/asm/simd.h b/arch/riscv/include/asm/simd.h
> new file mode 100644
> index 000000000000..3b603e47c5d8
> --- /dev/null
> +++ b/arch/riscv/include/asm/simd.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2017 Linaro Ltd. <ard.biesheuvel@linaro.org>
> + * Copyright (C) 2023 SiFive
> + */
> +
> +#ifndef __ASM_SIMD_H
> +#define __ASM_SIMD_H
> +
> +#include <linux/compiler.h>
> +#include <linux/irqflags.h>
> +#include <linux/percpu.h>
> +#include <linux/preempt.h>
> +#include <linux/types.h>
> +
> +#include <asm/vector.h>
> +
> +#ifdef CONFIG_RISCV_ISA_V
> +/*
> + * may_use_simd - whether it is allowable at this time to issue vector
> + *                instructions or access the vector register file
> + *
> + * Callers must not assume that the result remains true beyond the next
> + * preempt_enable() or return from softirq context.
> + */
> +static __must_check inline bool may_use_simd(void)
> +{
> +	/*
> +	 * RISCV_KERNEL_MODE_V is only set while preemption is disabled,
> +	 * and is clear whenever preemption is enabled.
> +	 */
> +	return !in_hardirq() && !in_nmi() && !(riscv_v_ctx_cnt() & RISCV_KERNEL=
_MODE_V_MASK);
> +}
> +
> +#else /* ! CONFIG_RISCV_ISA_V */
> +
> +static __must_check inline bool may_use_simd(void)
> +{
> +	return false;
> +}
> +
> +#endif /* ! CONFIG_RISCV_ISA_V */
> +
> +#endif
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vec=
tor.h
> index 87aaef656257..6254830c0668 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -22,6 +22,27 @@
>  extern unsigned long riscv_v_vsize;
>  int riscv_v_setup_vsize(void);
>  bool riscv_v_first_use_handler(struct pt_regs *regs);
> +void kernel_vector_begin(void);
> +void kernel_vector_end(void);
> +void get_cpu_vector_context(void);
> +void put_cpu_vector_context(void);
> +
> +static inline void riscv_v_ctx_cnt_add(u32 offset)
> +{
> +	current->thread.riscv_v_flags +=3D offset;
> +	barrier();
> +}
> +
> +static inline void riscv_v_ctx_cnt_sub(u32 offset)
> +{
> +	barrier();
> +	current->thread.riscv_v_flags -=3D offset;
> +}
> +
> +static inline u32 riscv_v_ctx_cnt(void)
> +{
> +	return READ_ONCE(current->thread.riscv_v_flags);
> +}
>  =

>  static __always_inline bool has_vector(void)
>  {
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index fee22a3d1b53..8c58595696b3 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -63,6 +63,7 @@ obj-$(CONFIG_MMU) +=3D vdso.o vdso/
>  obj-$(CONFIG_RISCV_MISALIGNED)	+=3D traps_misaligned.o
>  obj-$(CONFIG_FPU)		+=3D fpu.o
>  obj-$(CONFIG_RISCV_ISA_V)	+=3D vector.o
> +obj-$(CONFIG_RISCV_ISA_V)	+=3D kernel_mode_vector.o
>  obj-$(CONFIG_SMP)		+=3D smpboot.o
>  obj-$(CONFIG_SMP)		+=3D smp.o
>  obj-$(CONFIG_SMP)		+=3D cpu_ops.o
> diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/k=
ernel_mode_vector.c
> new file mode 100644
> index 000000000000..105147c7d2da
> --- /dev/null
> +++ b/arch/riscv/kernel/kernel_mode_vector.c
> @@ -0,0 +1,95 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2012 ARM Ltd.
> + * Author: Catalin Marinas <catalin.marinas@arm.com>
> + * Copyright (C) 2017 Linaro Ltd. <ard.biesheuvel@linaro.org>
> + * Copyright (C) 2021 SiFive
> + */
> +#include <linux/compiler.h>
> +#include <linux/irqflags.h>
> +#include <linux/percpu.h>
> +#include <linux/preempt.h>
> +#include <linux/types.h>
> +
> +#include <asm/vector.h>
> +#include <asm/switch_to.h>
> +#include <asm/simd.h>
> +
> +/*
> + * Claim ownership of the CPU vector context for use by the calling cont=
ext.
> + *
> + * The caller may freely manipulate the vector context metadata until
> + * put_cpu_vector_context() is called.
> + */
> +void get_cpu_vector_context(void)
> +{
> +	preempt_disable();
> +
> +	WARN_ON((riscv_v_ctx_cnt() & RISCV_KERNEL_MODE_V_MASK) !=3D 0);
> +	riscv_v_ctx_cnt_add(RISCV_KERNEL_MODE_V);

In our last conversation I thought we agreed that a bitwise operation
would be more appropriate then addition. You also mentioned allowing
this function to be called multiple times. Did something change?

- Charlie

> +}
> +
> +/*
> + * Release the CPU vector context.
> + *
> + * Must be called from a context in which get_cpu_vector_context() was
> + * previously called, with no call to put_cpu_vector_context() in the
> + * meantime.
> + */
> +void put_cpu_vector_context(void)
> +{
> +	WARN_ON((riscv_v_ctx_cnt() & RISCV_KERNEL_MODE_V_MASK) !=3D RISCV_KERNE=
L_MODE_V);
> +	riscv_v_ctx_cnt_sub(RISCV_KERNEL_MODE_V);
> +
> +	preempt_enable();
> +}
> +
> +/*
> + * kernel_vector_begin(): obtain the CPU vector registers for use by the=
 calling
> + * context
> + *
> + * Must not be called unless may_use_simd() returns true.
> + * Task context in the vector registers is saved back to memory as neces=
sary.
> + *
> + * A matching call to kernel_vector_end() must be made before returning =
from the
> + * calling context.
> + *
> + * The caller may freely use the vector registers until kernel_vector_en=
d() is
> + * called.
> + */
> +void kernel_vector_begin(void)
> +{
> +	if (WARN_ON(!has_vector()))
> +		return;
> +
> +	BUG_ON(!may_use_simd());
> +
> +	get_cpu_vector_context();
> +
> +	riscv_v_vstate_save(current, task_pt_regs(current));
> +
> +	riscv_v_enable();
> +}
> +EXPORT_SYMBOL_GPL(kernel_vector_begin);
> +
> +/*
> + * kernel_vector_end(): give the CPU vector registers back to the curren=
t task
> + *
> + * Must be called from a context in which kernel_vector_begin() was prev=
iously
> + * called, with no call to kernel_vector_end() in the meantime.
> + *
> + * The caller must not use the vector registers after this function is c=
alled,
> + * unless kernel_vector_begin() is called again in the meantime.
> + */
> +void kernel_vector_end(void)
> +{
> +	if (WARN_ON(!has_vector()))
> +		return;
> +
> +	riscv_v_vstate_restore(current, task_pt_regs(current));
> +
> +	riscv_v_disable();
> +
> +	put_cpu_vector_context();
> +}
> +EXPORT_SYMBOL_GPL(kernel_vector_end);
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 4f21d970a129..4a1275db1146 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -221,6 +221,7 @@ int copy_thread(struct task_struct *p, const struct k=
ernel_clone_args *args)
>  		childregs->a0 =3D 0; /* Return value of fork() */
>  		p->thread.s[0] =3D 0;
>  	}
> +	p->thread.riscv_v_flags =3D 0;
>  	p->thread.ra =3D (unsigned long)ret_from_fork;
>  	p->thread.sp =3D (unsigned long)childregs; /* kernel sp */
>  	return 0;
> -- =

> 2.17.1
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
