Return-Path: <SRS0=lIhr=KV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00121C2B9F7
	for <linux-riscv@archiver.kernel.org>; Wed, 26 May 2021 05:32:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A322A613D3
	for <linux-riscv@archiver.kernel.org>; Wed, 26 May 2021 05:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A322A613D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=bpiiIiJS4QzAJ2ONxfho+v29rdFFEP7ZK2rmovZ6a6o=; b=hcr+sZ6VbclIGtqcszs8Kpud8R
	G9h73vYDo1k9Y72znmRXiEHj08991EaDxFgSsSAxCcpqGrWZPWS0gDnnCyeuVtx7E9+MOSJ520Qwr
	+ISpzW/CotKQZjt5zEuXIcHSxGO5VzmfuuMq7WK099v1KP+HY/UPD+z70EdeERyD6bZZbTioKsMqH
	2d1tq+dGkCgcsOp5Y1DG4uViddSMbevgWdbO4p0T4B+RjeJSsblQKWOCwp4rjs1fQd3o0TvCQqXfU
	dfVFP/iFfXqlzM105yMeibIhuoEtsg4cDooabtozcTsGs2RRsp+a+DgzWq9rsKeKDVTaQbX/keSZU
	m1ubgOkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llm9Q-00BD7X-5s; Wed, 26 May 2021 05:32:16 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llm9M-00BD5d-NV
 for linux-riscv@lists.infradead.org; Wed, 26 May 2021 05:32:14 +0000
Received: by mail-pf1-x433.google.com with SMTP id y202so107712pfc.6
 for <linux-riscv@lists.infradead.org>; Tue, 25 May 2021 22:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=qc3ScWmCNnasw4nROjWuKMgrAOjs/3VPUms2nMn4scQ=;
 b=XqmpLFtRqwdITCAzv0wYvQM9A5dzaPYw9F0mfoZpPxfht3fb8VVOHKkrZKfXwcCCEX
 xT+tpdiZWMw2kD8UIUa6gw5iAcEOr+WJFoGiGG/W4Sn/U7mZlpUOlmTG1P/uP05bbkUR
 UmPPvashiVGlqvicGCe/+xFxrT01g3L7rGLZRe7QFjNCuMwePfwvICMIXzewM0R+WV42
 8IiqL5INIEfItwhVaIgr9GMykcclEwTgj+bvmg69wyr0yIe90IbgLPQtr9rJ/KwwqxJ3
 HWJud6IYJA4A6xny254gSvobfmX978sXd5zgZVUdmDuhUN9es/UDJZOyakqI5SVVZ8xz
 vmIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=qc3ScWmCNnasw4nROjWuKMgrAOjs/3VPUms2nMn4scQ=;
 b=DJTPelYYb7nU7ASr2zYipLYixgpXsgJkLJ4zzvk81KZUeSSYI9FYW5ohCT3zJ8B4ja
 K04YdnsmIaaRNnv02gUSPEs+R3Hpx83q6LweWp8VeyNmh+lnYkkxGQD3FXtNFLRqBRPA
 T21rGWOMALfXPXR7xZ9OtwPPp4bXmuVsoSO/Hhk3NjSQJb1lLk+0A3dPqBPB1NaMMYks
 aeyJYCu8jL10fs7169ZBOHA5IQGLGz2b992if3rrOHQltfIechBN8Ws41RZHDZ4g5bEk
 ztXbStHujHqEFUeuvVHuKSwDPyrzKyHjCvr7SVkw/7yXchJ2aJ34Vn1r/zS93skv5uiw
 qKAQ==
X-Gm-Message-State: AOAM5319H6kgdlwuaRrbCPFiuDk0+xjUB5Xftmu1+Rz92g9w1qqc3M5n
 42BLIDRXli7etD3t5SJmjw7tBQ==
X-Google-Smtp-Source: ABdhPJyhkNeQUGt+23cOlj65ptSKxKDlz580W3BDZBkGsjAFdckDp9WZfwF3sgzh6mVQrdBB8HPBQw==
X-Received: by 2002:a65:61a8:: with SMTP id i8mr22930126pgv.271.1622007129710; 
 Tue, 25 May 2021 22:32:09 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id t12sm3289150pjw.57.2021.05.25.22.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 22:32:09 -0700 (PDT)
Date: Tue, 25 May 2021 22:32:09 -0700 (PDT)
X-Google-Original-Date: Tue, 25 May 2021 22:32:06 PDT (-0700)
Subject: Re: [PATCH] riscv: Turn has_fpu into a static key if FPU
In-Reply-To: <20210512020152.200a182d@xhacker>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang3@mail.ustc.edu.cn
Message-ID: <mhng-b76d372f-5cc3-409d-bbab-7b8cb9f9199e@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_223212_797107_764CE985 
X-CRM114-Status: GOOD (  25.62  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 11 May 2021 11:01:52 PDT (-0700), jszhang3@mail.ustc.edu.cn wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
>
> The has_fpu check sits at hot code path: switch_to(). Currently, has_fpu
> is a bool variable if FPU, switch_to() checks it each time, we can
> optimize out this check by turning the has_fpu into a static key.
>
> Before the patch:
> 	...
> 	ccc7c783		lbu     a5,-820(a5) # ffffffff80cab098 <has_fpu>
> 	e3b5			bnez    a5,ffffffff8031a438 <__schedule+0x232>
> 	...
>
> After the patch:
> If FPU isn't supported:
> 	...
> 	00000013		nop
> 	...
>
> If FPU is supported:
> 	...
> 	0540006f                j       ffffffff8031a418 <__schedule+0x21a>
> 	...
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/switch_to.h | 11 ++++++++---
>  arch/riscv/kernel/cpufeature.c     |  4 ++--
>  arch/riscv/kernel/process.c        |  2 +-
>  arch/riscv/kernel/signal.c         |  4 ++--
>  4 files changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
> index 407bcc96a710..ea25ccb7785e 100644
> --- a/arch/riscv/include/asm/switch_to.h
> +++ b/arch/riscv/include/asm/switch_to.h
> @@ -6,6 +6,7 @@
>  #ifndef _ASM_RISCV_SWITCH_TO_H
>  #define _ASM_RISCV_SWITCH_TO_H
>
> +#include <linux/jump_label.h>
>  #include <linux/sched/task_stack.h>
>  #include <asm/processor.h>
>  #include <asm/ptrace.h>
> @@ -55,9 +56,13 @@ static inline void __switch_to_aux(struct task_struct *prev,
>  	fstate_restore(next, task_pt_regs(next));
>  }
>
> -extern bool has_fpu;
> +extern struct static_key_false cpu_hwcap_fpu;
> +static __always_inline bool has_fpu(void)
> +{
> +	return static_branch_unlikely(&cpu_hwcap_fpu);
> +}
>  #else
> -#define has_fpu false
> +static __always_inline bool has_fpu(void) { return false; }
>  #define fstate_save(task, regs) do { } while (0)
>  #define fstate_restore(task, regs) do { } while (0)
>  #define __switch_to_aux(__prev, __next) do { } while (0)
> @@ -70,7 +75,7 @@ extern struct task_struct *__switch_to(struct task_struct *,
>  do {							\
>  	struct task_struct *__prev = (prev);		\
>  	struct task_struct *__next = (next);		\
> -	if (has_fpu)					\
> +	if (has_fpu())					\
>  		__switch_to_aux(__prev, __next);	\
>  	((last) = __switch_to(__prev, __next));		\
>  } while (0)
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index ac202f44a670..a2848dc36927 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -19,7 +19,7 @@ unsigned long elf_hwcap __read_mostly;
>  static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
>
>  #ifdef CONFIG_FPU
> -bool has_fpu __read_mostly;
> +__ro_after_init DEFINE_STATIC_KEY_FALSE(cpu_hwcap_fpu);
>  #endif
>
>  /**
> @@ -146,6 +146,6 @@ void riscv_fill_hwcap(void)
>
>  #ifdef CONFIG_FPU
>  	if (elf_hwcap & (COMPAT_HWCAP_ISA_F | COMPAT_HWCAP_ISA_D))
> -		has_fpu = true;
> +		static_branch_enable(&cpu_hwcap_fpu);
>  #endif
>  }
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index f9cd57c9c67d..03ac3aa611f5 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -87,7 +87,7 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
>  	unsigned long sp)
>  {
>  	regs->status = SR_PIE;
> -	if (has_fpu) {
> +	if (has_fpu()) {
>  		regs->status |= SR_FS_INITIAL;
>  		/*
>  		 * Restore the initial value to the FP register
> diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
> index 65942b3748b4..c2d5ecbe5526 100644
> --- a/arch/riscv/kernel/signal.c
> +++ b/arch/riscv/kernel/signal.c
> @@ -90,7 +90,7 @@ static long restore_sigcontext(struct pt_regs *regs,
>  	/* sc_regs is structured the same as the start of pt_regs */
>  	err = __copy_from_user(regs, &sc->sc_regs, sizeof(sc->sc_regs));
>  	/* Restore the floating-point state. */
> -	if (has_fpu)
> +	if (has_fpu())
>  		err |= restore_fp_state(regs, &sc->sc_fpregs);
>  	return err;
>  }
> @@ -143,7 +143,7 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
>  	/* sc_regs is structured the same as the start of pt_regs */
>  	err = __copy_to_user(&sc->sc_regs, regs, sizeof(sc->sc_regs));
>  	/* Save the floating-point state. */
> -	if (has_fpu)
> +	if (has_fpu())
>  		err |= save_fp_state(regs, &sc->sc_fpregs);
>  	return err;
>  }

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
