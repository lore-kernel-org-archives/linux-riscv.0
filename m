Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311E6CD8C85
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 05:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W5dwWYL+fkR1hkNxwKaFrPypD1odrqz8zt4kD879BPE=; b=DMWxGBzLY/ON3W
	qUD2FzdEYJ/H0Uuk6O8ErQM21a3D9VNYzvaCwpThiNyQ4vOMArUny1YtQZ/HDzjEfWX4H/+ew30Rp
	WscqhL7CF3L6hfAgOCvIKRbkUnec6Hfb8lxouLVozXIk+om1LuLjWAiWAqVq2Q8ZwhYmOv6G+tBVn
	BTmiiFxkRlLSbLulnzXB634GS7x+h2seWGskCl9aRXZsIKhdYGxjT55IwThcK+RiCAvfDj0kbcK1j
	Q7UKUz4F7Vc5sD9nkktDc/EmWdOW52MetpGNTuFfqOTkVYQnjAjXjac2i4wtlvttPzX1SkDs4GJAf
	pAcONuWmVvodBFVIdWUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWp0c-00000004ks6-0rpW;
	Tue, 09 Jun 2026 05:28:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWp0a-00000004kro-1MrP
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 05:28:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B088601E1;
	Tue,  9 Jun 2026 05:28:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A41301F00893;
	Tue,  9 Jun 2026 05:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780982895;
	bh=pWm1PQaUMUu2vYKwEIHJbUmNHXUOxaLWmpXmVmHx+1w=;
	h=From:To:Cc:Subject:Date;
	b=lk2ZNslH4On4YST7so7b0SIDEVSio8kaBlWk3qlMejvv57HauWBeXtrvz2uiqoq6F
	 8SrfCX5eFNsbu9SC8hSIPn4KCp1lRHWclQir7BnsVkmS/uSmFtGcF1aa7zKzh732kr
	 ondmSQIqAghzzYSFUiyUbDKQlkYBllqY1QuDmFduaCUKVHNFsitExKRGx8W1vYA6HN
	 cOJKjwak8hR2IWsmU6mvtoJG3RZwaWqNow7nqYLvtj82bkTQ7O6dTFWdxmcyDgaEDE
	 shYBPkSpOLzUlcTmkLoilIXGlMJdbqxAQ/dDBkaBvD/MvWcSkd0U9hxj6EBqzlmqfp
	 lbAgU88aMwGzw==
From: Yixun Lan <dlan@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Yixun Lan <dlan@gentoo.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk: spacemit: Updates for v7.2
Date: Tue,  9 Jun 2026 05:28:09 +0000
Message-ID: <20260609052422-KYC4837748@kernel.org>
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

From: Yixun Lan <dlan@gentoo.org>

Hi Stephen,

   Please pull SpacemiT's clock changes for v7.2
All clock changes are related to PCIe for K3 SoC.
   Hope this isn't too late..

Yixun Lan

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://github.com/spacemit-com/linux spacemit-clk-for-7.2-1

for you to fetch changes up to a37c75d7b5bb7f3344b0e639b313ac5ace6244ff:

  clk: spacemit: k3: Add PCIe DBI clock (2026-06-02 07:16:59 +0000)

----------------------------------------------------------------
RISC-V SpacemiT clock changes for 7.2

- Switch parent clock of PCIe
- Fix PCIe clock register offset
- Add PCIe DBI clock

----------------------------------------------------------------
Yixun Lan (4):
      clk: spacemit: k3: Switch to pll2_d6 as parent for PCIe clock
      clk: spacemit: k3: Fix PCIe clock register offset
      dt-bindings: soc: spacemit: k3: Add PCIe DBI clock IDs
      clk: spacemit: k3: Add PCIe DBI clock

 drivers/clk/spacemit/ccu-k3.c                  | 30 +++++++++++++++++---------
 include/dt-bindings/clock/spacemit,k3-clocks.h |  5 +++++
 include/soc/spacemit/k3-syscon.h               |  4 ++--
 3 files changed, 27 insertions(+), 12 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
