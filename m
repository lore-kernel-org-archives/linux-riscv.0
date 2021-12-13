Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C08C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Dec 2021 13:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ejls+Kwp3JpBmCoYmk1cfieB17lb9blD5zsWx4OZ+4c=; b=fiCAgL2AGQOkQs
	7rKL5Y9SOINlTUxnF3JV4juX/kdROusp+NTbHcoqZPxpnC/8g889oxksIcxQMus/gFkDpriw5f6oC
	SPS5K8lAdr9X5puAN/6wagUX2TWFpZN2w5k2XmMsdScAlnSYwT/dqDMhmHKt10w7j9jPa3G2/3aTO
	JJJCaPVJD9qeW7AikBafY2caiKFhOWy7mvuPqgGjfBK5on0j6GK6LZXvmeoMW0yi+Pp1GvN0/yNoG
	1ZFDXp/W5xe8P5bOyXh3r7bRb1nwYi8FpmZgwMusqayEvghYRBsMkZSKGxF5wmYpuqpt3JoMbyAUc
	WfAOVlnXQvY5D+xAX6mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwky2-009bAe-G4; Mon, 13 Dec 2021 13:02:10 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwkxz-009b8z-FP
 for linux-riscv@lists.infradead.org; Mon, 13 Dec 2021 13:02:09 +0000
Received: by mail-wr1-x431.google.com with SMTP id k9so9120110wrd.2
 for <linux-riscv@lists.infradead.org>; Mon, 13 Dec 2021 05:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lZVF2oyg56K2eXdYGD9l8O6KjfCMEpIT69R3sA9KD0E=;
 b=2s3ik6I9r6hO6Koe0XyQpBO4uF6+LEpZ8E8a4XPO5uyNO7BHQaf1Esfy0gR5rh27vJ
 QVUUkRTsI8VuSxmP26qtyf0ct/akSX22bwlYOY+HX+l5zbF7em7JTABRo0YVgfjCl7tL
 ooBkO9DP/O8wFEDDAi+iDoFXByKiDtKxoh1EK7KTzJWPfPUVYFXj9MDBX9Vxo65oguKq
 u0lQiCxQBlgzroL5EG9GX68wjGsgO4gee2H9265KeJQNwK2dPY/z/H61Vw8oAva0bF0R
 ESEWtL0uXi8AjlgTKLKbNtFb5fx2/49j5h7Ojz5PVa5b2TTgm/J+uk5wTL5VJWwyeHm3
 bQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lZVF2oyg56K2eXdYGD9l8O6KjfCMEpIT69R3sA9KD0E=;
 b=YztOfDqhfnxHAfhfcU+1Dho/hoVpQHOqQ3YuFXBMczBtb+9U12fJ+qEjDQUpjkcLoI
 yvPkcHy6w/SD/Zi4It93GpIDhIVbnuVQqiU+EmhMlFq8C3IK7ddhYO7kGARtVdvUqM6d
 IyVDVW5LndkcRNtTvNyX8yz4antcwlbPWYiwx3jv5FKarrJ7NUOL2rajJ6VL4k5cGfQt
 0iay+5JoiSieToCf9qrdNMbcwX6+A2QYn1R4m6c91vSot31ub70aMCr9+aG0o3F+UciE
 2T+WhdG7FkXdCmbBRMSy/TBXZFFHpLY/74vZRnuDK8lU4/tx1OoIkwMeJTbU6E3eIi9i
 ZWpw==
X-Gm-Message-State: AOAM531mRsCzCBQ8UwjQkSZbtKVah6+0Q9l6hIAiHv4tfPHoYz3p0bDI
 n+bd6XaGFpSx9bb+guCQKlAfrdCqIqFCjk1Qc4N5uA==
X-Google-Smtp-Source: ABdhPJzh9ioitLYUUDPnsJ3CIp6AwYVFCGBTgyyI6H5cI/cmcXKBPfaF6TMStgFI+sNsDiw0LSR7KLjxX/aCfJYli6k=
X-Received: by 2002:a5d:4909:: with SMTP id x9mr32836164wrq.313.1639400525484; 
 Mon, 13 Dec 2021 05:02:05 -0800 (PST)
MIME-Version: 1.0
References: <20211204002038.113653-1-atishp@atishpatra.org>
 <20211204002038.113653-6-atishp@atishpatra.org>
In-Reply-To: <20211204002038.113653-6-atishp@atishpatra.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Dec 2021 18:31:53 +0530
Message-ID: <CAAhSdy26i0KiHce_FveXS795WecSJJ3ujbCmOVVVBiSOd8chRw@mail.gmail.com>
Subject: Re: [RFC 5/6] RISC-V: Move spinwait booting method to its own config
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
X-CRM114-CacheID: sfid-20211213_050207_556209_18567A4E 
X-CRM114-Status: GOOD (  23.54  )
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
> The spinwait booting method should only be used for platforms with older
> firmware without SBI HSM extension or M-mode firmware because spinwait
> method can't support cpu hotplug, kexec or sparse hartid. It is better
> to move the entire spinwait implementation to its own config which can
> be disabled if required. It is enabled by default to maintain backward
> compatibility and M-mode Linux.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/Kconfig          | 14 ++++++++++++++
>  arch/riscv/kernel/Makefile  |  3 ++-
>  arch/riscv/kernel/cpu_ops.c |  8 ++++++++
>  arch/riscv/kernel/head.S    |  6 +++---
>  arch/riscv/kernel/head.h    |  2 ++
>  5 files changed, 29 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 821252b65f89..4afb42d5707d 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -403,6 +403,20 @@ config RISCV_SBI_V01
>           This config allows kernel to use SBI v0.1 APIs. This will be
>           deprecated in future once legacy M-mode software are no longer in use.
>
> +config RISCV_BOOT_SPINWAIT
> +       bool "Spinwait booting method"
> +       depends on SMP
> +       default y
> +       help
> +         This enables support for booting Linux via spinwait method. In the
> +         spinwait method, all cores randomly jump to Linux. One of the core
> +         gets chosen via lottery and all other keeps spinning on a percpu
> +         variable. This method can not support cpu hotplug and sparse hartid
> +         scheme. It should be only enabled for M-mode Linux or platforms relying
> +         on older firmware without SBI HSM extension. All other platform should
> +         rely on ordered booing via SBI HSM extension which gets chosen
> +          dynamically at runtime if the firmware supports it.
> +
>  config KEXEC
>         bool "Kexec system call"
>         select KEXEC_CORE
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index 3397ddac1a30..612556faa527 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -43,7 +43,8 @@ obj-$(CONFIG_FPU)             += fpu.o
>  obj-$(CONFIG_SMP)              += smpboot.o
>  obj-$(CONFIG_SMP)              += smp.o
>  obj-$(CONFIG_SMP)              += cpu_ops.o
> -obj-$(CONFIG_SMP)              += cpu_ops_spinwait.o
> +
> +obj-$(CONFIG_RISCV_BOOT_SPINWAIT) += cpu_ops_spinwait.o
>  obj-$(CONFIG_MODULES)          += module.o
>  obj-$(CONFIG_MODULE_SECTIONS)  += module-sections.o
>
> diff --git a/arch/riscv/kernel/cpu_ops.c b/arch/riscv/kernel/cpu_ops.c
> index c1e30f403c3b..170d07e57721 100644
> --- a/arch/riscv/kernel/cpu_ops.c
> +++ b/arch/riscv/kernel/cpu_ops.c
> @@ -15,7 +15,15 @@
>  const struct cpu_operations *cpu_ops[NR_CPUS] __ro_after_init;
>
>  extern const struct cpu_operations cpu_ops_sbi;
> +#ifdef CONFIG_RISCV_BOOT_SPINWAIT
>  extern const struct cpu_operations cpu_ops_spinwait;
> +#else
> +const struct cpu_operations cpu_ops_spinwait = {
> +       .name           = "",
> +       .cpu_prepare    = NULL,
> +       .cpu_start      = NULL,
> +};
> +#endif
>
>  void __init cpu_set_ops(int cpuid)
>  {
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 9f16bfe9307e..4a694e15b95b 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -259,7 +259,7 @@ pmp_done:
>         li t0, SR_FS
>         csrc CSR_STATUS, t0
>
> -#ifdef CONFIG_SMP
> +#ifdef CONFIG_RISCV_BOOT_SPINWAIT
>         li t0, CONFIG_NR_CPUS
>         blt a0, t0, .Lgood_cores
>         tail .Lsecondary_park
> @@ -285,7 +285,7 @@ pmp_done:
>         beq t0, t1, .Lsecondary_start
>
>  #endif /* CONFIG_XIP */
> -#endif /* CONFIG_SMP */
> +#endif /* CONFIG_RISCV_BOOT_SPINWAIT */
>
>  #ifdef CONFIG_XIP_KERNEL
>         la sp, _end + THREAD_SIZE
> @@ -344,7 +344,7 @@ clear_bss_done:
>         call soc_early_init
>         tail start_kernel
>
> -#ifdef CONFIG_SMP
> +#if defined(CONFIG_SMP) && defined(CONFIG_RISCV_BOOT_SPINWAIT)

The RISCV_BOOT_SPINWAIT option already depends on SMP.

Do you still need to check defined(CONFIG_SMP) here ?

Regards,
Anup

>  .Lsecondary_start:
>         /* Set trap vector to spin forever to help debug */
>         la a3, .Lsecondary_park
> diff --git a/arch/riscv/kernel/head.h b/arch/riscv/kernel/head.h
> index 5393cca77790..726731ada534 100644
> --- a/arch/riscv/kernel/head.h
> +++ b/arch/riscv/kernel/head.h
> @@ -16,7 +16,9 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa);
>  asmlinkage void __init __copy_data(void);
>  #endif
>
> +#ifdef CONFIG_RISCV_BOOT_SPINWAIT
>  extern void *__cpu_spinwait_stack_pointer[];
>  extern void *__cpu_spinwait_task_pointer[];
> +#endif
>
>  #endif /* __ASM_HEAD_H */
> --
> 2.33.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
