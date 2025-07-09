Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86232C83F09
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jul 2025 01:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=31UaHv94VfZ7Q6M2RWyD92+Y2dDtE313yPuJuIpA5+I=; b=EppD/qWuCkwHQ/
	jM2Oteok8DlIn333zIdM37DGM5jLCkuy6Lh+Vd7wwQGC1djYzHiyaXvp/gLLg6En+v5IR29+GvyXm
	5P8Tk52t9ZibfzYDm41QLbbZvCrQIldBhljyogE0ZDseLWM9M7ua14xojyGdBM4E3AIWbXiUHcp7Y
	WzeqyYdCgH6I/8HGHixXrITNXz3tU12ya/LWa3HA0KcjNX18+gPd8Yvt1MqtBPiW6zzFiDz/NzR5n
	zri/+eoNVy8ffIzRmfSGdi8mzBjU6a6s8Qmbly7Ycpasux1pPYIUrki6Iqp04G0avGBE+BbL3GPUu
	1OEHxkjiF9cVkVYHmopw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZJPO-0000000759r-0R4z;
	Wed, 09 Jul 2025 01:15:38 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZJPL-0000000758c-0tDz
	for linux-riscv@lists.infradead.org;
	Wed, 09 Jul 2025 01:15:36 +0000
Received: from localhost (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 639E1342044;
	Wed, 09 Jul 2025 01:15:32 +0000 (UTC)
Date: Wed, 9 Jul 2025 01:15:28 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Alex Elder <elder@riscstar.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Haylen Chu <heylenay@4d2.org>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: [GIT PULL] clk: spacemit: add changes for v6.17
Message-ID: <20250709011528-GYA487904@gentoo>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_181535_277892_6AE1E47A 
X-CRM114-Status: GOOD (  10.70  )
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

Hi Stephen,

 Here is clock changes for v6.17, please pull.

 Basically, what we've added here are two changes:

  1) Mark pll1_d8 clock as critical to prevent it from being shut down
     in the resource withdrawal path once the probe phase fails

  2) Extend K1 clock framework to support reset auxiliary devices, and
     also route the reset driver via clock tree to avoid shared tags,
     please see discussion here[1] with reset maintainer for more
     details if needed.

  Thank you!


Link: https://lore.kernel.org/r/3732050b6b756868543012c1a1cebbe7cce74d61.camel@pengutronix.de [1]

Yixun Lan

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://github.com/spacemit-com/linux tags/spacemit-clk-for-6.17-1

for you to fetch changes up to c79550f69f0f21be069385c20cd6490b862ba2a5:

  Merge tag 'spacemit-reset-for-6.17-1' of https://github.com/spacemit-com/linux (2025-07-07 22:07:15 +0800)

----------------------------------------------------------------
RISC-V SpacemiT clock changes for 6.17

- Mark clock of pll1_d8 as critical
- Add reset support for K1 SoC

----------------------------------------------------------------
Alex Elder (6):
      dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
      soc: spacemit: create a header for clock/reset registers
      clk: spacemit: set up reset auxiliary devices
      clk: spacemit: define three reset-only CCUs
      clk: spacemit: mark K1 pll1_d8 as critical
      reset: spacemit: add support for SpacemiT CCU resets

Yixun Lan (1):
      Merge tag 'spacemit-reset-for-6.17-1' of https://github.com/spacemit-com/linux

 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |  27 +-
 drivers/clk/spacemit/Kconfig                       |   1 +
 drivers/clk/spacemit/ccu-k1.c                      | 242 ++++++++--------
 drivers/clk/spacemit/ccu_mix.h                     |  11 +-
 drivers/reset/Kconfig                              |   9 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-spacemit.c                     | 304 +++++++++++++++++++++
 include/dt-bindings/clock/spacemit,k1-syscon.h     | 141 ++++++++++
 include/soc/spacemit/k1-syscon.h                   | 160 +++++++++++
 9 files changed, 766 insertions(+), 130 deletions(-)
 create mode 100644 drivers/reset/reset-spacemit.c
 create mode 100644 include/soc/spacemit/k1-syscon.h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
