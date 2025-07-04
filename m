Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFB2C83F0B
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 07:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=12aNELk5r5hWJ9lbbJhMRpFiw02sDxrlhaF8sTnyXrY=; b=ILITodoH47ZVbj
	zU15lBf6mbh8bIuNNe0wfA+VymnvxKX6FbxZ+GzuECOe/L24PdlfKBJy8gLzYZfDrbNEIgKgHD2nS
	hxv8gEOpxfhZ5j0KG/D68VzbxGKRV1MHhOVxwiYLpE/y9HKVMKsfZ7mGxoLtMjJzxI6fhbPwvEBiG
	QNDyRCjPXznVgiD40B3f/aeEDt0KQRPCsp1fyHDQ+u2qzkn4OP65MudkoOL0WmFwakD6LlnYq5FiD
	2bQhrcEouo8QDJs38QXjcbcv+AJOSnWfsbygXekAYLOJguPOb6Fo/R9Wdp3kJ2/Yqv75Lk7+mwgaE
	66XFHwFrX1fEiWOdyScg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaVu-0000000DUqj-348N;
	Fri, 04 Jul 2025 07:07:14 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaTF-0000000DUE7-3Lcm
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 07:04:31 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3138b2f0249so591307a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 04 Jul 2025 00:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751612669; x=1752217469; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ziNNelNAtU8Lu0O2/2Qc6bW/trdK9/SPi3ZGrwyyiyE=;
        b=M3Mhe5IuUzMcdg2cRtq/VZixRLGqk/t5gGvdGbChhDlbz5NPEJWvA6e/3JcG5z0RWp
         6Ukl16rjmmSeCXXq+RhVWh2WEPobpqZH6NKiGwyLqzuMMhrZQyXNzaBLuvmgSLgYKLal
         enfU5p1ESkuqb0YeCv+mOhM8a0/yqqKNvSDBOKJvPQjMdMJyPwWluY3ZvCGjBCasdRYL
         kpsBXmnHQVSuKSW4HON3HWDSVNRpvQs8eviedpoNg7ZrZ4a3NyGh3gAdgc9gjeNZeOVh
         nPDOFB94GzP/7tC7fGPbLJy3nXWmYsAgArw4ZTsgNLMBWGWqQ0f7N7XaszCCuKd8lu9E
         5zwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612669; x=1752217469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ziNNelNAtU8Lu0O2/2Qc6bW/trdK9/SPi3ZGrwyyiyE=;
        b=GuVciOn0LJYvFB3wi6NyxRrJ8A2Ggsk40xFM7Lx+KuevtzCfSRGdpY67HenXKUX+p7
         ZPVs541birgt0XhOs78GQrS5gN3P6fvZlztPsNvMg4oRyaPOJ6zF/qxvJO18ItvavT2b
         vBTNcTdr9OLFDg8mVyBPs8djgqjuU1bxksgkJuSlAMdSblOGOoa76i2DipJDf8CB+jK+
         wYipKwWsm+kmArqJv9G0sDnqZZ5SRzxf5IDCsz3DnMQZvK/MkXDCoIq69JqBdtUttGj3
         evWulT3vWyOs6lU0d9IUWr02gnzskslMWOkkegCB0j1p7Cg22ysr4RoxyAqCmgqrFas9
         Bycw==
X-Forwarded-Encrypted: i=1; AJvYcCU7A3Wnl2M0/YBmlBIBEzZsDsi9dTJ2wXc45nLCvh/YnOg/ao0Oc+qhtOLkNBl+xNx7j9S5yl0oFQsyRA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/j/6Iun8Ts0Gv8s8LpCAX5H0fJuEylgm92NhQ8H5CVJVoF9WE
	V2doPSwv85Vt/FmrJq2QQ+t4RvLU7BCkEOuj00awWcVww9Aokmh7W5T2d9bp9z1VDq8=
X-Gm-Gg: ASbGncuYzCB2QNW+FOpv5wPzunEEJS7dPuIfZgrbOwbs2SendMdA6dgDH3hDK+AgN+O
	YT4qQ3CaYwv5H7W/FfoOWVe8PeZZaOthXnGB67cVk6cUKB+SYLv8ZtvkA/CeTItdoQLaKisvzLG
	v/oQcVpQ0l2OHKAZ+fUiQW6SnndqWajSm26RydJ4GCR4YKnvIVsa/YFJb49YvJBCdJ2J5Dfxvc6
	yROzQRBuACGj+XsYAoJOhHDAXn/Ijx8y9ALN+acjtBn5WEaw65ZpbDCAAN0FR+9NsaHBs1kPKMK
	VNNe2qaSOOmWJnd28YBdHqeJ4v+YhwjEu8W0i1FQeNCImeuPlS/+XI/TfIkvIcn2k5usQ9J89T7
	ZWS9UrGuCEnUh7SADjG4slHsWfA==
X-Google-Smtp-Source: AGHT+IHydhLYtgQsx/kgFwyDE9RvuLwoMStmH7TgFjyQTvlhgeI0SCRWQV+WfdwDV1yH8hV7OV8ZOQ==
X-Received: by 2002:a17:90b:5488:b0:313:bdbf:36c0 with SMTP id 98e67ed59e1d1-31aac31c367mr3216531a91.0.1751612668833;
        Fri, 04 Jul 2025 00:04:28 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae59a93sm1358697a91.12.2025.07.04.00.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:04:28 -0700 (PDT)
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
Subject: [PATCH v8 01/24] dt-bindings: mailbox: Add bindings for RPMI shared memory transport
Date: Fri,  4 Jul 2025 12:33:33 +0530
Message-ID: <20250704070356.1683992-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704070356.1683992-1-apatel@ventanamicro.com>
References: <20250704070356.1683992-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_000429_830753_3FA2B3BF 
X-CRM114-Status: GOOD (  14.68  )
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
