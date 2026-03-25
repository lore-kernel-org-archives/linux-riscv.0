Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407C6109C036
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 16:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6iygirikJI/Ip71hGeyYJCZIGNU/A7GvPOhAQR+1GiI=; b=1KLRdQdCnf5+nV
	b+RRqfclFpKNJDqnZdglmfivYY7mOZ5yTfEecAXbVg/r9S6YzYMenLwnq86ssd7OFzGNysPo+/pzV
	jAOK5e2saLUG66ocrVU+LunTQgf194h9vIA/FKhNR0Mfv+tB3THaJdLaTuUcsCghTNbB/PN7xEu7I
	3Bz79DrVfKQ9t/G6hQ9M+0gYgGeq519NHyqTMhHd0i7l7YcELEaZDoJoEwxyX5YoyfxVf7ALipSEC
	SGfNdzvXz9K93RJ2zKS9kCBGs902STVWkkRzLh46oZO/63Z4B7dLbo6EXx4vzFIqZ9DAy6Ex4YDfe
	GYV37MT9TMs/PdeoCTUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5R6f-00000003t87-3bI0;
	Wed, 25 Mar 2026 16:29:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5R6e-00000003t7H-3Ea1
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 16:29:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DECDB60120;
	Wed, 25 Mar 2026 16:29:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AF36C4CEF7;
	Wed, 25 Mar 2026 16:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774456159;
	bh=mignoRYRLHHjX6SoWI2N00JC2HYzX1D05cl4aW7C2tI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lZWaqqXRtM1Zpz9+5WAz2NTimIltca+VqNPf+FXtspLv6JsN2gzoUPPiGu1l8Hj5F
	 sYs1w/+geL4GAmvsxiyCujjqRhgdKTZtNe9Gp2cMWdvkAPACTV4bv/fcu7Vf/qgKcw
	 6KUkuebGc/jBeeCfVqRygmS7ov7tBZM9VpbJW/ZDBzG+QcV4wsrWtQERCme7VVpMBx
	 p+Y0hAWOXcYe80cTdYrEhKmhTBEPHxr0asNWWRYsQLkD9HeEs8N0sNGKP2N0VFceaa
	 FOWBEPdHgtkaur44vdZmUFhODtuhwTkz+x5LM3QTzdX+HaGKhIVg9tli/fSb6b8SqH
	 WfkQXhA+7gUew==
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
Subject: [PATCH net-next v5 05/14] net: macb: rework usrio refclk selection code
Date: Wed, 25 Mar 2026 16:28:09 +0000
Message-ID: <20260325-tarantula-bullring-6ac44b39dd52@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325-unsterile-flail-4c7729750dc4@spud>
References: <20260325-unsterile-flail-4c7729750dc4@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5438; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=ycgYzkRjtwYgivLvrVnZHFBsUBSJrE0ZCfPhkRXsTQU=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlHeE3vRe5euGKW3gUfX+YzIv2XViwN1G29t++ldIPBm ngN5XyHjlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEyk6gvD/1oRd8sNOavC1lSm PZytqNT1Vk48Nue2WvXLv/VXHj4T5GT4w/snN2qiCpfscbnLIS7belgOqgm0fG2Szby2xLx87iV TBgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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
index 35b7129d7c1ee..1bdbe66b05590 100644
--- a/drivers/net/ethernet/cadence/macb.h
+++ b/drivers/net/ethernet/cadence/macb.h
@@ -1229,6 +1229,7 @@ struct macb_usrio_config {
 	u32 refclk;
 	u32 clken;
 	u32 hdfctlen;
+	bool refclk_default_external;
 };
 
 struct macb_config {
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 859d03502666a..a436521460683 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4576,12 +4576,8 @@ static const struct net_device_ops macb_netdev_ops = {
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
 
@@ -4614,9 +4610,6 @@ static void macb_configure_caps(struct macb *bp,
 		}
 	}
 
-	if (refclk_ext)
-		bp->caps |= MACB_CAPS_USRIO_HAS_REFCLK_SOURCE;
-
 	dev_dbg(&bp->pdev->dev, "Cadence caps 0x%08x\n", bp->caps);
 }
 
@@ -4897,8 +4890,36 @@ static int macb_init_dflt(struct platform_device *pdev)
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
@@ -5503,11 +5524,21 @@ static const struct macb_usrio_config at91_default_usrio = {
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
 
@@ -5622,7 +5653,7 @@ static const struct macb_config sama7g5_gem_config = {
 		MACB_CAPS_MIIONRGMII | MACB_CAPS_GEM_HAS_PTP |
 		MACB_CAPS_USRIO_HAS_MII,
 	.dma_burst_length = 16,
-	.usrio = &sama7g5_usrio,
+	.usrio = &sama7g5_gem_usrio,
 };
 
 static const struct macb_config sama7g5_emac_config = {
@@ -5632,7 +5663,7 @@ static const struct macb_config sama7g5_emac_config = {
 		MACB_CAPS_GEM_HAS_PTP |
 		MACB_CAPS_USRIO_HAS_MII,
 	.dma_burst_length = 16,
-	.usrio = &sama7g5_usrio,
+	.usrio = &sama7g5_emac_usrio,
 };
 
 static const struct macb_config versal_config = {
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
