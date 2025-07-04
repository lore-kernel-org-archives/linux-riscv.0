Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0A7C83F10
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 07:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dI5+XCzQl5ljZLQTGXC5OREdA/CxNW+kJyvVYKIbYBM=; b=Z1Yb/tJbQAys4+
	W1r2Ozmiy/LpZVKLTk8B4GhZqK4FTui29ojfTh4zipU4JdiXQOVcp32YFHEBwrssJDJnelhJmF5jK
	AQG8uZU6EkKoYVpU0y6ZgZ9qPyVzVrZ4XoSSgwDIMLdXewv5THA0DwjP5AlhYf8cV7+CKwHDVYLjQ
	/0AclEhcexRZQxP6OVO0KUXau0ApG59BkXYbjnevs8uta41PRUZ/zS5Op5jqckEdj4dpmWBSN5Q8e
	J8tnpNhq/Vz6biwoP7KCPGSJZyhjo69lJ4xYj42KGPS8dPngY/Spi76zVyrd9EYuz3NgkbftZkHbY
	YNaTskNiFwaoWsSyRY6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaW2-0000000DUzR-1L4i;
	Fri, 04 Jul 2025 07:07:22 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaV6-0000000DUfv-3FmM
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 07:06:26 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3190fbe8536so639021a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 04 Jul 2025 00:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751612784; x=1752217584; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9cEkN+1nA6DRTpT1SF2rNqhyyXGV6gcs+oqiG40Gi8=;
        b=h1z+sGGVdoQkvMZlfAxjc/FvEFKennt8SOssRsmQuH8GavsEB1RC9SdGj8LqSnUgHp
         PLBiZbsEGzcOWNhsPvliHeg2yTh9mRvNiJXO3zV7n1ML6JQ76uqmjAnm9ArDuqIzVYu5
         ZrF+wN2nBnhUBGTxPY51aPkddjS+2FLL0bL/ZbKwDeDyg8pUdjwnz5niK85/Ld9ZcuFA
         3EYrbZzP3ZVIquttQWghlPY0ZX0zZweAC4EJrd0xKuyxnOJSOFydX1mGjE4Z4N7/HM7v
         1YoArDYKmt420baGnRQU0tyTFLPld0jmUMHB+KFWKjHsI1puF0rSJEj1Q6xsIvk4aGnB
         KeBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612784; x=1752217584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9cEkN+1nA6DRTpT1SF2rNqhyyXGV6gcs+oqiG40Gi8=;
        b=ksJ5p14RVKJqeAiXEkh6hHmTkzTwtuvDENBGScVbZWox/oF4XQmDlrd+f3enJWXe5c
         SKaUkTdEcfc8TBY5NisbhQqffFwykE71mq36QRU+FZ1z7tKFbXMFhgT+/f//YhnVyp9b
         EC2LG4bXtaEx+1UZx7ntPwCbRVEi7zkPQbLKY5pCgCT47nYXYkOw3Ss4mttuo4Vtcc42
         b3d2fMv4YYnsQk849ym4fF19yu2+MENCltlOgkJOCW1iEiZeAetsmiv5+n3N2x8JKXEN
         Lx549hNb+DegRFwm4qhgtmkjdiY3lX/YOStgzDv8EgE4/kFaunzHKsM0LIYe2o4FwE7b
         AugQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKpCMP9aTc9lw58bT0pLzKaBldOyPLyNkqzTHtzuoD8Re97pfBipUDcXm4ArejZgtrVRXrOuuHh++HYg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc3BW7XuFviNXaKYPUPiirSKbW0VA5eceDfjeRfnFBy1NDFgaK
	icX3Wi3jZZ8zqaf5qMx836ZGkVRbMxz+L9Qg2X3TDGhw93A0KX/igc/J8cO2QXVYap4=
X-Gm-Gg: ASbGncvEEsVNTkYvAd7y/8mexGsfl1p3+UYYLF3Zap6BdJ1vu4Fm4ypvRECOE2iTM6c
	kajiyuVlW0lw30Jzr/zZgNNCps9lUFvxoeRHEOxPn4Xo3VacNVm+lYsSGb/XLM7T+cL0mu/AHKS
	D/km6uZ7OimoJvwEkeuHBUlQC0skpuD2FJZp93UOrN/rxaDottMpi+ytYeoKeBvFqddQCsIOhNo
	bMmZrMtxEQ8aE1G+0uWLEilR0spLoPKUxBC5kEhDYwmbExrYmkIkPmV94JBtdlT9Z22wuVe2z85
	sW5kPloagn8YLA9vmp19wnmFhz41epTa8BE5nx1Mb6R9NpIwGQKbH5YaAsXBA2xgaDXcTMv5jCZ
	6BAAMsBFP2/ISADjzCVo8oCUAig==
X-Google-Smtp-Source: AGHT+IF+TdlZoELuuTjQaFBwsOfjj9nVaP6qUAJ2uy4CPsdX0ww7K5CWHbfKzfTy6kNCQU07DyLnCw==
X-Received: by 2002:a17:90b:3fcd:b0:312:1c83:58fb with SMTP id 98e67ed59e1d1-31aadcf8f13mr1549627a91.1.1751612783864;
        Fri, 04 Jul 2025 00:06:23 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae59a93sm1358697a91.12.2025.07.04.00.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:06:23 -0700 (PDT)
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
Subject: [PATCH v8 11/24] dt-bindings: Add RPMI system MSI message proxy bindings
Date: Fri,  4 Jul 2025 12:33:43 +0530
Message-ID: <20250704070356.1683992-12-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704070356.1683992-1-apatel@ventanamicro.com>
References: <20250704070356.1683992-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_000624_834500_0834B900 
X-CRM114-Status: GOOD (  14.99  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-acpi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add device tree bindings for the RPMI system MSI service group
based message proxy implemented by the SBI implementation (machine
mode firmware or hypervisor).

The RPMI system MSI service group is defined by the RISC-V
platform management interface (RPMI) specification.

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../riscv,rpmi-mpxy-system-msi.yaml           | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml
new file mode 100644
index 000000000000..1991f5c7446a
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI system MSI service group based message proxy
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
+  The SBI implementation (machine mode firmware or hypervisor) can
+  implement an SBI MPXY channel to allow RPMI system MSI service
+  group access to the supervisor software.
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
+properties:
+  compatible:
+    description:
+      Intended for use by the SBI implementation.
+    const: riscv,rpmi-mpxy-system-msi
+
+  mboxes:
+    maxItems: 1
+    description:
+      Mailbox channel of the underlying RPMI transport.
+
+  riscv,sbi-mpxy-channel-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The SBI MPXY channel id to be used for providing RPMI access to
+      the supervisor software.
+
+required:
+  - compatible
+  - mboxes
+  - riscv,sbi-mpxy-channel-id
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller {
+        compatible = "riscv,rpmi-mpxy-system-msi";
+        mboxes = <&rpmi_shmem_mbox 0x2>;
+        riscv,sbi-mpxy-channel-id = <0x2000>;
+    };
+...
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
