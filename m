Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391BDC54E90
	for <linux-riscv@archiver.kernel.org>; Sun, 25 May 2025 08:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7kCLbqI0G6Q1AoFXFyDIyKGCgwkGZHtsnnAWh+8FLmg=; b=bi69Yxof6nCcww
	cXXdNDcTWXuRwaCkcgQ2KH4LVyYi7zm6ky8WoBJZg0eQ4S37BRfYINrxY2+zLKTyZrhaQyLENs18I
	pqOgMuMCL+uGRT72yQI4sust0/DiER0ma2md00J1thvHUxc2hA5cWRXCpNpyaMN+NXqdsenvVbMMN
	3sbUsOL0Hpgdi/wfryRf4+XfBcf2lyolRElQww30Katp9+Mqk1lB0Zlf+6N0Kul1OC7pbKX0uwxF9
	E28zA9DhC0D0chjiY1+1uhfjaUjrUOaf3O2oehY6rm3LpdFNmwVRgjLzxlf+zVb41IhSQsV8K4jT+
	biJipdcULBZ325yHdbmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ723-00000006mlj-15kj;
	Sun, 25 May 2025 08:48:35 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ720-00000006mjJ-1Urm
	for linux-riscv@lists.infradead.org;
	Sun, 25 May 2025 08:48:33 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b26ee6be1ecso636558a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 25 May 2025 01:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748162911; x=1748767711; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoI4ZQkvSe+gzPq+S2m1Njfoq5y1QbcsqoJbpZojWCQ=;
        b=iD5ixGziTcWGgj+IeKncZFKukLs4Ww5Wj0823X/wd31rR2IeiZP8xIxl1Jn8VNC0NB
         kMUitwa02EyiGZFowxbVEXlMFsUBBW4ZHi/Z5kuZSGVEJzWVUBH7qM+kQBbv2yVr7eP2
         jljuZBm5XYdEbAyAMQ+2svUJxkzEw2BveYk/yI97y00HY5ci6xJKx1kj9xVvANBj+6jv
         HK6o8fPniCCc0DkktS8Zl1/VUJzGYnZT8Tl3TTUHoeNO96y2XIkEwwAj0uJDJyExLtC9
         H012FYgmXKLQzd8NHheKBXgnh14xhn2J13Vcuzi5jGtjDoZqO0HrRKV/GCqVLskSsQSd
         TdWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748162911; x=1748767711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoI4ZQkvSe+gzPq+S2m1Njfoq5y1QbcsqoJbpZojWCQ=;
        b=RDPKSGJ3GfFmfprvcb2j1Gi9NaTnJK58Z+cnYqfCPfmBOGU8v2Gwyc7yqwsK09AJEM
         pIYlIweVFkHm2RlkMRWND4hSywpSSZQ7EMq+ReA7EQAVs2IOjQ6cj/6aCuovaiU/D6e7
         ai3xCCqL9GyUaywB0WxQvnhRHMVCU3bOgM2V14mRqiumdhEmmwgTNFLco60W5Ss+J0V6
         MnCmYd4R3nm65EEIUT67hl4lPakvDdJVNrmGj356WiaToGzPph1QACdVg0X1kxLYiKop
         lvyq5e7RvK12Vxm1iAqoYMUYW7H745euiDFddlND7S3X1aB3bc2CTEWjO0w1FxDExGwF
         +4zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVswjlp09+WBe5GufkQJo4vCM5qmsDjggNn7OLCnKBO0PISYKFqvSbhtQy2r0628OHI8aFZx/VBiazvNA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzbwE9HJRcl+WU3EqYro6eVyQTwfv0vB5r3qYoO0sAu5SkHPVvb
	/GDXyYsXc8ZvZFDT2igzLGUZVJXuCAlOkDjM+3WqJgXNsoQkka/u3zo2cXaiZKwn3HI=
X-Gm-Gg: ASbGncvwDiVIyaXelKiZO3YsMO4O2FKYRvKgJCsCEZC2F99qHAix6tydNzgCd5IEzWr
	7mfqkPcfSARo7XvLKgqOrVli5AT143QHkbMUvV1APRQpK2rK6mymAosx4fAL7Rrh6qXiP1C9W1d
	/hmZ+UNUW+2tCEy7LaeUGWMXXdneWpGBTCXH5VqTGmcoiJG/rM18JHMQ/Ojr9wfAz/1FggGXCg9
	mG2DsRzl+QKCPZUreIjG72IPobl1Oen6hcFRDfUgY8Yye0g21nxFEufv+YXsnNkuxGUfGIEcrfi
	m4zvXP6Q68UcyUfN5rnET4v/pGxB7rXT7waJj9Mo3h6hBidfHKG4oGSedqpVQ3o0cQB/e7HcPYS
	IBjtGaPX+
X-Google-Smtp-Source: AGHT+IHaa3RGGjUnyc43UOzEBszIqbCoOn4M6INNt/0M6sjpGVykwIm/Pjl2lpAJ2/MaUcFj4kgv9Q==
X-Received: by 2002:a17:90b:1fc8:b0:2ff:4f04:4266 with SMTP id 98e67ed59e1d1-3111089df54mr6591838a91.23.1748162911379;
        Sun, 25 May 2025 01:48:31 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:48:30 -0700 (PDT)
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
Subject: [PATCH v4 08/23] dt-bindings: clock: Add RPMI clock service message proxy bindings
Date: Sun, 25 May 2025 14:16:55 +0530
Message-ID: <20250525084710.1665648-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250525084710.1665648-1-apatel@ventanamicro.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_014832_392788_61C89C3E 
X-CRM114-Status: GOOD (  14.46  )
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
message proxy implemented by the SBI implementation (machine mode
firmware or hypervisor).

The RPMI clock service group is defined by the RISC-V platform
management interface (RPMI) specification.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/clock/riscv,rpmi-mpxy-clock.yaml | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml b/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml
new file mode 100644
index 000000000000..39db52de86b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/riscv,rpmi-mpxy-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI clock service group based message proxy
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
+  system clocks managed by a platform microcontroller. The SBI implementation
+  (machine mode firmware or hypervisor) can implement an SBI MPXY channel
+  to allow RPMI clock service group access to the supervisor software.
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
+    const: riscv,rpmi-mpxy-clock
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
+    clock-controller {
+        compatible = "riscv,rpmi-mpxy-clock";
+        mboxes = <&rpmi_shmem_mbox 0x8>;
+        riscv,sbi-mpxy-channel-id = <0x1000>;
+    };
+...
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
