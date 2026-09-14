Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56689C88E75
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 13:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zgpGOS2gPFkpJKaqfILnoCsHfeVIDqnyG+mOHFZ0gnU=; b=KaxOFfhK8Gw2Kz
	NUXVgcR6fRFeIgtzgSiJ6kPNJpKNNsEnuodvhP4ue0cGTF+SC0KYZWB2GBTnimFcj6aFVWw2pmT3J
	7Mf8VSze9/Q/eb/nUy60IsQsqKljXKczL9NERkpxDS5cXzVnKxEAgSM2lBn5FEeTqBxqymGrAyquU
	/ZnqQLWAlFSsoolmGavDeitGcTWp2/q+VYB+EQesMTXR7qRLhh8kuggoYKf+6oyoiBbbgSVLCC1pk
	t6rcxpPdeesBXyskbP0+78SpzPEpZL+fJALODxBb88XNKmwr7CR//uEzYC/RgdyEmIUzmBd+3l9Tn
	7agJputMZKgdNlLrufmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67AP-00000003smZ-0lc4;
	Mon, 14 Sep 2026 13:56:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67AG-00000003sfW-0Mb4
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 13:56:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 316FF60202;
	Mon, 14 Sep 2026 13:56:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD276C2BCFB;
	Mon, 14 Sep 2026 13:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789394166;
	bh=f0bTgSyA5DkXGRiU8pHG8moLCaSdDcvyHOvL4bU7uNA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bZZ8YlgTomE8GX9Q1j0+tONFNUkeqo6WHKyFr4O3B7zi5wF9U/TvGQHWu0FJmghNH
	 0M71xObdvIR36f9ZRjTlgDvnNyF77ADUBBqqU+0SzOYsUQBa2W9YRNGHPBcEqDLQ7R
	 GqhO1RuuEaCGWBTq8NP25NY8ucJBlHoQn6zful1Ez4veYq316T+MFHTdqiQ+VHzfHL
	 OalMYAFud4hZ5GhICMUNsYRTh4Pw4Owjek7h6eqjszm7lbS6UA6gWozE6tylifMOy6
	 MenETbC+Ne+ojCvKI3l/PFGcRerP/q8bFzHEHf93AHPR+aTOI5UzEm/LrRmtKRnr6g
	 T5sXfkjK2Q3mQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B551DC88E75;
	Mon, 14 Sep 2026 13:56:06 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 14 Sep 2026 15:55:54 +0200
Subject: [PATCH 6/9] dt-bindings: timer: Add MIPS P8700 ACLINT MTIMER
MIME-Version: 1.0
Message-Id: <20260914-p8700-dts-v1-6-3267f14ebce1@htecgroup.com>
References: <20260914-p8700-dts-v1-0-3267f14ebce1@htecgroup.com>
In-Reply-To: <20260914-p8700-dts-v1-0-3267f14ebce1@htecgroup.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Inochi Amaoto <inochiama@outlook.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789394164; l=2438;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=M5IyHBybwxEJk8ac4GspHzVPEulbhlRzm20t9LNaGmM=;
 b=9Aj12FjNDRPLsiFijbdUWSzeynhgFvKygTdmlPOuxb81BeHEw3ZUUNOXAlM1adSx55m0YRq7V
 TSBpv33dDYvD1Q+vq/Md9Se5o8TYo+6qcTfV6wdJEUXvYRe9MDz2m7k
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
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
Reply-To: aleksa.paunovic@htecgroup.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Document the MIPS P8700 ACLINT MTIMER.
Extend support for both mtimecmp and mtime registers
within the ACLINT MTIMER, identified via reg-names.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 .../bindings/timer/thead,c900-aclint-mtimer.yaml   | 43 ++++++++++++++++++++--
 1 file changed, 39 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
index cf7c82e980f674afcf59fc726742dc4f49c1a820..35e02da675becb3c8bb187b8e1e623994d52df8c 100644
--- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
+++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
@@ -17,18 +17,20 @@ properties:
               - sophgo,sg2042-aclint-mtimer
               - sophgo,sg2044-aclint-mtimer
           - const: thead,c900-aclint-mtimer
+      - items:
+          - const: gf,mips-p8700-aclint-mtimer
       - items:
           - enum:
               - anlogic,dr1v90-aclint-mtimer
           - const: nuclei,ux900-aclint-mtimer
 
   reg:
-    items:
-      - description: MTIMECMP Registers
+    minItems: 1
+    maxItems: 2
 
   reg-names:
-    items:
-      - const: mtimecmp
+    minItems: 1
+    maxItems: 2
 
   interrupts-extended:
     minItems: 1
@@ -42,6 +44,28 @@ required:
   - reg-names
   - interrupts-extended
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: gf,mips-p8700-aclint-mtimer
+    then:
+      properties:
+        reg:
+          minItems: 2
+        reg-names:
+          items:
+            - const: mtime
+            - const: mtimecmp
+    else:
+      properties:
+        reg:
+          maxItems: 1
+        reg-names:
+          items:
+            - const: mtimecmp
+
 examples:
   - |
     timer@ac000000 {
@@ -53,4 +77,15 @@ examples:
       reg = <0xac000000 0x00010000>;
       reg-names = "mtimecmp";
     };
+
+  - |
+    timer@16108050 {
+      compatible = "gf,mips-p8700-aclint-mtimer";
+      reg = <0x16108050 0x8>, <0x16154000 0x7ff8>;
+      reg-names = "mtime", "mtimecmp";
+      interrupts-extended = <&cpu1intc 7>,
+                            <&cpu2intc 7>,
+                            <&cpu3intc 7>,
+                            <&cpu4intc 7>;
+    };
 ...

-- 
2.43.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
