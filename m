Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD34EC77B78
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Apr 2023 11:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1virwxPfdmopr5H11vgPayvc6rSUIVasnSlygkCrkQo=; b=s9t7nTJLjptXb9
	/vt+AaHPnGTnMeFfrmUMnrp1tnRoO8RnyJQsyIVtdSXZW0caHm8y8HHDqQke1GYGfw2pO6fOEVcRx
	J6ZQyBEvP4+cneKFE93+p07SS7ODxiQGLux1a/Gxt37FcELSILoj9eysBF7r/zPZRibsEAdyQxMMQ
	N141SgV94xX3eIb3Zc4MscF1XiTy/TX1N43AYnyR1T3vzOigtZW284VR5AQh0g5iU11sHBJKBvIh8
	LMlPl6+Jr8INMnlj66xYFzffmfXDhOYo4aiot8PNW5xoXdcdYo22QtTwO7nUy7+jTcTQTwP8OPy/T
	B/Ej1fEx+vWuLoXMSUcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYM2-002kTv-17;
	Wed, 12 Apr 2023 11:09:34 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYLz-002kQw-0D
	for linux-riscv@lists.infradead.org;
	Wed, 12 Apr 2023 11:09:32 +0000
Received: by mail-wr1-x432.google.com with SMTP id e7so397671wrc.12
        for <linux-riscv@lists.infradead.org>; Wed, 12 Apr 2023 04:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681297769; x=1683889769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bRdsTU6BJd6u4Cr67nZtCHBEKYkozHH6oRZI2e8v+k=;
        b=ljl56RjrqxRIgJ+tom3ANal5bwEiem+otTOgWZcdoHW0EadLASoYsBiowJyKTzCiUa
         PqkKwhxJNkzuKpqUoKGlqP4W80MjrMIJSwDN7Lve7wSQ89dg/mUF/UAN9CPFFA9uCGyM
         06T5BlZ8gB2qMU8OIjWY68QGUL+Q5z/CTAiqFtqw8nlE1qSLJjN5MR3Q26KXDArpCMLC
         w5dCS2w+IkSjMLgbGv376io7z8GyB+g4rHqFJnW54BxHVniiiRUaQPa8ILCK6Zor7kjn
         iStUvMvU6ha5wpwjidF5cd87KWl2FvuDs3VptFLhB1qFs8G90mlUrSz+MIU8C4eIN7oe
         W+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681297769; x=1683889769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+bRdsTU6BJd6u4Cr67nZtCHBEKYkozHH6oRZI2e8v+k=;
        b=wkzOrKUYIiKnfR7f/3IAtSSl7OXQfxOIyZgswAaj75N+BeeUr3IUmV7zhhjtzWjsGB
         LvBK97asihSKdUJYKqw2yy0IYOl/M+gCO91NcPf03mvbjnYqzGCpBq5bbdsxI2Vysu4d
         s6BnytvW9lOao+vexNBo1lFAc3mCydZHOTGeM6bm7Kbv8LSFcXLs1BzpTM8TyZt4Wxdb
         x7Z4vHbqZbTug8uLMufxenBbypwPvqeE0Qh06+dNrQP6Cjr2zvrU+/iBg2UvHDs0j9ZJ
         vWf9t3PsP9yTV8dGNwv9nvdT0iWJB5UZIMldzLh0ALoB8GGK2OC9BYbtdznRpsAT4K/H
         nxEQ==
X-Gm-Message-State: AAQBX9c879e+sIRcHGHJRfHNk8QC+gynBinRRtHZ/N97r4+5FgFQBzR2
	S37LI3eIQrieWpdPFhmD+28=
X-Google-Smtp-Source: AKy350Zq8HVQv1W7wQ54wDuK9CkSxTlZLIPO1kIIjVThIRim9qk7jf4hDUJbL1CCqa0+Yf5jVPwpFQ==
X-Received: by 2002:a05:6000:11d1:b0:2f4:e8e3:ef62 with SMTP id i17-20020a05600011d100b002f4e8e3ef62mr780392wrx.65.1681297768888;
        Wed, 12 Apr 2023 04:09:28 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:783d:9280:20c4:db22])
        by smtp.gmail.com with ESMTPSA id l13-20020a5d668d000000b002e61e002943sm16863582wru.116.2023.04.12.04.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 04:09:28 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel@sholland.org>,
	linux-riscv@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v8 4/7] dt-bindings: cache: andestech,ax45mp-cache: Add DT binding documentation for L2 cache controller
Date: Wed, 12 Apr 2023 12:08:57 +0100
Message-Id: <20230412110900.69738-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230412110900.69738-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230412110900.69738-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_040931_106966_F2B564DB 
X-CRM114-Status: GOOD (  14.86  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add DT binding documentation for L2 cache controller found on RZ/Five SoC.

The Renesas RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP
Single) from Andes. The AX45MP core has an L2 cache controller, this patch
describes the L2 cache block.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
v7 -> v8
* Updated commit header message

v6 -> v7
* No Change

v5 -> v6
* Included RB tag from Rob

v4 -> v5
* Dropped L2 cache configuration properties
* Dropped PMA configuration properties
* Ordered the required list to match the properties list

RFC v3 -> v4
* Dropped l2 cache configuration parameters
* s/larger/large
* Added minItems/maxItems for andestech,pma-regions
---
 .../cache/andestech,ax45mp-cache.yaml         | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml

diff --git a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
new file mode 100644
index 000000000000..9ab5f0c435d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (C) 2023 Renesas Electronics Corp.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/cache/andestech,ax45mp-cache.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Andestech AX45MP L2 Cache Controller
+
+maintainers:
+  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+
+description:
+  A level-2 cache (L2C) is used to improve the system performance by providing
+  a large amount of cache line entries and reasonable access delays. The L2C
+  is shared between cores, and a non-inclusive non-exclusive policy is used.
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - andestech,ax45mp-cache
+
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: andestech,ax45mp-cache
+      - const: cache
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  cache-line-size:
+    const: 64
+
+  cache-level:
+    const: 2
+
+  cache-sets:
+    const: 1024
+
+  cache-size:
+    enum: [131072, 262144, 524288, 1048576, 2097152]
+
+  cache-unified: true
+
+  next-level-cache: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - cache-line-size
+  - cache-level
+  - cache-sets
+  - cache-size
+  - cache-unified
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    cache-controller@2010000 {
+        compatible = "andestech,ax45mp-cache", "cache";
+        reg = <0x13400000 0x100000>;
+        interrupts = <508 IRQ_TYPE_LEVEL_HIGH>;
+        cache-line-size = <64>;
+        cache-level = <2>;
+        cache-sets = <1024>;
+        cache-size = <262144>;
+        cache-unified;
+    };
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
