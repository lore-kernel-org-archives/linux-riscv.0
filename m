Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B837FD4F08
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 17:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rfRFw7KDUVQc0Wbe4+XJcaplBHNmHtS/ocK+GUVy4II=; b=o7FeADKFqrO5Lg
	Ifyj2fpaqc7AmHowJWUzqoYQ7FFOKGbhLzsnrh3cYkEpju0o9whrOZJKyPkTNXZm/ddSyRix0kDe0
	sisoKYOuDvnR3rMSkKaEOO4Su/foHx6aBjTy5JeRmSuQsxJsu8WMsIzl4BcxKZNEJwLZdanNnnD9W
	0Ioq4SK5mkEEhotTqfpiPAL58lQ9bOPezNKRNJrpEPTcjcVrlUCgJ6lAr+wyzunVdXCLUgVgdLuzo
	6qwaoi2yn1dqLTjF5MVFPYStIayc4cM45tPTzePchBMnNpvvGuesCtH3IilXnWnSE7jcJ+82wPM2C
	UwNzm90sB5PpvSwQUM+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w00je-00000009xqO-376p;
	Tue, 10 Mar 2026 17:19:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w00jc-00000009xpe-1Vvc
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 17:19:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0084E408FE;
	Tue, 10 Mar 2026 17:19:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DF10C19423;
	Tue, 10 Mar 2026 17:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773163147;
	bh=d+MyLOiuyfRC+NF64EIUpcY9qyHiXTVHxjTblw4Yz08=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SCNeWMn1m35PFvOXY1i1G++rR2Au25weAg7P477mhiUILy/1IvFe4m4e1RIMzCXG3
	 pQFqWTH3S2EjnABKGPiJwVzMoBlV8y8Keq2IxcmaVVEFszRAPESVc+4CoSkOpaz1V2
	 GUaUi1xuKbpKRuDmCil2CiNPrEOBiBVjrNPvjztoyMJMd4GvW4W7g6pPWGsw1Q96xl
	 RaPEiGjpB26qhFq8jPKKnkTDq3iqrmeL074laGAsU6+HHHKp0tTp4Z/Z2wFLwvaPXc
	 dJRKl/3nwTVBfk728zRIA6MabbxzRsy2DpIiUumX7G6X+K3uhhhCjWsSCl56Wa5QT6
	 oJgXFfwzEgW5Q==
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
	Ryan.Wanner@microchip.com
Subject: [PATCH net-next v3 04/10] net: macb: rework usrio refclk selection code
Date: Tue, 10 Mar 2026 17:17:11 +0000
Message-ID: <20260310-flinch-placidly-599515687107@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260310-moneyless-dispense-7bce14b16388@spud>
References: <20260310-moneyless-dispense-7bce14b16388@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5400; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=2bAmm8yzB8brPeFan+juq3/KVYptD7voFpcvqp+7QWc=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkbgnSbY+44O3/5smZRfL3atpMfvko/TdibPM+V//xqP TF+EfctHaUsDGJcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZhIYA8jQ+OF3MI/qvseT5p3 9NgtVY/o7AvdW47/CTs43dC1aHJzVTvDX5lMt39Lt3na7GRty2P6WXk3do3C78pQvo+/xRQv/G/ 25AAA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_101908_444255_B1A30637 
X-CRM114-Status: GOOD (  23.68  )
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

The USRIO based refclk selection code abuses a capability flag to set
the refclk to an external source based on match data/compatible on
sama7g5-emac and use an internal source for the gmac.

Ryan previously added a property in an attempt to decouple the refclk
source from the compatible, because this is not fixed by compatible
and there's variance based on the choices made by board designers.

Originally when Ryan added it, he removed the capability flag entirely
from match data, but this changed the default for the sama7g5-emac and
the removal had to be reverted for these devices. Because these devices
default to an external refclk, and the current property is only capable
of communicating external refclks, there's no way to make the
sama7g5-emac use an internal refclk.

Additionally, this property has no limiting based on compatible, and
if used on a platform with an external refclk that is not controlled
by USRIO the capability would be erroneously set. Because of the reuse
of the at91_default_usrio struct by non-at91 devices, this could cause
the refclk bit to be set in error, on a system where the refclk is
externally provided without usrio settings being required.

Change the new capability flag so that it actually represents the
hardware being capable of controlling the refclk source via USRIO,
and move the selection of default behaviour into the macb_usrio_config
struct provided as part of match data.
Modify the devicetree code to support a new property,
"cdns,refclk-source" which will support devices with either default,
retaining support for "cdns,refclk-external" for compatibility reasons.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/net/ethernet/cadence/macb.h      |  1 +
 drivers/net/ethernet/cadence/macb_main.c | 55 ++++++++++++++++++------
 2 files changed, 44 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
index baf48f02d7e27..9cd565cb87e4c 100644
--- a/drivers/net/ethernet/cadence/macb.h
+++ b/drivers/net/ethernet/cadence/macb.h
@@ -1214,6 +1214,7 @@ struct macb_usrio_config {
 	u32 refclk;
 	u32 clken;
 	u32 hdfctlen;
+	bool refclk_default_external;
 };
 
 struct macb_config {
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index d908850c59498..1f9e46cf7e1cb 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4318,12 +4318,8 @@ static const struct net_device_ops macb_netdev_ops = {
 static void macb_configure_caps(struct macb *bp,
 				const struct macb_config *dt_conf)
 {
-	struct device_node *np = bp->pdev->dev.of_node;
-	bool refclk_ext;
 	u32 dcfg;
 
-	refclk_ext = of_property_read_bool(np, "cdns,refclk-ext");
-
 	if (dt_conf)
 		bp->caps = dt_conf->caps;
 
@@ -4356,9 +4352,6 @@ static void macb_configure_caps(struct macb *bp,
 		}
 	}
 
-	if (refclk_ext)
-		bp->caps |= MACB_CAPS_USRIO_HAS_REFCLK_SOURCE;
-
 	dev_dbg(&bp->pdev->dev, "Cadence caps 0x%08x\n", bp->caps);
 }
 
@@ -4626,8 +4619,36 @@ static int macb_init(struct platform_device *pdev)
 		if (bp->caps & MACB_CAPS_USRIO_HAS_CLKEN)
 			val |= bp->usrio->clken;
 
-		if (bp->caps & MACB_CAPS_USRIO_HAS_REFCLK_SOURCE)
-			val |= bp->usrio->refclk;
+		if (bp->caps & MACB_CAPS_USRIO_HAS_REFCLK_SOURCE) {
+			const char *prop;
+			bool refclk_ext;
+			int ret;
+
+			/* Default to whatever was set in the match data for
+			 * this device. There's two properties for refclk
+			 * control, but the boolean one is deprecated so is
+			 * a lower priority to check, no device should have
+			 * both.
+			 */
+			refclk_ext = bp->usrio->refclk_default_external;
+
+			ret = of_property_read_string(pdev->dev.of_node,
+						      "cdns,refclk-source", &prop);
+			if (!ret) {
+				if (!strcmp(prop, "external"))
+					refclk_ext = true;
+				else
+					refclk_ext = false;
+			} else {
+				ret = of_property_read_bool(pdev->dev.of_node,
+							    "cdns,refclk-ext");
+				if (ret)
+					refclk_ext = true;
+			}
+
+			if (refclk_ext)
+				val |= bp->usrio->refclk;
+		}
 
 		macb_or_gem_writel(bp, USRIO, val);
 	}
@@ -5223,11 +5244,21 @@ static const struct macb_usrio_config at91_default_usrio = {
 	.clken = MACB_BIT(CLKEN),
 };
 
-static const struct macb_usrio_config sama7g5_usrio = {
+static const struct macb_usrio_config sama7g5_gem_usrio = {
 	.mii = 0,
 	.rmii = 1,
 	.rgmii = 2,
 	.refclk = BIT(2),
+	.refclk_default_external = false,
+	.hdfctlen = BIT(6),
+};
+
+static const struct macb_usrio_config sama7g5_emac_usrio = {
+	.mii = 0,
+	.rmii = 1,
+	.rgmii = 2,
+	.refclk = BIT(2),
+	.refclk_default_external = true,
 	.hdfctlen = BIT(6),
 };
 
@@ -5364,7 +5395,7 @@ static const struct macb_config sama7g5_gem_config = {
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
-	.usrio = &sama7g5_usrio,
+	.usrio = &sama7g5_gem_usrio,
 };
 
 static const struct macb_config sama7g5_emac_config = {
@@ -5376,7 +5407,7 @@ static const struct macb_config sama7g5_emac_config = {
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
-	.usrio = &sama7g5_usrio,
+	.usrio = &sama7g5_emac_usrio,
 };
 
 static const struct macb_config versal_config = {
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
