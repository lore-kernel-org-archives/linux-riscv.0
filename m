Return-Path: <SRS0=YBN+=IF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D770C433E0
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Mar 2021 03:46:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59A4764FF0
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Mar 2021 03:46:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59A4764FF0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pqMKONxGffQLVy0BNdpa5d/ZgOmim5mJUnvOsazTyPE=; b=mC3ylYc75bwrbP455gXFLqzjT
	XPfo/sOrbBU+3k6jxmC4JmIIJWnRQXCKz2GQ7XvviRD7QwgZMzDcJyOCb1Oa5QMDOKmwTtAyH//op
	zRcrEPcpdciwwXKBudE/+g4eUjzOgfBHcE31qvjuNEkb1PN37d0I6KLePYqvOuejdtj9cuyXuN7UE
	RGxxmtz5Q2efykdAsvIae8O68Hcf87SQ0uwd1iI9ZV3ldjTCwE5/xQDVNPZX8KwJd7mxj6urM23lb
	mwtXQzz3zm6fKRyMFZeqmbuObkg0osQ2H8emRJPIiRmE4uRjhy2vM6n5A/LOB5dGl1U3UGebOUxAX
	YZ7He8Nkg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lIkMr-007kIP-Cc; Sun, 07 Mar 2021 03:46:09 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lIkMm-007kDS-DO
 for linux-riscv@lists.infradead.org; Sun, 07 Mar 2021 03:46:06 +0000
Received: by mail-lf1-x132.google.com with SMTP id k9so13567873lfo.12
 for <linux-riscv@lists.infradead.org>; Sat, 06 Mar 2021 19:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AK42aRGGlm/OwUAIuhucFNHyVgULs1imdF3+9v0RPss=;
 b=Od2sV+XL9dGBoMe9POd50mG8LzJC512QQXHmO81U27GfgmPEhF34q6AqrDA9r8k0Yd
 peUUq+yqmbfOckVB2is5/u2tK2nfPuelbHUK9xvG6+Xe5tjWDoTGVMhuMERtgFsLOEPQ
 EArmVnh15DuxPm1HUuXcSLhAWLmCrPp6e7Gogx4wrzBc85+52Gpx1swUu4MERHz14uAD
 bW1Ss8o2HbYs6LawyIxuRFdt5hdrRJjYm8xH7mkfKu7jf8xlqvSA40ZHWbLdp21k4f8a
 czleOcwq1m08z1RN8Dz3r6CybxVIr9PF0Td0kZ3XhSRCDj7GLIEiJtVIOm7qNquV1Dff
 Nglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AK42aRGGlm/OwUAIuhucFNHyVgULs1imdF3+9v0RPss=;
 b=ozrhHgjQleeJaPrFr/RS2POst9YJyfw1lpiwUYNGB6TtwLzGa8ZCtqRwi7YeAk6zrZ
 GGIDA1MTy6awxAZ/67LiyXgwJ72Jq3cqFJpzg1qigpMMi0vwGCQhReHGAJLPCVchwcCg
 lsjI7tMiP2XwILKXcf1deLNgaOJJONog5dqB/Fk6X2sfqHZFwX4RXHW0yjwzgQt8BUiw
 N/pjxdlhXTT1gdER1eQ2ZxACZg+38xW4BRv/RsmxWtKgyasNJCgwGaQjgd8ljznAsuHA
 3qGnsN5AhH1V9jnB9kIAg3LLkB83ku6JMpJAPkCoo/yIjfU1ekvDtBbm3WitL5kFnD7D
 KMWQ==
X-Gm-Message-State: AOAM533kG5VSKeIf0lPcFWDmAYLWB1c1yAM55KRJSlDbpfOe/XntkId+
 Jf+TZ7ztKjNpH/JkSndhNLu4GhMaNmg6G9UXsiD2yQ==
X-Google-Smtp-Source: ABdhPJxRKFoNmd92l+KRp5t2vy9zd1/V7LfqWmVyfpZjV8w8pdakYgr48HMBAWRHVDUXwnNEly1gYfskwlCIa4SYA30=
X-Received: by 2002:a05:6512:234d:: with SMTP id
 p13mr10162815lfu.87.1615088761838; 
 Sat, 06 Mar 2021 19:46:01 -0800 (PST)
MIME-Version: 1.0
References: <20210307022446.63732-1-guoren@kernel.org>
 <20210307022446.63732-2-guoren@kernel.org>
In-Reply-To: <20210307022446.63732-2-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 7 Mar 2021 09:15:49 +0530
Message-ID: <CAAhSdy16JtDj81iXgXTY=n2i-svvR4u8y=1WxmxwZgAPNiH7cQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: Enable generic clockevent broadcast
To: Guo Ren <guoren@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-arch@vger.kernel.org, 
 linux-csky@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>, 
 Guo Ren <guoren@linux.alibaba.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>, 
 Greentime Hu <greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210307_034604_609179_54C07CFF 
X-CRM114-Status: GOOD (  20.14  )
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

On Sun, Mar 7, 2021 at 7:55 AM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> When percpu-timers are stopped by deep power saving mode, we
> need system timer help to broadcast IPI_TIMER.
>
> This is first introduced by broken x86 hardware, where the local apic
> timer stops in C3 state. But many other architectures(powerpc, mips,
> arm, hexagon, openrisc, sh) have supported the infrastructure to
> deal with Power Management issues.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Anup Patel <anup.patel@wdc.com>
> Cc: Atish Patra <atish.patra@wdc.com>
> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> Cc: Greentime Hu <greentime.hu@sifive.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/Kconfig      |  2 ++
>  arch/riscv/kernel/smp.c | 16 ++++++++++++++++
>  2 files changed, 18 insertions(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 85d626b8ce5e..8637e7344abe 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -28,6 +28,7 @@ config RISCV
>         select ARCH_HAS_SET_DIRECT_MAP
>         select ARCH_HAS_SET_MEMORY
>         select ARCH_HAS_STRICT_KERNEL_RWX if MMU
> +       select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>         select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
>         select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
>         select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
> @@ -39,6 +40,7 @@ config RISCV
>         select EDAC_SUPPORT
>         select GENERIC_ARCH_TOPOLOGY if SMP
>         select GENERIC_ATOMIC64 if !64BIT
> +       select GENERIC_CLOCKEVENTS_BROADCAST if SMP
>         select GENERIC_EARLY_IOREMAP
>         select GENERIC_GETTIMEOFDAY if HAVE_GENERIC_VDSO
>         select GENERIC_IOREMAP
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index ea028d9e0d24..8325d33411d8 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -9,6 +9,7 @@
>   */
>
>  #include <linux/cpu.h>
> +#include <linux/clockchips.h>
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/profile.h>
> @@ -27,6 +28,7 @@ enum ipi_message_type {
>         IPI_CALL_FUNC,
>         IPI_CPU_STOP,
>         IPI_IRQ_WORK,
> +       IPI_TIMER,
>         IPI_MAX
>  };
>
> @@ -176,6 +178,12 @@ void handle_IPI(struct pt_regs *regs)
>                         irq_work_run();
>                 }
>
> +#ifdef CONFIG_GENERIC_CLOCKEVENTS_BROADCAST
> +               if (ops & (1 << IPI_TIMER)) {
> +                       stats[IPI_TIMER]++;
> +                       tick_receive_broadcast();
> +               }
> +#endif
>                 BUG_ON((ops >> IPI_MAX) != 0);
>
>                 /* Order data access and bit testing. */
> @@ -192,6 +200,7 @@ static const char * const ipi_names[] = {
>         [IPI_CALL_FUNC]         = "Function call interrupts",
>         [IPI_CPU_STOP]          = "CPU stop interrupts",
>         [IPI_IRQ_WORK]          = "IRQ work interrupts",
> +       [IPI_TIMER]             = "Timer broadcast interrupts",
>  };
>
>  void show_ipi_stats(struct seq_file *p, int prec)
> @@ -217,6 +226,13 @@ void arch_send_call_function_single_ipi(int cpu)
>         send_ipi_single(cpu, IPI_CALL_FUNC);
>  }
>
> +#ifdef CONFIG_GENERIC_CLOCKEVENTS_BROADCAST
> +void tick_broadcast(const struct cpumask *mask)
> +{
> +       send_ipi_mask(mask, IPI_TIMER);
> +}
> +#endif
> +
>  void smp_send_stop(void)
>  {
>         unsigned long timeout;
> --
> 2.25.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
