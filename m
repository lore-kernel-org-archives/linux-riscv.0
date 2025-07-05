Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDA6C8303C
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Jul 2025 05:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/rW9OG31kSWgM0/lakm/K9UlNMRl6t3quBa6s6JwJbA=; b=ppJPFapiXiox0k
	I/m7mkxsO0/7PWcVZQa5m8/48b47j7XbB1EYlYYuFywhJB8S8V7c3aXGcrQPtqr0Y9/eGfH3nlAAr
	K7Zt6HHPI+5F5enMnoAo4FwOHirFxDXkrqpUYmMQFpGHbqkx62QQ6sims+1kNNDox/+fYWij3PCdr
	U61PwvGUuYcuQvHZH45xzasR/ZCbe6J8l1eYQyyL54miVNzKN7WPavVPydeyALlqkbOMKHL6PhEmo
	rCoBq2CPpitIIwkl4GGUQPPzDU1rUd1z47IopnuvJZYnel37+fdNaMoyC6yhY5quyh0hOEiXlH0NJ
	RCDYtw08qgC6TwQzdqTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXvKa-0000000G5db-0rAe;
	Sat, 05 Jul 2025 05:20:56 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXvKX-0000000G5dF-39RI
	for linux-riscv@lists.infradead.org;
	Sat, 05 Jul 2025 05:20:55 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 04A6B25E27;
	Sat,  5 Jul 2025 07:20:49 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GWUZ7DIhG7RL; Sat,  5 Jul 2025 07:20:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751692848; bh=0GwYxnGGoLNupxKVT8wRGKrtsp6rnrmBbWE444PArkg=;
	h=From:To:Cc:Subject:Date;
	b=MSoVsqftLfTKwDshYxYI0jXrTommOflOBQCSgWjBsay/UVW6gFDoGsUCJ2S77+A0I
	 8OoR/n9G1M/9PEF2oVDX0XtRXk7dCp39mlKR3/SP/aE166xZjs86WCKbTFLYi/KuuS
	 GROa90cWUi3B9TAE68P15tFd1kJQJ2hTC1sQnEb37xcyd5tFiB7KR9Isaoil1g2jG3
	 ebjxMDD3wkMLBVFSWdoZvEPmTVtTxrVAUdQFa96+O+o535LLUaWq9F0K4uD1MmHtVa
	 Dy6EHq6K5zvxSyfyF3i5bAIwmB0hdRePI6UhE3uNILhqw0WkQzyjAw1ABK+9H3wQgi
	 MS9oKwPHpzr0Q==
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Yangtao Li <frank.li@vivo.com>
Cc: linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH] clk: thead: th1520-ap: Correctly refer the parent for c910 and osc_12m
Date: Sat,  5 Jul 2025 05:20:28 +0000
Message-ID: <20250705052028.24611-1-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_222054_207006_957954C7 
X-CRM114-Status: UNSURE (   9.54  )
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

clk_orphan_dump shows two suspicious orphan clocks on TH1520 when
booting the kernel with mainline U-Boot,

	$ cat /sys/kernel/debug/clk/clk_orphan_dump | jq 'keys'
	[
	  "c910",
	  "osc_12m"
	]

where the correct parents should be c910-i0 for c910, and osc_24m for
osc_12m.

The correct parent of c910, c910-i0, is registered with
devm_clk_hw_register_mux_parent_data_table(), which creates a clk_hw
structure from scratch. But it's assigned as c910's parent by
referring &c910_i0_clk.common.hw, confusing the CCF since this clk_hw
structure is never registered.

Meanwhile, osc_12m refers the external oscillator by setting
clk_parent_data.fw_name to osc_24m, which is obviously wrong since no
clock-names property is allowed for compatible thead,th1520-clk-ap.

For c910, refer c910-i0 by its name; for osc_12m, refer the external
clock input by index. This eliminates these orphan clocks.

Fixes: ae81b69fd2b1 ("clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks")
Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/clk/thead/clk-th1520-ap.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index ebfb1d59401d..74da1a61e6f0 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -427,7 +427,7 @@ static struct ccu_mux c910_i0_clk = {
 };
 
 static const struct clk_parent_data c910_parents[] = {
-	{ .hw = &c910_i0_clk.common.hw },
+	{ .index = -1, .name = "c910-i0" },
 	{ .hw = &cpu_pll1_clk.common.hw }
 };
 
@@ -582,7 +582,14 @@ static const struct clk_parent_data peri2sys_apb_pclk_pd[] = {
 	{ .hw = &peri2sys_apb_pclk.common.hw }
 };
 
-static CLK_FIXED_FACTOR_FW_NAME(osc12m_clk, "osc_12m", "osc_24m", 2, 1, 0);
+struct clk_fixed_factor osc12m_clk = {
+	.div		= 2,
+	.mult		= 1,
+	.hw.init	= CLK_HW_INIT_PARENTS_DATA("osc_12m",
+						   osc_24m_clk,
+						   &clk_fixed_factor_ops,
+						   0),
+};
 
 static const char * const out_parents[] = { "osc_24m", "osc_12m" };
 
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
