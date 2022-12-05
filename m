Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83C2C4321E
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 18:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uww2nPuxwxZqB/PZWucRndL0uJ+8JZsEgcyulLPU0T4=; b=ubwaXDB1wPfq1A
	BFY1hQ4P9h0S60sTPyDFH4qzFFPfaz3gvel1m4xM4BQQvyCfFtGjpJxYerlCT6vvcbQartpju2Pek
	As+P9lHJXbXMTWeMC6PvQBtg72t8fB48Afbhu1BbFJAzGMJx2vDogKlQ6wKppXnGzwea3Gu3xTpKF
	OtEN1e5kGqN3cTLi+kiqOGD/5HdRRpI//sz62YiLpiQNOyLcmrCG3oAtQ0MvkeYTvVHBov38xGlRK
	xNao5uCWcGdVv7EAekSbCk9ekXM8PYZcxtTr1sMkhs3GQYHEVjGlX3Sm8QfiMEJGtFbeU1pm/ta+F
	I1Xsxd11GCZ6xF1YsPuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Flk-00823h-S4; Mon, 05 Dec 2022 18:00:44 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Flh-0081xR-BM
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 18:00:43 +0000
Received: by mail-ej1-x62a.google.com with SMTP id t17so457604eju.1
        for <linux-riscv@lists.infradead.org>; Mon, 05 Dec 2022 10:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OTxU34tkj39G1aWSGFb5j48Mzj7TOWDGiuSjGzpbZz0=;
        b=KG9AuH9GKNntYdmBy35gI24xW/mhiKXzpeCgjhzPh+kg1+HEuQXd0gX1AYLfLqY+o8
         AdrD4JpDbfX8pSBGWzFRoOm+8vSpySjLhRXESACOwFbRm1EZkMH7kUaD6r+vRgW07Aj5
         rhcenk+NMO+aajnw2DDG3e1sH+hgj23t5jrvIlMioyrUAji4QP31aobbnD+JKMUBX4XL
         igKdTrY4/51bWd4Wzpts6lFfErmGXNkZk+ySRwCFr3pjQkgMAU7GIYNDGFosgZy9r85i
         exsWJZn1Pa4LenAk0POacBKL0JPX9tdhuriUmLot9Ohlx9syLdnNuWIWz+cPHDhUg7JS
         cboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OTxU34tkj39G1aWSGFb5j48Mzj7TOWDGiuSjGzpbZz0=;
        b=AW4S7EM/T1fVmeMD3ykd4Vyeop7z4vcMUugnxfSUiDJeEJGU2uHjFkvQ44j7L3lk03
         UAI8Um8hfJQPrWl6Vk+41Mb71i9UoVEFs+zMmSLCvu3CA0B0yyrsZmw6TdvdrB6U1CeK
         wKknJoMdZ289tECUAbCWo9EWkM+t3DmOMBoOYB1yuYy/ml0MNZ3e/K2EMedHohaH07gQ
         6gArtroPDwh7FLHJQghsrgzAXxnVEedQHWvNkFjJJFx+qI0yAHwJI843lvAmq8V2xAHG
         ttXlk29g7rzRVldQOl5PcehLSZMrGWtDEFVZUzf11W2JAfGSpIiFioJ/+WGlZTt3x5kf
         YUuQ==
X-Gm-Message-State: ANoB5pm9AnevmOWQQoKxiigeWvCZXG9DSW3PY+PFUk4CZChZAp8kcaK+
	w4GCsujNj6Pd2H/3X6jBslfz3eyrdFF4R/cRcCGgKg==
X-Google-Smtp-Source: AA0mqf6jGm6nEQQBAFFzNRAYYTbSbuaQ8l8GIB85YR3v2N0Tp1qS7z/vIkl1kDQBEnux2yayFRdRmfpV+/tg69zv6Gs=
X-Received: by 2002:a17:906:6782:b0:7ad:7d50:dec2 with SMTP id
 q2-20020a170906678200b007ad7d50dec2mr73437273ejp.37.1670263236237; Mon, 05
 Dec 2022 10:00:36 -0800 (PST)
MIME-Version: 1.0
References: <20221203215535.208948-1-geomatsi@gmail.com> <20221203215535.208948-4-geomatsi@gmail.com>
In-Reply-To: <20221203215535.208948-4-geomatsi@gmail.com>
From: Andrew Bresticker <abrestic@rivosinc.com>
Date: Mon, 5 Dec 2022 13:00:25 -0500
Message-ID: <CALE4mHrrxTJaQ5YYZamS9GmNhGopiUA3jk5+iw1XAn=8=XT=fg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 3/3] riscv: hw-breakpoints: add more trigger controls
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, 
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_100041_648096_B82089EB 
X-CRM114-Status: GOOD (  25.13  )
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

Hi Sergey,

On Sat, Dec 3, 2022 at 4:55 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
>
> From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
>
> RISC-V SBI Debug Trigger extension proposal defines multiple functions
> to control debug triggers. The pair of install/uninstall functions was
> enough to implement ptrace interface for user-space debug. This patch
> implements kernel wrappers for start/update/stop SBI functions. The
> intended users of these control wrappers are kgdb and kernel modules
> that make use of kernel-wide hardware breakpoints and watchpoints.
>
> Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>

<snip>

> diff --git a/arch/riscv/include/asm/hw_breakpoint.h b/arch/riscv/include/asm/hw_breakpoint.h
> index 5bb3b55cd464..afc59f8e034e 100644
> --- a/arch/riscv/include/asm/hw_breakpoint.h
> +++ b/arch/riscv/include/asm/hw_breakpoint.h
> @@ -137,6 +137,9 @@ int hw_breakpoint_arch_parse(struct perf_event *bp,
>  int hw_breakpoint_exceptions_notify(struct notifier_block *unused,
>                                     unsigned long val, void *data);
>
> +void arch_enable_hw_breakpoint(struct perf_event *bp);
> +void arch_update_hw_breakpoint(struct perf_event *bp);
> +void arch_disable_hw_breakpoint(struct perf_event *bp);
>  int arch_install_hw_breakpoint(struct perf_event *bp);
>  void arch_uninstall_hw_breakpoint(struct perf_event *bp);
>  void hw_breakpoint_pmu_read(struct perf_event *bp);
> @@ -153,5 +156,17 @@ static inline void clear_ptrace_hw_breakpoint(struct task_struct *tsk)
>  {
>  }
>
> +void arch_enable_hw_breakpoint(struct perf_event *bp)
> +{
> +}
> +
> +void arch_update_hw_breakpoint(struct perf_event *bp)
> +{
> +}
> +
> +void arch_disable_hw_breakpoint(struct perf_event *bp)
> +{
> +}

I don't see any references to {enable,update,disable}_hw_breakpoint in
common kernel code, nor do any other architectures define these
functions. Who are the intended users? Do we even need them for kgdb
on RISC-V?

> diff --git a/arch/riscv/kernel/hw_breakpoint.c b/arch/riscv/kernel/hw_breakpoint.c
> index 8eddf512cd03..ca7df02830c2 100644
> --- a/arch/riscv/kernel/hw_breakpoint.c
> +++ b/arch/riscv/kernel/hw_breakpoint.c
> @@ -2,6 +2,7 @@
>
>  #include <linux/hw_breakpoint.h>
>  #include <linux/perf_event.h>
> +#include <linux/spinlock.h>
>  #include <linux/percpu.h>
>  #include <linux/kdebug.h>
>
> @@ -9,6 +10,8 @@
>
>  /* bps/wps currently set on each debug trigger for each cpu */
>  static DEFINE_PER_CPU(struct perf_event *, bp_per_reg[HBP_NUM_MAX]);
> +static DEFINE_PER_CPU(unsigned long, msg_lock_flags);
> +static DEFINE_PER_CPU(raw_spinlock_t, msg_lock);

I'm not sure I understand the point of this per-CPU spinlock. Just
disable preemption (and interrupts, if necessary).

Also, arch_{install,uninstall}_hw_breakpoint are already expected to
be called from atomic context; is the intention here that they be
callable from outside atomic context?

-Andrew

>
>  static struct sbi_dbtr_data_msg __percpu *sbi_xmit;
>  static struct sbi_dbtr_id_msg __percpu *sbi_recv;
> @@ -318,6 +321,10 @@ int arch_install_hw_breakpoint(struct perf_event *bp)
>         struct perf_event **slot;
>         unsigned long idx;
>         struct sbiret ret;
> +       int err = 0;
> +
> +       raw_spin_lock_irqsave(this_cpu_ptr(&msg_lock),
> +                         *this_cpu_ptr(&msg_lock_flags));
>
>         xmit->tdata1 = cpu_to_lle(info->trig_data1.value);
>         xmit->tdata2 = cpu_to_lle(info->trig_data2);
> @@ -328,25 +335,31 @@ int arch_install_hw_breakpoint(struct perf_event *bp)
>                         0, 0, 0);
>         if (ret.error) {
>                 pr_warn("%s: failed to install trigger\n", __func__);
> -               return -EIO;
> +               err = -EIO;
> +               goto done;
>         }
>
>         idx = lle_to_cpu(recv->idx);
>
>         if (idx >= dbtr_total_num) {
>                 pr_warn("%s: invalid trigger index %lu\n", __func__, idx);
> -               return -EINVAL;
> +               err = -EINVAL;
> +               goto done;
>         }
>
>         slot = this_cpu_ptr(&bp_per_reg[idx]);
>         if (*slot) {
>                 pr_warn("%s: slot %lu is in use\n", __func__, idx);
> -               return -EBUSY;
> +               err = -EBUSY;
> +               goto done;
>         }
>
>         *slot = bp;
>
> -       return 0;
> +done:
> +       raw_spin_unlock_irqrestore(this_cpu_ptr(&msg_lock),
> +                              *this_cpu_ptr(&msg_lock_flags));
> +       return err;
>  }
>
>  /* atomic: counter->ctx->lock is held */
> @@ -375,6 +388,96 @@ void arch_uninstall_hw_breakpoint(struct perf_event *bp)
>                 pr_warn("%s: failed to uninstall trigger %d\n", __func__, i);
>  }
>
> +void arch_enable_hw_breakpoint(struct perf_event *bp)
> +{
> +       struct sbiret ret;
> +       int i;
> +
> +       for (i = 0; i < dbtr_total_num; i++) {
> +               struct perf_event **slot = this_cpu_ptr(&bp_per_reg[i]);
> +
> +               if (*slot == bp)
> +                       break;
> +       }
> +
> +       if (i == dbtr_total_num) {
> +               pr_warn("%s: unknown breakpoint\n", __func__);
> +               return;
> +       }
> +
> +       ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIGGER_ENABLE,
> +                       i, 1, 0, 0, 0, 0);
> +       if (ret.error) {
> +               pr_warn("%s: failed to install trigger %d\n", __func__, i);
> +               return;
> +       }
> +}
> +EXPORT_SYMBOL_GPL(arch_enable_hw_breakpoint);
> +
> +void arch_update_hw_breakpoint(struct perf_event *bp)
> +{
> +       struct arch_hw_breakpoint *info = counter_arch_bp(bp);
> +       struct sbi_dbtr_data_msg *xmit = this_cpu_ptr(sbi_xmit);
> +       struct perf_event **slot;
> +       struct sbiret ret;
> +       int i;
> +
> +       for (i = 0; i < dbtr_total_num; i++) {
> +               slot = this_cpu_ptr(&bp_per_reg[i]);
> +
> +               if (*slot == bp)
> +                       break;
> +       }
> +
> +       if (i == dbtr_total_num) {
> +               pr_warn("%s: unknown breakpoint\n", __func__);
> +               return;
> +       }
> +
> +       raw_spin_lock_irqsave(this_cpu_ptr(&msg_lock),
> +                         *this_cpu_ptr(&msg_lock_flags));
> +
> +       xmit->tdata1 = cpu_to_lle(info->trig_data1.value);
> +       xmit->tdata2 = cpu_to_lle(info->trig_data2);
> +       xmit->tdata3 = cpu_to_lle(info->trig_data3);
> +
> +       ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIGGER_UPDATE,
> +                       i, 1, __pa(xmit) >> 4,
> +                       0, 0, 0);
> +       if (ret.error)
> +               pr_warn("%s: failed to update trigger %d\n", __func__, i);
> +
> +       raw_spin_unlock_irqrestore(this_cpu_ptr(&msg_lock),
> +                              *this_cpu_ptr(&msg_lock_flags));
> +}
> +EXPORT_SYMBOL_GPL(arch_update_hw_breakpoint);
> +
> +void arch_disable_hw_breakpoint(struct perf_event *bp)
> +{
> +       struct sbiret ret;
> +       int i;
> +
> +       for (i = 0; i < dbtr_total_num; i++) {
> +               struct perf_event **slot = this_cpu_ptr(&bp_per_reg[i]);
> +
> +               if (*slot == bp)
> +                       break;
> +       }
> +
> +       if (i == dbtr_total_num) {
> +               pr_warn("%s: unknown breakpoint\n", __func__);
> +               return;
> +       }
> +
> +       ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIGGER_DISABLE,
> +                       i, 1, 0, 0, 0, 0);
> +       if (ret.error) {
> +               pr_warn("%s: failed to uninstall trigger %d\n", __func__, i);
> +               return;
> +       }
> +}
> +EXPORT_SYMBOL_GPL(arch_disable_hw_breakpoint);
> +
>  void hw_breakpoint_pmu_read(struct perf_event *bp)
>  {
>  }
> @@ -406,6 +509,8 @@ void flush_ptrace_hw_breakpoint(struct task_struct *tsk)
>
>  static int __init arch_hw_breakpoint_init(void)
>  {
> +       unsigned int cpu;
> +
>         sbi_xmit = __alloc_percpu(sizeof(*sbi_xmit), SZ_16);
>         if (!sbi_xmit) {
>                 pr_warn("failed to allocate SBI xmit message buffer\n");
> @@ -418,6 +523,9 @@ static int __init arch_hw_breakpoint_init(void)
>                 return -ENOMEM;
>         }
>
> +       for_each_possible_cpu(cpu)
> +               raw_spin_lock_init(&per_cpu(msg_lock, cpu));
> +
>         if (!dbtr_init)
>                 arch_hw_breakpoint_init_sbi();
>
> --
> 2.38.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
