Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD359C677C4
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 09:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wEgcDoqQU3+8e/aAiBTJhnp2mM5MP+/dwolT16KcFF8=; b=LczCpBaHUmelSH
	WZvYKzK2v3OYqrvIkveIYKOkb/tzPJvr1kH9kQ7BP5NiWlr9kmIeaR0yrCCBoO+FOPj2xjnivtIEJ
	3eQEJDC7MK+WLYI78ePiwQKV3sj534JwkexIHmVbwwhaDGCRQDU8cVkN5YsUdjqmnIQJHND5agSZg
	IcDOsm0SbgZIRvO3T7azj6tzBQTGYrn16B0QcegdxvYn3E9vpFEklaazj/k06hmxxj2MeBL9W6uaK
	uTvY5WBwZ7jVtpfOxYvONcTyr3T/nVpQ4R9ILA24fQjOMbEGZQVfqHlpKggPQOIyXCF6xVTYLi8hD
	QFACIhbMHrtKvlQo5G4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPI9m-00000009Xxq-2nhA;
	Wed, 11 Jun 2025 09:54:06 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEsx-00000008zQR-1iXD
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 06:24:32 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-23526264386so54527135ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 23:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623071; x=1750227871; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIz85jrszx9X2n7VJMwt6ECwmZMzZVLMduOipCTmFkU=;
        b=jAx4dJ5kEQPQyH0IgXHQdfQTHyE8asfvTYAALlXB3WALHNWqBc2iLrTg1P1j+NDck2
         RliIU7roNLTGmc4P4yQzphUkzUE9Ke9ptCni4EyTOrfJgVE6e4ZyzU5tBeLv1NwQI2fP
         1du4Db8j40LyfzPEVYL3VZ1vsbmV8ywGTc64IACqmtUF2x0+oAyvhVgYmZPC4QR8a4KB
         41oCMJGbcf3AlJMFKD4CexU6b534i25VXa33bjskhQga1fVu4i6Ntma1sqYogZekMb8o
         HARZ54d3ODrJ6X9VzA+ctKd3Z0aNC4iG0/JXjQ0pHpfb9dWN6RI1atxcl7iEImMr5sKm
         xB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623071; x=1750227871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pIz85jrszx9X2n7VJMwt6ECwmZMzZVLMduOipCTmFkU=;
        b=WeHvSX/c52tAu8FeqJDz2+csgJj0LUSwU2H+rFQfDDJDDWJ2lByjIWCAxNUnZfNTb7
         kN9OKqtnG70wvJ+S8uurNUrz7jokzkhVKphdlQDTMDJV5iIIWj63s9+BYUnXnQTk0LNv
         7+6Z2AxkXH0AGbUgAN+TLhwYTi6hnid4NCkO3LimDF07LCDdWA9FtGKL75Yx7fPpvCRh
         sfkecSRuTI14Kj/9weaCYgF1Gsi8akO4Hcd86J14605tHl1v4FbbF2WpbptfvrZrd2uY
         GNmM/oYtAmEbnRZBmflMOL3nZ6z7SfKnDI/qbTwxXA+9mh75taaGk3Qzr0DemZHzsTbb
         hlfA==
X-Forwarded-Encrypted: i=1; AJvYcCVpNadvOZ58oElj8QXY223U3W9y704ssl1gpyvDN44c96fXg/OGGkK8ZJr59kqeSLBBpM+Ew+h7Yg9ozg==@lists.infradead.org
X-Gm-Message-State: AOJu0YySkEym79RKL8V+RYbFtLDlenpV3kHgc6/KgRYmVAtPc7zUiVPs
	w7pnXBmFl6sQKfdB3ph9PwczaVQvWYHjeFbX9TcHMrX1YlP6FpcVSgpRb3tpmVsnHPk=
X-Gm-Gg: ASbGncsYiJTrHzAVAfJMmUv6agxFj3j/UYUAlkPBJZS8NcN2z1Mvd7wl8cEbxrw+5g7
	Xi/BYomenkoT5ww/hEAgL2EPdnv1SVrzlceBhNtX28w8VekAf6L7818BXGAnMjjBnupMdY66mC/
	1M6qECoabtXvYTRElWxP9wLUckFlPjD06z802RWMQ1z+yKLDzc3KoSjoB5DE2lLMoTcJVJs0NtG
	oebzaCuxF6USwwKuhStrzguvKSoTw3+8k6uKInzCU+tTWMA5+6iYf7iH6JYyAsdlPLuytRaJ8bS
	KUuCmbqeQEh8SXNa5KZXRi8eihbvRwcGaBA7XMxq/OCJ2072tm2I2mafn5Vcp1YPmt1zBUar9kS
	JD2cA0xq+mvipGWYVic7MQ8Rptd2YXp9BT9CI
X-Google-Smtp-Source: AGHT+IHC5ty5QP/q1J3Y57ZfLhayT8WeAP8B2wlbdhm3ivVDvErbI2rY6NWs1ziwWXlteWWsGN8o0g==
X-Received: by 2002:a17:903:41cb:b0:235:efbb:953c with SMTP id d9443c01a7336-23641a9a43bmr26770115ad.13.1749623070681;
        Tue, 10 Jun 2025 23:24:30 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:24:30 -0700 (PDT)
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
Subject: [PATCH v5 11/23] dt-bindings: Add RPMI system MSI interrupt controller bindings
Date: Wed, 11 Jun 2025 11:52:26 +0530
Message-ID: <20250611062238.636753-12-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611062238.636753-1-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_232431_450201_C992056F 
X-CRM114-Status: GOOD (  13.44  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add device tree bindings for the RPMI system MSI service group
based interrupt controller for the supervisor software.

The RPMI system MSI service group is defined by the RISC-V
platform management interface (RPMI) specification.

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../riscv,rpmi-system-msi.yaml                | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
new file mode 100644
index 000000000000..b10a0532e586
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/riscv,rpmi-system-msi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI system MSI service group based interrupt controller
+
+maintainers:
+  - Anup Patel <anup@brainfault.org>
+
+description: |
+  The RISC-V Platform Management Interface (RPMI) [1] defines a
+  messaging protocol which is modular and extensible. The supervisor
+  software can send/receive RPMI messages via SBI MPXY extension [2]
+  or some dedicated supervisor-mode RPMI transport.
+
+  The RPMI specification [1] defines system MSI service group which
+  allow application processors to receive MSIs upon system events
+  such as P2A doorbell, graceful shutdown/reboot request, CPU hotplug
+  event, memory hotplug event, etc from the platform microcontroller.
+  The supervisor software can access RPMI system MSI service group via
+  SBI MPXY channel or some dedicated supervisor-mode RPMI transport.
+
+  ===========================================
+  References
+  ===========================================
+
+  [1] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+  [2] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    description:
+      Intended for use by the supervisor software.
+    const: riscv,rpmi-system-msi
+
+  mboxes:
+    maxItems: 1
+    description:
+      Mailbox channel of the underlying RPMI transport or SBI message proxy channel.
+
+  msi-parent: true
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 1
+
+required:
+  - compatible
+  - mboxes
+  - msi-parent
+  - interrupt-controller
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller {
+        compatible = "riscv,rpmi-system-msi";
+        mboxes = <&mpxy_mbox 0x2000 0x0>;
+        msi-parent = <&imsic_slevel>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+    };
+...
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
