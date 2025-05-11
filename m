Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807B9C3ABCB
	for <linux-riscv@archiver.kernel.org>; Sun, 11 May 2025 13:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QIyW6VRSxoMqNkEz11OXx+gYbg94JMNPDeKuGouS35Y=; b=zUouhDrxS44Ul8
	sQqIxjvMHDEANXB/U6NwAOmJ+vRxoiZEsJU0wan5wDMZDfKGJi5o9ze1wrnxV8yF60Rrw+TRG1LaX
	qx1MTG8/wqcuWmcJ7DF3y9eGhN6nhJ+WYN1hejYus/xPSdRIa3RqzJDIe8mUvPxzMQ/pH+1OaP+WH
	nSY2KPybRRe2fs6vxKYrOjx4s/XrKp5MAwOgdRX3/EHfiN7H2I1DKvUpsHhYj1pNDJv0RRhvf3SeD
	TdY1AJ3hQNVaeOL52MZbJbMbl4PzZYWBfpJZ14YIx5laQxQWxg/FTEHx+j/99bUsZyC7n2jfuSzXf
	lVWG6u+bi7walvHCzJTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6un-00000007HEf-09jM;
	Sun, 11 May 2025 13:40:25 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6uk-00000007HDi-2KcC
	for linux-riscv@lists.infradead.org;
	Sun, 11 May 2025 13:40:23 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7423fadbe77so1941254b3a.3
        for <linux-riscv@lists.infradead.org>; Sun, 11 May 2025 06:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970822; x=1747575622; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZ6NtnG6XOe7TLAPrIn93jkcqu9DK5X4kG8nXgTaGD4=;
        b=agbr2n0GO9W8e9l2eYsZQyt1P3+7oHZUiKpUdwwCo4IxCiY3zldUAfjj08FYtPScZx
         0b1o4EWfg61nt00COItutXpLNMu/IgH/7Heyu8z5gaXK/hYEtZgU1cvi58cr01MDz+89
         lWqMPNwt0IcSkoCinTfnjpBwOpYmPnJg/uRPhkbmmStU9sXtR1xWfbChd8UMXz3oCpCf
         hmn5Bj1S2LKAU2zky+i8i07fe0Z2T1cXblA+zNYihL5AJA5wjb/a/sIazXhOF/HYn1ru
         DUU1FMJt5CilKNAe5bRbaltQtNYbZme2s6KWl7F3/3qBut8aPIsqZ1wgXEtwf+DmM1vR
         qPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970822; x=1747575622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZ6NtnG6XOe7TLAPrIn93jkcqu9DK5X4kG8nXgTaGD4=;
        b=xA7AkAODSJzONjYcyge+vcGQHL1nlkKADpKmTe9RfFx0iLsQvUVcSFmRh85Z9o7W6S
         uYZ9d5ZLUkFSMEzt4T4JGgiVGlYDcggUiboxs30wz3aVRnFKucHWHS8fnbjbLZMWPpv2
         +hc39BWUrOWC8iXFTvsj6sVLmJ+6ioaXtRHtlBM/r6LW2fUnVBY1OVFLWaStkjReTjkU
         vUT35d83INeMbk/VWIiq6XRGQCErZDGDvkROy0CQjeASTtJ3qxcUtKoPRbVdFi0GXDXb
         LD37f2SxBEyxLbqkyPId1+izcIhx2VsrU2ubOyGFtiKUMe+6lj4DVU57DhbeXsdhHbKd
         jKjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdYe8gvSku9pYPGqoZNeD0fJzcUOlTUYF691TPfv9Ut0hsVA4v94j7BLPlzMPgflWgAnCQ4jYFTEFarQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy03gMhsb8ttGdlG4KItFU1vJ7iUAUbXVEOC1KVGm0YVLOibF5/
	iD0N6LncBOC8ZfvLT86wAULJfyqe5iIi5TJDIqhS6ZD743768i7RQcG4+b/8pGA=
X-Gm-Gg: ASbGncu9Dt7b4dNz7aR9KQYgXWDGIY9lHow1UkmdTUOV3g3vuU4yhf7lfqEoboymBr9
	0XpNUGj05HdHTk3zd4+ZVBLUNbV5EnNt6IW1iprpIu2xF/5zXmY/Wq2KHxj/aaMcAtce6YNuLaj
	NKsBunriwhZ42VPMugRZizKe7QM/PYoORPcI6B+g+ncQZuY6Qnlqo2Hw6tyyua6G+2XNbp3Me8S
	NoHHO2AhX+JOxxKJ2UGZntjQsdzgS+lrNkE86waFhiCkn9ZtC/yCsBqi4U9gmjvN9uE0LSQo9ub
	vCkBVf15NWlNzEE3MUYWvsjtLGzf4HD/jMSYi11fb2VVMFKOogEA41PZM4F1hm21Ty9dmj0ib2q
	PFOcTAccTyUID4g==
X-Google-Smtp-Source: AGHT+IEKA4j7Q1E0TWQZL/8OAzQGwFqUuLE93vOIqHVrlSrdxnqy3RYvhsFLnF5FwYsIyUhhIsd/mQ==
X-Received: by 2002:a17:903:2349:b0:22e:50e1:746 with SMTP id d9443c01a7336-22fc8e96196mr143712685ad.36.1746970821472;
        Sun, 11 May 2025 06:40:21 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:40:20 -0700 (PDT)
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
Subject: [PATCH v3 02/23] dt-bindings: mailbox: Add bindings for RPMI shared memory transport
Date: Sun, 11 May 2025 19:09:18 +0530
Message-ID: <20250511133939.801777-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511133939.801777-1-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_064022_599779_A0F1F920 
X-CRM114-Status: GOOD (  13.90  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add device tree bindings for the common RISC-V Platform Management
Interface (RPMI) shared memory transport as a mailbox controller.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../mailbox/riscv,rpmi-shmem-mbox.yaml        | 148 ++++++++++++++++++
 1 file changed, 148 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml b/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
new file mode 100644
index 000000000000..3194c066d952
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
@@ -0,0 +1,148 @@
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
+          - const: a2p-doorbell
+      - items:
+          - const: a2p-req
+          - const: p2a-ack
+          - const: p2a-req
+          - const: a2p-ack
+      - items:
+          - const: a2p-req
+          - const: p2a-ack
+          - const: a2p-doorbell
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
