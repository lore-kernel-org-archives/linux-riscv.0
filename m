Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B13C9830C
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jan 2026 21:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8T7vR8BigR/3L3sNhYMuSOGqVLrJWu/x7BjrMajdewE=; b=t/KtFuzakdewOV
	vK61Lpi189qS5I2KDL3pJDyq+oPL3G6lfWcW8Tq9V9kALCDRSBI1OfTYFyZxfhunaGC+QH7l2vg5L
	8A+rWn0JxEPohFQCQLWcLQfHVoId2HzTNLgLkW86Be7sY4ow+TilmWtfbOy2MoCV9viikPJl6kVWL
	vtNUu9OtU2C5L2ZFB/acoEO3Pv1AJNfqeuRCsvMcJ6lgotySzYKBevG1DAMzpoVqPLCOqZGmg68LS
	cNOBPqDrsEs2kV8tjyV+Uu5QkSAKPK8szPiK4FdPEU8fVxgkiKo5p0MhzmlIch1tWpLO2Ro2uLpDI
	Wl/Pb+R8AO7v5hqVSSpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhaVb-000000012GZ-2RL7;
	Sun, 18 Jan 2026 21:40:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhaVa-000000012GN-2mT2
	for linux-riscv@lists.infradead.org;
	Sun, 18 Jan 2026 21:40:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E88866011E;
	Sun, 18 Jan 2026 21:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8119CC19423;
	Sun, 18 Jan 2026 21:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768772427;
	bh=3KcJA5y3aDda85HQ9x24E/tcaEKX+wmZBDGQdJygmqI=;
	h=Date:From:To:Cc:Subject:From;
	b=iAhYBeE/551WEbJ9qfQYpp2YmJTbU6Ky+Y3T1ZsYbj1pddNjjMA7caWnaRmoq6nul
	 HZargsEH8DoXSqicVQspw0G3rFwMOm+WTb3hW91sc1nE6vpZncilPRRbECV6F3eBHn
	 7M4kstJsXkuC9zyVnXjlN3ZYuz6tTKfJixMQbaQIRfMMXfZpC9XNBPIUE6Bo9czQ1e
	 3bflq/gIjH1bb6GjBvtA4WY+D74nj5qXMDkVhZ1f43bHViEN60rTUV4IxEHHSAr7UB
	 U0c53+gDb6R1vD6FHxXcpehM55+RvTZL5yskf0cHxXr0Aox4Zst6+Dm/ZofyjMsQ/A
	 Oxy39WG9kewHg==
Date: Sun, 18 Jan 2026 13:40:25 -0800
From: Drew Fustini <fustini@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Yao Zi <me@ziyao.cc>
Subject: [GIT PULL] clk: thead: Updates for v6.20
Message-ID: <aW1TSYOA0KgYN4rw@x1>
MIME-Version: 1.0
Content-Disposition: inline
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

Hi Stephen, sorry for not sending this sooner. There are not many
changes for this cycle.

Thanks,
Drew

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git tags/thead-clk-for-v6.20

for you to fetch changes up to baf4fc7c03bd0f68c768cfe27829674bd060c6b4:

  clk: thead: th1520-ap: Support CPU frequency scaling (2026-01-14 17:26:47 -0800)

----------------------------------------------------------------
T-HEAD clock changes for v6.20

There is just one set of changes for thead this cycle. They add support
for CPU scaling on the T-HEAD TH1520 by allowing the PLL rate used for
the CPU cluster to be reconfigured. The changes have been tested in
linux-next.

Signed-off-by: Drew Fustini <fustini@kernel.org>

----------------------------------------------------------------
Yao Zi (6):
      dt-bindings: clock: thead,th1520-clk-ap: Add ID for C910 bus clock
      clk: thead: th1520-ap: Poll for PLL lock and wait for stability
      clk: thead: th1520-ap: Add C910 bus clock
      clk: thead: th1520-ap: Support setting PLL rates
      clk: thead: th1520-ap: Add macro to define multiplexers with flags
      clk: thead: th1520-ap: Support CPU frequency scaling

 drivers/clk/thead/clk-th1520-ap.c               | 350 +++++++++++++++++++++++-
 include/dt-bindings/clock/thead,th1520-clk-ap.h |   1 +
 2 files changed, 344 insertions(+), 7 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
