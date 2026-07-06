Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E8AC43458
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 20:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RUdRcufKPntDZsMsTu5YUJ+EoyN9+RLZtR0WqMhn5X4=; b=IpsRmxH91SgMV9
	EyrU6KUn+CiFIEnjjYy3ZM07gtJ7/AQbWsHA/zaeXOHosdxUvpcVS4dU6L2ZEjKMYPEoMA4rey9e1
	BZv78EE0NBZUcR3ELywt2Dq11wmyydQHNwFZSVEEsVxHrFn3Q50MUx/KuebWOCHtvq4J0VZCVmL6j
	uqUipmeYKevVV+wnWTXmcaPFesIwejAn9RGZfNOB15RKfJ9+Z5+R2sbFIFVDPcBz63V7HSSrgl26A
	/JN3Tk7vGzb7HXe/mfDVxBjz5fmf5izw3FmeJEgUl8KY4ZzIawoFEPnCLg62JUEaOIMEDkfiPdY2o
	plGF1O5w7szTI6eccjBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgq38-0000000DZEO-42lZ;
	Mon, 06 Jul 2026 20:36:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgq37-0000000DZEF-46or
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 20:36:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 60CBD61831;
	Mon,  6 Jul 2026 20:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D271F000E9;
	Mon,  6 Jul 2026 20:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783370177;
	bh=CnbXOCT1WGn9UITK2bontSHU7zyzH+gzQkCjzXQv3ak=;
	h=From:To:Cc:Subject:Date;
	b=TIjo6xi+XLf0kYcvC0OzsTFrqzySzXNJ1ijbCQJtmjAicMEp//vyCIs2EeiWsGsOC
	 vbMz+yU+kE14z8yHbvuAopR2XqTnAy6vHhnck+CW0g/cEy5HImJcBfS29JEXCodzyN
	 g9wfpyJZC/nZ7lgJ9fYfct8vybJ/QZyyiqxI0FG19glQDqG7HBHsOLy4h3vG2A+hVd
	 MeFktm8tmDsGiL9GcH11Z2AVL4RYWntqoDklrTUC8R1Bseh/s2AgwfHvmH5aLkec5y
	 VipVjPIuIJQ3KheRQr/ahZIOtAAcGFfKp6pvVgxJrrWnwS4LAfLv8eybJIIUEXUYVw
	 6J52Xd77iDb6w==
From: Yixun Lan <dlan@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk: spacemit: fixes for v7.2-1
Date: Mon,  6 Jul 2026 20:35:51 +0000
Message-ID: <20260706203425-KYC2957292@kernel.org>
X-Mailer: git-send-email 2.54.0
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

   Please pull two small SpacemiT's clock fixes for v7.2
First patch for USB2 clock fix need to go in pair with USB2 reset fix, the
reset part patch was already accepted by Philipp Zabel as a fix for v7.2.
Second patch fixes a system hang due to HDMA clock being shut off.
   Thank you

Yixun Lan

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/ tags/spacemit-clk-fixes-for-7.2-1

for you to fetch changes up to eb525edd48907795c0d4e498ff57ad168070b289:

  clk: spacemit: k3: set hdma clock as critical (2026-07-06 19:45:17 +0000)

----------------------------------------------------------------
RISC-V SpacemiT clock fixes for v7.2

- Fix USB2 bus clock
- Fix HDMA clock

----------------------------------------------------------------
Yixun Lan (2):
      clk: spacemit: k3: fix USB2 bus clock
      clk: spacemit: k3: set hdma clock as critical

 drivers/clk/spacemit/ccu-k3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
