Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D834C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 22 May 2022 08:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I4TRKptvGKguDh0t/4XYiD3fbQCTpNIA/YD1hvjIQdw=; b=wGJPRI+aFQfew7
	vvLEP5NC/BWqvheV5Ezd0GJ0QBU+La7fS421VJm/YAjbjmtimYVCu12UbuA4D8KaUNutdcTY4h6XH
	oTZnxUoGdS5X9DTkTvhvY4OGKj4K1kuj+LkH/fdxSliemetKKn/3UB0PV9yTrQFSJ6BqwwUB0gO09
	xuS72uLiUYwqz0+9uQz5imGNxwcEzDlzY3oLw0LF7SPsEiHL6M+v7UlLZW3eCiwrB6iGpoYtMkIsL
	RAL1QF5+rZj5UCCpkA0Nmg7l7e0fVjoh1vNbL/HbN7FY4P2wsGKdZYQVfW2peEkBY5cVTHBy60TOu
	t84b6Ctfi4GZZKJdbbzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsgeR-000rDB-Tz; Sun, 22 May 2022 08:09:23 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsgeO-000rBz-3F
 for linux-riscv@lists.infradead.org; Sun, 22 May 2022 08:09:22 +0000
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2fee9fe48c2so121537957b3.3
 for <linux-riscv@lists.infradead.org>; Sun, 22 May 2022 01:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m0hAY9HQiA5YcGUnoFNg4oflZui2CiIWucOcgRM8PSA=;
 b=WFMORzDa9eAp3MVzlpkTn0tipf/VaJN2V2BYZ57NTDNPAHbIWBLB+vhJBoBfZ81130
 SzVJWhCOJ6T1GR/RrisWW9fJ0SZWT5afOkRjZNNu5tYOyy6gXuiDsfg/rIafiR8mNML8
 n7du7JO8Qxa4Marr4caBjWB+kFdrH8wZ0U8eI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m0hAY9HQiA5YcGUnoFNg4oflZui2CiIWucOcgRM8PSA=;
 b=NbI6LsfqgF0YQHJLpv+f14NcN4xJxbxe1M7H83CNya3S6Ar0qvXAPgbNNlX1HwFXuT
 qi+f4KUb/6pej3eyAdKIlOj08qt9+/XYUOUyVWSX7KK3RD3sNoSrgwMdfLBczmBfhzPY
 qitjNPFoLx4r9L+Z4LRrIpEUvjF594amJz0ddHjroqYWeZcSNmcownRYwaem8ZmVyDc9
 4m0fljDVYBebf3D6VUKlQWtrV6p1o5nV8aN3ecewFKlaH9+1KEi07iwSk1D+wh0JMTh+
 qNlwapn1hw9gPuv8u6bL0KYLxAFYh1k849C2IWLKa8rhTIYt0WW3GPdzROlQA4zf94lP
 UhXA==
X-Gm-Message-State: AOAM533wcPOw0efqDcufGcEWKiZnix5QHW1ckdCI61zGZW/oe7SWkYfc
 JwXe3nry4BT0WRrokg0A+MVq5/XKA9YM2iPjUlDk
X-Google-Smtp-Source: ABdhPJx7AKfYXL3TgYlEMbJf2Fdkx2iKb3yoWupi6td22Z7Oc8sjBtLyd3b/41vINEkoFeoBuSd0oiB9MxgKEiCdIpo=
X-Received: by 2002:a0d:df58:0:b0:2ff:222d:1a9f with SMTP id
 i85-20020a0ddf58000000b002ff222d1a9fmr18417405ywe.38.1653206958720; Sun, 22
 May 2022 01:09:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220521193356.26562-1-palmer@rivosinc.com>
In-Reply-To: <20220521193356.26562-1-palmer@rivosinc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Sun, 22 May 2022 01:09:07 -0700
Message-ID: <CAOnJCUKZuXN2Zao_42GVyHFrfZ2UUOA0ZkUF21qWtDsvW-L4JA@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: Add CONFIG_{NON,}PORTABLE
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Randy Dunlap <rdunlap@infradead.org>, 
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>, 
 Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 damien.lemoal@opensource.wdc.com, 
 Atish Patra <atishp@rivosinc.com>, axboe@kernel.dk, Guo Ren <guoren@kernel.org>,
 Mayuresh Chitale <mchitale@ventanamicro.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220522_010920_206494_B4754E66 
X-CRM114-Status: GOOD (  28.90  )
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

On Sat, May 21, 2022 at 1:47 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> The RISC-V port has collected a handful of options that are
> fundamentally non-portable.  To prevent users from shooting themselves
> in the foot, hide them all behind a config entry that explicitly calls
> out that non-portable binaries may be produced.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
> Changes since v2:
>
> * Update the nommu and rv32 defconfigs.  I'm still getting some ugliness
>   like
>
>     $ make.riscv rv32_defconfig
>     *** Default configuration is based on 'defconfig'
>     #
>     # configuration written to .config
>     #
>     Using .config as base
>     Merging ./arch/riscv/configs/32-bit.config
>     Value of CONFIG_PORTABLE is redefined by fragment ./arch/riscv/configs/32-bit.config:
>     Previous value: CONFIG_PORTABLE=y
>     New value: # CONFIG_PORTABLE is not set
>
>     Value of CONFIG_NONPORTABLE is redefined by fragment ./arch/riscv/configs/32-bit.config:
>     Previous value: # CONFIG_NONPORTABLE is not set
>     New value: CONFIG_NONPORTABLE=y
>
>     #
>     # merged configuration written to .config (needs make)
>     #
>     .config:3831:warning: override: ARCH_RV32I changes choice state
>     #
>     # configuration written to .config
>     #
>
>   not sure if there's a better way to do this.
>
> Changes since v1:
>
> * Fix a bunch of spelling mistakes.
> * Move NONPORTABLE under the "Platform type" sub-heading.
> * Fix the rv32i dependency.
>
> ---
>  arch/riscv/Kconfig                            | 28 +++++++++++++++++--
>  arch/riscv/configs/32-bit.config              |  2 ++
>  arch/riscv/configs/nommu_k210_defconfig       |  1 +
>  .../riscv/configs/nommu_k210_sdcard_defconfig |  1 +
>  arch/riscv/configs/nommu_virt_defconfig       |  1 +
>  arch/riscv/configs/rv32_defconfig             |  1 +
>  6 files changed, 32 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index f863065b478c..cd67b09a80f5 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -222,6 +222,21 @@ source "arch/riscv/Kconfig.erratas"
>
>  menu "Platform type"
>
> +config NONPORTABLE
> +       bool "Allow configurations that result in non-portable kernels"
> +       help
> +         RISC-V kernel binaries are compatible between all known systems
> +         whenever possible, but there are some use cases that can only be
> +         satisfied by configurations that result in kernel binaries that are
> +         not portable between systems.
> +
> +         Selecting N does not guarantee kernels will be portable to all known
> +         systems.  Selecting any of the options guarded by NONPORTABLE will
> +         result in kernel binaries that are unlikely to be portable between
> +         systems.
> +
> +         If unsure, say N.
> +
>  choice
>         prompt "Base ISA"
>         default ARCH_RV64I
> @@ -231,6 +246,7 @@ choice
>
>  config ARCH_RV32I
>         bool "RV32I"
> +       depends on NONPORTABLE
>         select 32BIT
>         select GENERIC_LIB_ASHLDI3
>         select GENERIC_LIB_ASHRDI3
> @@ -541,6 +557,7 @@ config STACKPROTECTOR_PER_TASK
>
>  config PHYS_RAM_BASE_FIXED
>         bool "Explicitly specified physical RAM address"
> +       depends on NONPORTABLE
>         default n
>
>  config PHYS_RAM_BASE
> @@ -554,7 +571,7 @@ config PHYS_RAM_BASE
>
>  config XIP_KERNEL
>         bool "Kernel Execute-In-Place from ROM"
> -       depends on MMU && SPARSEMEM
> +       depends on MMU && SPARSEMEM && NONPORTABLE
>         # This prevents XIP from being enabled by all{yes,mod}config, which
>         # fail to build since XIP doesn't support large kernels.
>         depends on !COMPILE_TEST
> @@ -594,9 +611,16 @@ endmenu
>
>  config BUILTIN_DTB
>         bool
> -       depends on OF
> +       depends on OF && NONPORTABLE
>         default y if XIP_KERNEL
>
> +config PORTABLE
> +       bool
> +       default !NONPORTABLE
> +       select EFI
> +       select OF
> +       select MMU
> +
>  menu "Power management options"
>
>  source "kernel/power/Kconfig"
> diff --git a/arch/riscv/configs/32-bit.config b/arch/riscv/configs/32-bit.config
> index 43f41323b67e..f6af0f708df4 100644
> --- a/arch/riscv/configs/32-bit.config
> +++ b/arch/riscv/configs/32-bit.config
> @@ -1,2 +1,4 @@
>  CONFIG_ARCH_RV32I=y
>  CONFIG_32BIT=y
> +# CONFIG_PORTABLE is not set
> +CONFIG_NONPORTABLE=y
> diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
> index 2438fa39f8ae..96fe8def644c 100644
> --- a/arch/riscv/configs/nommu_k210_defconfig
> +++ b/arch/riscv/configs/nommu_k210_defconfig
> @@ -28,6 +28,7 @@ CONFIG_EMBEDDED=y
>  CONFIG_SLOB=y
>  # CONFIG_MMU is not set
>  CONFIG_SOC_CANAAN=y
> +CONFIG_NONPORTABLE=y
>  CONFIG_SMP=y
>  CONFIG_NR_CPUS=2
>  CONFIG_CMDLINE="earlycon console=ttySIF0"
> diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
> index 9a133e63ae5b..379740654373 100644
> --- a/arch/riscv/configs/nommu_k210_sdcard_defconfig
> +++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
> @@ -20,6 +20,7 @@ CONFIG_EMBEDDED=y
>  CONFIG_SLOB=y
>  # CONFIG_MMU is not set
>  CONFIG_SOC_CANAAN=y
> +CONFIG_NONPORTABLE=y
>  CONFIG_SMP=y
>  CONFIG_NR_CPUS=2
>  CONFIG_CMDLINE="earlycon console=ttySIF0 root=/dev/mmcblk0p1 rootwait ro"
> diff --git a/arch/riscv/configs/nommu_virt_defconfig b/arch/riscv/configs/nommu_virt_defconfig
> index 5269fbb6b4fc..1a56eda5ce46 100644
> --- a/arch/riscv/configs/nommu_virt_defconfig
> +++ b/arch/riscv/configs/nommu_virt_defconfig
> @@ -25,6 +25,7 @@ CONFIG_EXPERT=y
>  CONFIG_SLOB=y
>  # CONFIG_MMU is not set
>  CONFIG_SOC_VIRT=y
> +CONFIG_NONPORTABLE=y
>  CONFIG_SMP=y
>  CONFIG_CMDLINE="root=/dev/vda rw earlycon=uart8250,mmio,0x10000000,115200n8 console=ttyS0"
>  CONFIG_CMDLINE_FORCE=y
> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> index 7e5efdc3829d..77bdb1d05a88 100644
> --- a/arch/riscv/configs/rv32_defconfig
> +++ b/arch/riscv/configs/rv32_defconfig
> @@ -18,6 +18,7 @@ CONFIG_EXPERT=y
>  CONFIG_PROFILING=y
>  CONFIG_SOC_SIFIVE=y
>  CONFIG_SOC_VIRT=y
> +CONFIG_NONPORTABLE=y
>  CONFIG_ARCH_RV32I=y
>  CONFIG_SMP=y
>  CONFIG_HOTPLUG_CPU=y
> --
> 2.34.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
