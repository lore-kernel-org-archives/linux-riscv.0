Return-Path: <SRS0=UwrA=GS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98895C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 14:04:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CA1E23884
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 14:04:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CA1E23884
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UuqLpbxQlZGbP4Owf5Honh8DHhMfSoc4nW69kJueMDg=; b=URdvke7BeR51vU6Gfsa7whAq8O
	yr7jIZzGFNomACm0tTq1OkkBr+HhGm5y1zNQzwBZEa1UZtghsAhDJHRYlh3hM4WOzPQ8IGM2NA8GV
	7FEgSzRlk4uoBCz58d2KwzqyjYrcvD+q4dMxafiuKXTF+/U+5l9faCJm+/3iFuYZDWvunRaOGUt70
	eXJcFhl5XkdYR5wdBUTc+tyKQPvYoQ186f5hyUwDV3iJ1Sz/hTS2GQLMBJXPlv7dPqrm9NVaGLszL
	c+cKzfpwVa0QwrB+Z9PrAHYDMfR492Jo6BhGFocY8mTaxqZkMNyohmEejk5olv9xATpTcOHh7evfE
	6nSTJulQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0Pht-0002ec-WE; Fri, 15 Jan 2021 14:04:06 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0Phq-0002dS-Ja
 for linux-riscv@lists.infradead.org; Fri, 15 Jan 2021 14:04:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610719442; x=1642255442;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TH8iSrL7xCkxmp5PN1zDvynqza+7czBw4Ewm2iWzaaU=;
 b=JhPA3RROIJsWJYyRrQNkv42BSKcgZjbwXRo4wjpb/2G14eT3c03mR6f1
 YBooS+ZmA+L+NRdlhyn/dv3hwHgtG35khCUb1KKEdmO3PaJ0qK2k09y1d
 reYYJiptoNpIziHeTv66ndGmyAWhF1v2OEtKBLiIKDcSPa4uCXueknwf7
 EmnsZ6AqCtCKVdHDNkltoyJ0xELj0nwOSUzYg3RIH1JuGF/b2cDYq6t9j
 Dt4z70qGVUstZKHRiHKzlXJUIHd9J5nn/k8rwGCJQcwcWhb28nM4xWkQp
 xpypfUWFH6qUBCnj2YOONHLHPWArVi1qdYQ8lIGuT5fCBLSz7D6CQIG4U Q==;
IronPort-SDR: ruLFRi34feGzNsxKlwIDC46HeNC44KvwYfj4FVIowMu4OffxpPnwLcocih6B+0QV0i9lp4IOI6
 PeQxUC6Z3+FaaNwwL+Ol1Lpwujj9E4Uz7aaNI4bEuxaEdjcyMacubpTf0kTcxoHmJSwD98dfDJ
 wsDY6A++lFJ1nQQfEaushw9IuFlGNBFWn7bgV5ot0arMTNiS8daGZ+DeIGjDBVfwW38B5vASWr
 3eKBt8uMi5i/LI0MV5CvmzW6VJUdBvNO/0vfMtNRF+bMV7BM0FDPXBP5km8sVb2MS4xfhl2rGi
 2Rs=
X-IronPort-AV: E=Sophos;i="5.79,349,1602518400"; d="scan'208";a="267835163"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Jan 2021 22:03:56 +0800
IronPort-SDR: BGTH0lSkLNmETGOWzENGnBUbYhLV/hd2yR4xLoascjgNV2I28nXETxf2Ls1TTVoY84JHBKG7mB
 kdLonDChd1zAQdQOFi5BBfaYviwy9VAJW42GEw9StL6gNvybuREYPV34oPRJd1w+LOxvnN4k4q
 2SsHMLo1A5YW/v0itRyAkdbDGXi9vgr8PWyaG4wk2ZahUI2sBQJHom45IE8W7gj21P3NmsxTUQ
 kCjXbmXw55bY3yFJSmRUGnBAhTEFHmyeOS7BmmANpc/BQlAZZvDyXpDJAroyRsQkYyJLeBsupj
 y9JX1aoZocRtNOBdNS80oFP7
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2021 05:48:38 -0800
IronPort-SDR: wYEii0/cQ1LbbbR5XKUeMcxdGzki3ac/kD3f7+1QJObekv/6rupRqxT8hOCGC9/N+n8wPlQ8NO
 7WGBIlmlOo9mZ5a6MI3o968yAmT5FgBN6ljgn1ubow0gus+dMqVAQRrGfP7cVPtq1CnI1FATkx
 Vugzct6soXH2BLgYY8FwhfpK9U+gZ62ImeOfy5DeWcWxgTZZIYaeCkDBuNYAprt+0BmL6g46Ig
 asCCtc0p8aGY/LH00EPu/Z3j9asdmWDgCQxLy7b1yNsQZeaUU2pPvtiELFB0S0vZwuqck7NGSe
 aDs=
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.70.177])
 by uls-op-cesaip02.wdc.com with ESMTP; 15 Jan 2021 06:03:56 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v12 00/17] RISC-V Kendryte K210 support improvements
Date: Fri, 15 Jan 2021 23:03:35 +0900
Message-Id: <20210115140352.146941-1-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_090403_220361_A2CD7D16 
X-CRM114-Status: GOOD (  23.98  )
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
document the K210 device tree files. In particular, patch 4 defines the
compatible strings used for the SoC and for the K210 based boards
supported.

Patches 10 to 15 update the existing K210 device tree and add new
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
https://github.com/damien-lemoal/linux, k210-sysctl-v25 branch.
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
  dt-bindings: fix sifive plic compatible string
  dt-bindings: add Canaan boards compatible strings
  dt-bindings: fix sifive gpio properties
  dt-bindings: add resets property to dw-apb-timer
  dt-bindings: update risc-v cpu properties
  dt-bindings: fix sifive clint compatible string
  dt-bindings: update sifive serial
  riscv: Update Canaan Kendryte K210 device tree
  riscv: Add SiPeed MAIX BiT board device tree
  riscv: Add SiPeed MAIX DOCK board device tree
  riscv: Add SiPeed MAIX GO board device tree
  riscv: Add SiPeed MAIXDUINO board device tree
  riscv: Add Kendryte KD233 board device tree
  riscv: Update Canaan Kendryte K210 defconfig
  riscv: Add Canaan Kendryte K210 SD card defconfig

 .../devicetree/bindings/gpio/sifive,gpio.yaml |   21 +-
 .../sifive,plic-1.0.0.yaml                    |   10 +-
 .../devicetree/bindings/riscv/canaan.yaml     |   47 +
 .../devicetree/bindings/riscv/cpus.yaml       |    2 +
 .../bindings/serial/sifive-serial.yaml        |    1 +
 .../bindings/timer/sifive,clint.yaml          |    9 +-
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
 30 files changed, 3943 insertions(+), 249 deletions(-)
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
