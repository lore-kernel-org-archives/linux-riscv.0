Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01523606A32E
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 13:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ge/tolZP;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SvPfONrf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=vHVx/WblL7MKMFYUGG3/b0zs/0g4rpagKrXicIcJ7SY=; b=ge/tolZP2xtVDDYMcuq+qzJj6T
	JFP1byi2fuBkhQ4P6c7rIFhCaealiv3ml9QC5NBcNtq+yQa0QEOGNg/cKZn/V1n1JvcMsMy9C3zCZ
	ZbpT0EhkH1s8ZqcsEnZkG6xaMJfQpdJSMOB89NqWg9VHP8TupXjRTw8BIGFt2OiARQBiT965xXwCl
	w5r9Jub4g6SK4LcbGGA3bI4hcj0upyzzNmp6Hz00sQvTPWyhcHTN2p2jSPy6V4soMJJVa9/DpHY/1
	18hJzqjDsMgratai5Xz6iJ//G5xzvj6ySOxGk4MQLAM6jG2Fqu2Em3lKQeRMnZ3eCB97RDI6cNOhr
	lLM/B7Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWw1c-0000000GGlc-3eHD;
	Fri, 27 Nov 2026 13:30:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWw1b-0000000GGlV-2J01
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 13:30:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4EF8B45811;
	Fri, 27 Nov 2026 13:30:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 568EC1F00919;
	Fri, 27 Nov 2026 13:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795786203;
	bh=RhbYBTCFnUIkHjspi7K1/DTnz9+g0EGatlkywDux9+A=;
	h=From:To:Cc:Subject:Date;
	b=SvPfONrf5kP7D4rgL3bnw5aGbvo6hAGlxLV6MLIWMETk0yFKbwWorN03YZC6W1JH+
	 M+UTacVhU5suwingZnUH0LopRnMMKOdI+jUgegtfoSLlOuv65nRBm9LzMy6fFgAqXf
	 2DpUmb4Bth+jk9Eq3iacsJwq4PNo6cTa2hur8FdLj7gBDMmEepQg9NJ9neIc8HYfKF
	 WGzKg70TV86dpHxeb42EHBO7s8FgChfIf2uDMLOIGzxBDYMXoviOOa3pX6AmCoWIAg
	 R8bgow/izwm443Oqh3T2QToD0TacF8V2d9pInNSpgjDUzCnupfvUsCSwog6EXcosXH
	 aJ5GCD2cIjpDQ==
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
Subject: [PATCH v2] clk: tenstorrent: Use prepare/unprepare ops for Atlantis PLL
Date: Fri, 27 Nov 2026 13:29:36 +0000
Message-ID: <20261127132958.2714501-1-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
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

Convert atlantis_clk_pll_ops to use .prepare, .unprepare, and
.is_prepared instead of .enable, .disable, and .is_enabled so that the
PLL lock wait executes under the sleeping prepare_lock rather than
atomic enable_lock.

Fixes: 23c8ebc95284 ("clk: tenstorrent: Add Atlantis clock controller driver")
Closes: https://sashiko.dev/#/bug/linux-980395a6-f282-478a-bf18-b5695a725735
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
v1 => v2:
 - Switch from .enable/.disable/.is_enabled to .prepare/.unprepare/.is_prepared so PLL lock polling runs under the sleeping prepare_lock instead of enable_lock, per Brian Masney's review.
 - Keep regmap_read_poll_timeout() rather than switching to the atomic variant.
 - Drop Anirudh Srinivasan's v1 Reviewed-by tag due to the implementation change.
 - Drop the other patches from v1 that were already applied or superseded.

 drivers/clk/tenstorrent/atlantis-prcm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/tenstorrent/atlantis-prcm.c b/drivers/clk/tenstorrent/atlantis-prcm.c
index eccc8015da23..ee7044e3f1df 100644
--- a/drivers/clk/tenstorrent/atlantis-prcm.c
+++ b/drivers/clk/tenstorrent/atlantis-prcm.c
@@ -269,7 +269,7 @@ static const struct clk_ops atlantis_clk_fixed_factor_ops = {
 	.recalc_rate = atlantis_clk_fixed_factor_recalc_rate,
 };
 
-static int atlantis_clk_pll_is_enabled(struct clk_hw *hw)
+static int atlantis_clk_pll_is_prepared(struct clk_hw *hw)
 {
 	struct atlantis_clk_pll *pll = hw_to_atlantis_pll(hw);
 	u32 val, en_val, cg_val;
@@ -284,7 +284,7 @@ static int atlantis_clk_pll_is_enabled(struct clk_hw *hw)
 	       !(val & PLL_CFG_BYPASS_BIT);
 }
 
-static int atlantis_clk_pll_enable(struct clk_hw *hw)
+static int atlantis_clk_pll_prepare(struct clk_hw *hw)
 {
 	struct atlantis_clk_pll *pll = hw_to_atlantis_pll(hw);
 	u32 val, en_val, cg_val;
@@ -332,7 +332,7 @@ static int atlantis_clk_pll_enable(struct clk_hw *hw)
 				  pll->config.cg_reg_enable);
 }
 
-static void atlantis_clk_pll_disable(struct clk_hw *hw)
+static void atlantis_clk_pll_unprepare(struct clk_hw *hw)
 {
 	struct atlantis_clk_pll *pll = hw_to_atlantis_pll(hw);
 
@@ -378,10 +378,10 @@ static unsigned long atlantis_clk_pll_recalc_rate(struct clk_hw *hw,
 }
 
 static const struct clk_ops atlantis_clk_pll_ops = {
-	.enable = atlantis_clk_pll_enable,
-	.disable = atlantis_clk_pll_disable,
+	.prepare = atlantis_clk_pll_prepare,
+	.unprepare = atlantis_clk_pll_unprepare,
 	.recalc_rate = atlantis_clk_pll_recalc_rate,
-	.is_enabled = atlantis_clk_pll_is_enabled,
+	.is_prepared = atlantis_clk_pll_is_prepared,
 };
 
 static int atlantis_clk_gate_shared_enable(struct clk_hw *hw)
-- 
2.56.1.839.g22a8290db9-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
