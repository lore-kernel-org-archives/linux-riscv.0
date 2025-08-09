Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24F4C87FCF
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Aug 2025 17:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:To:Message-Id:MIME-Version:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=RAEBcDYpBz0BSz0NUtV73t/hJ5yMqg3gETfELa8pO7k=; b=ic0jUJc/mGUMln
	7cZ202Cnt8u0+XZadb9uRtqKjWvq7oxe1L1EE+76/Q6/3HZ0kaFdY9yKPafCR/KH2mqcSPPMOPVfP
	vkaH6hNk3X6UL26eUsQ3XVAu/lFUIrg2qGpcCJql+l5ENSTFGoe5U9XIWRmyWszh9IFSDaHCzVtI2
	PaELglYwrU/U2QL70Nk2uUPeui0DqS2xYj5UaDb2DfU6U1hfYrQ74Z5Jwh00xgvh0kTJSh2QFCcyY
	K1KDDdzVNb/JRT4cCfgi4bx7hSnxM/yZ3d88MPh7jJ2lDGuQQljjccW4lBjWruFjLMk1o3vFzOS3V
	RcoPZ1n68W9lTJH5Kv/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukmxW-00000004iKj-36UH;
	Sat, 09 Aug 2025 17:02:18 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukmxR-00000004iJr-1Bmy
	for linux-riscv@lists.infradead.org;
	Sat, 09 Aug 2025 17:02:17 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250809170205euoutp01eb3e02ed83072969d0afc02d3def3cab~aJ-ImpRYR0196401964euoutp01a
	for <linux-riscv@lists.infradead.org>; Sat,  9 Aug 2025 17:02:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250809170205euoutp01eb3e02ed83072969d0afc02d3def3cab~aJ-ImpRYR0196401964euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754758925;
	bh=cXcpoYqKpw2AYordukgrvKibmr+AtiKeIGTwu6IdZyU=;
	h=From:Date:Subject:To:Cc:References:From;
	b=TP7Ouw/HTL6FWk+4PiiYStebOLdHCpAs/QPn2IJmwzfLMgpG48W8H6SYYBQpAa1ZU
	 hgjphUeUE1vTifDvFt5PIqn+75iHD4z9lyfog8q9IbdyRuKN5hragcmJHlJ2H4zPqQ
	 wSuXoCI6KmrIHGMOF5wL5yUd/vo4iiahJDtXrAdk=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250809170205eucas1p2da20fc85d38c98195d2ce36422592bee~aJ-IVxL3m1297712977eucas1p2r;
	Sat,  9 Aug 2025 17:02:05 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250809170205eusmtip12b6ca9982d2161a1964893ca1ae913dd~aJ-H8om130374003740eusmtip1Y;
	Sat,  9 Aug 2025 17:02:05 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Sat, 09 Aug 2025 19:02:00 +0200
Subject: [PATCH] clk: thead: Correct parent for DPU pixel clocks
MIME-Version: 1.0
Message-Id: <20250809-fix_clocks_thead_aug_9-v1-1-299c33d7a593@samsung.com>
X-B4-Tracking: v=1; b=H4sIAAd/l2gC/x2MSwqAMAwFryJZW6ifgnoVkVLSVIOi0qoI4t0Nz
	m5g3nsgUWRK0GUPRLo48baKFHkGOLl1JMVeHEpdGt3oVgW+LS4bzskeEzlv3TnaVhkMQu01Vg3
	IeI8k5X/cD+/7ASvvqsFoAAAA
X-Change-ID: 20250809-fix_clocks_thead_aug_9-5cffff4d0c38
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,  Fu Wei
	<wefu@redhat.com>, Michael Turquette <mturquette@baylibre.com>,  Stephen
	Boyd <sboyd@kernel.org>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250809170205eucas1p2da20fc85d38c98195d2ce36422592bee
X-Msg-Generator: CA
X-RootMTR: 20250809170205eucas1p2da20fc85d38c98195d2ce36422592bee
X-EPHeader: CA
X-CMS-RootMailID: 20250809170205eucas1p2da20fc85d38c98195d2ce36422592bee
References: <CGME20250809170205eucas1p2da20fc85d38c98195d2ce36422592bee@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_100215_509225_E1BD9015 
X-CRM114-Status: GOOD (  11.52  )
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
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The dpu0_pixelclk and dpu1_pixelclk gates were incorrectly parented to
the video_pll_clk.

According to the TH1520 TRM, the "dpu0_pixelclk" should be sourced from
"DPU0 PLL DIV CLK". In this driver, "DPU0 PLL DIV CLK" corresponds to
the `dpu0_clk` clock, which is a divider whose parent is the
`dpu0_pll_clk`.

This patch corrects the clock hierarchy by reparenting `dpu0_pixelclk`
to `dpu0_clk`. By symmetry, `dpu1_pixelclk` is also reparented to its
correct source, `dpu1_clk`.

Fixes: 50d4b157fa96 ("clk: thead: Add clock support for VO subsystem in T-HEAD TH1520 SoC")
Reported-by: Icenowy Zheng <uwu@icenowy.me>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/clk/thead/clk-th1520-ap.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index cf1bba58f641e9b053cdda5fa52640590c5fa215..dd6359441f7e8a2c9d4a00c640b07af606627cc4 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -767,6 +767,10 @@ static struct ccu_div dpu0_clk = {
 	},
 };
 
+static const struct clk_parent_data dpu0_clk_pd[] = {
+	{ .hw = &dpu0_clk.common.hw }
+};
+
 static struct ccu_div dpu1_clk = {
 	.div		= TH_CCU_DIV_FLAGS(0, 8, CLK_DIVIDER_ONE_BASED),
 	.common		= {
@@ -779,6 +783,10 @@ static struct ccu_div dpu1_clk = {
 	},
 };
 
+static const struct clk_parent_data dpu1_clk_pd[] = {
+	{ .hw = &dpu1_clk.common.hw }
+};
+
 static CLK_FIXED_FACTOR_HW(emmc_sdio_ref_clk, "emmc-sdio-ref",
 			   &video_pll_clk.common.hw, 4, 1, 0);
 
@@ -855,9 +863,9 @@ static CCU_GATE(CLK_GPU_CORE, gpu_core_clk, "gpu-core-clk", video_pll_clk_pd,
 static CCU_GATE(CLK_GPU_CFG_ACLK, gpu_cfg_aclk, "gpu-cfg-aclk",
 		video_pll_clk_pd, 0x0, BIT(4), 0);
 static CCU_GATE(CLK_DPU_PIXELCLK0, dpu0_pixelclk, "dpu0-pixelclk",
-		video_pll_clk_pd, 0x0, BIT(5), 0);
+		dpu0_clk_pd, 0x0, BIT(5), 0);
 static CCU_GATE(CLK_DPU_PIXELCLK1, dpu1_pixelclk, "dpu1-pixelclk",
-		video_pll_clk_pd, 0x0, BIT(6), 0);
+		dpu1_clk_pd, 0x0, BIT(6), 0);
 static CCU_GATE(CLK_DPU_HCLK, dpu_hclk, "dpu-hclk", video_pll_clk_pd, 0x0,
 		BIT(7), 0);
 static CCU_GATE(CLK_DPU_ACLK, dpu_aclk, "dpu-aclk", video_pll_clk_pd, 0x0,

---
base-commit: 561c80369df0733ba0574882a1635287b20f9de2
change-id: 20250809-fix_clocks_thead_aug_9-5cffff4d0c38

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
