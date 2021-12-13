Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBF9C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Dec 2021 12:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zFsIYVSHtLSMyELBw3wAcBaZLGHDGVES6uamGXQCV8g=; b=n72IgVmU1tyxv6
	GQlkhxqP+hr3X4ChRfoBfvbAguiSG+TUtdlpWFKXUYPVOfE4kW2ZVKOYQK+RkTfnBWnu8bo4j8A2/
	MTzNR3pZ2Rag41IsdqcNELSkyyEENpkP4SR7M1RYF0Tscsf+xj5Z4nf+EWpuVg8SvYXHviQ7hhAaK
	F8GXsO/Cm+5J2V7vWo5x9xAn9k50iwjvBJtR5EKQJBxmph4A6LrQIKoiqGi0gxpXTLsRM3DvJxZUl
	f9A1tVHDqhmu2xFn/NtYAY34ML4KIPCZTByT1AzQVgGoTQfKEEMir/7uGsyER79kNr+h5NbL+p7ii
	WbZL6FhFv6uqSwvPiLLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwknN-009Yu4-7i; Mon, 13 Dec 2021 12:51:09 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwknK-009Ysr-Dj
 for linux-riscv@lists.infradead.org; Mon, 13 Dec 2021 12:51:07 +0000
Received: by mail-wr1-x42d.google.com with SMTP id c4so26824304wrd.9
 for <linux-riscv@lists.infradead.org>; Mon, 13 Dec 2021 04:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0iqENYZSp6tSgjjC4SuN/3Acy/dnviQPfcQyyNgDGRk=;
 b=n1t7NoZcSyyBr1W5m5qXqOdFkLF/67CvHxuHX1IpWxjF4nNPS3Avg1h2fCPjIh0tsa
 tOO69+ufgkWt5i6NZLQyjAqqaf4sh+/VCo8tThM9rhuZ0UaBYooiuw/3m+UsFyonZgJZ
 9cmVmxvJCTmxkS662qY9NQMmx2dpk4i5mo+G5U1ZVIapKBhB/vcU8cnkViH5+WSeycbt
 pnjieEOIedzWgcXNpqX9LTmMDfj7R7yATOnzFkiYWcWkV1pTkUR39LVnqdAd5bsK07Nf
 5pIEAfdCgdwerzLNlW3mJHgj1Rb1jPDo0AyaAz0zIf0EgjJONPeBw8L0+pyXQfejCS6h
 uPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0iqENYZSp6tSgjjC4SuN/3Acy/dnviQPfcQyyNgDGRk=;
 b=JjtdFlQIurhsJ2IFaszXPgRBKSTgpcn7m+StUJZ3pYBNZ3dfmMjTH2WZFgAUgciE7G
 cseUlcilvule8fHItdsrFy/cZwWVrKOlLzExoTuQeBfDXljTHADvQyA/NWwWqU0mtRx3
 yCdzLwltKTXC/GRj0CwTbkltDUeMjbB33HS5tGNf/L1vLT8p4PjmVShmGevP9cr4BR43
 enLbwGUftIxtjyEkO+4CxcIoSNdsP4RS3UPa079R571Phh/eld5eLPktRCu1oFHIWgXH
 2/+O9MuxWXtbqPQK0/UlpfNKLyAIjiJa1Zjr8gaN4UuLMlzZu43vTFE6NNa6WMRk1kNF
 Lr3A==
X-Gm-Message-State: AOAM5330K12GVUE+464L7zGtc1znwgS10m27JjYZnA+vBjBP6UNk++iq
 xDyUgdeOFNvp3rpIFVP9Sea/g+8YHr4jS5pyd44PyQ==
X-Google-Smtp-Source: ABdhPJwhRBxzcU2sZmpZJ76xIFNOAwnPDA8amkxOz894Oz6Kb/RYU/lWrmTV7IbTIqzN/Tp1V+wjLU/loVeixDuqYU8=
X-Received: by 2002:a5d:4909:: with SMTP id x9mr32773413wrq.313.1639399864386; 
 Mon, 13 Dec 2021 04:51:04 -0800 (PST)
MIME-Version: 1.0
References: <20211204002038.113653-1-atishp@atishpatra.org>
 <20211204002038.113653-4-atishp@atishpatra.org>
In-Reply-To: <20211204002038.113653-4-atishp@atishpatra.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Dec 2021 18:20:52 +0530
Message-ID: <CAAhSdy2BqJseXoNRQJ7d69ExDFu=DfRW-Q_inZoDcPzAWDTToQ@mail.gmail.com>
Subject: Re: [RFC 3/6] RISC-V: Use __cpu_up_stack/task_pointer only for
 spinwait method
To: Atish Patra <atishp@atishpatra.org>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atishp@rivosinc.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup.patel@wdc.com>, 
 Greentime Hu <greentime.hu@sifive.com>, Guo Ren <guoren@linux.alibaba.com>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Ingo Molnar <mingo@kernel.org>, 
 Jisheng Zhang <jszhang@kernel.org>, kvm-riscv@lists.infradead.org, 
 KVM General <kvm@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Marc Zyngier <maz@kernel.org>, Nanyong Sun <sunnanyong@huawei.com>, 
 Nick Kossifidis <mick@ics.forth.gr>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Pekka Enberg <penberg@kernel.org>, 
 Vincent Chen <vincent.chen@sifive.com>, Vitaly Wool <vitaly.wool@konsulko.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_045106_496381_20CE69D6 
X-CRM114-Status: GOOD (  25.67  )
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

On Sat, Dec 4, 2021 at 5:51 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> From: Atish Patra <atishp@rivosinc.com>
>
> The __cpu_up_stack/task_pointer array is only used for spinwait method
> now. The per cpu array based lookup is also fragile for platforms with
> discontiguous/sparse hartids. The spinwait method is only used for
> M-mode Linux or older firmwares without SBI HSM extension. For general
> Linux systems, ordered booting method is preferred anyways to support
> cpu hotplug and kexec.
>
> Make sure that __cpu_up_stack/task_pointer is only used for spinwait
> method. Take this opportunity to rename it to
> __cpu_spinwait_stack/task_pointer to emphasize the purpose as well.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/asm/cpu_ops.h     |  2 --
>  arch/riscv/kernel/cpu_ops.c          | 16 ----------------
>  arch/riscv/kernel/cpu_ops_spinwait.c | 27 ++++++++++++++++++++++++++-
>  arch/riscv/kernel/head.S             |  4 ++--
>  arch/riscv/kernel/head.h             |  4 ++--
>  5 files changed, 30 insertions(+), 23 deletions(-)
>
> diff --git a/arch/riscv/include/asm/cpu_ops.h b/arch/riscv/include/asm/cpu_ops.h
> index a8ec3c5c1bd2..134590f1b843 100644
> --- a/arch/riscv/include/asm/cpu_ops.h
> +++ b/arch/riscv/include/asm/cpu_ops.h
> @@ -40,7 +40,5 @@ struct cpu_operations {
>
>  extern const struct cpu_operations *cpu_ops[NR_CPUS];
>  void __init cpu_set_ops(int cpu);
> -void cpu_update_secondary_bootdata(unsigned int cpuid,
> -                                  struct task_struct *tidle);
>
>  #endif /* ifndef __ASM_CPU_OPS_H */
> diff --git a/arch/riscv/kernel/cpu_ops.c b/arch/riscv/kernel/cpu_ops.c
> index 3f5a38b03044..c1e30f403c3b 100644
> --- a/arch/riscv/kernel/cpu_ops.c
> +++ b/arch/riscv/kernel/cpu_ops.c
> @@ -8,31 +8,15 @@
>  #include <linux/of.h>
>  #include <linux/string.h>
>  #include <linux/sched.h>
> -#include <linux/sched/task_stack.h>
>  #include <asm/cpu_ops.h>
>  #include <asm/sbi.h>
>  #include <asm/smp.h>
>
>  const struct cpu_operations *cpu_ops[NR_CPUS] __ro_after_init;
>
> -void *__cpu_up_stack_pointer[NR_CPUS] __section(".data");
> -void *__cpu_up_task_pointer[NR_CPUS] __section(".data");
> -
>  extern const struct cpu_operations cpu_ops_sbi;
>  extern const struct cpu_operations cpu_ops_spinwait;
>
> -void cpu_update_secondary_bootdata(unsigned int cpuid,
> -                                  struct task_struct *tidle)
> -{
> -       int hartid = cpuid_to_hartid_map(cpuid);
> -
> -       /* Make sure tidle is updated */
> -       smp_mb();
> -       WRITE_ONCE(__cpu_up_stack_pointer[hartid],
> -                  task_stack_page(tidle) + THREAD_SIZE);
> -       WRITE_ONCE(__cpu_up_task_pointer[hartid], tidle);
> -}
> -
>  void __init cpu_set_ops(int cpuid)
>  {
>  #if IS_ENABLED(CONFIG_RISCV_SBI)
> diff --git a/arch/riscv/kernel/cpu_ops_spinwait.c b/arch/riscv/kernel/cpu_ops_spinwait.c
> index b2c957bb68c1..9f398eb94f7a 100644
> --- a/arch/riscv/kernel/cpu_ops_spinwait.c
> +++ b/arch/riscv/kernel/cpu_ops_spinwait.c
> @@ -6,11 +6,36 @@
>  #include <linux/errno.h>
>  #include <linux/of.h>
>  #include <linux/string.h>
> +#include <linux/sched/task_stack.h>
>  #include <asm/cpu_ops.h>
>  #include <asm/sbi.h>
>  #include <asm/smp.h>
>
>  const struct cpu_operations cpu_ops_spinwait;
> +void *__cpu_spinwait_stack_pointer[NR_CPUS] __section(".data");
> +void *__cpu_spinwait_task_pointer[NR_CPUS] __section(".data");
> +
> +static void cpu_update_secondary_bootdata(unsigned int cpuid,
> +                                  struct task_struct *tidle)
> +{
> +       int hartid = cpuid_to_hartid_map(cpuid);
> +
> +       /*
> +        * The hartid must be less than NR_CPUS to avoid out-of-bound access
> +        * errors for __cpu_spinwait_stack/task_pointer. That is not always possible
> +        * for platforms with discontiguous hartid numbering scheme. That's why
> +        * spinwait booting is not the recommended approach for any platforms
> +        * and will be removed in future.
> +        */
> +       if (hartid == INVALID_HARTID || hartid >= NR_CPUS)
> +               return;
> +
> +       /* Make sure tidle is updated */
> +       smp_mb();
> +       WRITE_ONCE(__cpu_spinwait_stack_pointer[hartid],
> +                  task_stack_page(tidle) + THREAD_SIZE);
> +       WRITE_ONCE(__cpu_spinwait_task_pointer[hartid], tidle);
> +}
>
>  static int spinwait_cpu_prepare(unsigned int cpuid)
>  {
> @@ -28,7 +53,7 @@ static int spinwait_cpu_start(unsigned int cpuid, struct task_struct *tidle)
>          * selects the first cpu to boot the kernel and causes the remainder
>          * of the cpus to spin in a loop waiting for their stack pointer to be
>          * setup by that main cpu.  Writing to bootdata
> -        * (i.e __cpu_up_stack_pointer) signals to the spinning cpus that they
> +        * (i.e __cpu_spinwait_stack_pointer) signals to the spinning cpus that they
>          * can continue the boot process.
>          */
>         cpu_update_secondary_bootdata(cpuid, tidle);
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 40d4c625513c..6f8e99eac6a1 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -347,9 +347,9 @@ clear_bss_done:
>         csrw CSR_TVEC, a3
>
>         slli a3, a0, LGREG
> -       la a1, __cpu_up_stack_pointer
> +       la a1, __cpu_spinwait_stack_pointer
>         XIP_FIXUP_OFFSET a1
> -       la a2, __cpu_up_task_pointer
> +       la a2, __cpu_spinwait_task_pointer
>         XIP_FIXUP_OFFSET a2
>         add a1, a3, a1
>         add a2, a3, a2
> diff --git a/arch/riscv/kernel/head.h b/arch/riscv/kernel/head.h
> index aabbc3ac3e48..5393cca77790 100644
> --- a/arch/riscv/kernel/head.h
> +++ b/arch/riscv/kernel/head.h
> @@ -16,7 +16,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa);
>  asmlinkage void __init __copy_data(void);
>  #endif
>
> -extern void *__cpu_up_stack_pointer[];
> -extern void *__cpu_up_task_pointer[];
> +extern void *__cpu_spinwait_stack_pointer[];
> +extern void *__cpu_spinwait_task_pointer[];
>
>  #endif /* __ASM_HEAD_H */
> --
> 2.33.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
