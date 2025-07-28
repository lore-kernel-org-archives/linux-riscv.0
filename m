Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFFFC87FD2
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 10:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tNZnuvmGBAC2Fr/wH8nNlOCYbjGeBs7XMHcb+hvrPBs=; b=ERStYHUwJLNEDO
	I+apcsmGlS3K1BZqshLUQxWl7BTe+CcV7jpozPiKrAVSXa2RZvNANczMU0AcBktvA2mp7vtAQJVAp
	ko0amiX3bWeIoc9m3UIxppY4lDwunwFjUe+Cq4972wHkXGeTGcyt+mlffFXloj93i1Rqc8d10i2+d
	aNd4J4mfCDr3udBXsdvCCIC1yYamixD4qBxua2976bdYthP3EBtT/wZf9dJ9BEtSiz0WRpduPJl1b
	D/MFH/JlVh67aEvqvk4MA87Qg8vdqrwfifIx6F0gstNOPVKgU0y1UkQ5iUrmIT3fcmL01E7cEZn7O
	mC7gAfvO/Oe1iOZadFNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugLY6-0000000EI2T-1ras;
	Mon, 28 Jul 2025 10:57:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKNv-0000000E8aQ-14zs
	for linux-riscv@bombadil.infradead.org;
	Mon, 28 Jul 2025 09:43:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=XIoG0/2CSPJ7QI1BAwRn3+gvtI7NC6tH67IoLVRWsu8=; b=kY4uUiDt2MSRFBGBRS0r5ZbWfJ
	YpieS48frSoNao6lToS/Bs8edNNuu3OYnw3tkiNnlr4AL8k927mLYDpG1eRAjvglnsOkNy4EGrdkn
	A2VePyY9geqLXKo+6TtySsfyVYJymDV6GN/RLfKNqvOhgydzVCgGK3Ew4dhNkBFhu32HuTvPPN4fP
	E4e5uiOELicy4Rtydc03PPJiQ0mZ+mHrlStnKVeheZuBDVgs3he560oQRYESwkV6uyAJF7QPfNdS6
	U7FFMQm6UKaUv4EANJKw/pY0rlbEerWN7OqJQSOdBTdwWIzCp3SW7aj+ATS7h/hwfj2LY//2IbwCX
	S5+Qx1jg==;
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKNn-0000000CPcS-019O
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 09:43:03 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b1fd59851baso3024419a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 02:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753695776; x=1754300576; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIoG0/2CSPJ7QI1BAwRn3+gvtI7NC6tH67IoLVRWsu8=;
        b=fwjRFuj3VPzknKNPl1rwciHhamI5DFKchZrDMycixeF+MgXaaXpZZhahNhLM8bquVT
         h/9G/FC11aBrjmtJZ4msJvdVbSfLoVZGqeIIYcTQfbFAi1smSn6LaS7xOj6EkVHbcZ10
         9m57pfv2iKC0hfgZMWw5XkKyCic1DmhKY4Ubzo8Y20+OLJQKahNPewiughOSSMHEbx74
         /i9Yinu9Q7rJmH0yDN53gTyNO++NsF1txrNnJOstkI8iwsnxivVEt/KqbYNHrvOrGy4B
         qPlSkX+7jSMWmwR8Mbrz7jFFCVByU7F1Qj35cWOEq1pXxUNM9Z7oQIF9cSRw1HRB962Y
         kEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695776; x=1754300576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XIoG0/2CSPJ7QI1BAwRn3+gvtI7NC6tH67IoLVRWsu8=;
        b=BYtC9bRMQIDbK6MstNvUeaflxufBYofdZeBEHo+DiiwaMUlUN5lX5zQlZU3hXI5RuA
         HdHKkrTJRFuu5r+em7A7p8Y8ADPGY/v93VLBGfx7kqrbqavQLhoFrBpE/MmepTq48Fny
         QJ3uaG5eJaUTGspvytVg5lmQhnYe2o+f3jV+ppTfSLRQGABIk4g8N1Bx21VckOZOYNld
         JBmAGYBwc91m6EAuQWQP/USgyc3hf91ffbNoSga7E4ndF8HIUaqaeDxOWfXAmpqd1VAK
         MVDUhrQvQu2PC16H1Zt4OZq2UjGpn+RhIjsqJPFX4CWMMlti/BsBF8/1Fl1WROPt2d1F
         +XiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxndeBRKZxyXrIgnm+0F+fGLLMIYLdenjL31CliPI4CjT6lvC2hV/w+MDFw2TeSvt8hBeOucOpO8a6lg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyWq1KX7PQuwqjafXh3naMYnjdy2gYe+XNzJlvSBTTuT1Po3n7i
	4zVXQKNQq71GArenlnphZJs+xQWYV/QAz7FiLnk9ZL0trsUOeppekBpjMOSXIUeyjDM=
X-Gm-Gg: ASbGncsG2B+afQ44CpLdZahz6qUif3BblCIMiOAS4xScJETxmZ0IiTqoVWZPG8CJ9cN
	YnCLiHP7AJ5azSpjN0MqNdKZ78EzYe38r7Bu7d5koRj6mX96QMWg3t7VN5aV6s7m/vy4qUSsx4z
	hFM89MS29dEY/7Y6E0YmAJOsNEpfWddAkV8aIMHMTHycBMxKLREMTc1R9Y08n86RYgUayKta4Gn
	KUt7g2ikBCnKE2PYAQ5zBMiS6iWXqScBL+3DL97PGYzQuAlLMjbUit2YANw/3xOnIKoipmGwYYG
	iMTUP6h+nv2se4tvLoSE0BV0lcT6ZTqdC1iRErKVvWQGKly+ME++U37sqEDzVnMeJBRmQAf/st9
	QLw+A9gqIdOSUnHdUjT4U6/4VzofCgW8ubf94gJsWbyjma6wwDQvO28Szc4kIRyXoeJZxlcA=
X-Google-Smtp-Source: AGHT+IE55WnQ+0hhA7deATb8trRi0xgCBfiD8wcO0VoqZffzpD+pSQGytlvo6enrgswNtFBESe1LjA==
X-Received: by 2002:a17:90b:35cb:b0:312:da0d:3d85 with SMTP id 98e67ed59e1d1-31e7773626amr16294249a91.6.1753695776305;
        Mon, 28 Jul 2025 02:42:56 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.19.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm5396230a91.1.2025.07.28.02.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:42:55 -0700 (PDT)
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
Subject: [PATCH v9 12/24] dt-bindings: Add RPMI system MSI interrupt controller bindings
Date: Mon, 28 Jul 2025 15:10:20 +0530
Message-ID: <20250728094032.63545-13-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250728094032.63545-1-apatel@ventanamicro.com>
References: <20250728094032.63545-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_104259_629219_7E06AF40 
X-CRM114-Status: GOOD (  13.78  )
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
