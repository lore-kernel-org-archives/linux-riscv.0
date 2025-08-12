Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D5EC87FCB
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 05:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Npyp96leaN6Eh050V1WV0YAfl85i8rx1sKVPqof/xxA=; b=RnGaGZU7VKrsH9
	KUFIAuXisIn3Zd2vu/gjf35jy00FxSOeot2igJOxtiyWsoxpmKkdFlllqyp7JI/lM6rzvwHhxqvff
	2SSjYs3qKg6vtAE5hiVW7pZr2m9ZyC/VBmvQAzaotfXSec5dPQUD4iGMbSdz6KFlHyK/tWMGVqR9D
	HfY4tIb7q2f2phrK1YMg0mdg2+rxxgnGWaDk7fEK1/FIUus54DYiuTuoi0B3zDi3/GdAcQiJv82PQ
	EhhsPav7yqNiejguXXq0bVuMeXrNTRXxY6LI9CBtF35NWUqqwttBF7O5nqkMwkzHEY51LgjNTrDaJ
	F7NhInqKuqK2OmNZP0HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhoC-00000009ugl-3hAB;
	Tue, 12 Aug 2025 05:44:28 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhoA-00000009ugC-2kc3
	for linux-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 05:44:27 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1754977462; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=W9vq459a4dUZc/CJoQhURH0E+kVyyGtmLqxqNl242GM33H3KMfLQd9ZERSTkdvILrLT/Gq9+s6ou+seY0HdUzgx+68q4DGzllinQd8hXocFl7QLndd4qe5Jw4Z72UsbOuv0tp4Nq+4rHNz21z3SVJwDWNXdopUydLAHtkBKLjCw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1754977462; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gVWWuhWdikYYzDvjepQoYeKc1adAVV7A6iqxn9yABdM=; 
	b=VbqybVIANJGhu1ZgM5WRDK76HmuTLI6GiWOPU5+sczd/jvi6V3ekFAt3Ib5KzgtZBwKvQ5HsQRjm9/theUr/FEAONQCB0Lhvq8U4nWmIUv9MMYqAgXDkGeCRTUKLx5FQapDr+u3eZSPfZH4/xq9NdPCd1DgwMHHdQO6xZC0GSOw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754977462;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=gVWWuhWdikYYzDvjepQoYeKc1adAVV7A6iqxn9yABdM=;
	b=TEAqW741II2gvuJmSHBxL8vBZgr5zWVQBX0CmBhbTsu1Y6fX8a+7mXpU/80PX3oa
	RxZ67SD3SPEsE+bT5P04+/s/P5YA5DNoaf9qnjB8HmFbxJkhU5O7S+4zcVtn6XaGJUB
	ygksrfLUaVtNR+Nv4VI0TqVp3M//hh10xFkpWzZsWuB0lJrDngTtuBWb9hXbIU3yLy1
	S8kBs3KpaeO8WZx2nSdaJSRIdg8XfohJvfKnxbxArijo1KJxkgMdDVrO2P+r4a+63Ni
	2/tLfkRKRxF42TcsOhFTLyMdRNTe3owqcQKGCehR05FbIXS+QO+c61b+lZ5kdEUIQR8
	VRrvURavSw==
Received: by mx.zohomail.com with SMTPS id 1754977460290586.4938036554051;
	Mon, 11 Aug 2025 22:44:20 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 3/4] clk: thead: th1520-ap: set all AXI clocks to CLK_IS_CRITICAL
Date: Tue, 12 Aug 2025 13:42:57 +0800
Message-ID: <20250812054258.1968351-4-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250812054258.1968351-1-uwu@icenowy.me>
References: <20250812054258.1968351-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_224426_756503_D78A5916 
X-CRM114-Status: UNSURE (   8.78  )
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

The AXI crossbar of TH1520 has no proper timeout handling, which means
gating AXI clocks can easily lead to bus timeout and thus system hang.

Set all AXI clock gates to CLK_IS_CRITICAL. All these clock gates are
ungated by default on system reset.

In addition, convert all current CLK_IGNORE_UNUSED usage to
CLK_IS_CRITICAL to prevent unwanted clock gating.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 drivers/clk/thead/clk-th1520-ap.c | 42 ++++++++++++++++---------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index 3e81f3051cd6c..0117e5ea1bf58 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -589,7 +589,7 @@ static struct ccu_div axi4_cpusys2_aclk = {
 		.hw.init	= CLK_HW_INIT_PARENTS_HW("axi4-cpusys2-aclk",
 					      gmac_pll_clk_parent,
 					      &ccu_div_ops,
-					      0),
+					      CLK_IS_CRITICAL),
 	},
 };
 
@@ -611,7 +611,7 @@ static struct ccu_div axi_aclk = {
 		.hw.init	= CLK_HW_INIT_PARENTS_DATA("axi-aclk",
 						      axi_parents,
 						      &ccu_div_ops,
-						      0),
+						      CLK_IS_CRITICAL),
 	},
 };
 
@@ -760,7 +760,7 @@ static struct ccu_div apb_pclk = {
 		.hw.init	= CLK_HW_INIT_PARENTS_DATA("apb-pclk",
 						      apb_parents,
 						      &ccu_div_ops,
-						      CLK_IGNORE_UNUSED),
+						      CLK_IS_CRITICAL),
 	},
 };
 
@@ -791,7 +791,7 @@ static struct ccu_div vi_clk = {
 		.hw.init	= CLK_HW_INIT_PARENTS_HW("vi",
 					      video_pll_clk_parent,
 					      &ccu_div_ops,
-					      0),
+					      CLK_IS_CRITICAL),
 	},
 };
 
@@ -816,7 +816,7 @@ static struct ccu_div vo_axi_clk = {
 		.hw.init	= CLK_HW_INIT_PARENTS_HW("vo-axi",
 					      video_pll_clk_parent,
 					      &ccu_div_ops,
-					      0),
+					      CLK_IS_CRITICAL),
 	},
 };
 
@@ -841,7 +841,7 @@ static struct ccu_div vp_axi_clk = {
 		.hw.init	= CLK_HW_INIT_PARENTS_HW("vp-axi",
 					      video_pll_clk_parent,
 					      &ccu_div_ops,
-					      CLK_IGNORE_UNUSED),
+					      CLK_IS_CRITICAL),
 	},
 };
 
@@ -902,23 +902,25 @@ static const struct clk_parent_data emmc_sdio_ref_clk_pd[] = {
 static CCU_GATE(CLK_BROM, brom_clk, "brom", ahb2_cpusys_hclk_pd, 0x100, BIT(4), 0);
 static CCU_GATE(CLK_BMU, bmu_clk, "bmu", axi4_cpusys2_aclk_pd, 0x100, BIT(5), 0);
 static CCU_GATE(CLK_AON2CPU_A2X, aon2cpu_a2x_clk, "aon2cpu-a2x", axi4_cpusys2_aclk_pd,
-		0x134, BIT(8), 0);
+		0x134, BIT(8), CLK_IS_CRITICAL);
 static CCU_GATE(CLK_X2X_CPUSYS, x2x_cpusys_clk, "x2x-cpusys", axi4_cpusys2_aclk_pd,
-		0x134, BIT(7), 0);
+		0x134, BIT(7), CLK_IS_CRITICAL);
 static CCU_GATE(CLK_CPU2AON_X2H, cpu2aon_x2h_clk, "cpu2aon-x2h", axi_aclk_pd,
-		0x138, BIT(8), CLK_IGNORE_UNUSED);
+		0x138, BIT(8), CLK_IS_CRITICAL);
 static CCU_GATE(CLK_CPU2PERI_X2H, cpu2peri_x2h_clk, "cpu2peri-x2h", axi4_cpusys2_aclk_pd,
-		0x140, BIT(9), CLK_IGNORE_UNUSED);
+		0x140, BIT(9), CLK_IS_CRITICAL);
 static CCU_GATE(CLK_PERISYS_APB1_HCLK, perisys_apb1_hclk, "perisys-apb1-hclk", perisys_ahb_hclk_pd,
-		0x150, BIT(9), CLK_IGNORE_UNUSED);
+		0x150, BIT(9), CLK_IS_CRITICAL);
 static CCU_GATE(CLK_PERISYS_APB2_HCLK, perisys_apb2_hclk, "perisys-apb2-hclk", perisys_ahb_hclk_pd,
-		0x150, BIT(10), CLK_IGNORE_UNUSED);
+		0x150, BIT(10), CLK_IS_CRITICAL);
 static CCU_GATE(CLK_PERISYS_APB3_HCLK, perisys_apb3_hclk, "perisys-apb3-hclk", perisys_ahb_hclk_pd,
-		0x150, BIT(11), CLK_IGNORE_UNUSED);
+		0x150, BIT(11), CLK_IS_CRITICAL);
 static CCU_GATE(CLK_PERISYS_APB4_HCLK, perisys_apb4_hclk, "perisys-apb4-hclk", perisys_ahb_hclk_pd,
 		0x150, BIT(12), 0);
 static CCU_GATE(CLK_NPU_AXI, npu_axi_clk, "npu-axi", axi_aclk_pd, 0x1c8, BIT(5), 0);
 static CCU_GATE(CLK_CPU2VP, cpu2vp_clk, "cpu2vp", axi_aclk_pd, 0x1e0, BIT(13), 0);
+static CCU_GATE(CLK_NPU_AXI, npu_axi_clk, "npu-axi", axi_aclk_pd, 0x1c8, BIT(5), CLK_IS_CRITICAL);
+static CCU_GATE(CLK_CPU2VP, cpu2vp_clk, "cpu2vp", axi_aclk_pd, 0x1e0, BIT(13), CLK_IS_CRITICAL);
 static CCU_GATE(CLK_EMMC_SDIO, emmc_sdio_clk, "emmc-sdio", emmc_sdio_ref_clk_pd, 0x204, BIT(30), 0);
 static CCU_GATE(CLK_GMAC1, gmac1_clk, "gmac1", gmac_pll_clk_pd, 0x204, BIT(26), 0);
 static CCU_GATE(CLK_PADCTRL1, padctrl1_clk, "padctrl1", perisys_apb_pclk_pd, 0x204, BIT(24), 0);
@@ -962,11 +964,11 @@ static CCU_GATE(CLK_SRAM2, sram2_clk, "sram2", axi_aclk_pd, 0x20c, BIT(2), 0);
 static CCU_GATE(CLK_SRAM3, sram3_clk, "sram3", axi_aclk_pd, 0x20c, BIT(1), 0);
 
 static CCU_GATE(CLK_AXI4_VO_ACLK, axi4_vo_aclk, "axi4-vo-aclk",
-		video_pll_clk_pd, 0x0, BIT(0), 0);
+		video_pll_clk_pd, 0x0, BIT(0), CLK_IS_CRITICAL);
 static CCU_GATE(CLK_GPU_CORE, gpu_core_clk, "gpu-core-clk", video_pll_clk_pd,
 		0x0, BIT(3), 0);
 static CCU_GATE(CLK_GPU_CFG_ACLK, gpu_cfg_aclk, "gpu-cfg-aclk",
-		video_pll_clk_pd, 0x0, BIT(4), 0);
+		video_pll_clk_pd, 0x0, BIT(4), CLK_IS_CRITICAL);
 static CCU_GATE(CLK_DPU_PIXELCLK0, dpu0_pixelclk, "dpu0-pixelclk",
 		dpu0_clk_pd, 0x0, BIT(5), CLK_SET_RATE_PARENT);
 static CCU_GATE(CLK_DPU_PIXELCLK1, dpu1_pixelclk, "dpu1-pixelclk",
@@ -998,9 +1000,9 @@ static CCU_GATE(CLK_MIPI_DSI1_REFCLK, mipi_dsi1_refclk, "mipi-dsi1-refclk",
 static CCU_GATE(CLK_HDMI_I2S, hdmi_i2s_clk, "hdmi-i2s-clk", video_pll_clk_pd,
 		0x0, BIT(19), 0);
 static CCU_GATE(CLK_X2H_DPU1_ACLK, x2h_dpu1_aclk, "x2h-dpu1-aclk",
-		video_pll_clk_pd, 0x0, BIT(20), 0);
+		video_pll_clk_pd, 0x0, BIT(20), CLK_IS_CRITICAL);
 static CCU_GATE(CLK_X2H_DPU_ACLK, x2h_dpu_aclk, "x2h-dpu-aclk",
-		video_pll_clk_pd, 0x0, BIT(21), 0);
+		video_pll_clk_pd, 0x0, BIT(21), CLK_IS_CRITICAL);
 static CCU_GATE(CLK_AXI4_VO_PCLK, axi4_vo_pclk, "axi4-vo-pclk",
 		video_pll_clk_pd, 0x0, BIT(22), 0);
 static CCU_GATE(CLK_IOPMP_VOSYS_DPU_PCLK, iopmp_vosys_dpu_pclk,
@@ -1010,11 +1012,11 @@ static CCU_GATE(CLK_IOPMP_VOSYS_DPU1_PCLK, iopmp_vosys_dpu1_pclk,
 static CCU_GATE(CLK_IOPMP_VOSYS_GPU_PCLK, iopmp_vosys_gpu_pclk,
 		"iopmp-vosys-gpu-pclk", video_pll_clk_pd, 0x0, BIT(25), 0);
 static CCU_GATE(CLK_IOPMP_DPU1_ACLK, iopmp_dpu1_aclk, "iopmp-dpu1-aclk",
-		video_pll_clk_pd, 0x0, BIT(27), 0);
+		video_pll_clk_pd, 0x0, BIT(27), CLK_IS_CRITICAL);
 static CCU_GATE(CLK_IOPMP_DPU_ACLK, iopmp_dpu_aclk, "iopmp-dpu-aclk",
-		video_pll_clk_pd, 0x0, BIT(28), 0);
+		video_pll_clk_pd, 0x0, BIT(28), CLK_IS_CRITICAL);
 static CCU_GATE(CLK_IOPMP_GPU_ACLK, iopmp_gpu_aclk, "iopmp-gpu-aclk",
-		video_pll_clk_pd, 0x0, BIT(29), 0);
+		video_pll_clk_pd, 0x0, BIT(29), CLK_IS_CRITICAL);
 static CCU_GATE(CLK_MIPIDSI0_PIXCLK, mipi_dsi0_pixclk, "mipi-dsi0-pixclk",
 		video_pll_clk_pd, 0x0, BIT(30), 0);
 static CCU_GATE(CLK_MIPIDSI1_PIXCLK, mipi_dsi1_pixclk, "mipi-dsi1-pixclk",
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
