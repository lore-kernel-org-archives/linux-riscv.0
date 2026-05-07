Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7CCCD343B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 May 2026 08:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f6iAyxp7tHZ4VWxqYTjL3bksMpjUQ6QogALcss7CCP8=; b=MELa7SO7U+lHup
	1Ww8soDXc+Co3t1x+hmx2exb9xqwSJOvr/e3iq/xNjAzY7ZSkr7844EANyarw/zdwxAG6OrRbSKuA
	3EGqHVfwZQdY40eEpXWwnw+FDE5F82jw3NLu6Ld5HtG1QTWYtexn5W+YDpc8KBGHVFt6WMhC7BaSc
	Lvn0Qd6j12tO5f/MHBwuaZ3cFwWDHyxM9OA7K6c/Eaa9gdKiH/vyoU2UFEnQivAJlI85DvyWB1Nnq
	cwWQY5A+VUYrIMJx7P6KouweOjKoPa3WLgZTwefenzo3L+3Dp56eUEomVKq3aFOXH7jsWHOVJEVNk
	K7naLnkmuOw/Hlzsxdjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKtvu-0000000380K-0vkk;
	Thu, 07 May 2026 08:18:10 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKtvp-000000037xX-3RUj;
	Thu, 07 May 2026 08:18:08 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.82])
	by APP-03 (Coremail) with SMTP id rQCowAC3m+KLSvxpI_pNEA--.42168S4;
	Thu, 07 May 2026 16:17:21 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH 02/12] clk: thead: th1520-ap: add support for MISC subsys clocks
Date: Thu,  7 May 2026 16:17:00 +0800
Message-ID: <20260507081710.4090814-3-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowAC3m+KLSvxpI_pNEA--.42168S4
X-Coremail-Antispam: 1UD129KBjvJXoWxJFWftrW7XFW8GFWxtrWrZrb_yoWrJFyUpa
	yrGrWftF4kXF4rWay3Jr1IyFsxuF4SqFyqqa9rG34xKw4fWry5JFy0kayFyF4Fg34fCay7
	Jrs8KrW5CFs8GFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmF14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2
	KfnxnUUI43ZEXa7sRipB-tUUUUU==
X-Originating-IP: [112.94.100.82]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_011806_230083_4B3CEC84 
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
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, Philipp Zabel <p.zabel@pengutronix.de>, Han Gao <rabenda.cn@gmail.com>, linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Yao Zi <ziyao@disroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The TH1520 SoC contains a MISC_SUBSYS clock controller, which allows
controlling of USB related clocks and MMC/SD controller AHB bus clocks.

Add support for this clock controller, in order to enable USB support.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 drivers/clk/thead/clk-th1520-ap.c | 64 +++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index 3a6847f1c950f..24f785f0b329a 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -1266,6 +1266,41 @@ static CCU_GATE(CLK_MIPIDSI1_PIXCLK, mipi_dsi1_pixclk, "mipi-dsi1-pixclk",
 static CCU_GATE(CLK_HDMI_PIXCLK, hdmi_pixclk, "hdmi-pixclk", video_pll_clk_pd,
 		0x4, 0, 0);
 
+static struct clk_fixed_factor usb_suspend_div_clk = {
+	.div		= 24,
+	.mult		= 1,
+	.hw.init	= CLK_HW_INIT_PARENTS_DATA("usb-suspend-div",
+						   osc_24m_clk,
+						   &clk_fixed_factor_ops,
+						   0),
+};
+
+static const struct clk_parent_data usb_suspend_parents[] = {
+	{ .hw = &usb_suspend_div_clk.hw },
+};
+
+static CCU_GATE(CLK_MISCSYS_ACLK, miscsys_aclk, "miscsys-aclk", axi_aclk_pd,
+		0x0, 0, CLK_IS_CRITICAL);
+
+static const struct clk_parent_data miscsys_aclk_pd[] = {
+	{ .hw = &miscsys_aclk.gate.hw },
+};
+
+static CCU_GATE(CLK_USB, usb_clk, "usb", miscsys_aclk_pd, 0x4, 0,
+		CLK_IS_CRITICAL);
+static CCU_GATE(CLK_USB_CTL_REF, usb_ctl_ref_clk, "usb-ctl-ref", osc_24m_clk,
+		0x4, 1, 0);
+static CCU_GATE(CLK_USB_PHY_REF, usb_phy_ref_clk, "usb-phy-ref", osc_24m_clk,
+		0x4, 2, 0);
+static CCU_GATE(CLK_USB_SUSPEND, usb_suspend_clk, "usb-suspend",
+		usb_suspend_parents, 0x4, 3, 0);
+static CCU_GATE(CLK_EMMC, emmc_clk, "emmc", perisys_ahb_hclk_pd, 0x8, 0,
+		0);
+static CCU_GATE(CLK_SDIO0, sdio0_clk, "sdio0", perisys_ahb_hclk_pd, 0xc, 0,
+		0);
+static CCU_GATE(CLK_SDIO1, sdio1_clk, "sdio1", perisys_ahb_hclk_pd, 0x10, 0,
+		0);
+
 static CLK_FIXED_FACTOR_HW(gmac_pll_clk_100m, "gmac-pll-clk-100m",
 			   &gmac_pll_clk.common.hw, 10, 1, 0);
 
@@ -1410,6 +1445,17 @@ static struct ccu_gate *th1520_vo_gate_clks[] = {
 	&hdmi_pixclk
 };
 
+static struct ccu_gate *th1520_misc_gate_clks[] = {
+	&miscsys_aclk,
+	&usb_clk,
+	&usb_ctl_ref_clk,
+	&usb_phy_ref_clk,
+	&usb_suspend_clk,
+	&emmc_clk,
+	&sdio0_clk,
+	&sdio1_clk
+};
+
 static const struct regmap_config th1520_clk_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
@@ -1451,6 +1497,14 @@ static const struct th1520_plat_data th1520_vo_platdata = {
 	.nr_gate_clks = ARRAY_SIZE(th1520_vo_gate_clks),
 };
 
+static const struct th1520_plat_data th1520_misc_platdata = {
+	.th1520_gate_clks = th1520_misc_gate_clks,
+
+	.nr_clks = CLK_SDIO1 + 1,
+
+	.nr_gate_clks = ARRAY_SIZE(th1520_misc_gate_clks),
+};
+
 /*
  * Maintain clock rate of c910_bus_clk below TH1520_C910_BUS_MAX_RATE (750MHz)
  * when its parent, c910_clk, changes the rate.
@@ -1609,6 +1663,12 @@ static int th1520_clk_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	if (plat_data == &th1520_ap_platdata) {
+		ret = devm_clk_hw_register(dev, &usb_suspend_div_clk.hw);
+		if (ret)
+			return ret;
+	}
+
 	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, priv);
 	if (ret)
 		return ret;
@@ -1625,6 +1685,10 @@ static const struct of_device_id th1520_clk_match[] = {
 		.compatible = "thead,th1520-clk-vo",
 		.data = &th1520_vo_platdata,
 	},
+	{
+		.compatible = "thead,th1520-clk-misc",
+		.data = &th1520_misc_platdata,
+	},
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, th1520_clk_match);
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
