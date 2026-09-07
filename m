Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB1AC79FAB
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 09:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kSJJPgmaQ50uN2zxPEbIH62wkweLfOYb5uigVNBCa20=; b=0zTeAD24n0MOYv
	a9dVLaHszjBVGhXPEwaZ/B7lr2ivwE7aQpQQQ3KZHTv+GpHIDCfa00uZ9t1RwcL1H+woDSsYcyPMf
	9QtieeSyXabX6aN/XihfEbA6ywP88YXM0HQAwi1W6MuhAAnfTsRYsaONd66gZB3317LSdI1BxMBES
	1bi5IGVRfbg82rxgWIC9dafH5PvXTOAQ7R+MUPAbqKK4GT2d+sohitMElQZGXkoiR1uoM+YHwMg8Q
	jEObJbxug10fuE3c1PRcqGq0mFhdlUkG2ks2e0w3S8TLtJ4OWGQX3xLPmmcaagNT3l6UU1UFbp7yC
	fPV3K+r0NECflnQNRmyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3W7U-00000006PVO-2lUG;
	Mon, 07 Sep 2026 09:58:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3W7P-00000006PSS-2m9j
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 09:58:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AC89160DA3;
	Mon,  7 Sep 2026 09:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D60AC4AF11;
	Mon,  7 Sep 2026 09:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788775106;
	bh=jbMzoob+yfp28o1fkQLtsSQu9lgIRg09JA0lafc+WTI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iyiovwlBBuEOAq4Xon/s5M71gn3gz/X0/Q0muVMM7NDmpzqsDt+MEASEgykjuXV16
	 jkoUUZ4WC07E1GAF+5UDLZQEiX0OOTqu8TyOYXnsgO4sxaYeGqrTZ7ioOe7sPbB5ul
	 fPxpBgJwGRw1YwrB6fdQB7ZgBISYWLnrwawdAlXDHLuCkV6bDWmYScWPs24qDqtf3V
	 OTidh+RJnBG5uTKxiJLF3Gkv1rZe7V7sdluVeJbgaRAwMF62cxu1Kkk9yu97QPr+hC
	 O1mHb8hg+fskHqBWz7BGzBror3FPaSTiGUNB2WypiiR9HgaSlZGhww95IgTQ+Itpdo
	 NdymIhLtWNgOg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A3DAC79FA0;
	Mon,  7 Sep 2026 09:58:26 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Date: Mon, 07 Sep 2026 17:54:46 +0800
Subject: [PATCH v2 07/10] dt-bindings: dma: snps,dw-axi-dmac: Add UltraRISC
 DP1000 compatible
MIME-Version: 1.0
Message-Id: <20260907-ultrarisc-dts-v2-7-5eb4c97477c5@ultrarisc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788775103; l=1419;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=ENFwCaDg2Es24T1JPD8nJSb6K6VohaYxMboKPZolvgI=;
 b=MyRA9jGZrwxWJ4/f/ssvZI6lzGtLrFdRbrj04uuCN0+jhnwxhnZs36ZCQyo03NHkrgeKwTgY7
 meq5UYXIU1ZARPkIWze/XzKIuDOOQniuZ47xHauQ0/IYsaJTuP473O7
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

The DP1000 integrates a DMA controller.

Add its SoC-specific compatible with the generic fallback.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 .../devicetree/bindings/dma/snps,dw-axi-dmac.yaml  | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
index 0a30a455b0ee..bfd6d67a98e6 100644
--- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
@@ -14,6 +14,27 @@ description:
 
 allOf:
   - $ref: dma-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ultrarisc,dp1000-axi-dma
+    then:
+      properties:
+        reg:
+          maxItems: 1
+        interrupts:
+          minItems: 8
+        dma-channels:
+          const: 8
+        snps,dma-masters:
+          const: 1
+        snps,data-width:
+          const: 4
+        snps,priority:
+          minItems: 8
+        snps,block-size:
+          minItems: 8
 
 properties:
   compatible:
@@ -27,6 +48,7 @@ properties:
           - enum:
               - altr,agilex5-axi-dma
               - sophgo,cv1800b-axi-dma
+              - ultrarisc,dp1000-axi-dma
           - const: snps,axi-dma-1.01a
 
   reg:

-- 
2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
