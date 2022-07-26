Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE84C19F29
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Jul 2022 18:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZqCq4mL4E2KLxuSFkxYaHZL/Sa3kzqrC31b/WVWLVmo=; b=0GQ1a8pLGBIkZo
	euQ3sxS4ciUQH6RyewKoGuAXBaiPu/auwz4hDCyoI3Uu5VeH5bH0hPLLL40ic79MvTKV7mOCaGpI0
	fP2kkLgIzyD+hEw59ISGyG/z6H1MJgVex3LwauqXOmMfMfOVvVk2K++ok3dn0hOikNJVwp4fHsEvM
	r0InvMKcyHnooQ0WZYxE706PnXDlFRNVDsMTcX9sTGF4T6YjC3z5DF9dY3wojJPHsQihwQJzFY959
	LIZEm40GUqH9hSUm4Z7zgMgqZpakEIVUijHbZ0bzQasK+oTq34lMOYeQyxJgNnq+i/IHMqit9ouX+
	NocM3UK6hS3ZAm8C9CAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGOxN-001vVq-WA; Tue, 26 Jul 2022 18:06:58 +0000
Received: from relmlor2.renesas.com ([210.160.252.172] helo=relmlie6.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGOxL-001vL1-5F
	for linux-riscv@lists.infradead.org; Tue, 26 Jul 2022 18:06:56 +0000
X-IronPort-AV: E=Sophos;i="5.93,194,1654527600"; 
   d="scan'208";a="129202696"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 27 Jul 2022 03:06:54 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7CE6D40C58A7;
	Wed, 27 Jul 2022 03:06:50 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Anup Patel <anup@brainfault.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/6] dt-bindings: riscv: Add DT binding documentation for Renesas RZ/Five SoC and SMARC EVK
Date: Tue, 26 Jul 2022 19:06:21 +0100
Message-Id: <20220726180623.1668-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_110655_325417_4E9AE93F 
X-CRM114-Status: UNSURE (   9.94  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Document Renesas RZ/Five (R9A07G043) SoC and SMARC EVK based on this SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../devicetree/bindings/riscv/renesas.yaml    | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/renesas.yaml

diff --git a/Documentation/devicetree/bindings/riscv/renesas.yaml b/Documentation/devicetree/bindings/riscv/renesas.yaml
new file mode 100644
index 000000000000..f72f8aea6a82
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/renesas.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/renesas.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/Five Platform Device Tree Bindings
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+
+# We want to ignore this schema if the board is SMARC EVK based on ARM64 arch
+select:
+  not:
+    properties:
+      compatible:
+        contains:
+          items:
+            - const: renesas,smarc-evk
+            - enum:
+                - renesas,r9a07g043u11
+                - renesas,r9a07g043u12
+                - renesas,r9a07g044c1
+                - renesas,r9a07g044c2
+                - renesas,r9a07g044l1
+                - renesas,r9a07g044l2
+                - renesas,r9a07g054l1
+                - renesas,r9a07g054l2
+            - enum:
+                - renesas,r9a07g043
+                - renesas,r9a07g044
+                - renesas,r9a07g054
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: RZ/Five (R9A07G043)
+        items:
+          - enum:
+              - renesas,smarc-evk # SMARC EVK
+          - const: renesas,r9a07g043f01
+          - const: renesas,r9a07g043
+
+additionalProperties: true
+
+...
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
