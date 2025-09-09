Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9015CAC583
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 11:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0SzFvCEWog9IFPjNKYuGodgHloNDXwbqnFsUiM8yA64=; b=GTO7rOct6fmv8J
	iWucc0sa5HfiCQF97oiKEKzrP7Ggmf4gZp1o6lCE1MSVB9bTo0Y45KDSfH4jn9xiyVJ6Jj7kEP733
	aTdcGflzdCk22JIWl10XP0iMYGY3lHU0WbwT6+RcxHWwmwARqpZgzMA5VmgE7V3TADXVHGR7+U9bS
	p1sPazyp0BOSf//wf5ul/2B7hwwf07fdkDb0tOTtkgyDGShnczD/8nmpJkwwdfVMey3n/W6zJN0GU
	RFs+IrGqsoiSWNBe0i4R+rUBTOk9V3mLzYKHKcSw7mbGHESohQVJ4cuO9edEKg2DvfOhwSsZp4jNG
	ifxIwM0hPcgw422PgIgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwfd-00000006nCe-3j3L;
	Tue, 09 Sep 2025 11:37:57 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuSN-00000005soz-0KUi
	for linux-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 09:16:08 +0000
Received: from ofsar (unknown [116.232.18.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id A9D90340F50;
	Tue, 09 Sep 2025 09:16:01 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Yixun Lan <dlan@gentoo.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Brian Masney <bmasney@redhat.com>,
	Alex Elder <elder@riscstar.com>,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk: spacemit: Updates for v6.18
Date: Tue,  9 Sep 2025 17:15:03 +0800
Message-ID: <20250909171321-GYC7803064@gentoo.org>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_021607_160889_83E583C1 
X-CRM114-Status: UNSURE (   5.87  )
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

Hi Stephen,

   Please pull SpacemiT's clock changes for v6.18

Yixun Lan

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://github.com/spacemit-com/linux tags/spacemit-clk-for-6.18-1

for you to fetch changes up to d02c71cba7bba453d233a49497412ddbf2d44871:

  clk: spacemit: ccu_pll: convert from round_rate() to determine_rate() (2025-08-26 06:07:45 +0800)

----------------------------------------------------------------
RISC-V SpacemiT clock changes for 6.18

- Convert to use determine_rate()
- Fix clocks of SSPA

----------------------------------------------------------------
Brian Masney (3):
      clk: spacemit: ccu_ddn: convert from round_rate() to determine_rate()
      clk: spacemit: ccu_mix: convert from round_rate() to determine_rate()
      clk: spacemit: ccu_pll: convert from round_rate() to determine_rate()

Troy Mitchell (2):
      dt-bindings: clock: spacemit: CLK_SSPA_I2S_BCLK for SSPA
      clk: spacemit: fix sspax_clk

 drivers/clk/spacemit/ccu-k1.c                  | 29 ++++++++++++++++++++++----
 drivers/clk/spacemit/ccu_ddn.c                 | 11 ++++++----
 drivers/clk/spacemit/ccu_mix.c                 | 12 ++++++-----
 drivers/clk/spacemit/ccu_pll.c                 | 10 +++++----
 include/dt-bindings/clock/spacemit,k1-syscon.h |  2 ++
 5 files changed, 47 insertions(+), 17 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
