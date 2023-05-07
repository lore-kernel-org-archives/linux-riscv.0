Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20207C7EE2C
	for <linux-riscv@archiver.kernel.org>; Sun,  7 May 2023 18:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SVa1s4v0JKZlR+sgsbDIhLuHs3r84UwP/z+6jxwggAQ=; b=lwklaHCbWHULAd
	KHKFLwsI3lc8nRpVOj5JJt6deTJ7LgOgFE421GXI4LQ2lJpuVQ+ZemPJJCTv1LWIH4TFlR4KrciDO
	F9AGSZjAOPWfwtcIKkRF3cIhD60qXXUmsbS1wgpTpxn0/6AY8+xp7AZZYDzxSayM/UMm9j56Fv44X
	3VhtUzBGKXplrxFQbL9/aUVOznJ+te2JVqUFceoRkMtd6pWH4ewDCcM6/pZUo9pO5KpbDi9VmN2I9
	/+WX8yTl4NoPwWYnRbQv2no60P4a0nZ3jwOSowT5KSBtfst1S10tZutTJ7lxED9TCkcYdhNreFgl7
	ntU4Dve5pXLNIFcnM5OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvjD9-00GYEq-22;
	Sun, 07 May 2023 18:34:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvjD6-00GYEN-3A
	for linux-riscv@lists.infradead.org;
	Sun, 07 May 2023 18:34:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8F3E461187;
	Sun,  7 May 2023 18:34:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F72FC433A1;
	Sun,  7 May 2023 18:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683484456;
	bh=BANIf+ASt30mN5iS/NWLlkQ2ov0wGoxCBBMNfEgEvLk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iI2gauWXX+FpvZGeuZivJ5XIu/c/TN8lfj5WAK9mc72mvIoGhJH2S9uYQDOJymWlE
	 LulXx6JEDOKWhOmWkm7ja3YdWQHbNavQi1lD0RN7dvxG8QSXcuyUX0ecMFHWUJ8HTO
	 OoN3SPK/P+sGNQHeOzRFx4kXJmF/y3Gr2muWMdu2FKCJWiJSK0jsnib5zH5siuLnOO
	 7HITT5jeGH4riYtTIBC35hmL1GsO0GU0ZlnKYhCbOJcrp/xXMa7bgArhNC9LnfHqXh
	 tNUJe8EbpWaj8kXhIthunrRBkly54fbXcirV3z//8Z9Ol1HTI4LTT7FyVxoiJxahnq
	 iw3IQNL5k9ZwA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH 1/5] irqchip/sifive-plic: Support T-HEAD's C910 PLIC
Date: Mon,  8 May 2023 02:23:00 +0800
Message-Id: <20230507182304.2934-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230507182304.2934-1-jszhang@kernel.org>
References: <20230507182304.2934-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_113417_057256_1C00ACD5 
X-CRM114-Status: GOOD (  10.65  )
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

The T-HEAD's C910 PLIC still needs the delegation bit settingto allow
access from S-mode, but it doesn't need the edge quirk.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml      | 4 ++++
 drivers/irqchip/irq-sifive-plic.c                             | 1 +
 2 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index f75736a061af..64b43a3c3748 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -62,6 +62,10 @@ properties:
               - starfive,jh7110-plic
               - canaan,k210-plic
           - const: sifive,plic-1.0.0
+      - items:
+          - enum:
+              - thead,light-plic
+          - const: thead,c910-plic
       - items:
           - enum:
               - allwinner,sun20i-d1-plic
diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index e1484905b7bd..71afa2a584d9 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -569,6 +569,7 @@ static int __init plic_init(struct device_node *node,
 }
 
 IRQCHIP_DECLARE(sifive_plic, "sifive,plic-1.0.0", plic_init);
+IRQCHIP_DECLARE(thead_c910_plic, "thead,c910-plic", plic_init);
 IRQCHIP_DECLARE(riscv_plic0, "riscv,plic0", plic_init); /* for legacy systems */
 
 static int __init plic_edge_init(struct device_node *node,
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
