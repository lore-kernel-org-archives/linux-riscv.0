Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EA9109C033
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 16:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2yebenLRvlegTzrEJZ/q56Iifecd9BXEZOLFCHOHhVM=; b=dXVQ67KYwF1e5l
	7thxk5ob3jo9IBA3+LFGtNVtZOjDVKYbDZcyBuUQudizK0kROtxWqvycLIXSXPiEGD8ZXKFUcy5HL
	61nlhGpf4fuRag2pYZGKGuzwkM7y4cWYJBPIRgUs3K1IQBSekcBnj4sIHKVflw7RhF76r9RCjiEYU
	Xw0DXOeWx5TN0FH7u2ApVAdx5yQ/dMbRmXnMCYxGklYJyF/sPvd/NEqlxf2oNmB6iuARpPTQRj+n7
	UB2yXPMcergIO6GBQkoe1eBRUVBXZANC6KGY2a+svSV5AtIykWGm5q6KsGcaR4reGsEEj/wsVOWnn
	T0TgTCHetjhhFbVzI2vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5R6U-00000003t2T-14Nc;
	Wed, 25 Mar 2026 16:29:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5R6S-00000003t1d-1cnJ
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 16:29:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 079B040ACB;
	Wed, 25 Mar 2026 16:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FCF8C2BCB0;
	Wed, 25 Mar 2026 16:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774456147;
	bh=jyd3EFZzWSq4QB4qpE3EwZc6Fw6cuxDBKBxVJfFLpk0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DvZ5jh0BGnUEeFwkk64qIx3GOzxT0Br3un3UhzHl+r3XrNZeGvzgcprDDeTYjGOR7
	 KMDYJyEOPM7e/Ib2nQbtdUjhxNAzVNBf9Zg6+pIZl4irJT7uJFxCUQ+N72JheyOWjS
	 5bHdJZNnCWWiwOQUqKXJFDMVPulSjYKtS7XF3284u5Mn0AvIoWm6e4xLgZbV0vsF8/
	 JyhhGnO8YKrq6tfc47NzPV3ssVx2ESzuw9VosqKydA8wzrXXf+eYK2mfs4fEQ4cCIf
	 m1npXKp/dKWy/PsbllZ6WHhjEdbA3gabWWQzmROUt/ABORLKKQJ2Gx/+fmFuRKygqc
	 tvb0X2zhy/UUg==
From: Conor Dooley <conor@kernel.org>
To: netdev@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Valentina.FernandezAlanis@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Richard Cochran <richardcochran@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
	Abin Joseph <abin.joseph@amd.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Ryan.Wanner@microchip.com,
	Kevin Hao <haokexin@gmail.com>
Subject: [PATCH net-next v5 03/14] net: macb: split USRIO_HAS_CLKEN capability in two
Date: Wed, 25 Mar 2026 16:28:07 +0000
Message-ID: <20260325-gradient-grading-b23b9e6ef9ff@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325-unsterile-flail-4c7729750dc4@spud>
References: <20260325-unsterile-flail-4c7729750dc4@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3507; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=jDBDApYWtlPJyWp/8XUU5y95F7rynxZ3GbEw8hdT/gY=; b=kA0DAAoWeLQxh6CCYtIByyZiAGnEDTWjcD1cQB+gKRpx1v8lFcVSElEwiP5f9w7ghpL2Y9vtI oh1BAAWCgAdFiEEYduOhBqv/ES4Q4zteLQxh6CCYtIFAmnEDTUACgkQeLQxh6CCYtIR3gD+LNNo UTkPW2l91njGiMcn9mI4r3Qf4wA4qvUJQ5hRiToBAIotn7RZKqq67pLpyIM7GHwWTu+SOAwdu/x OexFpvkcP
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_092908_464273_83B35FD6 
X-CRM114-Status: GOOD (  17.66  )
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

While trying to rework the internal/external refclk selection on
sama7g5, Ryan and I noticed that the sama7g5 was "overloading" the
meaning of MACB_CAPS_USRIO_HAS_CLKEN, using it differently to how it was
originally intended.
Originally, on the macb hardware on sam9620 et al,
MACB_CAPS_USRIO_HAS_CLKEN represented the hardware having a bit that
needed to be set to turn on the input clock to the transceivers. The
sama7g5 doesn't have this bit, so for some reason the decision was made
to reuse this capability flag to control selection of internal/external
references.

Split the caps in two, so that capabilities do what they say on the tin,
and allow reworking the refclk selection handling without impacting the
older devices that use MACB_CAPS_USRIO_CLKEN for its original purpose.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/net/ethernet/cadence/macb.h      |  2 ++
 drivers/net/ethernet/cadence/macb_main.c | 11 ++++++++---
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
index 32217de5e0730..35b7129d7c1ee 100644
--- a/drivers/net/ethernet/cadence/macb.h
+++ b/drivers/net/ethernet/cadence/macb.h
@@ -787,6 +787,7 @@
 #define MACB_CAPS_NO_LSO			BIT(24)
 #define MACB_CAPS_EEE				BIT(25)
 #define MACB_CAPS_USRIO_HAS_MII			BIT(26)
+#define MACB_CAPS_USRIO_HAS_REFCLK_SOURCE	BIT(27)
 
 /* LSO settings */
 #define MACB_LSO_UFO_ENABLE			0x01
@@ -1226,6 +1227,7 @@ struct macb_usrio_config {
 	u32 rmii;
 	u32 rgmii;
 	u32 refclk;
+	u32 clken;
 	u32 hdfctlen;
 };
 
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 05a2df6e3e41d..859d03502666a 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4615,7 +4615,7 @@ static void macb_configure_caps(struct macb *bp,
 	}
 
 	if (refclk_ext)
-		bp->caps |= MACB_CAPS_USRIO_HAS_CLKEN;
+		bp->caps |= MACB_CAPS_USRIO_HAS_REFCLK_SOURCE;
 
 	dev_dbg(&bp->pdev->dev, "Cadence caps 0x%08x\n", bp->caps);
 }
@@ -4895,6 +4895,9 @@ static int macb_init_dflt(struct platform_device *pdev)
 		}
 
 		if (bp->caps & MACB_CAPS_USRIO_HAS_CLKEN)
+			val |= bp->usrio->clken;
+
+		if (bp->caps & MACB_CAPS_USRIO_HAS_REFCLK_SOURCE)
 			val |= bp->usrio->refclk;
 
 		macb_or_gem_writel(bp, USRIO, val);
@@ -5497,7 +5500,7 @@ static const struct macb_usrio_config at91_default_usrio = {
 	.mii = MACB_BIT(MII),
 	.rmii = MACB_BIT(RMII),
 	.rgmii = GEM_BIT(RGMII),
-	.refclk = MACB_BIT(CLKEN),
+	.clken = MACB_BIT(CLKEN),
 };
 
 static const struct macb_usrio_config sama7g5_usrio = {
@@ -5615,6 +5618,7 @@ static const struct macb_config mpfs_config = {
 static const struct macb_config sama7g5_gem_config = {
 	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE | MACB_CAPS_CLK_HW_CHG |
 		MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII |
+		MACB_CAPS_USRIO_HAS_REFCLK_SOURCE |
 		MACB_CAPS_MIIONRGMII | MACB_CAPS_GEM_HAS_PTP |
 		MACB_CAPS_USRIO_HAS_MII,
 	.dma_burst_length = 16,
@@ -5623,7 +5627,8 @@ static const struct macb_config sama7g5_gem_config = {
 
 static const struct macb_config sama7g5_emac_config = {
 	.caps = MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII |
-		MACB_CAPS_USRIO_HAS_CLKEN | MACB_CAPS_MIIONRGMII |
+		MACB_CAPS_MIIONRGMII |
+		MACB_CAPS_USRIO_HAS_REFCLK_SOURCE |
 		MACB_CAPS_GEM_HAS_PTP |
 		MACB_CAPS_USRIO_HAS_MII,
 	.dma_burst_length = 16,
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
