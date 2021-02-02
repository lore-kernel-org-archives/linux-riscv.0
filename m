Return-Path: <SRS0=Cdab=HE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF46AC433DB
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 10:36:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F37564EBF
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 10:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F37564EBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7DtDwuH78x9mKef22pUCUs8KANF3Kn5C/r8g6+PC+Z0=; b=Ji4JJHSeY+5WnncZ4fkQrBMR7r
	IBKc9ttQAaGVT6iHtRUNcH2ukSy1DqfB3KIf/i2vTm4Yw+V4zpLPm5bVjuMx03kDQMIHP3UuLNG9B
	QUpfUHZQ0yOhp83qs4FTCqmAbE+8UPwlh1D+m6vf1ES5SiqLbPR9uGw5JkSYQmULRXY5P52rsmWxe
	q2XOF5gPCuy54N9t+u02IB8x3WQ5ToPFKEHj0M3y+SxKONWc+USNhLpj6wb1kcaXd+o9FCSZmJ7qb
	m6strcogWJs2cCPXZV7NhZguEfb2Mx/tca2RnGuhqRdVcsTqH3ku0AFjjHfBxRY0iPthwFiJAfA/h
	Ab7BKqKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6t2x-000873-Sp; Tue, 02 Feb 2021 10:36:35 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6t2u-00086e-No
 for linux-riscv@lists.infradead.org; Tue, 02 Feb 2021 10:36:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612262192; x=1643798192;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B1RXdwR3EgoRK3FSqrUUx4jI/UahK21boHoZPP8KIx0=;
 b=Qa8D0/14NRO0240tjvncKEqFACLvzZkmf0GNYBJyGUfINEoqOAHlsjmH
 gXoYwUmBDzkmbB1AwXBhcaPCuP2W7hVXfqGp2otmjvYS0W6XggSjSI4fs
 ZUgjet4YlT6nPIt+LBrPVh4pG3+qgNBWq1Qn/DKrwqyVsSvrcEsOf7U/i
 nlAUpO2Elv8oCIzAnKTqfYF4EybXt31aPOQxK4schkWZTh+rxilbNOi9z
 mNd57atoUvBE4F6Zw6rvi2nVRczEW4jMZIN2tvteS7s0aTE7PLcBymJPj
 lo8F66WlAtOno05S9tQODN1ksB0imVQzWNnTomOllIydr7WYqaO4rmLq/ A==;
IronPort-SDR: EcS2sO2V1UkgcdTqxU7zyvrj68sSFTYUzsw3bJedcgPRku890j7ur8ucZwiBh5v0y8wsG4HCE+
 6fPv/S5c3kdUVkc9Ts06M2vd+Lw0F0+b9AaWVzRyO4xziZbiY4OuvA7Np2KW4RToA/VMmVoUiu
 S4IASFS119cFZQiFzxTpGX2UwOgeNHRH34CJ2QIGZzHYtNlmr06VhGBglxEynoQAF3Zkgg8Djx
 BCiSUa4YW5qqGly5u98cuamTVknyN/IswTgUThadjBxhpDZujTcXKFQ4FTrXgMG7JXj19RPETy
 vnM=
X-IronPort-AV: E=Sophos;i="5.79,394,1602518400"; d="scan'208";a="163357032"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 02 Feb 2021 18:36:27 +0800
IronPort-SDR: uWGJ1c0MTvxUsyTVOSaEQ+o4Jk0roUy6FUNiElP9yLgJqwVbhopEbRZQ8AO7gEueGvOCgJHh1O
 xLXxGWnkE452f36VJvKzpaXIxBzZs1A8T9OfeU0jEgAEAUd2sY11gGeDfEM3uaFmgA8k/iYTGE
 giByKioqpK806tBPGas8V7p5L0aFuZJoW+jepTO8P8cJHJq51fFo6lZl490RIpRb/jGWXeeyaR
 Yx81Dxug8ytSIGIugq58oLT9Sezp3fLkLR4DT6E13tfhtPYzh7nnVGzXfTelMXqDwiXm3ZVQV0
 +wXZoYchWDtuKmAASIL2oI0V
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 02:20:36 -0800
IronPort-SDR: 7AUiJw5NYeEL3PBBlllQzX4T30OQFADt+R5vV3j7abrcr/5fO+kbEmo5LrrpW7iaGpH2aMlB87
 hd5WRmqkXq9bHJeaWkLCgDvvt7+po0dS+RCIZltYUPpartU90vAtk4sLHDVXVcZNGxHZHtGAG8
 9kMXoZzUxM4hYXrliVgmQdI/CzzlxsVR0wffSSFTkQoXQE1Avsyyduo6xX8x0wyyEdYRX0cV2Z
 VP4UWxJM6+cSy9qsEAnevpWVlfJBDCH5OiQQweP099hMOiJb6s1ZzPpU+FNqUmomnUOPKQX/om
 tpw=
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.58])
 by uls-op-cesaip01.wdc.com with ESMTP; 02 Feb 2021 02:36:27 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v14 00/16] RISC-V Kendryte K210 support improvements
Date: Tue,  2 Feb 2021 19:36:07 +0900
Message-Id: <20210202103623.200809-1-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_053633_042239_5924A7F5 
X-CRM114-Status: GOOD (  25.02  )
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
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Resending this series as a ping. No changes, except for the FPIOA
driver patch that is removed as it is already in riscv/for-next.
I would really would like to get all this in 5.12.  Please review !


This series of patches improves support for boards based on the Canaan
Kendryte K210 RISC-V dual core SoC. Minimal support for this SoC is
already included in the kernel. These patches complete it, enabling
support for most peripherals present on the SoC as well as introducing
device trees for the various K210 boards available on the market today
from SiPeed and Kendryte.

The patches here are the remaining patches not yet applied.

Patch 1 adds the SoC clock driver.

Patches 2 to 8 add and update device tree bindings documentation to
document the K210 device tree files. In particular, patch 2 and 3
define compatible strings used for the SoC CPU and for the K210 based
boards supported.

Patches 9 to 14 update the existing K210 base device tree and add new
device tree files for several K210 based boards: MAIX Bit, MAIXDUINO,
MAIX Dock and MAIX Go boards from SiPeed and the KD233 development
board from Canaan.

Finally the last two patches updates the k210 nommu defconfig to include
the newly implemented drivers and provide a new default configuration
file enabling SD card support.

A lot of the work on the device tree and on the K210 drivers come from
the work by Sean Anderson for the U-Boot project support of the K210
SoC. Sean also helped with debugging many aspects of the K210 support.

A tree with all patches applied is available here:
https://github.com/damien-lemoal/linux, k210-sysctl-v27 branch.
A demonstration of this series used on a SiPeed MAIX Dock
board together with an I2C servo controller can be seen here:
https://damien-lemoal.github.io/linux-robot-arm/#example

This tree was used to build userspace busybox environment image that is
then copied onto an SD card formatted with ext2:
https://github.com/damien-lemoal/buildroot
Of note is that running this userspace environment requires a revert of
commit 2217b982624680d19a80ebb4600d05c8586c4f96 introduced during the
5.9 development cycle. Without this revert, execution of the init
process fails. A problem with the riscv port of elf2flt is suspected but
not confirmed. I am now starting to investigate this problem.

Reviews and comments are as always much welcome.

Changes from v13:
* Rebased on rc6
* Removed FPIOA driver patch as it is already queued.

Changes from v12:
* Addressed Rab's comments: keep SoC specific compatible string for DT
  nodes reusing existing IP blocks (e.g. PLIC and CLINT).
* Addressed dt-bindings schema file check warnings.

Changes from v11:
* Addressed Stephen's comment on the clock driver
* Fixed and added device tree bindings yaml files and fixed the device
  tree files to fix all warnings generated by make dtbs_check
* Rebased on riscv tree fixes + latest riscv for-next branches.

Changes from v10:
* Rebased on riscv tree fixes+for-next branches. Patches already applied
  to these branches were removed from this series.
* Fixed the clock driver and pinctrl driver patch titles to indicate the
  correct target sub-components.
* Applied reviewed-by tags from Anup.

Changes from v9:
* Added patch 6 to avoid DTS compilation errors after patch 9 is
  applied and until patch 16 is applied.

Changes from v8:
* Addressed Rob's comments on the sysctl driver bindings documentation
* Fixed a typo in the fpios driver bindings documentation

Changes from v7:
* Removed the __init annotation for the drivers reset, pinctrl and
  sysctl drivers probe functions as suggested by Geert. Also removed
  the __refdata annotation for the struct platform_driver variables of
  these drivers.

Changes from v6:
* Annotate struct platform_driver variables with __refdata to avoid
  section mismatch compilation errors
* Add empty sentinel entry to of_device_id tables of the sysctl, reset
  and pinctrl drivers.

Changes from v5:
* Addressed Philipp's comment on the reset controller driver
* Added patch 6 to reduce the size of the clock driver patch
  (now patch 12).

Changes from v4:
* Simplified reset controller driver using of_xlate callback as
  suggested by Philipp
* Fixed compilation error when using other configs than one of the
  nommu_k210 defconfigs.
* Addressed most clock driver comments from Stephen.
* Removed CONFIG_GPIO_SYSFS from defconfigs
* Rebased on 5.10-rc7

Changes from V3:
* Add one entry per driver in MAINTAINERS file

Changes from V2:
* Add MAINTAINERS file entry for the SoC support, listing myself as
  maintainer.
* Removed use of postcore_initcall() for declaring the drivers, using
  the regular builtin_platform_driver() instead.
* Fixed fpio pinctrl driver bindings documentation as commented by
  Geert: removed input-schmitt and added input-schmitt-disable, fixed
  typo and added input-disable and output-disable.
* Fixed device tree to have cs-gpios active low, as per the default, as
  active high necessity was an artifact of the gpio level double
  inversion bug fixed recently.
* Removed CONFIG_VT from defconfigs to reduce the kernel image size as
  suggested by Geert.

Changes from v1:
* Improved DT bindings documentation
* SPI and GPIO patches removed from this series (and being processed
  directly through the relevant subsystems directly)
* Improved device trees
* Various cleanup and improvments of the drivers

Damien Le Moal (16):
  clk: Add RISC-V Canaan Kendryte K210 clock driver
  dt-bindings: add Canaan boards compatible strings
  dt-bindings: update risc-v cpu properties
  dt-bindings: update sifive plic compatible string
  dt-bindings: update sifive clint compatible string
  dt-bindings: update sifive uart compatible string
  dt-bindings: fix sifive gpio properties
  dt-bindings: add resets property to dw-apb-timer
  riscv: Update Canaan Kendryte K210 device tree
  riscv: Add SiPeed MAIX BiT board device tree
  riscv: Add SiPeed MAIX DOCK board device tree
  riscv: Add SiPeed MAIX GO board device tree
  riscv: Add SiPeed MAIXDUINO board device tree
  riscv: Add Kendryte KD233 board device tree
  riscv: Update Canaan Kendryte K210 defconfig
  riscv: Add Canaan Kendryte K210 SD card defconfig

 .../devicetree/bindings/gpio/sifive,gpio.yaml |   21 +-
 .../sifive,plic-1.0.0.yaml                    |   20 +-
 .../devicetree/bindings/riscv/canaan.yaml     |   47 +
 .../devicetree/bindings/riscv/cpus.yaml       |    2 +
 .../bindings/serial/sifive-serial.yaml        |    1 +
 .../bindings/timer/sifive,clint.yaml          |   19 +-
 .../bindings/timer/snps,dw-apb-timer.yaml     |    3 +
 MAINTAINERS                                   |    1 +
 arch/riscv/Kconfig.socs                       |    2 +-
 arch/riscv/boot/dts/canaan/canaan_kd233.dts   |  177 +++
 arch/riscv/boot/dts/canaan/k210.dts           |   23 -
 arch/riscv/boot/dts/canaan/k210.dtsi          |  535 ++++++++-
 arch/riscv/boot/dts/canaan/k210_generic.dts   |   46 +
 .../riscv/boot/dts/canaan/sipeed_maix_bit.dts |  234 ++++
 .../boot/dts/canaan/sipeed_maix_dock.dts      |  236 ++++
 arch/riscv/boot/dts/canaan/sipeed_maix_go.dts |  244 ++++
 .../boot/dts/canaan/sipeed_maixduino.dts      |  209 ++++
 arch/riscv/configs/nommu_k210_defconfig       |   44 +-
 .../riscv/configs/nommu_k210_sdcard_defconfig |   92 ++
 drivers/clk/Kconfig                           |    8 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-k210.c                        | 1012 +++++++++++++++++
 drivers/soc/canaan/Kconfig                    |   18 +-
 drivers/soc/canaan/Makefile                   |    2 +-
 drivers/soc/canaan/k210-sysctl.c              |  205 +---
 include/dt-bindings/clock/k210-clk.h          |    1 -
 include/soc/canaan/k210-sysctl.h              |    2 +
 27 files changed, 2950 insertions(+), 255 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/riscv/canaan.yaml
 create mode 100644 arch/riscv/boot/dts/canaan/canaan_kd233.dts
 delete mode 100644 arch/riscv/boot/dts/canaan/k210.dts
 create mode 100644 arch/riscv/boot/dts/canaan/k210_generic.dts
 create mode 100644 arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
 create mode 100644 arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
 create mode 100644 arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
 create mode 100644 arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
 create mode 100644 arch/riscv/configs/nommu_k210_sdcard_defconfig
 create mode 100644 drivers/clk/clk-k210.c

-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
