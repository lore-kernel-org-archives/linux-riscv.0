Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27FF10775E1
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 16:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t4rQIoMxKh8qv+O8qdovkeHz57l333XXUTiEb8SrPpQ=; b=jezIhS2aqFJDLO
	kcKaGrEn1UmrFiEm5nRwTJwsNBNTI3ZNpMNpNRANXXmuQl6NTU+BmxWOYZ7Is3IxjoMVJJ83OqU4L
	gJJakjVU2y0OxGd/ZHJd0yFHwPiOmBn6F6g3gr5WaTqy9dwcH05S6K2yMTSRS/5JA5RxUbrWsjroo
	7hGuizIs+2x9G6jrn038qDwVmnOK2quOgfZiRXP0JrhI1Kjc+dFOoi7w9k9Kwxid/8nk8meWVlyfC
	OSjWlAWYU/F8iRExTUqe0RfUlJyUhUgV/7XyZz2IrKSClvqdkqpU43LwSLorFU/MtgdYjJTngfoQ0
	7Ke1cVIXrA1tG6AMXEZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tuM-00000008xpe-3J1l;
	Wed, 18 Mar 2026 16:38:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tuK-00000008xp5-37CL
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 16:38:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0188B60053;
	Wed, 18 Mar 2026 16:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A0D5C2BCB0;
	Wed, 18 Mar 2026 16:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773851887;
	bh=amkx/ONsWMzstbyqhsVJJD8kT0eG2xoRPQ4khwRvdAg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i3OFa3Za6rrrUEIBwsbLbwdoJH2kYPRsXYGAhywxJe1IHfXHr6vokXtDCvkTSIBNc
	 L8k04HBq+UayWM1sP90woWLew407rZnbY7qC4IqhKWqREt81Q/SKWykL+gyX9ZcSp4
	 yINvhqJx9Veg1UT9Sb1O+S+RArSsQaivpSLN6ivxEl2zWX7nOsTr9m7quObz5VKkle
	 WaOIkYLfk7IJ+JggB7e3ozUUwlbJVwl2v1TY9L/uoPur6r+oXE4dOiqAu6BEqPBOLt
	 qzzhUso6d1a+iHeBI7E0N/Slo/RaK0NNtCYA9p1v68as5QWFvwqVK2FZWmJe7FGbYX
	 UtPu+zLGVKZdA==
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
Subject: [PATCH net-next v4 03/13] dt-bindings: net: cdns,macb: replace cdns,refclk-ext with cdns,refclk-source
Date: Wed, 18 Mar 2026 16:37:34 +0000
Message-ID: <20260318-mobilize-rule-d4a704468218@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260318-surpass-puzzle-f94b46aa8808@spud>
References: <20260318-surpass-puzzle-f94b46aa8808@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3141; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=ylmEwtCLpeHVLaNpcJoaSjYuiY5zyWKQ8QvX+HMWzDw=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJm7rlzccv/2lBnhc/xPqEQv3lz89pL4BetHjVOdHh9jW HrVJTixqqOUhUGMi0FWTJEl8XZfi9T6Py47nHvewsxhZQIZwsDFKQAT0ZFh+J98oMH+kVxowq28 5z+c7vpEOKnMqnzFbxOzJ5v7/PzUOS6MDO9CJLWEHxq7s7f6mnxuCPqspNH/n0n/mp0M87Z7ASm 5TAA=
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
index cb14c35ba9969..f6df793c4af65 100644
--- a/Documentation/devicetree/bindings/net/cdns,macb.yaml
+++ b/Documentation/devicetree/bindings/net/cdns,macb.yaml
@@ -122,10 +122,23 @@ properties:
 
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
@@ -196,6 +209,43 @@ allOf:
       required:
         - phys
 
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
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
