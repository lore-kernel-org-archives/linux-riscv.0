Return-Path: <SRS0=lacq=HH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0501C433E6
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 03:44:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 426C164E27
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 03:44:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 426C164E27
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Vddywo+NrnALEJ0ziP3DMv9v0O0RqrOcE4E4Z00dHQ0=; b=1HJsqZZhfBt1tw/yL9zvNlRdv
	QATjnoO0dSuVgWAx9rlzqm5wY32gG1LxeL+YBHM4GiLjqHaf+MOd1O7dFp8jwYYXdCl9oRMPvCyd/
	6ncH9YwozRU5DJWmclMXxTGkd8WAZJpQPofQ40XT/tDwmXL5SGLPPnL7ktTUnlJ14BQxAyuT6OzI5
	IxjhixOFOyAbBwRv1du5Gw6CECGqMmOjF5A+Ey0G/JK0WbxafND8OoAqcyAh88EQvNIcSMg/m+RdD
	IaItDXIfxBmlJx+C9AtFC06OeTarRCbIiJw1QOz0wVZbMsAoC0L+tKOy6YrrhxjJ39NT2nnVz7pqf
	2QMOy7uMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7s2U-0004se-Ft; Fri, 05 Feb 2021 03:44:10 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7s2R-0004rp-L0
 for linux-riscv@lists.infradead.org; Fri, 05 Feb 2021 03:44:08 +0000
Received: by mail-pj1-x102e.google.com with SMTP id z9so3038686pjl.5
 for <linux-riscv@lists.infradead.org>; Thu, 04 Feb 2021 19:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=lIjxIKpIr+3Dnu86hC+KNuFISNoEm1fG3l4K0V/yLHo=;
 b=SA7xmvPluOPT2TLwX9ixE+ww9PJrMgUpdHpBn9Zod/K7mKwcNWOAZsg7tlTbfJa4bX
 HYc6u1MmVUMc2YM+RX4dWYCTc5v9RKt+VeXz83BqczmI4VnN1VSG5BDf/9Oel0kT33Qs
 U1rirqtHuu9cvqae6mS+wmxBVX1PF8Wf25KNoYyLAo6+ASKt8oEqndwzTEkcJNfdEAak
 5MNu8R29Rox7Z5mQfRJs7pVPZhj3CMu/HaE7ep5RYWDipm54zbekqkcT9FDgU5o3IfI8
 PwsH/5WmxCwhPN4hdEZDxLNpmTTwdtctcINS/rpVAnVp3V1tuxtsbP7wHll+jszR2nkx
 hUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=lIjxIKpIr+3Dnu86hC+KNuFISNoEm1fG3l4K0V/yLHo=;
 b=EU7gNBfSBdFk+ajwwCsLDbUXvEqkUJsXY5afETkrISOSIkv8gmekUxiKGWhXi6hXo1
 i6WJODjdGbpLpNwkHvujZaiI24KPZNWoEU6zOR3fTjGjkUzgsvQBeAbh4d/+1Jtn13+x
 8fpwIWZO+toTim2bytSr7vSqYiOjF5pCWrKGKDZFB3LTELGiQzZZq5Yj5TTtqcgNkojQ
 xHhZT6SLwcnOS8CVIyf6n7hO2P1oML9CNWwm1uZUDNjn1eIBQvijFfyiLb68vYaNakzU
 dCVYV5GJIo5kQsIdrpKGw0OKodwKfVwf9ArxSaI1wkRxLN8DTSd5MRL4xw8WzbWReJ9b
 QNFg==
X-Gm-Message-State: AOAM533fUTBvu4dC1R8SyjyYwYEeZ6VLpGqFJPmmjrIieLCes0Z5Wr5L
 /ABAU/ViQADNLY0SyotX5SSo8RHUbA2zm+nW
X-Google-Smtp-Source: ABdhPJzcXeTkJHjjOVO66HBjAKPfvOtI1GWc/GK13032qLsY1KcQW5zRNtrK8CcHWZwRFe4fwDbslQ==
X-Received: by 2002:a17:902:e906:b029:e1:6020:42d4 with SMTP id
 k6-20020a170902e906b02900e1602042d4mr2302130pld.78.1612496644797; 
 Thu, 04 Feb 2021 19:44:04 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id j26sm6903036pfa.35.2021.02.04.19.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 19:44:03 -0800 (PST)
Date: Thu, 04 Feb 2021 19:44:03 -0800 (PST)
X-Google-Original-Date: Thu, 04 Feb 2021 19:43:44 PST (-0800)
Subject: Re: [PATCH v15 00/16] RISC-V Kendryte K210 support improvements
In-Reply-To: <20210203125913.390949-1-damien.lemoal@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <mhng-d37e3acd-9523-4a5b-8c07-a89dcd0962e5@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_224407_725899_013E9FE3 
X-CRM114-Status: GOOD (  37.97  )
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
Cc: Atish Patra <Atish.Patra@wdc.com>, linux-riscv@lists.infradead.org,
 Anup Patel <Anup.Patel@wdc.com>, seanga2@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 03 Feb 2021 04:58:57 PST (-0800), Damien Le Moal wrote:
> This series of patches improves support for boards based on the Canaan
> Kendryte K210 RISC-V dual core SoC. Minimal support for this SoC is
> already included in the kernel. These patches complete it, enabling
> support for most peripherals present on the SoC as well as introducing
> device trees for the various K210 boards available on the market today
> from SiPeed and Kendryte.
>
> The patches here are the remaining patches not yet applied.
>
> Patch 1 adds the SoC clock driver.
>
> Patches 2 to 8 add and update device tree bindings documentation to
> document the K210 device tree files. In particular, patch 2 and 3
> define compatible strings used for the SoC CPU and for the K210 based
> boards supported.

Looks like Rob has some comments on a handful of these, so I'll be expecting a
v16.

>
> Patches 9 to 14 update the existing K210 base device tree and add new
> device tree files for several K210 based boards: MAIX Bit, MAIXDUINO,
> MAIX Dock and MAIX Go boards from SiPeed and the KD233 development
> board from Canaan.
>
> Finally the last two patches updates the k210 nommu defconfig to include
> the newly implemented drivers and provide a new default configuration
> file enabling SD card support.
>
> A lot of the work on the device tree and on the K210 drivers come from
> the work by Sean Anderson for the U-Boot project support of the K210
> SoC. Sean also helped with debugging many aspects of the K210 support.
>
> A tree with all patches applied is available here:
> https://github.com/damien-lemoal/linux, k210-sysctl-v28 branch.
> A demonstration of this series used on a SiPeed MAIX Dock
> board together with an I2C servo controller can be seen here:
> https://damien-lemoal.github.io/linux-robot-arm/#example
>
> This tree was used to build userspace busybox environment image that is
> then copied onto an SD card formatted with ext2:
> https://github.com/damien-lemoal/buildroot
> Of note is that running this userspace environment requires a revert of
> commit 2217b982624680d19a80ebb4600d05c8586c4f96 introduced during the
> 5.9 development cycle. Without this revert, execution of the init
> process fails. A problem with the riscv port of elf2flt is suspected but
> not confirmed. I am now starting to investigate this problem.
>
> Reviews and comments are as always much welcome.
>
> Changes from v14:
> * Fixed typo in patch 4
> * Added reviewed-by tags
>
> Changes from v13:
> * Rebased on rc6
> * Removed FPIOA driver patch as it is already queued.
>
> Changes from v12:
> * Addressed Rab's comments: keep SoC specific compatible string for DT
>   nodes reusing existing IP blocks (e.g. PLIC and CLINT).
> * Addressed dt-bindings schema file check warnings.
>
> Changes from v11:
> * Addressed Stephen's comment on the clock driver
> * Fixed and added device tree bindings yaml files and fixed the device
>   tree files to fix all warnings generated by make dtbs_check
> * Rebased on riscv tree fixes + latest riscv for-next branches.
>
> Changes from v10:
> * Rebased on riscv tree fixes+for-next branches. Patches already applied
>   to these branches were removed from this series.
> * Fixed the clock driver and pinctrl driver patch titles to indicate the
>   correct target sub-components.
> * Applied reviewed-by tags from Anup.
>
> Changes from v9:
> * Added patch 6 to avoid DTS compilation errors after patch 9 is
>   applied and until patch 16 is applied.
>
> Changes from v8:
> * Addressed Rob's comments on the sysctl driver bindings documentation
> * Fixed a typo in the fpios driver bindings documentation
>
> Changes from v7:
> * Removed the __init annotation for the drivers reset, pinctrl and
>   sysctl drivers probe functions as suggested by Geert. Also removed
>   the __refdata annotation for the struct platform_driver variables of
>   these drivers.
>
> Changes from v6:
> * Annotate struct platform_driver variables with __refdata to avoid
>   section mismatch compilation errors
> * Add empty sentinel entry to of_device_id tables of the sysctl, reset
>   and pinctrl drivers.
>
> Changes from v5:
> * Addressed Philipp's comment on the reset controller driver
> * Added patch 6 to reduce the size of the clock driver patch
>   (now patch 12).
>
> Changes from v4:
> * Simplified reset controller driver using of_xlate callback as
>   suggested by Philipp
> * Fixed compilation error when using other configs than one of the
>   nommu_k210 defconfigs.
> * Addressed most clock driver comments from Stephen.
> * Removed CONFIG_GPIO_SYSFS from defconfigs
> * Rebased on 5.10-rc7
>
> Changes from V3:
> * Add one entry per driver in MAINTAINERS file
>
> Changes from V2:
> * Add MAINTAINERS file entry for the SoC support, listing myself as
>   maintainer.
> * Removed use of postcore_initcall() for declaring the drivers, using
>   the regular builtin_platform_driver() instead.
> * Fixed fpio pinctrl driver bindings documentation as commented by
>   Geert: removed input-schmitt and added input-schmitt-disable, fixed
>   typo and added input-disable and output-disable.
> * Fixed device tree to have cs-gpios active low, as per the default, as
>   active high necessity was an artifact of the gpio level double
>   inversion bug fixed recently.
> * Removed CONFIG_VT from defconfigs to reduce the kernel image size as
>   suggested by Geert.
>
> Changes from v1:
> * Improved DT bindings documentation
> * SPI and GPIO patches removed from this series (and being processed
>   directly through the relevant subsystems directly)
> * Improved device trees
> * Various cleanup and improvments of the drivers
>
> Damien Le Moal (16):
>   clk: Add RISC-V Canaan Kendryte K210 clock driver
>   dt-bindings: add Canaan boards compatible strings
>   dt-bindings: update risc-v cpu properties
>   dt-bindings: update sifive plic compatible string
>   dt-bindings: update sifive clint compatible string
>   dt-bindings: update sifive uart compatible string
>   dt-bindings: fix sifive gpio properties
>   dt-bindings: add resets property to dw-apb-timer
>   riscv: Update Canaan Kendryte K210 device tree
>   riscv: Add SiPeed MAIX BiT board device tree
>   riscv: Add SiPeed MAIX DOCK board device tree
>   riscv: Add SiPeed MAIX GO board device tree
>   riscv: Add SiPeed MAIXDUINO board device tree
>   riscv: Add Kendryte KD233 board device tree
>   riscv: Update Canaan Kendryte K210 defconfig
>   riscv: Add Canaan Kendryte K210 SD card defconfig
>
>  .../devicetree/bindings/gpio/sifive,gpio.yaml |   21 +-
>  .../sifive,plic-1.0.0.yaml                    |   20 +-
>  .../devicetree/bindings/riscv/canaan.yaml     |   47 +
>  .../devicetree/bindings/riscv/cpus.yaml       |    2 +
>  .../bindings/serial/sifive-serial.yaml        |    1 +
>  .../bindings/timer/sifive,clint.yaml          |   19 +-
>  .../bindings/timer/snps,dw-apb-timer.yaml     |    3 +
>  MAINTAINERS                                   |    1 +
>  arch/riscv/Kconfig.socs                       |    2 +-
>  arch/riscv/boot/dts/canaan/canaan_kd233.dts   |  177 +++
>  arch/riscv/boot/dts/canaan/k210.dts           |   23 -
>  arch/riscv/boot/dts/canaan/k210.dtsi          |  535 ++++++++-
>  arch/riscv/boot/dts/canaan/k210_generic.dts   |   46 +
>  .../riscv/boot/dts/canaan/sipeed_maix_bit.dts |  234 ++++
>  .../boot/dts/canaan/sipeed_maix_dock.dts      |  236 ++++
>  arch/riscv/boot/dts/canaan/sipeed_maix_go.dts |  244 ++++
>  .../boot/dts/canaan/sipeed_maixduino.dts      |  209 ++++
>  arch/riscv/configs/nommu_k210_defconfig       |   44 +-
>  .../riscv/configs/nommu_k210_sdcard_defconfig |   92 ++
>  drivers/clk/Kconfig                           |    8 +
>  drivers/clk/Makefile                          |    1 +
>  drivers/clk/clk-k210.c                        | 1012 +++++++++++++++++
>  drivers/soc/canaan/Kconfig                    |   18 +-
>  drivers/soc/canaan/Makefile                   |    2 +-
>  drivers/soc/canaan/k210-sysctl.c              |  205 +---
>  include/dt-bindings/clock/k210-clk.h          |    1 -
>  include/soc/canaan/k210-sysctl.h              |    2 +
>  27 files changed, 2950 insertions(+), 255 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/riscv/canaan.yaml
>  create mode 100644 arch/riscv/boot/dts/canaan/canaan_kd233.dts
>  delete mode 100644 arch/riscv/boot/dts/canaan/k210.dts
>  create mode 100644 arch/riscv/boot/dts/canaan/k210_generic.dts
>  create mode 100644 arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
>  create mode 100644 arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
>  create mode 100644 arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
>  create mode 100644 arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
>  create mode 100644 arch/riscv/configs/nommu_k210_sdcard_defconfig
>  create mode 100644 drivers/clk/clk-k210.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
