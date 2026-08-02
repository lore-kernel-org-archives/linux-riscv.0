Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC8CC5516F
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Aug 2026 01:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lfLivcJ7+Wfrpio/uEOhyqiG1wfj52sjyEDnSqxL9qg=; b=DCIhEZ+mHizGsY
	fCdxmwqARbnRTFfSoALVhzJMCIY4WLF70vzfDomg/Oqx21AF5uEdNJ74qz9J2/qUW3FMKXg7ZQ+Lz
	IbxxQHg7lmE7lJvllCkJQ1R57039PvTFSPynR1Ub7MWBbydraspfPZoiFMdRSPt+idCP1fyZJ1LFl
	6l1RyJ9KeL8l3fY6x9ni9h3R9MyjfFuockRCgV0h0gntTLyDZTjsf43o6Ry4RQcScZ7rwIb1HB1OA
	yIZobeI02LdfJHBylMoHbInvULsj9aHairTtoWYqsOMq05poeW5z2rWsJw1hcgo7NjbRgcXXbt7vW
	3AsFBBJ+EqgJQorNSVZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqLER-0000000FFwB-315A;
	Sun, 02 Aug 2026 01:43:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqLEQ-0000000FFw3-2qIA
	for linux-riscv@lists.infradead.org;
	Sun, 02 Aug 2026 01:43:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8DEBE6057A;
	Sun,  2 Aug 2026 01:43:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455451F00AC4;
	Sun,  2 Aug 2026 01:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785634992;
	bh=JvY/mdB5yRnOKiw25wWjtLwiyFo46PBV6J701GGT7eE=;
	h=From:To:Cc:Subject:Date;
	b=kP8pRBQH5TLwzf+z11OwISdnx5KlEf++B1+4K0WKkGPrHug6dbS2VhO4lfbTvv1EW
	 qTCmvWZFZMF6RGUtflF1Y89E5nvj/a5RNoS/mdHQCKBMFQvpwkR8mVZYmVY1LihNA4
	 M5xezKqlPFjmIJVwCl58WwBLtmFMvYdlaF2KzkeHHV3gyW8WEuGFddh27VQ92KDrIx
	 7jZpfq8h1YYo5YqWe9T/5Ycc6bHoIAt+39sSUoWTZROuhJUQKpd7G/HNmGS6QzPqdC
	 nEArEbIlVffp6fjQu3kTyloWNsPxcqubZA0FaWiv3koIWIILeJmsN6UIIBsUDbPAI/
	 nZNDic5QhGFHA==
From: Yixun Lan <dlan@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Brian Masney <bmasney@redhat.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk: spacemit: Updates for v7.3
Date: Sun,  2 Aug 2026 01:42:52 +0000
Message-ID: <20260802014217-KYC2734409@kernel.org>
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

Hi Stephen,

   Please pull SpacemiT's clock changes for v7.3

Yixun Lan

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/ tags/spacemit-clk-for-7.3-1

for you to fetch changes up to 8a7d4b1924d2a424b1a6fe69de4f9464ee1fb485:

  clk: spacemit: k3: fix missing /2 factor in i2s sysclk dividers (2026-07-29 02:42:06 +0000)

----------------------------------------------------------------
RISC-V SpacemiT clock changes for 7.3

- Add clock for UFS controller
- Add new I2S clock and fixes

----------------------------------------------------------------
Troy Mitchell (3):
      dt-bindings: soc: spacemit: k3: add i2s_sysclk, i2s_bclk_factor and i2s1_sysclk_src IDs
      clk: spacemit: k3: fix i2s clock topology
      clk: spacemit: k3: fix missing /2 factor in i2s sysclk dividers

Yixun Lan (3):
      clk: spacemit: k3: fix parent clock of UFS aclk
      dt-bindings: soc: spacemit: k3: Add clock ID for UFS refclk
      clk: spacemit: k3: Add UFS refclk clock

 drivers/clk/spacemit/ccu-k3.c                  | 41 +++++++++++++++++---------
 include/dt-bindings/clock/spacemit,k3-clocks.h |  4 +++
 include/soc/spacemit/k3-syscon.h               |  3 +-
 3 files changed, 33 insertions(+), 15 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
