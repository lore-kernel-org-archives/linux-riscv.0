Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C593CA0EE4
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Aug 2025 08:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r9IiBiuJDOx0luMDECDvL4kN4El0jXktMTcsMLaxJHo=; b=eTzOZIH7Js18OM
	fSnlNu67GmHgVdRaRBtlgtZ8fj7FxnHcbu9iZZpaL4usJxRcXZP+PaIzF284atJrZ3HFUfCMa50ET
	6XCPKq2afYVFGQy6SWgF+4cDC4QfvDAmzNAhjCtCHrmSTQegJYjwJX6QZ6XYyle8KWbCL0EP055Zu
	zKGEs6/OY0geDpz9LY7epfKlEBzJ5v1BaBND99a6ONnWQbzop02JG7nh6WkPnTOjMnT7WmQIkAUtY
	n1HDePym5F12xwGpIyDf10XiguYEuilfi8pJASO/yiT7TMgO1aEBad+MCVmOcKkpYuwmkGuLUKoem
	FZrB5B2t4p0psKX9cENg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCXU-00000004Jnb-1Tat;
	Sat, 16 Aug 2025 08:45:24 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCXR-00000004Jn1-3bjv
	for linux-riscv@lists.infradead.org;
	Sat, 16 Aug 2025 08:45:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755333918; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GZ/6WbEBc6H8WI9yyDGOPSO8rx3bGj1cSKYWeD6HVXmoMbjXkugFGECxDGyYHNkjbChPDfuUjGwgpz/daCQpyU2C72hrDB8OQmdKALStLCJTgzTdxk+KpBYErAe3g6PYSGV3od4MwmCkEIeNeMf9GnX8y6YOV7zaw64g83liv7A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755333918; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Nv6EMwQ3hnEwU4qVzZNwEJO9BBi52COvmPnVyeNmGOg=; 
	b=RxRgscksHR702yFfVatsh4O2OhCiLhJmGL7tOpH0iQYWnSSxI850jxOi540kMGdFT2LLG5f37b3gYoCHyJe8SQx72VABJOQGpcbZhmvO5oEfmoh3y/tgmCcroH80IvHyVG3Ht+xrCVMzI9P0cpUxxJBzPsVUe0ZUXbsEl64jAH0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755333918;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Nv6EMwQ3hnEwU4qVzZNwEJO9BBi52COvmPnVyeNmGOg=;
	b=q1n7ZxVIRNwzJYobcx4V6yCrh44ZcGOftxvN3382pRTtsj2c9me2iyjT4YN1v0f3
	m/G1L4GEb1LbyXJiv7THiGJyCLKy4ksDJ+r1Pll1KLjRw5YmSGit8Jh/TWcKPK9kI4F
	wKMkZoWw3WxO6ONOenzPGLhvWCmSSBfLlaABcWe2dymezdLgqNs+cSwvbbq+/JfcZEp
	HtNfHc0vcRe4DMT3i3gXXHCVynBGTXjsK5aCDuERpvnEGwrieYs2Gg+TxsK//nPWIDX
	veEz/HoYTvkHjuIGwFY3NFBAfh0xNpBBX5Md2KROr20ijnVQOGSHskObffgdg5eWvnB
	WFlAGVrhRg==
Received: by mx.zohomail.com with SMTPS id 1755333915661293.24643184419165;
	Sat, 16 Aug 2025 01:45:15 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>,
	Troy Mitchell <troy.mitchell@linux.dev>
Subject: [PATCH v2 2/2] clk: thead: th1520-ap: fix parent of padctrl0 clock
Date: Sat, 16 Aug 2025 16:44:45 +0800
Message-ID: <20250816084445.2582692-3-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816084445.2582692-1-uwu@icenowy.me>
References: <20250816084445.2582692-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_014522_012235_8623D0A5 
X-CRM114-Status: UNSURE (   8.28  )
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

The padctrl0 clock seems to be a child of the perisys_apb4_hclk clock,
gating the later makes padctrl0 registers stuck too.

Fix this relationship.

Fixes: ae81b69fd2b1 ("clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks")
Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Reviewed-by: Drew Fustini <fustini@kernel.org>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.dev>
---
Changes in v2:
- Rebased on top of origin/master (a little newer than v6.17-rc1).
- Added an empty line to satisfy checkpatch.pl .
- Added Drew's and Troy's R-b.

 drivers/clk/thead/clk-th1520-ap.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index 4dbd1df9a86d4..8a5d699638379 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -798,13 +798,17 @@ static CCU_GATE(CLK_PERISYS_APB3_HCLK, perisys_apb3_hclk, "perisys-apb3-hclk", p
 		0x150, 11, CLK_IGNORE_UNUSED);
 static CCU_GATE(CLK_PERISYS_APB4_HCLK, perisys_apb4_hclk, "perisys-apb4-hclk", perisys_ahb_hclk_pd,
 		0x150, 12, 0);
+static const struct clk_parent_data perisys_apb4_hclk_pd[] = {
+	{ .hw = &perisys_apb4_hclk.gate.hw },
+};
+
 static CCU_GATE(CLK_NPU_AXI, npu_axi_clk, "npu-axi", axi_aclk_pd, 0x1c8, 5, 0);
 static CCU_GATE(CLK_CPU2VP, cpu2vp_clk, "cpu2vp", axi_aclk_pd, 0x1e0, 13, 0);
 static CCU_GATE(CLK_EMMC_SDIO, emmc_sdio_clk, "emmc-sdio", emmc_sdio_ref_clk_pd, 0x204, 30, 0);
 static CCU_GATE(CLK_GMAC1, gmac1_clk, "gmac1", gmac_pll_clk_pd, 0x204, 26, 0);
 static CCU_GATE(CLK_PADCTRL1, padctrl1_clk, "padctrl1", perisys_apb_pclk_pd, 0x204, 24, 0);
 static CCU_GATE(CLK_DSMART, dsmart_clk, "dsmart", perisys_apb_pclk_pd, 0x204, 23, 0);
-static CCU_GATE(CLK_PADCTRL0, padctrl0_clk, "padctrl0", perisys_apb_pclk_pd, 0x204, 22, 0);
+static CCU_GATE(CLK_PADCTRL0, padctrl0_clk, "padctrl0", perisys_apb4_hclk_pd, 0x204, 22, 0);
 static CCU_GATE(CLK_GMAC_AXI, gmac_axi_clk, "gmac-axi", axi4_cpusys2_aclk_pd, 0x204, 21, 0);
 static CCU_GATE(CLK_GPIO3, gpio3_clk, "gpio3-clk", peri2sys_apb_pclk_pd, 0x204, 20, 0);
 static CCU_GATE(CLK_GMAC0, gmac0_clk, "gmac0", gmac_pll_clk_pd, 0x204, 19, 0);
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
