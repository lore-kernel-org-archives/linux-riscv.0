Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E492DC7115B
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 13:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tNZnuvmGBAC2Fr/wH8nNlOCYbjGeBs7XMHcb+hvrPBs=; b=F5bNBFqoG0TqDX
	TuhY5PUbf+KFI8KcD+9ezLsdmZFk/0kqfHNWGF635+pNB1HdJl+xJ0UPIbm3wbcL8cp1+fJgX7wg5
	Rbmeu6fP/+uo2QuXu5sqpsCdC1Ccc/AgSWL1NmSjbL92z7IJzmx1BWsT2KJ5UW0IjM5Ad8UzPVDst
	rKnyMpQsuMD7iAQk/AzmvFrfHjFpqboO1vgZHdrLDu8rhaTbGKXNUHF7EopfMHV7cGAQWcZfQAeAM
	uVj628ILLPYjPDq9bxMkRyzkIXCziw9lBc7f1yEddQWqcsCevV6HcpprdhPHD2fcQ+llUe0+3izbG
	38/9m5rKBKYDaz+PoAtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsqc-0000000AIYy-1XxD;
	Wed, 18 Jun 2025 13:29:02 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrhl-0000000A5Tq-2eNf
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 12:15:50 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-73c17c770a7so7518474b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 05:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750248949; x=1750853749; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIoG0/2CSPJ7QI1BAwRn3+gvtI7NC6tH67IoLVRWsu8=;
        b=l7HrriE5I3TfduoQPWEwzgI9pW07LII+nf7THcbjDUIbx18YN7tUzfl9PSOEkbFWfY
         y/Lv3Tja2VaNB0VFtcyKfOlsOwE99lLCesUF+eQCYxhTIiCEbYx/WBB3XHk+ar58sbci
         K4KLDLPerxR97o6o5aJjWHCWZn9vtp24299nssFgPjetdBT7wEC536diKdaPzKizg16m
         MI+JvkGyabnM9GEsYfZKVmjKJ+STi6rBJrIT/RXNWLR49hwEs6ZPTXVNWR2pfidfvr/V
         HfuAP3etnMQrB1MvTsEqAS+BuMFCmbx0s6JbaEitnxIEiL4/c7pyLQgfeNI/wx+AOMav
         MECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248949; x=1750853749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XIoG0/2CSPJ7QI1BAwRn3+gvtI7NC6tH67IoLVRWsu8=;
        b=uA9wiSb/yRzWJZfzhnVBgcwdPsAH5s9W8JV11fZXExH6LGbxrk2FdMNnXHIuzICP8d
         phrGwZSK2MfEh0FPhbMa1nSPk2ROqRodR5LICmeEg3nS/jWkFQ9UHRPDtmYw/cNyZxTV
         qNR/JQOm4pVcf9dxJTuJjWeyRWfLol+Abwjld+29hyWYsuNCXn3dGc9jb4iiX6EsvHvX
         CUuHPPkbZ4y4i7rA3DOAoDPZi2ABnPjuNZRri1p9AfzNEzTi3wjpnOajXTou17YswLSi
         v6Z7pgvJfqGBhIZiFI9THl0qhax+ZNsG0wVwEOOvNZaNobSOGPsf2ks4WGPlntMAAKZk
         ipBg==
X-Forwarded-Encrypted: i=1; AJvYcCUbWKv8KW2qDj2SYBYRvBMWOsSoNpmL3B4gmK7Y7TX8QUGPa13qwVVXIB7FFqiaxXidb0HIzNyUBhbeDA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWtzop1xtczHY8PmmOlBMfBEVyML39dqVFAFUlyKjEQERXj3EM
	GrgIsgMWRsnlYd6GV10HxLUgAxMNA1XWH8khDLojHtMbi9yLHqpmpdoMusRzyztO5RY=
X-Gm-Gg: ASbGncsGMQ89llJqn2rQp6gfpkdV52Vq9wN6MTmDjgm/C/qHUIqnHnaBVskGM/CnDp7
	yYV5LGybMPELi2ZHwQs4IyUQBEGzGXEz44GkEdU1jepGBhdX4KnzeNa483Ev3woxcUFqtHkdhL9
	7YYvlsj8YjoKX+HESCiTyxCj4PwfleTsvFSe6VKdb3cDOoDNHz4iG4gODWfdYsDYBoDKgJ7S73Y
	PHOoJEa2IrPGM8T3cKevUKcWq66nDaWokKEp7N8NxQlqYORHZ+JnJMNEDd7EiOjy8OIfyCkdJPr
	rXIDLdnGOrkElVQe+hvoEm+6Dt7atTMs6e0nGCEP+KIgk9RIFlnWgJ/qIy+STiOdrWBnwPqoGxs
	O72Z9YL4tlks0nJPKZA==
X-Google-Smtp-Source: AGHT+IHxs4vjlsnXTSH4C1JU0OK5uY0YpaUonPTvMCQRhAQ03vPs2MAjvWgsEbCbaT+xabScrZbGxQ==
X-Received: by 2002:a05:6a00:9093:b0:748:de24:1ad5 with SMTP id d2e1a72fcca58-748de241b48mr6070569b3a.11.1750248948709;
        Wed, 18 Jun 2025 05:15:48 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:15:48 -0700 (PDT)
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
Subject: [PATCH v6 11/23] dt-bindings: Add RPMI system MSI interrupt controller bindings
Date: Wed, 18 Jun 2025 17:43:46 +0530
Message-ID: <20250618121358.503781-12-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618121358.503781-1-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_051549_674858_51F561D4 
X-CRM114-Status: GOOD (  13.88  )
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
based interrupt controller for the supervisor software.

The RPMI system MSI service group is defined by the RISC-V
platform management interface (RPMI) specification.

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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
