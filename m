Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26E3D73094
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 12:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gvQPDlE3Atm5c/NDfspoCBXXlKIHbxK14zZ95XLeAhU=; b=EhjKBIwD302nIo
	XVy9P9TmAEME7mxO4YMmhKEXAdwNgCONTlfkC3mPAWZsr5Fjeq1ytJvWR585KdW31XQ/cigFAXa+J
	SHiZyicqbZKY0tzkKA1uPgedBrkYtPhK2QZXETEGinUkYLzqk9uhdpcCky0FB7FRWklV8QqDlwRHZ
	ZqeVPR/U5JAAUURFTJ/ZoZerCx0CFUamicJWVDfGPEmircdlSUVXGtbECUQLBA2sCiA7tPBlnkUEz
	9yIXppja6HBk2/wpXoxgTWvWl4tgDCIOMz+Z/SClt/cZS2BcWkIyuXxgHN1tjd59eLYSraSL8pWiq
	o0Jt7OqApLKYet+ULIOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8dhG-000000020QR-25mL;
	Fri, 03 Apr 2026 12:32:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8dhE-000000020Q7-1FUh
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 12:32:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 07B2A42AC9;
	Fri,  3 Apr 2026 12:32:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5498DC4CEF7;
	Fri,  3 Apr 2026 12:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775219539;
	bh=KBUjyrpPe2k4XhKFx345kREYiQ7Vjgg1jBFk6gpSAns=;
	h=From:To:Cc:Subject:Date:From;
	b=hPIUyh5MLKJzCMUWJkZ1EW0Uo8J1VVlOIxSZpxB3jrEPp8Eo7JYo0WRfg4Uh2VaZB
	 oMZxBGwOE2dyRnlhW8I3rRnc93/TWbs7Qcg3A1igt7gshVsKd3WkSuKvC2MIqnvyEY
	 zAhlQP7Jd4aLyCDwTAigM5M9PlnyJT5tRMko5YRaburX6yg8QF4tuxTGD/1mFwvAAK
	 8uyWGBegVIt6kuG9Peo2J5f4CqkO44utmxlyGukSbKk6n3pyXq+XMi0S5zhYRGkRQj
	 cwewXHoyz36eRdQL4iTKYkZraTftrnCe5A4crCoEdK87FMV9lnl5jgrbfRNwYW3eZ4
	 NHWtWszItvOGw==
From: Yixun Lan <dlan@kernel.org>
To: soc@kernel.org
Cc: Yixun Lan <dlan@gentoo.org>,
	Arnd Bergmann <arnd@arndb.de>,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V SpacemiT Devicetrees for v7.1
Date: Fri,  3 Apr 2026 12:32:06 +0000
Message-ID: <20260403123040-KYC0145825@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_053220_377328_3B9B736B 
X-CRM114-Status: UNSURE (   8.37  )
X-CRM114-Notice: Please train this message.
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

From: Yixun Lan <dlan@gentoo.org>

Hi Arnd,

   Please pull SpacemiT's DeviceTree changes for v7.1

Yixun Lan

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://github.com/spacemit-com/linux tags/spacemit-dt-for-7.1-1

for you to fetch changes up to af62a095eb0c3359d477b55ef72d2afd94c83c8f:

  dts: riscv: spacemit: k3: add P1 PMIC regulator tree (2026-03-30 04:42:10 +0000)

----------------------------------------------------------------
RISC-V SpacemiT DT changes for 7.1

For K3 SoC
- Add I2C support
- Add PMIC regulator tree
- Add ethernet support
- Add pinctrl/GPIO/Clock
- Enable full UART support

For K1 SoC
 On Milk-V Jupiter
- Enable PCIe/USB on
- Enable QSPI/SPI NOR
- Enable EEPROM, LEDs
 Others
- Fix PMIC supply properties
- Fix PCIe missing power regulator

----------------------------------------------------------------
Aurelien Jarno (7):
      riscv: dts: spacemit: drop incorrect pinctrl for combo PHY
      riscv: dts: spacemit: add LEDs for Milk-V Jupiter board
      riscv: dts: spacemit: add 24c04 eeprom on Milk-V Jupiter
      riscv: dts: spacemit: add i2c aliases on Milk-V Jupiter
      riscv: dts: spacemit: enable QSPI and add SPI NOR on Milk-V Jupiter
      riscv: dts: spacemit: enable USB 3 ports on Milk-V Jupiter
      riscv: dts: spacemit: enable PCIe ports on Milk-V Jupiter

Chukun Pan (2):
      riscv: dts: spacemit: Add 'linux,pci-domain' to PCIe nodes for K1
      riscv: dts: spacemit: reorder phy nodes for K1

Guodong Xu (1):
      riscv: dts: spacemit: Update PMIC supply properties for BPI-F3 and Jupiter

Inochi Amaoto (1):
      riscv: dts: spacemit: Add ethernet device for K3

Yixun Lan (9):
      riscv: dts: spacemit: pcie: fix missing power regulator
      riscv: dts: spacemit: adapt regulator node name to preferred form
      dt-bindings: serial: 8250: spacemit: fix clock property for K3 SoC
      riscv: dts: spacemit: k3: add clock tree
      riscv: dts: spacemit: k3: add pinctrl support
      riscv: dts: spacemit: k3: add GPIO support
      riscv: dts: spacemit: k3: add full resource to UART
      dts: riscv: spacemit: k3: Add i2c nodes
      dts: riscv: spacemit: k3: add P1 PMIC regulator tree

 Documentation/devicetree/bindings/serial/8250.yaml |   5 +-
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  26 +-
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts  | 204 +++++++++++-
 arch/riscv/boot/dts/spacemit/k1.dtsi               | 112 ++++---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts       | 170 ++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi       |  69 ++++
 arch/riscv/boot/dts/spacemit/k3.dtsi               | 369 ++++++++++++++++++++-
 7 files changed, 876 insertions(+), 79 deletions(-)
 create mode 100644 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
