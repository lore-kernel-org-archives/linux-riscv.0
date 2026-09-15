Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAC5C88E75
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 00:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HeUQ54iQV1NDJPN0ISZGzZQnAG3LDzVWXYl4ZO6T9z8=; b=Oaaoj7kFZPKZPB
	L4+ZWFb5lqqxNQwrIcXG7Wgiwsejjl3qJZuA8Y457od+v+KXenSyg1mi5Gqjc/K3MhLUX2HKs4J+6
	piCsWq0Njn542hoCRN0QFtsA4HGi45oEwpsVq9Cb6neLup2/izftwaieoy6r6IvYha8t6q56oh1T7
	rl8pre4v9JKvXVMWlIeYsYLadDJTK8jUr/XeiQBF3Uva7ndjAYX8dLdaDE6+1EL0nxEw4K7rG+shh
	1mPDY3eT4Csk8pqQdC3K4AjwCcoxMrgMgc/D3mjr/WUxNRUcQGRrd4ZLp27D9jGSdDSq3lH/pKra0
	D0OP4I8AYyVC2CIwtr0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6HS2-00000004vY0-3gkU;
	Tue, 15 Sep 2026 00:55:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6HS1-00000004vXt-09Xb
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 00:55:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 36F1E6025F;
	Tue, 15 Sep 2026 00:55:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D4BD1F000FF;
	Tue, 15 Sep 2026 00:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789433707;
	bh=Tf8gpeOGXwytQI4icz7EmnHY2nhPKKBH8/ezYoe6tNw=;
	h=From:To:Cc:Subject:Date;
	b=OFzD2BL05c4u59hKoBA5Vj54zoI0X3pLunCcyW8gaJl2EZDKj2LLleo3adLx1gRKS
	 FXxs5yeNrhZenizw0ybOAjIV/60ePOD9F+1/hSQL3wXCyInQcQ2FIwcMAaCE8eoZ4R
	 r5l3c1OR5kvq+HDn0JqKtk/YeuDzZ20haGfutUAMOb+VEhmSJqiLwgXmCe6pyU1Tle
	 cDHSJZpYHnEzJWwAAOttwv8Eav09XL1VsHD5fC5yUwn2krlaZ0TOrN+fKQcaRmRYwY
	 NeW4yN5EKhT+TRxFhdmDhfMaOsfOI8SAfvzDsLpN+p/3HViXU7erAz2UUecocR7x/c
	 J2ZfscTty7jrw==
From: Yixun Lan <dlan@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk: spacemit: Fixes for v7.3
Date: Tue, 15 Sep 2026 00:54:54 +0000
Message-ID: <20260915004456-KYC0593228@kernel.org>
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

   Please pull SpacemiT's clock Fixes for v7.3. This solve an issue
that will trigger PLL clock closed due to the frequency not available
in kernel side, a shutdown of PLL will cause the system hang.


Yixun Lan

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/ tags/spacemit-clk-fixes-for-7.3-1

for you to fetch changes up to d558af8ee0bb1b2e88e696be84adb93cf2b7be6f:

  clk: spacemit: k3: add CPU PLL rate tables (2026-09-15 00:09:55 +0000)

----------------------------------------------------------------
RISC-V SpacemiT clock fixes for v7.3

- Add CPU PLL rate tables

----------------------------------------------------------------
Troy Mitchell (1):
      clk: spacemit: k3: add CPU PLL rate tables

 drivers/clk/spacemit/ccu-k3.c | 92 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
