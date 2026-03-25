Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5619E109C033
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 16:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wKIYi72VgKaziTdRR0jB4o1Sj14b8pSkDNIE4ctQIvY=; b=oNVEGljSfc68JZ
	L6I6vpK9GH9PHRmQoc00iQWnDXghSA5sY/dJtJNInXKPF5qpfIkWL31+j8BR4A3FG+Lk8QOFFPv3C
	8RJ9SFzgEbyMlVXUzSl/mjmOldnEoxNjOLeelJkqjWTMab7xn4gnG2vtnfUoKVyAsyxmHjjkIWeZc
	Er+YckQfd3RZRXlCLqKwxjNVuytKxwM2B23wkTnl8BIUjBgxcKsIvyGts9ujs9G98pFZoW/OyKyp6
	0wboWmQmQ4fUx3PC+Ikq5Mvx0FNIaDP3xEAkjU1wp4QBio4B/X6U9t386gFdQSPu4xbODC9UcyRwn
	Qo40gtJeLbv47hORvcug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5R6Z-00000003t54-2Jd6;
	Wed, 25 Mar 2026 16:29:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5R6Y-00000003t4Y-2lrh
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 16:29:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B52160103;
	Wed, 25 Mar 2026 16:29:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D3B0C19423;
	Wed, 25 Mar 2026 16:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774456153;
	bh=tPzeJ8v456m2d30UqE73B+UaLtNZYD7FTrsxSwqJZFU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s9/qQCEVLFbmPvNpERJrwz34LiGRHyf+wBv5b4IFmOPsydwwoYAIkT+n+qT9W/idh
	 38nIKQbaKClV4Hq4ngTp0RSLqSrxxr+VaCPhsvaVkkATzYP9uKOYpfsN/36iAJjwoT
	 eSDiL71bYElvrdyRduA/Nq7UMzop1RMmPqyS+eWtwBEqNIziofKcuJ54geUWJ6toAv
	 TrENIsMFkgY7N9Kwu4Pk6FaxhAOfugGJycF6DQYuBTxMCw3VMcpUR5UcdXVYbXZmIc
	 Kusm0RE44pvfTnjpjzudhB5jnV059ZfAYrJJZBHIejFsB4/h2+n2Ta13ecSVaumXpw
	 b3UwBh8aGGmAA==
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
Subject: [PATCH net-next v5 04/14] dt-bindings: net: cdns,macb: replace cdns,refclk-ext with cdns,refclk-source
Date: Wed, 25 Mar 2026 16:28:08 +0000
Message-ID: <20260325-savior-untainted-03057ee0a917@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325-unsterile-flail-4c7729750dc4@spud>
References: <20260325-unsterile-flail-4c7729750dc4@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3148; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=YuZA+9uk1ysSY/NdJLuuoPLcf0q4cp5LYDFkeULhb80=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlHeE07fxsurH4u2hT09IVDXFnKih7xKc6PzIV+PbyhY /3c6IJhRykLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACbiEcTwV/jll+PbTz2tOfLt dtKd/fm6WXIdP57Z5ucaBHlfVeDc+p/hD0+Hp9gz83c50mtjHlTevO7y9umR3IZ304QWeTytaF+ RxQYA
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

Ryan added cdns,refclk-ext with the intent of decoupling the source of
the reference clock on sama7g5 (and related platforms) from the
compatible. Unfortunately, the default for sama7g5-emac is an external
reference clock, so this property had no effect there, so that
compatibility with older devicetrees is preserved.
Replace cdns,refclk-ext with one that supports both default states and
therefore is usable for sama7g5-emac.

For now, limit it to only the platforms that have USRIO controlled
reference clock selection, but this could be generalised in the future.

The existing property only works on devices that are compatible with
sama7g5-gem, so mark it deprecated, and limit its use to that specific
scenario.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/net/cdns,macb.yaml    | 56 ++++++++++++++++++-
 1 file changed, 53 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/cdns,macb.yaml b/Documentation/devicetree/bindings/net/cdns,macb.yaml
index feb1683858374..50490acbb6fc4 100644
--- a/Documentation/devicetree/bindings/net/cdns,macb.yaml
+++ b/Documentation/devicetree/bindings/net/cdns,macb.yaml
@@ -130,10 +130,23 @@ properties:
 
   cdns,refclk-ext:
     type: boolean
+    deprecated: true
+    description: |
+     This selects if the REFCLK for RMII is provided by an external source.
+     For RGMII mode this selects if the 125MHz REF clock is provided by an external
+     source.
+
+     This property has been replaced by cdns,refclk-source, as it only works
+     for devices that use an internal reference clock by default.
+
+  cdns,refclk-source:
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - internal
+      - external
     description:
-      This selects if the REFCLK for RMII is provided by an external source.
-      For RGMII mode this selects if the 125MHz REF clock is provided by an external
-      source.
+      Select whether or not the refclk for RGMII or RMII is provided by an
+      internal or external source. The default is device specific.
 
   cdns,rx-watermark:
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -215,6 +228,43 @@ allOf:
       properties:
         mdio: false
 
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - microchip,sama7g5-gem
+                - microchip,sama7g5-emac
+    then:
+      properties:
+        cdns,refclk-source: false
+
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: microchip,sama7g5-gem
+    then:
+      properties:
+        cdns,refclk-ext: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - microchip,sama7g5-emac
+    then:
+      properties:
+        cdns,refclk-source:
+          default: external
+    else:
+      properties:
+        cdns,refclk-source:
+          default: internal
+
 unevaluatedProperties: false
 
 examples:
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
