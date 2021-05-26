Return-Path: <SRS0=lIhr=KV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1EC0C2B9F7
	for <linux-riscv@archiver.kernel.org>; Wed, 26 May 2021 05:57:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2979B61360
	for <linux-riscv@archiver.kernel.org>; Wed, 26 May 2021 05:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2979B61360
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ileTkUD98syp1HBgKlO2g7hGQKHHdSinpn1Btdt6mO4=; b=4othCeRUjREkyqIxdi9mMBUYW8
	j8erjGKz0cJDGk1jBZzMRLBE6fLV9OAvcQgUA6CTHsirY7bFGk0Hb+hWPST8izUCr2eR2HQ0NNtDn
	9kkH9tGST3lzLY4waJ9V9Ge0TDZhYP0gT/KgZc3vvJETCvFKxQkOqqwnFmClTabFC4qi0mYhSC6gA
	+a5gnFlKHLW/kssN9Z9FrcViHEUTeswe9UiNEXhtuTuQAmbh0/heQdMyyjm/4yGCqM0EhJllvbnK2
	NM4z4Kmxw2yYXW6s/iiWYLjvShSELXw9dqCElIWLRHs5BqHLqglH5NZr3GfilHcXf0v/bbMttmLib
	YFpbc77g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llmXA-00BNND-DR; Wed, 26 May 2021 05:56:48 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llmX7-00BNLH-GE
 for linux-riscv@lists.infradead.org; Wed, 26 May 2021 05:56:47 +0000
Received: by mail-pf1-x434.google.com with SMTP id y15so126904pfn.13
 for <linux-riscv@lists.infradead.org>; Tue, 25 May 2021 22:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=2FGHlrjOjpcAf7rkKfXMkdUxLlFSv85QWK25OpBoSRk=;
 b=invCuJh0K1iFVJOdksr323jEaAfu4iZPLHpc3Nf0IdXhodxl71ffFoGbFB+MvG933M
 sIP107sJyvt+Wc42aujofC2p1NewfceN2UM+xGHlAnqdsp1TGqCfZGCK1LdiRUsuLJEy
 sKgspd/2wVfHW9JoULMaOp3eho+95wiy6xpKV6Ho2xBs5dkrOvbOzezhaLkkwQoXGwr+
 ogxBt/rh/+vmNe6ZSqrZDXeLklF4f3ngxA8vfPTPe/JJ8r4ofvWGcBlG1obY7H6Y7IVo
 5uMUZzk7MAEclwNVMMHMBGUwMeoyd4J3QvgHv0/Ae4cytv4o7zX04NONM5HNgTgmahDk
 7Ruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=2FGHlrjOjpcAf7rkKfXMkdUxLlFSv85QWK25OpBoSRk=;
 b=S3N27Ob37+fED96I/Tt8v8TPMNI9IaOXoTIrMGpVMDWIIiiH10BZDBHRxAlBzAINUA
 aruiE0rtjpMJs9RHFP6xPw3n497PBE06+9kBoMkwjJDKFVbwH4qAs8gAQwY+4V1/6SDW
 EsPJ7T/vgzrGfSUQf5UhTmX/QeR7620BtSes4+LhzAN5vXjKOuaQiz+0zyI4U3F0oq2Y
 QKQyBajfgvJuz9e/Vlvw1xTGsnX7MK07Vzhs46dOhowh/tkhi16zc8M2gVM9eeym9EOk
 zsbyxs3luJ3cZTp86Idbi4PIxK4s/5Lt93CI9NfVHUjiCpEqLpCKshrpg/O/iJ04kTR1
 zYEA==
X-Gm-Message-State: AOAM5302uNol5pPqSEmrEEIbYhhHMJKeEd8z//ChMwsZm9ur5fB1Stba
 rn8dTb/0uvkZwuDySyQg182a7A==
X-Google-Smtp-Source: ABdhPJzuxehRoTy2dENPawO5k9iKa7LywWedHDIrTNOvYNgT4ncWRG45MvjRVF3SyscH3X8uYdKPag==
X-Received: by 2002:a62:17cc:0:b029:2de:39c1:7eb7 with SMTP id
 195-20020a6217cc0000b02902de39c17eb7mr33668871pfx.26.1622008604543; 
 Tue, 25 May 2021 22:56:44 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id n23sm15638580pff.93.2021.05.25.22.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 22:56:44 -0700 (PDT)
Date: Tue, 25 May 2021 22:56:44 -0700 (PDT)
X-Google-Original-Date: Tue, 25 May 2021 22:56:42 PDT (-0700)
Subject: Re: [PATCH v2] riscv: Turn has_fpu into a static key if FPU=y
In-Reply-To: <20210512225545.6c23d51f@xhacker>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang3@mail.ustc.edu.cn
Message-ID: <mhng-ce59aaab-ee8a-4c8f-a563-d3856ef3c35d@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_225645_581521_E791D136 
X-CRM114-Status: GOOD (  27.17  )
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

On Wed, 12 May 2021 07:55:45 PDT (-0700), jszhang3@mail.ustc.edu.cn wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
>
> The has_fpu check sits at hot code path: switch_to(). Currently, has_fpu
> is a bool variable if FPU=y, switch_to() checks it each time, we can
> optimize out this check by turning the has_fpu into a static key.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
> Since v1:
>  - use static_branch_likely()

Sorry, I missed this one.  I was actually considering pointing that out, 
but I wasn't sure likely was the way to go -- the old code had the save 
code out of line, and the unlikely one did too.

That said, I'm probably just over-thinking it: most machines have FPUs, 
so having the branch as likely seems reasonable.  I've taken this one 
instead.

>  - Improve the commit msg
>
>  arch/riscv/include/asm/switch_to.h | 11 ++++++++---
>  arch/riscv/kernel/cpufeature.c     |  4 ++--
>  arch/riscv/kernel/process.c        |  2 +-
>  arch/riscv/kernel/signal.c         |  4 ++--
>  4 files changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
> index 407bcc96a710..0a3f4f95c555 100644
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
> +	return static_branch_likely(&cpu_hwcap_fpu);
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

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
