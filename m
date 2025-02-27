Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3586AC021BE
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 09:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nLrM6+RASdOlwGH7+2NfIpqo45hhQHZB/VcuTVhIViM=; b=Nr0mmFF1iKlS3d
	5eLdOETy0KT9OXlN7bkc4CA8lObUNLVFPK8S6nyFQbn6e21Dwlgt6AX8hAJAb8DndVMv1jda/NavE
	jx6W9zPIbF5HrUkhcJyAqNgZxC6URvdrkIsb20S/yWmM3IjBA/h0bSo46KZ/1Asirq3MACyZOe3ky
	P+cm9nYK5diffXVdxxccbEEJLqryjsQDLyOCb4kasmik2webZ1oABAoq2h88qSRw9tKhhHub2sGGv
	bi+ZbkVpccer8gnfv2WJkJZlavfmGAx2596SiFz699o6iM8r7dF+FlzUDI7SYAAFbUpFbMKf/4P+a
	MCqhKvsDfrSWlS7ohSDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnaHC-00000006sLq-3xXo;
	Thu, 27 Feb 2025 09:33:54 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tna1W-00000006prT-25xO;
	Thu, 27 Feb 2025 09:17:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ufZqnl34vm+Pc3lq/GZFpFx8vvNtFX+vITx7KqbOkWc=; b=Cu0S5ynVTtTZxDgbsXX8fgD9Pf
	iCbv2qYrqpBlzm2jdjz8Lf2cwvZOvlriYf2nXoV65RT4m2GcPFqwxrBWj9tPGMnYLzRb40RTAErcv
	yrDjd51be6Xot7fWRCTUjhrFULrwoWHYpdCPihoOPmkZDuMyxl3QP7OGELscLIFPPl5fvaTRdSc5B
	uCZ8H83Kb8xkDCZmPiCJhg0FUQ3SHbVCNj4bqN/cp9iZ2TbUtBl6Xu0NL2OHRiwKMo4mZr6YTpyrU
	kkVtFRioqKVS55ri5MiPhJmvjEJCtQZJmoHpEPj6OsEjrCpwUpktLQOwOji8mtu52ojl6GcBoLRcD
	4vFlmDYg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37578 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tna1O-0006eI-36;
	Thu, 27 Feb 2025 09:17:35 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tna14-0052tT-S4; Thu, 27 Feb 2025 09:17:14 +0000
In-Reply-To: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
References: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <drew@pdp7.com>,
	Eric Dumazet <edumazet@google.com>,
	Fu Wei <wefu@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 11/11] net: stmmac: thead: switch to use
 set_clk_tx_rate() hook
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tna14-0052tT-S4@rmk-PC.armlinux.org.uk>
Date: Thu, 27 Feb 2025 09:17:14 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_011742_536980_6B753FAD 
X-CRM114-Status: GOOD (  11.50  )
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

Switch from using the fix_mac_speed() hook to set_clk_tx_rate() to
manage the transmit clock.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-thead.c  | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
index f9f2bd65959f..c72ee759aae5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
@@ -101,10 +101,11 @@ static int thead_dwmac_set_txclk_dir(struct plat_stmmacenet_data *plat)
 	return 0;
 }
 
-static void thead_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
+static int thead_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
+				 phy_interface_t interface, int speed)
 {
+	struct thead_dwmac *dwmac = bsp_priv;
 	struct plat_stmmacenet_data *plat;
-	struct thead_dwmac *dwmac = priv;
 	unsigned long rate;
 	long tx_rate;
 	u32 div, reg;
@@ -114,7 +115,7 @@ static void thead_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
 	switch (plat->mac_interface) {
 	/* For MII, rxc/txc is provided by phy */
 	case PHY_INTERFACE_MODE_MII:
-		return;
+		return 0;
 
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:
@@ -127,23 +128,24 @@ static void thead_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
 		tx_rate = rgmii_clock(speed);
 		if (tx_rate < 0) {
 			dev_err(dwmac->dev, "invalid speed %d\n", speed);
-			return;
+			return tx_rate;
 		}
 
 		div = rate / tx_rate;
 		if (rate != tx_rate * div) {
 			dev_err(dwmac->dev, "invalid gmac rate %lu\n", rate);
-			return;
+			return -EINVAL;
 		}
 
 		reg = FIELD_PREP(GMAC_PLLCLK_DIV_EN, 1) |
 		      FIELD_PREP(GMAC_PLLCLK_DIV_NUM, div);
 		writel(reg, dwmac->apb_base + GMAC_PLLCLK_DIV);
-		break;
+		return 0;
+
 	default:
 		dev_err(dwmac->dev, "unsupported phy interface %d\n",
 			plat->mac_interface);
-		return;
+		return -EINVAL;
 	}
 }
 
@@ -235,7 +237,7 @@ static int thead_dwmac_probe(struct platform_device *pdev)
 	dwmac->plat = plat;
 	dwmac->apb_base = apb;
 	plat->bsp_priv = dwmac;
-	plat->fix_mac_speed = thead_dwmac_fix_speed;
+	plat->set_clk_tx_rate = thead_set_clk_tx_rate;
 	plat->init = thead_dwmac_init;
 
 	return devm_stmmac_pltfr_probe(pdev, plat, &stmmac_res);
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
