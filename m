Return-Path: <SRS0=tQi0=BA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06153C433E2
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 00:46:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8A4D208E4
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 00:46:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YQGFN8za";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="b7vx/dB2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8A4D208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hlv/tsm36L55zo+DSofdge7LvqVPO+nmACz+6iDFKc8=; b=YQGFN8za0UhjrPJtYDbBhFjAu
	4Q9ac3wFjfcI4BARoT12vLrV5Fv5OqnayrIQcrkZXh87nl3vI/X83xsmDu3DZ4AosIq+0gqm35AiY
	qjySNPJIvkX3obFdPsIGJhKW9xBYKeduU2aNW22rxjVLU4hvH37QNtTa8UGS6KtlmvkszxbddLeKP
	KHxHJFFPqyfAsavg6k3Ce273KN4opCw4K5S60cIdwXkPPFHYruKJhGhfTcXQtzLGz4f+k3zNgwT2r
	tNGlga3XbJVhh4XgUl4nS13Xex89/OH2l2AhhVmsQnHRGDzEQUBuojbCWGz8CwZnniyrUvRoTXQiO
	yZe0J+Geg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxgQU-0007qa-F1; Tue, 21 Jul 2020 00:46:34 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxgQS-0007pT-00
 for linux-riscv@lists.infradead.org; Tue, 21 Jul 2020 00:46:33 +0000
Received: by mail-wm1-x344.google.com with SMTP id o8so1126982wmh.4
 for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2020 17:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=44yNBhwiU3BEjUQ51yMWQCzGqkuN8tsmGyt2ZoiB3Uc=;
 b=b7vx/dB2exi7ZhQr7TmJKLOroglTIsXxQdPrU91lTf+OnjOnVOdlxL53nOQlFTqvsw
 5ObkhtFZES39XWd7gFyXuAbAPPYYbK9ZrEUKbKUFGe4Tg+WUfCYuIA0wTvWcjql6N03S
 0UfBKADD7f0sllkVMcYTXx8V06v6BF1WJJy3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=44yNBhwiU3BEjUQ51yMWQCzGqkuN8tsmGyt2ZoiB3Uc=;
 b=GOAj4cASFqCPrAiKidDDb7p6wcxWbQH5n5RirreZte0K1drQ+A0TXRrrClleM539az
 OH0Hp/lxskDjF4TlPRNw0MaGXVvw4YUwMQo7NwLhZfB6/vpAavty76n1wWCxfd9fie4J
 lPUs9MP4cMeiFsnmQP+ejmWNi+lC4cJbAGkCuDpmrB38spnephcUhGx28KepUwS70L0Q
 xXFCLrzbuSZHtONQGMd4HIoXsf20ryjJweA2i+uHfrihgVOK8LQeslBfKAVnlbldRnt3
 WIJ1n05ixffO1xZr9Hrhz5r7xnRD9gyUOIdLzOh24Rc9xYT0a5HcS75ThQDDoBl+i05l
 7ptQ==
X-Gm-Message-State: AOAM531zX1NTlR+N12hvVuOw+li3lOI4MkAPm9GVFYLlQsf/0WDLFxxm
 pXiWdZZN1f70cyzwEpYxX3WLpqdJVaRmBbWqwSoPvx7cXg==
X-Google-Smtp-Source: ABdhPJxjOobalSoq3+NXflThISad5/kXy/sW67PxY0qBDOSmO8FaYQUgEmu2DtCo9Hf0C79la7QXnTmdAhnDL1r1M58=
X-Received: by 2002:a1c:7c19:: with SMTP id x25mr1542110wmc.176.1595292389306; 
 Mon, 20 Jul 2020 17:46:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200717075101.263332-1-anup.patel@wdc.com>
 <20200717075101.263332-2-anup.patel@wdc.com>
In-Reply-To: <20200717075101.263332-2-anup.patel@wdc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 20 Jul 2020 17:46:17 -0700
Message-ID: <CAOnJCU+Y87SYUCczMU4=ryR0-L=e-mmO2TGXjPXANM0SpCi5vQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] RISC-V: Add mechanism to provide custom IPI
 operations
To: Anup Patel <anup.patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_204632_162904_4F58B071 
X-CRM114-Status: GOOD (  25.62  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Emil Renner Berhing <kernel@esmil.dk>,
 Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 17, 2020 at 12:52 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> We add mechanism to set custom IPI operations so that CLINT driver
> from drivers directory can provide custom IPI operations.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Tested-by: Emil Renner Berhing <kernel@esmil.dk>
> ---
>  arch/riscv/include/asm/clint.h | 25 --------------------
>  arch/riscv/include/asm/smp.h   | 19 +++++++++++++++
>  arch/riscv/kernel/clint.c      | 23 ++++++++++++++++--
>  arch/riscv/kernel/sbi.c        | 14 +++++++++++
>  arch/riscv/kernel/smp.c        | 43 +++++++++++++++++++---------------
>  arch/riscv/kernel/smpboot.c    |  3 +--
>  6 files changed, 79 insertions(+), 48 deletions(-)
>
> diff --git a/arch/riscv/include/asm/clint.h b/arch/riscv/include/asm/clint.h
> index a279b17a6aad..adaba98a7d6c 100644
> --- a/arch/riscv/include/asm/clint.h
> +++ b/arch/riscv/include/asm/clint.h
> @@ -6,34 +6,9 @@
>  #include <linux/smp.h>
>
>  #ifdef CONFIG_RISCV_M_MODE
> -extern u32 __iomem *clint_ipi_base;
> -
>  void clint_init_boot_cpu(void);
> -
> -static inline void clint_send_ipi_single(unsigned long hartid)
> -{
> -       writel(1, clint_ipi_base + hartid);
> -}
> -
> -static inline void clint_send_ipi_mask(const struct cpumask *mask)
> -{
> -       int cpu;
> -
> -       for_each_cpu(cpu, mask)
> -               clint_send_ipi_single(cpuid_to_hartid_map(cpu));
> -}
> -
> -static inline void clint_clear_ipi(unsigned long hartid)
> -{
> -       writel(0, clint_ipi_base + hartid);
> -}
>  #else /* CONFIG_RISCV_M_MODE */
>  #define clint_init_boot_cpu()  do { } while (0)
> -
> -/* stubs to for code is only reachable under IS_ENABLED(CONFIG_RISCV_M_MODE): */
> -void clint_send_ipi_single(unsigned long hartid);
> -void clint_send_ipi_mask(const struct cpumask *hartid_mask);
> -void clint_clear_ipi(unsigned long hartid);
>  #endif /* CONFIG_RISCV_M_MODE */
>
>  #endif /* _ASM_RISCV_CLINT_H */
> diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
> index 40bb1c15a731..68de78a8eba6 100644
> --- a/arch/riscv/include/asm/smp.h
> +++ b/arch/riscv/include/asm/smp.h
> @@ -15,6 +15,11 @@
>  struct seq_file;
>  extern unsigned long boot_cpu_hartid;
>
> +struct riscv_ipi_ops {
> +       void (*ipi_inject)(const struct cpumask *target);
> +       void (*ipi_clear)(void);
> +};
> +
>  #ifdef CONFIG_SMP
>  /*
>   * Mapping between linux logical cpu index and hartid.
> @@ -40,6 +45,12 @@ void arch_send_call_function_single_ipi(int cpu);
>  int riscv_hartid_to_cpuid(int hartid);
>  void riscv_cpuid_to_hartid_mask(const struct cpumask *in, struct cpumask *out);
>
> +/* Set custom IPI operations */
> +void riscv_set_ipi_ops(struct riscv_ipi_ops *ops);
> +
> +/* Clear IPI for current CPU */
> +void riscv_clear_ipi(void);
> +
>  /*
>   * Obtains the hart ID of the currently executing task.  This relies on
>   * THREAD_INFO_IN_TASK, but we define that unconditionally.
> @@ -78,6 +89,14 @@ static inline void riscv_cpuid_to_hartid_mask(const struct cpumask *in,
>         cpumask_set_cpu(boot_cpu_hartid, out);
>  }
>
> +static inline void riscv_set_ipi_ops(struct riscv_ipi_ops *ops)
> +{
> +}
> +
> +static inline void riscv_clear_ipi(void)
> +{
> +}
> +
>  #endif /* CONFIG_SMP */
>
>  #if defined(CONFIG_HOTPLUG_CPU) && (CONFIG_SMP)
> diff --git a/arch/riscv/kernel/clint.c b/arch/riscv/kernel/clint.c
> index 3647980d14c3..a9845ee023e2 100644
> --- a/arch/riscv/kernel/clint.c
> +++ b/arch/riscv/kernel/clint.c
> @@ -5,11 +5,11 @@
>
>  #include <linux/io.h>
>  #include <linux/of_address.h>
> +#include <linux/smp.h>
>  #include <linux/types.h>
>  #include <asm/clint.h>
>  #include <asm/csr.h>
>  #include <asm/timex.h>
> -#include <asm/smp.h>
>
>  /*
>   * This is the layout used by the SiFive clint, which is also shared by the qemu
> @@ -21,6 +21,24 @@
>
>  u32 __iomem *clint_ipi_base;
>
> +static void clint_send_ipi(const struct cpumask *target)
> +{
> +       unsigned int cpu;
> +
> +       for_each_cpu(cpu, target)
> +               writel(1, clint_ipi_base + cpuid_to_hartid_map(cpu));
> +}
> +
> +static void clint_clear_ipi(void)
> +{
> +       writel(0, clint_ipi_base + cpuid_to_hartid_map(smp_processor_id()));
> +}
> +
> +static struct riscv_ipi_ops clint_ipi_ops = {
> +       .ipi_inject = clint_send_ipi,
> +       .ipi_clear = clint_clear_ipi,
> +};
> +
>  void clint_init_boot_cpu(void)
>  {
>         struct device_node *np;
> @@ -40,5 +58,6 @@ void clint_init_boot_cpu(void)
>         riscv_time_cmp = base + CLINT_TIME_CMP_OFF;
>         riscv_time_val = base + CLINT_TIME_VAL_OFF;
>
> -       clint_clear_ipi(boot_cpu_hartid);
> +       clint_clear_ipi();
> +       riscv_set_ipi_ops(&clint_ipi_ops);
>  }
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index f383ef5672b2..226ccce0f9e0 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -547,6 +547,18 @@ static inline long sbi_get_firmware_version(void)
>         return __sbi_base_ecall(SBI_EXT_BASE_GET_IMP_VERSION);
>  }
>
> +static void sbi_send_cpumask_ipi(const struct cpumask *target)
> +{
> +       struct cpumask hartid_mask;
> +
> +       riscv_cpuid_to_hartid_mask(target, &hartid_mask);
> +
> +       sbi_send_ipi(cpumask_bits(&hartid_mask));
> +}
> +
> +static struct riscv_ipi_ops sbi_ipi_ops = {
> +       .ipi_inject = sbi_send_cpumask_ipi
> +};
>
>  int __init sbi_init(void)
>  {
> @@ -587,5 +599,7 @@ int __init sbi_init(void)
>                 __sbi_rfence    = __sbi_rfence_v01;
>         }
>
> +       riscv_set_ipi_ops(&sbi_ipi_ops);
> +
>         return 0;
>  }
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index b1d4f452f843..8b85683ce203 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -84,9 +84,25 @@ static void ipi_stop(void)
>                 wait_for_interrupt();
>  }
>
> +static struct riscv_ipi_ops *ipi_ops;
> +
> +void riscv_set_ipi_ops(struct riscv_ipi_ops *ops)
> +{
> +       ipi_ops = ops;
> +}
> +EXPORT_SYMBOL_GPL(riscv_set_ipi_ops);
> +
> +void riscv_clear_ipi(void)
> +{
> +       if (ipi_ops && ipi_ops->ipi_clear)
> +               ipi_ops->ipi_clear();
> +
> +       csr_clear(CSR_IP, IE_SIE);
> +}
> +EXPORT_SYMBOL_GPL(riscv_clear_ipi);
> +
>  static void send_ipi_mask(const struct cpumask *mask, enum ipi_message_type op)
>  {
> -       struct cpumask hartid_mask;
>         int cpu;
>
>         smp_mb__before_atomic();
> @@ -94,33 +110,22 @@ static void send_ipi_mask(const struct cpumask *mask, enum ipi_message_type op)
>                 set_bit(op, &ipi_data[cpu].bits);
>         smp_mb__after_atomic();
>
> -       riscv_cpuid_to_hartid_mask(mask, &hartid_mask);
> -       if (IS_ENABLED(CONFIG_RISCV_SBI))
> -               sbi_send_ipi(cpumask_bits(&hartid_mask));
> +       if (ipi_ops && ipi_ops->ipi_inject)
> +               ipi_ops->ipi_inject(mask);
>         else
> -               clint_send_ipi_mask(mask);
> +               pr_warn("SMP: IPI inject method not available\n");
>  }
>
>  static void send_ipi_single(int cpu, enum ipi_message_type op)
>  {
> -       int hartid = cpuid_to_hartid_map(cpu);
> -
>         smp_mb__before_atomic();
>         set_bit(op, &ipi_data[cpu].bits);
>         smp_mb__after_atomic();
>
> -       if (IS_ENABLED(CONFIG_RISCV_SBI))
> -               sbi_send_ipi(cpumask_bits(cpumask_of(hartid)));
> -       else
> -               clint_send_ipi_single(hartid);
> -}
> -
> -static inline void clear_ipi(void)
> -{
> -       if (IS_ENABLED(CONFIG_RISCV_SBI))
> -               csr_clear(CSR_IP, IE_SIE);
> +       if (ipi_ops && ipi_ops->ipi_inject)
> +               ipi_ops->ipi_inject(cpumask_of(cpu));
>         else
> -               clint_clear_ipi(cpuid_to_hartid_map(smp_processor_id()));
> +               pr_warn("SMP: IPI inject method not available\n");
>  }
>
>  void handle_IPI(struct pt_regs *regs)
> @@ -131,7 +136,7 @@ void handle_IPI(struct pt_regs *regs)
>
>         irq_enter();
>
> -       clear_ipi();
> +       riscv_clear_ipi();
>
>         while (true) {
>                 unsigned long ops;
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index 4e9922790f6e..5fe849791bf0 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -147,8 +147,7 @@ asmlinkage __visible void smp_callin(void)
>  {
>         struct mm_struct *mm = &init_mm;
>
> -       if (!IS_ENABLED(CONFIG_RISCV_SBI))
> -               clint_clear_ipi(cpuid_to_hartid_map(smp_processor_id()));
> +       riscv_clear_ipi();
>
>         /* All kernel threads share the same mm context.  */
>         mmgrab(mm);
> --
> 2.25.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Reviewed-by: Atish Patra <atish.patra@wdc.com>
-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
