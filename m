Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786D7C46CA2
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 20:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YYqYq/d4IuHuZs8029Il2uQ6qhs4RnotbnjsByxz530=; b=VP8UbXvwcXhTLF
	/pOK5ZtU2kaOM8RAaufVlIMlfRjPXHcTB6gBSTE9S0bNkVSz5ED9nVOcRBCWExEyzoSSsvv8QFcq0
	J5HRp0BjtBMgktcjqhX7QQUO24pm4fI5DNxQj+KC/iIQysd1cSZEJscNK7eHra34+kwIFvnpdBEA8
	k/l/dZlP/vt9yWs6Uvhl7nR9AQr168Tw9/S5i4yEfBEU3mDFYo99PXbOIdJCoEpf41g5Ukf+1YNv+
	QZzJhZozEPOUtWLLFgPbaXXaP4cSRxxzJLJg2cuYSqcb0qE3J12pwCCJunsp7J3npD93CRZVO6BMq
	tiIX2JL8N/YHqBruDiJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEEzj-004Uxg-0k;
	Fri, 15 Dec 2023 20:41:15 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEEzS-004Up2-1J;
	Fri, 15 Dec 2023 20:41:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702672854;
	bh=03p9E6nA7an2G1tB5MMv/uNj5vtUhwwnTvlzoHkMWig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nL0R3sCGeYyZxN9QwAHy+LF8ebs3dlwbqgnGspv9Gn82+EQ9fXa6CnzYJZw6KdcwN
	 Q2MWIqRDH/0TgHN9EqfEoGjnlySL4qgzq9Kz7Snp6/RuDWuvhsP4AZ7AUxE1NWWkz0
	 Pu52Fhm2xFpPPRW01dbx8vy0Skm+eKLrccSSKBumZyrnLzUp+/O9GPZXj5JMyjdFxr
	 LhSb2ZbDcfRawv5CV+2HZ2P5fVoE2SKwKGOfE6eT/bydhZha3a6wibMOUocJl9CYnR
	 Iu5TsRAHyRfZ+zZfwj2bRIA1nbIvCiDqHo6FhuoQY5Rc2mO8kqhZMjiiyyPohW7h5D
	 z9bTkGATymg1w==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 25D013781FEB;
	Fri, 15 Dec 2023 20:40:54 +0000 (UTC)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Samin Guo <samin.guo@starfivetech.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v3 2/9] dt-bindings: net: starfive,jh7110-dwmac: Add JH7100 SoC compatible
Date: Fri, 15 Dec 2023 22:40:41 +0200
Message-ID: <20231215204050.2296404-3-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231215204050.2296404-1-cristian.ciocaltea@collabora.com>
References: <20231215204050.2296404-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_124058_619236_F247399F 
X-CRM114-Status: GOOD (  11.81  )
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

The Synopsys DesignWare MAC found on StarFive JH7100 SoC is mostly
similar to the newer JH7110, but it requires only two interrupts and a
single reset line, which is 'ahb' instead of the commonly used
'stmmaceth'.

Since the common binding 'snps,dwmac' allows selecting 'ahb' only in
conjunction with 'stmmaceth', extend the logic to also permit exclusive
usage of the 'ahb' reset name.  This ensures the following use cases are
supported:

  JH7110: reset-names = "stmmaceth", "ahb";
  JH7100: reset-names = "ahb";
  other:  reset-names = "stmmaceth";

Also note the need to use a different dwmac fallback, as v5.20 applies
to JH7110 only, while JH7100 relies on v3.7x.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 .../devicetree/bindings/net/snps,dwmac.yaml   |  3 +-
 .../bindings/net/starfive,jh7110-dwmac.yaml   | 74 +++++++++++++------
 2 files changed, 55 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 5c2769dc689a..c1380ff1c054 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -95,6 +95,7 @@ properties:
         - snps,dwmac-5.20
         - snps,dwxgmac
         - snps,dwxgmac-2.10
+        - starfive,jh7100-dwmac
         - starfive,jh7110-dwmac
 
   reg:
@@ -146,7 +147,7 @@ properties:
   reset-names:
     minItems: 1
     items:
-      - const: stmmaceth
+      - enum: [stmmaceth, ahb]
       - const: ahb
 
   power-domains:
diff --git a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
index d90cb82c1424..b01602738fc3 100644
--- a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
@@ -22,10 +22,14 @@ select:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - starfive,jh7110-dwmac
-      - const: snps,dwmac-5.20
+    oneOf:
+      - items:
+          - const: starfive,jh7100-dwmac
+          - const: snps,dwmac
+      - items:
+          - enum:
+              - starfive,jh7110-dwmac
+          - const: snps,dwmac-5.20
 
   reg:
     maxItems: 1
@@ -46,23 +50,6 @@ properties:
       - const: tx
       - const: gtx
 
-  interrupts:
-    minItems: 3
-    maxItems: 3
-
-  interrupt-names:
-    minItems: 3
-    maxItems: 3
-
-  resets:
-    minItems: 2
-    maxItems: 2
-
-  reset-names:
-    items:
-      - const: stmmaceth
-      - const: ahb
-
   starfive,tx-use-rgmii-clk:
     description:
       Tx clock is provided by external rgmii clock.
@@ -93,6 +80,51 @@ required:
 allOf:
   - $ref: snps,dwmac.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: starfive,jh7100-dwmac
+    then:
+      properties:
+        interrupts:
+          minItems: 2
+          maxItems: 2
+
+        interrupt-names:
+          minItems: 2
+          maxItems: 2
+
+        resets:
+          maxItems: 1
+
+        reset-names:
+          const: ahb
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: starfive,jh7110-dwmac
+    then:
+      properties:
+        interrupts:
+          minItems: 3
+          maxItems: 3
+
+        interrupt-names:
+          minItems: 3
+          maxItems: 3
+
+        resets:
+          minItems: 2
+          maxItems: 2
+
+        reset-names:
+          items:
+            - const: stmmaceth
+            - const: ahb
+
 unevaluatedProperties: false
 
 examples:
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
