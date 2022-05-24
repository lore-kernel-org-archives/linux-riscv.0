Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CACFC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 24 May 2022 17:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1zdF1fxw243oib6uSFGrVz1je82NfyQ6hQrs9QIB5qI=; b=ZdZv+DAjgwM5Z9
	cxb2vadjX4W40NEKI7bmD6BNsUp/STiBtmFEB8tjzkO4NxlRLzSpCvuojG95XD+87tXLQSKishJVG
	bV54ROGR/MYL9yezOBfnjjCBOUrfpmKsbIX9+N6rbC/LtKExkgmynEsJR7OZ8Op8ULxU+mMV9YbKj
	xVyxU4DlgN1TSN/+PSQ3KkylgHzC5ytTVtIYN+4WGSxucsERZEz0ZJ3o/Hdw40YCG2vT3FWbb0+fT
	xyDxLgb7Cps8U1xKnpJtwTUL32QkRYsB7C+FYIFvwh9F9sSHR/AnCX01Fpat0tV6LqXPbNBxAsG6A
	GewpyiDeSy6pv+V6KbDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntYF4-008kmF-0a; Tue, 24 May 2022 17:22:46 +0000
Received: from relmlor1.renesas.com ([210.160.252.171]
 helo=relmlie5.idc.renesas.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntYF0-008kla-VJ
 for linux-riscv@lists.infradead.org; Tue, 24 May 2022 17:22:44 +0000
X-IronPort-AV: E=Sophos;i="5.91,248,1647270000"; d="scan'208";a="120749712"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 25 May 2022 02:22:42 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2D5E3400A8AA;
 Wed, 25 May 2022 02:22:36 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Sagar Kadam <sagar.kadam@sifive.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RFC 1/2] dt-bindings: interrupt-controller: sifive,
 plic: Document Renesas RZ/Five SoC
Date: Tue, 24 May 2022 18:22:13 +0100
Message-Id: <20220524172214.5104-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220524172214.5104-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220524172214.5104-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_102243_160536_700BD9D8 
X-CRM114-Status: GOOD (  10.76  )
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
 .../sifive,plic-1.0.0.yaml                    | 38 +++++++++++++++++--
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 27092c6a86c4..78ff31cb63e5 100644
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
+      - const: renesas-r9a07g043-plic
 
   reg:
     maxItems: 1
@@ -64,8 +68,7 @@ properties:
   '#address-cells':
     const: 0
 
-  '#interrupt-cells':
-    const: 1
+  '#interrupt-cells': true
 
   interrupt-controller: true
 
@@ -91,6 +94,35 @@ required:
   - interrupts-extended
   - riscv,ndev
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: renesas-r9a07g043-plic
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
 additionalProperties: false
 
 examples:
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
