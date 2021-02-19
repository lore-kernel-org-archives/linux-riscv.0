Return-Path: <SRS0=LlRU=HV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C344FC433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Feb 2021 06:29:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEE8C64E44
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Feb 2021 06:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEE8C64E44
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=F6APvjRNiBCOGqCe5rCh5Sr6T9budayVljtab8/yx+c=; b=dODv4TBXH4JfzPqVtEPePjYYe
	sKVbPwGJEbpXy0UPnp1WD5B3FPmVzSIwDSVw6aab65NuwtwmxC1KEJUH8MePrwG4cSdZhA5HaE583
	eZvye6Roa0mpsm8g6GoR6r11IgI3WBYy+wNXaxnOgFq9LukoSHUcqxbAxYxctktXu4+u79AqCAIXW
	cplcHApTtaV04GziyxN6+rU6WDIw9NUR1bcwcpsCWc93BzkeJgOsVc/vrFSXu/iQHH0vAjvJcqPy3
	A4UQP9TmKsQ9RaAfwE3LwQDD1P70Suua4KEm73zhJkBETqKN+7LZPfinnN4ETXx54mZsq56svo73b
	br4069+dQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCzHo-0000MT-H2; Fri, 19 Feb 2021 06:29:08 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCzHk-0000Lx-Fz
 for linux-riscv@lists.infradead.org; Fri, 19 Feb 2021 06:29:06 +0000
Received: by mail-pl1-x632.google.com with SMTP id z7so2804102plk.7
 for <linux-riscv@lists.infradead.org>; Thu, 18 Feb 2021 22:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Fbuv3R4FMoHxczfqV7KC/K/Jrzcbmq8B3ofcFmFE7ws=;
 b=BUDjaRnQGbmHzjCG0FYCTvcYd8HwXbsvh9Qucqi3ScnhelVaq34SGbPYmBZzIF5Wek
 RN42crLvlT7Ak3aWECn7ycAFZ+7kU9NeOMCB0BjiXHR0PwyKn7q+tfXzK8rKInSIrDTA
 ciLbFAtnenSseHvnfwPWWyr5Y7ckzk57RwAVI7vPj7fTBYggJ0o8zosfw/VqZA5hyFx+
 L/kc8+x7d2tDSyk/CGV4IH8DxL2SXlTDEZrYwCGtH6y5i0ouy80h0tF1AcD2cBw1b7KP
 CqTK1oB1wwTF07/oCLln0vdm0ft/7aUGIPK7WagsUX6/gIy+Y3xFh8r7Odp+PNbXNjm4
 0EXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Fbuv3R4FMoHxczfqV7KC/K/Jrzcbmq8B3ofcFmFE7ws=;
 b=mGjQIyK+zIi0EuQbLiF3B87kXGCuWJT0EvlDHSI+D46zXBlogK4baMX9wb4kmdpkOm
 +TXaiDXjFCnPTnz2fwpCof8QySE04RgyJ9V8Fer+fGCFpipxar4KHlA8wrEzaKYpFUft
 FmfYQDmk5ShII9eV/BRX5d3MBsg6FD1BGq7PZT7UrIeCiQVa9ii0B/pixlCILqjQr8f6
 qIlBQgDhplxF6uZgj4upNaSeQuQdEcXj1BhT+3QSaXlIpG+skVecmjjqzMucQ/r+qK7U
 80AQl+gtU+jEsRbg9zl5pF97yQGtfReeWKJgvGTHGoqHjL1FC079Q700hAPCQTwOsVpJ
 eU6Q==
X-Gm-Message-State: AOAM530ngwXpoEzHjwAOCnwFK4yXOaroLBApzyv4lnXOoGvDHfKBv8aq
 IFCCQfV+/xW0nANlICmYFlMCOi0vTqgnkvbN
X-Google-Smtp-Source: ABdhPJw4/3t/FFUderldF86ZeQyST5NtI8OGSquofgD7fpTGGxdjTb2Mho/dCss0cceI8WWuRhlgmw==
X-Received: by 2002:a17:902:7847:b029:df:d889:252c with SMTP id
 e7-20020a1709027847b02900dfd889252cmr7767861pln.76.1613716140511; 
 Thu, 18 Feb 2021 22:29:00 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id e198sm8686203pfh.126.2021.02.18.22.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 22:28:59 -0800 (PST)
Date: Thu, 18 Feb 2021 22:28:59 -0800 (PST)
X-Google-Original-Date: Thu, 18 Feb 2021 22:28:56 PST (-0800)
Subject: Re: [PATCH v19 00/17] RISC-V Kendryte K210 support improvements
In-Reply-To: <20210210050230.131281-1-damien.lemoal@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <mhng-2ab8e6d6-d777-42a7-af47-de68fdcfc8f9@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210219_012904_703103_D118F456 
X-CRM114-Status: GOOD (  42.12  )
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

On Tue, 09 Feb 2021 21:02:13 PST (-0800), Damien Le Moal wrote:
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

I don't see a Review or Ack for this one, so I haven't taken it.  Not sure if I
just missed it or if it's going in through the clock tree.

> Patches 2 to 9 add and update device tree bindings documentation to
> document the K210 device tree files. In particular, patch 2 and 3
> define compatible strings used for the SoC CPU and for the K210 based
> boards supported.
>
> Patches 10 to 15 update the existing K210 base device tree and add new
> device tree files for several K210 based boards: MAIX Bit, MAIXDUINO,
> MAIX Dock and MAIX Go boards from SiPeed and the KD233 development
> board from Canaan.

Looks like I already have patch 10.

The other DT files have an entry for a microphone with an undocumented
compatible string, which triggers checkpatch.  I've removed it, along with the
audio entry that references it.  I don't really have an opinion on how that
stuff is in the DT, just that we need to document whatever we put in there.  If
it breaks something I'm happy to swap it out for another version, I'm not
planning on sending it up until next week (I'm sening a PR this week, just with
some older stuff).

Thanks!

> Finally the last two patches updates the k210 nommu defconfig to include
> the newly implemented drivers and provide a new default configuration
> file enabling SD card support.
>
> A lot of the work on the device tree and on the K210 drivers come from
> the work by Sean Anderson for the U-Boot project support of the K210
> SoC. Sean also helped with debugging many aspects of the K210 support.
>
> A tree with all patches applied is available here:
> https://github.com/damien-lemoal/linux, k210-sysctl-v32 branch.
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
> Changes from v18:
> * Added review and ack tags
> * Addressed Stephen's comments on the clock driver:
>   - Moved MAINTAINER file update to new patch 0002
>   - Code style nits
>   - Use of __init declarations for k210_register_xxx() functions
>   - Use of of_clk_hw_register() instead of clk_hw_register()
>   - Removed the need for in0 clock name
>
> Changes from v17:
> * Removed teh nodes of unsupported devices with undocumented bindings
>   from the SoC k210.dtsi DTS file.
>
> Changes from v16:
> * Rebased on rc7
> * Addressed Rob's comment on patch 7
> * Added review and ack tags.
>
> Changes from v15:
> * Addressed Rob's comments on patches 4 and 5
> * Fixed patch 7 ngpios property
> * Added review and ack tags.
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
> Damien Le Moal (17):
>   clk: Add RISC-V Canaan Kendryte K210 clock driver
>   dt-bindings: update MAINTAINERS file
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
>  .../devicetree/bindings/gpio/sifive,gpio.yaml |   25 +-
>  .../sifive,plic-1.0.0.yaml                    |   13 +-
>  .../devicetree/bindings/riscv/canaan.yaml     |   47 +
>  .../devicetree/bindings/riscv/cpus.yaml       |    2 +
>  .../bindings/serial/sifive-serial.yaml        |    1 +
>  .../bindings/timer/sifive,clint.yaml          |   12 +-
>  .../bindings/timer/snps,dw-apb-timer.yaml     |    3 +
>  MAINTAINERS                                   |    1 +
>  arch/riscv/Kconfig.socs                       |    2 +-
>  arch/riscv/boot/dts/canaan/canaan_kd233.dts   |  172 +++
>  arch/riscv/boot/dts/canaan/k210.dts           |   23 -
>  arch/riscv/boot/dts/canaan/k210.dtsi          |  395 ++++++-
>  arch/riscv/boot/dts/canaan/k210_generic.dts   |   46 +
>  .../riscv/boot/dts/canaan/sipeed_maix_bit.dts |  229 ++++
>  .../boot/dts/canaan/sipeed_maix_dock.dts      |  231 ++++
>  arch/riscv/boot/dts/canaan/sipeed_maix_go.dts |  239 ++++
>  .../boot/dts/canaan/sipeed_maixduino.dts      |  204 ++++
>  arch/riscv/configs/nommu_k210_defconfig       |   44 +-
>  .../riscv/configs/nommu_k210_sdcard_defconfig |   92 ++
>  drivers/clk/Kconfig                           |    7 +
>  drivers/clk/Makefile                          |    1 +
>  drivers/clk/clk-k210.c                        | 1007 +++++++++++++++++
>  drivers/soc/canaan/Kconfig                    |   18 +-
>  drivers/soc/canaan/Makefile                   |    2 +-
>  drivers/soc/canaan/k210-sysctl.c              |  205 +---
>  include/dt-bindings/clock/k210-clk.h          |    1 -
>  include/soc/canaan/k210-sysctl.h              |    2 +
>  27 files changed, 2773 insertions(+), 251 deletions(-)
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
