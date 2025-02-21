Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE1EC021B3
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 14:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s+tY47I09LH2CvcMB2Abu3az6O+wHAcnxQrTUz+C0L0=; b=l78g0jXnvMNiRe
	5C8076LM2GIBN6hgODihdmGszVkMQnjS3eEhlC41RbDp8ZFBZV0xv2B29ogWsaU7R6NsR1gQ4lLz1
	GWtZnSQt23COzvBBKnjdH3SD7eSZIvoxiblbbn/tbZO73325iGcwt1F23upCiGs1Ns32hXBdMRrYI
	Vg4iSOPoFuXJZrHti5FADv31ht3IklBYXgJe3Br3e4wVYwAo9pyUofndUQ2D7iai86wm4aqMgPUE6
	68irML1qj20aS1ofriFEthwIIpvaLJMrpu2WN2wSZbTbVcRQESMLFPmaUR3tapTQCc9bIKooVofB7
	OeU+alLLxSNTtCbKEH1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlUAH-00000005qlu-1cX0;
	Fri, 21 Feb 2025 14:38:05 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlTqX-00000005n74-3Sfg;
	Fri, 21 Feb 2025 14:17:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9EYM2uy8xE8SDz3hxuTPLu62d49PDavTllU9e+M4HNw=; b=njU4+l7jYgaHqHYXdIZc8CokRV
	2sPUTQcNkg++bJ+4T9TPRwkFRG7fk7L53YxaQ5CtetHmvfO6oy7JOxeyuixhmH77z2eMAwvU0cWa/
	5u6ipI5KcceOYgOJFb7wa5rpQC+Lq2jJafVZAhT/htVJvLJI0iTM/+LrFY/skhxoGWvD1etorGCZP
	85943dHGlqdOkePjNuz1Y5QWEmt6RsYXkPvx8NjFiocC0bWXqKiH9efRetnxon4OSJQJKGANuddvw
	IYxkjESQKqKRQ3RAv17iXcGvBfuRDuB0iJpzjlKjYFZoF5edGnI/BSiUsiSd4FCCKPgNIv8ddsZk1
	4DY2AZuw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50484 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tlToS-0004nk-0u;
	Fri, 21 Feb 2025 14:15:32 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tlTo8-004W3a-CO; Fri, 21 Feb 2025 14:15:12 +0000
In-Reply-To: <Z7iKdaCp4hLWWgJ2@shell.armlinux.org.uk>
References: <Z7iKdaCp4hLWWgJ2@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 1/2] net: stmmac: thead: use rgmii_clock() for RGMII
 clock rate
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tlTo8-004W3a-CO@rmk-PC.armlinux.org.uk>
Date: Fri, 21 Feb 2025 14:15:12 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_061741_859966_EB293041 
X-CRM114-Status: UNSURE (   9.95  )
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

Switch to using rgmii_clock() to get the RGMII TXC rate, and calculate
the divisor from the parent clock rate and the rate indicated by
rgmii_clock().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-thead.c    | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
index ddb1d8aba321..f16fa341aadb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
@@ -109,6 +109,7 @@ static void thead_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
 	struct plat_stmmacenet_data *plat;
 	struct thead_dwmac *dwmac = priv;
 	unsigned long rate;
+	long tx_rate;
 	u32 div, reg;
 
 	plat = dwmac->plat;
@@ -131,21 +132,14 @@ static void thead_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
 
 		writel(0, dwmac->apb_base + GMAC_PLLCLK_DIV);
 
-		switch (speed) {
-		case SPEED_1000:
-			div = rate / GMAC_GMII_RGMII_RATE;
-			break;
-		case SPEED_100:
-			div = rate / GMAC_MII_RATE;
-			break;
-		case SPEED_10:
-			div = rate * 10 / GMAC_MII_RATE;
-			break;
-		default:
+		tx_rate = rgmii_clock(speed);
+		if (tx_rate < 0) {
 			dev_err(dwmac->dev, "invalid speed %d\n", speed);
 			return;
 		}
 
+		div = rate / tx_rate;
+
 		reg = FIELD_PREP(GMAC_PLLCLK_DIV_EN, 1) |
 		      FIELD_PREP(GMAC_PLLCLK_DIV_NUM, div);
 		writel(reg, dwmac->apb_base + GMAC_PLLCLK_DIV);
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
