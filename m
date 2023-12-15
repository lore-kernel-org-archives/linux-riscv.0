Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933A8C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 06:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yXKwL1RzIXxwkeIjwakXsrV33bEaC25UpYa8sfR8yF8=; b=kMVE+hMdKJhY4U
	h/4hMN0lvXTmf/TODuIDD7nJzKb4XtzEvSl+gnkG/Kuw2m/MzsyanuJOaWaE6BxFLKd+Ri7Y7CdEU
	okJWZrBXLKyEcxLTspqT0WYQ50DgaJuu57uC3Xe6ahIHKgDG9wKxrAsi4O3HkEw6cY6OCdcSlf4dZ
	Dsz2Uz0aowhlsQtLuNAEJ7JXLYdnzBTiIxIGetBWfAraKNdFgKBcWJSEk9GXRo12ueHfh0/OgbuJg
	bc2ym0zQWbB19FtYdi0e3nJg00ZUHeASEcNWWMN4c/MKCfUcnGR3W1OjIfdeyacI2jpdoLhG5cN66
	gNRQ30Zpyn/JI0K14Q2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE1cr-002BM1-0e;
	Fri, 15 Dec 2023 06:24:45 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE1cm-002BKk-2t
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 06:24:43 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6d9e756cf32so347948a34.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 Dec 2023 22:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702621478; x=1703226278; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+E2D7gVkHacASRXL5ygjcuipCPlLpzybg8SBRvFI25g=;
        b=nmNBGw+KpSCRs3csisKpkyVIyCs/q3jANuHc8A0oDyh9KQ3pileX5GXrChvLlgArnE
         7KaR0z5NVwcjAlADJ4mSuhqhTYdZg/LYw67uNxxSl8NKiqUNJAPvsl0h8a/Ln0KpRzYJ
         iSVkTVBgLKBvntL9d13WCYXk6AMebl1kaDEgKYNyEG2fj+5NI/9r0rFE4mS+SGxndHsp
         ay8daUnUysdUMuqp8xg4vivGovBR0QrenkDeLW9Zqzm8bvxQRtAYkNO/6wXwWIFYtNXB
         s86z79jXxYFdiEme+PeYKI7iAnWwkXnltP5xBir5cTnetrj5cUlWUL4BloRqJIeQDlOP
         0IBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702621478; x=1703226278;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+E2D7gVkHacASRXL5ygjcuipCPlLpzybg8SBRvFI25g=;
        b=Kq568cNvAWsYT1MCgYarGtsbzBJmLrx5Qv0AITIfcfexWgVLB04G8Sn0RwC0fGYSls
         zcKoTrGJ+6Ku+Sc8uciOW+euA+CkHPrgejfFlFUeQzGYLSuQtiLDLLwez7/trqtwnGXi
         40ULQfKDaL6UXgB7snBmv12UZFmvOzS6oakSQ1kugCuuf6qrQZzOU+bfQoDAGBU+Srqy
         /xppSuU3X1s+TOHshlqmWhgCaM3ugZA4ooDaoaPanPt2InOh5oY3g3tQ3QocXRNIFCCR
         pA2KT7W0Jp8yBEXBNWkTY4WuS5qr0v9EonLjJOwrmYKfCFQ6rqoRMBaMt+ZvppAnOwos
         uwDQ==
X-Gm-Message-State: AOJu0YxnaUsxxTjxZG7xkEsaYGzU7yg8+pAhfWAOcNycuwDg5xF5nuKW
	8dJAFJWWrUTiGK1mtDCeV+81DA==
X-Google-Smtp-Source: AGHT+IEuzU79d5GO3cGCrLllasZJrL96H29zUXEn3B7cB7Vp/LfPEBYV1MXHAcG3MDcyxm8sF0nT3w==
X-Received: by 2002:a05:6808:22a1:b0:3ba:b41:aff6 with SMTP id bo33-20020a05680822a100b003ba0b41aff6mr9321899oib.19.1702621478424;
        Thu, 14 Dec 2023 22:24:38 -0800 (PST)
Received: from ghost ([2601:642:4c00:261c:91c3:e862:22d2:ad26])
        by smtp.gmail.com with ESMTPSA id f22-20020a05680814d600b003b8b8d37f4esm3656851oiw.15.2023.12.14.22.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 22:24:37 -0800 (PST)
Date: Thu, 14 Dec 2023 22:24:34 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	greentime.hu@sifive.com, guoren@linux.alibaba.com, bjorn@kernel.org,
	ardb@kernel.org, arnd@arndb.de,
	Vincent Chen <vincent.chen@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Guo Ren <guoren@kernel.org>, Xiao Wang <xiao.w.wang@intel.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [v5, 1/6] riscv: Add support for kernel mode vector
Message-ID: <ZXvxIuZwCQ8zeXhr@ghost>
References: <20231214155721.1753-1-andy.chiu@sifive.com>
 <20231214155721.1753-2-andy.chiu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231214155721.1753-2-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_222441_124836_6539B9A3 
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Dec 14, 2023 at 03:57:16PM +0000, Andy Chiu wrote:
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
>  arch/riscv/include/asm/processor.h     | 15 +++-
>  arch/riscv/include/asm/simd.h          | 42 ++++++++++++
>  arch/riscv/include/asm/vector.h        | 21 ++++++
>  arch/riscv/kernel/Makefile             |  1 +
>  arch/riscv/kernel/kernel_mode_vector.c | 95 ++++++++++++++++++++++++++
>  arch/riscv/kernel/process.c            |  2 +-
>  6 files changed, 174 insertions(+), 2 deletions(-)
>  create mode 100644 arch/riscv/include/asm/simd.h
>  create mode 100644 arch/riscv/kernel/kernel_mode_vector.c
> =

> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/=
processor.h
> index f19f861cda54..a47763c262e1 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -73,6 +73,18 @@
>  struct task_struct;
>  struct pt_regs;
>  =

> +/*
> + * We use a flag to track in-kernel Vector context. Currently the flag h=
as the
> + * following meaning:
> + *
> + *  - bit 0 indicates whether the in-kernel Vector context is active. The
> + *    activation of this state disables the preemption.
> + */
> +
> +#define RISCV_KERNEL_MODE_V_MASK	0x1
> +
> +#define RISCV_KERNEL_MODE_V	0x1
> +
>  /* CPU-specific state of a task */
>  struct thread_struct {
>  	/* Callee-saved registers */
> @@ -81,7 +93,8 @@ struct thread_struct {
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
> index 000000000000..269752bfa2cc
> --- /dev/null
> +++ b/arch/riscv/include/asm/simd.h
> @@ -0,0 +1,42 @@
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
> index 000000000000..c9ccf21dd16c
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
> +	WARN_ON(riscv_v_ctx_cnt() & RISCV_KERNEL_MODE_V_MASK);

This is a bigger issue than a warn. Calling riscv_v_ctx_cnt_add with
the same flag an even number of times will cause (riscv_v_ctx_cnt() &
RISCV_KERNEL_MODE_V_MASK) to return 0, even though vector is being used.
This could be solved by using a bitwise or instead of addition when
setting the flag.

> +	riscv_v_ctx_cnt_add(RISCV_KERNEL_MODE_V);
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
> +	WARN_ON(!(riscv_v_ctx_cnt() & RISCV_KERNEL_MODE_V_MASK));
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

Should this be WARN_ONCE? If somebody runs a kernel compiled with vector
on hardware without vector, this warning has the potential to be thrown
an excessive amount of times.

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

Same as above.

- Charlie

>+		return;
> +
> +	riscv_v_vstate_restore(current, task_pt_regs(current));
> +
> +	riscv_v_disable();
> +
> +	put_cpu_vector_context();
> +}
> +EXPORT_SYMBOL_GPL(kernel_vector_end);
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 4f21d970a129..5c4dcf518684 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -187,7 +187,6 @@ int arch_dup_task_struct(struct task_struct *dst, str=
uct task_struct *src)
>  	*dst =3D *src;
>  	/* clear entire V context, including datap for a new task */
>  	memset(&dst->thread.vstate, 0, sizeof(struct __riscv_v_ext_state));
> -
>  	return 0;
>  }
>  =

> @@ -221,6 +220,7 @@ int copy_thread(struct task_struct *p, const struct k=
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
