Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F7FC83030
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 07:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tNZnuvmGBAC2Fr/wH8nNlOCYbjGeBs7XMHcb+hvrPBs=; b=ksduVGtXC8jKOH
	kOjfXezaDp8UXmENfAGjN8Dv01HKI3lO1vwB5NTbJa5Sfs3lywDe53VeoDpzHf46zV4eAjk605uvP
	ilZtoypGLGkzflkujImbH1AIXRtYLHxPs7MDscxa5tlPTY9QA1PsxmSuhbVEJwF7sVcXtFtuGn9Ab
	XeZZfXQdY5f7MtRFX4yhOqrH9V0efs/JsPN4NaA6OqQ2ZuUWvtLyVoxuztlo0x42VnC6OG3x+hTkd
	OYgcGAtppgyEH7rfPuwaXISufLoN/nc3FnvQFXhQOw9/t9Z+iXWt/5Vbhwv4265Caf5a9vgGgLw1N
	8RmowkjNl0fHJ8NHtGrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaW3-0000000DV0t-0yry;
	Fri, 04 Jul 2025 07:07:23 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaVH-0000000DUiD-41xY
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 07:06:37 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-313f68bc519so632761a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 04 Jul 2025 00:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751612795; x=1752217595; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIoG0/2CSPJ7QI1BAwRn3+gvtI7NC6tH67IoLVRWsu8=;
        b=EqcKBAIGtfKiAewLQ/oVKms1qBHZwA0wkisBfvQZcKDpU9KCyi+sgxpnF+imY7BpJh
         AbFuSKHwJ6nEqE01L9Q5r6WacGKiGruk2+c0nwSrhkTDsVkV6LAfWikU0M+uH786e5Cs
         z8VpVGR0DlPdGw5erVwEK1g9pPmnHCaCjngtfv/B0pVlAEubQ2hLX8F1QkODvboSxsG0
         8dfXVk29rFTRIjNTFiKybvCbMdsKVFj4My7M0WLOoUJqLxIeJ7ppWoLcFBawGyKZfNCK
         qZcy4Hj02UT85qGA3sU+8T84TIBX8TCoiWcrS78uqGSV2ktuY+3wOeXX/Oz2Vpu8BTnH
         yt+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612795; x=1752217595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XIoG0/2CSPJ7QI1BAwRn3+gvtI7NC6tH67IoLVRWsu8=;
        b=vmoyDByG3DoJK/7/lTdOAE2tC0Fbe4GognJ+xvhnroLpwsDuR626VubtJ4iuLBJGHx
         n7LoyP6NdfOBhzedHhmTyO/Y1lLqAdgDVZRxJDYDaI7/wA0YIDwrDAGYN5zEGpyU2meM
         A6ZFv6lW7N7bvBo16Vx/gOB69gQVAbLt/jwGNgKCzVEsx76BbbzgwHJAOQFj0QrzWxDJ
         5dOt25VOvcNV3QnN+MEqp9miMKt1RKYGfbeqK/NNzZzefwX8C/QbQjU18nw5ua0IIKlR
         K56Ld78Fw0ObK3w1RWMxSvnI4Up6Hud3IkNLC7WegKl4En6oYRsRPC3t3xGKM0LolN5z
         12sA==
X-Forwarded-Encrypted: i=1; AJvYcCVhr5jQwm9S5n6fjeH0YT/XYuYUhkOeGsQhFUWZXehGnZ3VC6XMNIjrsMx4lrXsyPpAOcy3l173YwShtw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwtcQG3IPI2wplAnL5MF4Htucvxt5ASb/enGbjZU45UtSTyCqLi
	GoCa33xNxsOcalo+bnnRYAyp6zLisXGIFrWZB4vYLgXRU72SzcBXX6O9wDgR8QRl1do=
X-Gm-Gg: ASbGncuZqsg7HgT1A4jOHhv8o1isFd5mGJwbLGWSdSMGPstQegupxKPN1TfsIrBQByF
	Z3N7UzHkrODTuSXe4oKeZ8Ntd57yiEIEkmD1yLohXj2wDd6et/eyVBy+59Pznvf/iQMFR7puiLJ
	weKUzNs2RwrSvT129T65sGGp3E+Pg8Ze892TLxNRRYhsy/vPT+Bg3gkTvFedDHd9JFhuDLLYDey
	AUcrslfNS8XRCW32QJ82M78GY9EiGgTcdFy3aAc+3MJsp5F/+1dqdlyd2tVhG/oUcir+RmqhC4E
	9ISXYP8m4pxakgVypfXLngSCJpWeDt6A0PKMrRyv314zR+56matbJOIDuYCXQdkPp/ZrFAujqYs
	sCQLP7KzT10giVv6b4M7uzCoqLg==
X-Google-Smtp-Source: AGHT+IEAV0Fc7OQ+p+N3aeKR4hWU5j0k2m9hYRe0Cek5o/FhAH46ghV+wLUFg/vBseqqFoDBfYSrAA==
X-Received: by 2002:a17:90a:d40b:b0:311:9c9a:58ca with SMTP id 98e67ed59e1d1-31aadcf4c5dmr1655175a91.8.1751612795169;
        Fri, 04 Jul 2025 00:06:35 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae59a93sm1358697a91.12.2025.07.04.00.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:06:34 -0700 (PDT)
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
Subject: [PATCH v8 12/24] dt-bindings: Add RPMI system MSI interrupt controller bindings
Date: Fri,  4 Jul 2025 12:33:44 +0530
Message-ID: <20250704070356.1683992-13-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704070356.1683992-1-apatel@ventanamicro.com>
References: <20250704070356.1683992-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_000635_997373_A9A1CFAC 
X-CRM114-Status: GOOD (  13.86  )
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
