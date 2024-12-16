Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD05E7717F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 08:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UIKYIf6FhxA4muHgh3h12eOuAiClQrTPiUhFwpGrg+o=; b=ON1Q1uSFfeYcR6
	eYIYEuKfZF0/F1ObUAbyQ8/R29Su/uRqMVl0nxd+/4VNtcxCE3zJaN/cwHGHkpNJFCiDst4JvdxzP
	14xIxm4GgW4//z3ljiyNJXsg7MSCwfEgly3bAk3UA9gXESmlwpyOijmtu1h2WqkLbnK99Sfbk11g7
	jNGiTCqaX3XjJJIOjOIzJHS0gtLSNKNPXmr80btHTHPQ/MgIvHVMn7JkdGHqbI2AWgvNykmtR6eXe
	FRXOOQIGyc19WBKVUNO+3vA5TNM9SvmAkENvodF0AVrUuMO7Uh4mnFltRPlEUKtVnO1djkh+tPJdP
	8r+UHUtQVhRQj/5pJXUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6mX-00000009RI8-0Ep8;
	Mon, 16 Dec 2024 08:48:49 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6mU-00000009RGq-1zFd
	for linux-riscv@lists.infradead.org;
	Mon, 16 Dec 2024 08:48:47 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2166022c5caso28702705ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 16 Dec 2024 00:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734338925; x=1734943725; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cMO3jfuL5hmIGaCvebBRAsGTgzlAeW19tcp/lCnmhhM=;
        b=jmsYJxDuDTMqNGpZgvBrO1FNUVR5aHyWIIWrSYS2CdCyPy7OgP4ninnPsHFruAnWOY
         ki4GJ3EuXUv4XnDiJXu4M1P1fke6lfr/XHfBbndNo/Els+Yh9gRehg96hY2K/P9LcH2u
         Y8o+BStD+b4OR3JKwxJ/P+QIIzWv7I17mfK8JtDHdmFfz52aLKBBu0mYIZtDCrEGBGOh
         GeAMjYi9MWB6InXCBRLsximyMV2gVbCrsojI3iVLWsCwQ5imlUJ6lYh9SERdCHjibb9x
         wBGbqiocKNxvMQ3kBSreK1lighgaTJCOrFxWuobI7vMrExXVgGzrBX61tv/34/BQkSCj
         zB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734338925; x=1734943725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cMO3jfuL5hmIGaCvebBRAsGTgzlAeW19tcp/lCnmhhM=;
        b=dQfe3E+qMeSLNo9mA8t44q1KwztGc4jhO0WegbfzY9uN6XxOa/7XkEr0oiJsudIEtR
         rQbQiC3mXfkClGjjiIuCwomCQ/6OuL/heaQWCtWSm1byFWoNK2G/9hKLYYTUoHRpULeQ
         fMIgVVuvchoxn3rW1e3FfaOQhRbiHIBhWlTy2PqWyCXptS6lQWbDfJa1g37rXUcsRs+S
         CfcyiTLRWo08GhY7LKjmSw4koDlUmfaNbLZ37/4tOb+rymfJRqUl7R8zEgnT13SgEBqN
         qofGFdhVlPrr5xrTrz91pAmYdXfiomW3HcE4adgXBlw99pEHOhUaBDUXjCqaXWwRpi5E
         3a4g==
X-Forwarded-Encrypted: i=1; AJvYcCV/z17poxsP2nwPgr48QWnMBoOQsbnZU9GHz+qbuISYraedmoBCrli5r4Tyf3OJjgsY3QSMVSHfKbE8MQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwqHT744c5JkqsoPay/4d3o8MSAMqLhi0naXb9jyDlFwFMKyE8S
	jBipmWGYW4M12MJtpKlm5pXnaHeMRmsHY/sUI8tfJSKTlMUdvj/ee983io5BbuU=
X-Gm-Gg: ASbGncvUk4P6BvyHqgCbilgN9dYQvXLttctjTefScC9d7LAtCKX6XNC/I/MIVk9jpMc
	G/A9yZp6npWVrTTViZt6wuwGRkpDP/1kVuKCmsDEvhjV6Y+U+kpCndvWatrnbmmKHbkkSM/CFYp
	SOC5LMGWD3Wfy2yoD7NQuyq5mS46aluyGDhzQm/ywrCrnCWqFPk/4CC8wnUPt34yGCtlnfU7/GK
	+w/oimT1u8jNgYPCTceOA2iOKOUXn+f/WhoyhWyIx/tBHyewftteCCOO2Y1/LDEmczPVt/puvYc
	0EagkWnX4oQiAuQ=
X-Google-Smtp-Source: AGHT+IFP0telDvRf+8kDLe8zYK7tj9L0Ym2laW4HDpkbeQU6flKJQAmEPGbnSvej/CfGRJih0n5Yog==
X-Received: by 2002:a17:902:d48b:b0:216:60a5:ebfd with SMTP id d9443c01a7336-21892a8483fmr144631265ad.55.1734338925436;
        Mon, 16 Dec 2024 00:48:45 -0800 (PST)
Received: from localhost.localdomain ([223.185.130.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e501d0sm37711495ad.116.2024.12.16.00.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 00:48:44 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>
Subject: [RFC PATCH 2/8] dt-bindings: mailbox: Add bindings for RPMI shared memory transport
Date: Mon, 16 Dec 2024 14:18:11 +0530
Message-ID: <20241216084817.373131-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241216084817.373131-1-apatel@ventanamicro.com>
References: <20241216084817.373131-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_004846_518153_96B0C581 
X-CRM114-Status: GOOD (  15.14  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add device tree bindings for the common RISC-V Platform Management
Interface (RPMI) shared memory transport as a mailbox controller.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../mailbox/riscv,rpmi-shmem-mbox.yaml        | 135 ++++++++++++++++++
 1 file changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml b/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
new file mode 100644
index 000000000000..8d713ba7ffc7
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
@@ -0,0 +1,135 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/riscv,sbi-mpxy-mbox.yaml#
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
+  [1] RISC-V Platform Management Interface (RPMI)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+properties:
+  compatible:
+    const: riscv,rpmi-shmem-mbox
+
+  reg:
+    oneOf:
+      - items:
+        - description: A2P request queue base address
+        - description: P2A acknowledgment queue base address
+        - description: P2A request queue base address
+        - description: A2P acknowledgment queue base address
+        - description: A2P doorbell address
+      - items:
+        - description: A2P request queue base address
+        - description: P2A acknowledgment queue base address
+        - description: A2P doorbell address
+
+  reg-names:
+    oneOf:
+      - items:
+        - const: a2p-req
+        - const: p2a-ack
+        - const: p2a-req
+        - const: a2p-ack
+        - const: db-reg
+      - items:
+        - const: a2p-req
+        - const: p2a-ack
+        - const: db-reg
+
+  interrupts:
+    minItems: 1
+    maxItems: 1
+    description:
+      The RPMI shared memory transport supports wired interrupt specified by
+      this property as the P2A doorbell.
+
+  msi-parent:
+    description:
+      The RPMI shared memory transport supports MSI as P2A doorbell and this
+      property specifies the target MSI controller.
+
+  riscv,slot-size:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 64
+    description:
+      Power-of-2 RPMI slot size of the RPMI shared memory transport.
+
+  riscv,db-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Update only the register bits of doorbell defined by the mask (32 bit).
+      If this property is not present then mask is assumed to be 0xffffffff.
+
+  riscv,db-value:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Value written to the doorbell register bits (32-bit access) specified
+      by the riscv,db-mask property. If this property is not present then
+      value is assumed to be 0x1.
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
+        reg = <0x00 0x10080000 0x00 0x10000>,
+              <0x00 0x10090000 0x00 0x10000>,
+              <0x00 0x100a0000 0x00 0x4>;
+        reg-names = "a2p-req", "p2a-ack", "db-reg";
+        msi-parent = <&imsic_mlevel>;
+        riscv,slot-size = <64>;
+        #mbox-cells = <1>;
+    };
+  - |
+    // Example 2 (RPMI shared memory with only 4 queues):
+    mailbox@10001000 {
+        compatible = "riscv,rpmi-shmem-mbox";
+        reg = <0x00 0x10001000 0x00 0x800>,
+              <0x00 0x10001800 0x00 0x800>,
+              <0x00 0x10002000 0x00 0x800>,
+              <0x00 0x10002800 0x00 0x800>,
+              <0x00 0x10003000 0x00 0x4>;
+        reg-names = "a2p-req", "p2a-ack", "db-reg";
+        msi-parent = <&imsic_mlevel>;
+        riscv,slot-size = <64>;
+        riscv,db-mask = <0x00008000>;
+        riscv,db-value = <0x00008000>;
+        #mbox-cells = <1>;
+    };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
