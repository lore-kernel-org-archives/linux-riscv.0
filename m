Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334A8C02193
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 08:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yw0vaBOZfP0/YwTQVsGyJTlKti21CsVnjApQg9fn/ew=; b=pwrR6rnt8+0LND
	092Vd0ixEm75okoN9jnDCf48dyF9I6pF9EuyQxWSTAXTOPb01y8XtLkBJdID7d8uCshpGDe8HWiVp
	SOYdGnw8ENw2knDPjZjfNXtnVago/xAiVYkvWykYB8Q1OlHqCBtTAxxkKDTD3kd0IpWP9u5kpMtc0
	098OHgs9AdEVvGMzS/CT9o1htjRxLtGdGEpEBNB1sHJ/tn6UWSbXW2OE/jPUBEZc3MzKvWQryZTcu
	7ofd8EYNrZEIjE5NoYLPGfYNtUInJMNMgQ3Iape2RGPUNSEF7x0LTkT8nUjPeaWNVZyBCXDTGTBg2
	iDc3LzYtjOpsv2j9h3bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tes9R-0000000Etl8-3hRn;
	Mon, 03 Feb 2025 08:49:53 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tes9P-0000000Etk9-1WSV
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 08:49:52 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-467a17055e6so50448431cf.3
        for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2025 00:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738572590; x=1739177390; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uIptlls0lSoEbPx5zusAvJxAewxDBRI9b9ePSXx/HLg=;
        b=UAh5sLC+MowD1H8QyhemBefxYn6f+OnvbpnVpaB/x2I6C5PZbdxqAz5Lj0SpQB08Td
         +SynC8/lKBOaAz+PGrT9kAbf/DiGaqn0AFNZxRZLkUkeyEQt1CFe+S0WL5QcbXht+mie
         jmGuaHsYvJNmJh+9B/Ye1/IMp50epHc8TJlflKYZHoy9C/4hvpDHTzOqpJ1tEGhlvKA/
         +BB5sA3ah+ZXHXqX2UoLCESWyp98VV/Z03JK+FAxmIu6qTc1Miqind4rLvRCRsn/Z91y
         au/6krm2BEk2cSQH66RiKN+gdEji+dvUjDeNQMiCo4syFHmhpdZ1/8cceriJQ7f9Gm7J
         NF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738572590; x=1739177390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uIptlls0lSoEbPx5zusAvJxAewxDBRI9b9ePSXx/HLg=;
        b=xMY74BrNkzSlXFv5Sx7oKWih2SOSW21M3ySaBEbgTfQ850VDaiM6eE1sL0MqOGfdOz
         EFxNGhOSqLl71fVNbbTGdYohV8aBbnHKIurESxZwWCjZAG+3qOoP97BUgpRKznt/tZK8
         9tYoziE7MmE20HFyZYiQtZTi9tjs9vrY3LwQRpMHMg8LCQ86WUMy6J46qSZAxBhYHgsZ
         MPPjU029SFKapVnMx07hXHw1FXff5zs28Bf2PQ5St4bNTcKCygpaZmzdjZuLGE4ge+rZ
         KCmP+t6Qtx7BMQCJH80XgFvmuBQKnBif+mYjEIKjbt5jrbawI/EplFrtGuXPgxSDKZz4
         LJgw==
X-Forwarded-Encrypted: i=1; AJvYcCUhRhVhggKkw9H+HlXYHIldOGovDw65WpFzOkX6mb0yP8BQU5zAVc2gAKoSxTqE9MRF5WfMeBgLpkIz/A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yygl/L2bJ0r4LxJ+1B8AK+qvd8RBrjuLLXoSUEFXZhAJ+RTF4Rx
	x5eXkB0f5murxYdsepxoNUcOQu246RxB9LsbAdKVvXkHogtD/cDrZ3e0KwnTCKg=
X-Gm-Gg: ASbGnctzeYdSBNkF8p3tB8gaKqp7LMpFK5rfvlOe8v7Vtr26hX3lk1GKLZfnPj6TBDo
	oB9vkeKNVaW94v22sv1eEYJfPnFkMEFGtqBX5f88UCWBSR3M+ZPUsIROPcwQ7tMu4mFuKGOTi6t
	I+xTh6q0Rn/McSOMsVJNXaHBAx1t4WMBaDGmbIIkVYdB6qgL8YuZGkt1X4rnfNTm3d54SFHUC3f
	NMlswpVgg5TEFpEq3At6Y+uhviQrounFap3k20sBHB9BqD1lShJJPoN4REfoAnKKrSfLJRvWVq3
	Yd4ZHCP6cNbChgmoJ4yB8gR98P7+3yR/fSdCgKlv0DFNo4N5zzRF2sM=
X-Google-Smtp-Source: AGHT+IFHHlk6yRWs1ijlylKke56DmU0/tkygTt4Q+373jN4c1Xddg6tNHv+laUzh55eYL8Gx++jhPQ==
X-Received: by 2002:a05:622a:258f:b0:46e:23ad:a120 with SMTP id d75a77b69052e-46fd0b89329mr324786311cf.35.1738572590072;
        Mon, 03 Feb 2025 00:49:50 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e3089sm47657911cf.46.2025.02.03.00.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 00:49:48 -0800 (PST)
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
Subject: [RFC PATCH v2 02/17] dt-bindings: mailbox: Add bindings for RPMI shared memory transport
Date: Mon,  3 Feb 2025 14:18:51 +0530
Message-ID: <20250203084906.681418-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250203084906.681418-1-apatel@ventanamicro.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_004951_404962_CBB4B781 
X-CRM114-Status: GOOD (  14.17  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add device tree bindings for the common RISC-V Platform Management
Interface (RPMI) shared memory transport as a mailbox controller.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../mailbox/riscv,rpmi-shmem-mbox.yaml        | 150 ++++++++++++++++++
 1 file changed, 150 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml b/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
new file mode 100644
index 000000000000..c339df5d9e24
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
@@ -0,0 +1,150 @@
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
+          - description: A2P request queue base address
+          - description: P2A acknowledgment queue base address
+          - description: P2A request queue base address
+          - description: A2P acknowledgment queue base address
+          - description: A2P doorbell address
+      - items:
+          - description: A2P request queue base address
+          - description: P2A acknowledgment queue base address
+          - description: P2A request queue base address
+          - description: A2P acknowledgment queue base address
+      - items:
+          - description: A2P request queue base address
+          - description: P2A acknowledgment queue base address
+          - description: A2P doorbell address
+      - items:
+          - description: A2P request queue base address
+          - description: P2A acknowledgment queue base address
+
+  reg-names:
+    oneOf:
+      - items:
+          - const: a2p-req
+          - const: p2a-ack
+          - const: p2a-req
+          - const: a2p-ack
+          - const: doorbell
+      - items:
+          - const: a2p-req
+          - const: p2a-ack
+          - const: p2a-req
+          - const: a2p-ack
+      - items:
+          - const: a2p-req
+          - const: p2a-ack
+          - const: doorbell
+      - items:
+          - const: a2p-req
+          - const: p2a-ack
+
+  interrupts:
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
+  riscv,doorbell-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0xffffffff
+    description:
+      Update only the register bits of doorbell defined by the mask (32 bit).
+
+  riscv,doorbell-value:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0x1
+    description:
+      Value written to the doorbell register bits (32-bit access) specified
+      by the riscv,db-mask property.
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
+              <0x10090000 0x10000>,
+              <0x100a0000 0x4>;
+        reg-names = "a2p-req", "p2a-ack", "doorbell";
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
+        reg-names = "a2p-req", "p2a-ack", "p2a-req", "a2p-ack", "doorbell";
+        msi-parent = <&imsic_mlevel>;
+        riscv,slot-size = <64>;
+        riscv,doorbell-mask = <0x00008000>;
+        riscv,doorbell-value = <0x00008000>;
+        #mbox-cells = <1>;
+    };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
