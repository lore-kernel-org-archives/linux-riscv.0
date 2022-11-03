Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21423C433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 07:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UgBcTslTururP0xc6v0jmwQZxKiEwXVxfBfq1laMsq4=; b=ihzetkFls0XDTI
	+epPPaUIG/EfGlLYnlXUZQR3NinLjEgXoKINiNZyHFx9pi7loG37i1KV/xddlTZX7kHJOfF+uQSpl
	wbw8+th23F3g4rPKmzB0eiXIJwLQy37ml3N/QKt/18Bd+XsJcubKDLMjbiy+7EVeV10F6AvdPUdaQ
	WyHHvKK5L+KKZdfu0DiVo2rTngS8C9L8rI8p5NR1OvPyKi2UMOOItz/wC0Zu7Xps6Sk5AclXjIUXv
	qKIyJZ95tR+o2NVn0eZ5mQjsMOeC/bV75m7QXOzN28kM8TZPdalkWMahGkqS8/L3/jJEyA2AAmged
	7egIP4LF9pPBAeaXqjmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqUCW-00GMSx-9C; Thu, 03 Nov 2022 06:59:44 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqUCT-00GMRc-9o
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 06:59:43 +0000
Received: by mail-ot1-x335.google.com with SMTP id a7-20020a056830008700b0066c82848060so354417oto.4
        for <linux-riscv@lists.infradead.org>; Wed, 02 Nov 2022 23:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jU3NGxO1EUwTyTXWWYBu4YHjvr1DaVewYJ8W5p2q9KU=;
        b=NuVeukR3guNMcd8fqb8zusPXO3pX292A2paPMT1Fw2JCW6ScnhB6S2pNYAiISOj1OE
         epquGbWXm0CIoSC/uYtqFgwiQ9xTvq+bfivcNbTl3kI21lSwBxX6dVSnO5kjb6wESKI+
         RYdfA169166lqCqhSf1WYLooQ3G15KIdpA9R4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jU3NGxO1EUwTyTXWWYBu4YHjvr1DaVewYJ8W5p2q9KU=;
        b=qovhj77HCl9IARmekuvEfImYEwSdtX+WBlPjT34kRrJl0psA8vTqFlJHIBm7HBDInJ
         NSdhsFBXcNfiAF1s58bw2wFEArSuiPEFSzwZwkdppjv4tMo7/JA6wMfcz6xFQJCtB4K0
         N1BEy3sVzWrGQbLh4asNWO1j8ztI9icS2Xl2PMXcqoZ9jnstAE6ad3Xu6pH+NoKhM3my
         bP4EiLAGhnSXpvuSH6Xj62/qFCdS/uOwHSO5FO0FBl7Q8nNMBR6P7qD/02FU/vP+88ZX
         lRCrs3FlvTrp3ode9gGb5LMoo43SM9lBDqJkCvDjF3D9nrcawWCgR+X6ZvzizYvHsUxF
         rcfQ==
X-Gm-Message-State: ACrzQf18NpKB+3H77Fh5USp8CKVdFD0k6lJDU/msWpbQuhAJ9u4GtRZt
	WslenTJGrw+o2h5m7mMjiPR+2O3+wk89822LPB2H
X-Google-Smtp-Source: AMsMyM7cWIKI4geOTz1CbFifK42quVigOSL6ijHJuUGmO2itd5TIzSD3coAj+1RA3oI6VXAJNoy9RJRUEFc+QLk0sqI=
X-Received: by 2002:a05:6830:6611:b0:662:2725:d309 with SMTP id
 cp17-20020a056830661100b006622725d309mr13453334otb.293.1667458777704; Wed, 02
 Nov 2022 23:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221101143400.690000-1-apatel@ventanamicro.com> <20221101143400.690000-6-apatel@ventanamicro.com>
In-Reply-To: <20221101143400.690000-6-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 2 Nov 2022 23:59:25 -0700
Message-ID: <CAOnJCUKqRzNU0oCRMTm+XApMm_ys6hjgFbJDhQs0=nnR1s+MJw@mail.gmail.com>
Subject: Re: [PATCH v10 5/7] RISC-V: Allow marking IPIs as suitable for remote FENCEs
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Alistair Francis <Alistair.Francis@wdc.com>, 
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_235941_611309_D763F2BD 
X-CRM114-Status: GOOD (  23.68  )
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

On Tue, Nov 1, 2022 at 7:34 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> To do remote FENCEs (i.e. remote TLB flushes) using IPI calls on the
> RISC-V kernel, we need hardware mechanism to directly inject IPI from
> the supervisor mode (i.e. RISC-V kernel) instead of using SBI calls.
>
> The upcoming AIA IMSIC devices allow direct IPI injection from the
> supervisor mode (i.e. RISC-V kernel). To support this, we extend the
> riscv_ipi_set_virq_range() function so that IPI provider (i.e. irqchip
> drivers can mark IPIs as suitable for remote FENCEs.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/smp.h      | 18 ++++++++++++++++--
>  arch/riscv/kernel/sbi-ipi.c       |  2 +-
>  arch/riscv/kernel/smp.c           | 11 ++++++++++-
>  drivers/clocksource/timer-clint.c |  2 +-
>  4 files changed, 28 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
> index 79ed0b73cd4e..56976e41a21e 100644
> --- a/arch/riscv/include/asm/smp.h
> +++ b/arch/riscv/include/asm/smp.h
> @@ -16,6 +16,9 @@ struct seq_file;
>  extern unsigned long boot_cpu_hartid;
>
>  #ifdef CONFIG_SMP
> +
> +#include <linux/jump_label.h>
> +
>  /*
>   * Mapping between linux logical cpu index and hartid.
>   */
> @@ -46,7 +49,12 @@ void riscv_ipi_disable(void);
>  bool riscv_ipi_have_virq_range(void);
>
>  /* Set the IPI interrupt numbers for arch (called by irqchip drivers) */
> -void riscv_ipi_set_virq_range(int virq, int nr);
> +void riscv_ipi_set_virq_range(int virq, int nr, bool use_for_rfence);
> +
> +/* Check if we can use IPIs for remote FENCEs */
> +DECLARE_STATIC_KEY_FALSE(riscv_ipi_for_rfence);
> +#define riscv_use_ipi_for_rfence() \
> +       static_branch_unlikely(&riscv_ipi_for_rfence)
>
>  /* Secondary hart entry */
>  asmlinkage void smp_callin(void);
> @@ -93,10 +101,16 @@ static inline bool riscv_ipi_have_virq_range(void)
>         return false;
>  }
>
> -static inline void riscv_ipi_set_virq_range(int virq, int nr)
> +static inline void riscv_ipi_set_virq_range(int virq, int nr,
> +                                           bool use_for_rfence)
>  {
>  }
>
> +static inline bool riscv_use_ipi_for_rfence(void)
> +{
> +       return false;
> +}
> +
>  #endif /* CONFIG_SMP */
>
>  #if defined(CONFIG_HOTPLUG_CPU) && (CONFIG_SMP)
> diff --git a/arch/riscv/kernel/sbi-ipi.c b/arch/riscv/kernel/sbi-ipi.c
> index f0a78420b127..ee8620104bd8 100644
> --- a/arch/riscv/kernel/sbi-ipi.c
> +++ b/arch/riscv/kernel/sbi-ipi.c
> @@ -75,6 +75,6 @@ void __init sbi_ipi_init(void)
>                           "irqchip/sbi-ipi:starting",
>                           sbi_ipi_starting_cpu, sbi_ipi_dying_cpu);
>
> -       riscv_ipi_set_virq_range(virq, BITS_PER_BYTE);
> +       riscv_ipi_set_virq_range(virq, BITS_PER_BYTE, false);
>         pr_info("providing IPIs using SBI IPI extension\n");
>  }
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index e8a20454d65b..74b8cb1a89ab 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -145,7 +145,10 @@ bool riscv_ipi_have_virq_range(void)
>         return (ipi_virq_base) ? true : false;
>  }
>
> -void riscv_ipi_set_virq_range(int virq, int nr)
> +DEFINE_STATIC_KEY_FALSE(riscv_ipi_for_rfence);
> +EXPORT_SYMBOL_GPL(riscv_ipi_for_rfence);
> +
> +void riscv_ipi_set_virq_range(int virq, int nr, bool use_for_rfence)
>  {
>         int i, err;
>
> @@ -168,6 +171,12 @@ void riscv_ipi_set_virq_range(int virq, int nr)
>
>         /* Enabled IPIs for boot CPU immediately */
>         riscv_ipi_enable();
> +
> +       /* Update RFENCE static key */
> +       if (use_for_rfence)
> +               static_branch_enable(&riscv_ipi_for_rfence);
> +       else
> +               static_branch_disable(&riscv_ipi_for_rfence);
>  }
>  EXPORT_SYMBOL_GPL(riscv_ipi_set_virq_range);
>
> diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
> index f9dd746a72c5..658049a5440b 100644
> --- a/drivers/clocksource/timer-clint.c
> +++ b/drivers/clocksource/timer-clint.c
> @@ -249,7 +249,7 @@ static int __init clint_timer_init_dt(struct device_node *np)
>                 goto fail_free_irq;
>         }
>
> -       riscv_ipi_set_virq_range(virq, BITS_PER_BYTE);
> +       riscv_ipi_set_virq_range(virq, BITS_PER_BYTE, true);
>         clint_clear_ipi(clint_ipi_irq, NULL);
>
>         return 0;
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
