Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE50FC87FCE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 09:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SAfGO82llCEh3Qi95A5ynEyqKJrVoGn1J4e12u4ZWEg=; b=YzKdqRsW5JIVpv
	gHb9QrhEpEq4YSVfPf8YbZJqakJfcDfv9J1qKG/DBa7IVPTYsRed3P2SUgRoEAecg3r1lHSW8v8OF
	ipaeqQS4ipkdEh3zrgqDPWMbjKMYxFb07AM2Nxmd6wl9J3SkOpsiiIeVFY90CwlJPp0po0jNR6gxv
	VGQHLnvepsphpP3xV7uYdEHcOSxU66jnm2ypu+tVtt1lCLniqenN7rRJo9Jy9Ht1oQlSSWEK+646H
	pyypdEvbMJxeFW/rAbxNqfrShVGQ9r/lkQ2APhlzrACHjP2+kU62TJX9Yvdq9MlgerY8yvcwqluDj
	qnTCxcmENlXDkHtFQ8aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKN9-0000000E8BJ-0y0T;
	Mon, 28 Jul 2025 09:42:19 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKN7-0000000E89b-0xZk
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 09:42:18 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-31c4a546cc2so3454041a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 02:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753695736; x=1754300536; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+ejybDVQT/aGz6Lcll3wkVRKaiK+174ISdzaVIOfkE=;
        b=AT9VAFG2uCH9Lb6dlQhlAgk2JNIMaKpdt88Z+cu5lkoPcXL0bEY4MYbTaw7vF1abZo
         S7vu63EAM4kXKJMyX5Y7nNWN4sHkEgE/v8GFzjHtRXd/bFD21w4eNjX4qLSCYq0BRIUc
         mjZs98/bb6a7FtUZeqwIVVCRbpO3KG/05t7iUZ7TEiyRSrVEjGzMcl8nm8NEeC+Z2CXp
         hnqBH3gYW18UqnxKoFBuTDCWsRFYg+giF2Tg/KuclhDgpXb+3PGdE7hblQefEN9avWnk
         mBnW9TyIPFZBf341IVHQy6OVp6l+A42+iS/8hbA6IXlamL6ZDANHxr2QAmqC7o6bpDpv
         Zj8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695736; x=1754300536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X+ejybDVQT/aGz6Lcll3wkVRKaiK+174ISdzaVIOfkE=;
        b=G5hAedtX0NxH3/n+mK7yAkkcqwgj0FHQUfxdvhj2l6CHA5onad3y8e3wkdgt0+7hLO
         /UYGIvhGOiZFtwpOqLsdp2XXIfnw+WfSzoIbApeHU+CAI3ng/XMvS4gN9Qieggm+ocaD
         UWitjuvTSa6haXc9lqydn22wGaWaRMSu/7hVCINoOAvQaBfYzGbLlchesPsHStxP3roZ
         6f/Ekl090Dr2iC2hIdgzWNzH+79pxVRgEFYdcEZMBIGcrr09EQCtYBqGpaDAtVUwbijD
         /qNGySZy/r3VEVNVOojxMpeqJTWxAGCs168evcQa+AdJV//VJy7x5ylT/iLuOkxdYe3U
         UdcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXlHIYH8P33uKvbZB+ayxGA1gCDuEDilb83OeH/gxOTSBISSVqDftzAddug9wekO8QK+5vu4aXdS5VcA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwhJbTlIn7vdeh0mY99URyXxAk5w4pbBXiiD03b+gDaerW2eWsT
	iogvpCMieSc3nG8L6ARhAhBkUddZfYzxh6mXvLNxUhuErdixzBDTSHZm8FnOSX+a5FY=
X-Gm-Gg: ASbGncskUQO7xj1wnNkA9P0+xTwAhVMvhQnx4cjDxtJVJ8fVt61V9phWVCFVVWkRk2f
	xfiicHmHexeA2X0x9iqgI1yEV8xILFzPuFNPmCGTJx8gRk5uxr0658AIk9k+qXV5ExZHHkOvy1c
	8CO1sivGhqlb3fGktOQ7VY3gUGcfAW/yxaxBDZkXjKY0u6RSBWQXGUyFZgiIhJ4emaQH27g8afO
	Fluml0jWD0Nxpxi/8iDQvZxqihhVrV1i63BWqsWReBjLmtOz09CFUMGpWniPXwwtEJyorOfGZ7L
	1WZN65rvSi4NsnmNnnCnXRfB+/sh7p60f76Q/qmvAerq/Fq0E/cGFSpIrkgwB3Txxlj8Nnb8yGm
	l7Ugf75U6wOOBtOMd/Kd6tFC1JGZJTPZ7DgzLdUak3wOUmwwi45hoafX0uYvO
X-Google-Smtp-Source: AGHT+IGMNexUFTZgfnglCwA8dHkB4ePGnpWD+DuX2cDV9JJRgC1BszN5eGUa1rBL9rVd8I8xmDxQIg==
X-Received: by 2002:a17:90b:1d88:b0:31f:d0:95bc with SMTP id 98e67ed59e1d1-31f00d09a88mr2516269a91.25.1753695736376;
        Mon, 28 Jul 2025 02:42:16 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.19.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm5396230a91.1.2025.07.28.02.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:42:15 -0700 (PDT)
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
Subject: [PATCH v9 08/24] dt-bindings: clock: Add RPMI clock service message proxy bindings
Date: Mon, 28 Jul 2025 15:10:16 +0530
Message-ID: <20250728094032.63545-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250728094032.63545-1-apatel@ventanamicro.com>
References: <20250728094032.63545-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_024217_266221_B5419F39 
X-CRM114-Status: GOOD (  14.07  )
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

Add device tree bindings for the RPMI clock service group based
message proxy implemented by the SBI implementation (machine mode
firmware or hypervisor).

The RPMI clock service group is defined by the RISC-V platform
management interface (RPMI) specification.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/clock/riscv,rpmi-mpxy-clock.yaml | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml b/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml
new file mode 100644
index 000000000000..76f2a1b3d30d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/riscv,rpmi-mpxy-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI clock service group based message proxy
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
+  The RPMI specification [1] defines clock service group for accessing
+  system clocks managed by a platform microcontroller. The SBI implementation
+  (machine mode firmware or hypervisor) can implement an SBI MPXY channel
+  to allow RPMI clock service group access to the supervisor software.
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
+    const: riscv,rpmi-mpxy-clock
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
+    clock-service {
+        compatible = "riscv,rpmi-mpxy-clock";
+        mboxes = <&rpmi_shmem_mbox 0x8>;
+        riscv,sbi-mpxy-channel-id = <0x1000>;
+    };
+...
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
