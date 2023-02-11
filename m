Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A86CC61DA4
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Feb 2023 03:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rBV4pMSFkEpDlhpHQsinoWchf/ABFhMmpj4YzKR2otc=; b=MdN9It6HBj2STU
	3mG2Rb5sRmDoy+FOjMFAfoPB8Vv9M96hxDO7eyOHiBQsLZlJOIod7EnN05IBnyw4a59xeqs1EDGB8
	IOStwpQhqHZhMK3vO8kwP0cvtByGimuMbBSWnr3uJA3PR9Zl+6271e5ZukPZ6kwp7QLOosQkG2v8p
	ZPwOJjFtcE6wWXoIKW5UvIvphuSBvXIRIGhxQ+UE99muWyE7t55XYegzzQtiWW7XwisRnU0qSmKE2
	j3Vs7hZEU8N6hb7OXlJr4puFPeWs3WaW3HO6ENdlYgjkG2duXz9IAO9EJBgAuICrwvQJTNSkoBKpa
	8SFSMSIMbcXj+AXXU6Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQgWI-008V00-Oy; Sat, 11 Feb 2023 03:25:46 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQgPP-008RiR-Gc; Sat, 11 Feb 2023 03:18:41 +0000
Received: from localhost (unknown [86.120.32.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 68A966602111;
	Sat, 11 Feb 2023 03:18:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676085515;
	bh=wsikCNMiZKFgLF8VxbMNAMN5xcuiLSDwJPFjv5RhtwY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oG7+IzcdTybxpjx0fCajzTllBsTQirmb2YxPbpyMYNXWSRrIAHC7OipNowaNEiehe
	 nsmTXnfkdBTJ0J3ms/SBwjXwha0y8QURPT20tk9pBIRJPSJ6oiJZDjGJdLYtm3/zVq
	 6pEbMm+dj3Wk8AAPu8hHutHV9oOZKf47dT+dR7nt0LuuUEhl32SdHwYkKyxuzM+JKs
	 cmYUI0CSBL+sVPigjhXrQ4JdiAcv9OZLhfUo0cRs5Eswf1nC7JJfkZlXrBWF9BbBH7
	 rZDQ+oxqseId/nIhnNOfqp+COqhx/NzKmuaV5r5smcVl/ukDw2uxlaCtLTvsqvE6eP
	 fhlibOa4agYlQ==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 01/12] dt-bindings: riscv: sifive-ccache: Add compatible for StarFive JH7100 SoC
Date: Sat, 11 Feb 2023 05:18:10 +0200
Message-Id: <20230211031821.976408-2-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_191839_713756_F95EC662 
X-CRM114-Status: GOOD (  10.41  )
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

Document the compatible for the SiFive Composable Cache Controller found
on the StarFive JH7100 SoC.

This also requires extending the 'reg' property to handle distinct
ranges, as specified via 'reg-names'.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 .../bindings/riscv/sifive,ccache0.yaml        | 28 ++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml b/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
index 31d20efaa6d3..2b864b2f12c9 100644
--- a/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
+++ b/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
@@ -25,6 +25,7 @@ select:
           - sifive,ccache0
           - sifive,fu540-c000-ccache
           - sifive,fu740-c000-ccache
+          - starfive,jh7100-ccache
 
   required:
     - compatible
@@ -37,6 +38,7 @@ properties:
               - sifive,ccache0
               - sifive,fu540-c000-ccache
               - sifive,fu740-c000-ccache
+              - starfive,jh7100-ccache
           - const: cache
       - items:
           - const: starfive,jh7110-ccache
@@ -70,7 +72,13 @@ properties:
       - description: DirFail interrupt
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: control
+      - const: sideband
 
   next-level-cache: true
 
@@ -89,6 +97,7 @@ allOf:
           contains:
             enum:
               - sifive,fu740-c000-ccache
+              - starfive,jh7100-ccache
               - starfive,jh7110-ccache
               - microchip,mpfs-ccache
 
@@ -106,12 +115,29 @@ allOf:
             Must contain entries for DirError, DataError and DataFail signals.
           maxItems: 3
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: starfive,jh7100-ccache
+
+    then:
+      properties:
+        reg:
+          maxItems: 2
+
+    else:
+      properties:
+        reg:
+          maxItems: 1
+
   - if:
       properties:
         compatible:
           contains:
             enum:
               - sifive,fu740-c000-ccache
+              - starfive,jh7100-ccache
               - starfive,jh7110-ccache
 
     then:
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
