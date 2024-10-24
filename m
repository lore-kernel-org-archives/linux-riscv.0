Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F96ACE8E70
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2024 12:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LgqBRy5kJFm1EkFWLHJY8RgAEcapgKKzK/L300BtqOo=; b=uxJc+4Kq1wVi8x
	dwMmyIThJVBQn/DyfaLCfESQJJNKFiX/7wOCYwRpsNtL1VUYNuF+UTYAjsg8vxrgZcKCTbsNtEoIx
	+Aq1+LC7XhTW8wPxbMowZK8rej53xoAY1R0Cs8KZkHdxn1uSdmEurbwx4riXnnnr2biNi/Z9kbqhz
	6Xhri+GsvSQe0zlWgO2FqWotKM7vjkQEudTt0N9/zY4//zsxx4HBFCpNmwFEjMkg7sE1L//HMNfoa
	O7hc/iqjKu23zcg8LPZ2O5xULag+cP/x3hD0oTxU9z4xSdvpLDkvgxxDp/SK65IdP/3cCBHB4WOge
	CWdZh4vFZ05UT3+h86nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3x7m-00000000MyX-3qh0;
	Thu, 24 Oct 2024 12:39:34 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3x3D-00000000M4x-1gh4
	for linux-riscv@lists.infradead.org;
	Thu, 24 Oct 2024 12:34:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6763CA44F2F;
	Thu, 24 Oct 2024 12:34:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDCE2C4CEC7;
	Thu, 24 Oct 2024 12:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729773290;
	bh=K3gXF6XbnmUL4vxccwBpDJwpWrMAwTUAMTHCmMZNmhU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E2OCOXA1DSNsWokyzFT/mLl5SxryxKZX+3uEFZQikGCaaPIBuqawl6DMXGiXvLUAA
	 nuqpD+M4WL6rs5QZnaRH5R45WA2EM5M7L+44oDQ/AtqvIzLPji6QNDVFJqv4yoVQbi
	 G/BZVS3T7GhoCcLBTJLwBlVVHeo+nReL0wEXLfBNloyz2c4Ox9Slr1VPJCEebXan+L
	 dTc/8m54UOThkT5CrsY16Eyj/yeWy66zIwBkD+1qPvwGuCEvFlweX1Ul5N64E6Dq4M
	 srpEbt7N6AyG/yjLAd4VzAz/BkcrYwc+/Z9XKdk7ySHhG1ViO5IVOjfEIuy83lMtVy
	 4a/EtsGZcGeqg==
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
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 5/5] dt-bindings: riscv: document vector crypto requirements
Date: Thu, 24 Oct 2024 13:34:33 +0100
Message-ID: <20241024-pungent-lasso-42dd3512a3c8@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241024-fanning-enrage-bcc39f8ed47d@spud>
References: <20241024-fanning-enrage-bcc39f8ed47d@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2037; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=VOy2t1F9TKOOPNx3M+MXPHgxN3iDgl3UPDedDE/djSQ=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOlSdtes2OevZCwRtevndV7gEHIv9262WM9tzomNe3Z+K //45+DdjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExkzndGhn7rDdXb5CRP8WyW 3XL2n4Tnfl2WpeH5b3qLH0+d83Jl71VGholrOFib/4X9zJPsnjjzvdihro2/X8bKyoXfuv7+8hn bbQwA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_053451_628960_E99E6257 
X-CRM114-Status: UNSURE (   6.98  )
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

Section 35.2. Extensions Overview of [1] says:
| The Zvknhb and Zvbc Vector Crypto Extensions --and accordingly the composite extensions Zvkn and
| Zvks-- (sic) require a Zve64x base, or application ("V") base Vector Extension.
| All of the other Vector Crypto Extensions can be built on any embedded (Zve*) or application ("V") base
| Vector Extension

Apply these rules in the binding, so that invalid combinations can be
avoided.

Link: https://github.com/riscv/riscv-isa-manual/releases/tag/riscv-isa-release-698e64a-2024-09-09 [1]
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/riscv/extensions.yaml | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 20cead7d8af71..38d77043552a3 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -658,6 +658,38 @@ properties:
             - contains:
                 const: zve64f
 
+      - if:
+          contains:
+            anyOf:
+              - const: zvbc
+              - const: zvkn
+              - const: zvknhb
+              - const: zvks
+        then:
+          contains:
+            anyOf:
+              - const: v
+              - const: zve64x
+
+      - if:
+          contains:
+            anyOf:
+              - const: zvbb
+              - const: zvkb
+              - const: zvkg
+              - const: zvkned
+              - const: zvknha
+              - const: zvksed
+              - const: zvksh
+              - const: zvknc
+              - const: zvkng
+              - const: zvkt
+        then:
+          contains:
+            anyOf:
+              - const: v
+              - const: zve32x
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
