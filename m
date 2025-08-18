Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3AE2CA0EE4
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 04:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MXZ/0j6dl2PwyZL8aBz10l+pQLp0tBqGgWgYTGnzQks=; b=rNeRh4UG+GOhyB
	AWjU4O8vgs9c2s+Tge8v7P2l36/IU+QSu88F47T7Uw7TzJsPhuFMiTE+qVpv8JpbghbefsNtZwB+Z
	h9aE8k5cf1+QwdWY4yHeBMRgyhHwANkljL5TjUs3Y6HqBzMx1tXoSx+YydsiCP8Him6bdfhl8qNNN
	UjQJj6Libb13PZFQtZk82qBkqRp8fD5k5rbu6B3+bWMbg0WWu3ZRJvjIpTv0pre4sotLlb7RYARDs
	u0gQEJJPzzRcHbyE8IaSHWNazABSdVkuyhfRfBmVt2rlRq2GX0kqviff574vzgHSZ7En21z0rwDmB
	1nhnEyGWuBSEnJk1e2GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrCT-00000006QsL-2EtH;
	Mon, 18 Aug 2025 04:10:25 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrCQ-00000006QqD-456t
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 04:10:24 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-32326e05b3eso2565744a91.2
        for <linux-riscv@lists.infradead.org>; Sun, 17 Aug 2025 21:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755490222; x=1756095022; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGFMyHcY75Un2ey32rj/OGQJrYLrfBUEB3tHZxTx41w=;
        b=k/H2JrjkAPczeY0hVHKUjdcim4H9JODN5it2kQpaqq/sGS53Pa51xh/XUC2t0V3asc
         6qPQ2HKKM8dHbzU1/lbUECWv0sZSCFDho2j91uaA4Gb1JI/HGx07g4OulWSa3yrwTKNc
         5Y5I/JI8DNtmfoBTWC9vQzuycibolIRg453ZfqA1oSmY6Ceb6viexaZ10+J40tXCRsso
         mSLOnvrm7l8C78VqaYGQfxCe+/MrOERcxIoeZzxvOobE8hm7EQ5/ZatzjX3jtWPKOHXq
         w1KGGGPox/iiLLM+Pf7jFLzfDJQ+hSIIlsizdaU5hST+/lMyp/meKeUg0D3wOQ+AuV42
         Ol0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755490222; x=1756095022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EGFMyHcY75Un2ey32rj/OGQJrYLrfBUEB3tHZxTx41w=;
        b=Xvv76+hoA6IQlLCBbVuyUmVm94UEB2PncjJGD0IwIX2OKlxmalbPZvAWCbrFT1QEl6
         GszcPWm5VGPDu1ILIYaCWKcgvShLWzQ23VHjBaCOWpGoRtVB77ahhD3CHUG4BoulD7sS
         dQ+eLuea0AbjmkpY9Qe7rhhjteqVL6oKShQSeLvKkQ5wL8YdwCoLXX3aJPmsquRAX4YY
         NG6gsoZVSsTAmDBiQ/v17bPHRy2tM/GTIPjzgAatK4m3RIFEsz6OQUGjw7VxtnbdRDxi
         E/B3Wi/D4UNmO8YLMp2OUQIvpBQOS8wjxfIVh5WwxJvlvyASAOzo1Mm0MyfyF+ZrNQMy
         D2yg==
X-Forwarded-Encrypted: i=1; AJvYcCWx+doR6HUh9iOd/ygZ72heW5AQ2Ytn+XJOtTKVOpz3g8fGyD6gzzFrQoZ6eZPKWoNPYzLxJqpFYh4/rw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzgQ07940uynHjpB343ukCD+weew7WdwXIfEkVMQNF3JJ9GjouH
	thGynXR49y6anvMZj+w1HI4p/ibMZ5jEu5cGBPztmJYVAap9+C7+JJSf6/0fYKWwCSs=
X-Gm-Gg: ASbGncv+S3FKOgrJ+uJWs/oiC0YgEVQ1NYozhHFWeNRtlOzwiPnhlW2LxNE5CnfYHP1
	vgEtDPoCliHNhcvgpylhgFw/DJJwl06z3LfVwK5cF4QmhgbmAQnahFxKatMh3TjZ+I4r/KZf8EJ
	l3gdWGrrZUdu2v8V0SfY9S7ynDOzwwcFhS3IqLAwQYnj48LCN1oxyUecigiZmrCrgZz8FdOB/X9
	FvVDm0h8JbEHX9ow/ehCs/HebdgMbrr7yX7jlO3Zo9Xre8ufh2uZGZ2ll85m7xy9Gia8+84vlM4
	vge4dhCst3dwEwsVN4nKm5RBi8OdngiEkKSCAZbBv8MHP6zBf7s5FLLo5n5R7CNoSJKYquV1NDK
	8t2tePqphDmbSL4JXRwX+TZpOQ0HhcSt8duSvB90HHDPPLzFrPFmEGQ==
X-Google-Smtp-Source: AGHT+IFs4OXO3DnRijQR3jC6XXyoF6g88+AqqQwufWlSqx4yu9HzDyzVSqM84xSB3fWmoLTMC/EQwA==
X-Received: by 2002:a17:90b:5247:b0:311:f99e:7f57 with SMTP id 98e67ed59e1d1-32341ffece0mr13705525a91.23.1755490221961;
        Sun, 17 Aug 2025 21:10:21 -0700 (PDT)
Received: from localhost.localdomain ([122.171.17.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c70356sm6560972a91.25.2025.08.17.21.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:10:21 -0700 (PDT)
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
Subject: [PATCH v10 02/24] dt-bindings: mailbox: Add bindings for RISC-V SBI MPXY extension
Date: Mon, 18 Aug 2025 09:38:58 +0530
Message-ID: <20250818040920.272664-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818040920.272664-1-apatel@ventanamicro.com>
References: <20250818040920.272664-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_211023_016584_3C66572D 
X-CRM114-Status: GOOD (  13.34  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-acpi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add device tree bindings for the RISC-V SBI Message Proxy (MPXY)
extension as a mailbox controller.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/mailbox/riscv,sbi-mpxy-mbox.yaml | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml b/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
new file mode 100644
index 000000000000..061437a0b45a
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
+  [1] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
+
+  [2] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
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
