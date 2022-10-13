Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58B5C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 00:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o5yLYK3tiwWWrghNtrs0A4Bl0RkBRbMSyzssDc4gEkM=; b=V0V/rsv2EBkkv4
	t6+Y3XqK0CXQh7XfDhj2jraE05wa4WUOyEiQft+m6PtscyHl+7V0JJBTNVR0EtZ0LuXQvc1DZpyyM
	XW9fANYpRG4KIDx5H5l89PPozNk+sG1z4RTmCFeKlW2jo4buCY726vc74zUBbl/HA+iXNIDqcurnS
	OTCuVZFCJPXGR+4BOgKB8xhnLXwhSVxdwOpss+D75yC7oy3vmNwSBoBQ9Pjkz4i//kCxtnE+w9Kfz
	n5Jvrna5EwlehFx71VDDlhrYRMLnt96+LHnDtPoYsT9rNEA3O9PkRfWg73aESSw+Zsfoh5ZyM4VGS
	Ve2iXEmFWjiHuD6pF4Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiluC-009mLG-NJ; Thu, 13 Oct 2022 00:16:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oilu4-009mHG-5o
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 00:16:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BD325616BD;
	Thu, 13 Oct 2022 00:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CFD0C433C1;
	Thu, 13 Oct 2022 00:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665620207;
	bh=Cs778EV16yW6rgUzQmQbbcwO76N19BWUWRroMVbo2DU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JXifm+q6OJQcS2d4qPiNIXGxwuuoMtFIR/FYb1xPLMTyBygwk3rNl875BEkZfi9xe
	 kmMzeXT+k6BIHJJRXyxZS0hWTk+vWKYzO7gpsP/Tr7gOwXiuItZGMUwiRfsX6PrA4f
	 aNH21mNEr9WZLHLhDA/obd/yWPjqDhtUSdHbbAkykAIKvUyJcJPJ50cCPrAKkAKElV
	 xXenH4OgSwtjf70EncfuDqK9ubUnvSdb3Qr9NIkFb+TH5GpG2cqOdoobmDR291PxJW
	 Sjgj1WLMkml/rJFLI/gzENSkn1wJzwAR3NlrHZJ/WjK/GIzTXryPFh2Memh2xW0w4z
	 +1pMTGrrdUEiw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Sasha Levin <sashal@kernel.org>,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 20/67] clk: microchip: mpfs: add MSS pll's set & round rate
Date: Wed, 12 Oct 2022 20:15:01 -0400
Message-Id: <20221013001554.1892206-20-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221013001554.1892206-1-sashal@kernel.org>
References: <20221013001554.1892206-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_171648_343459_D560D59D 
X-CRM114-Status: GOOD (  11.87  )
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

From: Conor Dooley <conor.dooley@microchip.com>

[ Upstream commit 14016e4aafc5f157c10fb1a386fa3b3bd9c30e9a ]

The MSS pll is not a fixed frequency clock, so add set() & round_rate()
support.
Control is limited to a 7 bit output divider as other devices on the
FPGA occupy the other three outputs of the PLL & prevent changing
the multiplier.

Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Link: https://lore.kernel.org/r/20220909123123.2699583-9-conor.dooley@microchip.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/microchip/clk-mpfs.c | 54 ++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
index b6b89413e090..cb4ec4749279 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -126,8 +126,62 @@ static unsigned long mpfs_clk_msspll_recalc_rate(struct clk_hw *hw, unsigned lon
 	return prate * mult / (ref_div * MSSPLL_FIXED_DIV * postdiv);
 }
 
+static long mpfs_clk_msspll_round_rate(struct clk_hw *hw, unsigned long rate, unsigned long *prate)
+{
+	struct mpfs_msspll_hw_clock *msspll_hw = to_mpfs_msspll_clk(hw);
+	void __iomem *mult_addr = msspll_hw->base + msspll_hw->reg_offset;
+	void __iomem *ref_div_addr = msspll_hw->base + REG_MSSPLL_REF_CR;
+	u32 mult, ref_div;
+	unsigned long rate_before_ctrl;
+
+	mult = readl_relaxed(mult_addr) >> MSSPLL_FBDIV_SHIFT;
+	mult &= clk_div_mask(MSSPLL_FBDIV_WIDTH);
+	ref_div = readl_relaxed(ref_div_addr) >> MSSPLL_REFDIV_SHIFT;
+	ref_div &= clk_div_mask(MSSPLL_REFDIV_WIDTH);
+
+	rate_before_ctrl = rate * (ref_div * MSSPLL_FIXED_DIV) / mult;
+
+	return divider_round_rate(hw, rate_before_ctrl, prate, NULL, MSSPLL_POSTDIV_WIDTH,
+				  msspll_hw->flags);
+}
+
+static int mpfs_clk_msspll_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long prate)
+{
+	struct mpfs_msspll_hw_clock *msspll_hw = to_mpfs_msspll_clk(hw);
+	void __iomem *mult_addr = msspll_hw->base + msspll_hw->reg_offset;
+	void __iomem *ref_div_addr = msspll_hw->base + REG_MSSPLL_REF_CR;
+	void __iomem *postdiv_addr = msspll_hw->base + REG_MSSPLL_POSTDIV_CR;
+	u32 mult, ref_div, postdiv;
+	int divider_setting;
+	unsigned long rate_before_ctrl, flags;
+
+	mult = readl_relaxed(mult_addr) >> MSSPLL_FBDIV_SHIFT;
+	mult &= clk_div_mask(MSSPLL_FBDIV_WIDTH);
+	ref_div = readl_relaxed(ref_div_addr) >> MSSPLL_REFDIV_SHIFT;
+	ref_div &= clk_div_mask(MSSPLL_REFDIV_WIDTH);
+
+	rate_before_ctrl = rate * (ref_div * MSSPLL_FIXED_DIV) / mult;
+	divider_setting = divider_get_val(rate_before_ctrl, prate, NULL, MSSPLL_POSTDIV_WIDTH,
+					  msspll_hw->flags);
+
+	if (divider_setting < 0)
+		return divider_setting;
+
+	spin_lock_irqsave(&mpfs_clk_lock, flags);
+
+	postdiv = readl_relaxed(postdiv_addr);
+	postdiv &= ~(clk_div_mask(MSSPLL_POSTDIV_WIDTH) << MSSPLL_POSTDIV_SHIFT);
+	writel_relaxed(postdiv, postdiv_addr);
+
+	spin_unlock_irqrestore(&mpfs_clk_lock, flags);
+
+	return 0;
+}
+
 static const struct clk_ops mpfs_clk_msspll_ops = {
 	.recalc_rate = mpfs_clk_msspll_recalc_rate,
+	.round_rate = mpfs_clk_msspll_round_rate,
+	.set_rate = mpfs_clk_msspll_set_rate,
 };
 
 #define CLK_PLL(_id, _name, _parent, _shift, _width, _flags, _offset) {			\
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
