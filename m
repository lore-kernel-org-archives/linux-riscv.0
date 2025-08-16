Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05442CA0EE6
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Aug 2025 09:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HU3SIh1UlCKTh2+XVmKmCuouDykmQ1s1CzB4gAK48Po=; b=y7R1evdnIk0F90
	Pkmx8XZxRiF71w4A8oPFMu4kMWOdRGVTZiu0bB7e7PeqvGkUX5uFX79+Ck9yfxFTHAqsaIaFeNXs/
	UJA/ZHr1s62NQttxCHxhnwFuLrFyz0p7Iz/j3gyuHn+cOY1mQCb19LtVUnmIuEP69VgL47KhAkC3C
	y7Rl7SorPCgoH1VKI2yqhv+XnJ/Ol1HXgfGbDjgHKKgMV8y9weu3tgCUdJYUGJoVre3kpLVaTmWoM
	1Tjve6rwrqyROiC+Gl3B4IaQEp9RKgDfjNpvNiNWdozH6mzoq6vroAkBetOIjiLIglhtuHxlKiieW
	o9WjbY8l70BwU65zk3ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCxP-00000004N1k-2M1c;
	Sat, 16 Aug 2025 09:12:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCxK-00000004N0u-2UJ5
	for linux-riscv@bombadil.infradead.org;
	Sat, 16 Aug 2025 09:12:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=IfOkSg/KZHgyMQVZKkN/1zZNGFiTPGDUVuPxklU9Law=; b=Sa1VNn+iegqtfPe9Iy6Q/B2jE5
	5f3QzsHqa7IFC0TJH06HClAJC+twQXMpdEN77IMZr4lli5MzzmgtaRX+xY+QTnihn78hJMryK8V6U
	UqRhG7RVdx4LzuJuvnhV7st9B/snJvTAolvzQ3yEwRnyJdCF41YfN19Z+EyP9j3/po3LeAmACVgKv
	f1QUjvx0l2Iu7HBaMNIn45xYtARRZ7cWMqoFyynCzjuYlMrB+jGJM/KmR6x+ntsWRYYDvz9zkqDRg
	vkhsk3khW3k1htn9xBfE5WpYxvLD2l1qxmUSmncC1YOyhVg2OQc9xFcIc3PhKWuzQ6Xp/dNYvHDgS
	KBMct99g==;
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCxH-0000000GwjZ-0mrm
	for linux-riscv@lists.infradead.org;
	Sat, 16 Aug 2025 09:12:05 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755335518; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=U6CIFpug0xxziIokhoB9i8HmWgDeTbjc/nJMo5OpOmicc7kv4SlEIpUeGpwyw9mHKWAEmQoIbvHahXRwDpfMuxmmc6y8PWQNfW3znzddYcqY7vTKd7xEkBBtlfH5A/nU9RWHlXiwFX58papjOevjl90YDzwhvcJe8aFm48pTfU4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755335518; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IfOkSg/KZHgyMQVZKkN/1zZNGFiTPGDUVuPxklU9Law=; 
	b=gQBIKRRMQX8q6Wb481adO4hGZz2mZPeyoeb1g1tPZuP+XD/hZR22M4YDPvYFb//1fyic+trAMlE+J2bOj5RFs4f2kFCLChuxmjonlpVfj2CFfM4ESNXImH1EKFzrM1u/yD2LhU81lk3gW6Oaf4Akir4381vrrnaIczCl4Rn5tuY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755335518;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=IfOkSg/KZHgyMQVZKkN/1zZNGFiTPGDUVuPxklU9Law=;
	b=Uwps/YAxhPfmAeEVPNYgRMHMFbPxaGHdoQD68MhN/n1kXe11RJtOsWBBUOO4q0sq
	9shQUr3gxKpxS983HVmz/smd14plLp7Kmm1jpoLR/u1ndYdvsUUvhlVQ2kwA2mwt1E/
	xdOFsab+mE7pkwTGOTg0o5dUYQWncMc262zTYr5FIDL7JRg7psIYjM+HEqZv5glM2x4
	3Wj8fV1mSvsr2ilQNM9cLBVrIF5/iz4DcdkirC+RhEvby4UAlynYsb/oUpAPfCDLFGC
	XO8Z71ElqTXxYHXxWC0ZXhKLbWJKdKW3TIM9LBPSBxogMDRi+kKCG6ar/Gcm44TuDxv
	tQqs31eSEw==
Received: by mx.zohomail.com with SMTPS id 1755335515864443.2720325754219;
	Sat, 16 Aug 2025 02:11:55 -0700 (PDT)
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
Subject: [PATCH v3 3/4] clk: thead: support changing DPU pixel clock rate
Date: Sat, 16 Aug 2025 17:11:12 +0800
Message-ID: <20250816091113.2596048-4-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816091113.2596048-1-uwu@icenowy.me>
References: <20250816091113.2596048-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_101203_661326_78E56377 
X-CRM114-Status: GOOD (  15.81  )
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

The DPU pixel clock rate corresponds to the required dot clock of the
display mode, so it needs to be tweakable.

Add support to change it, by adding generic divider setting code,
arming the code to the dpu0/dpu1 clocks, and setting the pixel clock
connected to the DPU (after a gate) to CLK_SET_RATE_PARENT to propagate
it to the dividers.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Reviewed-by: Drew Fustini <fustini@kernel.org>
---
Changes in v2:
- Dropped round_rate() because of deprecation.
- Changed the logic of determine_rate() to early return if the divider
  could be changed.
Changes in v3:
- Rebased atop ccu_gate refactor.
- Fixed alignment issue of ccu_div_set_rate()'s signature.
- Removed a meaningless assignment to curr_val in ccu_div_set_rate()
  because of being immediately overriden.
- Added Drew's R-b.

 drivers/clk/thead/clk-th1520-ap.c | 63 ++++++++++++++++++++++++++++---
 1 file changed, 58 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index d81445e24a96a..54222b3219ccf 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -56,6 +56,7 @@ struct ccu_gate {
 
 struct ccu_div {
 	u32			enable;
+	u32			div_en;
 	struct ccu_div_internal	div;
 	struct ccu_internal	mux;
 	struct ccu_common	common;
@@ -192,6 +193,55 @@ static unsigned long ccu_div_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
+static int ccu_div_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
+{
+	struct ccu_div *cd = hw_to_ccu_div(hw);
+	unsigned int val;
+
+	if (cd->div_en)
+		return divider_determine_rate(hw, req, NULL,
+					      cd->div.width, cd->div.flags);
+
+	regmap_read(cd->common.map, cd->common.cfg0, &val);
+	val = val >> cd->div.shift;
+	val &= GENMASK(cd->div.width - 1, 0);
+	return divider_ro_determine_rate(hw, req, NULL, cd->div.width,
+					 cd->div.flags, val);
+}
+
+static int ccu_div_set_rate(struct clk_hw *hw, unsigned long rate,
+			    unsigned long parent_rate)
+{
+	struct ccu_div *cd = hw_to_ccu_div(hw);
+	int val = divider_get_val(rate, parent_rate, NULL,
+				  cd->div.width, cd->div.flags);
+	unsigned int curr_val, reg_val;
+
+	if (val < 0)
+		return val;
+
+	regmap_read(cd->common.map, cd->common.cfg0, &reg_val);
+	curr_val = reg_val >> cd->div.shift;
+	curr_val &= GENMASK(cd->div.width - 1, 0);
+
+	if (!cd->div_en && curr_val != val)
+		return -EINVAL;
+
+	reg_val &= ~cd->div_en;
+	regmap_write(cd->common.map, cd->common.cfg0, reg_val);
+	udelay(1);
+
+	reg_val &= ~GENMASK(cd->div.width + cd->div.shift - 1, cd->div.shift);
+	reg_val |= val << cd->div.shift;
+	regmap_write(cd->common.map, cd->common.cfg0, reg_val);
+
+	reg_val |= cd->div_en;
+	regmap_write(cd->common.map, cd->common.cfg0, reg_val);
+
+	return 0;
+}
+
 static u8 ccu_div_get_parent(struct clk_hw *hw)
 {
 	struct ccu_div *cd = hw_to_ccu_div(hw);
@@ -234,7 +284,8 @@ static const struct clk_ops ccu_div_ops = {
 	.get_parent	= ccu_div_get_parent,
 	.set_parent	= ccu_div_set_parent,
 	.recalc_rate	= ccu_div_recalc_rate,
-	.determine_rate	= clk_hw_determine_rate_no_reparent,
+	.set_rate	= ccu_div_set_rate,
+	.determine_rate = ccu_div_determine_rate,
 };
 
 static void ccu_pll_disable(struct clk_hw *hw)
@@ -778,6 +829,7 @@ static struct ccu_div venc_clk = {
 };
 
 static struct ccu_div dpu0_clk = {
+	.div_en		= BIT(8),
 	.div		= TH_CCU_DIV_FLAGS(0, 8, CLK_DIVIDER_ONE_BASED),
 	.common		= {
 		.clkid          = CLK_DPU0,
@@ -785,7 +837,7 @@ static struct ccu_div dpu0_clk = {
 		.hw.init	= CLK_HW_INIT_PARENTS_HW("dpu0",
 					      dpu0_pll_clk_parent,
 					      &ccu_div_ops,
-					      0),
+					      CLK_SET_RATE_UNGATE),
 	},
 };
 
@@ -794,6 +846,7 @@ static const struct clk_parent_data dpu0_clk_pd[] = {
 };
 
 static struct ccu_div dpu1_clk = {
+	.div_en		= BIT(8),
 	.div		= TH_CCU_DIV_FLAGS(0, 8, CLK_DIVIDER_ONE_BASED),
 	.common		= {
 		.clkid          = CLK_DPU1,
@@ -801,7 +854,7 @@ static struct ccu_div dpu1_clk = {
 		.hw.init	= CLK_HW_INIT_PARENTS_HW("dpu1",
 					      dpu1_pll_clk_parent,
 					      &ccu_div_ops,
-					      0),
+					      CLK_SET_RATE_UNGATE),
 	},
 };
 
@@ -889,9 +942,9 @@ static CCU_GATE(CLK_GPU_CORE, gpu_core_clk, "gpu-core-clk", video_pll_clk_pd,
 static CCU_GATE(CLK_GPU_CFG_ACLK, gpu_cfg_aclk, "gpu-cfg-aclk",
 		video_pll_clk_pd, 0x0, 4, 0);
 static CCU_GATE(CLK_DPU_PIXELCLK0, dpu0_pixelclk, "dpu0-pixelclk",
-		dpu0_clk_pd, 0x0, 5, 0);
+		dpu0_clk_pd, 0x0, 5, CLK_SET_RATE_PARENT);
 static CCU_GATE(CLK_DPU_PIXELCLK1, dpu1_pixelclk, "dpu1-pixelclk",
-		dpu1_clk_pd, 0x0, 6, 0);
+		dpu1_clk_pd, 0x0, 6, CLK_SET_RATE_PARENT);
 static CCU_GATE(CLK_DPU_HCLK, dpu_hclk, "dpu-hclk", video_pll_clk_pd, 0x0,
 		7, 0);
 static CCU_GATE(CLK_DPU_ACLK, dpu_aclk, "dpu-aclk", video_pll_clk_pd, 0x0,
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
