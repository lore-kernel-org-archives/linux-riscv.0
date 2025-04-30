Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6ADC3ABA5
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 01:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tEVY5sZG6m/Q5n4kxmspbkvixQDYSg9bYjibNjClgWE=; b=2OaYvR/uBjyl3V
	cC6QNDcHPbeJZTHpuHhBpg6ASkhJRp2VEEcRsm1WbbjSt2qZmVtOHSWWuny+CgLG6XA+WOoxoGTND
	PPJfLHlteUSF69elxUQWMZM9TUqBACVu5McoFRhTIAE99B+rBFTydjRB+sjxFzgOXuIqCXcZnKnPT
	zZV9X0lPkyVU47g2o9kYpI9mYwZfy4DYb8CAd2OIdOVIzP05d7Y09thqTTEt9wU2sxokGs2h6K20L
	UR5h81K5Gy4WBReAeEPGAgEXjCD7IHoKq7psrYO+9lnrKLyWeXbpAJlWnYZd/QI9XnQx28I/3CNOf
	gS7hjFz6tC+yIv7FlR+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9wGo-0000000BRrS-3jKg;
	Wed, 30 Apr 2025 01:29:54 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9wGm-0000000BRr3-44Ef
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 01:29:54 +0000
Received: from localhost (unknown [116.232.147.253])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id CAD4D340C40;
	Wed, 30 Apr 2025 01:29:50 +0000 (UTC)
Date: Wed, 30 Apr 2025 01:29:41 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: spacemit@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, Haylen Chu <heylenay@4d2.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alex Elder <elder@riscstar.com>
Subject: [GIT PULL] clk: spacemit: Add K1 SoC clk driver for v6.16
Message-ID: <20250430012941-GYA288294@gentoo>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_182953_037611_73019CEB 
X-CRM114-Status: UNSURE (   8.69  )
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

Hi Stephen, Mike

  Here is clock driver added for SpacemiT K1 SoC, please pull for v6.16

Yixun Lan (dlan)

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://github.com/spacemit-com/linux tags/spacemit-clk-for-6.16-1

for you to fetch changes up to 49625c6e4d90a9221127c49a11eb8c95732bb690:

  clk: spacemit: k1: Add TWSI8 bus and function clocks (2025-04-17 03:22:56 +0800)

----------------------------------------------------------------
RISC-V SpacemiT clock changes for 6.16

- Add clock driver for K1 SoC
- Add TWSI8 clock, workaround the read quirk

----------------------------------------------------------------
Haylen Chu (4):
      dt-bindings: soc: spacemit: Add spacemit,k1-syscon
      dt-bindings: clock: spacemit: Add spacemit,k1-pll
      clk: spacemit: Add clock support for SpacemiT K1 SoC
      clk: spacemit: k1: Add TWSI8 bus and function clocks

 .../devicetree/bindings/clock/spacemit,k1-pll.yaml |   50 +
 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |   80 ++
 drivers/clk/Kconfig                                |    1 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/spacemit/Kconfig                       |   18 +
 drivers/clk/spacemit/Makefile                      |    5 +
 drivers/clk/spacemit/ccu-k1.c                      | 1164 ++++++++++++++++++++
 drivers/clk/spacemit/ccu_common.h                  |   48 +
 drivers/clk/spacemit/ccu_ddn.c                     |   83 ++
 drivers/clk/spacemit/ccu_ddn.h                     |   48 +
 drivers/clk/spacemit/ccu_mix.c                     |  268 +++++
 drivers/clk/spacemit/ccu_mix.h                     |  218 ++++
 drivers/clk/spacemit/ccu_pll.c                     |  157 +++
 drivers/clk/spacemit/ccu_pll.h                     |   86 ++
 include/dt-bindings/clock/spacemit,k1-syscon.h     |  247 +++++
 15 files changed, 2474 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
 create mode 100644 drivers/clk/spacemit/Kconfig
 create mode 100644 drivers/clk/spacemit/Makefile
 create mode 100644 drivers/clk/spacemit/ccu-k1.c
 create mode 100644 drivers/clk/spacemit/ccu_common.h
 create mode 100644 drivers/clk/spacemit/ccu_ddn.c
 create mode 100644 drivers/clk/spacemit/ccu_ddn.h
 create mode 100644 drivers/clk/spacemit/ccu_mix.c
 create mode 100644 drivers/clk/spacemit/ccu_mix.h
 create mode 100644 drivers/clk/spacemit/ccu_pll.c
 create mode 100644 drivers/clk/spacemit/ccu_pll.h
 create mode 100644 include/dt-bindings/clock/spacemit,k1-syscon.h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
