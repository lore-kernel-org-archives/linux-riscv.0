Return-Path: <SRS0=Z8g5=BE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2787CC433DF
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2020 05:16:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB68820674
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2020 05:16:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bcLGq4ii";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="MTEQ9GJU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB68820674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C5UjFcfqvf+1lEOrckUxcIIoEOm2/lHn4kGi6nSj2ek=; b=bcLGq4ii6VaR/Z3tu6W1CuUcj
	ZGB36RiWNlBy7paX/sroFVVD2xbUT3M6E8ZIPGI404Bu5CkVLM1hlZ6LRPAD43nkIp5y4brMUtomG
	qSY3kD5MZzyYUDy3me/Mdt1XPOufj1C4GtnC4CmzXLXwuVoCBuniYz3uq2cSfGSVeWR8Ziz9xURMX
	HTq+slrTfcP+ef7nXMr0c0GsYpNimkhLoo4BtpmHBdWndNWHCl7SuJ3jzjpAjCdlCiZlLTnE8R6YS
	jPADyQhXaSoU89X6aut6/zxdZfFJPpcvH+Gfgf9bBRS+VZkGXp2huZrocOaI31jHN/7mgi4HrpG+/
	AivrT+U6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzCXU-0005P9-O7; Sat, 25 Jul 2020 05:16:04 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzCXR-0005OZ-7b
 for linux-riscv@lists.infradead.org; Sat, 25 Jul 2020 05:16:02 +0000
Received: by mail-wm1-x343.google.com with SMTP id 184so9912279wmb.0
 for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2020 22:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1A39S77yGNTj+vtNchAh8X3CIK8/9nKUrXkekggREdA=;
 b=MTEQ9GJUoo0I0ctVC94zCI16k0mLXDC/KmNz0HJi91sUg4FruYGFcGbITt17rOn2VP
 tdnVtXyN4/KuR+U9hF3oUOG5LIZVu9dgZQDAMZXNcqF3spR2qcKV3c9zakfOD4uPIphE
 ivYrkZ3fe40Uj1MhyfCED/A1Gq2SulAnS3RFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1A39S77yGNTj+vtNchAh8X3CIK8/9nKUrXkekggREdA=;
 b=DBBlArnpp9Z/AVCRuf7Hg3VL6INABhDt4F0Vuf+MnYpgV7TdFBPYl77BcaMPkALI8Q
 88etvOO5fpwQ4ndgiP9RiuezL8Mpp1m44HnQbAGpmgIbZNXom+yM6Lw/+UlnKHIGm+ow
 XoDdUt9ZdbVIjuRGm9BUjliY9owAiDhMh2N6LscYwGH80vSWxmoxDTn/FILCwslGNOie
 uefEkDRjzF4zmTRrauMFRjW7ZBNHBlydOqJrR7CeFpsBGtF7we15Smq6LPhTW/QxnofP
 q9q2MFRje0971U21XBeyYsYssau4vcHU/Jcc2/C6OKerovl3ne9e0KeQQKHnzLyJDAfB
 l5og==
X-Gm-Message-State: AOAM531f1aBkYx6uSyJ+g2RdEQEu5wklOsUlJsUihBJ82GH6+6h20p1p
 mvmhXnwRKFtFypgyoURnDiiJ5/1yuB1LNiDey1Sx
X-Google-Smtp-Source: ABdhPJw/TpCohtM1GHrvjJDelbJRTLy39MA5teHhgxb8HZ8cYzmfqAN88IMWiI/XGBhoEq2fU/c6su48TGXYRi06zvk=
X-Received: by 2002:a1c:345:: with SMTP id 66mr11098630wmd.31.1595654159968;
 Fri, 24 Jul 2020 22:15:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200724071822.126758-1-anup.patel@wdc.com>
 <20200724071822.126758-4-anup.patel@wdc.com>
In-Reply-To: <20200724071822.126758-4-anup.patel@wdc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 24 Jul 2020 22:15:48 -0700
Message-ID: <CAOnJCULOcbSWdgfWsG3ruATCP4TRLAGyXEQxirV69gOpZF0b2w@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] RISC-V: Remove CLINT related code from timer and
 arch
To: Anup Patel <anup.patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200725_011601_327424_560992A6 
X-CRM114-Status: GOOD (  30.15  )
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

On Fri, Jul 24, 2020 at 12:19 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> Right now the RISC-V timer driver is convoluted to support:
> 1. Linux RISC-V S-mode (with MMU) where it will use TIME CSR for
>    clocksource and SBI timer calls for clockevent device.
> 2. Linux RISC-V M-mode (without MMU) where it will use CLINT MMIO
>    counter register for clocksource and CLINT MMIO compare register
>    for clockevent device.
>
> We now have a separate CLINT timer driver which also provide CLINT
> based IPI operations so let's remove CLINT MMIO related code from
> arch/riscv directory and RISC-V timer driver.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Tested-by: Emil Renner Berhing <kernel@esmil.dk>
> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  arch/riscv/Kconfig                      |  2 +-
>  arch/riscv/Kconfig.socs                 |  2 +
>  arch/riscv/configs/nommu_virt_defconfig |  7 +--
>  arch/riscv/include/asm/clint.h          | 14 ------
>  arch/riscv/include/asm/timex.h          | 28 +++--------
>  arch/riscv/kernel/Makefile              |  2 +-
>  arch/riscv/kernel/clint.c               | 63 -------------------------
>  arch/riscv/kernel/setup.c               |  2 -
>  arch/riscv/kernel/smp.c                 |  1 -
>  arch/riscv/kernel/smpboot.c             |  1 -
>  drivers/clocksource/Kconfig             |  3 +-
>  drivers/clocksource/timer-riscv.c       | 17 +------
>  12 files changed, 16 insertions(+), 126 deletions(-)
>  delete mode 100644 arch/riscv/include/asm/clint.h
>  delete mode 100644 arch/riscv/kernel/clint.c
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index fedb4a72b29a..57a72ae23d10 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -74,7 +74,7 @@ config RISCV
>         select PCI_DOMAINS_GENERIC if PCI
>         select PCI_MSI if PCI
>         select RISCV_INTC
> -       select RISCV_TIMER
> +       select RISCV_TIMER if RISCV_SBI
>         select SPARSEMEM_STATIC if 32BIT
>         select SPARSE_IRQ
>         select SYSCTL_EXCEPTION_TRACE
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 6c88148f1b9b..8a55f6156661 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -12,6 +12,7 @@ config SOC_SIFIVE
>
>  config SOC_VIRT
>         bool "QEMU Virt Machine"
> +       select CLINT_TIMER if RISCV_M_MODE
>         select POWER_RESET
>         select POWER_RESET_SYSCON
>         select POWER_RESET_SYSCON_POWEROFF
> @@ -24,6 +25,7 @@ config SOC_VIRT
>  config SOC_KENDRYTE
>         bool "Kendryte K210 SoC"
>         depends on !MMU
> +       select CLINT_TIMER if RISCV_M_MODE
>         select SERIAL_SIFIVE if TTY
>         select SERIAL_SIFIVE_CONSOLE if TTY
>         select SIFIVE_PLIC
> diff --git a/arch/riscv/configs/nommu_virt_defconfig b/arch/riscv/configs/nommu_virt_defconfig
> index cf74e179bf90..cf9388184aa3 100644
> --- a/arch/riscv/configs/nommu_virt_defconfig
> +++ b/arch/riscv/configs/nommu_virt_defconfig
> @@ -26,6 +26,7 @@ CONFIG_EXPERT=y
>  CONFIG_SLOB=y
>  # CONFIG_SLAB_MERGE_DEFAULT is not set
>  # CONFIG_MMU is not set
> +CONFIG_SOC_VIRT=y
>  CONFIG_MAXPHYSMEM_2GB=y
>  CONFIG_SMP=y
>  CONFIG_CMDLINE="root=/dev/vda rw earlycon=uart8250,mmio,0x10000000,115200n8 console=ttyS0"
> @@ -48,7 +49,6 @@ CONFIG_VIRTIO_BLK=y
>  # CONFIG_SERIO is not set
>  # CONFIG_LEGACY_PTYS is not set
>  # CONFIG_LDISC_AUTOLOAD is not set
> -# CONFIG_DEVMEM is not set
>  CONFIG_SERIAL_8250=y
>  # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
>  CONFIG_SERIAL_8250_CONSOLE=y
> @@ -56,16 +56,13 @@ CONFIG_SERIAL_8250_NR_UARTS=1
>  CONFIG_SERIAL_8250_RUNTIME_UARTS=1
>  CONFIG_SERIAL_OF_PLATFORM=y
>  # CONFIG_HW_RANDOM is not set
> +# CONFIG_DEVMEM is not set
>  # CONFIG_HWMON is not set
> -# CONFIG_LCD_CLASS_DEVICE is not set
> -# CONFIG_BACKLIGHT_CLASS_DEVICE is not set

Why these changes are in the diff ?

>  # CONFIG_VGA_CONSOLE is not set
>  # CONFIG_HID is not set
>  # CONFIG_USB_SUPPORT is not set
>  CONFIG_VIRTIO_MMIO=y
>  CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
> -CONFIG_SIFIVE_PLIC=y
> -# CONFIG_VALIDATE_FS_PARSER is not set
>  CONFIG_EXT2_FS=y
>  # CONFIG_DNOTIFY is not set
>  # CONFIG_INOTIFY_USER is not set
> diff --git a/arch/riscv/include/asm/clint.h b/arch/riscv/include/asm/clint.h
> deleted file mode 100644
> index adaba98a7d6c..000000000000
> --- a/arch/riscv/include/asm/clint.h
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef _ASM_RISCV_CLINT_H
> -#define _ASM_RISCV_CLINT_H 1
> -
> -#include <linux/io.h>
> -#include <linux/smp.h>
> -
> -#ifdef CONFIG_RISCV_M_MODE
> -void clint_init_boot_cpu(void);
> -#else /* CONFIG_RISCV_M_MODE */
> -#define clint_init_boot_cpu()  do { } while (0)
> -#endif /* CONFIG_RISCV_M_MODE */
> -
> -#endif /* _ASM_RISCV_CLINT_H */
> diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
> index bad2a7c2cda5..a3fb85d505d4 100644
> --- a/arch/riscv/include/asm/timex.h
> +++ b/arch/riscv/include/asm/timex.h
> @@ -7,41 +7,27 @@
>  #define _ASM_RISCV_TIMEX_H
>
>  #include <asm/csr.h>
> -#include <asm/mmio.h>
>
>  typedef unsigned long cycles_t;
>
> -extern u64 __iomem *riscv_time_val;
> -extern u64 __iomem *riscv_time_cmp;
> -
> -#ifdef CONFIG_64BIT
> -#define mmio_get_cycles()      readq_relaxed(riscv_time_val)
> -#else
> -#define mmio_get_cycles()      readl_relaxed(riscv_time_val)
> -#define mmio_get_cycles_hi()   readl_relaxed(((u32 *)riscv_time_val) + 1)
> -#endif
> -
>  static inline cycles_t get_cycles(void)
>  {
> -       if (IS_ENABLED(CONFIG_RISCV_SBI))
> -               return csr_read(CSR_TIME);
> -       return mmio_get_cycles();
> +       return csr_read(CSR_TIME);
>  }
>  #define get_cycles get_cycles
>
> +static inline u32 get_cycles_hi(void)
> +{
> +       return csr_read(CSR_TIMEH);
> +}
> +#define get_cycles_hi get_cycles_hi
> +
>  #ifdef CONFIG_64BIT
>  static inline u64 get_cycles64(void)
>  {
>         return get_cycles();
>  }
>  #else /* CONFIG_64BIT */
> -static inline u32 get_cycles_hi(void)
> -{
> -       if (IS_ENABLED(CONFIG_RISCV_SBI))
> -               return csr_read(CSR_TIMEH);
> -       return mmio_get_cycles_hi();
> -}
> -
>  static inline u64 get_cycles64(void)
>  {
>         u32 hi, lo;
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index b355cf485671..7edf15643146 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -31,7 +31,7 @@ obj-y += cacheinfo.o
>  obj-y  += patch.o
>  obj-$(CONFIG_MMU) += vdso.o vdso/
>
> -obj-$(CONFIG_RISCV_M_MODE)     += clint.o traps_misaligned.o
> +obj-$(CONFIG_RISCV_M_MODE)     += traps_misaligned.o
>  obj-$(CONFIG_FPU)              += fpu.o
>  obj-$(CONFIG_SMP)              += smpboot.o
>  obj-$(CONFIG_SMP)              += smp.o
> diff --git a/arch/riscv/kernel/clint.c b/arch/riscv/kernel/clint.c
> deleted file mode 100644
> index a9845ee023e2..000000000000
> --- a/arch/riscv/kernel/clint.c
> +++ /dev/null
> @@ -1,63 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/*
> - * Copyright (c) 2019 Christoph Hellwig.
> - */
> -
> -#include <linux/io.h>
> -#include <linux/of_address.h>
> -#include <linux/smp.h>
> -#include <linux/types.h>
> -#include <asm/clint.h>
> -#include <asm/csr.h>
> -#include <asm/timex.h>
> -
> -/*
> - * This is the layout used by the SiFive clint, which is also shared by the qemu
> - * virt platform, and the Kendryte KD210 at least.
> - */
> -#define CLINT_IPI_OFF          0
> -#define CLINT_TIME_CMP_OFF     0x4000
> -#define CLINT_TIME_VAL_OFF     0xbff8
> -
> -u32 __iomem *clint_ipi_base;
> -
> -static void clint_send_ipi(const struct cpumask *target)
> -{
> -       unsigned int cpu;
> -
> -       for_each_cpu(cpu, target)
> -               writel(1, clint_ipi_base + cpuid_to_hartid_map(cpu));
> -}
> -
> -static void clint_clear_ipi(void)
> -{
> -       writel(0, clint_ipi_base + cpuid_to_hartid_map(smp_processor_id()));
> -}
> -
> -static struct riscv_ipi_ops clint_ipi_ops = {
> -       .ipi_inject = clint_send_ipi,
> -       .ipi_clear = clint_clear_ipi,
> -};
> -
> -void clint_init_boot_cpu(void)
> -{
> -       struct device_node *np;
> -       void __iomem *base;
> -
> -       np = of_find_compatible_node(NULL, NULL, "riscv,clint0");
> -       if (!np) {
> -               panic("clint not found");
> -               return;
> -       }
> -
> -       base = of_iomap(np, 0);
> -       if (!base)
> -               panic("could not map CLINT");
> -
> -       clint_ipi_base = base + CLINT_IPI_OFF;
> -       riscv_time_cmp = base + CLINT_TIME_CMP_OFF;
> -       riscv_time_val = base + CLINT_TIME_VAL_OFF;
> -
> -       clint_clear_ipi();
> -       riscv_set_ipi_ops(&clint_ipi_ops);
> -}
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index f04373be54a6..2c6dd329312b 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -18,7 +18,6 @@
>  #include <linux/swiotlb.h>
>  #include <linux/smp.h>
>
> -#include <asm/clint.h>
>  #include <asm/cpu_ops.h>
>  #include <asm/setup.h>
>  #include <asm/sections.h>
> @@ -79,7 +78,6 @@ void __init setup_arch(char **cmdline_p)
>  #else
>         unflatten_device_tree();
>  #endif
> -       clint_init_boot_cpu();
>
>  #ifdef CONFIG_SWIOTLB
>         swiotlb_init(1);
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index 8b85683ce203..07626be78c23 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -17,7 +17,6 @@
>  #include <linux/seq_file.h>
>  #include <linux/delay.h>
>
> -#include <asm/clint.h>
>  #include <asm/sbi.h>
>  #include <asm/tlbflush.h>
>  #include <asm/cacheflush.h>
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index 5fe849791bf0..a6cfa9842d4b 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -24,7 +24,6 @@
>  #include <linux/of.h>
>  #include <linux/sched/task_stack.h>
>  #include <linux/sched/mm.h>
> -#include <asm/clint.h>
>  #include <asm/cpu_ops.h>
>  #include <asm/irq.h>
>  #include <asm/mmu_context.h>
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 41f1c147c178..b24449da3022 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -648,9 +648,8 @@ config ATCPIT100_TIMER
>           This option enables support for the Andestech ATCPIT100 timers.
>
>  config RISCV_TIMER
> -       bool "Timer for the RISC-V platform"
> +       bool "Timer for the RISC-V platform" if COMPILE_TEST
>         depends on GENERIC_SCHED_CLOCK && RISCV
> -       default y
>         select TIMER_PROBE
>         select TIMER_OF
>         help
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> index 9de1dabfb126..c51c5ed15aa7 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -19,26 +19,13 @@
>  #include <linux/of_irq.h>
>  #include <asm/smp.h>
>  #include <asm/sbi.h>
> -
> -u64 __iomem *riscv_time_cmp;
> -u64 __iomem *riscv_time_val;
> -
> -static inline void mmio_set_timer(u64 val)
> -{
> -       void __iomem *r;
> -
> -       r = riscv_time_cmp + cpuid_to_hartid_map(smp_processor_id());
> -       writeq_relaxed(val, r);
> -}
> +#include <asm/timex.h>
>
>  static int riscv_clock_next_event(unsigned long delta,
>                 struct clock_event_device *ce)
>  {
>         csr_set(CSR_IE, IE_TIE);
> -       if (IS_ENABLED(CONFIG_RISCV_SBI))
> -               sbi_set_timer(get_cycles64() + delta);
> -       else
> -               mmio_set_timer(get_cycles64() + delta);
> +       sbi_set_timer(get_cycles64() + delta);
>         return 0;
>  }
>
> --
> 2.25.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Otherwise, looks good.

Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
