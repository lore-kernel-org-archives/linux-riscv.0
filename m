Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F11DC5517A
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:14:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC64C20704
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:14:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NA7UF5xS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="nLtn3N3V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC64C20704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mmeuDsO5xq69XG0ZriRLSDjO5Va/yZJ43XmD1ZGEiYI=; b=NA7UF5xS56YfW8bgUiUItS4Fkd
	PKW/s1HVqc80wF3/KgdJzj2dUh1eUS75MuuycJHmJ85V7RiqXzvUgllK2jOQF+t3CRN50vyTspSLQ
	tvp6b1RLBLypWAR/1FA082nqWsZu2vu4LVNmp2IW9hqTEVRXfNICJlCgvTSbDsc8EZFDZpCKOR2rV
	367PftTF8IScbs4sx2xKsU3QCZ+EJOnBibtTqw5GA2NxP92SCP8j/v1cWBh7fG6/YdnaG97rezo4Z
	C3jYgZNo7zjYPCGLAX4hcTWSX+/XClYLO6kOaWtbgoooTgfIjQG+d8FJRMmR/PJjrMgQ6jWTUWgtL
	OjruebiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbJMk-0000Ps-PE; Sat, 07 Nov 2020 08:14:30 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJMh-0000OU-BJ
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 08:14:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604736867; x=1636272867;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CIehosSpng4DyAquHyB4Y6WpSVlIJ5/AjtGn+kccXDI=;
 b=nLtn3N3VQjzw1/aZosSimBOSFo87PnnpsZ6WFXwRmiyzLHLfihlCH6X6
 BcAS07w25mt3/3lcZ+mYYaYAIXcbvinm7TQlGFysUBtLfoJkf5NMwJXUk
 tUQk5kabrGdPh8IvoDVK0MUWOWgdLgi3vaco+LEpvp8WBIqOU6J9fgwKL
 cxjly3H+9MGQTHsDkIzkflv3NQhonRyOvNbGmfUdQClTOtjseO8Wnd+9d
 Pqg85mywAFYDQ3IbfPcm4fZ1eLAPV+zqoqhh3+OVeUvSlW6ZjASPeAPdp
 25iX8QU8gTVZoQinJe54gl+n16fdgo14QZdIT0rE2m5+4wl4KA7gSiaa5 Q==;
IronPort-SDR: 5T/63K3bem7IVag7zQnje6LmNhNwIMVrfhPN4VMqgLh221Y/H0Ug9K1P9efCvTeX4w7vGP3377
 idb+Y1iLA1HGPIF22XvIyH7745eqHukMd2oWnsrHyBMDhF8SrSfpn2uZ3fX9osLobFGNDJ065w
 qo0UyMiC0E1fAz5plmQQNn33lNi8BRql4vph5oyiHNvsYnznIGpyR38yw4BhDViZ0oOqcdgxqs
 rtLS+vlgqiP7zT9UUzOazCXl2fk8XZlE83sXbQNc1cPnVK+76NH+EfWPpp5H3g/x0rr/fIIyc0
 Ivo=
X-IronPort-AV: E=Sophos;i="5.77,459,1596470400"; d="scan'208";a="262079248"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2020 16:14:24 +0800
IronPort-SDR: Bb1KINzGf2CrpqXCRkPsPrr3tOjhdgVt3b3d/yRAZgj6/FyZgjC26WXHuExVtQlyBvDw3hFN4U
 WCg1m4M1dlF/GUGDv9b34rOIleg+rnmFnnRBYCqqXOovyFJu/ed6aQTmzUaKywHI2Lz7zU3r6T
 HPB9aaSFJzUxlfspGxTVR2ww9WILIdUOjVP6z6Vbp6XFHX6f1BqyDJ2mHnKUzqoayHMQ57SofG
 6NMZW2GcB4ulSH9rBnYtjvJ4MkQ09HMRfrIRM0iz92AV8Pw9FzbAFIehxARklVSwe197b67M+y
 iJyzWGJrOyH86/xi3Zv0rdG0
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2020 00:00:28 -0800
IronPort-SDR: IYBenekZp641K4uUSLnTntq/QmL9U+tad/k9+rebpUtmkzEqyYbiP1i0clI357NWAhWipnz/Ml
 PrK+FRsvwtgz0Wwj8knbVbVB9aL/n5DIVrOooypmIHS+KkWOUKHVhdyrAfhVUhRZm1Tn4u6b99
 M+ZkYsxfQ42BV9WAEl6ql4PmDJFCo6VVhkWim0cgC8V7BOhKHsCBi/JQAz0o/iLSnLz3J9jLk7
 lpPEZ+Jqv3chtdliwZYtLVj7luRvgnLTalyim8JrnDG8xelRQZwuE99CM+pLm/D3Wtir/F6jGc
 o1o=
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.85])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2020 00:14:22 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 00/32] RISC-V Kendryte K210 support improvments
Date: Sat,  7 Nov 2020 17:13:48 +0900
Message-Id: <20201107081420.60325-1-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_031427_540099_3F186C5B 
X-CRM114-Status: GOOD (  21.53  )
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

This series of patches improves support for boards based on the Kendryte
K210 RISC-V dual core SoC. Minimal support for this SoC is already
included in the kernel. These patches complete it, enabling support for
most peripherals present on the SoC, as well as introducing device trees
for the various boards available on the market today from SiPeed and
Kendryte.

The first patch of this series is a fix of the device tree parsing code.
Without this fix, a warning is generated when parsing Designware gpio
controller nodes.

The following 6 patches are fixes and improvements to the Designware SPI
driver to enable support for the MMC-spi slot found on all K210 boards.

Pathes 8 to 13 are various fixes for riscv arch code and riscv
dependent devices. Of not here is patch 11 which fix system call
execution in the no MMU case, and patch 13 which simplifies DTB builtin
handling.

The following patches 14 to 25 implement and document idevice tree
mapping of several drivers for the K210 SoC: clock driver, reset
controller and pin function management (pinctrl).

Patches 26 to 31 update the existing K210 device tree and device new
device tree files for several K210 based boards: the MAIX Bit,
MAIXSUINO, MAIX Dock and MAIX Go boards from SiPeed and the KD233
development board from Kendryte.

Finally the last patch updates the k210 nommu defconfig to include
the newly implemented drivers.

A lot of the work on the device tree and on the K210 drivers come from
the work of Sean Anderson for the U-Boot project support of the K210
SoC. Sean also helped with debugging the idriver for the DesignWare SPIi
controller of the SoC.

A tree with all patches applied is available here:
https://github.com/damien-lemoal/linux (use the latest k210-sysctl-vXX
branch). A demonstration of this series used on a SiPeed MAIX Dock
board together with an I2C servo controller can be seen here:
https://damien-lemoal.github.io/linux-robot-arm/#example

This tree was used to build userspace busybox environment image that is
then copied onto SD card with ext2:
https://github.com/damien-lemoal/buildroot
Of note is that running this userspace environment requires a revert of
commit 2217b982624680d19a80ebb4600d05c8586c4f96 introduced during the
5.9 development cycle. Without this revert, execution of the init
process fails. A problem with the riscv port of elf2flt is suspected but
not confirmed. I am now starting to investigate this problem.

Reviews and comments are as always much welcome.


Damien Le Moal (32):
  of: Fix property supplier parsing
  spi: dw: Add support for 32-bits ctrlr0 layout
  spi: dw: Fix driving MOSI low while recieving
  spi: dw: Introduce polling device tree property
  spi: dw: Introduce DW_SPI_CAP_POLL_NODELAY
  spi: dw: Add support for the Kendryte K210 SoC
  dt-bindings: Update DW SPI device tree bindings
  riscv: Fix kernel time_init()
  riscv: Fix SiFive gpio probe
  riscv: Fix sifive serial driver
  riscv: Enable interrupts during syscalls with M-Mode
  riscv: Automatically select sysctl config options
  riscv: Fix builtin DTB handling
  dt-bindings: Define all Kendryte K210 clock IDs
  dt-bindings: Define Kendryte K210 sysctl registers
  dt-bindings: Define Kendryte K210 pin functions
  dt-bindings: Define Kendryte K210 reset signals
  riscv: Add Kendryte K210 SoC clock driver
  riscv: Add Kendryte K210 SoC reset controller
  riscv: Add Kendryte K210 FPIOA pinctrl driver
  dt-bindings: Add Kendryte and Canaan vendor prefix
  dt-binding: Document kendryte,k210-sysctl bindings
  dt-binding: Document kendryte,k210-clk bindings
  dt-bindings: Document kendryte,k210-fpioa bindings
  dt-bindings: Document kendryte,k210-rst bindings
  riscv: Update Kendryte K210 device tree
  riscv: Add SiPeed MAIX BiT board device tree
  riscv: Add SiPeed MAIX DOCK board device tree
  riscv: Add SiPeed MAIX GO board device tree
  riscv: Add SiPeed MAIXDUINO board device tree
  riscv: Add Kendryte KD233 board device tree
  riscv: Update Kendryte K210 defconfig

 .../bindings/clock/kendryte,k210-clk.yaml     |  70 ++
 .../bindings/mfd/kendryte,k210-sysctl.yaml    |  65 ++
 .../bindings/pinctrl/kendryte,k210-fpioa.yaml | 106 ++
 .../bindings/reset/kendryte,k210-rst.yaml     |  78 ++
 .../bindings/spi/snps,dw-apb-ssi.yaml         |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   4 +
 arch/riscv/Kconfig.socs                       |  29 +-
 arch/riscv/boot/dts/kendryte/Makefile         |   5 +-
 arch/riscv/boot/dts/kendryte/k210.dts         |  23 -
 arch/riscv/boot/dts/kendryte/k210.dtsi        | 564 +++++++++-
 arch/riscv/boot/dts/kendryte/k210_generic.dts |  46 +
 arch/riscv/boot/dts/kendryte/k210_kd233.dts   | 177 ++++
 .../riscv/boot/dts/kendryte/k210_maix_bit.dts | 226 ++++
 .../boot/dts/kendryte/k210_maix_dock.dts      | 229 ++++
 arch/riscv/boot/dts/kendryte/k210_maix_go.dts | 237 +++++
 .../boot/dts/kendryte/k210_maixduino.dts      | 203 ++++
 arch/riscv/configs/nommu_k210_defconfig       |  45 +-
 arch/riscv/include/asm/soc.h                  |  38 -
 arch/riscv/kernel/entry.S                     |   9 +
 arch/riscv/kernel/soc.c                       |  27 -
 arch/riscv/kernel/time.c                      |   3 +
 arch/riscv/mm/init.c                          |   6 +-
 drivers/clk/Kconfig                           |   9 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-k210.c                        | 962 +++++++++++++++++
 drivers/gpio/gpio-sifive.c                    |   2 +-
 drivers/of/property.c                         |  17 +-
 drivers/pinctrl/Kconfig                       |  15 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-k210.c                | 999 ++++++++++++++++++
 drivers/reset/Kconfig                         |   9 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-k210.c                    | 186 ++++
 drivers/soc/Kconfig                           |   2 +-
 drivers/soc/kendryte/Kconfig                  |  19 +-
 drivers/soc/kendryte/Makefile                 |   2 +-
 drivers/soc/kendryte/k210-sysctl.c            | 253 +----
 drivers/spi/spi-dw-core.c                     |  22 +-
 drivers/spi/spi-dw-mmio.c                     |  20 +-
 drivers/spi/spi-dw.h                          |  10 +
 drivers/tty/serial/sifive.c                   |   1 +
 include/dt-bindings/clock/k210-clk.h          |  61 +-
 include/dt-bindings/mfd/k210-sysctl.h         |  41 +
 include/dt-bindings/pinctrl/k210-pinctrl.h    | 277 +++++
 include/dt-bindings/reset/k210-rst.h          |  42 +
 include/soc/kendryte/k210-sysctl.h            |  11 +
 46 files changed, 4770 insertions(+), 388 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/kendryte,k210-clk.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/kendryte,k210-sysctl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml
 create mode 100644 Documentation/devicetree/bindings/reset/kendryte,k210-rst.yaml
 delete mode 100644 arch/riscv/boot/dts/kendryte/k210.dts
 create mode 100644 arch/riscv/boot/dts/kendryte/k210_generic.dts
 create mode 100644 arch/riscv/boot/dts/kendryte/k210_kd233.dts
 create mode 100644 arch/riscv/boot/dts/kendryte/k210_maix_bit.dts
 create mode 100644 arch/riscv/boot/dts/kendryte/k210_maix_dock.dts
 create mode 100644 arch/riscv/boot/dts/kendryte/k210_maix_go.dts
 create mode 100644 arch/riscv/boot/dts/kendryte/k210_maixduino.dts
 create mode 100644 drivers/clk/clk-k210.c
 create mode 100644 drivers/pinctrl/pinctrl-k210.c
 create mode 100644 drivers/reset/reset-k210.c
 create mode 100644 include/dt-bindings/mfd/k210-sysctl.h
 create mode 100644 include/dt-bindings/pinctrl/k210-pinctrl.h
 create mode 100644 include/dt-bindings/reset/k210-rst.h
 create mode 100644 include/soc/kendryte/k210-sysctl.h

-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
