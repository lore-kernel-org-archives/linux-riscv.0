Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A5BC02183
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 00:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M+WzJH79h2IF1Nrefkn7UcqOgofwA4gGt5DSRwO8D1o=; b=haPXQonmIszrAl
	soSk/6hrT6sj6KoV81LiLsRPtBMMO23gi4E6PUczDNpjkL/nreYrI+PHJQES4gScIgOfDYrAi++kP
	oyUGKySyKqVpoqDvoUyYP54a6CmHkw7bLzVlXcmX9Vm7Hq5BhsXKM2sRtechzOhczz5gb1mPed602
	o31aQckONt4wGf2D0P90Y1Em75fUqsOn4Qe2ENdrLuovuJXjhfbQZeOh227ZW6DLpNpsQmeGG9hg8
	R6d2emT/Ki46yFOBvu+WjFqPWzPvZJQz9pkUnevW/P+MmMtJM5Ru3xtkBj7MGJBbPRaOuwNValKN2
	JZ41yR8Si4Luz2opv8VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYaY4-0000000GiRi-2hTW;
	Fri, 17 Jan 2025 00:49:20 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYaY2-0000000GiRJ-2AJq
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jan 2025 00:49:19 +0000
Date: Fri, 17 Jan 2025 00:49:11 +0000
From: Yixun Lan <dlan@gentoo.org>
To: soc@kernel.org
Subject: [RESEND/GIT PULL] RISC-V SpacemiT Devicetrees for v6.14
Message-ID: <20250117004911-GYA25021@gentoo>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_164918_576863_5D39749E 
X-CRM114-Status: UNSURE (   9.73  )
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
Cc: Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Inochi Amaoto <inochiama@gmail.com>, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Arnd,

Here is resend version of SpacemiT's device tree changes for 6.14 cycle.
All patches have been merged in linux-next tree for testing.

In this PR, I've rebased to 6.13-rc2 along with dts aliases fixed.

Please pull, thanks

Yixun Lan (dlan)

The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:

  Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)

are available in the Git repository at:

  https://github.com/spacemit-com/linux spacemit-dt-for-6.14-1

for you to fetch changes up to 3d72d603afa72082501e9076eed61e0531339ef8:

  riscv: dts: spacemit: move aliases to board dts (2025-01-17 08:05:42 +0800)

----------------------------------------------------------------
RISC-V SpacemiT DT changes for 6.14

- rebase to 6.13-rc2
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

Yixun Lan (4):
      MAINTAINERS: setup support for SpacemiT SoC tree
      dt-bindings: serial: 8250: Add SpacemiT K1 uart compatible
      riscv: dts: spacemit: add pinctrl property to uart0 in BPI-F3
      riscv: dts: spacemit: move aliases to board dts

 .../interrupt-controller/sifive,plic-1.0.0.yaml    |   1 +
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   1 +
 .../devicetree/bindings/riscv/spacemit.yaml        |  28 ++
 Documentation/devicetree/bindings/serial/8250.yaml |   4 +-
 .../devicetree/bindings/timer/sifive,clint.yaml    |   1 +
 MAINTAINERS                                        |   9 +
 arch/riscv/Kconfig.socs                            |   5 +
 arch/riscv/boot/dts/Makefile                       |   1 +
 arch/riscv/boot/dts/spacemit/Makefile              |   2 +
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  26 ++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |  20 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               | 452 +++++++++++++++++++++
 arch/riscv/configs/defconfig                       |   1 +
 13 files changed, 550 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/riscv/spacemit.yaml
 create mode 100644 arch/riscv/boot/dts/spacemit/Makefile
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
 create mode 100644 arch/riscv/boot/dts/spacemit/k1.dtsi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
