Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F85AC3ABC3
	for <linux-riscv@archiver.kernel.org>; Sun, 11 May 2025 13:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gok9j4shl08+BFc5g8BSo6+hGUC1c//bECSTPYrNf5o=; b=mD0X8++5gDc1a2
	nTd430kfXVjY9KBd7U32+5L9DUaIkhDnXTzKa0xVx/uykAz6CworWZ7zsfKhz/71pFl/MjwVAmwaq
	QPGyWtzkVX1IUbJHh3FeAYfVnoh6FakSuUeiOyKcdH+R5Mg1FNL1Y9RHB+a9mSsqcZ0Q8/jmFiViE
	1nyWBuapxlud+khJ8xfvpvGdKRhEu6UM6ZBMUVkwIT1M+xeb4sRfl7DD9THNpKvMYabw1J7Ausdk3
	Dd63uWOWfnzQaPVKc7ZQzlWCpkrs7RZsqgIX7bgCI5umpvQ+kBYoQpMmJ5dRWMCeeJcciQiUNcybz
	/O9nD2/KH/7lcJ2qjUuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6w1-00000007I1T-2VZ3;
	Sun, 11 May 2025 13:41:41 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6vy-00000007Hyx-2Lkr
	for linux-riscv@lists.infradead.org;
	Sun, 11 May 2025 13:41:39 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b20d46fcc86so3309448a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 11 May 2025 06:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970897; x=1747575697; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNEVmZiv/q5DSw1yW2Dhni3TymNMhn7fmeMDnXK+LxM=;
        b=A2P/9ucCtz63+6m96xJVwnXvCf+M8G8g+/nSiNJKDxTYORw1HZfS2sghBCC6oDPiWb
         GqA3MDfBv/2FOHaIvjCRzYaunn3Mt4Caq/agGKujNjMfuLvihZTiC0z9k6/FiHlMynYf
         UvByP3Ar+PBdTPfHmLwUlY1KirpFV8HZLsjvLVd4M+E+CIi1yvi7aD1yjh3zt9hi/8xN
         c0SGJrLTaO49Wiew4Dbd43g47ZloM+W3S3TVbMAcFNr5EoHJjfeTx/BGSR4CbPGfvmrd
         AWz2QX7VtKXnfM6xU/gg7q5MHyYeWyWpYdCNFQA2NAWU95Z+DMouUysOb5mu/51zHP8j
         D37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970897; x=1747575697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GNEVmZiv/q5DSw1yW2Dhni3TymNMhn7fmeMDnXK+LxM=;
        b=kI2tAeSGrcB1fZ7bPNqyPhG4RJWAR4gQgBg/x3R6xDKmdag14txgEmpkkTkFotLgI+
         dnz0Vc7zl3TRFCWSQvnjNxDETx7Iib1RxgcbU1qExDWyE4k0cTcOG4VZqyNX1xOe9q8b
         2V1zqDrMPJHtToLsE02/dqLwXvPpRuF2c+T79kLOruqO+ZvSQsPygI+QpgUfPKjV2qY0
         xCcuhFvB4EbUfORGt1HBSgoMod+GExAAXq72KlbSOl0/NnC9nxwqQ2812CQX02+ifeY1
         8x5rvrl4U3t0eehllpr75o9kB089hJ60tcet5UwpGzo+uZrhoiOzixH6uOKhPBre3KNd
         rMCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRwoR9arrmuoSBz4Pz05tyuPNPqP4ADpsmBA1/2vHX9rn/eqLpXMEYLFoBdU4V6Rr5BZtvawVZ2YH3qg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxF0yKhbzPzIRuLCOk8LI84EsBIl3/ZE1kxhogT+F44zFCuxK3C
	cMyOGeXbDaba4jZqT3aXBZTCnWARf+uUcrd+HaTtk5NwelsA+aT1IaG4DQWBDFk=
X-Gm-Gg: ASbGncvsGSI2CT05+qzQaqJF2FKPhLh3tir6zEUdLA8dStFBME/zDCxM4rim8JFlxI7
	YoKFm7LeWJDkMlONAouDNgQI8j0D6SsRFQW81qFxBmukI29nmat2Vz8wHhdMAXn6Fl9sBylqfei
	XR6tI6agKblrE//xHedUM/FwicuDb+d8NvnWrboUCyY/aIZ01mxOeTH8mXL4S7/GlSCypZh/HF9
	bCsT38UYO8lSVfKCEdBiHCz8IBotY+89ydKr8CCjCwMsy0liKyzJWKkMy1dMqXfMETuLQ1r83OG
	G53yuASe/pF4ziIah6WTaral0hcelskfSdzrFVtU4uvTWBP2QoyRn5eIBrnx3NuCQyBmc1+Semo
	Hn7pGtROZAHGtMg==
X-Google-Smtp-Source: AGHT+IEZtfgx6j1dxRmccdlhlQve03DNV5a4qhTyFu9OpXgdKWOB6OI5l9zeQUqJ0boKf4p0Jt1+Tg==
X-Received: by 2002:a17:902:da87:b0:22e:3aaa:8bc5 with SMTP id d9443c01a7336-22fc8c77e28mr174265425ad.24.1746970897361;
        Sun, 11 May 2025 06:41:37 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:41:36 -0700 (PDT)
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
Subject: [PATCH v3 11/23] dt-bindings: Add RPMI system MSI message proxy bindings
Date: Sun, 11 May 2025 19:09:27 +0530
Message-ID: <20250511133939.801777-12-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511133939.801777-1-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_064138_602485_0FED1EB9 
X-CRM114-Status: GOOD (  14.43  )
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

Add device tree bindings for the RPMI system MSI service group
based message proxy implemented by the SBI implementation (machine
mode firmware or hypervisor).

The RPMI system MSI service group is defined by the RISC-V
platform management interface (RPMI) specification.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../riscv,rpmi-mpxy-system-msi.yaml           | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml
new file mode 100644
index 000000000000..26dd13731350
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
+  The SBI implementation machine mode firmware or hypervisor) can
+  implement an SBI MPXY channel to allow RPMI system MSI service
+  group access to the supervisor software.
+
+  ===========================================
+  References
+  ===========================================
+
+  [1] RISC-V Platform Management Interface (RPMI)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+  [2] RISC-V Supervisor Binary Interface (SBI)
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
