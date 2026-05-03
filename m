Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F13ACD13DA
	for <linux-riscv@archiver.kernel.org>; Sat,  2 May 2026 13:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TD0zirtUbgzArxTOYYo6G5DshB/FOqpDGmwRS8Z+4+g=; b=2s652IE6l6embG
	ELDkG/a+2zv5QMzi9A6Xbl1gvK3imMgJY6HtF15e+ekb7q2J8Sn9xCUBFK8gVK0GB1DRVn18dYWIu
	vzRV6RQ7m/36iqhzJS1Xh9OVJ1Mh2XtYILM60FsBAYMXBJajLMjPX/gjrUq4HSDRK7iYGnOLJ8ReK
	SCJigkmfxsv2xMl9PxDXU/bKmtLBvodBqYqoQqYuicqj/s4kaFMnT6M9wc+F/XoWxzqn2O7+e8lM0
	DkJdyVfFQJmTlpd4eYaBGFUdeovUJdqLkH8FhrRlVeJZcM1iqYWjWMducxHAtmsUEJ1ggHcvBZHcl
	LcrMjkvbb5PqbUypfokA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJARe-000000094tR-0VP2;
	Sat, 02 May 2026 13:31:46 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJARb-000000094sF-2Hg4
	for linux-riscv@lists.infradead.org;
	Sat, 02 May 2026 13:31:44 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-35fb16e56efso1830911a91.2
        for <linux-riscv@lists.infradead.org>; Sat, 02 May 2026 06:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777728703; x=1778333503; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nc44VxR2FzsNOtDOyeTwEzMXfi//+xA2TCBmgHk8I1I=;
        b=YKZ4STkT5xtuoXRefvGorE/j6VOEJyc21ANiMqEZ+gkjCM4azFj83ghFdscc2ECL2n
         OGnXsSTmAmyTx5NVUBipTYMJZBK2sKngnixpMYQ4YtlyfHLP8zQCu5WIJcSfixRDtN9G
         40+7OXR/OsjEk3sWjZtIDxoX6+fX3NZACFZQJfzYhSYRuPDE2cWFb9ly1aUgkg+hJYTt
         aSOcKs5PMicqFGBKN1u5QhPOIPHgAPzKgB9FOKcmG9huzcAvylBBreXZBjTjiyyuYLYr
         1LTsWNBHv/FrLx+MqH73ksDU6uX97LDYguePrKlVhIxmmumjj2bdWpXGUv4UzM0BjQYR
         GkOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777728703; x=1778333503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nc44VxR2FzsNOtDOyeTwEzMXfi//+xA2TCBmgHk8I1I=;
        b=Xv0o5ZgyK5qZOIe4AyinvfAR2ydsTebT1CUK7VksFp6APkS/iIbzWPojHOgdwW/fKs
         qOTd0KZ2P85uuwpMZr/UShPzgrxsfRXDkVJO+7HKWSBI0YfzmoOtPeuDza8M/gf+kqXi
         PB6AJDxJjkX15Y+E4UL4gasFDBZAedFa9ZLVkseBw1trZayQ0unJjkQasWTiepZGkaO5
         cTaL2JpEbAEazOauRZ8+A1dDjPes4U0vuy48iWbK77MmGudM2/943jGKRqDatPRcSVW1
         ccB+djXwH/o0Zwugb2i6h8RRy3qbBwDRAOR8R/vSX0OWANFCJa4+7/nUfB2EGU1fVgRL
         cH/Q==
X-Forwarded-Encrypted: i=1; AFNElJ8gbK7rKq3Z2LDLV8RddqdMOEUflBUAswag1juEZAncsMQDyMJFFXVjPXpkgf/Td4DpjCU7fhfOpV0vaA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+9yhuCjj4PyavC5iSZaq1DqVGDu4acvsRsbqNshfeLRB5epDm
	OJYrdhJUa7fJBENiWPmocHOa6M8JifGn8GoEVFUWVc0GIBcoJPdyPo0pqT2YPjxPx40=
X-Gm-Gg: AeBDietWIIEo3UFuv7RnsHjH2KN7scwFhWjhu19VCWQG10TNBRIQJk3oHb+fxfyMLUs
	0puJegegYtG3ntoVvrC1eVMnFn7tki4x0lsLLoDpnL+zJbje3NgzD1dFgKMtJR2RmT1rSRdTB3T
	pKezEhuhKG0I++Q79J2a67xMvzuMnpuDZdbearilD5YykwIfuk9Za5gd8QxfAAlZePGXkYoCtpO
	SaQACEYWtlVSnliQATIUhRT4A0QZghm9YGXBdFKa1LmIVq+yJRIIlLONfFGt6u9wd76zYsHlSDE
	xnzray+CToNKadoT5qAAjcdb1TSnJdzMoAt0Dohlg3/6Af6+mji3gctq7tbqycanvak3dBSQjFf
	5zrvyl2XzQtIohJzZOn25V8d1fBv/mqz6jWJQNKbNjOhkZ6O/d40UsGxsQq2+kpqP0ShBnhk0O7
	GQZiZQbmEAccbUI1iqmVjDRSd9nL+tdZXxg2Sj1xJNz9YuEvo1s0tKJw==
X-Received: by 2002:a17:90b:530b:b0:35d:a3b4:2f00 with SMTP id 98e67ed59e1d1-3650cdd0ab3mr3593006a91.8.1777728702492;
        Sat, 02 May 2026 06:31:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::3016])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ec02ab2fsm5647937a91.14.2026.05.02.06.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 06:31:42 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 02 May 2026 21:30:51 -0400
Subject: [PATCH v10 1/3] spi: dt-bindings: add SpacemiT K1 SPI support
MIME-Version: 1.0
Message-Id: <20260502-spi-spacemit-k1-v10-1-f412e1ae8a34@riscstar.com>
References: <20260502-spi-spacemit-k1-v10-0-f412e1ae8a34@riscstar.com>
In-Reply-To: <20260502-spi-spacemit-k1-v10-0-f412e1ae8a34@riscstar.com>
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
X-CRM114-CacheID: sfid-20260502_063143_591752_F0F2B79B 
X-CRM114-Status: GOOD (  11.57  )
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
v10: No change
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
