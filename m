Return-Path: <SRS0=J7tQ=FR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C188C433FE
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 08:10:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C81A722D73
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 08:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C81A722D73
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o3ShCvP6CLfjQu9GxUT86c5mE+IOlkuWA5DmN9EIGyY=; b=EJvJ6AnCBXabVcyhs/0zigq8O4
	GkT8MaKQk+ektceYelL1t2FcePsyFsfyYMXtGW+9OZ1xaoGpn4T20ejRtv7O9ZUmHoB6dM5y6ecuL
	pUhfJtwzmPXWgfVbc6w8nXhhV9xyjtXxEbZXIs8K+z8utL+VqGbUdpcb6IeZ4ECPbCud1lfT0pfu9
	nRcSfScfRcGyEV0ieFHL2El3WrZUxnS79G/Cle765zHgn+IpgGIKL/ohzdu51IPo4BF9iwu1NitVG
	9lJbG1YxhAQq+V/sMOXTvwxIoZeaeVK6P8OGf7mGZZfWtzxhcr4KYDWIKfbyt5qHtRciLb2xIoNoO
	CSXAxk0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koMSc-0002TV-Ey; Sun, 13 Dec 2020 08:10:30 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koMSV-0002SB-WA
 for linux-riscv@lists.infradead.org; Sun, 13 Dec 2020 08:10:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607847024; x=1639383024;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qiRcacnpa+150AgySXvcUio9nuaZb6yaeKKbGVVCALI=;
 b=JDIQkfdm6UpFbfjk2TbYye+PRyNikWqDBk7Mx0uJJnhUXCZkZ3abPcMw
 hsgMkE2fbHYgEeu77W4fdMqxxmmNp+61JyH2Wm05ZUC2qRMLlsclSz4g0
 30wczYm7pL2Qwjr02HY6lQh1CzeYW9r5eqqKmtPPYYmqhlFk1O6QHLzQN
 dUxV2kiiIojdqyEAgkxbAoLGjiPKZOwx0Dv1WzoJUoyXxuVxFTlyCmu08
 sYxzXTM/6Au/LRNHZ5c3OwjSORnfwsqBaAP2rueOkb18LWFk2Qrk1t9Oq
 ukJA9q/TGlXPl4660wvDeOLKI/kC1jKkfKUiXevfh7kdtzmbx4qS/JK9u g==;
IronPort-SDR: Z1ZYdwJdTnQyjx5e0Bbg6gd5RLxda7XPys5o1AptVK81TOA0DBdA3FOk9aJBCyu9ZOV0jHcRUT
 +LyHIn7wAAaktVzVr/xsKqLvmsrDMLucr8uJQODVV41wGjw+WfEnusH1THkct0Gjq+lEA7LGyd
 22ehP+gPk4eAAj5c56E5TFCgP9Op1o3TDuUxpGEUoQNT56Q7+gYIHgbyIBACauTf46DHkB3uUG
 u4eHrOSpdK79/3Z6y6jtEct3aVQS/EfX1I7OrvX0rhvAV3pt+oYdoZkFKYPIL2RdiUlLZ2BfCd
 l6Q=
X-IronPort-AV: E=Sophos;i="5.78,415,1599494400"; d="scan'208";a="156235140"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 16:10:21 +0800
IronPort-SDR: 96G4rGjn8PvkPxCGThtw3wUmzem7PxnDAErMsxGYZ7R3kbRmAdHYbhoxGHrqay2aECL4+vt+6D
 LrJc+dQ2v9P2ERz5BCuUzyJlrTAjwW7eoIu+5jwNFrFFfOFshL+wJNBvXryj4laonEVSb0KX20
 mL4+v0wF3TLlrFvhvWnNJ/TYGScMydknLeJztVPDrZGhCtU1o2afUUMwW1uumMKIOFPlLIm2sD
 6eziCgVDVwu2h910NB8jo0oDNDgCi+ux+O+MY5+kdMlMNp04Jq6c4uA6TjYSJZ3Wjf+v1qBVG2
 kSX8mDEOg+/HCpZ9tnim1i0q
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2020 23:54:09 -0800
IronPort-SDR: y9l/D4sF37V4K2myg9ywcyBogcVVeeRGGuf9Reuf5uqsDzNc5mh0FoXSDfpsh5sN+rZ1oJR4RN
 oW2oPbgkWmMlYOdgBYRmT0Y5zD4p4aBgm4Ka+yqmp65AgDij+we/BQPm947jCh3CawdytKs60O
 n2ECX5xKjjb8kz2ds3VHzGv78XuuZRrh/MMRI89slWRb6u+PuN6/siye85lPNMbmnJe/19yHg6
 5LMqyallbX6XeTOrNMI711FKjqu+K6zu5Rqxv0nOnDTGPYHcWNGaHilbdLEptw814ywhO7EAzy
 5ZE=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.197])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Dec 2020 00:10:20 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v9 00/22] RISC-V Kendryte K210 support improvements
Date: Sun, 13 Dec 2020 17:09:54 +0900
Message-Id: <20201213081016.179192-1-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201213_031024_190722_38550942 
X-CRM114-Status: GOOD (  27.00  )
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

Pathes 1 to 4 are various fixes for riscv arch code and riscv
dependent devices. Of note here is patch 3 which fix system calls
execution in the no MMU case, and patch 4 which simplifies DTB builtin
handling.

Patch 5 fixes naming of directories and configuration options to use the
K210 SoC vendor name (Canaan) instead of its branding name (Kendryte).

Patch 6 is a preparatory patch cleaning up the K210 system controller
driver to facilitate introducing the SoC clock driver.

The following patches 7 to 11 document device tree bindings for the SoC
drivers. The implementation of these drivers is provided in patches 12,
13 and 14, respectively implementing the SoC clock driver, reset
controller and SOC pin function control.

Patches 15 to 20 update the existing K210 device tree and add new
device tree files for several K210 based boards: MAIX Bit, MAIXDUINO,
MAIX Dock and MAIX Go boards from SiPeed and the KD233 development
board from Canaan.

Finally the last two patches updates the k210 nommu defconfig to include
the newly implemented drivers and provide a new default configuration
file enabling SD card support.

A lot of the work on the device tree and on the K210 drivers come from
the work by Sean Anderson for the U-Boot project support of the K210
SoC. Sean also helped with debugging many aspects of this series.

A tree with all patches applied is available here:
https://github.com/damien-lemoal/linux, k210-sysctl-v21 branch.
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

Damien Le Moal (22):
  riscv: Fix kernel time_init()
  riscv: Fix sifive serial driver
  riscv: Enable interrupts during syscalls with M-Mode
  riscv: Fix builtin DTB handling
  riscv: Use vendor name for K210 SoC support
  riscv: cleanup Canaan Kendryte K210 sysctl driver
  dt-bindings: Add Canaan vendor prefix
  dt-binding: clock: Document canaan,k210-clk bindings
  dt-bindings: reset: Document canaan,k210-rst bindings
  dt-bindings: pinctrl: Document canaan,k210-fpioa bindings
  dt-binding: mfd: Document canaan,k210-sysctl bindings
  riscv: Add Canaan Kendryte K210 clock driver
  riscv: Add Canaan Kendryte K210 reset controller
  riscv: Add Canaan Kendryte K210 FPIOA driver
  riscv: Update Canaan Kendryte K210 device tree
  riscv: Add SiPeed MAIX BiT board device tree
  riscv: Add SiPeed MAIX DOCK board device tree
  riscv: Add SiPeed MAIX GO board device tree
  riscv: Add SiPeed MAIXDUINO board device tree
  riscv: Add Kendryte KD233 board device tree
  riscv: Update Canaan Kendryte K210 defconfig
  riscv: Add Canaan Kendryte K210 SD card defconfig

 .../bindings/clock/canaan,k210-clk.yaml       |   54 +
 .../bindings/mfd/canaan,k210-sysctl.yaml      |  109 ++
 .../bindings/pinctrl/canaan,k210-fpioa.yaml   |  171 +++
 .../bindings/reset/canaan,k210-rst.yaml       |   40 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 MAINTAINERS                                   |   23 +
 arch/riscv/Kconfig.socs                       |   33 +-
 arch/riscv/Makefile                           |    2 +-
 arch/riscv/boot/dts/Makefile                  |    2 +-
 arch/riscv/boot/dts/canaan/Makefile           |    5 +
 arch/riscv/boot/dts/canaan/k210.dtsi          |  621 ++++++++++
 arch/riscv/boot/dts/canaan/k210_generic.dts   |   46 +
 arch/riscv/boot/dts/canaan/k210_kd233.dts     |  178 +++
 arch/riscv/boot/dts/canaan/k210_maix_bit.dts  |  227 ++++
 arch/riscv/boot/dts/canaan/k210_maix_dock.dts |  229 ++++
 arch/riscv/boot/dts/canaan/k210_maix_go.dts   |  237 ++++
 arch/riscv/boot/dts/canaan/k210_maixduino.dts |  201 ++++
 arch/riscv/boot/dts/kendryte/Makefile         |    4 -
 arch/riscv/boot/dts/kendryte/k210.dts         |   23 -
 arch/riscv/boot/dts/kendryte/k210.dtsi        |  125 --
 arch/riscv/configs/nommu_k210_defconfig       |   39 +-
 .../riscv/configs/nommu_k210_sdcard_defconfig |   93 ++
 arch/riscv/include/asm/soc.h                  |   38 -
 arch/riscv/kernel/entry.S                     |    9 +
 arch/riscv/kernel/soc.c                       |   27 -
 arch/riscv/kernel/time.c                      |    3 +
 arch/riscv/mm/init.c                          |    6 +-
 drivers/clk/Kconfig                           |    8 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-k210.c                        | 1005 +++++++++++++++++
 drivers/pinctrl/Kconfig                       |   13 +
 drivers/pinctrl/Makefile                      |    1 +
 drivers/pinctrl/pinctrl-k210.c                |  985 ++++++++++++++++
 drivers/reset/Kconfig                         |   10 +
 drivers/reset/Makefile                        |    1 +
 drivers/reset/reset-k210.c                    |  131 +++
 drivers/soc/Kconfig                           |    2 +-
 drivers/soc/Makefile                          |    2 +-
 drivers/soc/canaan/Kconfig                    |   12 +
 drivers/soc/canaan/Makefile                   |    3 +
 drivers/soc/canaan/k210-sysctl.c              |   78 ++
 drivers/soc/kendryte/Kconfig                  |   14 -
 drivers/soc/kendryte/Makefile                 |    3 -
 drivers/soc/kendryte/k210-sysctl.c            |  260 -----
 drivers/tty/serial/sifive.c                   |    1 +
 include/dt-bindings/clock/k210-clk.h          |   55 +-
 include/dt-bindings/pinctrl/k210-fpioa.h      |  276 +++++
 include/dt-bindings/reset/k210-rst.h          |   42 +
 include/soc/canaan/k210-sysctl.h              |   43 +
 49 files changed, 4962 insertions(+), 531 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml
 create mode 100644 Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml
 create mode 100644 arch/riscv/boot/dts/canaan/Makefile
 create mode 100644 arch/riscv/boot/dts/canaan/k210.dtsi
 create mode 100644 arch/riscv/boot/dts/canaan/k210_generic.dts
 create mode 100644 arch/riscv/boot/dts/canaan/k210_kd233.dts
 create mode 100644 arch/riscv/boot/dts/canaan/k210_maix_bit.dts
 create mode 100644 arch/riscv/boot/dts/canaan/k210_maix_dock.dts
 create mode 100644 arch/riscv/boot/dts/canaan/k210_maix_go.dts
 create mode 100644 arch/riscv/boot/dts/canaan/k210_maixduino.dts
 delete mode 100644 arch/riscv/boot/dts/kendryte/Makefile
 delete mode 100644 arch/riscv/boot/dts/kendryte/k210.dts
 delete mode 100644 arch/riscv/boot/dts/kendryte/k210.dtsi
 create mode 100644 arch/riscv/configs/nommu_k210_sdcard_defconfig
 create mode 100644 drivers/clk/clk-k210.c
 create mode 100644 drivers/pinctrl/pinctrl-k210.c
 create mode 100644 drivers/reset/reset-k210.c
 create mode 100644 drivers/soc/canaan/Kconfig
 create mode 100644 drivers/soc/canaan/Makefile
 create mode 100644 drivers/soc/canaan/k210-sysctl.c
 delete mode 100644 drivers/soc/kendryte/Kconfig
 delete mode 100644 drivers/soc/kendryte/Makefile
 delete mode 100644 drivers/soc/kendryte/k210-sysctl.c
 create mode 100644 include/dt-bindings/pinctrl/k210-fpioa.h
 create mode 100644 include/dt-bindings/reset/k210-rst.h
 create mode 100644 include/soc/canaan/k210-sysctl.h

-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
