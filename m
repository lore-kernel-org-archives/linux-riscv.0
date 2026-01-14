Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A1FD30CDB
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 01:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+ME3WkeFjDlTSriO7QkaeBKWHSpUpDbidKQSJXxf2rg=; b=J9Muu/n1C3x1cl
	x5gckjz9FWFsw9aca+64AekyhHj01Xglg7TaCxAuXhjLDYWrSiHGqJRB7f6nbFBIKOYfDTyqjeoJL
	qWbYshqhxh/Kaezg6Y3EbvHNxX6BTVj56uvCpdMbTbsSluuxb4ReuaHDqN+PkfVRlWgH/TkUqoGmq
	bzyzoDJRSj9Th2kvGOKPO5wbW8Pif1WiyE+yt0G2WkmZM3imkHWMUgbvuXCZvi5l1Qx6Yu8QhCGrF
	R0o0Zo3kDlRPymlpmszql7nblWXfypRJAw/+SU8/yKgdVTGWDi2ShWoiuwTFscAT5bgFLZHQUL11D
	NE5m4nAFCWLqQK1SrjRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfpvh-00000007xPS-3Jcg;
	Wed, 14 Jan 2026 01:44:13 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfpve-00000007xP6-1U3q
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 01:44:11 +0000
Received: from ofovo.local (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E7692340FEC;
	Wed, 14 Jan 2026 01:44:05 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Yixun Lan <dlan@gentoo.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Guodong Xu <guodong@riscstar.com>,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk: spacemit: Updates for v6.20
Date: Wed, 14 Jan 2026 09:43:33 +0800
Message-ID: <20260114092742-GYC7933267@gentoo.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_174410_682903_0F52D32A 
X-CRM114-Status: GOOD (  11.58  )
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

   Please pull SpacemiT's clock changes for v6.20, This PR basically adds
support for SpacemiT new K3 SoC, while doing this I've created an immutable
tag (spacemit-clkrst-v6.20-3) for reset driver in case it also needs to be
merged during same merge window, otherwise everything is normal.

Yixun Lan


The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://github.com/spacemit-com/linux tags/spacemit-clk-for-6.20-1

for you to fetch changes up to e371a77255b837f5d64c9d2520f87e41ea5350b9:

  clk: spacemit: k3: add the clock tree (2026-01-09 10:48:17 +0800)

----------------------------------------------------------------
RISC-V SpacemiT clock changes for 6.20

- Fix driver to build as module
- Refactor to extract common code
- Add clock support for new K3 SoC

----------------------------------------------------------------
Inochi Amaoto (2):
      clk: spacemit: Respect Kconfig setting when building modules
      clk: spacemit: Hide common clock driver from user controller

Yixun Lan (13):
      clk: spacemit: prepare common ccu header
      reset: spacemit: fix auxiliary device id
      Merge tags 'spacemit-clkrst-v6.20-1' and 'spacemit-clkrst-v6.20-2' into spacemit-clkrst-v6.20
      Merge tag 'spacemit-clkrst-v6.20-1' into spacemit-clk-for-6.20
      clk: spacemit: extract common ccu functions
      clk: spacemit: add platform SoC prefix to reset name
      Merge tag 'spacemit-clkrst-v6.20-2' into spacemit-clk-for-6.20
      dt-bindings: soc: spacemit: k3: add clock support
      clk: spacemit: ccu_mix: add inverted enable gate clock
      clk: spacemit: ccu_pll: add plla type clock
      clk: spacemit: k3: extract common header
      Merge tag 'spacemit-clkrst-v6.20-3' into spacemit-clk-for-6.20
      clk: spacemit: k3: add the clock tree

 .../devicetree/bindings/clock/spacemit,k1-pll.yaml |    9 +-
 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |   14 +-
 drivers/clk/spacemit/Kconfig                       |   20 +-
 drivers/clk/spacemit/Makefile                      |   12 +-
 drivers/clk/spacemit/ccu-k1.c                      |  192 +--
 drivers/clk/spacemit/ccu-k3.c                      | 1487 ++++++++++++++++++++
 drivers/clk/spacemit/ccu_common.c                  |  177 +++
 drivers/clk/spacemit/ccu_common.h                  |   11 +
 drivers/clk/spacemit/ccu_ddn.c                     |    1 +
 drivers/clk/spacemit/ccu_mix.c                     |   21 +-
 drivers/clk/spacemit/ccu_mix.h                     |   12 +
 drivers/clk/spacemit/ccu_pll.c                     |  119 ++
 drivers/clk/spacemit/ccu_pll.h                     |   57 +-
 drivers/reset/reset-spacemit.c                     |    2 +-
 include/dt-bindings/clock/spacemit,k3-clocks.h     |  390 +++++
 include/soc/spacemit/ccu.h                         |   21 +
 include/soc/spacemit/k1-syscon.h                   |   12 +-
 include/soc/spacemit/k3-syscon.h                   |  273 ++++
 18 files changed, 2609 insertions(+), 221 deletions(-)
 create mode 100644 drivers/clk/spacemit/ccu-k3.c
 create mode 100644 drivers/clk/spacemit/ccu_common.c
 create mode 100644 include/dt-bindings/clock/spacemit,k3-clocks.h
 create mode 100644 include/soc/spacemit/ccu.h
 create mode 100644 include/soc/spacemit/k3-syscon.h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
