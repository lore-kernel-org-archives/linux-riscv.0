Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6799EC71157
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 13:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MXZ/0j6dl2PwyZL8aBz10l+pQLp0tBqGgWgYTGnzQks=; b=cB4TVHj7CQeDK8
	plEAxDPRPZ9RMXHp1s5gW8a6ZNCwhYU+h9z9UV9+YsR7g0j9Xj2tBaj478KZxF8ANkNDOaPhbGOCe
	tIKzIVN8RiaHLYfLdaqjtwSsvTgezFslJRrPEc0tcJHwtXydJpFRrD5xBUIqi5elCwPUvG41/IbWR
	SPvXPTnY4d2+gQNVLw6BIcUwURaMYtS3rG/jKftp60sphrDcRx6uc3KFnHDvDS4aMapxIuAYFE3qt
	k51uZVBhv04vZ4XhDggHhMR3Bo0QXgdCMS14X43wJVK0wHhlHKrIEBoqjyaGj8Nh69E9tvBeQcYFb
	c4CbPYG5waDRGIrXVcAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsoJ-0000000AHYS-3v4M;
	Wed, 18 Jun 2025 13:26:39 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrgX-0000000A5Ia-36ee
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 12:14:35 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b2fca9dc5f8so5005168a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 05:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750248873; x=1750853673; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGFMyHcY75Un2ey32rj/OGQJrYLrfBUEB3tHZxTx41w=;
        b=Mw0xHjv/zga1+kpWnOga9zNstdErUvmgeot5MuLINVblR/JksPQZ1dH2XqS+vQBcha
         +6DUY9cHOk5ySFUhsF2lPYeNhyL6aTcSUNlxHN3hQXLBUe4bF6hLohxV54iEkPOdb7qh
         DAuXbwGxykGdjReoDhsnM5F23ft/pog/+9Aaia4axL40vGO2vBl+JJFgUmR0fRL2KHqo
         Fkbe6qjQ3nPFCtsQppGXbx/B8Hi10W+KztXQfvaiYUulFDKxyAnxEi+ZON/ECnfsE/co
         DYX/j0cvnP9Mc5c8HNnOI+8cKPtRXyB2HsAuQ0uskGb/gN9JbtTWLgLedQw03R9ZBmHw
         0qYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248873; x=1750853673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EGFMyHcY75Un2ey32rj/OGQJrYLrfBUEB3tHZxTx41w=;
        b=PLXhgRyZF6u0t8pkvGjhdpslhM3aIHr/EY3E5pF30PlsF8B1MzScPRr7QRc9Haua2f
         /uQvp1dPUqow3HC0h0VOv+zooW+dXQg2TznM/QFgHwWZ529i1bOE4LnRPPuTi+J/FMtj
         oPBkD8FttmK4jqYgsHAYeIp0s8QQIalu86qRkvA31ZMAw0+9MGPsbXy4cHk+mzLXevBv
         zZHiMhkLVOG/EL0Uposza6d31By1LzI22yrBgLicfQDr8RYnuAlNhdY1LZ0c6/p8J04n
         1uvFEhYDDTuB2Wh7UEXOoxCDaLQtd8ZmT06IaOtBueX8Zug4c3kXPP/LKtQUn3XQo1MB
         o7oA==
X-Forwarded-Encrypted: i=1; AJvYcCXmTtEk0z5YHqMt+1vDZHUCIr8loqa1SkfaPalGmfPNcH8sPAHmDwxfNJ6vycw6XLKfPUqj0G9kpuZthg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxX0HBo7NQuh7ao9b+SqtkjtUPjR5ZlYKTtK4MNeyCJob/dzeR7
	b9RujOn6bJfsE77SqPlGFtGEEY08nfXrpsh8r1R4lzTrokvSRIAzXWwrz0tP5eh2eHE=
X-Gm-Gg: ASbGncv2pFAaW8LoFMzsis+BqfrCfR3CzQULCmwvT8rEB7wss1kDOPC6NDi3m+5EzLI
	kgwEA45euaCOZt7B/8y/ztPf0VtEhUdkarUgoJAFX6mBG2aa1le7aEBrHJy9dZ2xOiPMu8sZuh9
	nk85Tgk8FSrM0klIyR78xVKwV0Lsw8PEEwehrQHx//Bw6Bo0Na9VamnOkWnQqsXUb4ydpURsMnV
	u6RQ5zfeP10ZQi2/2PsFY7pDxlrLlZqeAmywsrYklNFV9TIbVX9tg7Ampxknq4aGV08hCR0kMQA
	0sbHdZy01ogwTFdS3cmcdCpV9/9EdfHWc8B9H7jnABoYD2iM4wkZ3QWx/5r2i6UQIlHIUVn6BCr
	rVwmGpOkt2FguUnCbUg==
X-Google-Smtp-Source: AGHT+IH19wLzq9wlb/kctuWR26QQIpePLbUfQ1snatAUiGKbTDh1UHVaygrkai5UEeU6wLpNf8lJYQ==
X-Received: by 2002:a05:6a21:648b:b0:21f:53e4:1925 with SMTP id adf61e73a8af0-21fbd523a1dmr22715391637.10.1750248872883;
        Wed, 18 Jun 2025 05:14:32 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:14:32 -0700 (PDT)
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
Subject: [PATCH v6 02/23] dt-bindings: mailbox: Add bindings for RISC-V SBI MPXY extension
Date: Wed, 18 Jun 2025 17:43:37 +0530
Message-ID: <20250618121358.503781-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618121358.503781-1-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_051433_793950_C590B451 
X-CRM114-Status: GOOD (  13.58  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
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
