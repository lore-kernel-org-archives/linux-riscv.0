Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799BACAC5B0
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 12:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=03/zY4WInM+d3oP69BcNiCp8KvxdcMTiyPfvsvCNJuI=; b=kX7n304S3S0qxV
	6HDbUx8PrZdXIXp+Gejuzu+xxOwTM/sh4iQG74ONGumV6b81suF/zSIB+Iu4/te8AjeFj7GV486p4
	3X5BpKTUzZarL0HF3VntbjU9fau74ARNCvi7wUlRM3HofLZ7ow3HA4ai0l+xZPEnn6jRz5bdeUv0R
	fz5bt7IENXXQeKyPiehBhBUgXa92xK8XoRmpMV0nlusZ7xQmKAqp8shSKYYJbFI9/ygmgn4vO2tcD
	9Nm7XLlwrEhAYZLlmJfYhYmFjwxx70/jVNLQW37DpKDKX6vQ/4Dn6JY0mRSFVd7gv7HfRrx7YFM0h
	Q0iUQeUnjMFzveCHkC/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1kmm-00000008oeV-10Uv;
	Thu, 25 Sep 2025 12:09:20 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1kmi-00000008obt-3iAy
	for linux-riscv@lists.infradead.org;
	Thu, 25 Sep 2025 12:09:18 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-426813b9712so1964165ab.2
        for <linux-riscv@lists.infradead.org>; Thu, 25 Sep 2025 05:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758802156; x=1759406956; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lR2b9ECnFflIMj/TuPVkfctyOHxTY8RYfTiR0F4tDBs=;
        b=kXV51CMQ+DIqA6y44wjVhdmPJkQ70/YC9823NI1Z8L1UGxgqhNmjp760+UkmShu1ht
         ioFDhgVUxaLqS6dfyIOOf1UkWesw1mjN5B43KHnjl5UDW7ksDLGWNZSiWzpP4F7adVVx
         x91S3O2iyMB7XMssT0nnsU/gDg2RRtbSDlvAxEp01bZqnrnW0IC1XzEN/VISrD0qhnM/
         eodw9q2x27vzft+85BRTAWP0mXeDg5eniuDnmiqyaq5kIkjgvpnwZyCKgsaJGHKaUc0K
         CeZ0XVguYZOlMaW0Prjc9elDZ+W2Z5JyZW3kn4C9DDfQSUqKEKzn1egsBTrB9JIR6lAp
         bk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758802156; x=1759406956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lR2b9ECnFflIMj/TuPVkfctyOHxTY8RYfTiR0F4tDBs=;
        b=WnbtflDibDqZabqsx6LoJu3leGeLlbSVibXPQ1KYe0x1CpB/5kTc/L5RtE5ZruwsaR
         24DK1y87CyjbBBtrf5E6CKI4CAVgPPQeCBskTtRE3KYpi07N4DP+q0X19BAIUu9rPUJ/
         4WiZtR3Bd4+q0IrvBnFzcztiJTKioWQjG4ZTby8Rsstmv68OS6X6e9sAEOExbx+2NTs+
         Knxh5MEw4y40lhQIFEEVBssYEKSb2drXAs0EnXHSTf0Zy1xY9wALiF7KL88u2PJk6v0j
         ngU4bO+kywTLgLj3XgjTglsoTQJMxwIw0GrH22mGu20hFh09d5I8tu+wj+T0krnukt+d
         JinQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjRRk4hbJyFE9bPwMNoAQlGXQY3Au1IPPLbXdqrQiK6mve9mU6cdcDJVmN/4TaSZB6HVPFrr3qWOhaJg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzSDAopYxqqF5RlEnFOR5kVv00x/UAlD3Quvi3dvukrEa+kTpWq
	LjbgZV3ZfUJdmWp5APNzazDHqXFKtn08To5x2BrYoNTYGoHCEMFMj25dAHPjrVBl0jY=
X-Gm-Gg: ASbGncuYufQ3yoqIMDLfZrY4etanjjZ3ogKkKhVOk8ZKWouh7pHz9+NG4DWis22Ogkh
	zxxN6E7VLJNELvgM4zllss3d7mRlHcJRJtezEE+nt3nWNkjLgmShUFVm/e3ReiQzwtAbp8nCN0q
	+vBgzuf05z51BVTJsIfZE+XcLTlHlRSpu4/StgjNf0E3aIKHb3W4f3RtAsFm8z3T66eS1xPc3Wz
	15y8Bwy39gBKW86a3voSlCazU+L0cVqfz0TuvLJJ0EPR7Q8akPMszgqK0y4RuPbzfJZCX66ytKk
	enVOwjna7gaBo0TSIUULzwM74sjg6+P5RkigQXMIKj0s6DolXUwsgOG4V/5OhqIEVkG2oL3fWsq
	AKFj3jKrO8zIHoN9KzD91laA4uWLXM3xQiFFl6pS9qjrqIZh07d7pMj+6HWxGUWfr2w==
X-Google-Smtp-Source: AGHT+IGXougzNJET46cVI7dYg1MBBmNvBI2khpSbf9kpI6chuugK0VkxyAwHIuwro6Yl7j98iqwVzQ==
X-Received: by 2002:a05:6e02:378b:b0:424:7d95:b90b with SMTP id e9e14a558f8ab-425955eea63mr47747165ab.14.1758802155603;
        Thu, 25 Sep 2025 05:09:15 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-56a6a5b29c1sm742821173.62.2025.09.25.05.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 05:09:15 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	ziyao@disroot.org,
	junhui.liu@pigmoral.tech,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/3] dt-bindings: spi: add SpacemiT K1 SPI support
Date: Thu, 25 Sep 2025 07:09:06 -0500
Message-ID: <20250925120909.2514847-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925120909.2514847-1-elder@riscstar.com>
References: <20250925120909.2514847-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_050916_927778_7DF5E949 
X-CRM114-Status: GOOD (  13.18  )
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
v4: - Formatted dmas and dma-names properties on one line in example

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
