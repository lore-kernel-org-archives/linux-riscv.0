Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F2FEB64DD
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Jul 2023 20:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U8lnZhPY3/IrNgfDCN/BckBwFEimOYLbAYQ69NUZ4U4=; b=AkhS7upqr4eEyO
	1XxDmtXaZc6rLz1OSUgLw41yRmviZDcUPui5OcKgc82bBgFKVpgAqfpJakec7gMgroqwWilKEHzmo
	9khU3+yb8x6uGBOIajeMeJvdY9TBCSmGbV9tw7tyG+/Wy6q7OnZvIyCFf+Ytny/ZsaJU4XLsfjyvg
	rqpNMU1k+hn/1L+4zZonhEHGv184WlOpwKcT7jCZTX5UhpQOs9gpXcmxXj+gH8J/43vfrFpi+imPk
	Qg5f6cR4mOQUKLazMTvmGS31cbOn0f/okJ9lVLbZuJUZJXJKWuyQZdvXYxK7dE3N1P8+sdOb1SJr+
	WBXJ0heG7F75go96Tg5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qG3md-008bIP-2x;
	Sun, 02 Jul 2023 20:34:59 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qG3mY-008bCf-2w
	for linux-riscv@lists.infradead.org;
	Sun, 02 Jul 2023 20:34:56 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fbc244d384so33500075e9.0
        for <linux-riscv@lists.infradead.org>; Sun, 02 Jul 2023 13:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688330093; x=1690922093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LaAnY2MYt0RLcMUJbL7J5suwKGVCMC1VbS7DigqvURE=;
        b=eiFrJewPOXpmbgCxu0MGAOK/yP08hkAJXGkhsXJChai9swwd2mULgbWQRFWK/1bXYX
         ypHFJ0ew9zdAB+2VagoBcwIN452aFLfic7sAXvNTM2RYNA4kR4sF2G96lBa+gKOJBfZr
         ceoto7mNjX+FxDrY8LQEWuLiwnOpq2ztMykf7+varARw+4vAVq5TJ5AjlqCnF0oMyNZ4
         IF559ehbVw4JeFWn4vbp0HLoEtqByPDrKtFbnmfu3JWrOOVMAaag40SOhlkYkbhR9myw
         TT6DoBQNjncgUKb19I83RIjrO7CILEL8IrrannO3E2XnMR5OydeoYHiPK47ccLzgzwFO
         RpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688330093; x=1690922093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LaAnY2MYt0RLcMUJbL7J5suwKGVCMC1VbS7DigqvURE=;
        b=C15Jll5FRGsvcbb7IyXSEmfHCVw8s96UTBjNUsrqhwTSa0+yz+ICmViPM6c9klYosQ
         ckSNbYvlZVqqXq8aaXbWCV5MyiSEWBeZyr5Uv2R5W7sOSO47/rzrYnE6kf/8Jdi43iOC
         ev4vQhf2y3bEi88iY8mNoFSTBaThKBIMEItbOGr2Gqfp/K7VxC9KAT1fQPwBAM22uGd+
         IXDusA+6v+w5D36GIGmwHV7dlBJ7R03B07O+IroAf9g0osKZh6mnogJw/l/azuLZZBCm
         QQt14InxXdiy93IaBYBE8AKbodZtdgudUac+7j/Na6lzaEMsxQhiTIYMhScQpbNSXJ0d
         OUEA==
X-Gm-Message-State: ABy/qLblZiLxrPzVxBGz6MJt3tfXVREAoOw2IrfcPnRdydaKXCY+87bH
	tAPJHbQoZD5E1TAG7cs25+g=
X-Google-Smtp-Source: APBJJlExfIi1htPAWuwGuJA3assg5RdUAYRwBkW1/5OraOyqze7LAGXwW8RLaFwvDI1798iteTb+3A==
X-Received: by 2002:adf:e6ce:0:b0:313:ef96:84c8 with SMTP id y14-20020adfe6ce000000b00313ef9684c8mr6311811wrm.67.1688330093125;
        Sun, 02 Jul 2023 13:34:53 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:b4ae:ae48:2e1b:1dcd])
        by smtp.gmail.com with ESMTPSA id f1-20020a5d5681000000b0030647449730sm24000478wrv.74.2023.07.02.13.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 13:34:52 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Guo Ren <guoren@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel@sholland.org>,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v10 4/6] dt-bindings: cache: andestech,ax45mp-cache: Add DT binding documentation for L2 cache controller
Date: Sun,  2 Jul 2023 21:34:27 +0100
Message-Id: <20230702203429.237615-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230702203429.237615-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230702203429.237615-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_133454_971602_994D4AF6 
X-CRM114-Status: GOOD (  15.04  )
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
Tested-by: Conor Dooley <conor.dooley@microchip.com> # tyre-kicking on a d1
---
v9 -> v10
* No Change

v8 -> v9
* No Change

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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
