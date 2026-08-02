Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F2EC5516F
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Aug 2026 02:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ITpVTMNFWrqrvQAevCD6JK3ZizpYPM8A4kEhIISwWy4=; b=K0b+F5SyzYkek5
	tvSSFgH4s04Dwvc+E4u3H51bWwNQh2JVT8N+zL0GVi8X/44NVx+TPn/uuxdvi/wavR9MWseErJNip
	YKXbxdB63QVSPHKmeTL843O59u4Hd7rx0G2bWPZ1wowFehZy5gP6aXkOzfQZqUEL9l/9EfH6NI3BF
	iIF3fyi401wtlq4RD3bM7Skv2DYQAyMdJum8mY8ypu55kmshPfwOGfmNzndzL/vaCJXN7f6y4gtKU
	QXjdayHuF4Et+dXHF1+Hb+SVaPhQNh0NSmGS4uYEVPf2r7EqqKIfLD4fWJ9XJ1x7HA5Z3bA5bwDwr
	UsSt+nmwZZ5yKQzRxyZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqMA8-0000000FIC3-3VMM;
	Sun, 02 Aug 2026 02:42:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqMA6-0000000FIBx-2DeU
	for linux-riscv@lists.infradead.org;
	Sun, 02 Aug 2026 02:42:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F1226057A;
	Sun,  2 Aug 2026 02:42:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D5761F00AC4;
	Sun,  2 Aug 2026 02:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785638569;
	bh=G7pjPdHcziQjL7fgeQl0SYtRU28wBVdIe8+9QWyN3dk=;
	h=From:To:Cc:Subject:Date;
	b=NFuN7roafmWP8un0HCDeLjAMTcWtOHov0Ib9mFHDC/yjyoV4eEcNvzz4p6fh+lHCf
	 a9Y7u1IxynTlqbsYEgjr3XB7GcolN2ubz1LeUnNCIB9zPBpo35R+tSBZBpzXrb4+s+
	 e3EgvmT1agjW0foKK4Wd2Eg22ClmDu5KsChuAN1WMgUX4OjgcUFs9K6y7m0lr7OSW1
	 1hvmkeN8gRqDAZrY2OCoPmBfmd4AKH8fbKJWrsbwrDCIrGg9m4n7u5PSavfAj8hKd8
	 7Nzr4DRQ6LoNJAOvHXYG4F2sgw+kZkLiwwvl0Cz5pk/Z4EoFv7Uo933U47XMarpFVT
	 uC7rSo8Dy+3xw==
From: Yixun Lan <dlan@kernel.org>
To: soc@kernel.org
Cc: Yixun Lan <dlan@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V SpacemiT Devicetrees for v7.3
Date: Sun,  2 Aug 2026 02:42:43 +0000
Message-ID: <20260802024052-KYC1424545@kernel.org>
X-Mailer: git-send-email 2.55.0
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

   Please pull SpacemiT's DeviceTree changes for v7.3

Yixun Lan

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/ tags/spacemit-dt-for-7.3-1

for you to fetch changes up to e273d298b74ea63d5d586bd50240f919a9c33fb3:

  riscv: dts: spacemit: Add cpu scaling for Milk-V Jupiter (2026-07-30 09:02:11 +0000)

----------------------------------------------------------------
RISC-V SpacemiT DT changes for 7.3

For K3 SoC
- Enable SD card support
- Enable QSPI
- Fix reset delay of ETH PHY
- Fix PHY ID of ETH
- Symbolic PDAM ID
- Add SPI controller support
- Add USB and PHY support
- Add I2S nodes

For K1 SoC
- Symbolic PDAM ID
- Enable cpufreq support
- Fix max CPU core voltage

For boards of K3
- Pico-ITX
  - Enable ALDPS on RTL8211F PHY
  - Disable 125MHz clock on RTL8211F PHY
  - Enable NOR flash
  - Add EEPROM support
- CoM260
  - Add EEPROM support

For boards of K1
- Milk-V Jupiter
  - Enable CPU DVFS
- Banana Pi BPI-CM6
  - Add initial support
- OrangePi R2S
  - Enable PCIe

----------------------------------------------------------------
Aurelien Jarno (12):
      riscv: dts: spacemit: set console baud rate on K3 Pico-ITX board
      riscv: dts: spacemit: enable the i2c2 adapter on K3 Pico-ITX board
      riscv: dts: spacemit: add 24c02 eeprom on K3 Pico-ITX board
      riscv: dts: spacemit: add i2c aliases on K3 Pico-ITX board
      riscv: dts: spacemit: improve RTL8211F PHY configuration on K3 Pico-ITX board
      riscv: dts: spacemit: k1-bananapi-f3: fix maximum CPU core voltage
      riscv: dts: spacemit: k1-milkv-jupiter: fix maximum CPU core voltage
      riscv: dts: spacemit: k1-orangepi-rv2: fix maximum CPU core voltage
      riscv: dts: spacemit: k1-musepi-pro: fix maximum CPU core voltage
      riscv: dts: spacemit: k1-orangepi-r2s: fix maximum CPU core voltage
      riscv: dts: spacemit: k1-bananapi-cm6: fix maximum CPU core voltage
      riscv: dts: spacemit: Add cpu scaling for Milk-V Jupiter

Chukun Pan (1):
      riscv: dts: spacemit: enable PCIe on OrangePi R2S

Guodong Xu (1):
      riscv: dts: spacemit: Use symbolic PDMA request numbers on K1

Inochi Amaoto (7):
      riscv: dts: spacemit: Add enough deassert time for the PHY on PICO ITX
      riscv: dts: spacemit: Add enough deassert time for the PHY on com260 board
      riscv: dts: spacemit: Fix phy id check for the phy on pico-itx board
      riscv: dts: spacemit: Fix phy id check for the phy on com260 board
      riscv: dts: spacemit: k3: add USB controller and USB phy support
      riscv: dts: spacemit: Make dtschema recognize the etherent PHY correctly on K3 pico-itx board
      riscv: dts: spacemit: Make dtschema recognize the etherent PHY correctly on K3 com260 board

Jennifer Berringer (2):
      riscv: dts: spacemit: k3-com260: add eeprom on i2c2
      riscv: dts: spacemit: k3-com260-ifx: add eeprom on i2c1

Junhui Liu (3):
      dt-bindings: riscv: spacemit: Add Banana Pi BPI-CM6 compatible
      riscv: dts: spacemit: k1: Split gmac_clk_ref into independent pinctrl groups
      riscv: dts: spacemit: k1: Add Banana Pi BPI-CM6 IO board

Shuwei Wu (2):
      cpufreq: dt-platdev: Add SpacemiT K1 SoC to the allowlist
      riscv: dts: spacemit: Add cpu scaling for K1 SoC

Troy Mitchell (1):
      riscv: dts: spacemit: k3: add i2s0-i2s5 nodes

Yixun Lan (1):
      riscv: dts: spacemit: k3: Enable SD card support

Zhengyu He (2):
      riscv: dts: spacemit: k3: Add QSPI support for Pico-ITX board
      riscv: dts: spacemit: add SPI controllers for K3

liyeshan (1):
      riscv: dts: spacemit: add K3 PDMA request numbers

 .../devicetree/bindings/riscv/spacemit.yaml        |   5 +
 arch/riscv/boot/dts/spacemit/Makefile              |   1 +
 .../riscv/boot/dts/spacemit/k1-bananapi-cm6-io.dts | 177 +++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi  | 217 +++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  43 +++-
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts  |  43 +++-
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts     |   6 +-
 arch/riscv/boot/dts/spacemit/k1-opp.dtsi           | 105 +++++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts   |  46 +++-
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts   |   4 +-
 arch/riscv/boot/dts/spacemit/k1-pdma.h             |  56 +++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |  24 ++-
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  12 +-
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts     |  33 +++
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi        |  38 +++-
 arch/riscv/boot/dts/spacemit/k3-pdma.h             |  83 +++++++
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts       | 117 +++++++++-
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi       |  88 ++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi               | 240 ++++++++++++++++++++-
 drivers/cpufreq/cpufreq-dt-platdev.c               |   2 +
 20 files changed, 1308 insertions(+), 32 deletions(-)
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6-io.dts
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-opp.dtsi
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-pdma.h
 create mode 100644 arch/riscv/boot/dts/spacemit/k3-pdma.h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
