Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3DDCF6D3C
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 16:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LsxPlW2k8w65a+rRGViXbYn8NuVYOos7xPcUZezNLA0=; b=vsljU0vEnoaqcn
	iwrlND4HeD9id09PkPfSHPLb/EzmHTz8YkAizWZ4JHRKO8WXh3JG8xiqxjH3phDf6XsOcxoAbByuV
	hfyB14v2HTGyNLSfZXUmpf9dRh4KfCF9iB5GSIse2vTLjm11xFz0zkSStZgNCEPOWq4c4ekkHJZrh
	QPOz+s7pKwwTgDjfBx/eZyiodZH0JQPm7JJFFdKEw29LdJewXVyAVG0ka8D2F529dGqWLVKSxJr8L
	WYTwa7PXwsGuc52uCVWt4FTRv81NvJjfTdnnFh0iGaJgTpTOkNTcD8aoNUbkeq5SegsMnx+kwoexM
	nRRbcNAVyGTfjpDw2Qug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw1xa-00000006ssk-24vl;
	Wed, 02 Oct 2024 16:12:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw1xW-00000006sq9-3eI5
	for linux-riscv@lists.infradead.org;
	Wed, 02 Oct 2024 16:12:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3BEFF5C48B7;
	Wed,  2 Oct 2024 16:12:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F6DEC4CED2;
	Wed,  2 Oct 2024 16:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727885534;
	bh=eGNgKeEbgQZhlP5/rBYHyxG3CCVZQ0AAqZnzmPdtdiM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tnq9ps474zl9kcOUnvAVfU2YsrJMrat4YjA1CUovrMQSb+AwqFZvWnKv+JXM4pCtO
	 j5ta39uX82oghC1IuFobvtRioh+AcU+ghBgZ8qg+YcKKJxhdRmx/jJKyu1SmPAcdrC
	 lPL6hW8TsEIDgHHC+lZhtf9qU+89jL2ckL5RUVjfn/91pDXNeUrkNIFVya2uuDa0zo
	 +jSniu8tZ2WZqtyTQiTP78+xJ1ASEhMcIhlBTwc6tJixqGiTlDV12gWrTQJtQJAcqt
	 DPjg8lQ9xeYoQtIzfEhPcnl1eEpuU5CKOc6213xce5xHfkzV+SUJTiNxsWj5AtqhGm
	 vxQeLaNWTpRZg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC v1 4/5] dt-bindings: riscv: add vector sub-extension dependencies
Date: Wed,  2 Oct 2024 17:10:57 +0100
Message-ID: <20241002-eagle-fresh-4b2e259e45ee@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241002-defeat-pavestone-73d712895f0b@spud>
References: <20241002-defeat-pavestone-73d712895f0b@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2218; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=YIm6fXkkXwfBUiAT+70BG7jJ6bMEmlZ2jL6v+Po7WK8=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGl/CyY0Zoc48mS6G21S1XxefMrtmenFKQyKSqaFz+umR bh86WvvKGVhEONgkBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwES4XzIyrP+5KeX87tPv9z/s NjrFd/HKDu1jRsszzUO/FlbGFsl9OM3IsOU2T0wIr6gn16pkD1Pe468u85z7wHPEMkZx8lmB+9+ fsAIA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_091215_028934_69A905B0 
X-CRM114-Status: UNSURE (   7.77  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Section 33.18.2. Zve*: Vector Extensions for Embedded Processors
in [1] says:
| The Zve32f and Zve64x extensions depend on the Zve32x extension. The Zve64f extension depends
| on the Zve32f and Zve64x extensions. The Zve64d extension depends on the Zve64f extension

| The Zve32x extension depends on the Zicsr extension. The Zve32f and Zve64f extensions depend
| upon the F extension

| The Zve64d extension depends upon the D extension

Apply these rules to the bindings to help prevent invalid combinations.

Link: https://github.com/riscv/riscv-isa-manual/releases/tag/riscv-isa-release-698e64a-2024-09-09 [1]
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/riscv/extensions.yaml | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 779f5cfab806e..abf2579171c5b 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -605,6 +605,52 @@ properties:
           contains:
             const: zca
 
+      - if:
+          contains:
+            const: zve32x
+        then:
+          contains:
+            const: zicsr
+
+      - if:
+          contains:
+            const: zve32f
+        then:
+          allOf:
+            - contains:
+                const: f
+            - contains:
+                const: zve32x
+
+      - if:
+          contains:
+            const: zve64x
+        then:
+          contains:
+            const: zve32x
+
+      - if:
+          contains:
+            const: zve64f
+        then:
+          allOf:
+            - contains:
+                const: f
+            - contains:
+                const: zve32f
+            - contains:
+                const: zve64x
+
+      - if:
+          contains:
+            const: zve64d
+        then:
+          allOf:
+            - contains:
+                const: d
+            - contains:
+                const: zve64f
+
 allOf:
   # Zcf extension does not exist on rv64
   - if:
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
