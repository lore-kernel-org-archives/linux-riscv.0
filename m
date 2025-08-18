Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FA8CA0EE4
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 04:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=12aNELk5r5hWJ9lbbJhMRpFiw02sDxrlhaF8sTnyXrY=; b=qDzV27ZO/J/mG1
	15tpkZ8JtQaGTN4nFdjbeOaF+L/84kUM2PGcRUMO7P9e8rq6QBtiABwgidNDq7sIMgdOBNKAS13bH
	JajVDYUwzmgTDgZajfHcVwwQV1nmTexp1pqyH2UtOTsLGVsRh1NMKHzJ7E8m/F6T/VCDuo4Rg90B7
	ESKn7F3Om17l0U87UtUIKuMmLIBmf/FmLnD88bb6JS/tIzF83h69f+vA13mOEHil6jVOdI88yJmOG
	hTo0XwAESL7LgPhpaa3L0oPc/9fbcUuVt5dpvdgO231iyAdQgl61q1z5yeRES+w1lJT7rheOlnZIT
	/PAsZ2cn3sNci9JfhqKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrCK-00000006QoJ-3i1s;
	Mon, 18 Aug 2025 04:10:16 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrCI-00000006QnV-2CfN
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 04:10:15 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-32326e202e0so2833861a91.2
        for <linux-riscv@lists.infradead.org>; Sun, 17 Aug 2025 21:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755490214; x=1756095014; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ziNNelNAtU8Lu0O2/2Qc6bW/trdK9/SPi3ZGrwyyiyE=;
        b=AiuIs4GC2SltnWCHdk2loBE/iwsqomf2gNQRP7Ml2+JoL5Pw20APmG21Zr4Z7g2j/Z
         DJ0knbYbN9MnvSPksziK6UUQ5cz8kpBT1cSgRfYn8wV4hRaHVVyI0bmXOOqsZdTQmtIO
         a1IHJaaSSEYvgjkIUiYJfy1c7cX0Nayb7qEzgcRxaCRf41SYBo6i4Q3JhiEsofqxD1aZ
         VJ63mua0BD8PxaIpCU1+jVLyVXS0CHFRTnDS+Kl3Dh6In5pw5W8Ua258ho48DNYa+ZpI
         Q4cD0wwUyhvrkpi0gnHyAqkwNRH1+GUZXw7agvwbJ5bVdWKdDk9b0xQDRBv2l8puIZYl
         Timw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755490214; x=1756095014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ziNNelNAtU8Lu0O2/2Qc6bW/trdK9/SPi3ZGrwyyiyE=;
        b=M9fp0PeHcqTEOpzgr2SZUa3chmqK9f9J0dlKC8K4KaM8DDsDSkjgIEAk/eBf4AosIf
         N/yn2zlP0sYDagO1F5mhSgpfFVW6uNUHPS2Sb7maPq9aaXxxL/6ZZix6EpvsbeidInan
         2fxI9zzQo90qEH6W/47QR+tVDHBzLWW+tXQkwVbkZB4cZkiziAn++isgVCEhzO8ey9hD
         KZUhFAYYEHcA+vL+2tnfc94xq3+uKsPYAC2W/TSUwCSBkmRkCcTbsYsbMs/M5NG5JpqO
         6IHeiK4YRzBPO07Bya8q4ut9mZQrdONaepsKuUQZdiOJ0JUThJqYRVyG07BR3GiyOaw1
         YgEg==
X-Forwarded-Encrypted: i=1; AJvYcCVaxjKQPDZbQu0GHb2wXj+rKXa/zluhHdOfGbmtFOEEn/JwTi+bBxXbSYRMxb8tYuKve3Sm58xQCgxN2A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzSE4VSwket2oWnu9VneFZ8gfnqHl3VHnBlXiEMydr+JW+ryZPT
	uzBIyATCaTEACL5t70udNaM8rkrteRXL9CNLeRmKEC4FxC+IJAMQt1qA7WduMRoDN4E=
X-Gm-Gg: ASbGncurhDKDd2RvVHbR5kCZVpybH+B5+TKAmMxzr+FiJrKKjPjO9QN/B3CeftQSM8o
	v356ZP7SgVnlZW4uSk5GVxyBAiNe5Er3d9LpdKfVPzbiVpk5+XqKQbke/9l1EIYqU+JMUzK8IV0
	jgNe+zBK+C/XEctOW6hcXXwIFElCQdZ9A+hvtviJyZcR4jecJsCl6ttV2vzxUujzjiqRdlzWwxt
	XFZCUYi4mllrCxDyIQrx5pIAj53ppV3t9SmCDDDFQXsSbm8+UwxUNszBNUClCQgShMWggfZIOrr
	8Nj7KHIkydF0o04uRb+JPENI+iHqHVSKjW8jBtsEa2GCKGEvblRHyHRasmYrq6CYOYJ/RkkY4Q1
	UVAhguKC2a6as16KARHHkyZv1o0NsWpw0swhYiOWABE25sOPxIedG0w==
X-Google-Smtp-Source: AGHT+IHMNebFrKVgEbBD6mfihQGB/VR29QLpmoagvRz83lEg7IdszC5949YqyCiOGwslywTtFiY3Kg==
X-Received: by 2002:a17:90b:53c3:b0:31f:134:94ae with SMTP id 98e67ed59e1d1-3234db8e252mr10650482a91.11.1755490213616;
        Sun, 17 Aug 2025 21:10:13 -0700 (PDT)
Received: from localhost.localdomain ([122.171.17.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c70356sm6560972a91.25.2025.08.17.21.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:10:13 -0700 (PDT)
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
Subject: [PATCH v10 01/24] dt-bindings: mailbox: Add bindings for RPMI shared memory transport
Date: Mon, 18 Aug 2025 09:38:57 +0530
Message-ID: <20250818040920.272664-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818040920.272664-1-apatel@ventanamicro.com>
References: <20250818040920.272664-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_211014_563571_64C6B566 
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
