Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59F8C77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 13:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dI5+XCzQl5ljZLQTGXC5OREdA/CxNW+kJyvVYKIbYBM=; b=sUzaaDOpA1aoSI
	R2lZux7avU4XV7e1rImWA8D984iRWpd93Kjz+fCEldAC5SslVDD8gr/2w1YOGqO0rC7C1Lge6YYXT
	qdVmWSYwG+GOLWKGwBslCX2wsI0c5cGzsNJo2sHA+iAH+jF11ialYhugCECgo+UCx6cBj8RQ5yL+b
	m/9yTwLS0JdgLbterWNAuAm5X8uBAyGL/q5MKJMMaSXfnkhfb469aHERTVKufg4bQdYVwmR6PzW4v
	TQTC0NBGWzwmiJPVTwZHWmcXSFn/3LJ5NlJ2fgIEp7pa/jO6yqNYcFll8qI5uF5e1LipE95NkJtNj
	aEJHWEc+SizFK8ZUuvig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsqW-0000000AITY-2o5a;
	Wed, 18 Jun 2025 13:28:56 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrhc-0000000A5RU-2VcL
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 12:15:41 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b0db0b6a677so6298235a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 05:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750248940; x=1750853740; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9cEkN+1nA6DRTpT1SF2rNqhyyXGV6gcs+oqiG40Gi8=;
        b=UJ4s4WWV5YMzmS0hMuRE3VN0BHf1LT042X5SeblfIq5Rb2DC5+UIA+Bvn6nVFg6saR
         vLBICSXHo8pX/6lSVzDyWl/peopVj0Iwr4LcJU4fcvomjvutDoK+3ogCYt5wT8cVMy5U
         K4GXSm0WI/1lCDnQIecZFh6wRMjCIVq/kzCvJuzIPL+EmRF3YMvI0Czqdi6SoBOaXp/d
         3v3r4rK9x/0YGFCRSDicRWhpjIK7s3oOWqNShg9UV1n5UihKA0+AeMSQCm+fyLJK4HmD
         vY4LNnhQD69NK80+eNQq4Z6+XkfbBopEPFemE7SrSGD1sdRJLDlxCoNGAgSaheAmymSX
         KcjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248940; x=1750853740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9cEkN+1nA6DRTpT1SF2rNqhyyXGV6gcs+oqiG40Gi8=;
        b=jzW4LVyq0rHI130eZq8s3ivReJo4HR8Z5KEvMGVZJJalTQfTAlnRMDu1SQV3kEBd+9
         3XNXru75JdZKKkjRl3r/zgIImW9DaGJyZpUrFav/SkakmnMgqth5pIj+853mandskWnr
         5Bi3HtxS5VopChUc4g+5/3t4aULPCdUwLW5rYNQBBNCPXlfxDOiRYRL/CGMz3hVio0Do
         hq8VKQ587rwa6IXoKvU/gvyS54MvE6uhOrDkurUDyxsVzxvcOypuau2XUkNe0qofYGef
         YUM246jzFQlN5xPvTIaIQJvawHsbSodkVLFye17KShdeu7un0IDVZMcotuRE9OoID25Y
         2Zsg==
X-Forwarded-Encrypted: i=1; AJvYcCWYMhGeJz3fjGeeCDh3TSmoLiXPeD3re+9+mJ+QrZVFNSkuxWjyN0Y8paRN//5SaAqZXrSQUDDG9hjHSw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxyGtgE5RvugAXv4BC28XTqy7Z3f2ASc+UfnyLxJx+5d8cNh6tv
	np1B87Rt55X5qDhr7ouVC6x2GYOW+Wytuc+oVyzzXl/2q+sex1ejbiyvfET9kJiLonU=
X-Gm-Gg: ASbGncuKHAYJw2OJsxy5PYl5kF8TgkfY2bl3e0jkgcp9F/qQpJCEcYE9HucCMICdb27
	epSYHJLzWFGkA8PJtMROWL70I0NT3z0BNoIeQBzp7g+ITL9EXUYq/k/M7L5HZyWeVwE1G0/rDfj
	cHLhCm5k0AE3lZcW/+VWvwuFQ7qmxkt/sZr2iGZ5tcvUWTmr1cZOil7NCWZk2kbVit5wd1SD41L
	TLJJjVTg7/039B3v0mLq6Ge6wKBMx9cGjMuumadgr8uMDrzvoSxXVcckozj3J3yYI1kXC9oXs3g
	tYQDG4n1Nlrn/JqNsipaA6B8sh+ISeuGOQOrEZhvkGfceQ5bAH4Fdyb83ycuJSllKNM8fGb82bV
	ZeRn3SUe6Zq7Rmnghxw==
X-Google-Smtp-Source: AGHT+IEK8qZ+gXPmLTnhrSUH6t88V4GWdt5zL017JHCoKp0U8HqJO2SVy0J385g1j8q2Yo2wHBbtdQ==
X-Received: by 2002:a05:6a21:9ccb:b0:215:eafc:abda with SMTP id adf61e73a8af0-21fbd4d48f6mr24066795637.18.1750248939720;
        Wed, 18 Jun 2025 05:15:39 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:15:39 -0700 (PDT)
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
Subject: [PATCH v6 10/23] dt-bindings: Add RPMI system MSI message proxy bindings
Date: Wed, 18 Jun 2025 17:43:45 +0530
Message-ID: <20250618121358.503781-11-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618121358.503781-1-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_051540_638376_02A5FC4E 
X-CRM114-Status: GOOD (  15.10  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
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
