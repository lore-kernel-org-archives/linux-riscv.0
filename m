Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84273C71149
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Aug 2023 13:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pR1V3uQp2IS0BciRK8cqYd4nHw2prHDbzilmiQGrsP8=; b=ZzojyMQNbZkVXo
	IVYXS2xWeUiL4HbiHwbn8MJ0AaPp3SXlNUkmwpVqJiJENUUQAYEe+8o4ReCYqzZdlIBmCoFvmCZDF
	bAN9+zs2j9vn22wQteuhMAWUF8Pm9sC4pN6p94mt3toS96lBMgX2K/XFO0NpmfFD1RzcR93/wsPUn
	7NCxk+4dvDCjcdML1ZbQs3Eas3Rl0O3eKDVtINdO8s0by0k4lvb2eZW7/UOAd96tSWs05xt6B9dg3
	uSslD5a8d103QhNBY26rsAULmZ7mwY1nv885EjHfc08MaDXcjZ3lu/fVk3u1RLARgCz0oWsfhPssf
	qV2MX3xFh9upOMvNqEbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWzz3-009RGN-39;
	Fri, 18 Aug 2023 13:57:50 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWzyx-009RCF-04
	for linux-riscv@lists.infradead.org;
	Fri, 18 Aug 2023 13:57:44 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fe45481edfso9231875e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 18 Aug 2023 06:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692367062; x=1692971862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+S6fmChfBsFqwxOcSC7kv0ocWrY5ZFX/CE0Wd0tNK0=;
        b=rrJrF7ghuXk5RdQfUhKyu6Vsnw6NOQVj4fn+yWaNVbZMKoUUImJytDm2awFHVPuqko
         KBlbbT7rRi6Bg3Uo+d/h8eDeLl0xsOG6geQa4nFpK7EE6Q4cXrJZ3PRSjgzvSacS7A2g
         1AO4I4gv+ER9Nmh+Lz+PBzPB6wqA8CGQHNPtirIhEyJAUGVTpk1/A7ApNfoEx31aIi5y
         Q4S68RybYjOr9/uu2vmwm+W/Vs249q7dLu32fAIydmIJa11TyqQnihCQAf+/u9sYccqE
         GZit8ZEbriHTe8oNfE+fhaQrKcazgDMYDTNGoUQp8ykw/ZIXIYsx8osREExgd0rWJUZQ
         mAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692367062; x=1692971862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/+S6fmChfBsFqwxOcSC7kv0ocWrY5ZFX/CE0Wd0tNK0=;
        b=etn/qaLo1+0KSaZlfMs8UposkTYJWg78J2nQLMZ4gsVVOuruOcEnOEdu+nEGt/0V3r
         o1IXPrKzsHwRu4ql0cvPtgblCXABQCHK8cYGSo1tzWwb+Vla8jqEJoqoqpEcoYW2+8rb
         xgA3FO5OAskloBKhHkfimrugc54C5cZo9afYk19kddaBjSm9HaydMY59843ZI+zIljRi
         450eWmeuXe0+LuK5mU/thRvOoQ09wHZLdTOvF3GGuTq/2KxV6Eb0nN+we6in3aRElXK8
         umdi9l5YD0I2SWjXmrWvyMw/0ZfC+y2zT65r2xj8prhOSwkM8aaQ2FHURBsPWwPrnQk0
         m81g==
X-Gm-Message-State: AOJu0YzzJ1+oqNfMMucvxVzG6cpuZPApvX4nLW9JkjAThMaLrduqFNtD
	hrUpibA/r3GGPwbSlzptPF0=
X-Google-Smtp-Source: AGHT+IFJC7Nyk4IOSIwRLJaUUbEm2y/WNDbWEN6sOwUR2YNbK5+pjxFDUDPp2m0LuXIuQOAORGKKJw==
X-Received: by 2002:a7b:c4d1:0:b0:3fb:e643:1225 with SMTP id g17-20020a7bc4d1000000b003fbe6431225mr2334885wmk.13.1692367061752;
        Fri, 18 Aug 2023 06:57:41 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:4b30:13e8:1d57:42fb])
        by smtp.gmail.com with ESMTPSA id s14-20020a05600c044e00b003fa96fe2bd9sm6444055wmb.22.2023.08.18.06.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 06:57:41 -0700 (PDT)
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
	Christoph Hellwig <hch@infradead.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v12 4/6] dt-bindings: cache: andestech,ax45mp-cache: Add DT binding documentation for L2 cache controller
Date: Fri, 18 Aug 2023 14:57:21 +0100
Message-Id: <20230818135723.80612-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230818135723.80612-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230818135723.80612-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_065743_114502_70D36AA4 
X-CRM114-Status: GOOD (  14.75  )
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
v11 -> v12
* No Change

v10 -> v11
* No Change

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
