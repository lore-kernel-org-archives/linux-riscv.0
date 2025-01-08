Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D91E77188
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 14:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a2twjyadPnJCXSrUS0T5w/dijkIGup7Op6KVrDoKxWM=; b=Ts3o1eJOW4S4VH
	0S/j9T14DWno40UyW3ym+AZzmvU1z2LHFy9j5MmNqj0RZIOqo4Bkk4IOnQViIbkNOrtNt9dxXjsaK
	9Buw7MPCAhHPVc1j6VLCmURdTvtHoQA0mziVDdFjD1Xp0QMezs7081Ut76WtkNIzzU8fdvTYvYtju
	t1l/3hL2VmoESQnemDC28J3eCkNmeBWGOmFEuLFPOL5zMtc9bn862h+fx4x7UUh8rLC3nLrULikaq
	Wxxy/nzW0xr8jitUyCtDabPLAipqVTlGXn21GZB4VKKWoKmR7IVmjfNbpyJu26XzzuFAO4OClQXU0
	8hfDUZeTuy3p0dwtpygQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVWw7-00000008m5u-1yya;
	Wed, 08 Jan 2025 14:21:31 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVWw4-00000008m5T-4Ayo
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jan 2025 14:21:30 +0000
Date: Wed, 8 Jan 2025 22:21:22 +0800
From: Yixun Lan <dlan@gentoo.org>
To: soc@kernel.org
Subject: [GIT PULL] RISC-V SpacemiT Devicetrees for v6.14
Message-ID: <20250108142122-GYA3300457@gentoo>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_062129_064125_E0E23493 
X-CRM114-Status: UNSURE (   9.65  )
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
Cc: Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Arnd Bergmann <arnd@arndb.de>, Inochi Amaoto <inochiama@gmail.com>, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Arnd,

Here is SpacemiT's device tree changes for 6.14 cycle.
All patches have been merged in linux-next tree for testing.

Please pull, thanks

Yixun Lan (dlan)

The following changes since commit 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8:

  Linux 6.13-rc3 (2024-12-15 15:58:23 -0800)

are available in the Git repository at:

  https://github.com/spacemit-com/linux/ tags/spacemit-dt-for-6.14

for you to fetch changes up to e7cd95ad8013bc232316bba0a52ea11ecd5c81bd:

  riscv: dts: spacemit: add pinctrl property to uart0 in BPI-F3 (2025-01-04 10:28:18 +0800)

----------------------------------------------------------------
RISC-V SpacemiT DT changes for 6.14
- basic device tree support
- pinctrl dt node info
- update MAINTAINERS info

----------------------------------------------------------------
Yangyu Chen (8):
      dt-bindings: riscv: Add SpacemiT X60 compatibles
      dt-bindings: riscv: add SpacemiT K1 bindings
      dt-bindings: timer: Add SpacemiT K1 CLINT
      dt-bindings: interrupt-controller: Add SpacemiT K1 PLIC
      riscv: add SpacemiT SoC family Kconfig support
      riscv: dts: add initial SpacemiT K1 SoC device tree
      riscv: dts: spacemit: add Banana Pi BPI-F3 board device tree
      riscv: defconfig: enable SpacemiT SoC

Yixun Lan (3):
      MAINTAINERS: setup support for SpacemiT SoC tree
      dt-bindings: serial: 8250: Add SpacemiT K1 uart compatible
      riscv: dts: spacemit: add pinctrl property to uart0 in BPI-F3

 .../interrupt-controller/sifive,plic-1.0.0.yaml    |   1 +
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   1 +
 .../devicetree/bindings/riscv/spacemit.yaml        |  28 ++
 Documentation/devicetree/bindings/serial/8250.yaml |   4 +-
 .../devicetree/bindings/timer/sifive,clint.yaml    |   1 +
 MAINTAINERS                                        |   9 +
 arch/riscv/Kconfig.socs                            |   5 +
 arch/riscv/boot/dts/Makefile                       |   1 +
 arch/riscv/boot/dts/spacemit/Makefile              |   2 +
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  22 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |  20 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               | 464 +++++++++++++++++++++
 arch/riscv/configs/defconfig                       |   1 +
 13 files changed, 558 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/riscv/spacemit.yaml
 create mode 100644 arch/riscv/boot/dts/spacemit/Makefile
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
 create mode 100644 arch/riscv/boot/dts/spacemit/k1.dtsi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
