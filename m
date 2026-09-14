Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62282C88E75
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 13:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a2IlJkATcykZAgkD2J0lLOUZK+2/Elxmb3GDkUvb8Cc=; b=SnOK8pinm8IhFy
	ies+FGwjs+Tf6PGFoH36tFVxu9u9XXIkmGprCtR248fuPgBNS0HFcQTJ2yaDUBnmPW1VwzXr7vFeJ
	IlFqwkLkrYJZdMMXhhZHv4YufrfGOLFDunurdKKMH3StvGBFePGShoXWehdAJVPFvgUIkTICP7pvA
	jTLkOBraGYJV7LUXDBNSQeKhs2xzNynX8JBrG8iNBoif7bI+aT/bWWb5J5n69m96Vq0ZYL5LCgaPP
	MKThKDeOzsF5mNGL9Y6Qz/P2uMWyLXYWZVLkuIOA4KpWJJCrvpYzCLORIrNoaAYXN2u8gSdPJDlmm
	77kF+wadIzveY+mL8PUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67AH-00000003sgo-1i1T;
	Mon, 14 Sep 2026 13:56:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67AF-00000003sfe-2nIk
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 13:56:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D3A6443D64;
	Mon, 14 Sep 2026 13:56:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B10B5C2BD00;
	Mon, 14 Sep 2026 13:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789394166;
	bh=H88R8D2yBEpmvpGWUbzHlGqiXdsK5APs1RfBjdRvVgM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qeewrU8w0XLDazi5K4DRGQfKH54os/0xFquFkhtLjkFzFrolc48MQGq5y2P06vpMf
	 kAeXXASlNVLAPetaijsTKmz5JpVhZHZSKIizKWz+wwV1tN7YE9hLlqg0ZGEhGb42mN
	 aozHG67PiOmgYODPBsAtx9tvkeXp7M9mZwJXrEP+WpEO22xfq6zvVtyAIADxEDNXvi
	 xyLY9ZwOtfMVXC1y+S5eGr5Ja5kG7u+FUGiuQtRqaLIhnbgy8bRMkvoZni7esGxrZv
	 78rgls1UsjnaGkCl/iCMXJDuyqol42S07nyknhV3Ego2CCsF/ZuubxjuuYZu4NqVEh
	 zn3QyNeVGCT/g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9917BC88E72;
	Mon, 14 Sep 2026 13:56:06 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 14 Sep 2026 15:55:53 +0200
Subject: [PATCH 5/9] dt-bindings: interrupt-controller: Add MIPS P8700
 ACLINT MSWI
MIME-Version: 1.0
Message-Id: <20260914-p8700-dts-v1-5-3267f14ebce1@htecgroup.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789394164; l=2394;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=d6dCUSpFr/wHwlyABy937JZmuMEa5B5i8Du3V+WGvRU=;
 b=/CK+7BpY2QEZwNjyCeVxDPxAdvJb8B+L1XLb3ovHEhU/AAcNGfbaoNr5qYc7dKzjrvvqjF5gS
 9i9e+eTcC1HCfeO68b+1EqPs+F600EQRxdEx2cyEs8zcUkYaL6wuIze
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

Document the aclint mswi compatible for the MIPS P8700 and
introduce the 'riscv,hart-indexes' property,
used to address the sparse MIPS P8700 harts.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 .../thead,c900-aclint-mswi.yaml                    | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
index 62fd220e126e650e3800d8eee2a749fdbbde6108..47c04943eb0c793467aaa5570776605cae0eadfd 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
@@ -17,6 +17,8 @@ properties:
               - sophgo,sg2042-aclint-mswi
               - sophgo,sg2044-aclint-mswi
           - const: thead,c900-aclint-mswi
+      - items:
+          - const: gf,mips-p8700-aclint-mswi
       - items:
           - enum:
               - anlogic,dr1v90-aclint-mswi
@@ -29,6 +31,14 @@ properties:
     minItems: 1
     maxItems: 4095
 
+  riscv,hart-indexes:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 4095
+    description:
+      A list of hart indexes that the MSWI device uses to address each hart
+      that is mentioned in the "interrupts-extended"
+
 additionalProperties: false
 
 required:
@@ -36,6 +46,19 @@ required:
   - reg
   - interrupts-extended
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: gf,mips-p8700-aclint-mswi
+    then:
+      required:
+        - riscv,hart-indexes
+    else:
+      properties:
+        riscv,hart-indexes: false
+
 examples:
   - |
     interrupt-controller@94000000 {
@@ -46,4 +69,15 @@ examples:
                             <&cpu4intc 3>;
       reg = <0x94000000 0x00010000>;
     };
+
+  - |
+    mswi@16150000 {
+      compatible = "gf,mips-p8700-aclint-mswi";
+      reg = <0x16150000 0x4000>;
+      interrupts-extended = <&cpu1intc 3>,
+                            <&cpu2intc 3>,
+                            <&cpu3intc 3>,
+                            <&cpu4intc 3>;
+      riscv,hart-indexes = <0x0 0x1 0x10 0x11>;
+    };
 ...

-- 
2.43.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
