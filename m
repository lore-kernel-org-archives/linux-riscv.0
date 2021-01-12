Return-Path: <SRS0=7m3b=GP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC2FDC433E6
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Jan 2021 00:59:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EBD122D6D
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Jan 2021 00:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EBD122D6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xRJdiRzjvzeBzPzPw+PXzkZuzygAnLgdsgTJZWe3YFE=; b=IWi3Lf17NErcm7D/hO96It8sSg
	x4s+nklkLOC8Ta7UiTcR1cpSKLFM4mZ8RR71Yl972hNf2ft5GSDnTHtB2f3qi75J9EUSlMIgz2FNY
	vxvbowWv8w2us6oaRDIT6JSXI+CErW9sy2aKVX8B0X3iwvg1Z1eGZVjSx+g9XJxRLl9lNWXd1cay8
	qiCAe9w2tdEdoG056hCgqr1KBs6wYNO9LFVbte99/lRra2l7XScCH/kwS13kuugID+de4a1Kie048
	rDCQC5VHMOYq7h7eCRAu4IzPMRhkhiWrXk+pwOLxXtv1lKPIUocX5UORGTNqeAG/Lmt2hCswx5QZi
	e1Zv0pLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz81W-0006ps-Vw; Tue, 12 Jan 2021 00:59:03 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz81Q-0006lg-OC
 for linux-riscv@lists.infradead.org; Tue, 12 Jan 2021 00:59:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610413136; x=1641949136;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fvmrYIz3cf1HMR+CXjsx9odOfBo/yD708YJff4RlUQc=;
 b=lvQqQnfrHn+99LEvb++O+SIZyvh/yoPsHqIS3IEbc48b2Wy5GR+dl+nh
 x9Xyhj3MO7T9ZIX4EYeQq7bsjdx/4Wy195S1Ww/GMDXMn6FwUYj1Iq3Pi
 vErWdfiBme9X5S/SuzGadJ7h8vM5n/35KLq/CSKrUFxwiE5wzpFvA3Al2
 4LKvpHCVStuubwks8qzhACzSkoV69Y3vfdfpptfZs3eAWqg0H4SyuBM6Y
 jXWayturAgpfK8uuhnovaM5HCdySBUo7y4SSxz/LfS3dv45MBaqXoiKgL
 ct5VqYjSFoLSbOG13t+4+vwlA4iLJsig7rv9yH52XXcAfeO0pltV4oRhb A==;
IronPort-SDR: b/7pX+x9MTYbPONjIWleSCrFesCrH4LwhRb54nVLoymm6m/yxppIiDk+vnj7zQS+iLrYf9wSyd
 LnFgAZUQmQzxCNVvrg2BGFI2ONi5sHEb4jgrTi16PQtEiwtWyV5LA+YafKNYKMw8xeXa+N/F9x
 G3R7EDw+hYwgpRJpzyE92KJDKRYjxwx3/C97fZ3LVhRBuJYIgvxg/zBIipVQW8cGhap7JLg6td
 H/F13w4uI+1p5h8R4+M7P/SeIU2tRy0Rex0LTn2TZGqtqQyCN7yU9DebjzQ7Z2KsAfqjoNV5kb
 rnE=
X-IronPort-AV: E=Sophos;i="5.79,340,1602518400"; d="scan'208";a="267489388"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 12 Jan 2021 08:58:50 +0800
IronPort-SDR: 5V6TddgSFzSj2N6SiDmlwnfrfRj1gCJCk5Re3aw+fIvtugtkTgNpq5y+AFHm9K7aUuepuidVmM
 GPDOTTQeEJr6JBNuVlzMWO7wf6Cu3mrBAuOaQI05q++dIYfkqWQk9Av0zuH50PRXNGQkYLbjUR
 LUdTV1jv60t73FLKYGiML8uk/uIx2FfbCiFgOy9P7yBDdMmDylYdRgV9wnaLX9ynH0Z1g/OuZa
 r04r5+u1CYWSjzWmHlkfxUfJLuukc4MIJP8r/9MeRJiamp+sXjGXP1cMxTH/YfeBwDct79yw5O
 52f1Sxu/mblLRU5U7TCMSazQ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 16:41:44 -0800
IronPort-SDR: vccg7pKh2p0s2BWFXtCuniL8ii/Jw7lzp2Fa6dOReNg0K1V/Dv1xv9ULU2Km01lXm6931EoB0J
 ZZyqEnxf60Lp40WwQCQxRq6aLejtGcJxgfycDig3Sx1wLLiVEjxoeiDh/74RmbrgFh2niHLTC9
 ncQA1Y+hkLHhkOzsTPjdWFFRtSTAHoeyvdP4sDgRBPN7CDFzBc9kK4JFSMpGO6vcZJKXHTqIo/
 bsLPR8MBg222brAQiiUzURv9fVx3AgX0c7iqOgPL2ZrDiUxPCL1JzSx1rmQ3ZvLigh5xIDnHgN
 Xjs=
WDCIronportException: Internal
Received: from cnf008148.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.70.175])
 by uls-op-cesaip02.wdc.com with ESMTP; 11 Jan 2021 16:58:50 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v11 00/10] RISC-V Kendryte K210 support improvements
Date: Tue, 12 Jan 2021 09:58:38 +0900
Message-Id: <20210112005848.199951-1-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_195857_770788_D8305187 
X-CRM114-Status: GOOD (  23.59  )
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

The patches here are the remaining patches of the series not applied
yet. Patch 1 adds the SoC clock driver and patch 2 adds the pinctrl
driver.

Patches 3 to 8 update the existing K210 device tree and add new
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
https://github.com/damien-lemoal/linux, k210-sysctl-v24 branch.
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

Damien Le Moal (10):
  clk: Add RISC-V Canaan Kendryte K210 clock driver
  pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver
  riscv: Update Canaan Kendryte K210 device tree
  riscv: Add SiPeed MAIX BiT board device tree
  riscv: Add SiPeed MAIX DOCK board device tree
  riscv: Add SiPeed MAIX GO board device tree
  riscv: Add SiPeed MAIXDUINO board device tree
  riscv: Add Kendryte KD233 board device tree
  riscv: Update Canaan Kendryte K210 defconfig
  riscv: Add Canaan Kendryte K210 SD card defconfig

 MAINTAINERS                                   |    8 +
 arch/riscv/Kconfig.socs                       |    3 +-
 arch/riscv/boot/dts/canaan/canaan_kd233.dts   |  178 +++
 arch/riscv/boot/dts/canaan/k210.dts           |   23 -
 arch/riscv/boot/dts/canaan/k210.dtsi          |  551 ++++++++-
 arch/riscv/boot/dts/canaan/k210_generic.dts   |   46 +
 .../riscv/boot/dts/canaan/sipeed_maix_bit.dts |  227 ++++
 .../boot/dts/canaan/sipeed_maix_dock.dts      |  229 ++++
 arch/riscv/boot/dts/canaan/sipeed_maix_go.dts |  237 ++++
 .../boot/dts/canaan/sipeed_maixduino.dts      |  201 ++++
 arch/riscv/configs/nommu_k210_defconfig       |   44 +-
 .../riscv/configs/nommu_k210_sdcard_defconfig |   92 ++
 drivers/clk/Kconfig                           |    8 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-k210.c                        | 1005 +++++++++++++++++
 drivers/pinctrl/Kconfig                       |   13 +
 drivers/pinctrl/Makefile                      |    1 +
 drivers/pinctrl/pinctrl-k210.c                |  985 ++++++++++++++++
 drivers/soc/canaan/Kconfig                    |   18 +-
 drivers/soc/canaan/Makefile                   |    2 +-
 drivers/soc/canaan/k210-sysctl.c              |  205 +---
 include/dt-bindings/clock/k210-clk.h          |    1 -
 include/soc/canaan/k210-sysctl.h              |    2 +
 23 files changed, 3844 insertions(+), 236 deletions(-)
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

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
