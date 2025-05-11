Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F962C3ABCB
	for <linux-riscv@archiver.kernel.org>; Sun, 11 May 2025 13:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rg2mus7BFs54Ixz2rU2r5BfrE0WNRQ2UK1+YlKoqHQ0=; b=K+QF7MusiqZCAf
	9g4S/lOaWmOa+bef9tvEwOAbHp9xSMB3uX2BiUBSsdr0/lLXD+VdUOOtDbZK2zbcbM60ut2Ceu8Ew
	ALI6CuchfFEgJW0vTtqIC7wrpF4s8d6Sb/rgTpTfxA+zkyZXbvUlNj7KT894UzVa7dieHySbrLI46
	YhvXfPQGkSo8HdnO/Er6u8o6Mlcn1aY0JkUyxjI4+vOFikjhC08fEqEwbTIisxVOXPtJ1xZzTGnhQ
	IZJ5yAI7MGLqblUIyRZeroBvNKz18AFULOdE/T7qAtF/ZyZ3nLk5Ef0sUA2+KeLi6q2QIRhcMqJ4c
	eDlvltBlybJy5Njf474A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6wJ-00000007IDJ-1KhD;
	Sun, 11 May 2025 13:41:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6wI-00000007ICY-1cNC
	for linux-riscv@bombadil.infradead.org;
	Sun, 11 May 2025 13:41:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=yU/DNAxy6LD72V0mVtTg/UEQNRHKlif24WvYR5Aku8k=; b=pxciiAOaCEfcqERilSyiJjcvps
	mlGZBuTcRsq8CkyfEGnijfMoxwLSwR6cvpdrTdTJJ9fH7fAPR0rRCWhF6rI2FhAKLkuAQGPtlHFCj
	GCGbg/VDYPt6vuYT3F9MhUcif96eUuAxk483OTrSn1xybihFLObDixPu2mPKulqt3QTAH3kVKJs6M
	e16YPzDbws90WU61aWG3Zj8cUefw5HaM2rO3Lvh7B1Bx1iQxasJOd+CNOYljotHHb16sr+FFn406A
	RFxPZYta2oCAo/fxY9uEavHLoZltXOArYtARITK7jf8xiUS2WRi9VVSRch7OZQAqKPAiDEOcEAsUl
	g3cq0vXg==;
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uE6wD-0000000Gbx7-2y7c
	for linux-riscv@lists.infradead.org;
	Sun, 11 May 2025 13:41:56 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b2325c56ebdso2576613a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 11 May 2025 06:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970906; x=1747575706; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yU/DNAxy6LD72V0mVtTg/UEQNRHKlif24WvYR5Aku8k=;
        b=hkiUyuRh56ysirLFnLDORC/mrO4hdR+y6qlQnfqGqrV201QaEID4O2M8LYxTf6z6bR
         NOh5odGvGymnbeXa06jJDVdp0GgMd/ED/gBL2eQ383lY4c0wX/DB/XewyFkn+cnhtESe
         DHFovMJTo1Zo30rGUK9ZRp4ukKmd1D5uI0YxX1j5+M8G+xhxE7f6wRZJSxE88uy2YjCG
         mrSREbcCbB2YKUaTYQGzWKujt32/HUcB8vPF1dMDPEgYxLzmycq93wMWWQoT8AjIrjhI
         7i6hzCWMb6sihYbxor9HEpQkEYEAcTBOy+4xwmcyPdbF2gToEbwf48yJfywezco+IPib
         IdVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970906; x=1747575706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yU/DNAxy6LD72V0mVtTg/UEQNRHKlif24WvYR5Aku8k=;
        b=mC9iiM612pFr4mTYZRMJPPPzV2uLOz4P7SpRtjo6zG9I6LMQOo8wJVJjmx+CpjutCv
         SUkmmpE06SOJRGFzEPdPrmR/ETXwXegN2P9ydbnzvjfogDvDFHxK9lvMhskFFNQw6GID
         R5fnpWMXPK2+uHJBFdeaNyqbKmkjzAr6Zs7HPyvl/BNAlGBlHupNHJNa3XvhXbJp9YKF
         GPnzt1xxSzXaBFFP+1GUgiP2asOdMHyBznmAAks6+uL6pcziH0A0+Y/7zFKF40K5IXwi
         NaOMsLhBRqhXFvAJVzFevrLhNOtJ66Zn5+xzon/WNZPJ2xQM4xigHA2eNr+mDsbvYf7R
         MycA==
X-Forwarded-Encrypted: i=1; AJvYcCW4mDH/ZQOIRMFCaRq54y8KURysbNAI8eycHhq7SMTN3r3kIa64cx7gD74WrIpppgMOglTOH4opflgOLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq/jQ2iJiqcGdee11dusyAXpZRTOjxtsyca16lcSWc752t1BK7
	MepSIJr7YOLr68hp+rWm+TyIhTH4pXsbd4GrPA+cjicRUeCyoXoVYt/sqUPdXVQ=
X-Gm-Gg: ASbGncukl5dxB3RYIfFWDYeGdrOnI2+0g1Id7bFQt78nAUgyooapsGsBFiZQ9woJalR
	qqfP7Yy3uCpYHm8psgc2hPqTIaeaJLElvqdAR07D3o4RIEBwb8leQCM70swfVhPKxw7CkQAe2bg
	dpxmBQpj+0nLovxtZuZYDylBgBkqMC7hRTLbZMlUs24zbvTTPO6Tt4DyNNXNKsXXWdznWX4M/E+
	4z79bsY05N/nPbSr9MgyxNyGQHxbBm7Q7qMCtIBaUdWVJpOAUh7Ds5tFyaw6Qa7b4iZgodBL+eJ
	c8QvvUJJ6niueVDjSrlb7Up/wZUNhSLwy0viSrP3juWBLWU64qZGYYQGYzq1LSdI6A8XJ7wWD1H
	KAxLJJX7k+GkvwA==
X-Google-Smtp-Source: AGHT+IEBohvepS89G2D6nGzfwIv2tEC45ULnZjbOGIjpp3b+t/Iny3a9MgChCV/InRq66ah2kQHc+Q==
X-Received: by 2002:a17:902:da2d:b0:215:a179:14ca with SMTP id d9443c01a7336-22fc8b0023cmr119115105ad.2.1746970906337;
        Sun, 11 May 2025 06:41:46 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:41:45 -0700 (PDT)
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
Subject: [PATCH v3 12/23] dt-bindings: Add RPMI system MSI interrupt controller bindings
Date: Sun, 11 May 2025 19:09:28 +0530
Message-ID: <20250511133939.801777-13-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511133939.801777-1-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_144154_021786_4EC30687 
X-CRM114-Status: GOOD (  13.36  )
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
based interrupt controller for the supervisor software.

The RPMI system MSI service group is defined by the RISC-V
platform management interface (RPMI) specification.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../riscv,rpmi-system-msi.yaml                | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
new file mode 100644
index 000000000000..ac13cec0666e
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
+  [1] RISC-V Platform Management Interface (RPMI)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+  [2] RISC-V Supervisor Binary Interface (SBI)
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
