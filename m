Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65921C54ED0
	for <linux-riscv@archiver.kernel.org>; Sun, 25 May 2025 08:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N4vijWJsPyO1u8uY6J2wI3CMaikYFaT9xBuIYoQFBh0=; b=nI0cYbgoSGrcj5
	76o+gGvdA14qJaVPFXv1EMzGbvkDJDZtAF8bxWgYx0sIkOs4urNeNm6P0yBLArK6i+P7FxkkK2Vqo
	eqqH7M8YrKaF4iDtg+yHSylw5IWryFpDlUfsIrqRKJYYFFK91nOFZh532okKSXDKuFwRrF+tAceYb
	/AOmodrBnOjoC/+jTT0dpOWRMXFj2+8aoDxIkyx7XiPoQ7VFTL3/8KKaG9Gcc//uwFqwmwDk2/Fa5
	ixMhD9JtuVI9twFFz1phW/WekbceltiS6o7AYJKka4b6S8RpeaQ4rHgf+OZjtVRM8UbtnKmI117TO
	I2kDBaLQRG7laxxboKhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ72D-00000006mt6-3sg6;
	Sun, 25 May 2025 08:48:45 +0000
Received: from mail-pf1-f177.google.com ([209.85.210.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ728-00000006mpx-3v1O
	for linux-riscv@lists.infradead.org;
	Sun, 25 May 2025 08:48:44 +0000
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7426c44e014so1023034b3a.3
        for <linux-riscv@lists.infradead.org>; Sun, 25 May 2025 01:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748162920; x=1748767720; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYmzV5+laFQZlY1OUMxuPLa7G32W7v4o4U3ZvBmHKpM=;
        b=OxKcfNv6A/7E/Y5iyDgPvvvEKLOTMUEoud6oJ3eVwBBgn4zqLrg1bXH1w4KJ1sFK5B
         6n/s3InKKFTFoaFW2SlEmlPXGl1+xO3zld4eOwz+/s2jR4RlX3EzbuOZenp8nOygY0ex
         dPjDDjYp7a+47zjwHsMswWMvZCnGTn9s0gvkiiHwULBrqemsjbSuCowahl+8bbHm/+VI
         KK7W0GGUp/K8+vC3Z0Xuo24hixpL8Sg67ZdtjrSg9HgfOAyCKNGg2V5B8/mKr+xg1Osv
         X3F0w1epsxLuqRKj/5L0gCtBNx3ufeVmZkuz1e6v+ICoXatziNy7M3j+joZyUypofXrL
         iP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748162920; x=1748767720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYmzV5+laFQZlY1OUMxuPLa7G32W7v4o4U3ZvBmHKpM=;
        b=DEeFbBrnyG7TSHenlYOXHS9+t2S/tRJtMmJ02bRr0gtPYVbVhS6SoZURIQYgbdDLxK
         aEnEVC7f503yTL5kFb4bGLuC6oQlz/lNNhMpb4cUsl98Tn15yoqKS5ibZMqY0Bwd7ahp
         5iKozGcUpIAHkTQNIEvsZ7siHWf1+aeePuC/bUeV9tPNhJK2VnCDXillhE5c/KFd/J1w
         6k6xZxvmRjoE/BC4l0w3bx3SWfR0B3fV9LykdeCHOoYLAkPsWaQmRMgOxpJxOKHYJQef
         KwpAQhGQ+5BuA+BkxK4NgNvb4ay2eVeouY+41xHQ0piySuOA4J1tcv3ju0IJNNdfrhm5
         EjlA==
X-Forwarded-Encrypted: i=1; AJvYcCUHwdxT1TJIf8Q69rqZ1Mkd1C2Bqo7jDHahCbamNbeGoaGmcw1rGpG1tPtyS2pSPir3do8vAqkkczultA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzS5EBvpoYqTWEaOhT1z7hJoFAHmC774jInoTkFVibrxGK6IYDg
	0tpofAPPy29X+PNf0kRPWoBWu9YhoiyFruvL2HNgd5xQuydExjk8kr6JVugAQQMt42k=
X-Gm-Gg: ASbGncvbUUU3AVymrOFyYM3RLwCBDxbNABdD8Ow++zRi2z4I+WSxPCL6003rFHP7dkG
	9vkGoBgK9KDJcZJBmJYlYCKpUJeT8oFYOpDOlJYjRDcCLiTMJK3SOAyRZmSU0/5O2GOJn2tdwe9
	fSgeQ7Rff2almilk6noUKHiV2RRvWGG1aISam8zsxitZtaI1D4lZfZUmaiPJsnm29U8+t3epb5Q
	mvR8hfClSz2JZCN/PVZTk2xKo9GpDhVn8VNwTuyQGG7oprJq4IBfdCBryu37opocXRnxXK9dLEE
	Wce/mDIkf5hwB5BgDdPAMsVpq8sIPuiSiv+p32yfWhGFQLj6LcjzV1MapJVo6qhi1GAFoRRED1o
	dbncO7bTMTiZJyTbfsjQ=
X-Google-Smtp-Source: AGHT+IHUnb/u4n1K3qHty9R2e5pY494m3bRF78DjZ/CBOUPR5X0ZgCZesJiwyw+6JH9lhPQ/s8o6iw==
X-Received: by 2002:a05:6a21:8ccb:b0:215:d38f:11d1 with SMTP id adf61e73a8af0-2188c37f541mr9574210637.29.1748162919824;
        Sun, 25 May 2025 01:48:39 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:48:39 -0700 (PDT)
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
Subject: [PATCH v4 09/23] dt-bindings: clock: Add RPMI clock service controller bindings
Date: Sun, 25 May 2025 14:16:56 +0530
Message-ID: <20250525084710.1665648-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250525084710.1665648-1-apatel@ventanamicro.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_014840_972884_C72883FE 
X-CRM114-Status: GOOD (  13.31  )
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

Add device tree bindings for the RPMI clock service group based
controller for the supervisor software.

The RPMI clock service group is defined by the RISC-V platform
management interface (RPMI) specification.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/clock/riscv,rpmi-clock.yaml      | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
new file mode 100644
index 000000000000..9c672a38595a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/riscv,rpmi-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI clock service group based clock controller
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
+  The RPMI specification [1] defines clock service group for accessing
+  system clocks managed by a platform microcontroller. The supervisor
+  software can access RPMI clock service group via SBI MPXY channel or
+  some dedicated supervisor-mode RPMI transport.
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
+      Intended for use by the supervisor software.
+    const: riscv,rpmi-clock
+
+  mboxes:
+    maxItems: 1
+    description:
+      Mailbox channel of the underlying RPMI transport or SBI message proxy channel.
+
+  "#clock-cells":
+    const: 1
+
+required:
+  - compatible
+  - mboxes
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller {
+        compatible = "riscv,rpmi-clock";
+        mboxes = <&mpxy_mbox 0x1000 0x0>;
+        #clock-cells = <1>;
+    };
+...
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
