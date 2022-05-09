Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39FEC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 04:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AVh+/4kBV5caRyMuambOi9myeV3w3osnqJWAEcPn2Kk=; b=4hyjV7WtL+9LAr
	AfDj8ZpPnJPlv7WzUdXLUBPazX8VuWeZVRgtqrOaRcOCrBCVca31rvkgqhnzEg9DlPEmuLyHu2R3p
	Sy5pKBF/k+h8rXmu3fhk3uDElMcQmEbYkJyintmsunJUci6SEbnQz46+E1EuH6tOMAC+tBF3LcC3U
	FrIhc1u4HYjrxhTW18ZC20ljrtMK6Bm48yFwXzFra9PVcdKEW4KBmNCRzazOQgAgOvQqJyeWsmJaE
	NWSBO0M1IoB9xylniv1hqEijyo04gNUlu/tjPB5dJOct8gzLASjrnkuuZQUNbIJB0l1evdPTRxZ2H
	kX6v83S9po8xGiONY13A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnub0-00CI82-Ty; Mon, 09 May 2022 04:02:06 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnuay-00CI7Y-7D
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 04:02:05 +0000
Received: by mail-wr1-x436.google.com with SMTP id w4so17607416wrg.12
 for <linux-riscv@lists.infradead.org>; Sun, 08 May 2022 21:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SJ8dF+QuMh/vx+O3NBUHJR6SAWNkIGtKyfjSID7EqTw=;
 b=IX/c5ofu+DaFlsi1jnFUDRl9XdZl1WZC81pKbYDuudzHveM/7WM6xfecMOUF5qp/iP
 UI8sJlVCvDQJu4iXYlGVoDOJXtKSYhHLsGvFIYwo3t6mpuvLyL4SV/GZQbxEks1xNIik
 A/qsIaxlFtb/rI8wddI/qlhzy3/XROR+J8pR7mQbtFI6eHQzZYEs+sP90pMRgb+sRhp5
 YJCdYq+H61DwmHMO7UzpMOcUl8XhU9PiZk4YpDRb9UcxYoryYMhDzlhL+kACPoMnypAn
 AqZq9MyceQ9jp3u40/eYgQYwNrKBLDrDFr4SaoFZxV+PWZMggMarlyz5+v6APJ8c5DEV
 Caug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SJ8dF+QuMh/vx+O3NBUHJR6SAWNkIGtKyfjSID7EqTw=;
 b=PTgs3VNTtDv+0/TcQoNDxU/okNgjS2uhFsYVzELGZchdVYb87ltzbFSqhBT2HPOz0e
 itFXMtWQND21yXF4UO/qtGXEi+kjla3oy0aNzsH0BRaYXWD2riiiXoCUdtOj4B249KcN
 Ro6FBzRFe7joOdznpXtF7aqG/Ub+BjqSRNrdJug+kh2WLOsMsBkWMRjFbpEJ+JEqbaT9
 y4CkSWAS/rli2eRZnm0v11hz6CJUakZ2yqQhOJ6uETRHc4Lnf5L5XfMy/O/Ajm5++/sq
 xUhMQGqlWKJGG3TXXYliZOqkYGHhbodgZqOLwEuFVenMVrcW0mNv2I8pqaVWeM3qO4ub
 uWNA==
X-Gm-Message-State: AOAM530U0Z947KxDJCYUMm9TguQXGWWDCaLVLoslbkZY7h3eoSGluSRa
 +XWOPLuRhZlc7nfKpaNDaDh9of3Izv8wXzshaXu+NQ==
X-Google-Smtp-Source: ABdhPJxcZSyW1JpOeqlyUitgRFAErha6IKy2Qp5nxrezznBtFQsIryCYlE9BooGVgCcE5TEryK/szudYVHViUtmnsoM=
X-Received: by 2002:a5d:6d0d:0:b0:20c:530c:1681 with SMTP id
 e13-20020a5d6d0d000000b0020c530c1681mr11940881wrq.214.1652068918822; Sun, 08
 May 2022 21:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220508160749.984-1-jszhang@kernel.org>
 <20220508160749.984-4-jszhang@kernel.org>
In-Reply-To: <20220508160749.984-4-jszhang@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 9 May 2022 09:31:47 +0530
Message-ID: <CAAhSdy32C59ULdP7KNNgy08jF5vUbvYoF6_n+kAopJfiLsJQFw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] riscv: replace has_fpu() with system_supports_fpu()
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Alexandre Ghiti <alexandre.ghiti@canonical.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 kasan-dev@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220508_210204_302464_95D9B636 
X-CRM114-Status: GOOD (  24.71  )
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

On Sun, May 8, 2022 at 9:46 PM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> This is to use the unified cpus_have_{final|const}_cap() instead of
> putting static key related here and there.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/cpufeature.h | 5 +++++
>  arch/riscv/include/asm/switch_to.h  | 9 ++-------
>  arch/riscv/kernel/cpufeature.c      | 8 ++------
>  arch/riscv/kernel/process.c         | 2 +-
>  arch/riscv/kernel/signal.c          | 4 ++--
>  5 files changed, 12 insertions(+), 16 deletions(-)
>
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> index d80ddd2f3b49..634a653c7fa2 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -91,4 +91,9 @@ static inline void cpus_set_cap(unsigned int num)
>         }
>  }
>
> +static inline bool system_supports_fpu(void)
> +{
> +       return IS_ENABLED(CONFIG_FPU) && !cpus_have_final_cap(RISCV_HAS_NO_FPU);

This should be checking for "f" and "d" ISA extensions since "FPU" is
not an ISA extension name.

> +}
> +
>  #endif
> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
> index 0a3f4f95c555..362cb18d12d5 100644
> --- a/arch/riscv/include/asm/switch_to.h
> +++ b/arch/riscv/include/asm/switch_to.h
> @@ -8,6 +8,7 @@
>
>  #include <linux/jump_label.h>
>  #include <linux/sched/task_stack.h>
> +#include <asm/cpufeature.h>
>  #include <asm/processor.h>
>  #include <asm/ptrace.h>
>  #include <asm/csr.h>
> @@ -56,13 +57,7 @@ static inline void __switch_to_aux(struct task_struct *prev,
>         fstate_restore(next, task_pt_regs(next));
>  }
>
> -extern struct static_key_false cpu_hwcap_fpu;
> -static __always_inline bool has_fpu(void)
> -{
> -       return static_branch_likely(&cpu_hwcap_fpu);
> -}
>  #else
> -static __always_inline bool has_fpu(void) { return false; }
>  #define fstate_save(task, regs) do { } while (0)
>  #define fstate_restore(task, regs) do { } while (0)
>  #define __switch_to_aux(__prev, __next) do { } while (0)
> @@ -75,7 +70,7 @@ extern struct task_struct *__switch_to(struct task_struct *,
>  do {                                                   \
>         struct task_struct *__prev = (prev);            \
>         struct task_struct *__next = (next);            \
> -       if (has_fpu())                                  \
> +       if (system_supports_fpu())                                      \
>                 __switch_to_aux(__prev, __next);        \
>         ((last) = __switch_to(__prev, __next));         \
>  } while (0)
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index e6c72cad0c1c..1edf3c3f8f62 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -22,10 +22,6 @@ unsigned long elf_hwcap __read_mostly;
>  /* Host ISA bitmap */
>  static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
>
> -#ifdef CONFIG_FPU
> -__ro_after_init DEFINE_STATIC_KEY_FALSE(cpu_hwcap_fpu);
> -#endif
> -
>  DECLARE_BITMAP(cpu_hwcaps, RISCV_NCAPS);
>  EXPORT_SYMBOL(cpu_hwcaps);
>
> @@ -254,8 +250,8 @@ void __init riscv_fill_hwcap(void)
>         pr_info("riscv: ELF capabilities %s\n", print_str);
>
>  #ifdef CONFIG_FPU
> -       if (elf_hwcap & (COMPAT_HWCAP_ISA_F | COMPAT_HWCAP_ISA_D))
> -               static_branch_enable(&cpu_hwcap_fpu);
> +       if (!(elf_hwcap & (COMPAT_HWCAP_ISA_F | COMPAT_HWCAP_ISA_D)))
> +               cpus_set_cap(RISCV_HAS_NO_FPU);
>  #endif
>         enable_cpu_capabilities();
>         static_branch_enable(&riscv_const_caps_ready);
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 504b496787aa..c9cd0b42299e 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -88,7 +88,7 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
>         unsigned long sp)
>  {
>         regs->status = SR_PIE;
> -       if (has_fpu()) {
> +       if (system_supports_fpu()) {
>                 regs->status |= SR_FS_INITIAL;
>                 /*
>                  * Restore the initial value to the FP register
> diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
> index 9f4e59f80551..96aa593a989e 100644
> --- a/arch/riscv/kernel/signal.c
> +++ b/arch/riscv/kernel/signal.c
> @@ -90,7 +90,7 @@ static long restore_sigcontext(struct pt_regs *regs,
>         /* sc_regs is structured the same as the start of pt_regs */
>         err = __copy_from_user(regs, &sc->sc_regs, sizeof(sc->sc_regs));
>         /* Restore the floating-point state. */
> -       if (has_fpu())
> +       if (system_supports_fpu())
>                 err |= restore_fp_state(regs, &sc->sc_fpregs);
>         return err;
>  }
> @@ -143,7 +143,7 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
>         /* sc_regs is structured the same as the start of pt_regs */
>         err = __copy_to_user(&sc->sc_regs, regs, sizeof(sc->sc_regs));
>         /* Save the floating-point state. */
> -       if (has_fpu())
> +       if (system_supports_fpu())
>                 err |= save_fp_state(regs, &sc->sc_fpregs);
>         return err;
>  }
> --
> 2.34.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
