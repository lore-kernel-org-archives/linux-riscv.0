Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D1DC7619A
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Mar 2023 20:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GzdoPg0f4Pr3T8MqOmg6FezmkH+5QEWt0th2fua/HcQ=; b=jo/rh8YDQXf+rE
	ioGQRXclhxg01zXFeTinbOeopXAwsycj0A3u4/MMPC5Jn2KqoE80s1gKCPtkNTXYlKruSyJOqk12o
	kr9hwNQ2Vbd4qqHPyphBxOChtN3bhDwn567ZacftBYOHmxVnTQg0h7vdV4aAb9YM173iOUOIytfBf
	nkgQZV3YLzrR1dT30dkmxa9/xA5xoN2AZzx9yEhjDUfKgRlDRFttzyvm+9USKjMBA+12yZzjfcDWe
	NlkDHBr9rr+Vp8pjvO3MehELCAwDxs1+cn7gmFctbrkxIBsXJRsoSM24PvUv3xf39K9FT7dd6mNTQ
	XlUCb21v13z/dD0iQ/HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phz6j-0051yW-2u;
	Thu, 30 Mar 2023 20:42:53 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phz6b-0051tS-2f
	for linux-riscv@lists.infradead.org;
	Thu, 30 Mar 2023 20:42:48 +0000
Received: by mail-wm1-x332.google.com with SMTP id p34so11682353wms.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 Mar 2023 13:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680208964; x=1682800964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x7uCU6lf+09VHIoD9fbjjKmUZ8AO643QGh96ltPUUVM=;
        b=KgLs/AOcHwBkcb0V70o429wtpPZUloH+TajIJZog5aPGkpoyHiN4OWNfG8zhF+Oibq
         a98dntpog8JaKywIbdjH2YyAweAOBKoctExgtIMJhlG2WA9nZTRX3CNYAKOe2qTrMqbI
         fdm+G95JNyiwFUNKWQl5xl0om9quujFzvoQNRascn9OgAangMwAW4oiA2vgw7Zg8pb9j
         QYzE3xJNXLD4Zi1GfvkqOzyg2/iRoB5rnC+h53QIpKSHH7EyZScucct4UYWcadAVI3Wo
         IcOZi6/UMx7Eb5lC8hy0+pWU0wOPXixAJmjsnTpp9i8reApBHES9PX31QTHvj9u1fxAC
         xSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680208964; x=1682800964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x7uCU6lf+09VHIoD9fbjjKmUZ8AO643QGh96ltPUUVM=;
        b=xFyWUMzOvVnY0UWxM1BM2eBpkYBa/16UKIoySYhalI7qycyEZpidoyk7sJD8h6bVNV
         mzMJO1Gss4qXARIahyL8FEK7gbIax8iDFGDj5kKlxIrCY3RvVOEaGlM6fFQMNyea875v
         1HnrpbzhdhKwpAOSqRlN9qxabKveWVvjMiOe6qIU9lnfnSjLp3DMkGpemClR93gX35ls
         QkcYdNJc1C8CfsQFyyJmZAlP1kljntMosahnGI2SNt1pEtnlDJ/Hi8TK2NhdmDQI0UdR
         x8Tno74FQTimNKx0EGyfg5HfGgZVqvba00VZpBDCozaaQ4LniPj2MZigM9C0RYButFSi
         J/yQ==
X-Gm-Message-State: AAQBX9dluHJjBbnbrSCYbS90GF4PePwff8mxFkSv6tclRL7oxDWpH+nm
	PAtlW8dHW4Zs/FIOnIvpqvU=
X-Google-Smtp-Source: AKy350apQoJSwiW6jYJkrYX2B56tV0H5KyGXJmDXjEu+DANAbRr1LRfENpUrde5LByVQ3CMkV8kejw==
X-Received: by 2002:a05:600c:cc:b0:3f0:3049:b216 with SMTP id u12-20020a05600c00cc00b003f03049b216mr5108217wmm.28.1680208964373;
        Thu, 30 Mar 2023 13:42:44 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:30f2:5b7:ab32:c3f])
        by smtp.gmail.com with ESMTPSA id v12-20020a5d4b0c000000b002cfed482e9asm297981wrq.61.2023.03.30.13.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 13:42:43 -0700 (PDT)
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
Subject: [PATCH v7 4/6] dt-bindings: cache: r9a07g043f-l2-cache: Add DT binding documentation for L2 cache controller
Date: Thu, 30 Mar 2023 21:42:15 +0100
Message-Id: <20230330204217.47666-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_134245_864964_F12777D8 
X-CRM114-Status: GOOD (  14.30  )
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
