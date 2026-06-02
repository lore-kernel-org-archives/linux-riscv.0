Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8F8CD6E57
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 07:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K/7Sh7DRbhOOLJaGJZ0vtsLsd8Z2/lem/LjwGJj3AaU=; b=t1R5RJbztviYyV
	jyXp1EnxPwNp6Lkzai1X3WEYRpzywXGHAwTF3v0X7o2D1CHWUs7NdezBzgj22tQ5RcfN3IfNXpjMN
	Gl3pngHPA9GOxvO+AL+IvyYFozNl4uosJOMdSz+V3Y36tT/QyMMg1iSatAC78sIcx8Xo6zJSIxo6K
	qmnLaahcbQ/1qgKK0jOuVSzDDI8vu87BxqZXpMCf52+yKoHyFxc68I5jznOr195j4cI72rYYX7Ikb
	8yytJUSx/amgDYU7SUGmLtQ7fa2wLpkbqKzoqzZS1Me8+AwL/arHQbDbTKTQ5GefgZxVuy6bq3Qnd
	QRHqc9d5haqelnEPHcZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJGc-0000000CQaC-2hPF;
	Tue, 02 Jun 2026 07:10:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJGb-0000000CQa6-1Mop
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 07:10:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C63B6001A;
	Tue,  2 Jun 2026 07:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A45AD1F00893;
	Tue,  2 Jun 2026 07:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780384224;
	bh=1KZd8akmP8KBtmPjtnCo0FTThqVg1y62b9+Gritm7ys=;
	h=From:To:Cc:Subject:Date;
	b=nd7OQAgeW2M/11z4Ea4pVVlbUv9nz9VyJaN4u8dp8hilAfL3vy3l5EOEGCty8kona
	 ek5VCXz+xRJm0ALJHs3eW3mI+wpH7p8xUajm77j97odYFUNF5FzoR2eTejVxnBX8GU
	 Dtt0OK0hMQ/VGOWkbsXTSQQ/6SdJHrOrbcWq9OY9eGYdaYSTVON8G06QJJOWFp4jNK
	 sqgNYDE9+SC5FOYe6h7znC1d0oadduBBRviHxxa3Vhss8yMv+IxnwuKICYWeKJw+2i
	 sB1y4UBnY6jAUHEKkgp4UwqeCMGZiQCFR5GxAeim2auI2jBLDQ0BWbxCAOutRUhu0/
	 sX20jIw2xSj5g==
From: Yixun Lan <dlan@kernel.org>
To: soc@kernel.org
Cc: Yixun Lan <dlan@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V SpacemiT Devicetrees for v7.2
Date: Tue,  2 Jun 2026 07:10:07 +0000
Message-ID: <20260602070257-KYC5031219@kernel.org>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi SoC Maintainers,

   Please pull SpacemiT's DeviceTree changes for v7.2

Yixun Lan

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://github.com/spacemit-com/linux spacemit-dt-for-7.2-1

for you to fetch changes up to 793cc54475b49b5b558902b5c13e4bfe66530a50:

  riscv: dts: spacemit: enable PMIC on OrangePi R2S (2026-06-01 06:32:42 +0000)

----------------------------------------------------------------
RISC-V SpacemiT DT changes for 7.2

For K3 SoC
- Add Ziccrse extension
- Add PWM support
- Add PDMA support
- Add USB2.0 support
- Add CoM260-IFX board
- Add DeepComputing FML13V05 board
- Fix I/O power of pinctrl

For K1 SoC
- Add Micro SD card support
- Add baudrate to console
- Add SPI support
- Enable thermal sensor
- Fix 32K clock

For boards of K1
- Milk-V Jupiter
  - Enable eMMC
- MusePi-Pro
  - Enable EEPROM/PCIe/QSPI/USB
- OrangePi R2S
  - Enable PMIC/USB3
- OrangePi RV2
  - Enable eMMC/I2C/PCIe/PMIC/QSPI/USB

----------------------------------------------------------------
Alex Elder (1):
      riscv: dts: spacemit: define a SPI controller node

Andre Heider (6):
      riscv: dts: spacemit: k1-musepi-pro: add PMIC and power infrastructure
      riscv: dts: spacemit: k1-musepi-pro: add 24c02 eeprom
      riscv: dts: spacemit: k1-musepi-pro: enable QSPI and add SPI NOR
      riscv: dts: spacemit: k1-musepi-pro: enable USB 3 ports
      riscv: dts: spacemit: k1-musepi-pro: enable PCIe ports
      riscv: dts: spacemit: k1-musepi-pro: set default console baud rate

Aurelien Jarno (5):
      riscv: dts: spacemit: set console baud rate on Milk-V Jupiter
      riscv: dts: spacemit: sort aliases on Milk-V Jupiter
      riscv: dts: spacemit: enable eMMC on Milk-V Jupiter
      riscv: dts: spacemit: enable SD card support on Milk-V Jupiter
      riscv: dts: spacemit: fix uboot partition offset on Milk-V Jupiter

Chukun Pan (4):
      riscv: dts: spacemit: enable eMMC for OrangePi RV2
      riscv: dts: spacemit: enable QSPI for OrangePi RV2
      riscv: dts: spacemit: enable USB3 on OrangePi R2S
      riscv: dts: spacemit: enable PMIC on OrangePi R2S

Conor Dooley (1):
      dts: spacemit: set console baud rate on bpif3

Guodong Xu (1):
      riscv: dts: spacemit: k3: Add Ziccrse extension for X100 cores

Han Gao (3):
      riscv: dts: spacemit: Enable i2c8 adapter for OrangePi RV2
      riscv: dts: spacemit: Define the P1 PMIC regulators for OrangePi RV2
      riscv: dts: spacemit: Enable USB3.0/PCIe on OrangePi RV2

Iker Pedrosa (3):
      riscv: dts: spacemit: k1: add SD card controller and pinctrl support
      riscv: dts: spacemit: k1-orangepi-rv2: add SD card support with UHS modes
      riscv: dts: spacemit: k1-bananapi-f3: add SD card support with UHS modes

Sandie Cao (2):
      dt-bindings: riscv: spacemit: add deepcomputing,fml13v05
      riscv: dts: spacemit: add DeepComputing FML13V05 board device tree

Shuwei Wu (1):
      riscv: dts: spacemit: Add thermal sensor for K1 SoC

Trevor Gamblin (1):
      riscv: dts: spacemit: k1-musepi-pro: add SD card support with UHS modes

Troy Mitchell (1):
      riscv: dts: spacemit: Add PDMA controller node for K3 SoC

Yixun Lan (6):
      dts: riscv: spacemit: correct 32k clock frequency
      riscv: dts: spacemit: k3: Add USB2.0 support
      riscv: dts: spacemit: k3: Add pwm support
      dt-bindings: riscv: spacemit: Add K3 CoM260-IFX board
      riscv: dts: spacemit: k3: Initial support for CoM260-IFX board
      dts: riscv: spacemit: k3: Fix I/O power settings

 .../devicetree/bindings/riscv/spacemit.yaml        |   6 +
 arch/riscv/boot/dts/spacemit/Makefile              |   2 +
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  33 +-
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts  |  38 +-
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts     | 329 ++++++++++-
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts   | 157 ++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts   | 292 ++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |  60 ++
 arch/riscv/boot/dts/spacemit/k1.dtsi               | 131 ++++-
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts     |  21 +
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi        | 190 +++++++
 .../dts/spacemit/k3-deepcomputing-fml13v05.dts     |  31 +
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts       |  24 +
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi       | 623 +++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi               | 281 +++++++++-
 15 files changed, 2200 insertions(+), 18 deletions(-)
 create mode 100644 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
 create mode 100644 arch/riscv/boot/dts/spacemit/k3-com260.dtsi
 create mode 100644 arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
