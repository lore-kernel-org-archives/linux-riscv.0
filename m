Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F7CC87FCE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 09:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=12aNELk5r5hWJ9lbbJhMRpFiw02sDxrlhaF8sTnyXrY=; b=Fl5Eqc9yUq3oPm
	X/1pIulYYYnM0nr2SN+DKqfLceIVsUJfSt1HB/XZI6kjm0WxnaY0Wq34pKtOiqb3yidCrjE+B7H7b
	gyABnsl7am0wUNFHt5y3GO6q5uhy9ZuY1dqnAZeM5YmN8l4MaNyzL0CwW8PqJPtAChS3MDcsMLqqz
	gcwA82CSA3bXxgzKJ+a4vmxQisKqD71p2GPJpLjZPgtoq5LKblREzUXYnsjHc+gFOJdh0XZsT4ZeM
	nhEOr3Rqejn32ZDfyZK3y2kjvImdiJPpGFPvXgPOoysLuwuSyaf1JZ5wnCZeMmswacBH5j9dX3CY7
	QPKH5+ShAIWHuAU8kDpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKM3-0000000E7d1-2w8q;
	Mon, 28 Jul 2025 09:41:11 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKM1-0000000E7bp-0DTM
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 09:41:10 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-31ef50d8d57so474389a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 02:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753695668; x=1754300468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ziNNelNAtU8Lu0O2/2Qc6bW/trdK9/SPi3ZGrwyyiyE=;
        b=FuHjgCQzUfKMriWiI4e65RVTKH+8zJ5kFqhUErPbqW53KlDPIr1Y0CC+z4ZqT3gR4Z
         j9xLdG+g9Bqh+OeplfvlYqnLTtGVEd6mJlHvfqoEF2JbBBmE24uPDjcN9QBOcFukEHh+
         02BRs8dc0exfhennSczIa5hCdXp8ECC4jiok75XIPCahUgOIu023wRap46Cc3FKWFbCR
         HgJMLOwMIqL+TjW8zP4VF8Ben2NtqKbscBjeWpsZdcPfe4jCKTAzbQ+g5e84tr8iezQl
         6yBSCSIKqst7An7Z48RAAhMlGmCGIgNeSlISq3IGWY0z/4CVGqbPmf3HhJFemzUhwfff
         5ohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695668; x=1754300468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ziNNelNAtU8Lu0O2/2Qc6bW/trdK9/SPi3ZGrwyyiyE=;
        b=h36luWvT+/eBN+ch/UAo9upoVcqoQRp381KbGLZF6Z6j/K7bZ504vzcvSqc8QWPZp5
         Kodsmb9rzecFWtRqGZKZ4fM6syVbaoXAAQTY/RIl2Bg0OgKf7QQm6PJ1WKj+lSeuBoQA
         q02Q9wjh9ctrxc/gx6Gj2yHRMOXluDoWhX6cgYx7MisUFP5BXS9goUz1CmSGTeazPReo
         zmywGO/ViCUspfRuykSCx+1IrY6wLExe/YPV2sy/JYVpUMyirZWPBvhed/aeRIslbQkx
         lMJ2GYQohdCK4w31TvcIxjIQI3f70gkNYNtYHPaRZI/g1LsrANcqGgUGYAcrHvGGa9hk
         NZOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtEYbvzFKBvGuewTixuZpttLCwLwmJ1wb5ZIUqc3gsU+TYQVjNGUeHzWqDP7DaN/MKiCRlCeS6gG170A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzOlYfGburp8Tm7sJqQlUEyDfpSXjVyARnVyXn4bH3bt14pymo0
	PNz56qNWmU09VanZSBLjaYpoaChnjjNBQcDpoS9vMJ+cQVtFHDJeOAfQr/YQAsG9fZM=
X-Gm-Gg: ASbGncsIIJf9C4bb/6voCkjw0Jh1pCVpJhOCEcYbNxeNmpIhoXf5Ea0PZ4m2wggZGp6
	iTSZPQG1ZICmlqq+m7u8qkUATCZCkbZDgoiWxF3W5FB5PMEJfAOMLIUtda92wDhUgXhsbylXv/I
	tYkS36eHOvuk2tGopGE5tzuOVThvW5FTeCkORKeHZHO07HNkjfzbnk8vhE8LG98Lj95s1yeRsu3
	9g2EBgb+U1VTYvsYsKzjByVjxzLjZ3ocPo4rmQvFZT7O3fo3Bkhro5e8DWG8RqyBwWjvY4kTxcU
	WmI8ZtXAUTwrsXxqZ+akJB417Aq1S18w/e2H4NR2pM0SYw7X4Ku+Ft+Merm4ZhSOtmSGox6DzOt
	O4bQdvy0//cRKOR/Lc+tlF5RQ3qDCtnEzV0Hpn9nCY88YiNEB53ZqoMHWBLrnnmSY5JKNgkM=
X-Google-Smtp-Source: AGHT+IHEr8CG7nl3bZOzKIacTPyWTw/OgW8BgxiKylSqn49CvgsxlgWeDnJe16LwuelGnGiskjDCEg==
X-Received: by 2002:a17:90b:4e84:b0:31f:1715:a6e2 with SMTP id 98e67ed59e1d1-31f1715ae77mr387658a91.21.1753695667978;
        Mon, 28 Jul 2025 02:41:07 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.19.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm5396230a91.1.2025.07.28.02.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:41:07 -0700 (PDT)
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
Subject: [PATCH v9 01/24] dt-bindings: mailbox: Add bindings for RPMI shared memory transport
Date: Mon, 28 Jul 2025 15:10:09 +0530
Message-ID: <20250728094032.63545-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250728094032.63545-1-apatel@ventanamicro.com>
References: <20250728094032.63545-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_024109_091085_67A21255 
X-CRM114-Status: GOOD (  14.28  )
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
