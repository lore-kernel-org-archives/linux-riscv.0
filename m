Return-Path: <SRS0=RTcI=GM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 165FAC433DB
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Jan 2021 17:32:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A00512388E
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Jan 2021 17:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A00512388E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=KjZtHbzJrKMqGarq0s6PpJF6Xv7aD/ObObus2RNzQC0=; b=AS5ZOmvybG7I7Z1HlEINkT3Ym
	7LJDfWj5B37rhTOWfQgKUyv/TSp3bRyTsy9GHvDyExzTapQEvvh7xu4ku6JCiYOPisKQ1Wz+P9RLW
	NBWu0j8zikLzgxuStnCqUb9qXZ6k7q842DmPQzxtorc0wsRoYp+jbj8LKj3e34mWkQb70J9mu2W6t
	daj5HCcNs7zkctEjWqRtI9EapFeJSdSoH/HNpsMtuEz1xhSTqbsa0dS1UYb8p3uKdqmmGLvp4oRHA
	ClU8nMtEW+U5qb++3Af0KL6cbWQ/LLhgEmqegOoq8mfecoMVB1q/eW1xN4VV5jhfgFYrMgxBDtNbM
	qwuSuklkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyI6C-00059M-3p; Sat, 09 Jan 2021 17:32:24 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyI67-00057w-1o
 for linux-riscv@lists.infradead.org; Sat, 09 Jan 2021 17:32:21 +0000
Received: by mail-pg1-x52e.google.com with SMTP id g15so9724664pgu.9
 for <linux-riscv@lists.infradead.org>; Sat, 09 Jan 2021 09:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=iPSaE+gTppr+0al+ZRJA/OKK8abbifI8OoOStZ7kwOE=;
 b=xpKTkIOr2wtvZeExypOk/J7yPBmvPH2jnbjh8LMjzPR7SEZ+pOqUC+c+rlS1cY/2F6
 NA2JH3IuDe/bFTv22p5GkuGFNm96cXfgeDPj5WeV4FlNf2reANgEXIE+WqJUJuwPWm6P
 pNdiVpQxOloZyHTvd4t7XOQuitEWeR9tZVQ9djBEczdJtvJPcwgto32iSc+vekzUzcw4
 XZL/F/+MtXOex/DmVhy+oXNAdoXQQtZdK7jxPElApTNvyGvS5MuogvSbYaCoVrU3tFNn
 YQW0RHTn+tJPnba37MPmAVCm8kYnyOc4G9iY7K0XyQilZwBnxyVMLTCnGPlCi7WAjV4r
 UlbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=iPSaE+gTppr+0al+ZRJA/OKK8abbifI8OoOStZ7kwOE=;
 b=afol44mfcyT+n6HLq8Qp4v3onAHaUB2zx1UEGW17sK5+UREEsX4tL79Dlg3j+xagv5
 92H2C40IHkkA2y8rKP+QHiNMK3ApFXSxgGAwZ9/EUIfYWjcgFk0Ki18j9GJsQbnzQBqc
 0flfD227uF3VQsvrUl7IbcUvApolfxkg4kAK1/OZtulNnnvrKhIiUzUOBQ17vrKN0Xnl
 DHUCoPn5B1vUgMlwqE3kxk3I1+HEJCwVwpYPMMaS5hOkDQZTZo2CqchQfonlBcSvoQBb
 Y4l7oJ1d9gk7o8VrvGVyodhKGV6ElI+Qr/gRlCznkchhqCPdzkjVU6HWsxA1P0qp8XCl
 nQLA==
X-Gm-Message-State: AOAM530UqU7gxQxeA2P27kk6nyiW6gmAeCjNJdVFTuxLX4s13sJl4rpv
 vFCuwTdPW9Vy1uGHJnzZ9U98GP+hrr41mQ==
X-Google-Smtp-Source: ABdhPJzjYXJ8uXMFZioJ/gLOSW/KhJTUSY4+HcyL4aaCKdDsPeqcZpZ9MqWfG0Sx4tgYsTM+p0He9Q==
X-Received: by 2002:a65:6405:: with SMTP id a5mr12344109pgv.389.1610213534771; 
 Sat, 09 Jan 2021 09:32:14 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id f64sm13444672pfb.146.2021.01.09.09.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jan 2021 09:32:13 -0800 (PST)
Date: Sat, 09 Jan 2021 09:32:13 -0800 (PST)
X-Google-Original-Date: Sat, 09 Jan 2021 09:32:10 PST (-0800)
Subject: Re: [PATCH v10 00/23] RISC-V Kendryte K210 support improvements
In-Reply-To: <20201213135056.24446-1-damien.lemoal@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <mhng-a7443f7f-42ff-4835-9b25-be8f91884e04@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210109_123219_321722_95CDC909 
X-CRM114-Status: GOOD (  44.72  )
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
Cc: devicetree@vger.kernel.org, sboyd@kernel.org, linus.walleij@linaro.org,
 seanga2@gmail.com, linux-gpio@vger.kernel.org, robh+dt@kernel.org,
 p.zabel@pengutronix.de, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 13 Dec 2020 05:50:33 PST (-0800), Damien Le Moal wrote:
> This series of patches improves support for boards based on the Canaan
> Kendryte K210 RISC-V dual core SoC. Minimal support for this SoC is
> already included in the kernel. These patches complete it, enabling
> support for most peripherals present on the SoC as well as introducing
> device trees for the various K210 boards available on the market today
> from SiPeed and Kendryte.

Putting everything together like this makes it overly difficult to get things
merged: there's some actual fixes, some new arch/riscv stuff, and a handful of
drivers.  I know we've been kind of mixing up the SiFive and RISC-V trees, but
that's largely because things have been pretty quiet and it's the same people
working on everything.  That'll probably change at some point, but it doesn't
mean we can just start mixing up everything in here -- even for the SiFive
stuff, we usulaly try to do it in the relevant subsystem tree.

> Pathes 1 to 4 are various fixes for riscv arch code and riscv
> dependent devices. Of note here is patch 3 which fix system calls
> execution in the no MMU case, and patch 4 which simplifies DTB builtin
> handling.

The first three are on fixes, but the fourth isn't a fix: it's a fairly
significant change to how portable our kernels can be.  The old scheme allows
vendors the option of building systems with M-mode compatibility, this new one
doesn't.  That said, I don't think anyone is actually going to build systems
this way -- we really should have had some sort of mboardid, but that was shot
down in favor of some sort of platform thing and it's unlikely we get that far
over there.

I'm not really sure I'm ready to throw in the towel on binary compatibility
between vendors yet, at least in general.  In this specific case it seems fine,
though -- accross the board we're just spending way too much time worrying
about the small things while we have way bigger problems to deal with.
Obviously it would be better if we had some scheme to handle this here, but I'd
much rather focus on the basics.

I still hope we get to the point where we can have binary compatibility between
systems from various vendors, while still having reasonably useful systems.
Unfortunately we're quite far away from anything like that, so I'm fine taking
this sort of thing as that's as good as we can do for the forseeable future.

This is on for-next.

> Patch 5 fixes naming of directories and configuration options to use the
> K210 SoC vendor name (Canaan) instead of its branding name (Kendryte).
>
> Patch 6 is a preparatory patch cleaning up the K210 system controller
> driver to facilitate introducing the SoC clock driver.

These are also on for-next.

> The following patches 7 to 11 document device tree bindings for the SoC
> drivers. The implementation of these drivers is provided in patches 12,
> 13 and 14, respectively implementing the SoC clock driver, reset
> controller and SOC pin function control.

The numbering is off a bit here.  The clock stuff has gone in through that tree
and I'm fine  taking the reset controller as that's been reviewed, but I don't
see any review on the pinctl driver so I haven't taken that yet.

I'm happy to re-send that patch (likely with a more appropriate subject line,
as it's a pinctl driver not a riscv patch).

> Patches 15 to 20 update the existing K210 device tree and add new
> device tree files for several K210 based boards: MAIX Bit, MAIXDUINO,
> MAIX Dock and MAIX Go boards from SiPeed and the KD233 development
> board from Canaan.

There are tons of checkpatch warnings in these, mostly related to compat
strings that don't have binding definitions.  It looks like there's just a lot
of stuff in there that doesn't have any support on the Linux side, my guess
would be that the best thing to do is to drop those until they're defined.

> Finally the last two patches updates the k210 nommu defconfig to include
> the newly implemented drivers and provide a new default configuration
> file enabling SD card support.

I'm also going to just leave these out for now, until we sort out the above
issues.  Let me know if you're going to send another patch set, or 

> A lot of the work on the device tree and on the K210 drivers come from
> the work by Sean Anderson for the U-Boot project support of the K210
> SoC. Sean also helped with debugging many aspects of this series.
>
> A tree with all patches applied is available here:
> https://github.com/damien-lemoal/linux, k210-sysctl-v22 branch.
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
> Damien Le Moal (22):
>   riscv: Fix kernel time_init()
>   riscv: Fix sifive serial driver
>   riscv: Enable interrupts during syscalls with M-Mode
>   riscv: Fix builtin DTB handling
>   riscv: Use vendor name for K210 SoC support
>   riscv: cleanup Canaan Kendryte K210 sysctl driver
>   dt-bindings: Add Canaan vendor prefix
>   dt-binding: clock: Document canaan,k210-clk bindings
>   dt-bindings: reset: Document canaan,k210-rst bindings
>   dt-bindings: pinctrl: Document canaan,k210-fpioa bindings
>   dt-binding: mfd: Document canaan,k210-sysctl bindings
>   riscv: Add Canaan Kendryte K210 clock driver
>   riscv: Add Canaan Kendryte K210 reset controller
>   riscv: Add Canaan Kendryte K210 FPIOA driver
>   riscv: Update Canaan Kendryte K210 device tree
>   riscv: Add SiPeed MAIX BiT board device tree
>   riscv: Add SiPeed MAIX DOCK board device tree
>   riscv: Add SiPeed MAIX GO board device tree
>   riscv: Add SiPeed MAIXDUINO board device tree
>   riscv: Add Kendryte KD233 board device tree
>   riscv: Update Canaan Kendryte K210 defconfig
>   riscv: Add Canaan Kendryte K210 SD card defconfig
>
> Damien Le Moal (23):
>   riscv: Fix kernel time_init()
>   riscv: Fix sifive serial driver
>   riscv: Enable interrupts during syscalls with M-Mode
>   riscv: Fix builtin DTB handling
>   riscv: Use vendor name for K210 SoC support
>   riscv: Fix Canaan Kendryte K210 device tree
>   riscv: cleanup Canaan Kendryte K210 sysctl driver
>   dt-bindings: Add Canaan vendor prefix
>   dt-binding: clock: Document canaan,k210-clk bindings
>   dt-bindings: reset: Document canaan,k210-rst bindings
>   dt-bindings: pinctrl: Document canaan,k210-fpioa bindings
>   dt-binding: mfd: Document canaan,k210-sysctl bindings
>   riscv: Add Canaan Kendryte K210 clock driver
>   riscv: Add Canaan Kendryte K210 reset controller
>   riscv: Add Canaan Kendryte K210 FPIOA driver
>   riscv: Update Canaan Kendryte K210 device tree
>   riscv: Add SiPeed MAIX BiT board device tree
>   riscv: Add SiPeed MAIX DOCK board device tree
>   riscv: Add SiPeed MAIX GO board device tree
>   riscv: Add SiPeed MAIXDUINO board device tree
>   riscv: Add Kendryte KD233 board device tree
>   riscv: Update Canaan Kendryte K210 defconfig
>   riscv: Add Canaan Kendryte K210 SD card defconfig
>
>  .../bindings/clock/canaan,k210-clk.yaml       |   54 +
>  .../bindings/mfd/canaan,k210-sysctl.yaml      |  109 ++
>  .../bindings/pinctrl/canaan,k210-fpioa.yaml   |  171 +++
>  .../bindings/reset/canaan,k210-rst.yaml       |   40 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
>  MAINTAINERS                                   |   23 +
>  arch/riscv/Kconfig.socs                       |   33 +-
>  arch/riscv/Makefile                           |    2 +-
>  arch/riscv/boot/dts/Makefile                  |    2 +-
>  arch/riscv/boot/dts/canaan/Makefile           |    5 +
>  arch/riscv/boot/dts/canaan/k210.dtsi          |  621 ++++++++++
>  arch/riscv/boot/dts/canaan/k210_generic.dts   |   46 +
>  arch/riscv/boot/dts/canaan/k210_kd233.dts     |  178 +++
>  arch/riscv/boot/dts/canaan/k210_maix_bit.dts  |  227 ++++
>  arch/riscv/boot/dts/canaan/k210_maix_dock.dts |  229 ++++
>  arch/riscv/boot/dts/canaan/k210_maix_go.dts   |  237 ++++
>  arch/riscv/boot/dts/canaan/k210_maixduino.dts |  201 ++++
>  arch/riscv/boot/dts/kendryte/Makefile         |    4 -
>  arch/riscv/boot/dts/kendryte/k210.dts         |   23 -
>  arch/riscv/boot/dts/kendryte/k210.dtsi        |  125 --
>  arch/riscv/configs/nommu_k210_defconfig       |   39 +-
>  .../riscv/configs/nommu_k210_sdcard_defconfig |   93 ++
>  arch/riscv/include/asm/soc.h                  |   38 -
>  arch/riscv/kernel/entry.S                     |    9 +
>  arch/riscv/kernel/soc.c                       |   27 -
>  arch/riscv/kernel/time.c                      |    3 +
>  arch/riscv/mm/init.c                          |    6 +-
>  drivers/clk/Kconfig                           |    8 +
>  drivers/clk/Makefile                          |    1 +
>  drivers/clk/clk-k210.c                        | 1005 +++++++++++++++++
>  drivers/pinctrl/Kconfig                       |   13 +
>  drivers/pinctrl/Makefile                      |    1 +
>  drivers/pinctrl/pinctrl-k210.c                |  985 ++++++++++++++++
>  drivers/reset/Kconfig                         |   10 +
>  drivers/reset/Makefile                        |    1 +
>  drivers/reset/reset-k210.c                    |  131 +++
>  drivers/soc/Kconfig                           |    2 +-
>  drivers/soc/Makefile                          |    2 +-
>  drivers/soc/canaan/Kconfig                    |   12 +
>  drivers/soc/canaan/Makefile                   |    3 +
>  drivers/soc/canaan/k210-sysctl.c              |   78 ++
>  drivers/soc/kendryte/Kconfig                  |   14 -
>  drivers/soc/kendryte/Makefile                 |    3 -
>  drivers/soc/kendryte/k210-sysctl.c            |  260 -----
>  drivers/tty/serial/sifive.c                   |    1 +
>  include/dt-bindings/clock/k210-clk.h          |   55 +-
>  include/dt-bindings/pinctrl/k210-fpioa.h      |  276 +++++
>  include/dt-bindings/reset/k210-rst.h          |   42 +
>  include/soc/canaan/k210-sysctl.h              |   43 +
>  49 files changed, 4962 insertions(+), 531 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml
>  create mode 100644 Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml
>  create mode 100644 arch/riscv/boot/dts/canaan/Makefile
>  create mode 100644 arch/riscv/boot/dts/canaan/k210.dtsi
>  create mode 100644 arch/riscv/boot/dts/canaan/k210_generic.dts
>  create mode 100644 arch/riscv/boot/dts/canaan/k210_kd233.dts
>  create mode 100644 arch/riscv/boot/dts/canaan/k210_maix_bit.dts
>  create mode 100644 arch/riscv/boot/dts/canaan/k210_maix_dock.dts
>  create mode 100644 arch/riscv/boot/dts/canaan/k210_maix_go.dts
>  create mode 100644 arch/riscv/boot/dts/canaan/k210_maixduino.dts
>  delete mode 100644 arch/riscv/boot/dts/kendryte/Makefile
>  delete mode 100644 arch/riscv/boot/dts/kendryte/k210.dts
>  delete mode 100644 arch/riscv/boot/dts/kendryte/k210.dtsi
>  create mode 100644 arch/riscv/configs/nommu_k210_sdcard_defconfig
>  create mode 100644 drivers/clk/clk-k210.c
>  create mode 100644 drivers/pinctrl/pinctrl-k210.c
>  create mode 100644 drivers/reset/reset-k210.c
>  create mode 100644 drivers/soc/canaan/Kconfig
>  create mode 100644 drivers/soc/canaan/Makefile
>  create mode 100644 drivers/soc/canaan/k210-sysctl.c
>  delete mode 100644 drivers/soc/kendryte/Kconfig
>  delete mode 100644 drivers/soc/kendryte/Makefile
>  delete mode 100644 drivers/soc/kendryte/k210-sysctl.c
>  create mode 100644 include/dt-bindings/pinctrl/k210-fpioa.h
>  create mode 100644 include/dt-bindings/reset/k210-rst.h
>  create mode 100644 include/soc/canaan/k210-sysctl.h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
