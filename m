Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5ABCCF9EA
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 12:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WZf435NtCIKnJHpIOrl41o4HE8Afzta9sLbT42s3Xpc=; b=jVfRPpqsGn9APY
	zi3i5gdbK6XVhwCjHweKvYlKxsplJIUw5KCwiBfviIM3oq6njCReL5UTVQ5gS/bxBN67gC51/pv/e
	yT7Xyt+661Y9SWSiUGkctYBTJWLVw+Xw1QEjNlwd1OoopULORZL1GSCS5kB1510MlkoLQxbXtVN+g
	4B/Uvq0H+Y4R544Ho81xqVBfn7fw6uH0lYh0cTLpm3vSctfKw2a1gjQYvPkpaSIs3yhVh05xFn3EI
	hj6uTJxe+bxAkhziLPtGHC/RLJpx/YaBxPrPOO0ki47QL6TFYf603iJCrxXvHsUOOjp1PR54PLh+6
	RD3M1/VsmGQebgQktO5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMkk-0000000DwM7-292q;
	Mon, 27 Oct 2025 12:55:14 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMkh-0000000DwKU-44Rs
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 12:55:13 +0000
Received: by mail-io1-xd43.google.com with SMTP id ca18e2360f4ac-945a42fd465so58336639f.3
        for <linux-riscv@lists.infradead.org>; Mon, 27 Oct 2025 05:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761569711; x=1762174511; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhpKl/nn+BHTlTr14XOcXWGwJsMuOmqiPlR2ItDHNmo=;
        b=v0LAYHzPxeze+5xfxU8kRysIxpQUV/V7SHBpHSY3a4GrduWOUT6E8gd06SoAZkIadB
         ra3ag5j4ka7ZJ68AZH34ahy9p9HctIgRoAZ1nmRR9qN+9PyWYeVKkY33WeP3B4zI5tq7
         xo889mHRdlC+FejWLa1gA0cec7GnPW0qe6xoO9H/7OvyoJF5JqBzpMLcbe9YPrBiwVLW
         1xxxkArbT2mC2Ke1c/EJzUm8gh1AceVY9i0f0pQmnG+kuG9nEKYhHvoTd+FuF2U38bvs
         wojtALKjGpbzN9FCnIniNo9GyG2HpiermnujsVvhDs7ZX1s3pvtWNH7L5dR8EFf+SZHQ
         88og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761569711; x=1762174511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GhpKl/nn+BHTlTr14XOcXWGwJsMuOmqiPlR2ItDHNmo=;
        b=gwfqt222WvKVS0o5Sq2LY3XBHuB9GWFL2WiB3v3l2SHF4kSZRDILRmLeTAklmKZ3OC
         GD4JaBbYt7mjrd7a/tN7Uc70iVkdkGZhvunbtOvBw4INOryYb8jx5UJi9K2vYw98PXBe
         AdvJfOfUU27NDLlGHcptVeZcuyKJUSx/Bh8G/u/JFxE7ZKsW4YmeEGebfy55H0bPzq1v
         K8Ry05dg7Eex4CTdPgBGTONC5Ifepil5xv8acMO6F7SlGwX4fwgpqMKOMRXlNj2EeCrO
         7QR3Jre04rR+k5zle3IhEbsnScfj6r1Htlw+w/OAAKDS6Y7pAoDuZ9ktY/wg3AmKJfFM
         /mvg==
X-Forwarded-Encrypted: i=1; AJvYcCW8KICMMlXyDfLaOx6p9VmD3WkQZYF8IlPSYfzoj6vu0GtTjk1Wf2YlOrov9KYUiEIx5+n5zZ4Q9YXEZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKYroePyUvhloqcdM6HZkNSjeF+I2iiN6jJV4+v8A/EtzSsgbC
	zdrdrcejnlzS+C2deoWWO5Nv071GGamfj283ORHAHUPv8dON1mxIq8kp46KLNzx/0VM=
X-Gm-Gg: ASbGnct0YI3uh77OvR5gpTJVWttFVOlqpkkQ9VJEPnoEiSSxi2Ywan4PTpQlYJ/t9l9
	CrigEJZ4tUgNN5fKZbW2AE4wKvDW9vpRYuMUiyRqx12XDVbPoAGIuEtvVdR/QedPdyZw44MWSEl
	HGRkngATLOI9YPQ1w6XM9HNemDuCKEZO6FGBrqMGqL6kQU9LL7X8e4JxwBrCPOd1nBepipUfhKS
	QP0nvdlV+4703kVGzpsnNDcKZ+4eNGsrKGqip2bisFadv1fDrS7K8AmcGNac37bSPGezYg2360I
	WY/6KKmWIW7rAXGp26TPw6WF2poYeYV0pQMHAdBz8QzUGLPKQJD+f65wuBLz6/inwtmZ2nMA4i0
	zmIPdZG1REFGdnu+HFRKdi5691nMEvD1mbV5G+66elJYmBEVSMrprPDnsrEhiMsV8jnQ0mzwWoH
	CNP2LjVvf3wV+8cM6sMMSnxyfgmOtzhQOybpLBjWN2khiAsR7kXria6A==
X-Google-Smtp-Source: AGHT+IEZEkJbHyJsLtQ9RwbUNNRM89do/GpofJnj3gjkHzKLnBs02AOz2LkYBC9YjYewuyvy3xtdnw==
X-Received: by 2002:a05:6602:c85:b0:945:a198:7726 with SMTP id ca18e2360f4ac-945a1988c63mr751875839f.5.1761569710940;
        Mon, 27 Oct 2025 05:55:10 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-94359e742efsm249121639f.7.2025.10.27.05.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 05:55:10 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	dlan@gentoo.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 1/3] dt-bindings: spi: add SpacemiT K1 SPI support
Date: Mon, 27 Oct 2025 07:55:01 -0500
Message-ID: <20251027125504.297033-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251027125504.297033-1-elder@riscstar.com>
References: <20251027125504.297033-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_055512_022454_CEC60B43 
X-CRM114-Status: GOOD (  12.50  )
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

Add support for the SPI controller implemented by the SpacemiT K1 SoC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../bindings/spi/spacemit,k1-spi.yaml         | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml

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
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
