Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE06C02192
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 10:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GMYHaXjhzrGJKYb1NmhwfbCYsj3esRQv3P3hbInzoKw=; b=qFDElwmTTNQbXq
	94s/nFSOlYQN8Dm9zfIGm25bjHzZIJ23fhRbwNEhjWd7b6greN8GT68OYk7cbJ25rNXF/05FQR8ht
	abKQFpW5cO/7+84cA99h4QEKOhMyBt2z29zEAE8qeHXAE5ZZ8GqCR9u/2CDSCu8ELnxE7RQIKgAl0
	Cz+weAsefDJX7Begvmjw0WfyNktm0hpL/eSEd5Y8jxgFeUqz7zE8VR3/7ENZXEvuASB1pDCa4XE66
	kBXD27LD/zXZ0/yMww4lg2yHGuVEZZJAWYzcjll0jFI0loXDA61r7Qdp7Oe8m9XpXIx0zajGewlAy
	Z0GuWxH2WhdHVWGStyBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tetG6-0000000F3wm-3258;
	Mon, 03 Feb 2025 10:00:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tesB2-0000000EuVM-2C4N
	for linux-riscv@bombadil.infradead.org;
	Mon, 03 Feb 2025 08:51:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xvjolPh9gzwNtAL7PAOP6t0zOgR6ztGKXQcTpBeekWw=; b=OzBIqei0W1zKZz6bnaTuB3fzz2
	6TyF6+AVWzMZF6T/1sXAFtaBPCVbHdKUpY/15nyP6BpUYnGxJOBq7e4eD+UffQD5bGwlgYI7IcHW2
	ce1C83UG1PbWh/0e/Mstkmfl7hSkafHsAEhQPQeloDevamyOjhxv8tKHTcqUxq5IGK+oI09EXTR6e
	lyCkTQtA1bAAYJ5hnCqNlJbb23+WgZ/2JMElnVsJ2wbyzkEC8MkKtZ7AkkMicCj57cWoMWdJ/XwC9
	0BpPIKsRv2P2TXOtiyjsJP+Pd3sBU8plZM3fTLJOkjv4MecOZ/ktzkBvr+0dAElBAyLt/yHFtmhaZ
	TxDKffEw==;
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tesAy-0000000G0wy-3gMn
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 08:51:31 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4679eacf25cso26960811cf.3
        for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2025 00:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738572685; x=1739177485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xvjolPh9gzwNtAL7PAOP6t0zOgR6ztGKXQcTpBeekWw=;
        b=cJjkD0evz2yEuf90xPl7WjYKgeRvo8wBaxOgfZ0IUOvV3EIY0OYHuHq9c0UFQvDzFc
         AJ/CHKgYlrdv4ZG9vNlyS+uNB2xkLV5tHwWvZUraZgTpmF3GI2Gu86eLlqWiT3CtJMQ4
         k86dI8ygVwxxgkfEozRBlGRjBCcz/mufrwrl7M976Vv81SX7r9VtFHzyJcDW+4mHsXCI
         A0YzfKKNjiEGxhZuycvAsz0BDwzw3P5dHuELyhfzIP+mLYfccgK23djL67kGlGBkHrWg
         uwUYJBQJX8gW7vwSFz7JyMAcHM9IcCtK+nDAQYqkvw2MXey+E8WM6QOjmeUKwoSEfMev
         e7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738572685; x=1739177485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xvjolPh9gzwNtAL7PAOP6t0zOgR6ztGKXQcTpBeekWw=;
        b=jKK6o19WkiHxLV2TrRJ8tewLEUVhTekz39hFkXOgJI2KCNJqIsQ2dfcl2EYpaxNpj6
         NT0w3mdNHoY5cuhJRAW8D6dPqBf7m99HtliymswX3roUU9vdPvPfdT8cGzQ3otprNxYp
         aRy8LNIthtmB4ziMqV2ynNtEq2jJ/B0tsJpHSl4efWUQfh83U/NIitu5QIqw0eqHZxkJ
         XVaby5yyLIhn2qvYfuaf09+5+fBTp04RcVocTJiEsP56NhTp6pjT6N+Z1z3xjjcD/BL7
         c7Pzm0s3IrB//25LO8S43SaiAIDK6i6atPnJEnWFQ4P8S36ov3VBKsVp5OA2FsvQiCAh
         kDrg==
X-Forwarded-Encrypted: i=1; AJvYcCVTNZA+rTomYrhro4Vht2xK799kU7kS8WlBPTT4o6VS7PoVEjPCCUjmXJKiXU4GihZf1Y3Trg+iEkB4XA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxs7Gu/7lOVTxsjKADp2MAgYheANjA4FZ396FJyqd9YfNWr5XIY
	IPMqsO/gq/GXkL0yPjz3Ip9+52LNEhTLB8N1oqrC2FgQI6TbFLdjhWX92g7wfhY=
X-Gm-Gg: ASbGncuNB50xbKjscwKl2/2YY2lIpa03yfmINL0tjMkX2w+tqh+5w5BxpP0lZ5SgXON
	JYhC1xp020lm/ebYlU2NPF9XWdiGq1FzgSbKg3VScXnzC8/gZS18PV/AEsO+4ImBtm7AEEyIKho
	kuuXn/ezu2jcKK4KlV/0gUoGOQ5WQuXE6Aif9JrPlOp12XMepkJSkfdXhrzeEytIw/o+HAuwn97
	h7OYpemzc9ftaRIFbjf65T4YMVyY/vZn2wlljb42b+XECW8rZ47fRt91DUQywUhI1VCNuaTDxHq
	HMIio/TY4/cvs6CJO2EACd3XeXWdOa3WlNeSctX2VFC8THhoyza4lK0=
X-Google-Smtp-Source: AGHT+IFPm/vGjoafGFVBb0pWO9IDvnrcujPXX6jDysAgsWknrhSPZ6VlgmiZ8V/8drmHUDea6Xx6YA==
X-Received: by 2002:ac8:59d0:0:b0:467:76cc:622d with SMTP id d75a77b69052e-46fd0a13014mr330274181cf.11.1738572685403;
        Mon, 03 Feb 2025 00:51:25 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e3089sm47657911cf.46.2025.02.03.00.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 00:51:24 -0800 (PST)
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
Subject: [RFC PATCH v2 10/17] dt-bindings: interrupt-controller: Add bindings for RISC-V RPMI system MSI
Date: Mon,  3 Feb 2025 14:18:59 +0530
Message-ID: <20250203084906.681418-11-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250203084906.681418-1-apatel@ventanamicro.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_085129_133189_0AA244AC 
X-CRM114-Status: GOOD (  14.76  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add device tree bindings for the system MSI service group based interrupt
controller defined by the RISC-V platform management interface (RPMI)
specification.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../riscv,rpmi-system-msi.yaml                | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
new file mode 100644
index 000000000000..e6c297e66c99
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
@@ -0,0 +1,89 @@
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
+    oneOf:
+      - description:
+          Intended for use by the SBI implementation in machine mode or
+          software in supervisor mode.
+        const: riscv,rpmi-system-msi
+
+      - description:
+          Intended for use by the SBI implementation in machine mode.
+        const: riscv,rpmi-mpxy-system-msi
+
+  mboxes:
+    maxItems: 1
+    description:
+      Mailbox channel of the underlying RPMI transport or SBI message proxy.
+
+  riscv,sbi-mpxy-channel-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The SBI MPXY channel id to be used for providing RPMI access to
+      the supervisor software. This property is mandatory when using
+      riscv,rpmi-mpxy-system-msi compatible string.
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
+    mpxy_mbox: sbi-mpxy-mbox {
+          compatible = "riscv,sbi-mpxy-mbox";
+          #mbox-cells = <2>;
+    };
+    rpmi_sysmsi_intc: interrupt-controller {
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
