Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E274C8303C
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 05:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=12aNELk5r5hWJ9lbbJhMRpFiw02sDxrlhaF8sTnyXrY=; b=dUMUV3n/motqzS
	p+xMJFSK899BLrifN4OpfdOr+KxScC62W5HkvWFfnph3GIUo5hz0SzCBXkZLReEb5srSZQal6F3GX
	26sMK/3cHs+vckxFpsYh16vpiD89im5vRU8mIfVx+Xo9pDGLjoacow75xK7QmLtJG0oI+qaca7Hxd
	oItKFyfwCbdqnKXb+H5AMenlQi2uL9vC19XyE5vJbIhJQT3k2r9UoErDLDjmm8mJVXgld00FcXxUv
	GUfWxVt5dDZasGd0NFQc9h+TGnIR8Yu3Pj8avrOLI7Ic9IA4QvaB5xLBf2yA4AilxwkoI+mL1GtwH
	ZYAU1qeT6eGUkXCmiVQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWpuA-00000007HM3-2QUX;
	Wed, 02 Jul 2025 05:21:10 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWpnT-00000007FiA-0lnc
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 05:14:16 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-23636167afeso38211425ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 01 Jul 2025 22:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433254; x=1752038054; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ziNNelNAtU8Lu0O2/2Qc6bW/trdK9/SPi3ZGrwyyiyE=;
        b=MVCqD8ARFlBKQQChpcJSzTcQQc+wXdDsneb5XkGsMjIO+yAHD+TltvcPJy1F6LtCZh
         W060wwlZqpKgs6frIm3Gqh7JXtfFQMMdidBoemFAzi9+MyLCa240NP6p/wEZAPQHBotr
         W9NHwfk9M2ACEMYyNE00W76vbxI7IWETanGxCiUejzxBmC8G627i7/yxwv+OwNrC9LyP
         XHQNWMQqren2mBgyBpmvGC7PHtUDCWtU5q3AT3Myn1F5Ax6kyeCkpMfGEIqNV5x12EUL
         68bu7m9H1Xy2k8rKC3X02GzdHrXC4EqXGK7tDKtJBzdkLs5m3QJRMtPmec/sFwQcPQWd
         iiag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433254; x=1752038054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ziNNelNAtU8Lu0O2/2Qc6bW/trdK9/SPi3ZGrwyyiyE=;
        b=o8eQ12DwLqZEjoa3hgNq3tI2U/vxOIjg2QE9JdJPL02tPvkoMmanLxmE4EfdQ8bOEG
         qxUF9dgInAy0KQbILZXoCkj2fSPuNQ6pUOpfuu02eDNJQHWA3cMVSFOaMcykEwGXjbCy
         vVB3FFo7ehukadgUWZSTuGBKYPM1IPBLdiJBaYvBxTY163mSHPcskgPUoBGV/AtG8B3F
         cz4+NcV7MIFMEJJSBoPcDbpKpGsiCExk+r7ULVUtmkG/9wNdwFVcmKu+jEfvPd9XUJhW
         kDBW1WbNDM+RgfC/9vQrXUvfboCKnRESU+ytLN7ezYWIhfIWqev6VTWvDQ0QrWxE423F
         a7fg==
X-Forwarded-Encrypted: i=1; AJvYcCVYxkpZz2HKWdF5CgJ7SVcFx7loDHLmPEVTSirPuHxIcSbYaf0GYGC40OmRMyhzlSI+y//KfLJxn2VFVg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNF93ce6KW9lmpCU8/tzSNKGCdXSnntk3O8wZ9C+u4U6OgzLsr
	rxc4pA0D8GvEU0ga8/garNAMTRrjR60KelLpQmjZvDL3SAH58p6GkREnHeEOnG/nAII=
X-Gm-Gg: ASbGncvx0x+FwjW8uPrfK0oviH0xbw97TjYPGJDsSf53Irxbp0MxvopMiAScmnL2xtq
	6/9Abxdy4FasugS1aawCAhd+HJSFyjVNHPlm/uXQ2L+2NkArRm6Dedqi+FzHOecRJxrWqA7Pumf
	pg5+RqYwfnUL6qN5iQobZr7EcI2BcMUDOqQNoiVMpx+Df4/uE7CIxsAftCPB0yeDr+KgeUB/eZf
	DhaRBivLdE/wTREt5J6UcKjbVRRacWPkqJ66nsAMaalnwNbttO967DqVpZquHVpwp8dnsAk5APB
	k2JAbQ5/OGXHvBD0PKLO0FcDNvsNBnwKkt87VLRD+OLUGETtJGnBS+KKIomQs+BqqCCBbAzbawK
	P9mF4/7Cj52p5IsFm
X-Google-Smtp-Source: AGHT+IH1zQLMeLZCjz953CYwcFQdb4n2Jpuxqc1/A4tWexX1v4V8AZfDafl9hgJbDhtKkT2fEqefSw==
X-Received: by 2002:a17:903:1aee:b0:21f:4649:fd49 with SMTP id d9443c01a7336-23c6e5e0440mr23121485ad.49.1751433254208;
        Tue, 01 Jul 2025 22:14:14 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:14:13 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: [PATCH v7 01/24] dt-bindings: mailbox: Add bindings for RPMI shared memory transport
Date: Wed,  2 Jul 2025 10:43:22 +0530
Message-ID: <20250702051345.1460497-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702051345.1460497-1-apatel@ventanamicro.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_221415_221558_3731215C 
X-CRM114-Status: GOOD (  15.34  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-acpi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add device tree bindings for the common RISC-V Platform Management
Interface (RPMI) shared memory transport as a mailbox controller.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../mailbox/riscv,rpmi-shmem-mbox.yaml        | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml b/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
new file mode 100644
index 000000000000..3aabc52a0c03
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/riscv,rpmi-shmem-mbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V Platform Management Interface (RPMI) shared memory mailbox
+
+maintainers:
+  - Anup Patel <anup@brainfault.org>
+
+description: |
+  The RISC-V Platform Management Interface (RPMI) [1] defines a common shared
+  memory based RPMI transport. This RPMI shared memory transport integrates as
+  mailbox controller in the SBI implementation or supervisor software whereas
+  each RPMI service group is mailbox client in the SBI implementation and
+  supervisor software.
+
+  ===========================================
+  References
+  ===========================================
+
+  [1] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+properties:
+  compatible:
+    const: riscv,rpmi-shmem-mbox
+
+  reg:
+    minItems: 2
+    items:
+      - description: A2P request queue base address
+      - description: P2A acknowledgment queue base address
+      - description: P2A request queue base address
+      - description: A2P acknowledgment queue base address
+      - description: A2P doorbell address
+
+  reg-names:
+    minItems: 2
+    items:
+      - const: a2p-req
+      - const: p2a-ack
+      - enum: [ p2a-req, a2p-doorbell ]
+      - const: a2p-ack
+      - const: a2p-doorbell
+
+  interrupts:
+    maxItems: 1
+    description:
+      The RPMI shared memory transport supports P2A doorbell as a wired
+      interrupt and this property specifies the interrupt source.
+
+  msi-parent:
+    description:
+      The RPMI shared memory transport supports P2A doorbell as a system MSI
+      and this property specifies the target MSI controller.
+
+  riscv,slot-size:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 64
+    description:
+      Power-of-2 RPMI slot size of the RPMI shared memory transport.
+
+  riscv,a2p-doorbell-value:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0x1
+    description:
+      Value written to the 32-bit A2P doorbell register.
+
+  riscv,p2a-doorbell-sysmsi-index:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The RPMI shared memory transport supports P2A doorbell as a system MSI
+      and this property specifies system MSI index to be used for configuring
+      the P2A doorbell MSI.
+
+  "#mbox-cells":
+    const: 1
+    description:
+      The first cell specifies RPMI service group ID.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - riscv,slot-size
+  - "#mbox-cells"
+
+anyOf:
+  - required:
+      - interrupts
+  - required:
+      - msi-parent
+
+additionalProperties: false
+
+examples:
+  - |
+    // Example 1 (RPMI shared memory with only 2 queues):
+    mailbox@10080000 {
+        compatible = "riscv,rpmi-shmem-mbox";
+        reg = <0x10080000 0x10000>,
+              <0x10090000 0x10000>;
+        reg-names = "a2p-req", "p2a-ack";
+        msi-parent = <&imsic_mlevel>;
+        riscv,slot-size = <64>;
+        #mbox-cells = <1>;
+    };
+  - |
+    // Example 2 (RPMI shared memory with only 4 queues):
+    mailbox@10001000 {
+        compatible = "riscv,rpmi-shmem-mbox";
+        reg = <0x10001000 0x800>,
+              <0x10001800 0x800>,
+              <0x10002000 0x800>,
+              <0x10002800 0x800>,
+              <0x10003000 0x4>;
+        reg-names = "a2p-req", "p2a-ack", "p2a-req", "a2p-ack", "a2p-doorbell";
+        msi-parent = <&imsic_mlevel>;
+        riscv,slot-size = <64>;
+        riscv,a2p-doorbell-value = <0x00008000>;
+        #mbox-cells = <1>;
+    };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
