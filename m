Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568BCCEACEF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 15:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TkoMAcONsMOGQq9xRCQu7AWdGI4E17QGzBZMnpD/IX4=; b=oFRXyUO95KMSTv
	5IF+Yt7Cmke6b5my54I50UsTBKC507gqZhyJhVVsLNCLHM+yXlmYW+sU+Q+aZvFAw7wDL+BNWhdFY
	g9IktIpRQ3vXEUNT3AxPAa7FnzcazvRMuYKWHcvw/nQnFIbLt0UAwqctG/D324jlZ7Yfnw+m3F/Qv
	HMuGSLFXr1cx6PKcoHPeipuiWTaQsQfQEwVqer7fvI8gK4xs2aE8kcvGl8iyF1XSJKAqWuaS7i437
	Ja/XvMQytlyAqLWfHcckc17q2o/Clfv6RrSQpwnSUSgGsx27MoZu2WENYC6yFpaBK3/qBdWZEVLGb
	kVO18/OBxtXp1hZUZGPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1H1-0000000GKpQ-3hLL;
	Mon, 17 Nov 2025 15:36:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1H0-0000000GKom-0Zck
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 15:36:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D003744578;
	Mon, 17 Nov 2025 15:36:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 316CAC19424;
	Mon, 17 Nov 2025 15:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763393769;
	bh=pB0/QFXI5t2Hw+5qhGB5FGEiMP1+/MSOOtSe9mwKqU0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GmLKt3O9GluH2JCDClqfyVVbozY56xU8N3PrQMMZP+p2nNCG7KXH4CT/5Qq6crEuN
	 kBMKxSO3+EXbpCtDjOuay8xqcnK5qmdsfjsQSbTG4ffYiy4cKBUOmyRPJxTRIR+/vG
	 6JWfrl9EwmYP34Kcsniswxm7ktPbzQiGDUjqDtnpSROAdwOyTjN5s/WDK4s81i6HEH
	 /0OjETijdTwHs4kDPU4BGQdTpXbvgJpM1RY6mXqvbrF95TXRtQL0n5x6ZrpNSPdmLE
	 Ytoku7Fg3td/BOyBDc54tdKsXf/r1GrOQllSbvJTPZ8voeqZTonZvVRCfZMCAjML9Y
	 9bj6M2EJpgxiA==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
Subject: [PATCH v1 3/3] dt-bindings: clock: mpfs-clkcfg: Add pic64gx compatibility
Date: Mon, 17 Nov 2025 15:35:20 +0000
Message-ID: <20251117-depth-sage-ee0829c71c25@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117-shadow-police-56aba5d855a3@spud>
References: <20251117-shadow-police-56aba5d855a3@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1355; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=awEf+2y/PPPNa2uwhs4VTzsAEfJWcc8DTYHHNv4fdl0=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnSDlsuJ/xiPbid7V/MKQGOogOqL4+diLvR9ebqxqUrJ waXbetl6ihlYRDjYpAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBE8sQZGc6cOLY35m36o5P/ 4q5ckmJl83/HG9Ezb4Pmgcni0et3Odsx/NPYsTe6g+vh5nwx2Yvu8kcvRnovbIhKCuqV3H3OPUA yihcA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_073610_216364_D56F7C4E 
X-CRM114-Status: UNSURE (   8.24  )
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

From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

pic64gx has a clock controller compatible with mpfs-clkcfg. Don't permit
the deprecated configuration that was never supported for this SoC.

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/clock/microchip,mpfs-clkcfg.yaml     | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml b/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
index ee4f31596d97..f111bed16f15 100644
--- a/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
+++ b/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
@@ -19,7 +19,11 @@ description: |
 
 properties:
   compatible:
-    const: microchip,mpfs-clkcfg
+    oneOf:
+      - items:
+          - const: microchip,pic64gx-clkcfg
+          - const: microchip,mpfs-clkcfg
+      - const: microchip,mpfs-clkcfg
 
   reg:
     oneOf:
@@ -69,6 +73,15 @@ required:
   - clocks
   - '#clock-cells'
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: microchip,pic64gx-clkcfg
+then:
+  reg:
+    maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
