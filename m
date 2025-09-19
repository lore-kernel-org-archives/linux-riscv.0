Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36962CAC5AA
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 15:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5PYAEknvPtlAy6BZeu5RkCJ1vBQyKtrmteEmpfyC5Qs=; b=FA6Ilscdsbdo22
	Ml2mLpETRVpgwKeJTJLFiZGtqyNLuero3Ir28po7I7Ri3P6qx59Z6rqYp9AKiqx35iS8JZV+wwvqF
	T5TiXZt8KlkDGmUNhs2vpi6FF1QcImpcfFkU8yEd0WN5uB+AmL49TN3ma/WyTOkkmYiVlOyNMu1yg
	4N05nEybMJFUxi8M+rKwX5W/GS5GeRzFx+pORwWyrMVsv4Q60wTWBJQXzg/3SvwoSOJ67WirxA9cs
	fdkSoPmgwmkQbr9CUNcfqujBf6dWxrGIzZ2zwo5EgJJt9NMUxkeJxQjunJsrD/9KGD3Yexg4ekrGq
	+v6hS7InAypm26N9WO1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdW9-00000003RTs-2yYD;
	Fri, 19 Sep 2025 15:59:25 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdW4-00000003RPx-3J0Z
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 15:59:23 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-88428b19ea9so111444839f.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Sep 2025 08:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758297560; x=1758902360; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vWnIy3h9DqFi8hL/FxVYtOO+Zhw2LnLXlA055wp2jTg=;
        b=ZGB46+ZvrbaqQKPuEsEV1rQiQzAJ6irSWT63iHZ3QfC3G7+0tHKuiU3oFolBq7LoVt
         O3OaUkrgwroChTGnDnzTEAyGEBQpcVDQ2Ve54zN5e+UdKwbNRA6ocEMfESbg/F8xOpwV
         z8JUC0wRrUWrf0ImAl/AY8681IzGSarc6MUnbRiZ7lMKYEcXc+MxyGT1mA3IDZnp7puk
         bqUr6bskLrEOwn/E25ep4b6NDdmnXREp6t5P7u7UBT9DKCfeP28WiwSZSI5rHjC5qnTs
         kCYuALG107OtIT5v0a18uibCZ/Kj6Dmahq7XRWRi4coY3yKT6jp6l2wZiUlOV793baAh
         w9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758297560; x=1758902360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vWnIy3h9DqFi8hL/FxVYtOO+Zhw2LnLXlA055wp2jTg=;
        b=az/J6R/Hpf6cZ6WefpYL7+h4LSzM2f6J2Uf4LawOJJknFNhj+bk3FT6YBsaKe86s9w
         beJv/VMWKL1H0XZ8WqvArX8Ih6zMhCC8jhCKqyFdA4uzhpU2BC9yQ3RGSn43NWBq1m73
         waEUJT8PQmTC9nCT+IUBZV/MPMgtKUu93HGje/JFDmhCXUWnW8oX/g6SSNJ3du/46mnh
         V8gXEZb0fN61lMolmzcYXVdTWO+h21xyiw1w8lTXxl1R+VeTycLMHVL9ag2Nv5MLkx50
         Cb5mLrNfk77SA+uO5iA11Ls8MT9dYoky0ZqKbUub6VNDmlM+8aK5o0M225R1bYHt5l95
         V6cA==
X-Forwarded-Encrypted: i=1; AJvYcCWDdMzbu5A7HocsWbqvJ2xrSOXBkRhvi1uAK08K83/X9IGDNd5nlJuIug2fI+AJ9BGtX3VrpjrJNMxPfw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy+xGVrjsfG/i4NbXlhPI/+volrfwJds6n6+/443Xu0X/ewJeI
	MgbKcQ7HLI73T0s0WGT7aLEhKE1VVdQ8nFO2WW9D+ED533avZLoI21miQguF24f+6UE=
X-Gm-Gg: ASbGncufytk/Q8fq9e0J4GbP9IyfocA+spbQQEcIZ0SBLELcuPB/XE+shr2fwn2PGqW
	PMmegEuJ9lL23tGxblEcyJuRdxGGCZP12JqM9+X/6GJG8REjNoMxLB3AkMKMatvO+3ir/NzTEtZ
	HYRzCIeM2V88dT4I4mMiA4QvTi5omYfwDK0AxP8dyeBWuzcII4XebQ/B8R916PvcelZAZbvM+5l
	ylsgabaGkIqzj+g3Nc5IuB53lEEyJE8GJMTleCSva0gALc/9NQMgZGixyAC9XEtuU7I8Qv2A2vm
	VVKvGoKEVvG2OUgPAQy+vSwGymMY0izHI64uLcoGCIqLPhbOggSAaUJohAa2V3Q7LuQaecAj+3A
	mwZ4XzFKES9TVTe/h1BSWddpIP2vCfa1wlPM+bb/tntV4LDlkqzYds6KA+LD7+TmqcLlSXAA4VD
	Tv
X-Google-Smtp-Source: AGHT+IFmv81oG4pNPO8796J1c2ykEr19sbWYjJP5tljzK54z44hQ4+akVUbqKVCyKhhKtpuWSkCbWw==
X-Received: by 2002:a05:6e02:ef4:b0:423:4ff6:aad3 with SMTP id e9e14a558f8ab-424416da9fdmr93720785ab.7.1758297559632;
        Fri, 19 Sep 2025 08:59:19 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d50aa460bsm2250898173.52.2025.09.19.08.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 08:59:19 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	ziyao@disroot.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: spi: add SpacemiT K1 SPI support
Date: Fri, 19 Sep 2025 10:59:11 -0500
Message-ID: <20250919155914.935608-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250919155914.935608-1-elder@riscstar.com>
References: <20250919155914.935608-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_085920_846230_5BC3CA36 
X-CRM114-Status: GOOD (  13.55  )
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

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - Use enum rather than const for the binding compatible string
    - Omit the label and status property in the binding example
    - No more spacemit,k1-ssp-id property
    - Interrupts no longer specified with interrupts-extended

 .../bindings/spi/spacemit,k1-spi.yaml         | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml

diff --git a/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
new file mode 100644
index 0000000000000..a6978212ff570
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
@@ -0,0 +1,87 @@
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
+        clock-names = "core",
+                      "bus";
+        resets = <&syscon_apbc RESET_SSP3>;
+        interrupts = <55>;
+        dmas = <&pdma 20>,
+               <&pdma 19>;
+        dma-names = "rx",
+                    "tx";
+    };
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
