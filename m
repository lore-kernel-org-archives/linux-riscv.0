Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE0BC7115D
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 13:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=12aNELk5r5hWJ9lbbJhMRpFiw02sDxrlhaF8sTnyXrY=; b=zpecAXaory44E5
	AlL4aQIqtd1Sk8EYJ6AUx8j1pauVhq9m7Phx7o1T6DwmrxkPFShufvUXF39lGZzqW3lW9E63v8Lc7
	9kPjlqb0+RSTilzl8Y79hJSN0lZb+1waiih2bI9bkPLrH6y/vrOYv1elN9EdWfgIJ8KDynLFVzHFq
	y9Dkw3nTMP3FgMckDBjpzDVpbpp9PPB7TcYMqxrpE+P4roWS5YYzskF1XDv5L0scKoq84UgMZxmCk
	iX+XpDyzyDOLY/QrcyUh8bdVTUy7Nfbhaok9nhk6Z2CuiJORGVLhFr/8R/ePXCKDXiZCcKCqpxMfw
	ncQtN4b95z2deS3oqVPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsoJ-0000000AHYL-1VTR;
	Wed, 18 Jun 2025 13:26:39 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrgP-0000000A5Hx-0HF8
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 12:14:26 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b2fca9dc5f8so5004969a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 05:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750248864; x=1750853664; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ziNNelNAtU8Lu0O2/2Qc6bW/trdK9/SPi3ZGrwyyiyE=;
        b=MtJYaX5S9nE1/bsxrmiOOAqbLisasfb4fnxFXGEdcYt0vCEPwnv2WrGrOF0QjS/S83
         ulHKq0jFXUO1eLCMKhPLJDR/na/56vmLGjfiV6xvLh8zYW6s3qU1otyke3/FGQI43PFL
         8sBG3QvUmGv3c71irvWf1lCNjcp/x4LLqaFiequp6yr8Kneu+7sfiM/kuzPcVOkDIbEv
         F5bgujzceM3VAQpHyBhVT6+eC2SdD+PL6Drpnvq6JweJTiRoonx1k/8kOfg/DNrSlhd8
         By6by8pbz+vapTRuPS9ksPUKh82P1lekFku/85GzYc5u8RdK82h4HhMByGwWHOqiiY4j
         9/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248864; x=1750853664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ziNNelNAtU8Lu0O2/2Qc6bW/trdK9/SPi3ZGrwyyiyE=;
        b=GVcNUBA1yuo0psKdHJvEKa5BnMGDFhT8m3D7+X+802tb1Ppv7U4PEeAK0OnF//7WSM
         YfvkDtSM/ZXbgOCz+Z6ASTQt22nmuVDi5S3MYULmB9jt/Gl+8p5cAJNGwe8bEd0CGi7i
         kkkdrmfkQ0eYCuQShQxpIae4AHE9++nIAHhsHhZ0MOA9D3Q4W/AKK5Bc29TG+7D4AZIT
         JtTpIAV5JfUUEWdh0iTa5FT+qNhlqNf9VERJDukO7uDxHwKBA3r0ZIHvKWyYqR+xIVUk
         QhQhE8RW8JLQbG9cKdWzE9Ydi156QkTaJMayhwn+hvMz2uiFPEM2/sKuy7tZ+rwmQYmx
         YJQA==
X-Forwarded-Encrypted: i=1; AJvYcCXc0rOa2Z14+pVxhUZ9GyKgAqOHqygaL/5fALHaDCJVdG1g/RK8KTGrOPbk+E//u77cH2EY1Sm4/MjvFg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6JNuSwBOnRY5FHeL81lNji5TvhQ2OWKZ/CZ01PliVHutDpQj8
	YnlwUVVCSI6u3SgNKsiCcgNNjU1xwpe290mIjMzNhI6JcqWK9mG+Nl6W/v0nWNT0ahQ=
X-Gm-Gg: ASbGncuBmmRMfei8VpXyC6wnDHmNtrqJiELn1bWZ9NmA5amq4hsI9LDFnpjLo8yE3PL
	94ynh+7xxyM+Qs5ZIaVPJpj5CwTWEO0HVCeDXNil0SHF71Go0UGpHSxaKTPnRW7/jN6+u7cSbKr
	aOv7tmhxtx11QtCd5vbmyxj6SRTOnMYXu6O2DBPOUozUKKZxs7kGAoCDNnU28zAT9BR2hIPy6AL
	tgSm4DMAAvNdQf/YyXeutFZviD2Pbvi7yp0rfb3bHEoNSS4up1ySf+PYDVHQFgK1UjkuuQ1MQWw
	ekL0dQ4Wlg74T8yvuhhu0NmY+Nhc4ll2N0KqiZRjrtjGSE3IRgm0fqBpH5SeLHrRunJPhfhBykR
	3sL9n6NjfuTIxKoRgQQ==
X-Google-Smtp-Source: AGHT+IGXJCt45JA8Kk+8fi1w9C8bhM0wZ3jUDLtHZkAxqg9JTLBDj52rpbXs5JE5zyvxDRUbYLbnRw==
X-Received: by 2002:a05:6a21:6012:b0:203:becd:f9ce with SMTP id adf61e73a8af0-21fbd668ecbmr26172423637.39.1750248864090;
        Wed, 18 Jun 2025 05:14:24 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:14:23 -0700 (PDT)
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
Subject: [PATCH v6 01/23] dt-bindings: mailbox: Add bindings for RPMI shared memory transport
Date: Wed, 18 Jun 2025 17:43:36 +0530
Message-ID: <20250618121358.503781-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618121358.503781-1-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_051425_106699_975A8538 
X-CRM114-Status: GOOD (  14.47  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
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
