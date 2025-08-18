Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B484CA0EE4
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 05:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tNZnuvmGBAC2Fr/wH8nNlOCYbjGeBs7XMHcb+hvrPBs=; b=K5G7dDL+3GzmzM
	fufn8fX4NVx2CZKCMF8WabwQPO+hBBZXIimXAd1olvYb9U0coxRcj76IUIbCN6s7IrSKSmpckiRvq
	56w6Q5q6JcVRQQUwWzYgocbyGj5lIQBQUOL/F5d2k8JCmljUAHl65YChWDm69vaDcFSLEGBBWvble
	56jBZnltLfNtoHELZPC0CqtLcS1mtm0sOVIyqnDlEgz/eRU6SF6kWDeB4ofy2MJmtk5jlCc5Wj647
	omsoVyw9xlHYKyIirdliDBHBKmCLEkVTBX2ogRQXtc/qwmsl9Ct9xIIBPKuoxiDYUkA6vwGHhlx1x
	Za6QgyszLTGkn/GWQX+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unsGJ-00000006XAr-205E;
	Mon, 18 Aug 2025 05:18:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrET-00000006Rcv-2WHL
	for linux-riscv@bombadil.infradead.org;
	Mon, 18 Aug 2025 04:12:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=XIoG0/2CSPJ7QI1BAwRn3+gvtI7NC6tH67IoLVRWsu8=; b=erYfL2VMuXZdG9ueQz6EALgHpO
	VBmV36LYZVY/sSm+8TZdR2txw0ffRYuqzWcM0FpYuTKXvwN5JytEow/FzC44TpHKXyQu/GFeeV+as
	9pi+ljWFPimP/Eu6g45McVjwszR3Bh7Mww6rIx3QoXKZ0tTxgd4nwJrgRLZiNH6jvMTcZsP3LPdSo
	kFN1r3/Gc0R+fa8emxTjW2XyQVsxirwvZcSl4/y7VMKEIu7MQnEZtBIgZtO7amDPtvagfwUAbuU2d
	oXViw996DtxlBoCrI3/mg+HWyrqIqoiCGQQr3odUfB7VKKaOATT44nVfAsz74st8caLLw5d05QpCS
	pD+Yy5zw==;
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrDo-0000000HE8s-42OM
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 04:12:14 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-323266b1d1aso1980968a91.0
        for <linux-riscv@lists.infradead.org>; Sun, 17 Aug 2025 21:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755490307; x=1756095107; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIoG0/2CSPJ7QI1BAwRn3+gvtI7NC6tH67IoLVRWsu8=;
        b=g1b6E1oVsOqsLDj0PiW7YivV5BovHdUvszno3zVtrClKXJeWEju4xFJoolsHVwtap6
         lrhRTx+wQb0R2Vj0z/WEXo/kglW/sLXzzrln79Mr+ufJmv5W+s7c8OLMTbOxhCnqB8yV
         8OXrkD17Di4qADoIi20t98XyMdwiyzVzXFPFhzYnyeWhUGomWnR8VOEXn9yes21QELo7
         sSa3pIf1Wo6g5qKRkE2KKlB3HAceGNUaEOuqBcQayRw1GvXQsZEWc69VutPhl1dscoLG
         Q/4Xf/W+q2UtPqiwJXvkztOjNXPZQhb7E98cXBqlW6XLJTAi9zY34cxRwbdLUB9FachW
         Xmhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755490307; x=1756095107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XIoG0/2CSPJ7QI1BAwRn3+gvtI7NC6tH67IoLVRWsu8=;
        b=GjkUMJB5p8dQuFbY9xE48zasTeR2PO3rin7+s3StgRjDE5xmGc0wvqzS8+LMydBGRQ
         1a2PvSLePkbCD2BIBTjcEY7VZr2/pX+mXLNEAfHlkREshmBvV/RBalg+Qa31ch2gTlZ2
         2S80Y1qCLw9QNPGNg7NAEDup+TjsSH1o4zu/WNf3LtAg9XrruRL82aBMhnLZCF8iw1ns
         gS3xAxH13bD86F2nRyOH3x8YTFoaAdUtQEgnKR3c+NSaWKBiNVej76xPE0MHcXdw1FSw
         a9+Je5D4jMkc2D3Os0ZPy3PZnQaXtIWQ1x9bNi0laTJt311vguw3yNAJJCKnhbDF8Mt7
         JeLw==
X-Forwarded-Encrypted: i=1; AJvYcCXdLPMu7K8b6tKQIp0+aLJzVX3nnZJ4RXHJY8sOWOuki1Vn1Lh+1WUlxwZ/QQ72AKBIRJpFZ0pSXGadeQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzIdLrQZR/EKQfFhWEzwSiFHxEcIqewTqhdVF2Viic8UeTwFT0U
	z2lxcy4poDHlBa6BZrZrt8fHc2nBa0ewgVx7/kwa0wjvSotae0FNkgWYEOBeUGJWV5k=
X-Gm-Gg: ASbGncvTmfuEJML0RgDY1JTIXF/8mtDBALr/jZbds85mZ6PSSQQQhmr5QoVCVVbMVLV
	Gc2qtjVotcFc9WB1c94TCsM0GATFjtLNEeq4L7j6RfDNWuEywHClAaEB++8nRgr44a9EbNTQMX4
	jMRj/v36ozI5wNcAkGNA608AWN0Ttg4Iq0w9sxiZBuQYBJcWuiwX0PBl+pCxq9NGpr3f3mY/66F
	jCaHDGqciaEtZRnJcCmmb34P29ulI6SezKDTICwI0qecxoLqqa55+R8o6EgIutJ6LGT1Y2p+muQ
	/1Fs1kjPCxrHe0DK9MM8+1chC01O+PExRHzH88Ku6oRRDbHkMBosWTHYaXA4BdJsFbmQ4jp0LET
	SZDZHmukMWxkTj++lx3mMpWKfWEUc5IIpgzAdjU8zpdklALRg1kOnHw==
X-Google-Smtp-Source: AGHT+IEgAT9AYq4pQahHXmwpuFEuM/W9qCllak2PA0hDXHdQU0xExFRnQJZQzNUnJraBHIA3ajZAJQ==
X-Received: by 2002:a17:90b:3849:b0:31f:d0:95bc with SMTP id 98e67ed59e1d1-323422386bbmr13467205a91.25.1755490306539;
        Sun, 17 Aug 2025 21:11:46 -0700 (PDT)
Received: from localhost.localdomain ([122.171.17.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c70356sm6560972a91.25.2025.08.17.21.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:11:46 -0700 (PDT)
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
Subject: [PATCH v10 12/24] dt-bindings: Add RPMI system MSI interrupt controller bindings
Date: Mon, 18 Aug 2025 09:39:08 +0530
Message-ID: <20250818040920.272664-13-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818040920.272664-1-apatel@ventanamicro.com>
References: <20250818040920.272664-1-apatel@ventanamicro.com>
MIME-Version: 1.0
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
