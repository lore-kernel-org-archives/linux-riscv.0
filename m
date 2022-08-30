Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB822ECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 12:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tCMIZY27TMBYFCbLSJtYqDqUe+zhKx550ab/lICQggs=; b=jevOT5KmPoNfRe
	M7Bf2qhQ2m652SJMf9NEbEEu6Mn2Jr99pNlKxtxkVzMJNXAp7ib1hXxKmj/zVtTogqOl4tGBgi4cG
	qD4zn1KnJwV8NCinoi92RvB2ZsME1ZxcQtb6u6NZtvdEgKNlUGi+KilXRsGcXCHKnwZSdS2V6wMYz
	hd5Yy+9npxMyKdvtmUG+VCpYhEJ9yp1fMGQqFwCx/u2maEc9aeTfNw/uYOHSbcfccus7VBVNHL3Jm
	tCI4+rd3i9EHTiFLoBYPiDBbvW9fholLbW2LT+zpY9Rr/kfRjcLXiNXQFNgiqMCazamc9lyMLQHzq
	j+UP5ToeKzmbI3f1UhNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT0l8-00H2wo-UM; Tue, 30 Aug 2022 12:54:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT0kb-00H21T-NK
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 12:53:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661864033; x=1693400033;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+j0Bj+aApY6wS6WgiTdHHq/9KOIAMlKvPqoSyxcaJfM=;
  b=j4pf48h5Yv85ElTeGJHhWIsz+QftDUxeMfbw2baXsqb3acUNqsYQtLwN
   a5dNxE4RKLBMkj/TDH9I6OZlsXoqJoZnexKV0fIGaUhLBwWQ26qi7uYX1
   uv1VjzIB78Pp7DiTrfveZnpsQSc9MMGJzC5yhYjlUwQdb/+8tajR42MxY
   ygWLXaza7NwTeZ2luSMTvD5HgvjeqR7gbECRL6s+O9zHiaRMMBhtDLF3Z
   r6LNA4zWmh+sSux0L1IusnhHJbEcEAejXviOG9eUsDwnwL9/f6TbL16z9
   yJkH+sy6m2g3C08Iob1tppe4tlxhREm1xPFvuWnaEDnlcxIRV1LEj462v
   w==;
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="188645833"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Aug 2022 05:53:52 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 30 Aug 2022 05:53:50 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Tue, 30 Aug 2022 05:53:47 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Claudiu Beznea <claudiu.beznea@microchip.com>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v4 12/13] clk: microchip: mpfs: convert periph_clk to clk_gate
Date: Tue, 30 Aug 2022 13:52:49 +0100
Message-ID: <20220830125249.2373416-12-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220830125110.2372514-1-conor.dooley@microchip.com>
References: <20220830125110.2372514-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_055353_859014_63CF96F7 
X-CRM114-Status: GOOD (  11.91  )
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

With the reset code moved to the recently added reset controller, there
is no need for custom ops any longer. Remove the custom ops and the
custom struct by converting to a clk_gate.

Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/microchip/clk-mpfs.c | 72 +++-----------------------------
 1 file changed, 6 insertions(+), 66 deletions(-)

diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
index 88a200e88e54..fa46176eb9ca 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -58,19 +58,11 @@ struct mpfs_cfg_hw_clock {
 	u32 reg_offset;
 };
 
-struct mpfs_periph_clock {
-	void __iomem *reg;
-	u8 shift;
-};
-
 struct mpfs_periph_hw_clock {
-	struct mpfs_periph_clock periph;
-	struct clk_hw hw;
+	struct clk_gate periph;
 	unsigned int id;
 };
 
-#define to_mpfs_periph_clk(_hw) container_of(_hw, struct mpfs_periph_hw_clock, hw)
-
 /*
  * mpfs_clk_lock prevents anything else from writing to the
  * mpfs clk block while a software locked register is being written.
@@ -273,64 +265,12 @@ static int mpfs_clk_register_cfgs(struct device *dev, struct mpfs_cfg_hw_clock *
  * peripheral clocks - devices connected to axi or ahb buses.
  */
 
-static int mpfs_periph_clk_enable(struct clk_hw *hw)
-{
-	struct mpfs_periph_hw_clock *periph_hw = to_mpfs_periph_clk(hw);
-	struct mpfs_periph_clock *periph = &periph_hw->periph;
-	u32 reg, val;
-	unsigned long flags;
-
-	spin_lock_irqsave(&mpfs_clk_lock, flags);
-
-	reg = readl_relaxed(periph->reg);
-	val = reg | (1u << periph->shift);
-	writel_relaxed(val, periph->reg);
-
-	spin_unlock_irqrestore(&mpfs_clk_lock, flags);
-
-	return 0;
-}
-
-static void mpfs_periph_clk_disable(struct clk_hw *hw)
-{
-	struct mpfs_periph_hw_clock *periph_hw = to_mpfs_periph_clk(hw);
-	struct mpfs_periph_clock *periph = &periph_hw->periph;
-	u32 reg, val;
-	unsigned long flags;
-
-	spin_lock_irqsave(&mpfs_clk_lock, flags);
-
-	reg = readl_relaxed(periph->reg);
-	val = reg & ~(1u << periph->shift);
-	writel_relaxed(val, periph->reg);
-
-	spin_unlock_irqrestore(&mpfs_clk_lock, flags);
-}
-
-static int mpfs_periph_clk_is_enabled(struct clk_hw *hw)
-{
-	struct mpfs_periph_hw_clock *periph_hw = to_mpfs_periph_clk(hw);
-	struct mpfs_periph_clock *periph = &periph_hw->periph;
-	u32 reg;
-
-	reg = readl_relaxed(periph->reg);
-	if (reg & (1u << periph->shift))
-		return 1;
-
-	return 0;
-}
-
-static const struct clk_ops mpfs_periph_clk_ops = {
-	.enable = mpfs_periph_clk_enable,
-	.disable = mpfs_periph_clk_disable,
-	.is_enabled = mpfs_periph_clk_is_enabled,
-};
-
 #define CLK_PERIPH(_id, _name, _parent, _shift, _flags) {			\
 	.id = _id,								\
-	.periph.shift = _shift,							\
-	.hw.init = CLK_HW_INIT_HW(_name, _parent, &mpfs_periph_clk_ops,		\
+	.periph.bit_idx = _shift,						\
+	.periph.hw.init = CLK_HW_INIT_HW(_name, _parent, &clk_gate_ops,		\
 				  _flags),					\
+	.periph.lock = &mpfs_clk_lock,						\
 }
 
 #define PARENT_CLK(PARENT) (&mpfs_cfg_clks[CLK_##PARENT].cfg.hw)
@@ -390,13 +330,13 @@ static int mpfs_clk_register_periphs(struct device *dev, struct mpfs_periph_hw_c
 		struct mpfs_periph_hw_clock *periph_hw = &periph_hws[i];
 
 		periph_hw->periph.reg = data->base + REG_SUBBLK_CLOCK_CR;
-		ret = devm_clk_hw_register(dev, &periph_hw->hw);
+		ret = devm_clk_hw_register(dev, &periph_hw->periph.hw);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed to register clock id: %d\n",
 					     periph_hw->id);
 
 		id = periph_hws[i].id;
-		data->hw_data.hws[id] = &periph_hw->hw;
+		data->hw_data.hws[id] = &periph_hw->periph.hw;
 	}
 
 	return 0;
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
