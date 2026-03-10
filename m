Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92BEFD4F07
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 17:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HqX2YRC7hcqAMaTT8kJtTHmKvtSxhiRcKX5un1hD34U=; b=Uxer4oeR6Q5WC2
	p9Nuq0Rx/GopNpgSZ8MDOlXm44EM0bFNCGM06yZpaO9/n8NFiY0AgXnM+DHzwqXBtA6Wkmc2jgeAa
	bUE40Z2CYKyCdP/US0bigxhIKNK0rsqZJy4rrPNjRzFmAKJXvtewV74ZEIGEL2IgoirCrsTSBQ7BE
	YT2NOv07pJ85xFzuOFqfKsO/aWV4diLLoLCsFrRXpKlE9/gl3bA9KxvPiZWMMi4ohvTWSudTfIPZm
	1ECQ9poFNxy+OfibXeg76a/Nfftzhxgp/zC7ozbQzgo5NTwkk0QhRoNg+ETgWWf62RtN6GGiFbGws
	a5cN5YCG4Iu1CUKTvn/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w00jY-00000009xoN-1UIQ;
	Tue, 10 Mar 2026 17:19:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w00jX-00000009xnt-1jrt
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 17:19:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 71E0D60103;
	Tue, 10 Mar 2026 17:19:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5EABC2BC87;
	Tue, 10 Mar 2026 17:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773163142;
	bh=YUjxJF2Qr9YfAZ+BooBI432WLTxTi2gxDGv7r0zGnd4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nMixdcVOistAJIq0ewUNe/ndKJ1oHMibR0pp3XXNQDTt1fxyohpnf5g4uhm8EfY97
	 QCg00srsD8QpOqRzRmoXz8aS6KInGP+9ehToJM8MhcSSV/qrOq89GU1M+17vvLF3ua
	 5ElntDk1/MadosHcumGKS200q3w5yVaBYTD9WozG/Wqd87KZn1JE07OM2TKeneTzsc
	 tpF+Urb8fWvpNk5DyRAUas1xYXj4W5n81aUDTR6aei9heA07Mp0ItB4wa6XnDOc7+B
	 gp872qEWIQOH/PDyiZzjQYi1zzlrTTfzmfQCTzzJ7IlM1t88CEm7gzTLh565gExOGq
	 HE6JFgKfUgWhA==
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
Subject: [PATCH net-next v3 03/10] dt-bindings: net: cdns,macb: replace cdns,refclk-ext with cdns,refclk-source
Date: Tue, 10 Mar 2026 17:17:10 +0000
Message-ID: <20260310-sneak-handclap-c150d8f1236b@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260310-moneyless-dispense-7bce14b16388@spud>
References: <20260310-moneyless-dispense-7bce14b16388@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2441; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=1c/eg0vschSSxuR+95KDlkVYxNRVuIpwZ6UtMicQR0k=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkbgnTn+lTXsKy4fSz0TqzRjT/Jrdpf3j2enNJxInRbc 6XV0i9PO0pZGMS4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRQFlGht/C0kdSP2osvqmn oHKSs3Z35503ojqhq5x6z1jatpX++cTIcMea5fZi5wvTTKsP+xnYfUvK2DJtYiNzU5/Haz8zgQn r+AA=
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

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/net/cdns,macb.yaml    | 39 ++++++++++++++++---
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/cdns,macb.yaml b/Documentation/devicetree/bindings/net/cdns,macb.yaml
index cb14c35ba9969..a492357570edd 100644
--- a/Documentation/devicetree/bindings/net/cdns,macb.yaml
+++ b/Documentation/devicetree/bindings/net/cdns,macb.yaml
@@ -120,12 +120,14 @@ properties:
   power-domains:
     maxItems: 1
 
-  cdns,refclk-ext:
-    type: boolean
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
@@ -196,6 +198,33 @@ allOf:
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
