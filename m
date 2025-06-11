Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D17C61CE7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 06:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r/8+QPBxxDAG/rAhZ7L/YrzptuDGQjcK6M9MR38mJPc=; b=RleMuQrkG9lrsZ
	POf7kJ7LMwL2Kl0/Odx9Z//m7/d63pNYlNQkL57jAWgsLpBbvvrSw5H6nZKL0zqjkz6hQ1cfZQFns
	Jsaj700/njl647pWLNKjUFZ1V5QoIgKU/XVgqZX+55iJqnTrNQ5b/Vr7qVaNajdO+FZL2BEj2Yy7X
	f468Njk9lYek/DWyVY9YWkVHoqYzpDXAq7ZghwSX7SKT9CnzrJTKwxIfWDnBpfv/XG5L5hR4d9+fE
	D8JEULA8Aw3nJU2MvtlamWjdoO1pya0yZNsGd90zRWTLa8oH04A162oAsMuZx6dUrLdsFkA9Fhmkv
	sWRjWUcOG0EWuHeoQKsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPErZ-00000008ywA-169f;
	Wed, 11 Jun 2025 06:23:05 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPErW-00000008yvn-2NAS
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 06:23:03 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2363616a1a6so16033665ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 23:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749622982; x=1750227782; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCnkfIAKufTtsXTirgU1KTm9z6frMQCb5vfgSfK41j8=;
        b=oeUGnYrbGGqnrbTHApfuWxEzcjeaR6yJ1UELuC64MSz9/0zTQ9QsZUq6ZpB5P/PX+v
         5nJLcejrMuzSl+hvOo46ij1NFCHQ++BUS3kJTs7JTmy4j9C8ygh0fzTjYluYhddA0wUQ
         eCvO8qG5evoXrRNhxKkJwoXmat8+DzfAfpastRtAHePWPGj2oI1K8XFaayYrdCH8bn5R
         VCT379of3mQyZssPJcdW0pCyy4cYfOf8WxkmqoDEgmbr6sKwl8mXrc1KpiXr9wnAUGkv
         nBwdWaO6PeOvLIGHJ8tA4fMaHm3rBZUv9ekln5yJ2WeLZvZ2Vxj9UrYgbUasOSizpakU
         zQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622982; x=1750227782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FCnkfIAKufTtsXTirgU1KTm9z6frMQCb5vfgSfK41j8=;
        b=q1WDhuL7n/SQx7FTYS+Ozav9s6eHmT3b2phAwyKN1c6Ayb3SBJYcICMBWt+dsbfS5u
         C7WK05HTs9A4pBaWo0TGokyZbQ8mTrWsX/+rWXKYZ8tcE6Cmb67cBoxSXQbwtNGezrsq
         lGWcFikKaVjLxjTOSt1znLXeQhhM0SX3lhm/GER72dqKLJG0JGRyziyQLBA/LpgPpeqg
         iesc0JqE/JDNpTDUVr5EDr1qDBZgkPsUakHY1Gjem5Nco7OT14n79bsanRloveajKEgg
         EdMMXCNtt4/ivtn48NJhbvdHZk3XMOnObrnD86qqEM7zfBy8sjg8ZsX79G2yIS+ij9Mq
         SIpA==
X-Forwarded-Encrypted: i=1; AJvYcCWEx9SsB3VIFgtadp3Z8cl7zI9nzXA0lHqf8FGLqhMQNtmpg14OJiGnMFf3TBVafKF+WQir+f2vUv1eMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YynA8MF3TlVaGAOO6lqru1Ju+z8oz5rC/f8KWjmbV6UrVUU+eAM
	UOqJGkxMb5uxWvkuSNsJC87bKb4/jQX1rL4UiPTWRhquy2l6OaJFOXdg/4xPYI+4A0s=
X-Gm-Gg: ASbGnct6nElIJZrPQP9+Yk6mqIuZX645BpkByrPo/NjKxY/P7ShIFoXciaaXGwgxF1S
	zb3aCc7vov9vfwUBx802rv8Gh4W+vrP897+wGLW1IdJ/OAfnzLe7r2BzTzkIY7nEbJPR15qV6U7
	PUsEamt1ojY43jP4WBZky0DNxfFupohzWntjRap7Rl29IYv/3zKOtauaJCtwlWfGfjqJILHUcw6
	8aNGWKQsj817v8kpKpqTjXbQSyz+8z+Hf4zcH+mIWcDBFunjSXgJVMk+c3DhHiclbfxWJOOABG2
	XUqh6pnnyKfjQGPGmFjdh5lfGrMtFDQuFf+naGMQNjZR0vnTRMEzboyxOXBq6MWvVj8T7ga0ACQ
	KJXM3Pc0waFRAbu7sCks360FjXg==
X-Google-Smtp-Source: AGHT+IFflCobAzZ7DXGfkuM4PqfzrltZgkya36IU2M6LH+WC7zfTuPjuPy+rud5tVoTqrkTwZZw4yA==
X-Received: by 2002:a17:902:d4c1:b0:235:ef87:bd50 with SMTP id d9443c01a7336-23641b16639mr27978465ad.45.1749622981638;
        Tue, 10 Jun 2025 23:23:01 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:23:01 -0700 (PDT)
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
Subject: [PATCH v5 01/23] dt-bindings: mailbox: Add bindings for RPMI shared memory transport
Date: Wed, 11 Jun 2025 11:52:16 +0530
Message-ID: <20250611062238.636753-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611062238.636753-1-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_232302_607393_C4912B6D 
X-CRM114-Status: GOOD (  14.19  )
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
