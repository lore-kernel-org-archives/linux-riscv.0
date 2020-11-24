Return-Path: <SRS0=DJxK=E6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D9CC8300A
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 04:37:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3253E2085B
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 04:37:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jdNa+N3x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="HdHKF93q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3253E2085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TsH+48yiFzULcoXE55CD8m8/x8POPxs75j9APL0aCFo=; b=jdNa+N3xJ/RV6AuCBqLiMidk4m
	onov8JqWjvjIkcja+05RghObBOz4sUmfx2bDpEljCG+heMCoLkiOsAjzRdOl2pnHwHadmdAxKZmnU
	8IDittyTdmaSwWOEkinL4evb96c4SflvQmo/bkdyIwi+B/B9PbNE21Ru9IMPbEF7424eeAql7r9R8
	bfB2756nyxULbQr5MMKegcbWw3C2RNWY9gM0EiYr5AfFYC3r95oDMg1Rn0B/OBji/2pTpMGY4l5rA
	5QePhhI739/e8NN4sNON3mlCzSYKxlzz6KU+8Xo9PA7Q2uhBw2evIFKaNTsCEl7BKvVoMt9Slc05d
	z4bI/IWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khQ5D-0007Oj-7U; Tue, 24 Nov 2020 04:37:39 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khQ58-0007N4-Ry
 for linux-riscv@lists.infradead.org; Tue, 24 Nov 2020 04:37:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1606192654; x=1637728654;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rVPzZ0fjLQkdg3mQrO9XGRTGd6aJnP0ZSaxgARJBgc8=;
 b=HdHKF93qeW9CX67SJ9ChNz2D7O+ss8fhNhJURFG01q0ZO6wq1z142Umq
 oq4BUtYV4Xnm80G3qTKQJyK0TuGSV1LgQg9FMg+lw1BqP51nM8AmtVol4
 bZqsb4CeCDvHKfGIZE0Z0qA1jvjDYV+EvbehjrsDZLxQL7oiatffCiqhK
 T4jkHZjaN5LaDpoVTHADJf16Zf4EpZjDjfJ0u5eTdpGBN6bzFTB36fJM3
 tB8yR8DkGdKu6I22j95jO+5LAhnB349qc3O+q07NFhlB26ZGmae2BUjC3
 63mGcM3yJBZg6pCTu0r7ORO4VMPh7bCtEQ5a/DwC47rNchfWYCBNyJTlp Q==;
IronPort-SDR: ZIyfnIWldagiwJVkBHe60+rruhELVR2ZuyM0ybdxDb7W5Fpeu0lBtOnuohO2ka2yImYma+pcoH
 9U7VSOc08xWiiT40nmSV5p1j7wg9RN//K71TPDCpq5eMTGsYa6PzDIBnVIOX8lwlhh3iBk/6B2
 tUax+LYFt3BmoZLMM0YyMvuh+a4ZcJMa0r+proEc3h3L7wPoeqwcxC84OYsYbsEj16++2v+gHx
 Z4VoW8KsjV1gYG4WqnQt6D27mQXam/CtUp654JUMaDJxf3EhRlFbKeAvaFKNUQDT+efH9nczH2
 H5k=
X-IronPort-AV: E=Sophos;i="5.78,365,1599494400"; d="scan'208";a="157768563"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 24 Nov 2020 12:37:31 +0800
IronPort-SDR: +GmEFBYY1Ck1dmmAfsz8gxeSEO+/kIevxzpXJrMfEYzLhwFY6t5f1yWW9pyVu3dLOf2oi3XjrH
 AFV0NYEJ+/Av6Z6Z2RF8LfXnlzKBFfVUY=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 20:21:56 -0800
IronPort-SDR: hjxFysibKgoYdhDu0tPHAI/6HON/X8/DuC03iesKED51lFdkezWcrts3I7FBCRRLZwKJGuW//b
 KYx7/jHOdwMA==
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.163])
 by uls-op-cesaip01.wdc.com with ESMTP; 23 Nov 2020 20:37:29 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2 00/21] RISC-V Kendryte K210 support improvements
Date: Tue, 24 Nov 2020 13:37:07 +0900
Message-Id: <20201124043728.199852-1-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_233735_081754_C07C0705 
X-CRM114-Status: GOOD (  20.53  )
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
most peripherals present on the SoC as well as introducing device trees
for the various K210 boards available on the market today from SiPeed
and Kendryte.

Pathes 1 to 4 are various fixes for riscv arch code and riscv
dependent devices. Of note here is patch 3 which fix system calls
execution in the no MMU case, and patch 4 which simplifies DTB builtin
handling.

Patch 5 fixes naming of directories and configuration options to use the
K210 SoC vendor name (Canaan) instead of its branding name (Kendryte).

The following patches 6 to 10 document device tree bindings for the SoC
drivers. These drivers implementation is provided in patches 11, 12 and
13, respectively implementing the SoC clock driver, SOC pin function
control and reset controller.

Patches 14 to 19 update the existing K210 device tree and add new
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
https://github.com/damien-lemoal/linux, k210-sysctl-v15 branch.
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

Changes from v1:
* Improved DT bindings documentation
* SPI and GPIO patches removed from this series (and being processed
  directly through the relevant subsystems directly)
* Improved device trees
* Various cleanup and improvments of the drivers

Damien Le Moal (21):
  riscv: Fix kernel time_init()
  riscv: Fix sifive serial driver
  riscv: Enable interrupts during syscalls with M-Mode
  riscv: Fix builtin DTB handling
  riscv: Use vendor name for K210 SoC support
  dt-bindings: Add Canaan vendor prefix
  dt-binding: Document canaan,k210-clk bindings
  dt-bindings: Document canaan,k210-rst bindings
  dt-bindings: Document canaan,k210-fpioa bindings
  dt-binding: Document canaan,k210-sysctl bindings
  riscv: Add Canaan Kendryte K210 clock driver
  riscv: Add Canaan Kendryte K210 FPIOA driver
  riscv: Add Canaan Kendryte K210 reset controller
  riscv: Update Kendryte K210 device tree
  riscv: Add SiPeed MAIX BiT board device tree
  riscv: Add SiPeed MAIX DOCK board device tree
  riscv: Add SiPeed MAIX GO board device tree
  riscv: Add SiPeed MAIXDUINO board device tree
  riscv: Add Kendryte KD233 board device tree
  riscv: Update Canaan Kendryte K210 defconfig
  riscv: Add Canaan Kendryte K210 SD card defconfig

 .../bindings/clock/canaan,k210-clk.yaml       |  55 +
 .../bindings/mfd/canaan,k210-sysctl.yaml      | 116 ++
 .../bindings/pinctrl/canaan,k210-fpioa.yaml   | 165 +++
 .../bindings/reset/canaan,k210-rst.yaml       |  40 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/riscv/Kconfig.socs                       |  38 +-
 arch/riscv/Makefile                           |   2 +-
 arch/riscv/boot/dts/Makefile                  |   2 +-
 arch/riscv/boot/dts/canaan/Makefile           |   5 +
 arch/riscv/boot/dts/canaan/k210.dtsi          | 625 +++++++++++
 arch/riscv/boot/dts/canaan/k210_generic.dts   |  46 +
 arch/riscv/boot/dts/canaan/k210_kd233.dts     | 178 ++++
 arch/riscv/boot/dts/canaan/k210_maix_bit.dts  | 227 ++++
 arch/riscv/boot/dts/canaan/k210_maix_dock.dts | 229 ++++
 arch/riscv/boot/dts/canaan/k210_maix_go.dts   | 237 +++++
 arch/riscv/boot/dts/canaan/k210_maixduino.dts | 201 ++++
 arch/riscv/boot/dts/kendryte/Makefile         |   4 -
 arch/riscv/boot/dts/kendryte/k210.dts         |  23 -
 arch/riscv/boot/dts/kendryte/k210.dtsi        | 125 ---
 arch/riscv/configs/nommu_k210_defconfig       |  36 +-
 .../riscv/configs/nommu_k210_sdcard_defconfig |  90 ++
 arch/riscv/include/asm/soc.h                  |  38 -
 arch/riscv/kernel/entry.S                     |   9 +
 arch/riscv/kernel/soc.c                       |  27 -
 arch/riscv/kernel/time.c                      |   3 +
 arch/riscv/mm/init.c                          |   6 +-
 drivers/clk/Kconfig                           |   9 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-k210.c                        | 959 +++++++++++++++++
 drivers/pinctrl/Kconfig                       |  13 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-k210.c                | 997 ++++++++++++++++++
 drivers/reset/Kconfig                         |   9 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-k210.c                    | 150 +++
 drivers/soc/Kconfig                           |   2 +-
 drivers/soc/Makefile                          |   2 +-
 drivers/soc/canaan/Kconfig                    |   9 +
 drivers/soc/canaan/Makefile                   |   3 +
 drivers/soc/canaan/k210-sysctl.c              |  89 ++
 drivers/soc/kendryte/Kconfig                  |  14 -
 drivers/soc/kendryte/Makefile                 |   3 -
 drivers/soc/kendryte/k210-sysctl.c            | 260 -----
 drivers/tty/serial/sifive.c                   |   1 +
 include/dt-bindings/clock/k210-clk.h          |  61 +-
 include/dt-bindings/pinctrl/k210-fpioa.h      | 276 +++++
 include/dt-bindings/reset/k210-rst.h          |  42 +
 include/soc/canaan/k210-sysctl.h              |  43 +
 48 files changed, 4944 insertions(+), 530 deletions(-)
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
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
