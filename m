Return-Path: <SRS0=XTRi=GV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13955C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 02:03:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6AE3224DF
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 02:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6AE3224DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vrHHsDX7PhKt5nq/pJtjCYr4w158iwXvnR9NvJdcXC4=; b=Vkx9xmRYigH62ort8MAa9eNWAO
	9O95ltMaBmOWFAnikKaaKLGXfe6Re9LBSseWMMGHa+MrOn0N6xH+hqvriI7o4iTJ8Zs6LCwubF83R
	H+KOR6G7o+3PFE+PJgkUOC/VSpZmoLPnwPZlHylErPOHccScMxu87xxowvcoWod+mZ6GcFlx0CUhd
	/tA2In0OQlVbJ6/mTcBexjV9VO9eIa6wOUidR7tjk3OwH4rwN3kCBSfVH8cqhVR1t2uwZwhH8Gdmk
	DUimw/0rWYVe/2sHZfC/vhonFJfDDYL92jQa7T3ycMbIFFC4h+nv1aMkrE87i3QJ2IlpkNlXCZUHf
	X9jmYqZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1Jsa-0003Wm-Kp; Mon, 18 Jan 2021 02:02:52 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1JsX-0003WP-Mw
 for linux-riscv@lists.infradead.org; Mon, 18 Jan 2021 02:02:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610935369; x=1642471369;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EZLeUkBEdSYf00dqrBEGq7u8u3IhKA59c6hxLrTcgbg=;
 b=V0F/gkVh98wsTZ9icaI7h9aTdNt5JyAgZNsas9+6z0qaIrGDDqTNxhvZ
 tTd4U3T+u7T1BRIQCUwwD1FktQXixQVYDJmuh2hDObII6bp/9+h22h81H
 wwRyqiJkJco2cbE0g43vsM+nfiCjA7dNsQ/+8vB3g4GhLtOkbTY9FS9ak
 rFFvgXNcFwzmhxaXsPng7Rt9wfKCWld9YH1SWiU6wZq5vGlAAp3qrC3zC
 0seuveM2qrV41AvW+Hbee23HtbSg785CBUC3qcyNIrA47bUsE3CPKhWtA
 CQ4026MvfZFKHaHQ4tKUrUE63A4oLgWOr7c/gpeR0BbsI3ockLWqVJyxW g==;
IronPort-SDR: hL61HJ1daRTjU+oUD0T6ElCoib5j8bee3ngQp4e7lZUKwmC4No5StaEhGKQlLVZHZmebhXDsa3
 rXNOQLDkUL6RV2Kk+k+DDWGRxBuXxiDj/DjyuCc540XPVED0rMS8pXWBVClxrZjDXcRz/aLerh
 5+zGdozp1jaA//8ip+EGhcLU4r4xISc1pLMUPQssA7/H7TRVGxZIo8CtmXDC/rVKn7eULScxN2
 woREDLCFLdCAyNbrzCrZB2MySXfjjoVrLh24pLtA5a2LsLo19b5vTm2LosEkiqlgNAYG8pfHpm
 GWg=
X-IronPort-AV: E=Sophos;i="5.79,355,1602518400"; d="scan'208";a="157665881"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jan 2021 10:02:46 +0800
IronPort-SDR: 1ipcqvw0UUFFj+2XTD8pe5BGRHZ86JPfnTnONh2fwK3m0CGo/pUKutfYku7JCLxxP2V8wE63ZR
 a+xK8CN7PFVlVzbOzWH+tH3Iqx6CArApjOewh3uMt/oCX9F8qNnedXLBLqCy7qzrAlxcnvjIbf
 ROUQZTKYbrXBAyHW8lTN1+7L9vL+6i98pPGx29GfqYnhJ0yP9njNzPm7RXPxYVs0AEv9PVtwg1
 xKYh5/NG/P8TUbgLZ/zJeNhx5qpL4Yw+jWep4QSz9wNHiMM7FnPoUbkF02/MFCLTpOenEqa0ng
 g/k3nHl74dON5qDrbdt2rCIL
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2021 17:47:25 -0800
IronPort-SDR: JzjiqaLtA539a4xLp3ArTSCBNJj24HZYLupQUalSjNhXzd7zlpR7YAeP32AVizKi8sMxFZqq/W
 XdBRSKTMj7bohgraj2mKY4TP8BFX90Ge3Qfh4+oDebCi0AWZwvvIstMYiW+9bZq7DH/T7/+sfW
 ZFX68fDt7fD+dOMKFPoTHmmdHl4T7QGZraYuTkiNaLrd6RAZDn5cUk92PA++R6egYdiAPR+qYH
 Oj8IGYTN8///xh9msTXRoOeya1BQVdLsanTIyzlHrPSdj4OdYnoQ9NY2eFMYb4juEn15/jCjgF
 8Us=
WDCIronportException: Internal
Received: from cnf011319.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.70.208])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Jan 2021 18:02:46 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v13 00/17] RISC-V Kendryte K210 support improvements
Date: Mon, 18 Jan 2021 11:02:27 +0900
Message-Id: <20210118020244.103451-1-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210117_210249_942134_F48853B4 
X-CRM114-Status: GOOD (  23.15  )
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
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series of patches improves support for boards based on the Canaan
Kendryte K210 RISC-V dual core SoC. Minimal support for this SoC is
already included in the kernel. These patches complete it, enabling
support for most peripherals present on the SoC as well as introducing
device trees for the various K210 boards available on the market today
from SiPeed and Kendryte.

The patches here are the remaining patches not yet applied. Patch 1
adds the SoC clock driver and patch 2 adds the pinctrl driver.

Patches 3 to 9 add and update device tree bindings documentation to
document the K210 device tree files. In particular, patch 3 and 4
define compatible strings used for the SoC CPU and for the K210 based
boards supported.

Patches 10 to 15 update the existing K210 base device tree and add new
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
https://github.com/damien-lemoal/linux, k210-sysctl-v26 branch.
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

Damien Le Moal (17):
  clk: Add RISC-V Canaan Kendryte K210 clock driver
  pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver
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
 MAINTAINERS                                   |    8 +
 arch/riscv/Kconfig.socs                       |    3 +-
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
 drivers/pinctrl/Kconfig                       |   13 +
 drivers/pinctrl/Makefile                      |    1 +
 drivers/pinctrl/pinctrl-k210.c                |  985 ++++++++++++++++
 drivers/soc/canaan/Kconfig                    |   18 +-
 drivers/soc/canaan/Makefile                   |    2 +-
 drivers/soc/canaan/k210-sysctl.c              |  205 +---
 include/dt-bindings/clock/k210-clk.h          |    1 -
 include/soc/canaan/k210-sysctl.h              |    2 +
 30 files changed, 3957 insertions(+), 255 deletions(-)
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
 create mode 100644 drivers/pinctrl/pinctrl-k210.c

-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
