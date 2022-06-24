Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B06C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 18:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PFkdUZTYpUJCyKolNYj507LXvre0ZzWvcqLDXCmhKQk=; b=aZBcmi/5rnKDf2
	yY2yI/g2GuEbJmGWLf6nfKxFOTHZEaiAUoW9ujHHPufYQI9+Nu7CDO5Pl7RgI84fhz7pZrDgRr4J0
	P00fM6jDglcu/q5+pWTA8lssOFFA7e5jszxFBoUMkDKgsmFVUxRlBvPUdu8Pvfc7ECgEWIHf4EOcP
	7sRXaNfu8SdLk2LdFsQC3H/rsNbnKS5t1a1xqBFvNQ+aEqDA+h0XowEw4hduX02ZpPb1UA3H1YHx8
	BFMhiTfNH+bFJFn8MYbBniHHcTzkYYA7OWZ8FmTgZ3aUlA4UjSIcByALe0di3vMtIzv3xbGwhRFKZ
	+1eUGcp+wAo+injWu5NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4neT-003OJp-Vl; Fri, 24 Jun 2022 18:03:29 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4neR-003OIP-Ac
	for linux-riscv@lists.infradead.org; Fri, 24 Jun 2022 18:03:28 +0000
X-IronPort-AV: E=Sophos;i="5.92,218,1650898800"; 
   d="scan'208";a="124039035"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 25 Jun 2022 03:03:24 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 259AE40C554E;
	Sat, 25 Jun 2022 03:03:19 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] dt-bindings: interrupt-controller: sifive,plic: Document Renesas RZ/Five SoC
Date: Fri, 24 Jun 2022 19:03:10 +0100
Message-Id: <20220624180311.3007-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220624180311.3007-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220624180311.3007-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_110327_517839_99CE9B2A 
X-CRM114-Status: GOOD (  10.24  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Document Renesas RZ/Five (R9A07G043) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
RFC->v1:
* Fixed Review comments pointed by Geert and Rob
---
 .../sifive,plic-1.0.0.yaml                    | 40 +++++++++++++++++--
 1 file changed, 36 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 27092c6a86c4..5eebe0b01b4d 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -28,7 +28,10 @@ description:
 
   While the PLIC supports both edge-triggered and level-triggered interrupts,
   interrupt handlers are oblivious to this distinction and therefore it is not
-  specified in the PLIC device-tree binding.
+  specified in the PLIC device-tree binding for SiFive PLIC (and similar PLIC's),
+  but for the Renesas RZ/Five Soc (AX45MP AndesCore) which has NCEPLIC100 we need
+  to specify the interrupt type as the flow for EDGE interrupts is different
+  compared to LEVEL interrupts.
 
   While the RISC-V ISA doesn't specify a memory layout for the PLIC, the
   "sifive,plic-1.0.0" device is a concrete implementation of the PLIC that
@@ -57,6 +60,7 @@ properties:
           - enum:
               - allwinner,sun20i-d1-plic
           - const: thead,c900-plic
+      - const: renesas,r9a07g043-plic
 
   reg:
     maxItems: 1
@@ -64,8 +68,7 @@ properties:
   '#address-cells':
     const: 0
 
-  '#interrupt-cells':
-    const: 1
+  '#interrupt-cells': true
 
   interrupt-controller: true
 
@@ -91,7 +94,36 @@ required:
   - interrupts-extended
   - riscv,ndev
 
-additionalProperties: false
+if:
+  properties:
+    compatible:
+      contains:
+        const: renesas,r9a07g043-plic
+then:
+  properties:
+    clocks:
+      maxItems: 1
+
+    resets:
+      maxItems: 1
+
+    power-domains:
+      maxItems: 1
+
+    '#interrupt-cells':
+      const: 2
+
+  required:
+    - clocks
+    - resets
+    - power-domains
+
+else:
+  properties:
+    '#interrupt-cells':
+      const: 1
+
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
