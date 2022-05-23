Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268C2C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 23 May 2022 14:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FIea/e0Gu5ysgbM0lza1MwLM3hy1nQONvtOxpkf/7bs=; b=ukZdjP2S8EvcH1
	XcJ+eKGpxKdGuLcJaeu++G7Ejq73cnXqKxHqXEhxR8e8tLW0Knek5XM3rjdLD8ql2zqI2T/lbnFWR
	1Uz/DDX/X9FefdMrMb87EMoE5V1iHh/9cD91fpUVjmxSreerIB5uA+qhgLE6nmy49iOrjWZKwY0rI
	XI1n/9qkICW+gTMIalBkurqzHZc4RnIjsxhc5HGEP+TBSkkBY3KipUD8G6Y2XeHb/zaxOLkV3RISx
	TYtmLUCZrZh3WhYOWMRnizO/efzp8PNAurhf8LNjx3ryZSUmSFj2TT+aGg3JLX9ptnhf7p6frmdqH
	j6JWXz3aw7/bZpQ2OI+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt9Fm-004lRo-KF; Mon, 23 May 2022 14:41:50 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt9Fj-004lQq-NY
 for linux-riscv@lists.infradead.org; Mon, 23 May 2022 14:41:49 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id b124so13787299ybg.12
 for <linux-riscv@lists.infradead.org>; Mon, 23 May 2022 07:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BW04Z/gvjhs+P0ULzNLfp7O87Y9+RbJCN4YeRs8+SKY=;
 b=Soew57xnpel8YQd6sx781+vJHHd45Egx09p1KxaLo9hydn+G/B6Ok28cIxvAcIQKD/
 1wl3bJ16TuctScAkxIiEr0SItslhTXK2cptNI8aWG7eps/8Ki4/mh7Hxeeg7YZ3oGF6A
 /ZllW2ex8dBGPYn4/Os+85gZ4AHiTtkgC3HGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BW04Z/gvjhs+P0ULzNLfp7O87Y9+RbJCN4YeRs8+SKY=;
 b=RspFKl0IFGbbr36ysG9Rdz2tg9W+K/wP3bCLEkadt9mN0L1V07NiAr/9eWTccUzl9A
 YJrbCy/qAtMvcB9QW6DtRUpTQQnB9qeY5efy9X185rDK21jWgAdFKL7zMI3Z7NJSOMdQ
 lRKejRPFaUuVFH5ajZc/zJ6/Gc2Nqf/aaUkU0LBBh7Qzum4sj5v3wrV3cEyPNXb2QmME
 SEjWu1Wk/C5VmV+x50vGqcA/ygC41Iz1ib3jVryEntQv+uRE6o7rflxBJ6ROXcXXzU7j
 nDm34L0nTiSCF4EOrgbeyG18Ahi0bnpCqYpiQPxTcYMISya+aI7jA0JxrN+afTcr+GS5
 0bNw==
X-Gm-Message-State: AOAM531/JlPp/UWzk3f3Ep2p/TWHLXIGvSIkapnUs25pLjnUdFYAfpfW
 h3fRzbRLT9pUDhpWm8RkX/O6FLrKAAhl640Jw6hR
X-Google-Smtp-Source: ABdhPJx9n8niQElJxbz6DJ61kucg+5EyeHTacZxxEMowuLTsGrUEdcGplrZrbAMZ1qlMPazwasGdO0i7lkLSij8v6Ig=
X-Received: by 2002:a25:aa30:0:b0:64d:ebad:538d with SMTP id
 s45-20020a25aa30000000b0064debad538dmr23509454ybi.603.1653316905947; Mon, 23
 May 2022 07:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220522153543.2656-1-jszhang@kernel.org>
 <20220522153543.2656-3-jszhang@kernel.org>
In-Reply-To: <20220522153543.2656-3-jszhang@kernel.org>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 23 May 2022 07:41:35 -0700
Message-ID: <CAOnJCU+2MgHaEOFK9_0Unb1GjnLP-Ge-B-C_Ndwj8aF2NxfpeA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: switch has_fpu() to the unified static key
 mechanism
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_074147_997486_1F30648F 
X-CRM114-Status: GOOD (  16.89  )
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

On Sun, May 22, 2022 at 8:44 AM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> This is to use the unified static key mechanism instead of putting
> static key related here and there.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/switch_to.h | 4 ++--
>  arch/riscv/kernel/cpufeature.c     | 7 -------
>  2 files changed, 2 insertions(+), 9 deletions(-)
>
> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
> index 0a3f4f95c555..11463489fec6 100644
> --- a/arch/riscv/include/asm/switch_to.h
> +++ b/arch/riscv/include/asm/switch_to.h
> @@ -8,6 +8,7 @@
>
>  #include <linux/jump_label.h>
>  #include <linux/sched/task_stack.h>
> +#include <asm/hwcap.h>
>  #include <asm/processor.h>
>  #include <asm/ptrace.h>
>  #include <asm/csr.h>
> @@ -56,10 +57,9 @@ static inline void __switch_to_aux(struct task_struct *prev,
>         fstate_restore(next, task_pt_regs(next));
>  }
>
> -extern struct static_key_false cpu_hwcap_fpu;
>  static __always_inline bool has_fpu(void)
>  {
> -       return static_branch_likely(&cpu_hwcap_fpu);
> +       return static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_FPU]);
>  }
>  #else
>  static __always_inline bool has_fpu(void) { return false; }
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 89f886b35357..0235391be84b 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -21,9 +21,6 @@ unsigned long elf_hwcap __read_mostly;
>  /* Host ISA bitmap */
>  static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
>
> -#ifdef CONFIG_FPU
> -__ro_after_init DEFINE_STATIC_KEY_FALSE(cpu_hwcap_fpu);
> -#endif
>  __ro_after_init DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
>  EXPORT_SYMBOL(riscv_isa_ext_keys);
>
> @@ -239,8 +236,4 @@ void __init riscv_fill_hwcap(void)
>                 if (j >= 0)
>                         static_branch_enable(&riscv_isa_ext_keys[j]);
>         }
> -#ifdef CONFIG_FPU
> -       if (elf_hwcap & (COMPAT_HWCAP_ISA_F | COMPAT_HWCAP_ISA_D))
> -               static_branch_enable(&cpu_hwcap_fpu);
> -#endif
>  }
> --
> 2.34.1
>

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
