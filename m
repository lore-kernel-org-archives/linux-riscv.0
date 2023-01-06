Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24520C3DA7A
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 18:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CWw/3O4LfKzUl+xDkA0gTttI2kn/0ptR3E0uZZRA6i8=; b=wE5dZhR6QzU/po
	B+MrAt/sjK4805R1xAggOnZ8dLG1OVnE/MXSQqVtas77CuojKpuqMsUuzSsh3oqSGsRJjd2IKXQSn
	nzkSUJyWCkQnKus2WPcQHAeyoHEtefnykjdQJEwMQDSG8pA30wmONJxXnxTpl7DfwHC5XMb/RZD9Z
	lqSMGQkRpkKCiKkPKRA/EqPHYy2DJGsbZtAoIMhpdlq6toqIoe0OxrzhBKqXQdwMxNda/BzD4J7+V
	fgTPMAxdfpzr2m+Xo9qGy3ITQyNF70NGdd9hXUDnY74H4kWDmPD/NWAntlhXAF3YzjsaPFEu4DLFH
	wz03FJHYxKBDNietsv1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDruh-00EVEp-W2; Fri, 06 Jan 2023 18:58:00 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDrue-00EVBC-2c
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 18:57:57 +0000
Received: by mail-wm1-x32a.google.com with SMTP id i17-20020a05600c355100b003d99434b1cfso1729293wmq.1
        for <linux-riscv@lists.infradead.org>; Fri, 06 Jan 2023 10:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p54UVKS+DBKqzkRwXzEnJFiykThg3VlROTJlwsRHWHY=;
        b=WXeVUDxUBnEO3+p5wA9+jFvQFQcaJ6ifANWSNGoISkn9RdHaRsZyj5W0eTdbOJSRhP
         rPGG+sKR0qj9fAATKHN4rOYWBFNy7U0G7Q/kIpkSZr5hTG4aY4U9s2F6WrvQfGqbeZ+f
         hbhLGYriMucjprSRZh1OFV5LQcavaqYWiSrrswDP9AesJcxX9L7G8F3SrUMv9Ghg4oLZ
         sAie7TTbDY+mr5kjX7Oor0cWE/JfSL4aIUa2Co+ArlMiuA7gJbs9mM6VSl2QC70Sh2pb
         6x+QrJKhAJgGv/BtLAHxb0ih29D/IHJGGKI9mfOF8v/2SHMCnrlQyECagW9zfHgeTsU1
         ZrqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p54UVKS+DBKqzkRwXzEnJFiykThg3VlROTJlwsRHWHY=;
        b=Ggeunc76OjTssx6iJPP9zdjGM9L3B39FunKDNvtwJbJntuabpMRihSs/SULtrIsVOW
         2BqX2Yd0ZyFqqGdrug2T1TczRdOLxUyU7cM2lUd0mK1UAH2yv/ur0Joj7yWCpd8HRxM5
         Y3NNlo7gYZRUpC6DENOyODfWirFsDIwDSPrt+BjS0X+6rOBfEFBtI7uvrwM4d9Wgjt1O
         uhPmn583zHG8F9uJm9uEdy/sRUfVwGYpGkYBKBE2vfh02p67WIx6vueTJnCNeWKWp6jX
         FSFdaPQjcfqtMUGcUYaDIRwL4HGE4+UxO1+wDU3ljXHG8Yb6LWhJbLcT2Fsv9+TQGvYP
         bnzQ==
X-Gm-Message-State: AFqh2krdwwRNIGushsgIDk3/B0Mu8AxEl5mV7QIrfiGHNf9h3TfP4vju
	DtqBlk2OyUjGNW5L9iBVUsY=
X-Google-Smtp-Source: AMrXdXtmn44ssW+/OirokIZFOycYiJaPfbPEap7ZWpKA+P5dUbhtFhl7yAknjv25pcwppBOaOLEltg==
X-Received: by 2002:a05:600c:1f12:b0:3cf:8155:2adc with SMTP id bd18-20020a05600c1f1200b003cf81552adcmr41246521wmb.33.1673031471459;
        Fri, 06 Jan 2023 10:57:51 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2501:c701:79e8:5b4e:615a:91cd])
        by smtp.gmail.com with ESMTPSA id d8-20020a05600c34c800b003c5571c27a1sm3162773wmq.32.2023.01.06.10.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 10:57:51 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v6 4/6] dt-bindings: cache: r9a07g043f-l2-cache: Add DT binding documentation for L2 cache controller
Date: Fri,  6 Jan 2023 18:55:24 +0000
Message-Id: <20230106185526.260163-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230106185526.260163-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230106185526.260163-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_105756_146110_FD387642 
X-CRM114-Status: GOOD (  14.35  )
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
---
v5 -> v6
* Included RB tag from Geert

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
index 000000000000..9f0be4835ad7
--- /dev/null
+++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (C) 2022 Renesas Electronics Corp.
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
