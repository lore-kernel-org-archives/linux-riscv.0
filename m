Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2983EC3ABC5
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 04:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I6QgaSOp0d5PneHr9RcEUQhAqPXfu5X3VadOWQsKPlg=; b=G0Qe/T/QzbjHJE
	cnrcpx3/OW9b/p7/Ys+lm/hslI74ii6e7l/W0SXnYaWd1vUK6or3NDtBEY3jRbsKd2xZ00qQIbsiC
	+zcfoLlXI3bIhwKH9/2cHsvU6B8w4w6zxHQxWnWfAMEMofNqZ+mU+tayl7Ha+UPmD15p1+zT5zmls
	7IRvlMGtaL9Iyra9Vx8D9mWM2Q0JAH0B0/vFCftzLiYCm9MylaW7ZYtRbrJsZkifFbZn/niLF9Gbp
	768L4vXNofkb4pTZb5QvfGZqqpg8MwwL5a9QfoigT4slX866zfOFe7hR+gQRF8nMyScsf9jlld5sb
	TmODEJC4OJ0UtR4sVR9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF431-0000000E1Ud-35Du;
	Wed, 14 May 2025 04:48:51 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF42y-0000000E1Tn-2LPi
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 04:48:49 +0000
Received: from localhost (unknown [116.232.18.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C761234348B;
	Wed, 14 May 2025 04:48:45 +0000 (UTC)
Date: Wed, 14 May 2025 04:48:41 +0000
From: Yixun Lan <dlan@gentoo.org>
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: spacemit@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V SpacemiT Devicetrees for v6.16
Message-ID: <20250514044841-GYA524674@gentoo>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_214848_625751_D64BB2A6 
X-CRM114-Status: UNSURE (   8.45  )
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

  Please pull SpacemiT's device tree changes for v6.16, thanks

  Please note, there are clock dt-binding dependencies which also included 
in this PR, they are exactly same commits (same hash) which already queued
at clock's tree[1].

  Let me know if this works for you.

Link: https://lore.kernel.org/all/a28e4eca6e2a9522cb8e707845a9117b@kernel.org/ [1]

Yixun Lan (dlan)

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://github.com/spacemit-com/linux tags/spacemit-dt-for-6.16-1

for you to fetch changes up to 3aa64cd126b4fd298ba5d28227ea3f82cd6f541c:

  riscv: dts: spacemit: add gpio LED for system heartbeat (2025-05-14 11:43:59 +0800)

----------------------------------------------------------------
RISC-V SpacemiT DT changes for 6.16

- Add clock driver, fix for pinctrl/uart
- Add gpio support, enable LED heartbeat

----------------------------------------------------------------
Haylen Chu (3):
      dt-bindings: soc: spacemit: Add spacemit,k1-syscon
      dt-bindings: clock: spacemit: Add spacemit,k1-pll
      riscv: dts: spacemit: Add clock tree for SpacemiT K1

Yixun Lan (5):
      Merge tag 'spacemit-clk-binding-for-6.16' of https://github.com/spacemit-com/linux into spacemit-dt-for-6.16
      riscv: dts: spacemit: Acquire clocks for pinctrl
      riscv: dts: spacemit: Acquire clocks for UART
      riscv: dts: spacemit: add gpio support for K1 SoC
      riscv: dts: spacemit: add gpio LED for system heartbeat

 .../devicetree/bindings/clock/spacemit,k1-pll.yaml |  50 +++++
 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |  80 +++++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  11 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |   3 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               | 132 ++++++++++-
 include/dt-bindings/clock/spacemit,k1-syscon.h     | 247 +++++++++++++++++++++
 6 files changed, 514 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
 create mode 100644 include/dt-bindings/clock/spacemit,k1-syscon.h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
