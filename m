Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2029CC79F9F
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 09:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SxRDH+lINjAC6ySMEpbBxlDkTMMic+eylFzMtRIzeV0=; b=Ye52GERxMjyPyO
	VhMYfpSohA9qE14s3HmRuKPiiqGGZ7EZROZ0Y99ClBRpSo9+suh1d3qz8Oz0cZz+VJKpY6+hW0uHx
	+hHPAyyK11PthwUUrMtPFRVYP5hSY9Kfg6xNTFejkfFNKEU3XLVvEQlG4olZmaTynU9adAJXsKHPU
	NZh+XSJ7grTxAyGx2AEud5pBb9Qp74H4kGQtJTdXu+naTfLeyWE/RvbzsIl9Moe7zBGTYB+UzQGRY
	fe6EKze0eNQb6V30pmHlprcqWxStmNBbv+dD70ZwTWsSxwE4U1uV7t9wB1JvJFzuINoo2TeX97sXP
	zK8oMsTyvNx6PHq8JA3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3W7S-00000006PTg-1L53;
	Mon, 07 Sep 2026 09:58:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3W7P-00000006PSR-1Dyq
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 09:58:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A3654483E;
	Mon,  7 Sep 2026 09:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C2C8C4AF60;
	Mon,  7 Sep 2026 09:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788775106;
	bh=AkxTZASk2YMZM60To9GH5xBpg+U1tdOQBOOVag6AfDE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=e21NceUNmwRLetw3dh/flq+cEmnxcyk6lJBYKsudHJ635mDUkgBVnHPxCpFSpmvas
	 IHATzzsXV8pWLVjd/2iBQAsJMZPPwXjIeija63NlFGMhVsumdx3BQHR//Cwn3SCAOU
	 NRBDkNXsa4buCK204fpKJs3x32WspePnUIRT66p77t+YWVutxTpS8hVMGGRZM3RNDi
	 XC1bHFrzXvQ0AMHXuGfIb1KSLyKzC2iSI5dP9a01d7nqOaRg/6eLBd5SjsFkc7u3uI
	 MyV4ePj3+SqLuG9L64P0+va/ye1R4vRqzywO4/2C8Ip29fIn2vUZNQChbquNWVhaVq
	 Js1kTkQm7OIFw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 279D8C79F9E;
	Mon,  7 Sep 2026 09:58:26 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Date: Mon, 07 Sep 2026 17:54:45 +0800
Subject: [PATCH v2 06/10] dt-bindings: i2c: dw: Add compatible for
 UltraRISC DP1000 SoC
MIME-Version: 1.0
Message-Id: <20260907-ultrarisc-dts-v2-6-5eb4c97477c5@ultrarisc.com>
References: <20260907-ultrarisc-dts-v2-0-5eb4c97477c5@ultrarisc.com>
In-Reply-To: <20260907-ultrarisc-dts-v2-0-5eb4c97477c5@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Jia Wang <wangjia@ultrarisc.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, Mark Brown <broonie@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org, 
 linux-i2c@vger.kernel.org, dmaengine@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788775103; l=1475;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=qmmOpiZIekiFaSTyRs9mX7I+f5uExLbikMi5zvQgBR0=;
 b=MwErmEoUN1yX+JIVBc+ba5Q2dXErRpQto0sss5j0hElQVOqMJXvvTtPalWZh+m4BTBf8Jq3Wl
 ENt8lFxCQsdB9c679906QjzeLeprXsiAtbyMOtMiuyYTnY914Vc6KyM
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260515 with
 auth_id=779
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
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
Reply-To: wangjia@ultrarisc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Jia Wang <wangjia@ultrarisc.com>

The DP1000 integrates four DesignWare APB I2C controllers. I2C1 supports
SMBus, while I2C0, I2C2, and I2C3 support standard I2C transfers. Each
controller has one register range and uses separate reference and APB
interface clocks.

Add the DP1000-specific compatible string with the generic one as a
fallback.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 .../devicetree/bindings/i2c/snps,designware-i2c.yaml      | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
index 467bdcbb8538..8a7c0a44601b 100644
--- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
@@ -21,6 +21,20 @@ allOf:
       properties:
         reg:
           maxItems: 1
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ultrarisc,dp1000-i2c
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+      required:
+        - clocks
+        - clock-names
 
 properties:
   compatible:
@@ -44,6 +58,7 @@ properties:
               - mscc,ocelot-i2c
               - sophgo,sg2044-i2c
               - thead,th1520-i2c
+              - ultrarisc,dp1000-i2c
           - const: snps,designware-i2c
 
   reg:

-- 
2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
