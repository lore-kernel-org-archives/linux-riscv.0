Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CAAC02192
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 17:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YONjjYE6ukgDJ83bAsCAGxXQOP9FU/hL5AjG+iJEqKs=; b=x2keLeQClzs9ne
	l4KFOWET2+hPLk9zup0Puht4t/LIlYn0UXjiPn2JFBredmwLTB/iNfn0wKhUMIrstMtBaAU0PHw2u
	mjy+9zA7MQ/7Evv1t+uBxX0LyInmupVM6oFaLTLJSJDPB7qOX6R+N3zinUcyj5oioJCwuDmGuO3o5
	m7j5yBYFO5wIt1OBtZ2ymf1OlSUwo8am+OQ9Z9HRNXyR2UYY79yoSfPrGO+1u7mcp7xxf8zRGPseF
	tiaHV3ksd3jHy+6qf4ARwrjzF4znwX1nIHkmeJlNO0kC2Cxf06+A91lK/oMFcpEJlcA7Yxw6jsCXO
	SLX8NPJUXh8ks99jltgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjF3-000000046JH-2IXZ;
	Wed, 05 Feb 2025 17:31:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhx6-00000003uhv-0NlZ
	for linux-riscv@bombadil.infradead.org;
	Wed, 05 Feb 2025 16:08:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=3RK4ZRkyyFwWjcSjemosgZTnU0suczf65jutPYX82pY=; b=ZKKYX1p1r1HmYVg5AZYxjD0BgW
	k7Gb4PMPtvegb78ciyQOtpgp0e1fv3hMHrqnOn3UNNk7LoIZ7BkiyxwoClkL8b+GJsossiQ5rTYOJ
	G0Iz3KlF3zOKyYFdefZsGjKfuZSoBDGyCFjvYn1h9xhgvt56snSoVRj+Hdbo32KOOoOK6T3BYlzvn
	TvbCxqB/OCAddq8+frCrpK8tD5Atk7hwHZ/iXScsFNEz4PPuy8uo60LDbimflCubHCzMjTB5Q8suy
	oA3jP49cLyh/Ar6nxAmnjUcKf+DjnlRKY1iCZLbqs5a/M0Cy5C5+8305sqD+o/qiQeGBI+/6uqliA
	Df8qY+Lw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhx2-0000000Ggqb-2nwQ
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 16:08:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9476B5C68EE;
	Wed,  5 Feb 2025 16:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8AAEC4CEDD;
	Wed,  5 Feb 2025 16:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738771711;
	bh=23nEvqAgqDq/DOPfIpZhT0472bYiLNAR6cd2MSKj14w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l+Av3mmy+6T64+lY9WygDOfeDV7rgXn/2RZVycV6xOeXJPQCAYz++p+PkiTs1xi2Y
	 UEVWi0Ipa+KgxrZkNsBhMCHUZZvc3boeTGFY2S6pR7owWmOvWgsVhiLuqf03HMmlxu
	 tyI/cxlfoAfG/wKK4nR/UR26ABUw7VdK1dmMePCU0tCSELqFfdPl4tbv0gpY8fjxcv
	 yswn2CvRoBD/aM4e2AKIlGNDn41v8IzY8qFChH+Eow0EmLmeLOxB0ReJ1CCxiVQb7m
	 S8gynj07gbvqrMGZqzk7Q1oqJm92xbfaqJ49XsCuLCQgM5D1CzoiYYF+pQrHMuFIHc
	 CiBoR+hQyt+Mg==
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
Subject: [PATCH v3 6/6] dt-bindings: riscv: document vector crypto requirements
Date: Wed,  5 Feb 2025 16:05:12 +0000
Message-ID: <20250205-ludicrous-gratify-b2ae27b95ebd@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250205-cobbler-unpadded-5580c1f5d946@spud>
References: <20250205-cobbler-unpadded-5580c1f5d946@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2259; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=4C+zfCw5yJE5unx/bTKD27SZG4062igzYOF7ISnVt+Q=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOmLe2y7Bfanpene8DU3nMQ7YfGKj5WTr/KeP7ovccbds kWm0W6fO0pZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRzccZ/pn4u7gq2lttnn6/ WTmxM/2eY+T1TyVPjii/j/x85dZf6yxGhoMX+K6HTk29emNWSLPUFCGV7XnGT3UmvvjzxKFv8TP j6UwA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_160833_216842_272EA458 
X-CRM114-Status: UNSURE (   7.11  )
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

Eric Biggars pointed out that the spec is actually incorrect, and that
the list of instructions requiring a Zve64x base is actually: Zvkn,
Zvknc, Zvkng and Zvksc. Implement the rules according to his PR [2].

Link: https://github.com/riscv/riscv-isa-manual/releases/tag/riscv-isa-release-698e64a-2024-09-09 [1]
Link: https://github.com/riscv/riscv-isa-manual/pull/1697 [2]
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
