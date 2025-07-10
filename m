Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1620CC83F1D
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 10:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AjgRieQpc3ppc229+DSKBVWxaX2Sx3w90UUX5+wMfDw=; b=xeU3pxKpdAzakP
	yWIUFUXEpgc29THIswWNlARq1eJufgtGVr4syY6brOZltb4GMHqWSQawCunivkqghJ4zlZO34OjJ1
	WC0MOw7rq1a1fcRwqW+5/QDn29UObWkO8yRnu8EHv3Ez09GHHoxqZPRhQExwxkTJ9a597JgISVOLz
	pCdUXo231PW5XtJp0etuliaeKyXFcPlDJsvj2GGhJt9Vm6MlRWuVbDgPNZpTiX7YL61u1aoBiU6SM
	Wi+HVGi54SPT7SA5JyrupwOoxwGA81tp1LYQVdp9z1KVLRWP3Z6AYoFkLbLEJ+9U/5SdUDal9KdNr
	jGs1Pthy5y2QoPh0s3eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZonx-0000000BWYU-3Vi4;
	Thu, 10 Jul 2025 10:47:05 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnTY-0000000BKS3-3MZe
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 09:21:57 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9AC5620E4F;
	Thu, 10 Jul 2025 11:21:55 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jVRQWH_OPQYW; Thu, 10 Jul 2025 11:21:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1752139314; bh=8jv9si5Dm29nc6cOMexjPtTBEsERysb0Yr5v4WL1nzo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ArHXbaU/7hmjWGqDFqA9UhVGwP8lArLw26t0gSveZ6cI7JqQd1CQ+apBUBAhlK3E9
	 l1EHwYOI68jWpY2MtcJp93hAaKjp770fz9FxUz7VGLGhNwSZ7RTJQjK80DG0BET+jw
	 dbpWJQg3oAJuG4FtiOI+GzqlnK3S9jB2hmM1DgdBnQZIsvWsRHkVlSb8F1MiKBV2Tq
	 5iC7G7RMMv6y2Eqhx+KxzOFGrBrgxnj+fHXMPRKbeQFcZFFmRcKk8ixSCalaw5V5o3
	 JJRoGz8BWaesCGy4GrFLsJYczK/Crme0E7QFHds06iifIIJs5014suMrYxc1eK9LIq
	 Z3hGJHFT8YE1w==
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
Subject: [PATCH v2 1/2] clk: thead: th1520-ap: Correctly refer the parent of osc_12m
Date: Thu, 10 Jul 2025 09:21:34 +0000
Message-ID: <20250710092135.61049-2-ziyao@disroot.org>
In-Reply-To: <20250710092135.61049-1-ziyao@disroot.org>
References: <20250710092135.61049-1-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_022156_967941_60F5E7C1 
X-CRM114-Status: UNSURE (   8.57  )
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

The "osc_12m" fixed factor clock refers the external oscillator by
setting clk_parent_data.fw_name to osc_24m, which is obviously wrong
since no clock-names property is allowed for compatible
thead,th1520-clk-ap.

Refer the oscillator as parent by index instead.

Fixes: ae81b69fd2b1 ("clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks")
Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/clk/thead/clk-th1520-ap.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index ebfb1d59401d..42feb4bb6329 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -582,7 +582,14 @@ static const struct clk_parent_data peri2sys_apb_pclk_pd[] = {
 	{ .hw = &peri2sys_apb_pclk.common.hw }
 };
 
-static CLK_FIXED_FACTOR_FW_NAME(osc12m_clk, "osc_12m", "osc_24m", 2, 1, 0);
+static struct clk_fixed_factor osc12m_clk = {
+	.div		= 2,
+	.mult		= 1,
+	.hw.init	= CLK_HW_INIT_PARENTS_DATA("osc_12m",
+						   osc_24m_clk,
+						   &clk_fixed_factor_ops,
+						   0),
+};
 
 static const char * const out_parents[] = { "osc_24m", "osc_12m" };
 
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
