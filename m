Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CBF9CD5BB4
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 10:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rz0/3zWxwOZZUcBdk0J2TnLvqYgmpdPZ7k3JZmcugsM=; b=iWlBDaFqzOIIxe
	h04EX3VgdQhlKwsEqlS/NXt90af2bOGdui+wGVFqgqhfqyMdNTtyBlrPyTiDf0HyebGBOmly/itGy
	dx87C+ZCLG8DosNzD+btpunZ0+Dk7EFbTL1Mw04ETEEl5HZ5iCLlTgMoRLtc8YsN3v1gsbMjVHkUP
	SWW7ofp/L82eK08KltC8PukDyJCvGjPEd1F3C58QcwbKfelOWXFhbq/rxn+8A5B51kxDyjJS2L85R
	37XZ773gDegolQzdsjCoIftxbRyo1SHYUQJyNpEKKijYAD8ZXRpmJE9VezRO/dzN9WgDHEPnqa7Hu
	sfj61U162nFlSoKFv+5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJUMJ-0000000AGBt-2Zvi;
	Thu, 13 Nov 2025 10:15:19 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJUMH-0000000AGBM-2gfi
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 10:15:18 +0000
Received: from ofsar (unknown [116.232.48.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 80DDB340861;
	Thu, 13 Nov 2025 10:15:11 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: soc@kernel.org
Cc: Yixun Lan <dlan@gentoo.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Alex Elder <elder@riscstar.com>,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V SpacemiT Devicetrees for v6.19
Date: Thu, 13 Nov 2025 18:14:50 +0800
Message-ID: <20251113180732-GYC0846694@gentoo.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_021517_705180_8006BCC0 
X-CRM114-Status: UNSURE (   8.10  )
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

Hi Arnd,

   Please pull SpacemiT's DeviceTree changes for v6.19

Yixun Lan

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://github.com/spacemit-com/linux tags/spacemit-dt-for-6.19-1

for you to fetch changes up to 5a97a38c22799a802f33001dcb022d2942fe4a41:

  riscv: dts: spacemit: define all missing I2C controller nodes (2025-11-12 18:53:26 +0800)

----------------------------------------------------------------
RISC-V SpacemiT DT changes for 6.19

- Add Uart and I2C nodes
- Add P1 PMIC nodes
- Add MusePi Pro board support
- Add OrangePi R2S board support
- Enable eeprom for BPI-F3
- Enable QSPI on BPI-F3
- Enable Ethernet and PDMA on OrangePi RV2

----------------------------------------------------------------
Alex Elder (4):
      riscv: dts: spacemit: enable the i2c8 adapter
      riscv: dts: spacemit: define fixed regulators
      riscv: dts: spacemit: define regulator constraints
      riscv: dts: spacemit: enable K1 SoC QSPI on BPI-F3

Aurelien Jarno (3):
      riscv: dts: spacemit: enable the i2c2 adapter on BPI-F3
      riscv: dts: spacemit: add 24c02 eeprom on BPI-F3
      riscv: dts: spacemit: add i2c aliases on BPI-F3

Hendrik Hamerlinck (1):
      riscv: dts: spacemit: add UART pinctrl combinations

Michael Opdenacker (3):
      riscv: dts: spacemit: add Ethernet and PDMA to OrangePi RV2
      dt-bindings: riscv: spacemit: Add OrangePi R2S board
      riscv: dts: spacemit: Add OrangePi R2S board device tree

Troy Mitchell (4):
      dt-bindings: riscv: spacemit: add MusePi Pro board
      riscv: dts: spacemit: add MusePi Pro board device tree
      riscv: dts: spacemit: reorder i2c2 node
      riscv: dts: spacemit: define all missing I2C controller nodes

 .../devicetree/bindings/riscv/spacemit.yaml        |   2 +
 arch/riscv/boot/dts/spacemit/Makefile              |   2 +
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    | 172 ++++++++
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts     |  79 ++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts   |  90 ++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts   |  52 +++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       | 465 ++++++++++++++++++++-
 arch/riscv/boot/dts/spacemit/k1.dtsi               | 122 ++++++
 8 files changed, 982 insertions(+), 2 deletions(-)
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
