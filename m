Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E25C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 23 May 2022 15:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vx3Wna3ecQy9Qmj/A7WcQ2nicmM/gbK42UaDkvG8mQg=; b=0O/KSEAAtkod1V
	jIgnyxoTi+tEwBvauxtdcSOsY0puzXNGEJp4gbvV7Psyd1qgbCS6tYdwVgjgyNqRW5v0NQ5s8Dgxz
	pyQWL5HMwDz74vbSy3zQuQIKeCjO9HBJ1Ofr1JXDU2599V7O8w+grwl7YXoWm3cZAO83l6eaqpfez
	33KsHlGjiw4ossodUy281JB2NU3vaiguSiyk4uvgtaeoGRUQsEYuZCIYKZpUB1i7mDHzjVPcmrZdy
	NWlxXGq6lqqPJ+y2l1+53f3htmfwy69n9FyBmEmIhXZm/iE4w4OqK9coUwO6R+IneR4n3TunzDmpP
	4nZY56GuUKdk8aBsksXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt9fg-004rEr-Ev; Mon, 23 May 2022 15:08:36 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt9fd-004r24-96
 for linux-riscv@lists.infradead.org; Mon, 23 May 2022 15:08:34 +0000
Received: by mail-wr1-x42b.google.com with SMTP id h14so21821052wrc.6
 for <linux-riscv@lists.infradead.org>; Mon, 23 May 2022 08:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ItmOvQlJYrSM4iWYsCl26IX50qJOEZAdJld7IVn+tno=;
 b=LsRuUDeOP1ovU54Dh18ebFB16BExOoHwxIDcfdVVL4ZqEZ7P0dV/akxSzJQw6+0ysJ
 xICyWob4dPqfM1q/NWHMH9dsdjh2CpYDFJgjnKBDjLtDP5M+lhfLt2NJp+xxyhu5QWaO
 tdalyOStVL89wsfoE9JMIW3jTf4IQaPurgIH1M92jeIRBolhvDSCBYPRiOf2b0qvtpp2
 lzJ4AMiNEjSWfe76/LxKcXViUjCgcKoZuTrm3yLLGT9JAysy42C/xz04UrnnRxMqTlTD
 6Z2He18cfJq1KfIVt8I3Y7xrbKp3LpIohcFdtBUiyTSYIvJJ3VQQ7XFtP5ASnmX169bj
 RW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ItmOvQlJYrSM4iWYsCl26IX50qJOEZAdJld7IVn+tno=;
 b=oFabJUgj7IENQeYaCjmhEjlqLWRtZYO6pNSyXBnybmOfQLKQrpr2edPXw80qpyx4WY
 ep/kTgeOwMh65gG0BB4Txmrl6DHoeb7KvZHb9828nUI2RdBZq2EwvwJ8rtR9hY9RoF5a
 ExybbL7EeTDs8n/rzAe+vz/aVyJV9zGbH14CNuFnKzxolIyyq1seb4MfyhY/vGL5Ei4u
 JtdpcD/0HJ3e+UBP97Nak1cjiKmtF8XxjodY5usAp1SPPPFzXJ0DUAhRkhhujYaFqeqz
 9RUmYkdYavCq3S+SPzZMDj/gL+YODgX+UlbFH+887ZLy1rQTRiRHkcuPPTKvSXX4u0x5
 MecA==
X-Gm-Message-State: AOAM530sDhcH8UM8EoCo4uyHzrXT1yRH/b6JWZixzqDOscZ3Lj605V9q
 0LB4lGMRBeKY+9t4anPGRDzDeAXCtsmK8AfosPSESA==
X-Google-Smtp-Source: ABdhPJx1e94Ti+/mNHRd3xRYlgW0W6+8SRz7GMAuSCGBs5ejjusMofOeZunmCSg3wni9uefjakk2/CCrLVm8hNTcLlc=
X-Received: by 2002:a05:6000:1f18:b0:20f:e61b:520e with SMTP id
 bv24-20020a0560001f1800b0020fe61b520emr2900622wrb.214.1653318512593; Mon, 23
 May 2022 08:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220522153543.2656-1-jszhang@kernel.org>
 <20220522153543.2656-3-jszhang@kernel.org>
In-Reply-To: <20220522153543.2656-3-jszhang@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 23 May 2022 20:38:20 +0530
Message-ID: <CAAhSdy0nTPbEa21-xttic2CfsMBa6BBEfa+y2MgT46aCPjQTsQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: switch has_fpu() to the unified static key
 mechanism
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_080833_385489_9CE873BD 
X-CRM114-Status: GOOD (  17.07  )
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

On Sun, May 22, 2022 at 9:14 PM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> This is to use the unified static key mechanism instead of putting
> static key related here and there.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

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

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
