Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84AE9C54ED0
	for <linux-riscv@archiver.kernel.org>; Sun, 25 May 2025 08:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=586Os8QQ5RAt/eu9lo/TpT0ouzptJwWRGls86X4Br8s=; b=Fe74Jtf+JvFLEn
	wOCUn7qI8qw7SWAREwASY0x6aACMpCP0PJtdUgjuKVQR9ReziZ3pSF5wvagO0E8F1eNw7jhSaR+J/
	lR/PnnEfs2gN9Vp43IKjudhyJzypGXijFKRKaB4otzup1lg8cYQYBSq4sx1fav7+0rXqjvGfZXTsW
	r5ICk8oo7L5Ye2NjlTmEe3cSBCDfRUX+5WK9Ooyq8QnKvw28kAINpuCY6aOY9j7W4B1fk+/jQnG4v
	BAjtHvhmfsTawO5eSGHMjqo5v+anJ50nJONAh0yB/6os5dGnxayOsfENMDmTtnQ9//GRzq5/qwoq6
	FDJPu3KDzXblSsNfuOxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ71H-00000006mIP-1lyT;
	Sun, 25 May 2025 08:47:47 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ71F-00000006mHc-0fEC
	for linux-riscv@lists.infradead.org;
	Sun, 25 May 2025 08:47:46 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-742b0840d98so813598b3a.1
        for <linux-riscv@lists.infradead.org>; Sun, 25 May 2025 01:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748162864; x=1748767664; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a8RJcqna2SB66zfJXJjyhYjfpxv8SHn2Fs8Xdiu0F08=;
        b=ftCbDmA/Ji7/RWBkhSqZJqxqfMrlUJ5/1bq7aUGO0J5i1lymeySxbkY8kXdpxa4rcW
         /Up8zQjQWaDGqnScQ50Fqnm4GsdHYCgfiSjZKuHZcFT8H2QkyhfbzBhdmQUEdjqj1Tgo
         Ka/y8Nuthv0Bf8sWcvxZwoOJvlrRYiELSNR6OJgxxEnz6mDyVDlUEo30MNs9ObirwHQX
         QRAjqyGZtyTHloQ8PlempdqK05vvsots2/GPlv6GIRZ3oWfTv0Wl+eeOgHSM6hd0+hSA
         IHmkhapC0Lerx2u3jawB3Ax6DdXk6oZdkJHHpAxjS1kycRIHbGNX7umJCwmVXH6iYH93
         fWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748162864; x=1748767664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a8RJcqna2SB66zfJXJjyhYjfpxv8SHn2Fs8Xdiu0F08=;
        b=j6ld6XU1hik17LV5P42BiGW8tVuYD283Ft6PiXuoa6Vz2bSi8BauzVlJa8dLp7oxI4
         U7QJXWdHlm5amC6m96VGiRxZg9ESJbYlAlu2Nu9gHXl0eY1Qjro7HOpkng1Ph5vZQChM
         FKKOsTkYfENCKr3c6U6WFnxCcPAbHR98tCrKKnxHlTm0d4rCXDST+mjSUS80HWJfgEJQ
         AZlZAtnc9NwS7AVXUt7pEAs68hztQSmLwqR3AlZcaEXf03ZTJJjiYWNXIn4v02JIFqqQ
         mE5XCc59IN8nL4GY/Cz5CXPRI5SS+dkhYqZ7fy9DMLv6oH83bJqcXVmQx0uYSlmMvuvQ
         fnlA==
X-Forwarded-Encrypted: i=1; AJvYcCUcP+oOVNhdeF9DpXLDHZewXLrTKVgi/gXyADemPxyypKsF94ghww2F6qUKobxphtz59P5nhOUnMdNn7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxpaxUljyGERQuirVitbhHSLgH0iu/cQiMwxEF2aogIc9Bomosp
	/BJQNojVDJpp3thFnPppOnFO0zEONtJAI4CdtfTa1HnYAuLswhlVcWR391X4AXICTDE=
X-Gm-Gg: ASbGncuDASk0esCTH6yFyoMo3+ll+Us/uVmXgK6ZBN61vOSDBmxz74LjuzN9LBW+MY+
	QYkvWm4Y1HcS4Sp918ZwmGHLSYKfrPZTdfO0mvYT9Fa9xE9lLfq/8ANX9czHFvboYXGcSVsPsQ8
	FzWWRarbgPuyD04LHfyAW2mdlByZetjWWmXvFI+fnBzTlmzPj2BNaodu0DXh8d0qDV9Sxh44g0K
	GfU4ta9dIvhhbjJ/D/D/wZl6hUUGjhTXWwhbmvG6Wv2hgBghRFR70itxYoOy8S9hKmxgF98BMJX
	99smoUFyXPT7b2mKyXq1IU+76f/iQ8KoyAzQ3ODlyYywGf0V0+9zL6+vNs2wAG9oWVFgCtDehXi
	qNSNamDrHEDL3l9jvAFc=
X-Google-Smtp-Source: AGHT+IGzswv3vPxMMfMhf/OOZ/Sg39JmvamXC6rvZqSPObCuik53tfcCX/+jQGjFhFxWYHNRrFfFgQ==
X-Received: by 2002:a05:6a21:a4c1:b0:1fd:f8dc:83f6 with SMTP id adf61e73a8af0-2188c3b499dmr9016832637.40.1748162864132;
        Sun, 25 May 2025 01:47:44 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:47:43 -0700 (PDT)
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
Subject: [PATCH v4 02/23] dt-bindings: mailbox: Add bindings for RPMI shared memory transport
Date: Sun, 25 May 2025 14:16:49 +0530
Message-ID: <20250525084710.1665648-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250525084710.1665648-1-apatel@ventanamicro.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_014745_196320_43930EB9 
X-CRM114-Status: GOOD (  14.65  )
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
 .../mailbox/riscv,rpmi-shmem-mbox.yaml        | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml b/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
new file mode 100644
index 000000000000..a5bcf1fba464
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
+  [1] RISC-V Platform Management Interface (RPMI)
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
