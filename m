Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9A7606A68C
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 16:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yM1oOkQ3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gtvcV6th
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mvlHkM+JVvd9oOTvkQE/7DreJxThRH93pMwpPyEIDIs=; b=yM1oOkQ3jtvh88wwAxeTaY51JM
	OOB1E81YcYRlEBJP6TjUpVljDjeMh53s0xacKgKAfq01k4q1H6kj+BUNQc7rBCrgyDnIzwYpMWorP
	crFwSxGaPL7pmlxWi1+5SXfDgW022DXGbuoIc6/KA3ZxGwQKOtOVudJ1hMZWA4DkNxrcTJLU6cEUJ
	JRzxi0e+DS3mYSAxLQhmsfOQerbY32M4DNgL0vEDog1KbDbGRX2SlRveUlXOwDYi8sfnLI9wJQI/k
	CMusrOmdYbJi7IXKiguhSQ5mDQ6+0+UYZ0axb8XYWn0PKTkmRzdiABAz6zDh1sQBDKCAIiyK9Ip8B
	w6kasnDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXEl-00000004FbD-3B8j;
	Mon, 23 Nov 2026 16:49:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXEk-00000004Fam-37BT
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 16:49:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A76540D3C;
	Mon, 23 Nov 2026 16:49:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 296DD1F000C4;
	Mon, 23 Nov 2026 16:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795452590;
	bh=f+VbVKcweoeen5B0jtSKCf/3jM4Xab72+IxryIhEnYs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gtvcV6thoKzdYK0dmH/+9OZnYe1QbfYPD/u5kw2Gc4b38bHylZOnW4IEtBisrjWt6
	 M/DvxmvSWrO679bnGfa0+JhBxVaSxGmU1hd4f+x57N8Zre5h9m+3jDP+q148LQ3kxf
	 afPlA9aNE8J62B8Q+fF0hCOOwtComG8VCSDfukUaiqF9BPFszYeWiBWf2CmMqark8Q
	 qV3Ka4UPqH+cWwcUHO0oohWnGzFj4fHdcZEVZS3eBw9X5dYN+wCKLvzmd8cOovi9dl
	 hEING+hxNAyOQbRiTx/Vqu52HDbRWhQbTb2d5e+Lr6/1GnLm3xIen4Isb0yalwno1c
	 d7GMMVYmOp+Kg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Drew Fustini <fustini@kernel.org>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 08/10] clk: tenstorrent: Poll atomically in atlantis_clk_pll_enable()
Date: Mon, 23 Nov 2026 16:47:41 +0000
Message-ID: <20261123164834.3330320-9-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
In-Reply-To: <20261123164834.3330320-1-lee@kernel.org>
References: <20261123164834.3330320-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Common Clock Framework invokes .enable callbacks in atomic context
with interrupts disabled and enable_lock held.  In atlantis_clk_pll_ops,
atlantis_clk_pll_enable() is registered as the .enable callback yet
waits for PLL lock using regmap_read_poll_timeout() with a 500 us sleep
interval, triggering a sleep-in-atomic bug via usleep_range().

Since the PRCM regmap is backed by MMIO, use
regmap_read_poll_timeout_atomic() instead.

Fixes: 23c8ebc95284 ("clk: tenstorrent: Add Atlantis clock controller driver")
Closes: https://sashiko.dev/#/bug/linux-980395a6-f282-478a-bf18-b5695a725735
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/clk/tenstorrent/atlantis-prcm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/tenstorrent/atlantis-prcm.c b/drivers/clk/tenstorrent/atlantis-prcm.c
index eccc8015da23..d9155f133713 100644
--- a/drivers/clk/tenstorrent/atlantis-prcm.c
+++ b/drivers/clk/tenstorrent/atlantis-prcm.c
@@ -313,10 +313,11 @@ static int atlantis_clk_pll_enable(struct clk_hw *hw)
 			   PLL_CFG_EN_BIT, PLL_CFG_EN_BIT);
 
 	/* Step 3: Wait for PLL lock */
-	ret = regmap_read_poll_timeout(pll->common.regmap,
-				       pll->config.reg_offset, val,
-				       val & PLL_CFG_LOCK_BIT,
-				       PLL_BYPASS_WAIT_US, PLL_LOCK_TIMEOUT_US);
+	ret = regmap_read_poll_timeout_atomic(pll->common.regmap,
+					      pll->config.reg_offset, val,
+					      val & PLL_CFG_LOCK_BIT,
+					      PLL_BYPASS_WAIT_US,
+					      PLL_LOCK_TIMEOUT_US);
 	if (ret) {
 		pr_err("PLL failed to lock within timeout\n");
 		return ret;
-- 
2.56.1.750.gf70dc682cf-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
