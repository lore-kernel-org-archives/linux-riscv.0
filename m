Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 173DAC87FCF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 10:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c7bOTxcFw+3xw4Re6Uj8NERvg8mNhdhdDA9oeB6iRx8=; b=3/3bXTIaTFIhm2
	12PFg1+GgxvOfM1VErvfobSmIGVNlkaiAnbTCvJPggDx/T4+SOoDmO1RE3IFc3LuebGumBUsq51yY
	05DAL4wc8iS3I2ZXBk58GuCqbhnhOdrZhcjbsBELVvvLixuMR7i4XRTR3wtCGIMxTUzq6sLoYuTeY
	sKHuOkwRo9xv+F3ZRs+37/Dczux2pILLBlGiWJSPWm7ifbFI7bmb7822ZAVdYR/iVhJzHbfN8r2p0
	7jHLvYxdXkIjN92n/eiIwq55Qb33SuGlkln+TxBS6O8wfaOLDDtaIvUxnr4VIDKu27BJAaITF7gWk
	ya1mW5xKEF6WK9S2SqHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8Wg-0000000DLYw-3fLZ;
	Wed, 13 Aug 2025 10:16:10 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um5tQ-0000000Cvcp-3FGF
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 07:27:30 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755070043; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Wwb3hLG4RZqGskVBpAUotm2xu9JzuoQmaiHSvUAXdKgEtSJ7FY/4Y1BeWWhNV2sbT7zVe/AXsF1XPcC4Z4p9/OsKjXot7XFUDwg7YXuVdxCEmfvF6mFKwuXoCTvRAS2DKlyjB1MLIyCmGh2bUY+2bEWmJ+BvGTRVQd4VMLZIzbI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755070043; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ndGRIgyqpSoyEUU8zgnuxG9P6Dpgn6Lze4upIdgAB94=; 
	b=efjvs8JL0prlmwrd259yGTJZtnu7Y4uQXmTtAYTnbePRDEOTjAb6QPFT6pQKKHF5RUZgqvtVjZz91XOMcUSOyQDlXkMZXPnh0YyK09QKjgriVt5NcLgJV5OvKMv3fOgYOC6fcZoMlZCI8AKXwAqWUHLyuqCYcOZn4n47TrhV90o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755070043;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ndGRIgyqpSoyEUU8zgnuxG9P6Dpgn6Lze4upIdgAB94=;
	b=FYPI5oTPPGpG0FGzGJBcE2IrCwEeYjC1rCOfndyR+2/yb5lWbjcNVQ3wlTGSmgLR
	szRgCeKqfYXUdDbGFb/LkRy6WAVHIXQEmnBE4uMoodlIgKyWwEYtSKx3Cm00gqyD5Im
	4+3Xh6mpziTyemFoqbda2xnZB8h4AUTji3VucXzmX+d1o05Y7hf0v9GyA7N5oGgidfM
	dx50zl8VZ61Q+YqmQEM6a+vcYLw8sACIwhwS7lVdjULZKIYkorQsfCpg9q3hQotkKtO
	4LPaYUQTrmQhWTdkSzd5uklGIboNoPFfrY2q2pDYURNLhbbatyqjerMykt5sHMsdI+m
	TqrelN0Kig==
Received: by mx.zohomail.com with SMTPS id 1755070041223966.9782012385351;
	Wed, 13 Aug 2025 00:27:21 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Yao Zi <ziyao@disroot.org>,
	Han Gao <rabenda.cn@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 0/3] clk: thead: Changes to TH1520 clock driver for disp
Date: Wed, 13 Aug 2025 15:26:59 +0800
Message-ID: <20250813072702.2176993-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_002728_857141_B0AD4CE8 
X-CRM114-Status: UNSURE (   8.22  )
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

This patchset is my changes to the TH1520 clock driver, mainly for
supporting the display controller.

The first two are functionality additions, with the first one adding
support for enabling/disabling PLLs (for DPU PLL) and the second one
adding support for changing DPU dividers.

The 3rd one is to address hang issues met when testing the DPU driver
w/o clk_ignore_unused command line option.

The 4th patch that used to be in v1 is dropped, makes this patchset
purely display-related.

This patchset has a dependency (a 0th one) [1].

[1] https://lore.kernel.org/linux-riscv/20250809-fix_clocks_thead_aug_9-v1-1-299c33d7a593@samsung.com/

Icenowy Zheng (3):
  clk: thead: add support for enabling/disabling PLLs
  clk: thead: support changing DPU pixel clock rate
  clk: thead: th1520-ap: set all AXI clocks to CLK_IS_CRITICAL

 drivers/clk/thead/clk-th1520-ap.c | 146 +++++++++++++++++++++++-------
 1 file changed, 114 insertions(+), 32 deletions(-)

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
