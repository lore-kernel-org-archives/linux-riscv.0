Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E859C7EE25
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 15:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OE2ozi32KxOVVFJh0Y2I3DDY+C2dMpaZAmtg9GY+RnE=; b=sH1bl2Fz5miMTb
	m0kc/7VOJKWTrUNQPPwT/p8m28lFiWVqPjDk8/vqWUvDe4zQIOHZKMSX+V5TqPQphMaIRB+stFtsh
	EU+gWgsswWRpGqEfUlYotFmfVbZE16iSl863LWhoUkYDhoGJMpb/6gr0CUz4+DJy5gk/bGElLeq57
	EQAcR6JDYwI+oYHeGtBs8zRHq//Sz1xdJ04TrE2GxNhHI75uEwV77KF58AsXu6LQ2UM7aBosYA6W0
	8CLdehJh284a+6T+9OHZwyO+9DZvStubeMBbP16lWyQVl0J75mlZdgeUp00IXn23SzESwWPvJs3AG
	dTZLTJ/ZaTHSQXuVa+zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzfe3-00DJyX-1S;
	Thu, 18 May 2023 15:34:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzfe1-00DJwi-03
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 15:34:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8D45E65028;
	Thu, 18 May 2023 15:34:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A11C433A4;
	Thu, 18 May 2023 15:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684424060;
	bh=tjHJaA4aRTqHjDCA/IBwb6cvsxUrvZf4t9KhrAVlN68=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N+2e8i1lfdMXruROpTVyKaDJ/BPI9Ea/5vVZZEyGCrfBBlPT6gtw4l29LlhUgmTui
	 kGstJMnnRklkzGtWGj/2rNoX2HiP7Q1t1wnyUtVPuFdaCwmL6a19JJp6itSOYx23JS
	 Z49MrEa1cQloXMVH9moLwlowYTZdGI06hWjxWgBhEt4pdYu8HtXCXWjY6g7gwvNje5
	 neofy3LGe2CH6NNOCrAJjxnXvT+1cdXJvzRXT5WekdeIR0Yxm1FsCCIVQ1+tFlxyy/
	 bMTiVJ88uwM3d6lLYSwT4iLWR/K56JAC8XWcYyDvWiNzgvj8zMaD6vbhcRUiZE0+LT
	 yI0Zl3R6xxZ7Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 06/10] dt-bindings: riscv: Add bouffalolab bl808 board compatibles
Date: Thu, 18 May 2023 23:22:40 +0800
Message-Id: <20230518152244.2178-7-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230518152244.2178-1-jszhang@kernel.org>
References: <20230518152244.2178-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_083421_091754_F14B3CA6 
X-CRM114-Status: GOOD (  11.99  )
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

Several SoMs and boards are available that feature the Bouffalolab
bl808 SoC. Document the compatible strings.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/riscv/bouffalolab.yaml           | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/bouffalolab.yaml

diff --git a/Documentation/devicetree/bindings/riscv/bouffalolab.yaml b/Documentation/devicetree/bindings/riscv/bouffalolab.yaml
new file mode 100644
index 000000000000..3b25d1a5d04a
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/bouffalolab.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/bouffalolab.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bouffalo Lab Technology SoC-based boards
+
+maintainers:
+  - Jisheng Zhang <jszhang@kernel.org>
+
+description:
+  Bouffalo Lab Technology SoC-based boards
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: Carrier boards for the Sipeed M1s SoM
+        items:
+          - enum:
+              - sipeed,m1s-dock
+          - const: sipeed,m1s
+          - const: bouffalolab,bl808
+
+additionalProperties: true
+
+...
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
