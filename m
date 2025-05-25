Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9E7C54E90
	for <linux-riscv@archiver.kernel.org>; Sun, 25 May 2025 08:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oNA3q2cBXTrGMtCmCE2R/8gztd6dYg08WJ26rpx8k10=; b=orMTAaHSH04UXF
	kg5TrEOZ2onIF3DUK9Fs3YvhseBCjJAKcyNUvcSjZzqbHIch+Dpe9MZxg4pumVFE/LhAk3L9idTvf
	PdMSRGciN2IFDYlMDP4VUwsUoCjkS3FemE6t9pKhTWpf44dRDXqYGO24ZiYziTVKsBWqEcqLSLoc0
	QFZlbk+T+jZCbpB0OWXfo5nIzOSnxu3ODqVL0+aS57YURJmXeQCBKP7brTuEVlC6uNTnYxQTG264q
	PMQO5hch9R1T9dxWrxAAMnEnlBSYuCNew7L+2TC03xFiA+27Fkgsh1AhPV/9nuiwCFtvwProCtcWh
	LIT/EjVihtbE9I0/4rpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ71P-00000006mLj-4A5Y;
	Sun, 25 May 2025 08:47:55 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ71M-00000006mJb-3Set
	for linux-riscv@lists.infradead.org;
	Sun, 25 May 2025 08:47:54 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-afc857702d1so946881a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 25 May 2025 01:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748162872; x=1748767672; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrq/ed0KxjpyuTfPVgQBHoRGk1JS2/KTrIUQ+VEc4ns=;
        b=H+Y/IjcO3CB0qQQTjKNTZCFVlJ3gZqSWgM4i10XPX8lZPGvqRnDEN9ys/0eYAZnraM
         H56IX5e4d5LON5rJ/x0v79bvDfIhJh2UEIuzu/d6Fjl9jvdU05mvam3iE3vmhcR96XWh
         2o153krFyd0AGTyl3hah9+UTnLqMCD+3ogUwFan10lqkgenTjE4HF0PlIUg9KIqGf4Yo
         bWJZPIRQA/e+V+nL6WKbAcEojzLYgQU+o4+XmVZV/N2BaJ8ZG58R9C7OlsegKMSzziA4
         ivn6Kh0g05m7ZE1/FmRdHsugsPGRGeKKoKP9dtfXBK/1h9UNDP0U2bjUTlVznwNp+RML
         Kbog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748162872; x=1748767672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wrq/ed0KxjpyuTfPVgQBHoRGk1JS2/KTrIUQ+VEc4ns=;
        b=m670p/FIPEHfHLSIYmgSVHX+MyhgE5sjf6hGmth6CUY660eskhI4DKziteff9wtKoX
         WYC+bRhDzn0r4nTH3qtH4b+dq5d/bKOBDZ1X5B1vg6yLS9gIGNkhhgguLleyUFluInvs
         ljjuOrD2DcLNd/xLF8Q0U6LUQe1gbu/LVkXNxB3wjS+JP5UAS9XTgQPRdBCpaKfv5BOx
         rJTcBf3vHopPtpNi/vFdBAwBKgCaAPxZGyFbS9VdIALX5NJAAi3oUV3PDNHeWwVYqmaQ
         7tToK/Ao2U6YI6+aTpm1514G7v28siexbLsSSrYSr/2VNYiEISKVi7Byn/Eb0VAzpuuu
         Ndmw==
X-Forwarded-Encrypted: i=1; AJvYcCWixl6uzNVNyMJMNy9kw6JqcQV3bI6sOZV610tjgavPlMGECtF/lb69I0XWWDjE/M64wxkhAoQ0XDZxrQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhHGKDUIvxpBuMfAbnhfG5Z4EdShOkCMpolI3EJiqGYGKwR0NQ
	ly4LhriBlJJ1btuPecPN9Atmz40g/s/qefKPIVXrx/lvVCEeIzpw4FXi2cxvOs3xZ1E=
X-Gm-Gg: ASbGncs86LgxHzNsYUf1u3UIlHuUUUf7/ugQqjO0vNksz17WI6ASVL7ovyMt5kKkr0O
	nv9OEAWoy7RsBJKwRVhgZqvD1QyJKsrNoR4/Vx3ycI1JpKui5T6db6+IW8J2Z0LnGAKHGGSwznv
	KQYIbfxmSBms0nzTPUnKig6UQndXRnmz98IPDGG5HJE75meMAEmC10mDP+NR/AuqI9ehTAxMz3u
	60wS6TQ+5jd3NM2FSFd+Lh4bwVE3DmkYE3R0Bu4QpcGPMnBe7bb4tUtqDv8uFUXSQxZIwkgAP/n
	Kr2AUow7XUG5gu1Fx0/9rYj5yO5OVMWb/fah7m+7yxRqgbSXAZO8epzk+NJqm+CgizOxfgYH6Qi
	STEigMx+k
X-Google-Smtp-Source: AGHT+IHKLRkxyGfdlCk8+5+RKFhUy+GVM25vCTnqPcFz4//nByaA4NGGAXm8aCo5Q9FTRRl96NH+BA==
X-Received: by 2002:a05:6a20:2d1f:b0:1ee:e24d:8fe3 with SMTP id adf61e73a8af0-2188c23fd7amr7909301637.10.1748162871787;
        Sun, 25 May 2025 01:47:51 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:47:51 -0700 (PDT)
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
Subject: [PATCH v4 03/23] dt-bindings: mailbox: Add bindings for RISC-V SBI MPXY extension
Date: Sun, 25 May 2025 14:16:50 +0530
Message-ID: <20250525084710.1665648-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250525084710.1665648-1-apatel@ventanamicro.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_014752_865554_BC453605 
X-CRM114-Status: GOOD (  13.73  )
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

Add device tree bindings for the RISC-V SBI Message Proxy (MPXY)
extension as a mailbox controller.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/mailbox/riscv,sbi-mpxy-mbox.yaml | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml b/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
new file mode 100644
index 000000000000..ad4c135e0510
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/riscv,sbi-mpxy-mbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V SBI Message Proxy (MPXY) extension based mailbox
+
+maintainers:
+  - Anup Patel <anup@brainfault.org>
+
+description: |
+  The RISC-V SBI Message Proxy (MPXY) extension [1] allows supervisor
+  software to send messages through the SBI implementation (M-mode
+  firmware or HS-mode hypervisor). The underlying message protocol
+  and message format used by the supervisor software could be some
+  other standard protocol compatible with the SBI MPXY extension
+  (such as RISC-V Platform Management Interface (RPMI) [2]).
+
+  ===========================================
+  References
+  ===========================================
+
+  [1] RISC-V Supervisor Binary Interface (SBI)
+      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
+
+  [2] RISC-V Platform Management Interface (RPMI)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+properties:
+  compatible:
+    const: riscv,sbi-mpxy-mbox
+
+  "#mbox-cells":
+    const: 2
+    description:
+      The first cell specifies channel_id of the SBI MPXY channel,
+      the second cell specifies MSG_PROT_ID of the SBI MPXY channel
+
+required:
+  - compatible
+  - "#mbox-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    mailbox {
+          compatible = "riscv,sbi-mpxy-mbox";
+          #mbox-cells = <2>;
+    };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
