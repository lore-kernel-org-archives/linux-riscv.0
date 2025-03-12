Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27537C28B28
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Mar 2025 13:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=10WJgiaVjTG0Vv8TgGEJxFH43Z6wlKnWU60jLofEOZs=; b=wVm/NcPgNH/oPo
	+zKgXe5UvvAbYZdUuKjl0A1YKf7ZzgBjQvGlH5t2fst+THKHnUTzClo9usSs6IE7BtRqVJj34KYhH
	o+/08o9ePdkh9dZys1MyJea11Cu528W590vPc8Jk12jYfP0wTFhnCzV6eTTuascNvutDCI3boUHjV
	JKqxjQGJyZn15PMJvgy9FBv4R+GO7WOEV78ui8+2bUzmOHn3M6Bu+3hyh7YSwvwZLzK1XelDWNX9n
	OoyIVZ0++yJmYYa7+B2DsHLWnN0qi2Z/2OR0IdjD59DnMoLyZJyH1wF0JenWuPufMVvBs+onRSA7g
	7Zr6Qs5rEZWFAgWUi/Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsMKY-00000008bCx-3zDb;
	Wed, 12 Mar 2025 13:41:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLtC-00000008X6v-26x4
	for linux-riscv@lists.infradead.org;
	Wed, 12 Mar 2025 13:12:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 231525C5AEC;
	Wed, 12 Mar 2025 13:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26759C4CEF2;
	Wed, 12 Mar 2025 13:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741785169;
	bh=rrda/qNO/FX0NEOGEwVQni3WrerJhMgnNGT11F7foGg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GD/EBmb5gnr6SOA3E/3LWJyjKvxyk+9CFbBTMioEXRzJ+LnPgcOpjc5r4TAt7LrTf
	 xq1SCOi2429Q4lc/NfBUqEVIZQHdNSWZ6KR0xJ8+h+inUXJid1N9dtSK7g+a46XHAP
	 XZmrN3iapfmUAFeqqNyOSZBk2c0LRnIdAJTIFilPOrTEn2tSLfwEsYnE5R+sZnr2y1
	 3KcuqJow295OipQa2MmsYNgDu79Fe8cMCFxv1tNnainDR/eOjJ/4iyNAS16aM0xIN/
	 WU3PTQKorc8/t7sMFOtweAjDCdQkTGB9Bn6imXdfvZaAQJE6uQkW5kI6OxXm3sogGd
	 uSbMPuuOWAzxQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 6/6] dt-bindings: riscv: document vector crypto requirements
Date: Wed, 12 Mar 2025 13:11:49 +0000
Message-ID: <20250312-flask-relay-b36ee622b2c8@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250312-abide-pancreas-3576b8c44d2c@spud>
References: <20250312-abide-pancreas-3576b8c44d2c@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2020; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=29e7Oy/RM1PW3iHddZaBGqbUZzx7/laHEWpEfD6BsPg=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOkXO0R0CluX7jLdZ2nS96w8dKJJc66Rv3VzXrK5cvY/+ 5fnkuZ1lLIwiHEwyIopsiTe7muRWv/HZYdzz1uYOaxMIEMYuDgFYCLv2Rn+ii5/M1ecbb3l5465 553WrLJZweLS8Zt1gg1r7VcmlSjDLIZ/tiedV8p2NKYFpuQv+BbqM1/VQ19q5v+Wnm6/mfd53zr wAAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_061250_650194_85E222A8 
X-CRM114-Status: UNSURE (   6.94  )
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

The Unpriv spec states:
| The Zvknhb and Zvbc Vector Crypto Extensions --and accordingly the
| composite extensions Zvkn, Zvknc, Zvkng, and Zvksc-- require a Zve64x
| base, or application ("V") base Vector Extension. All of the other
| Vector Crypto Extensions can be built on any embedded (Zve*) or
| application ("V") base Vector Extension.

Enforce the minimum requirement via schema.

Link: https://github.com/riscv/riscv-isa-manual/blob/main/src/vector-crypto.adoc#extensions-overview
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/riscv/extensions.yaml | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 02065664f819..9aeb9d4731ca 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -726,6 +726,39 @@ properties:
             - contains:
                 const: zve64f
 
+      - if:
+          contains:
+            anyOf:
+              - const: zvbc
+              - const: zvkn
+              - const: zvknc
+              - const: zvkng
+              - const: zvknhb
+              - const: zvksc
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
+              - const: zvks
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
