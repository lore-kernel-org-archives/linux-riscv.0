Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339ACCA0EE6
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Aug 2025 10:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dAHL1fcJgeKfny27dpcg17btJcoDVCBuV3QpScUBumw=; b=4Mf1YiQglBnE/o
	9Lhr9OjJnWyOEz199pEi1WmWil/LuIff13Nj+Fj6KATNzRgNJX+M4+0POptBQpe3c2H9j/TA8W8QU
	EFZT7RXGKTBjsw/fL6x8g/YX1rjC4+VX/gvy+5POSLTb4Dp1gPeoZ2QsctKHQNfs7G6FZ0S20/GoS
	PyYXnuau2rYQvWJF5679aTTeNKlt/Um9YfhY5DH5P+G/XPi/ovuRVovbUYS/vO+5n4u+jmKLDmW9J
	LTbXG3MITDGBnKX7VlbKXj8CI36/liMSNBRRxbVa/ARtS0LMfhNlwKkPu1bLa67PI65Luv1+7d4XG
	ejS1LwKoLHwYdKUzr/tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unDy2-00000004SeU-3MRK;
	Sat, 16 Aug 2025 10:16:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCxT-00000004N3V-3xCw
	for linux-riscv@bombadil.infradead.org;
	Sat, 16 Aug 2025 09:12:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=NRlRSlmdIvW6NmRYLkNnaaRN4ad5e91BviukfyqBzLo=; b=muQK8NlqFwnD7jlkIjcgeNWpGD
	w8O0QAiElgKFs1UGOSzFPU4hhoqC5bhncG3PNi6eBCRBDCiYQMeHeEef9RaP9RoswoXdqy3OTh4Os
	NkrxuyB9R49dORCZlzKHZ2XtC8/BMjQce2N5LQcr/Nr24W0jEXp6O5dPwMp2dMGX6DJyn5QXgGW32
	oZAfRfAxC0C+m3s+BG8dC0fo3PzIbSfIDALrQXsBgslc//IF36zErs85iEYSzenlZz9ZSNIXY28ho
	UW6fpck10qUBKpB4UeBhZOjqXPu7JVaJ4G0oEMRLJ8uSTcBvePrHnZuAN3E7p62QHwYjQ8UeU0FKh
	CWloLehw==;
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCxQ-0000000Gwk4-1wGr
	for linux-riscv@lists.infradead.org;
	Sat, 16 Aug 2025 09:12:14 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755335526; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mdit7eKotHavbQ2FTFFdYRrLobT1upX7wtgcYrNQD6jYKYItSAyZZiglbGzYpMRoljnRAFcgltakEKZqsxZe+4UWGlWdUKPOCkiMNoEtgHj9B0JjUYatVxJpkICGmDyXOuPEwFCkNoeckiU+9BiWhhY7DdSx4HL9g6cjkUFt9ys=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755335526; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NRlRSlmdIvW6NmRYLkNnaaRN4ad5e91BviukfyqBzLo=; 
	b=NxKmgHBqUQB8IMOiDwHNqsOj5zLHmktNFTgrXhwwRbe43WdRTWr256b4MSJvbh3/LbS9u9eBgnZELEabshNUalEQT0t2Lz4qpyy0N2yaw2luVwUVzIXRuSHz6qYDnXilVofg84YQXKC13OikiMHk6XP7+Pu43dmknrJt2NK5oUE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755335526;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=NRlRSlmdIvW6NmRYLkNnaaRN4ad5e91BviukfyqBzLo=;
	b=MDB8eRBhMH344Z6it9ItfGqQp5shI/jeiBD+vArrMbeVbAIeO2gHWnSFPiL0oSaf
	aIFDYe1mDkyATA57Mc+g5A8TnvyeE04drQNFJNic+N4LXpaipocOXco5WQ5KecOC5hD
	nhTVu2vYIZu6CJAVN9GnodeG5tpRc4Ko5RSNvxtv4McdyRkexJ+Ezu46Q6NGlV93tpy
	GQlAEJjP8G5yB3FUI7oSOZqLmL3aT+7UxfOk/AwHc4papu5GtUCfTSi8gxi4CkVuN40
	MtMFFXk573ey8DAmAHaRmfS03vpTVTDJOUydrOI9j7U4uHK+8jg3PUAwY6JnC6Jezwy
	rjSFmahjMA==
Received: by mx.zohomail.com with SMTPS id 1755335523279919.8290029794405;
	Sat, 16 Aug 2025 02:12:03 -0700 (PDT)
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
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v3 4/4] clk: thead: th1520-ap: set all AXI clocks to CLK_IS_CRITICAL
Date: Sat, 16 Aug 2025 17:11:13 +0800
Message-ID: <20250816091113.2596048-5-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816091113.2596048-1-uwu@icenowy.me>
References: <20250816091113.2596048-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_101212_987793_79C79539 
X-CRM114-Status: UNSURE (   8.24  )
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
Reviewed-by: Drew Fustini <fustini@kernel.org>
---
No changes in v2 except for rebasing error fixes (which I sent as FIXED
patches in v1).
Changes in v3:
- Rebased atop ccu_gate refactor.
- Added Drew's R-b.

 drivers/clk/thead/clk-th1520-ap.c | 44 +++++++++++++++----------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index 54222b3219ccf..26e55e1c60148 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -559,7 +559,7 @@ static struct ccu_div axi4_cpusys2_aclk = {
 		.hw.init	= CLK_HW_INIT_PARENTS_HW("axi4-cpusys2-aclk",
 					      gmac_pll_clk_parent,
 					      &ccu_div_ops,
-					      0),
+					      CLK_IS_CRITICAL),
 	},
 };
 
@@ -581,7 +581,7 @@ static struct ccu_div axi_aclk = {
 		.hw.init	= CLK_HW_INIT_PARENTS_DATA("axi-aclk",
 						      axi_parents,
 						      &ccu_div_ops,
-						      0),
+						      CLK_IS_CRITICAL),
 	},
 };
 
@@ -730,7 +730,7 @@ static struct ccu_div apb_pclk = {
 		.hw.init	= CLK_HW_INIT_PARENTS_DATA("apb-pclk",
 						      apb_parents,
 						      &ccu_div_ops,
-						      CLK_IGNORE_UNUSED),
+						      CLK_IS_CRITICAL),
 	},
 };
 
@@ -761,7 +761,7 @@ static struct ccu_div vi_clk = {
 		.hw.init	= CLK_HW_INIT_PARENTS_HW("vi",
 					      video_pll_clk_parent,
 					      &ccu_div_ops,
-					      0),
+					      CLK_IS_CRITICAL),
 	},
 };
 
@@ -786,7 +786,7 @@ static struct ccu_div vo_axi_clk = {
 		.hw.init	= CLK_HW_INIT_PARENTS_HW("vo-axi",
 					      video_pll_clk_parent,
 					      &ccu_div_ops,
-					      0),
+					      CLK_IS_CRITICAL),
 	},
 };
 
@@ -811,7 +811,7 @@ static struct ccu_div vp_axi_clk = {
 		.hw.init	= CLK_HW_INIT_PARENTS_HW("vp-axi",
 					      video_pll_clk_parent,
 					      &ccu_div_ops,
-					      CLK_IGNORE_UNUSED),
+					      CLK_IS_CRITICAL),
 	},
 };
 
@@ -872,27 +872,27 @@ static const struct clk_parent_data emmc_sdio_ref_clk_pd[] = {
 static CCU_GATE(CLK_BROM, brom_clk, "brom", ahb2_cpusys_hclk_pd, 0x100, 4, 0);
 static CCU_GATE(CLK_BMU, bmu_clk, "bmu", axi4_cpusys2_aclk_pd, 0x100, 5, 0);
 static CCU_GATE(CLK_AON2CPU_A2X, aon2cpu_a2x_clk, "aon2cpu-a2x", axi4_cpusys2_aclk_pd,
-		0x134, 8, 0);
+		0x134, 8, CLK_IS_CRITICAL);
 static CCU_GATE(CLK_X2X_CPUSYS, x2x_cpusys_clk, "x2x-cpusys", axi4_cpusys2_aclk_pd,
-		0x134, 7, 0);
+		0x134, 7, CLK_IS_CRITICAL);
 static CCU_GATE(CLK_CPU2AON_X2H, cpu2aon_x2h_clk, "cpu2aon-x2h", axi_aclk_pd,
-		0x138, 8, CLK_IGNORE_UNUSED);
+		0x138, 8, CLK_IS_CRITICAL);
 static CCU_GATE(CLK_CPU2PERI_X2H, cpu2peri_x2h_clk, "cpu2peri-x2h", axi4_cpusys2_aclk_pd,
-		0x140, 9, CLK_IGNORE_UNUSED);
+		0x140, 9, CLK_IS_CRITICAL);
 static CCU_GATE(CLK_PERISYS_APB1_HCLK, perisys_apb1_hclk, "perisys-apb1-hclk", perisys_ahb_hclk_pd,
-		0x150, 9, CLK_IGNORE_UNUSED);
+		0x150, 9, CLK_IS_CRITICAL);
 static CCU_GATE(CLK_PERISYS_APB2_HCLK, perisys_apb2_hclk, "perisys-apb2-hclk", perisys_ahb_hclk_pd,
-		0x150, 10, CLK_IGNORE_UNUSED);
+		0x150, 10, CLK_IS_CRITICAL);
 static CCU_GATE(CLK_PERISYS_APB3_HCLK, perisys_apb3_hclk, "perisys-apb3-hclk", perisys_ahb_hclk_pd,
-		0x150, 11, CLK_IGNORE_UNUSED);
+		0x150, 11, CLK_IS_CRITICAL);
 static CCU_GATE(CLK_PERISYS_APB4_HCLK, perisys_apb4_hclk, "perisys-apb4-hclk", perisys_ahb_hclk_pd,
 		0x150, 12, 0);
 static const struct clk_parent_data perisys_apb4_hclk_pd[] = {
 	{ .hw = &perisys_apb4_hclk.gate.hw },
 };
 
-static CCU_GATE(CLK_NPU_AXI, npu_axi_clk, "npu-axi", axi_aclk_pd, 0x1c8, 5, 0);
-static CCU_GATE(CLK_CPU2VP, cpu2vp_clk, "cpu2vp", axi_aclk_pd, 0x1e0, 13, 0);
+static CCU_GATE(CLK_NPU_AXI, npu_axi_clk, "npu-axi", axi_aclk_pd, 0x1c8, 5, CLK_IS_CRITICAL);
+static CCU_GATE(CLK_CPU2VP, cpu2vp_clk, "cpu2vp", axi_aclk_pd, 0x1e0, 13, CLK_IS_CRITICAL);
 static CCU_GATE(CLK_EMMC_SDIO, emmc_sdio_clk, "emmc-sdio", emmc_sdio_ref_clk_pd, 0x204, 30, 0);
 static CCU_GATE(CLK_GMAC1, gmac1_clk, "gmac1", gmac_pll_clk_pd, 0x204, 26, 0);
 static CCU_GATE(CLK_PADCTRL1, padctrl1_clk, "padctrl1", perisys_apb_pclk_pd, 0x204, 24, 0);
@@ -936,11 +936,11 @@ static CCU_GATE(CLK_SRAM2, sram2_clk, "sram2", axi_aclk_pd, 0x20c, 2, 0);
 static CCU_GATE(CLK_SRAM3, sram3_clk, "sram3", axi_aclk_pd, 0x20c, 1, 0);
 
 static CCU_GATE(CLK_AXI4_VO_ACLK, axi4_vo_aclk, "axi4-vo-aclk",
-		video_pll_clk_pd, 0x0, 0, 0);
+		video_pll_clk_pd, 0x0, 0, CLK_IS_CRITICAL);
 static CCU_GATE(CLK_GPU_CORE, gpu_core_clk, "gpu-core-clk", video_pll_clk_pd,
 		0x0, 3, 0);
 static CCU_GATE(CLK_GPU_CFG_ACLK, gpu_cfg_aclk, "gpu-cfg-aclk",
-		video_pll_clk_pd, 0x0, 4, 0);
+		video_pll_clk_pd, 0x0, 4, CLK_IS_CRITICAL);
 static CCU_GATE(CLK_DPU_PIXELCLK0, dpu0_pixelclk, "dpu0-pixelclk",
 		dpu0_clk_pd, 0x0, 5, CLK_SET_RATE_PARENT);
 static CCU_GATE(CLK_DPU_PIXELCLK1, dpu1_pixelclk, "dpu1-pixelclk",
@@ -972,9 +972,9 @@ static CCU_GATE(CLK_MIPI_DSI1_REFCLK, mipi_dsi1_refclk, "mipi-dsi1-refclk",
 static CCU_GATE(CLK_HDMI_I2S, hdmi_i2s_clk, "hdmi-i2s-clk", video_pll_clk_pd,
 		0x0, 19, 0);
 static CCU_GATE(CLK_X2H_DPU1_ACLK, x2h_dpu1_aclk, "x2h-dpu1-aclk",
-		video_pll_clk_pd, 0x0, 20, 0);
+		video_pll_clk_pd, 0x0, 20, CLK_IS_CRITICAL);
 static CCU_GATE(CLK_X2H_DPU_ACLK, x2h_dpu_aclk, "x2h-dpu-aclk",
-		video_pll_clk_pd, 0x0, 21, 0);
+		video_pll_clk_pd, 0x0, 21, CLK_IS_CRITICAL);
 static CCU_GATE(CLK_AXI4_VO_PCLK, axi4_vo_pclk, "axi4-vo-pclk",
 		video_pll_clk_pd, 0x0, 22, 0);
 static CCU_GATE(CLK_IOPMP_VOSYS_DPU_PCLK, iopmp_vosys_dpu_pclk,
@@ -984,11 +984,11 @@ static CCU_GATE(CLK_IOPMP_VOSYS_DPU1_PCLK, iopmp_vosys_dpu1_pclk,
 static CCU_GATE(CLK_IOPMP_VOSYS_GPU_PCLK, iopmp_vosys_gpu_pclk,
 		"iopmp-vosys-gpu-pclk", video_pll_clk_pd, 0x0, 25, 0);
 static CCU_GATE(CLK_IOPMP_DPU1_ACLK, iopmp_dpu1_aclk, "iopmp-dpu1-aclk",
-		video_pll_clk_pd, 0x0, 27, 0);
+		video_pll_clk_pd, 0x0, 27, CLK_IS_CRITICAL);
 static CCU_GATE(CLK_IOPMP_DPU_ACLK, iopmp_dpu_aclk, "iopmp-dpu-aclk",
-		video_pll_clk_pd, 0x0, 28, 0);
+		video_pll_clk_pd, 0x0, 28, CLK_IS_CRITICAL);
 static CCU_GATE(CLK_IOPMP_GPU_ACLK, iopmp_gpu_aclk, "iopmp-gpu-aclk",
-		video_pll_clk_pd, 0x0, 29, 0);
+		video_pll_clk_pd, 0x0, 29, CLK_IS_CRITICAL);
 static CCU_GATE(CLK_MIPIDSI0_PIXCLK, mipi_dsi0_pixclk, "mipi-dsi0-pixclk",
 		video_pll_clk_pd, 0x0, 30, 0);
 static CCU_GATE(CLK_MIPIDSI1_PIXCLK, mipi_dsi1_pixclk, "mipi-dsi1-pixclk",
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
