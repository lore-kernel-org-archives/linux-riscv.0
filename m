Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C90C54E90
	for <linux-riscv@archiver.kernel.org>; Sun, 25 May 2025 10:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gok9j4shl08+BFc5g8BSo6+hGUC1c//bECSTPYrNf5o=; b=xp0wTXluuPJAx8
	EKm2VDFYDaiH5RxmJfyYVhIimnruPURzT/c306yDUvXboZbBM9UZmJHNnC3co4/3G9LQXT1fSX4iq
	6szqoPb5o2wXAwKjvPMF6J6JR7DiDgtIqC5WzS7vvB/JP01qk6YSkeLlix+wqUt6adPRsF28qkFYO
	vvLc0zBQXI2eysotha/MuKWXBlmKEOXUvCm5bGTCkqBjKueLCfZbAJTkiuv4pJtR31XDcApzxs9UL
	gQY8d975D8RkZaf6nYyh7+lydCKC8Ql9Z30u+6Z0HEhfe77BuRfRqfanDdD41l8oi/cqwtNbApqTX
	s+IND2BZ60Wj45bBzA/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ8D1-00000006vKQ-1q7R;
	Sun, 25 May 2025 10:03:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ72X-00000006n4t-0ZuH
	for linux-riscv@bombadil.infradead.org;
	Sun, 25 May 2025 08:49:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=GNEVmZiv/q5DSw1yW2Dhni3TymNMhn7fmeMDnXK+LxM=; b=FfMegDgrF6uFxLf7Nlp68GkFQ2
	mHyLer4lThx2+qato95eRi8KRgUj4R4D3GJNjCO1z0+d0l2gNDxQMYHfCi5ViiFNANwKdw0kG1CZo
	6+IXiYDn4SlgBKTXIGCmc/itiDRCkXxfp2YIRT+jNeojlJTi3dl+Z7MgKejn9RfbHST4kBcv0tazq
	CRVb8JVM60/VnLDuh4xgArkcNVPRTyAzXBvF93Cf+aW0yY5273DUIABxJBVPzp10cpgHTfNK/lZc6
	T+hM2csaPOJhZmaw2nSqEbx+4I985n4bteMnBTNK1zkzAiycLPcykvdDBBqZB38uqhqIkoVwGsL/i
	Kdafg3pA==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uJ72R-00000001Ztl-0wPB
	for linux-riscv@lists.infradead.org;
	Sun, 25 May 2025 08:49:03 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso840026b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 25 May 2025 01:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748162936; x=1748767736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNEVmZiv/q5DSw1yW2Dhni3TymNMhn7fmeMDnXK+LxM=;
        b=K6askk3nvaEfRdlRT23NKG50elIWz3LdSil2Xmx2gtuAfaJL7JNvRbKeq2+XHgCUQh
         BfCAfCR61eW9GHPByFP+MLrndCLld7Frkd73YoIY0o6cNTWr6ju4+UVKW9WhYkyLztpQ
         UgJKeR/k5Dl+NHvUzbAe9gNycBgKbl6QOyy/sNcRUYD/l+05jJtr6EBw8R2glqJbDBTq
         hFKweFib8kOvyGkrMHIxAgcXztvhSMNlxy1sTxXB/yDLdhFNfr/K5m4CFdNqJjOhWZf0
         keCS5Ly0Tc5TsF9OOzxZS32XybnVcW83StimKZ00H7tvDG2qnuTojN1NWzZNx1v2YWxY
         5YNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748162936; x=1748767736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GNEVmZiv/q5DSw1yW2Dhni3TymNMhn7fmeMDnXK+LxM=;
        b=GoK9BiVX5DSktdRYmYNXu+uCqUy1CmQ18WzUW8TMIw169KOZBaW3+K0Mj7teq23MRr
         4JAJByVRoSasuxtjldRN25MK5I0Q4cxfhOJzSK+7qdDbUyjrmyEkgCabA7JGRZauwvla
         VyNYQHJii709dsCmAa7tJnxhMvw5zyurCGDB+vZT0aH8oVnNgw0bqQA9Vv3W0syfSp1x
         lRU6NqDrwGyF2T44hbu8ft58zqWkXsPHH/tvg0cj7C/+B2+GeC8d9g2KA1kcRhCYkrzO
         dqJ+UIHwj3XAWameCSAgCKVE7d86VTX0DiMyCBS9ILEJg4pT/O7pXAAg/bYtbYK1Blgm
         Lw8A==
X-Forwarded-Encrypted: i=1; AJvYcCUHWBAzjVRBIGNx7y4o14a3rICX3GQ3XfetBQVMtbZl3R5ixcy3yEasIrGCLegkzTyfknj/R4hrl1ob4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwiohlU8IrIk3rPGxRkU/yXHylYYQQn8A1pRkFdOpDyTtZHCy29
	qKU50yNcFYof9IHSYOloSCiQjTLdZpeT/jIbBZx+cJLz6HKQ2q2+eq+uNbBgZja06wE=
X-Gm-Gg: ASbGncvGgNXLSTQEojHBe3r9RkRkRHwnPbmBSSpPxUWKwBJsiJTjDkDB4kUrRrb5/C5
	NKuwJGCCZEDbyj6HQrVTV4hPlVhY8nX3CHwepRmQl5uA9tKoSut21g8QrT39EO64iHvCLbTWK2x
	A829kELM6849nwdfnCZZ4YhepjbFjuyV/IJF1bmaPrwpxTN61hHANSWCI+dNXp69AeHh2PxHWDt
	nvCdWDw8rKDRYTDDw4OP2xELqTrV075iUJPx+HmA6eQyAZE4kVwK8g4ehcLmYFkKPEjiSSPsGoR
	srdHLGECI2zvunG0/r/784Le0z+CmvkA7cguwn3z3EjeoqCwRCsIfNajbf/rGXAT1fyJnKLOKsD
	o5ntjIzj2
X-Google-Smtp-Source: AGHT+IEiTXrjYcEqxEmC6dICJ+WKkYuwNtth0DfdUxY1SK4VyNZrGaohTDwGZlxxDYkeIS2os+CWiA==
X-Received: by 2002:a05:6a20:d486:b0:216:67e:bf09 with SMTP id adf61e73a8af0-2188c29943emr8460905637.22.1748162936519;
        Sun, 25 May 2025 01:48:56 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:48:56 -0700 (PDT)
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
Subject: [PATCH v4 11/23] dt-bindings: Add RPMI system MSI message proxy bindings
Date: Sun, 25 May 2025 14:16:58 +0530
Message-ID: <20250525084710.1665648-12-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250525084710.1665648-1-apatel@ventanamicro.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_094859_593080_52C0CFC5 
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
