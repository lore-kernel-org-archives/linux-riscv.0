Return-Path: <SRS0=F85b=GA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76399C433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Dec 2020 12:03:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1885E20739
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Dec 2020 12:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1885E20739
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+BBmeZiDM3pYKPVJ9l/ZbxOOXQOwA0UW+XWklfOjNAI=; b=IMj+0RJccYWAaDQZlyAB3hvzR
	KZy5k1CxdwV5vdQASlV5jfceU+ZEk3ZPyq/WIF2y0i6KRQq7SLST+BzzcpL03SgIcc7gWrEWbX464
	Plvutr9LUpzlTEhwbwJK24GBK+DEu/9GyOHsO21lTGBpAg7YiTkyztSFBeU5+zXivvqMhMH/H5lWu
	89uf6ZPKIHghQ90vlLgn+cIQi/M2aFPJsI9+BAMTRC1NAxNUL2sM+i5bMRMlFxM32LHm8GA4NYy9E
	1BK+vn1NYIgGMB7H1AdmpHy5och24HQcn7NSlea66g4gIjxLba/wkww4tJxe7xoovSZXh9EqrJQ46
	ZNtEFlm1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ktrFK-0007Ij-Ng; Mon, 28 Dec 2020 12:03:30 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ktrFH-0007Hh-V5
 for linux-riscv@lists.infradead.org; Mon, 28 Dec 2020 12:03:28 +0000
Received: by mail-lf1-x133.google.com with SMTP id s26so23360702lfc.8
 for <linux-riscv@lists.infradead.org>; Mon, 28 Dec 2020 04:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n8o8T3KVh3sa6mcSr6R2U8aovfr4NzRDU/oLbZ8tRzs=;
 b=BxWuYZNEjzULKdz3w08WrP75HZ0C4feGV0J16+bqN5c1tyIP32zRFmKfi+IfJt56C5
 u4V6G5VaJC2Ko4pL6CXqq0w8ozEePcTp+x07lEylf4pUn6hGAboTA0oHWhrDUGoqX06X
 hO7lmE66HpJqxB55NpepHPRmjOWkYaqAVxndLHS5ufIHX5RAnt3odDD04GBLvviQgzhP
 NrrikVvZ/V9Mzf3HNrhe+ORwqE7l6oWqMSpIlC31uHAlRluhoMfE1mibm7yh8DsQ2GuA
 qde4sKC2IwQqG7vRZH6PuEduQlejqT+IOIQOkQ0imM/s3rY5Xd1i8BX3CS0BkDxaZln0
 ci0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n8o8T3KVh3sa6mcSr6R2U8aovfr4NzRDU/oLbZ8tRzs=;
 b=AxVDKb68xu8nqmHAL2sed4Mkre+6QSuh6Z+suQtFWF4R9qhPnnbunOClXhpzvmQ3wG
 9p5z8+10yh5N37E/Q8XMTQnceJZPJxcLVj1OY7ohO8M0pT/jF4J5DBthh1LXldbujCHn
 qyawM36SxSoVQQrivXSAwK76DXLVFwRNjdbb76qiTLADYgjCjZqai9zWkWJr7xggbpyv
 veiJhlV9boX5WZPa/TFh48d8BP7QYIXPfyhZLoY+MqFePY3PAW/qQPUdJxal/izNXuVV
 7P3TTa/QTrWX3h1A6lEke2D72ewntvrxP+u9NQY5U+I+/kJQ9QMekOsckYttDzQCTo65
 SWdQ==
X-Gm-Message-State: AOAM530BlKhneJ9R0W6+/thyw/4Go4lcUTKjLrI+EG9DHwznEa/BdX90
 XAfzkLS4gPQtswBKgND9vY7pM+7qPRe74sGrIzdflQ==
X-Google-Smtp-Source: ABdhPJy37oMJnWmRUoaMefyxJgkvsoqTDECwz6LV6L44JqwTjBjpF0QcWrJEn9WEibSn0th61vq+Y46YsUtgF3WywaU=
X-Received: by 2002:a19:2c4:: with SMTP id 187mr18233308lfc.391.1609157006318; 
 Mon, 28 Dec 2020 04:03:26 -0800 (PST)
MIME-Version: 1.0
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
 <20201213135056.24446-6-damien.lemoal@wdc.com>
In-Reply-To: <20201213135056.24446-6-damien.lemoal@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Dec 2020 17:33:15 +0530
Message-ID: <CAAhSdy3Wfc5M=y1bQ=ZVdSuDtH8B1-=3gFaaanmm0CET=btCwQ@mail.gmail.com>
Subject: Re: [PATCH v10 05/23] riscv: Use vendor name for K210 SoC support
To: Damien Le Moal <damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_070328_023664_0C84BA3E 
X-CRM114-Status: GOOD (  26.08  )
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
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Anderson <seanga2@gmail.com>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Dec 13, 2020 at 7:21 PM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>
> Rename configuration options and directories related to the Kendryte
> K210 SoC to use the SoC vendor name (canaan) instead of the "kendryte"
> branding name.
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  arch/riscv/Kconfig.socs                       | 24 +++++++++----------
>  arch/riscv/Makefile                           |  2 +-
>  arch/riscv/boot/dts/Makefile                  |  2 +-
>  arch/riscv/boot/dts/canaan/Makefile           |  5 ++++
>  .../boot/dts/{kendryte => canaan}/k210.dts    |  0
>  .../boot/dts/{kendryte => canaan}/k210.dtsi   |  0
>  arch/riscv/boot/dts/kendryte/Makefile         |  5 ----
>  arch/riscv/configs/nommu_k210_defconfig       |  2 +-
>  drivers/soc/Kconfig                           |  2 +-
>  drivers/soc/Makefile                          |  2 +-
>  drivers/soc/{kendryte => canaan}/Kconfig      |  4 ++--
>  drivers/soc/{kendryte => canaan}/Makefile     |  0
>  .../soc/{kendryte => canaan}/k210-sysctl.c    |  0
>  13 files changed, 24 insertions(+), 24 deletions(-)
>  create mode 100644 arch/riscv/boot/dts/canaan/Makefile
>  rename arch/riscv/boot/dts/{kendryte => canaan}/k210.dts (100%)
>  rename arch/riscv/boot/dts/{kendryte => canaan}/k210.dtsi (100%)
>  delete mode 100644 arch/riscv/boot/dts/kendryte/Makefile
>  rename drivers/soc/{kendryte => canaan}/Kconfig (79%)
>  rename drivers/soc/{kendryte => canaan}/Makefile (100%)
>  rename drivers/soc/{kendryte => canaan}/k210-sysctl.c (100%)
>
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 0bc3e28581f2..88ac0d1a5da4 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -22,21 +22,21 @@ config SOC_VIRT
>         help
>           This enables support for QEMU Virt Machine.
>
> -config SOC_KENDRYTE
> -       bool "Kendryte K210 SoC"
> +config SOC_CANAAN
> +       bool "Canaan Kendryte K210 SoC"
>         depends on !MMU
>         select CLINT_TIMER if RISCV_M_MODE
>         select SERIAL_SIFIVE if TTY
>         select SERIAL_SIFIVE_CONSOLE if TTY
>         select SIFIVE_PLIC
>         help
> -         This enables support for Kendryte K210 SoC platform hardware.
> +         This enables support for Canaan Kendryte K210 SoC platform hardware.
>
> -if SOC_KENDRYTE
> +if SOC_CANAAN
>
> -config SOC_KENDRYTE_K210_DTB_BUILTIN
> -       bool "Builtin device tree for the Kendryte K210"
> -       depends on SOC_KENDRYTE
> +config SOC_CANAAN_K210_DTB_BUILTIN
> +       bool "Builtin device tree for the Canaan Kendryte K210"
> +       depends on SOC_CANAAN
>         default y
>         select OF
>         select BUILTIN_DTB
> @@ -45,13 +45,13 @@ config SOC_KENDRYTE_K210_DTB_BUILTIN
>           This option should be selected if no bootloader is being used.
>           If unsure, say Y.
>
> -config SOC_KENDRYTE_K210_DTB_SOURCE
> -       string "Source file for the Kendryte K210 builtin DTB"
> -       depends on SOC_KENDRYTE
> -       depends on SOC_KENDRYTE_K210_DTB_BUILTIN
> +config SOC_CANAAN_K210_DTB_SOURCE
> +       string "Source file for the Canaan Kendryte K210 builtin DTB"
> +       depends on SOC_CANAAN
> +       depends on SOC_CANAAN_K210_DTB_BUILTIN
>         default "k210"
>         help
> -         Base name (without suffix, relative to arch/riscv/boot/dts/kendryte)
> +         Base name (without suffix, relative to arch/riscv/boot/dts/canaan)
>           for the DTS file that will be used to produce the DTB linked into the
>           kernel.
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 0289a97325d1..cd08dc40e8d8 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -83,7 +83,7 @@ PHONY += vdso_install
>  vdso_install:
>         $(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso $@
>
> -ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_SOC_KENDRYTE),yy)
> +ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_SOC_CANAAN),yy)
>  KBUILD_IMAGE := $(boot)/loader.bin
>  else
>  KBUILD_IMAGE := $(boot)/Image.gz
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index 21e3905f1c44..4da40691c55b 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  subdir-y += sifive
> -subdir-$(CONFIG_SOC_KENDRYTE) += kendryte
> +subdir-$(CONFIG_SOC_CANAAN) += canaan
>
>  obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
> diff --git a/arch/riscv/boot/dts/canaan/Makefile b/arch/riscv/boot/dts/canaan/Makefile
> new file mode 100644
> index 000000000000..9ee7156c0c31
> --- /dev/null
> +++ b/arch/riscv/boot/dts/canaan/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +ifneq ($(CONFIG_SOC_CANAAN_K210_DTB_SOURCE),"")
> +dtb-y += $(strip $(shell echo $(CONFIG_SOC_CANAAN_K210_DTB_SOURCE))).dtb
> +obj-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += $(addsuffix .o, $(dtb-y))
> +endif
> diff --git a/arch/riscv/boot/dts/kendryte/k210.dts b/arch/riscv/boot/dts/canaan/k210.dts
> similarity index 100%
> rename from arch/riscv/boot/dts/kendryte/k210.dts
> rename to arch/riscv/boot/dts/canaan/k210.dts
> diff --git a/arch/riscv/boot/dts/kendryte/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
> similarity index 100%
> rename from arch/riscv/boot/dts/kendryte/k210.dtsi
> rename to arch/riscv/boot/dts/canaan/k210.dtsi
> diff --git a/arch/riscv/boot/dts/kendryte/Makefile b/arch/riscv/boot/dts/kendryte/Makefile
> deleted file mode 100644
> index 83636693166d..000000000000
> --- a/arch/riscv/boot/dts/kendryte/Makefile
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0
> -ifneq ($(CONFIG_SOC_KENDRYTE_K210_DTB_SOURCE),"")
> -dtb-y += $(strip $(shell echo $(CONFIG_SOC_KENDRYTE_K210_DTB_SOURCE))).dtb
> -obj-$(CONFIG_SOC_KENDRYTE_K210_DTB_BUILTIN) += $(addsuffix .o, $(dtb-y))
> -endif
> diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
> index cd1df62b13c7..368a28cf1467 100644
> --- a/arch/riscv/configs/nommu_k210_defconfig
> +++ b/arch/riscv/configs/nommu_k210_defconfig
> @@ -27,7 +27,7 @@ CONFIG_EMBEDDED=y
>  CONFIG_SLOB=y
>  # CONFIG_SLAB_MERGE_DEFAULT is not set
>  # CONFIG_MMU is not set
> -CONFIG_SOC_KENDRYTE=y
> +CONFIG_SOC_CANAAN=y
>  CONFIG_MAXPHYSMEM_2GB=y
>  CONFIG_SMP=y
>  CONFIG_NR_CPUS=2
> diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
> index 425ab6f7e375..f43886fec32b 100644
> --- a/drivers/soc/Kconfig
> +++ b/drivers/soc/Kconfig
> @@ -6,6 +6,7 @@ source "drivers/soc/amlogic/Kconfig"
>  source "drivers/soc/aspeed/Kconfig"
>  source "drivers/soc/atmel/Kconfig"
>  source "drivers/soc/bcm/Kconfig"
> +source "drivers/soc/canaan/Kconfig"
>  source "drivers/soc/fsl/Kconfig"
>  source "drivers/soc/imx/Kconfig"
>  source "drivers/soc/ixp4xx/Kconfig"
> @@ -22,6 +23,5 @@ source "drivers/soc/ux500/Kconfig"
>  source "drivers/soc/versatile/Kconfig"
>  source "drivers/soc/xilinx/Kconfig"
>  source "drivers/soc/zte/Kconfig"
> -source "drivers/soc/kendryte/Kconfig"
>
>  endmenu
> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> index 36452bed86ef..dec90fca120b 100644
> --- a/drivers/soc/Makefile
> +++ b/drivers/soc/Makefile
> @@ -28,4 +28,4 @@ obj-$(CONFIG_ARCH_U8500)      += ux500/
>  obj-$(CONFIG_PLAT_VERSATILE)   += versatile/
>  obj-y                          += xilinx/
>  obj-$(CONFIG_ARCH_ZX)          += zte/
> -obj-$(CONFIG_SOC_KENDRYTE)     += kendryte/
> +obj-$(CONFIG_SOC_CANAAN)       += canaan/
> diff --git a/drivers/soc/kendryte/Kconfig b/drivers/soc/canaan/Kconfig
> similarity index 79%
> rename from drivers/soc/kendryte/Kconfig
> rename to drivers/soc/canaan/Kconfig
> index 49785b1b0217..5232d13f07e5 100644
> --- a/drivers/soc/kendryte/Kconfig
> +++ b/drivers/soc/canaan/Kconfig
> @@ -1,9 +1,9 @@
>  # SPDX-License-Identifier: GPL-2.0
>
> -if SOC_KENDRYTE
> +if SOC_CANAAN
>
>  config K210_SYSCTL
> -       bool "Kendryte K210 system controller"
> +       bool "Canaan Kendryte K210 SoC system controller"
>         default y
>         depends on RISCV
>         help
> diff --git a/drivers/soc/kendryte/Makefile b/drivers/soc/canaan/Makefile
> similarity index 100%
> rename from drivers/soc/kendryte/Makefile
> rename to drivers/soc/canaan/Makefile
> diff --git a/drivers/soc/kendryte/k210-sysctl.c b/drivers/soc/canaan/k210-sysctl.c
> similarity index 100%
> rename from drivers/soc/kendryte/k210-sysctl.c
> rename to drivers/soc/canaan/k210-sysctl.c
> --
> 2.29.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
