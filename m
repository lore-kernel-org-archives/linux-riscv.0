Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DFF5C83F17
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 10:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tDvfbjPlAYMdymC1MZtWD0HgSkwYXdEI5FLfqwomUE8=; b=SyfF2U52xmaNBp
	dJnHhaxYWpvonNKUWJhPVIo4c/+sdgTsjxShuirpo5Xp5Z+we/ZR/G7HnYWmrQR5RWdON6Rtv9K0t
	KmLWBvZ5iWKgU126w4fqDPR2biPZRdI5yKQqQlfnOc7Lf5tGMIm6GrGFAVywHuyY4egBif6hHi9XM
	W82V/XZKS2NkBwEsd/gQdfUXACc/32OFomKPhdLJ6amfqufcT3RnmT0hESpONJnuwTFsS2fDJsiZY
	HdCy6qcaGbiee74VRSANqWyAbBOi+8nPSmcRvkXa0uTE1AxBM6qoaFnq9YhLub7kQJYnxk0EElRj8
	KFg+8zWZ0sXJUZb+Z/3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZony-0000000BWYg-1npP;
	Thu, 10 Jul 2025 10:47:06 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnTb-0000000BKSf-3W9A
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 09:22:01 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A3EF120D9B;
	Thu, 10 Jul 2025 11:21:58 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jWSHtPzeUuRu; Thu, 10 Jul 2025 11:21:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1752139318; bh=YWiKfFUpvY0CTSU08o1Vxmml9LYBSTSxuK4Xhb+tbVU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=B1jj4Udrnr8mHo8CZcvxkAtHXrp4J7GrDWUcMyH722pC+J30FTb3M3XcKkRlzQ9ga
	 KgICluIXnabEbGFRD7awmtE/6kUJpMHopz5JCkc9CsPn4JTMa+/RMv/t67KQnUp+7I
	 JCVmXnqZMWQe2u/p9IOqblLIivktz//obRGVKbAnNkhcv4CHHF32YKTvpmVJiM1KMD
	 vpHoKOPLFGCTumAVXOM3OUMqSaL40H96vtAo+ck57jAjWBxRArT7/C6docPRKv4nwH
	 r5Ae8gLNXIXo5nM85BBr8+aFmIklItqZBCBfyjMVH3sThyau48MlOAHtsWSTqHdSPn
	 DZznr9sQRHHCA==
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
Subject: [PATCH v2 2/2] clk: thead: th1520-ap: Correctly refer the parent of c910-i0
Date: Thu, 10 Jul 2025 09:21:35 +0000
Message-ID: <20250710092135.61049-3-ziyao@disroot.org>
In-Reply-To: <20250710092135.61049-1-ziyao@disroot.org>
References: <20250710092135.61049-1-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_022200_009686_647DA524 
X-CRM114-Status: GOOD (  10.54  )
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

The correct parent of c910, c910-i0, is registered with
devm_clk_hw_register_mux_parent_data_table(), which creates a clk_hw
structure from scratch. But it's assigned as c910's parent by
referring &c910_i0_clk.common.hw, confusing the CCF since this clk_hw
structure is never registered.

Refer c910-i0 by its name instead to avoid turning c910 into an orphan
clock.

Fixes: ae81b69fd2b1 ("clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks")
Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/clk/thead/clk-th1520-ap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index 42feb4bb6329..41ed72b1a915 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -427,7 +427,7 @@ static struct ccu_mux c910_i0_clk = {
 };
 
 static const struct clk_parent_data c910_parents[] = {
-	{ .hw = &c910_i0_clk.common.hw },
+	{ .index = -1, .name = "c910-i0" },
 	{ .hw = &cpu_pll1_clk.common.hw }
 };
 
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
