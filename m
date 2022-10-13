Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9FFC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 05:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7pwrepxG+4Lyr3VY1Co0IisIzS/8JBj3XMESsEyVIuI=; b=yBl8fKyFEjQfyz
	iT2Ul+1jCMoHvybpsWq9JgNzeX7pNNmxnOhtMSfG4nPQYl17csjtooeNXKIXITb2Y7xHnHggWclZp
	LZIbyd9UUFrMtiGPx6qtUIBSRwniiIpdnId1Y/IuKWrYI+xpisawA+j1HAUjNVML5W22h559danVO
	qQcIMmEVc5dlPYiqzWa3SNUqAUViOTzZSVDvynZn8AGbTdQL1e5DT5+IIAFa9GGO4WqjEG0Uk4hyO
	Yp6AlDmj3v4tA4jyeCOU5G1b9guDzk2c07WGe/+xsqgusn8M4KllwsvOXT96c2bVmDxFczja0jbZ7
	uWCynvoKo7segonlIZBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiqmQ-00AiZ0-2d; Thu, 13 Oct 2022 05:29:14 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiqmM-00AiXu-1u
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 05:29:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A954AB81C22;
	Thu, 13 Oct 2022 05:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5A04C433D6;
	Thu, 13 Oct 2022 05:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665638947;
	bh=u1aE7Guz757GpnzspBVuVfnvD43VfUWIebYhD99jq48=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=c2V70Kmoy/YkP9WxvptKHSrsS9DV22ct28HFRE5FnT9AdLPN/Pb1qZWgom48/rYDw
	 uvNuM1c4I5hP04XlVHzAArZPeKhw9LtyR+n3GvlSuv6bGFOCXOeEcOD68asy9331XR
	 lF3eZhMGH2LCJ+T4AfaQmtUmU9x9hev5PqIG2kXPWzN8WpzWur79+TbgOgMAxyZjoK
	 MrwYShI5wXoKCf2t9LUVsWCM5DtLQcMMG3o0bHV35LEFzJsBIiLkBINAEbVl6h/ZQP
	 bDpd0frHdLbRnoDVmoOlKDZrnodiC6ZBnKTgaaiYG6k2oAQ45fNQKHD8I9C9e1xtc5
	 hH4WBRln9NybQ==
Date: Thu, 13 Oct 2022 06:29:03 +0100
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org, Sasha Levin <sashal@kernel.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
CC: Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, mturquette@baylibre.com,
 sboyd@kernel.org, linux-clk@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_AUTOSEL_6=2E0_20/67=5D_clk=3A_microc?= =?US-ASCII?Q?hip=3A_mpfs=3A_add_MSS_pll=27s_set_=26_round_rate?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20221013001554.1892206-20-sashal@kernel.org>
References: <20221013001554.1892206-1-sashal@kernel.org> <20221013001554.1892206-20-sashal@kernel.org>
Message-ID: <93982EAD-5EE5-4096-9AD6-BFA76905F1BB@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_222910_412010_20B2257F 
X-CRM114-Status: UNSURE (   9.13  )
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

Not a fix, NAK. Same for 5.19.

On 13 October 2022 01:15:01 IST, Sasha Levin <sashal@kernel.org> wrote:
>From: Conor Dooley <conor.dooley@microchip.com>
>
>[ Upstream commit 14016e4aafc5f157c10fb1a386fa3b3bd9c30e9a ]
>
>The MSS pll is not a fixed frequency clock, so add set() & round_rate()
>support.
>Control is limited to a 7 bit output divider as other devices on the
>FPGA occupy the other three outputs of the PLL & prevent changing
>the multiplier.
>
>Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
>Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>Reviewed-by: Claudiu Beznea <claudiu.beznea@microchip.com>
>Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
>Link: https://lore.kernel.org/r/20220909123123.2699583-9-conor.dooley@microchip.com
>Signed-off-by: Sasha Levin <sashal@kernel.org>
>---
> drivers/clk/microchip/clk-mpfs.c | 54 ++++++++++++++++++++++++++++++++
> 1 file changed, 54 insertions(+)
>
>diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
>index b6b89413e090..cb4ec4749279 100644
>--- a/drivers/clk/microchip/clk-mpfs.c
>+++ b/drivers/clk/microchip/clk-mpfs.c
>@@ -126,8 +126,62 @@ static unsigned long mpfs_clk_msspll_recalc_rate(struct clk_hw *hw, unsigned lon
> 	return prate * mult / (ref_div * MSSPLL_FIXED_DIV * postdiv);
> }
> 
>+static long mpfs_clk_msspll_round_rate(struct clk_hw *hw, unsigned long rate, unsigned long *prate)
>+{
>+	struct mpfs_msspll_hw_clock *msspll_hw = to_mpfs_msspll_clk(hw);
>+	void __iomem *mult_addr = msspll_hw->base + msspll_hw->reg_offset;
>+	void __iomem *ref_div_addr = msspll_hw->base + REG_MSSPLL_REF_CR;
>+	u32 mult, ref_div;
>+	unsigned long rate_before_ctrl;
>+
>+	mult = readl_relaxed(mult_addr) >> MSSPLL_FBDIV_SHIFT;
>+	mult &= clk_div_mask(MSSPLL_FBDIV_WIDTH);
>+	ref_div = readl_relaxed(ref_div_addr) >> MSSPLL_REFDIV_SHIFT;
>+	ref_div &= clk_div_mask(MSSPLL_REFDIV_WIDTH);
>+
>+	rate_before_ctrl = rate * (ref_div * MSSPLL_FIXED_DIV) / mult;
>+
>+	return divider_round_rate(hw, rate_before_ctrl, prate, NULL, MSSPLL_POSTDIV_WIDTH,
>+				  msspll_hw->flags);
>+}
>+
>+static int mpfs_clk_msspll_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long prate)
>+{
>+	struct mpfs_msspll_hw_clock *msspll_hw = to_mpfs_msspll_clk(hw);
>+	void __iomem *mult_addr = msspll_hw->base + msspll_hw->reg_offset;
>+	void __iomem *ref_div_addr = msspll_hw->base + REG_MSSPLL_REF_CR;
>+	void __iomem *postdiv_addr = msspll_hw->base + REG_MSSPLL_POSTDIV_CR;
>+	u32 mult, ref_div, postdiv;
>+	int divider_setting;
>+	unsigned long rate_before_ctrl, flags;
>+
>+	mult = readl_relaxed(mult_addr) >> MSSPLL_FBDIV_SHIFT;
>+	mult &= clk_div_mask(MSSPLL_FBDIV_WIDTH);
>+	ref_div = readl_relaxed(ref_div_addr) >> MSSPLL_REFDIV_SHIFT;
>+	ref_div &= clk_div_mask(MSSPLL_REFDIV_WIDTH);
>+
>+	rate_before_ctrl = rate * (ref_div * MSSPLL_FIXED_DIV) / mult;
>+	divider_setting = divider_get_val(rate_before_ctrl, prate, NULL, MSSPLL_POSTDIV_WIDTH,
>+					  msspll_hw->flags);
>+
>+	if (divider_setting < 0)
>+		return divider_setting;
>+
>+	spin_lock_irqsave(&mpfs_clk_lock, flags);
>+
>+	postdiv = readl_relaxed(postdiv_addr);
>+	postdiv &= ~(clk_div_mask(MSSPLL_POSTDIV_WIDTH) << MSSPLL_POSTDIV_SHIFT);
>+	writel_relaxed(postdiv, postdiv_addr);
>+
>+	spin_unlock_irqrestore(&mpfs_clk_lock, flags);
>+
>+	return 0;
>+}
>+
> static const struct clk_ops mpfs_clk_msspll_ops = {
> 	.recalc_rate = mpfs_clk_msspll_recalc_rate,
>+	.round_rate = mpfs_clk_msspll_round_rate,
>+	.set_rate = mpfs_clk_msspll_set_rate,
> };
> 
> #define CLK_PLL(_id, _name, _parent, _shift, _width, _flags, _offset) {			\

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
