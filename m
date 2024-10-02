Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9630CF6D3C
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 16:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K2NRZJxxWtOWezkBQabYG5M4aHw4jNmVQy5HNbs3GPQ=; b=etKxMCuLVK6ohL
	TFdhikbqf+Fjx5k2jmi4pPFTsu+1XXuxH/Hy4FQsrzPxj3MVirPpyGC7Bph3pWNOYNrQRY/jEK8CE
	KqsLGdkcl5NB8s/vzb4zPPYcbnVdHhkoT8rrNKWk+hnI9n+Ymg5XL9A2DU7hTCDCjtQHgova8UU83
	Dm/MMpqvgBeHS2l8xogPOHQ0CMax+hT6AZOIUYZeltxdeIL10+UN6YQfwbczFhvFSTs672yiXqwF5
	0gamXlJAfXBmmadoF7JICnK+Je1Ihrl62idpxFVjrZslFGGorcHTA1b06aUW10Q3FL+D2M2fbIuu8
	Lg8Sa+cR23TCmEPaQ8PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw1xe-00000006svo-2MZj;
	Wed, 02 Oct 2024 16:12:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw1xb-00000006stL-265D
	for linux-riscv@lists.infradead.org;
	Wed, 02 Oct 2024 16:12:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D7B625C4AC8;
	Wed,  2 Oct 2024 16:12:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3042FC4CECD;
	Wed,  2 Oct 2024 16:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727885538;
	bh=UOs9fQ0Qb/dPq24ntgo5+/lHqCBltfzgg+ulESJu13k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SD8kvVnOSrKOvT28i1yXRDH8GlU0eANdP6Xef3VAzTlWfKRWouCVkzxZxV5xBs7xc
	 607vzEqP/iQBDEt8FftIeDWh3OtyyCaz9/Uh79IfOYB/3dt19TGsL8LtjrxdrPVlul
	 iMYVGxg81pTvITejQsP93VmEAxwfUjhn0sNhSHgE38bAllXRcQgZzASxHmFYbE610f
	 tdM+2C3RO040LAqjTtM+6OoCF82lrFRk6IJxnWTUVveHiGb5/TlUWQQoPb3jucKdn/
	 4mxAHcr6uqy0kdO2+svFn+QfMliNTgqBgRAws1DqOk2RfLbSovwvb95TaZX6943R3Z
	 XJMSfUvtwcOaw==
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
Subject: [RFC v1 5/5] dt-bindings: riscv: document vector crypto requirements
Date: Wed,  2 Oct 2024 17:10:58 +0100
Message-ID: <20241002-sincerity-urgent-acdb0e8d8a66@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241002-defeat-pavestone-73d712895f0b@spud>
References: <20241002-defeat-pavestone-73d712895f0b@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1973; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=0csTQ3dN/Nqy674iSwkezo4Jzd5QbE3DDkc2MwbnXzc=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGl/CybsehZ2KKB10qJJ7dWVbjMfLZnbNYHLxnGp+45jl 3PubTmR1lHKwiDGwSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJCMcx/BVdpP3DzO/yA5ce LU/e32c2sz/TNOiz+7Qyf9LXo7+UJ21k+O+3UUv0FuMK36YJm82+5zgpB31xd1t2zuGfqXrYkle O0dwA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_091219_653715_B5620F26 
X-CRM114-Status: UNSURE (   7.53  )
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
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/riscv/extensions.yaml | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index abf2579171c5b..02b822bbf341d 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -651,6 +651,38 @@ properties:
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
