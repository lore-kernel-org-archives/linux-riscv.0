Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C068AD3EE6B
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 14:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3MSdlRYIhCqW6V7eATL1mOdKIey5WXQYzwJ03uhTN1Y=; b=z9tRyKdiK15Rs9
	21qBdHqgjBMli4yWwQuKaB0qRVtsLPBLQUNn2HZsmBmQVbR+nhKHIPieIXNnC0yPM+IQTpslV004e
	RlQ7vTWmT7pmq3CiKWsEXC8AJ5Fw7yWaA3v7hqILYz98AUKIMyRd/Wdo8MjM9wWfCEeH0VXn2iAiz
	9YGgLL/83auL6bgRJaXN2Jn/BwNjs8omAY+T/zFjyqtmJ8hn2pHygNyQQoEVyrA2FhFwaDDgVH3ge
	8xp9F4wSxh7mtbaJ7gGW72M1RhQHZZHgZaj2ZLKG1k864cc8949IrpLc2dXrtp5BIu9Zld/x8Fcyq
	Q+FQxkXULMXSQf0l59MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vivbU-00000007EZ1-1VDd;
	Thu, 22 Jan 2026 14:24:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vivbT-00000007EYZ-2NHT
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 14:24:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C6AB600C3;
	Thu, 22 Jan 2026 14:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA46DC116C6;
	Thu, 22 Jan 2026 14:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769091846;
	bh=9ldknsSqFx/iQzwBf1LlwoaFp95z9BYgWXvBcs7uj6k=;
	h=From:To:Cc:Subject:Date:From;
	b=gqWqPsQDVP2cdPbl5caNzMQRq9JVr/7CNirfOa++CtZgh6NphXMU6qrpI58rF02s/
	 1YHcA5mepIAwS0300uSmojrjEGm81rBmttC7Nl0uTbYb5swf/EsnUlxvMwOuQIBT8P
	 3XppQt4NxA5sk4OYuCn26LiGz2Ed6IZYbd7f0fLC2ADXLBMXo3lhC1DCEKLSUM7QUA
	 uAXJcH7/fF++4+iP2Ty+hR8bQPHSpUYeUmASOCgA5JIBnZfA8gZ2woWl9El3AfPPNJ
	 7fOJfMyRKy0cqtJLyDywMCBJjZ7JYTAX8Tp2QoKJA3aBcBSQLlCBuTyrAfM+MlUu2p
	 nf1bVqF512K/Q==
From: Yixun Lan <dlan@kernel.org>
To: soc@lists.linux.dev
Cc: Yixun Lan <dlan@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V SpacemiT Devicetrees for v6.20
Date: Thu, 22 Jan 2026 22:23:37 +0800
Message-ID: <20260122220523-GYD3596979@kernel.org>
X-Mailer: git-send-email 2.52.0
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

Hi Arnd,

   Please pull SpacemiT's DeviceTree changes for v6.20

Yixun Lan

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://github.com/spacemit-com/linux tags/spacemit-dt-for-6.20-1

for you to fetch changes up to 5164e95565d3fd508ca8a95351323f5716dfb695:

  riscv: dts: spacemit: Disable ETH PHY sleep mode for OrangePi (2026-01-21 08:52:03 +0800)

----------------------------------------------------------------
RISC-V SpacemiT DT changes for 6.20

- Disable Ethernet PHY auto sleep mode
- Add pinctrl IO power support
- Add K3 Pico-ITX board
- Add support for K3 SoC
- Add DWC USB support
- Add reset for eMMC(sdhci)/I2C
- Add PCIe support
- Support PMIC for Jupiter board

----------------------------------------------------------------
Alex Elder (2):
      riscv: dts: spacemit: Add a PCIe regulator
      riscv: dts: spacemit: PCIe and PHY-related updates

Chukun Pan (1):
      riscv: dts: spacemit: Disable ETH PHY sleep mode for OrangePi

Encrow Thorne (1):
      riscv: dts: spacemit: add reset property

Guodong Xu (8):
      riscv: dts: spacemit: k1: Add "b" ISA extension
      dt-bindings: riscv: add SpacemiT X100 CPU compatible
      dt-bindings: timer: add SpacemiT K3 CLINT
      dt-bindings: interrupt-controller: add SpacemiT K3 APLIC
      dt-bindings: interrupt-controller: add SpacemiT K3 IMSIC
      dt-bindings: riscv: spacemit: add K3 and Pico-ITX board bindings
      riscv: dts: spacemit: add initial support for K3 SoC
      riscv: dts: spacemit: add K3 Pico-ITX board support

Javier Martinez Canillas (3):
      riscv: dts: spacemit: Enable i2c8 adapter for Milk-V Jupiter
      riscv: dts: spacemit: Define fixed regulators for Milk-V Jupiter
      riscv: dts: spacemit: Define the P1 PMIC regulators for Milk-V Jupiter

Troy Mitchell (1):
      riscv: dts: spacemit: pinctrl: update register and IO power

Yixun Lan (1):
      riscv: dts: spacemit: sdhci: add reset support

Ze Huang (3):
      riscv: dts: spacemit: Add USB2 PHY node for K1
      riscv: dts: spacemit: Add DWC3 USB 3.0 controller node for K1
      riscv: dts: spacemit: Enable USB3.0 on BananaPi-F3

 .../bindings/interrupt-controller/riscv,aplic.yaml |   1 +
 .../interrupt-controller/riscv,imsics.yaml         |   1 +
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   1 +
 .../devicetree/bindings/riscv/spacemit.yaml        |   5 +
 .../devicetree/bindings/timer/sifive,clint.yaml    |   1 +
 arch/riscv/boot/dts/spacemit/Makefile              |   1 +
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  90 ++++
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts  | 135 +++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts   |   2 +
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts   |   2 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |  33 ++
 arch/riscv/boot/dts/spacemit/k1.dtsi               | 254 ++++++++-
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts       |  29 ++
 arch/riscv/boot/dts/spacemit/k3.dtsi               | 578 +++++++++++++++++++++
 14 files changed, 1116 insertions(+), 17 deletions(-)
 create mode 100644 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
 create mode 100644 arch/riscv/boot/dts/spacemit/k3.dtsi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
