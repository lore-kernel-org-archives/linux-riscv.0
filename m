Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9891CC8303C
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 05:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tNZnuvmGBAC2Fr/wH8nNlOCYbjGeBs7XMHcb+hvrPBs=; b=a/dp8cmwhtfjxc
	m3vdlZ6tuAYM2QoB5KdMhfN7v3DM6GrWVAd8Ba58CNWNtZRbjgQI/NDa8hqEsq8sJ13tThCD9Dhfd
	+DlRRIghovwyREuSOJHjQHosGQEUz+YUDqcFAQ3Ur9Ary98DzPHQGFM96WoZbdABQKEYpWC9fUExM
	b1sji8e6oDSkIx/nuNbhsZ0UZQsW4SzPw9w+2Ospm0LvM80ks0ip03Eo1Tv1WZh650ZQYW6VaRGGH
	xlXSthPYrkQifQvfQxvMRvPz40tHwLwECnj/IcK8OFyiOvdyxW8D2UovZJUcGfbuETjzs2xPJvhsL
	Rao+gQE9Yl+PyGL0Llag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWpuI-00000007HRv-2cjD;
	Wed, 02 Jul 2025 05:21:18 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWpop-00000007G3T-0BBa
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 05:15:40 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-23c703c471dso1217035ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 01 Jul 2025 22:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433338; x=1752038138; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIoG0/2CSPJ7QI1BAwRn3+gvtI7NC6tH67IoLVRWsu8=;
        b=cQEV4FKE9L3BFbiLKAnoeR6qvF5DR9x5moLlhu4ftB9Rj8mQsmGEIQ8/n3eVwpBPyE
         DdnnGE3qQtkVix/inf0iu/dAlCmMjt57IV5fmhtnXd6EVZeKkAZCOxOmfQowq8fD7jTG
         pN4SOUm3hn1QuTbsEmvB6Enl8wLMLvJ99owLOWMabuxx5oCTtQvQZWGOf3e3Osy9LWdd
         nOSR0ONYAH+01GY6VWmA9Uws73M4ge5BjaTla0Pl+TL2iXIb4X2bO7jY70ZkCasgwru1
         AAM5+or83nwYGSOvquYeaUdNErfTDGqnj1jfU9cAttnmUdQS6k1AOnq9c9dnWTtPm0rp
         glzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433338; x=1752038138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XIoG0/2CSPJ7QI1BAwRn3+gvtI7NC6tH67IoLVRWsu8=;
        b=nF/X6htKET5ui6Ia8HAbtSqnLi+diWErKfVeywXOAPmHnvsBVjdpqH6Y8gT6lzkrcT
         K+c/q2BvMundQV8fBAnKP/d+zYCo7IFjxKOt2JWOKqYFVpyOSSZ+ssZbkUkowoFzeVrM
         iiyMcNkMpZLo2ydz8zkvTKX9hm8JS6ELpn7eNxNmjsee2Ael8nyI+yb3KUkb4EFk3uwu
         +fVKJqaPzQmOYAcTOd6PGqoStOfdLwN1TiJYyXBJ7m5OBNoq1kk0kILMKUGq3trLautZ
         fsTuFECKuPehPsOjbgmFDXqTtLzxtY9zKq4qobXFKichKXkbAEmM8T2NrHtEiMtQAo+G
         LVeg==
X-Forwarded-Encrypted: i=1; AJvYcCVS/+A6cIzpPBaiK26CHNVK9fmxVYKeOq7w3GFg3XYUlLFwPqZFJPZFNDWW+8+HsDmsB5Rvqj3UJVBEJg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy42H/WFpoIa4judEHi8BE6M8x8bW5GO0s9+iPXd7n7+kKZ2QU8
	Rc4V2Twi6vbsZiv+Cqsk2dS07mn+NlSxgrYvUHhIUUkPT7wHeyKmlBHtVDiIfRMZn9s=
X-Gm-Gg: ASbGnct9ixB6pUQW3DnbxJorNJN3yudlX1jy8RhgjMI30gTftG66YEJ8U/c4rUcHLuD
	857FNVlaJlhbdXDZKK4efTmcWwewCjb3hvqWzYXBzi4cYvOVTM7ipFrcJCjQGoZWVs7sjl1c2SK
	em0WOEGgLO9mTgL03Kf4ypkfVobR2QKy/ZiNc2iLazUO9OYbcng7L5i1ZADDiSpX5ar/MTlUoHy
	W8VXJWlpF7FzGhgUx9O2x5X7rTxiEaEBRcbVIliV3VmFJT2DAwFRGynYMsl9PWS7XYqgggbi5rI
	YgpuM0DFdtr8ZrxJJLf3E4cTHQOkLFXvi+BL9kCU0OghRuhbzHdwwWctYQFSG5+FYIduq61c7oN
	7hrv6ohgYV4tF7JMF51QhGG+wQhA=
X-Google-Smtp-Source: AGHT+IFGXbh9c2Bzrg+n0L83k/iOpiHjIddjs0COzT8LmyyeoGEyCI13QifJfOuXuLEn4svubKrHpw==
X-Received: by 2002:a17:902:d4c5:b0:231:ad5a:fe9c with SMTP id d9443c01a7336-23c6e7eb70cmr19839295ad.15.1751433338295;
        Tue, 01 Jul 2025 22:15:38 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:15:37 -0700 (PDT)
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
Subject: [PATCH v7 12/24] dt-bindings: Add RPMI system MSI interrupt controller bindings
Date: Wed,  2 Jul 2025 10:43:33 +0530
Message-ID: <20250702051345.1460497-13-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702051345.1460497-1-apatel@ventanamicro.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_221539_082409_A93A7743 
X-CRM114-Status: GOOD (  14.70  )
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
