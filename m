Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B0CC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 22 May 2022 12:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R2/X+VFIkYA+07AVnAJYN422d6MMoOSozh57EXW/PTI=; b=B+qlR6LXsWOgU4
	v5Zt7aYB6/1agtaFhZZmCdbzaMuFTWedltsFY3u5dXKbgrjE5cjOrwKQIrre+rZchERcTg4Udwh2T
	8mJUfLBF3tGmopSjq3o4QRqM68vAvQQ8uYc4YSQrSsyvVCTeArObkrVG3KA+LkIbwgHmJTFyNAi7A
	KY/9QZEWOqhwdgPbZeiJCcRLL4ru0GwzHcqLylGLWYBlpDS9NNFwakgWUbsoYG1dgqELdEw9UBVkl
	t9IzuIp5LXBXDpzQtqTnZJkOpdWcikvtq1TibRGdwg2vvOAmJakZFLyxz6LEDWU/HCoQmjkjjn9GU
	SDWBw+3OY6p4ghXygV7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nskgB-001JkH-A4; Sun, 22 May 2022 12:27:27 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nskg7-001Jij-Ir
 for linux-riscv@lists.infradead.org; Sun, 22 May 2022 12:27:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DD6E3B80B34
 for <linux-riscv@lists.infradead.org>; Sun, 22 May 2022 12:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9707C3411B
 for <linux-riscv@lists.infradead.org>; Sun, 22 May 2022 12:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653222436;
 bh=Nci77uD3HpKrTwmVZUdG4NYUnqtN/KNhXn7sZTDvIp0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Xgf7EkJm32YJU/D6Q429gzvuoL3PKBwLcdbDGiH5FYFSyv2pKGhSPLWW+Yf7iGEqE
 fxcigIzCJmPgFpMYwplI7l62PomsIX7O2Tr542hBRnOMKmm/ED/hRSkOrwvm7IILwf
 xrpF2Lfv9WZFJiv0gPJx9j9A+E0KucG6ujRUz7atnW7lzRaI9p5YxfIx6x+UZP/E7R
 J2OM5BI6KFZJ0DYRzBnaaEzhvtOzIz5VDLzJA3CHpjobM35XKiESWzAEwmpCE1uKWi
 w8Hflan9aQaTAhvTheRgC+B7Rt20iljD8cK2I643LrXIbgUzEXrJzp75G2kRkqZvK4
 mcgB9IIoL1BoQ==
Received: by mail-vs1-f46.google.com with SMTP id b7so12495868vsq.1
 for <linux-riscv@lists.infradead.org>; Sun, 22 May 2022 05:27:16 -0700 (PDT)
X-Gm-Message-State: AOAM533F+leSlMA+M+5VX9vHnEc9hGUowIQcVqX0iBzbpOlJi7evnq4d
 rBlAu6AOoVltii1ocMgsUqnCYDIrM+1QJDuq21w=
X-Google-Smtp-Source: ABdhPJwkp0oiWy9ohfBk6nrSE5RKN3uV8PIFv7b4D0/LzBelbWsNR1SmVEXnutbUdRI+2WxI+qDNSAVnGyfTj5wZ0ao=
X-Received: by 2002:a05:6102:390b:b0:32d:5fc3:bd2c with SMTP id
 e11-20020a056102390b00b0032d5fc3bd2cmr6567800vsu.51.1653222435738; Sun, 22
 May 2022 05:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220521193356.26562-1-palmer@rivosinc.com>
In-Reply-To: <20220521193356.26562-1-palmer@rivosinc.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 22 May 2022 20:27:04 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQqhxfsH6qq-gE1J2KdZnQ0gxqr128OAqi2=9p4eNgOJg@mail.gmail.com>
Message-ID: <CAJF2gTQqhxfsH6qq-gE1J2KdZnQ0gxqr128OAqi2=9p4eNgOJg@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: Add CONFIG_{NON,}PORTABLE
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Randy Dunlap <rdunlap@infradead.org>, 
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>, 
 Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 damien.lemoal@opensource.wdc.com, 
 Atish Patra <atishp@rivosinc.com>, Jens Axboe <axboe@kernel.dk>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220522_052723_968656_F0C2C6DD 
X-CRM114-Status: GOOD (  30.50  )
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

Reviewed-by: Guo Ren <guoren@kernel.org>

On Sun, May 22, 2022 at 4:46 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
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


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
