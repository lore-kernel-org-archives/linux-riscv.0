Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5ACC83F0E
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 07:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3fXIgMunU2CcxgS7fVFYYYHSTO/HOWdx4cW/xZMCIhs=; b=ufu9zEymKOAGgt
	QW2GJK2dW8PjSoArMQOeYqNXvg5SWhTg6XrmtRIHtZvciRdjEjxSQO/9QZW4MwA6mq2IfdGpvGCA7
	D+XWO7BD32D4TTZ0riJ6AKZY+SmOQJEwG9reYXM3iEi6830XS+67W27ajWx/+prSOVDpdnwMK0HbE
	YCu9neDKZ+Qw/Z5ebyQY3DIcRc975sHZ46njc/wti8e3i2pcLa6JBNfIBvn48nTrZS1YYtH+Lu/Cj
	j8ErdmSEE6Dj4TKaCx+FY0fcE3W1kzoTvSW+Piq2/wRlntBiOWK3ceitGid5fjmhHaBnqDFUCKVjW
	rJx1YznqWpZtt9xuxBVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaW0-0000000DUxM-3Xuf;
	Fri, 04 Jul 2025 07:07:20 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaUh-0000000DUYQ-3ffw
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 07:06:01 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b3507b63c6fso675742a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 04 Jul 2025 00:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751612759; x=1752217559; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMRC5c9xXUgo6eKv4jcoCHH6TENqo9cqAPQxW1Kbofo=;
        b=fr4d2vb5YKHwdedD5YKcNsv+T0Hs7UOFMxSyaKBzQ8uKo0BGAqODbCfzMC/AxsVJzP
         6wVmQWhfNs08XGI2FoUiFO7Ek8rzFFnqkIHJ0Ckf0koPPqQ6eiiCHSzPs0hOPwR/xrm4
         C0HRKb6FrCrgQqU4BWmDTFkDX6r9j4gZ+pBY3Rf341t/5IWGbd6BNmu/RirZA4B/nPbW
         uzKvfsAzFZ77ztacX2XeYz8VzZi6BSOC61THR1R2DxtkR5ltg6EW6aMB2OkP4/mJKknG
         W8MhdrJES3iSsfqaIBj1mvgTT3VEtmSVlVpK54QVsRhty2OBwOnNpDvOVn44MH7XsMzf
         Jj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612759; x=1752217559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zMRC5c9xXUgo6eKv4jcoCHH6TENqo9cqAPQxW1Kbofo=;
        b=itRt+iTG7N8dS0kCQrcyymVp+h7Fs9LeSJ1O+h5s7X7HAOUB/D0UFEmWAc8hh0mFLe
         g2guDWmYIAD5rfi34Pm5umvhrfDedem1WTH4RIhAPA1Bx5cIOSnREKzojx/0Y3lr1ImK
         KhAqkC3FfOnB1iWDmcyhP4UeRT1xGnqbSYxwr3S2zmTHtUIPmzg8ArtfeFdnNT8I4HQy
         88QUHKVWYRCAlXnGMU7SvQ5eQXDm7+6SOqHKyc7lWNhJwXJbrDXhUZ/n7Mw+1tK4TRCB
         iqjueSsPYHXOp/ic4G1fvGf/eT8Lgo5uEYry/x/VWe8pKjFIa2XNE4+WLdHI4HXZB3kF
         wIWg==
X-Forwarded-Encrypted: i=1; AJvYcCU5FbCCYMF6kab4AtXP3JouEeyilAsgPVZmQY8Sxur9bsu7qi1PBWXg+7tTjQQ0Q8qGFy0qD0EFp7qEmw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxcLgh8Kg7gbc4lMFSjwZE3aXAhaSOb1qDmBbkNGk3GZWzgGz3y
	1Q/zxkdvhahfMitVJQFlj0zi+vNZKTFcSU+cht4T6vJzWibh9Lfa6JbXVU9tos6MwLQ=
X-Gm-Gg: ASbGncsZTQn4Uw7X1uHwR3+tAyJ+vjsO24RSVxjQfV5yDKFbv6JzYx2AYO5ozXqsp/B
	1s8M7FhP0KZWONL96aItDTuZfxdhym2kpHVmYL8uMa9ADUGaOP1pOWDbzYL/HJKfuBLa+i4aLP3
	flGz+sNAa2sAccqHElIGZxlTqOtEOPaeZ2Nd8bALR1Px4APgEsWKcGJIoimG3UJZIJ9DKmzhGt7
	0BtY/5GKsomzWhTTVLwpDDlhLAqYabUdrAf1h0fdqKkmjdFeW+eEPvCHVfDRtVZwR0F3HAOukaf
	k2YDXOt9NEfPjln9uJXwP9pq0P57Nrbrn2ybO1aKfXN0Oa6nbe22HTAAZFTQtpZymT0tQtIoeAg
	egO2XuvKgjcHlBhullzJ5V3sdTw==
X-Google-Smtp-Source: AGHT+IEsY9DjJEKtUwl9ZcWbIEnsXVkhcprck0a7/CT8yNIOArahqDh4/mdoR/7EaIpy+0pjEevTMA==
X-Received: by 2002:a17:90a:dfcc:b0:315:cbe0:13b3 with SMTP id 98e67ed59e1d1-31aadcf4962mr1778242a91.7.1751612759095;
        Fri, 04 Jul 2025 00:05:59 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae59a93sm1358697a91.12.2025.07.04.00.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:05:58 -0700 (PDT)
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
Subject: [PATCH v8 09/24] dt-bindings: clock: Add RPMI clock service controller bindings
Date: Fri,  4 Jul 2025 12:33:41 +0530
Message-ID: <20250704070356.1683992-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704070356.1683992-1-apatel@ventanamicro.com>
References: <20250704070356.1683992-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_000559_907006_B97D055D 
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-acpi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add device tree bindings for the RPMI clock service group based
controller for the supervisor software.

The RPMI clock service group is defined by the RISC-V platform
management interface (RPMI) specification.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/clock/riscv,rpmi-clock.yaml      | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
new file mode 100644
index 000000000000..5d62bf8215c8
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
@@ -0,0 +1,64 @@
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
+  [1] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+  [2] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
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
+    description:
+      Platform specific CLOCK_ID as defined by the RISC-V Platform Management
+      Interface (RPMI) specification.
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
