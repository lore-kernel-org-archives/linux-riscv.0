Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A78F459EE
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 15:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W+BJh1Mn5xwLpzx1gn/b+f3q1M4jVjUt3TjMVY0i55A=; b=zhZOHNsDll+jLo
	u/9oBNNwSRBLas67xc1gPYvMD6ULhT9ES5hOjDGGtRV/lmb19bBXsft1jedqcWbMA1N3kvwl9lsIN
	pz2sXLC/jna4zAXbpnPhQ8bG6ZbH7PsiYQfjXoJjPB87XJ6wmroBKmee86s7qLPdUSAKnaH0+AOtf
	I/QkhG4tWcHYa1H0nRop/BogjqKzE7asv1FwUvAE8z1z67hw9gqA10+drLKnJyJ+V2jaZrd44jYHr
	e+Cbv4KDWE9srSFApblfH/YZZdgGVY+azC5E4LT+baVu1avuBBFaU43xm12NymbusVZUdXo2TjEfV
	RTBZclxJZgIdb/nSwDnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBDPt-0000000CPnF-0AMD;
	Fri, 10 Apr 2026 15:05:05 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBDPr-0000000CPmn-0Cwr
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 15:05:04 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-82c20b9fb15so1152464b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 10 Apr 2026 08:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1775833502; x=1776438302; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OGwxGNzPNhl8p1KQjYaA0p0dmTpV8/UPLRrlCuE9w44=;
        b=vSWBIOtvvgA0WfZHUmu0AHQ+wr5b56FPYnAFB56M/oMVeYVz+UwWq35wSWttSSi70P
         Xjzm3ozAfshwFXMco9xRQWXzp9/ucE9GuX7pylGZRwjYe230hxm1ph0ZCoF7DnIrOU7r
         cdAiOD4CrSnURV5Xj/bbILbnB45J0hy17WnStZoEDkJqoiHILOe/BbdTXHEuPaB9jmly
         NtxKEPVAaqrQyAsqbeG73Pus1uJVqfTX746PVghFpSaHMHAgqDKOxrcu1m2uwAEDiGlB
         5BC+Lr0AIsMdcejfnjKV5TMkGNQcBiGdS8NvVW0ZD3PpbUwlQgRa5Ad3PmuZJ5nHoc6k
         +fDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775833502; x=1776438302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OGwxGNzPNhl8p1KQjYaA0p0dmTpV8/UPLRrlCuE9w44=;
        b=ZW7Kt9hOis0yM6SKNccB/KYjRP5HbxKBSUlZNB7pduYMIa3k/2+P2ja3fgU9Hpg3RN
         12J3rnCTKnxWRrAZYjh28bw9ItgKvt7fSlt3bRu2YEueaJ7fGwk6b8kwhswH4aGH3IT+
         XTChky3YBRz98Y4ruPcObe10E+Dyr0DM/I4pPStUtmock6VSEeMDH+Upx7WTvrNnpT6f
         QqvfN25WXX7PYGG73FB+345D2pNJjWegpttzhN+T4RvuRf3CrY03+nrEazq23sqQ4D+m
         x6GETDLT9tuYhCjWNGyOOBcdJfSWoPkWpUNV4Qs0IHwLiMkw1eTkVt2n/mgjKtdmJHbx
         vFSg==
X-Forwarded-Encrypted: i=1; AJvYcCURUZ/6ve6XC+EOE3HsPALT4wOmVwkB9KihjWQLnubcec8fcI+xfwJzbezVad5rujdLBNrhPnNd5hv2Lw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyicD3hLs1nNUZDcKN7WKdGDDf9LcYpEZSmhA7Hho2m9UiocNig
	CNHH0ia4ABdwX1Gox0UGuTLXkYClrVZ3T16fSGP0xt1vBLzzipBQ2Y8l9LXTXoG4Mm4=
X-Gm-Gg: AeBDies1arRT/RoSpv5UokG9H86Mi1a3HwvipeplpL+LRU54rZIF8Z9pJO4lfNBvl+g
	KJguqDYlxBLPGOsJutpcYc3QYxovrmWDSAjejTUYAGBEcY/VJe+3shlTbbG25xDAlq4k9wrJI3K
	JkMB+GaGQSYGMZK9Pg3+aUhSH0z/V1bO7x1pyW23LaeWb7D+kCgOkSjM/eOhjiUnJ2m9oDHpr+q
	sXYMRZCpXP6tLx3AGRZrLgt/Nj6KEzi4s3PudSqNxvKjeqy5dyCSnhsk/h1me9mHMm5pF48gwD1
	ZRsIuoOa+OeCwR0xtAqEAswLnNMfO/5MOsbOpsL7KV6qGY0pp3I8IiKKqQ1leaKgxWsie+qL4w/
	IFfqYcsgMaazYikZnyo3muxcjR7pJx6zhfn43zu+1z/IRwOuNIrR6bcP13jjTqmZSRKpmxJYIM5
	i0nEkkghZM2mbHJEYt+vFtobrGr+5pKhg4WrVwmGthpB4S6CrWhNqKTTM0AASESm4Q
X-Received: by 2002:a05:6a00:808c:b0:829:8942:2ca4 with SMTP id d2e1a72fcca58-82f0c281379mr3779253b3a.19.1775833501946;
        Fri, 10 Apr 2026 08:05:01 -0700 (PDT)
Received: from [127.0.1.1] ([45.8.220.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4d5413sm2970532b3a.40.2026.04.10.08.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:05:01 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 10 Apr 2026 23:04:20 -0400
Subject: [PATCH v8 1/3] dt-bindings: spi: add SpacemiT K1 SPI support
MIME-Version: 1.0
Message-Id: <20260410-spi-spacemit-k1-v8-1-53ebb48a4146@riscstar.com>
References: <20260410-spi-spacemit-k1-v8-0-53ebb48a4146@riscstar.com>
In-Reply-To: <20260410-spi-spacemit-k1-v8-0-53ebb48a4146@riscstar.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Alex Elder <elder@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Guodong Xu <guodong@riscstar.com>, 
 Alex Elder <elder@riscstar.com>, Conor Dooley <conor.dooley@microchip.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_080503_100616_2A9538DE 
X-CRM114-Status: GOOD (  12.21  )
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

From: Alex Elder <elder@riscstar.com>

Add support for the SPI controller implemented by the SpacemiT K1 SoC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 .../devicetree/bindings/spi/spacemit,k1-spi.yaml   | 84 ++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
new file mode 100644
index 0000000000000..e82c7f8d0b981
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/spacemit,k1-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 SoC Serial Peripheral Interface (SPI)
+
+maintainers:
+  - Alex Elder <elder@kernel.org>
+
+description:
+  The SpacemiT K1 SoC implements a SPI controller that has two 32-entry
+  FIFOs, for transmit and receive.  Details are currently available in
+  section 18.2.1 of the K1 User Manual, found in the SpacemiT Keystone
+  K1 Documentation[1].  The controller transfers words using PIO.  DMA
+  transfers are supported as well, if both TX and RX DMA channels are
+  specified,
+
+  [1] https://developer.spacemit.com/documentation
+
+allOf:
+  - $ref: /schemas/spi/spi-controller.yaml#
+
+properties:
+  compatible:
+    const: spacemit,k1-spi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Core clock
+      - description: Bus clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: bus
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  dmas:
+    items:
+      - description: RX DMA channel
+      - description: TX DMA channel
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+
+    #include <dt-bindings/clock/spacemit,k1-syscon.h>
+    spi@d401c000 {
+        compatible = "spacemit,k1-spi";
+        reg = <0xd401c000 0x30>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        clocks = <&syscon_apbc CLK_SSP3>,
+                 <&syscon_apbc CLK_SSP3_BUS>;
+        clock-names = "core", "bus";
+        resets = <&syscon_apbc RESET_SSP3>;
+        interrupts = <55>;
+        dmas = <&pdma 20>, <&pdma 19>;
+        dma-names = "rx", "tx";
+    };

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
