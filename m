Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC1CC83F05
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 07:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3yf1K/WI5KK7Rl3BcASyupLP0eAN2iABDXrFQ2Kzr6s=; b=ub8BVAGTJP8egd
	28uKG4VIBjm3q4cOoj2BHWHW3qr7qamj0uadbrU+AaO7eu8OcosT8UcxIrLadzo9jpUzHwggk+5uy
	VrEJNldToxDAh47h7OeBnlWR5eq25n6NSf/qKatQl7Ul2cSG3krE1lchpI8CBo7pOw1uNiOdohMgA
	+WUZkRKyEdd9sC54Z5Fy0NzXTQVBabgnWMSBXLxjdk17oOWZFbiSz/HPddEtXdGQIbWTAcISxccy+
	EN4KKIJ6L+YjWjMBZZXDfxFT0ez8/T1vSOq8IETPyizDEmw7v/QJ8Fei45q4+zw/LGCJlM0VlrNOW
	uXDdQ0zBEXp0qpncSkhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaVz-0000000DUwI-3AhO;
	Fri, 04 Jul 2025 07:07:19 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaUW-0000000DUW2-1Ser
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 07:05:49 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b31d578e774so1537492a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 04 Jul 2025 00:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751612747; x=1752217547; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UM/HZQdb2lcK8V7OkC2GVlA2nnGt1f60vmRpDyo8E4k=;
        b=R5w6ya9sqyDVN71Iq09cxJbq7ubP+ETANmFCIA+eI9e+94r1Gj+b2Xq95Y6s5IvnkP
         GKSbRQqoiXLAuLgij7E0qeN4XSvkgz0PCTNJF43Dvk7dpj/PQVWR/ZFHqik9V657026K
         ThGzwLnKEPEHj3xYx6S55HESulqSn4/4Re3qPj9XgEd3e6wxc3pXnK6F3uAXVPKotrie
         5YNs0QwQsQdDLUTAZPuc2ZKE10Ei/daVC69KL4+E9wJxstx38Z+4ZOPPjtHk+xw4IkOz
         HLUnFbtWl/gDvzRTq0lgzLK6kohaH7V222vQkpAaH6MJAWb3vcWJGxFuA9iVEsjyXsX+
         RbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612747; x=1752217547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UM/HZQdb2lcK8V7OkC2GVlA2nnGt1f60vmRpDyo8E4k=;
        b=TiA4Y8wDpTtoWXqsRDb/BNnsC8gVDkAqUhNUmBUTDOxoLjtGBUbc2XG4BdKaNWK/IC
         f3YouVkJltmMpsm8JQqBLbLxq9Ym4ZonfD3TnkAYtfwTID8JiEOgeRD5mBTkUcmPkJBn
         7fLbIAPYge1GgFiwwl+IW02EWSYJ1FBcDPbVO6+rSqteUOSLtzMiffFwUt8HBzEh8hnY
         RgqvC03wBMtQaghAETmCsR6gsnMzmnk5RY7z6+GihZwVnwbGNYURwm9kyodm+I3kkLUF
         v0qoTzIexbQJv1p5ZjvTvtyu4i644JghPkebOwPuoao2tVlZjwLdn4eNL2qobyqPQQc1
         ZEmg==
X-Forwarded-Encrypted: i=1; AJvYcCUDZ/OUxKnRXdmEDZafshUnCEpFBSxLvzyomWcEJJlujZjGVAS5sg2ra16vWvD395PWzIWvRehQerLKDg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyoQ1VESJ7xhVKyskwG2OUfGBWIIqH8LBHkCaoTnusy0FL1PYqy
	/5fSQle5tL/n08siZAW3/lhAJjrSPZuZU5YTZu+Z1+y99CMsxC57Ee9kra9jh721KtI=
X-Gm-Gg: ASbGncugLgs2ZyKIlbSqI+3Kohq8dJSAsHGOzJIpM6s7MEy9KRnswWMruHQPmj7itKn
	ABjKONw0H2G0MVZtrUfwBE+j0ratRDOeu6kgL5m5OB4Rhs+HvvSRnnvnAmQt2TjCexM2qAvgc+H
	gFsKv83FyWNc4cewb0NPGhrOAVnj/BISgMrt5aN2LxmyI72a28E/P2XuNBaiv/Sg1bYVXo4sDqa
	isIvqQiKjnjKbBkCxDYYrP+mFuOlOWnt2UipbnfDoEOEsu45P0I7dSF9xneAHdVsEBP+qjTLgw0
	+kiSeTUXSezs9WCv4EpZYJgiICTZIz2KRHTLMkejpmk1bbNzebVVFQMjY7pys+iYq6HbYt2YGI0
	5mnkyqAD8ybEi9HzLF4ZvT3QBqw==
X-Google-Smtp-Source: AGHT+IHtmFW2/QY9JlxyY/sNpsmHaQgh9pPlylF9L8hp3qD/XtkbiHA4dJh1wnEy5Pds8AHMwLTi9A==
X-Received: by 2002:a17:90b:582d:b0:311:83d3:fd9c with SMTP id 98e67ed59e1d1-31aaae6d975mr3196784a91.0.1751612747456;
        Fri, 04 Jul 2025 00:05:47 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae59a93sm1358697a91.12.2025.07.04.00.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:05:46 -0700 (PDT)
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
Subject: [PATCH v8 08/24] dt-bindings: clock: Add RPMI clock service message proxy bindings
Date: Fri,  4 Jul 2025 12:33:40 +0530
Message-ID: <20250704070356.1683992-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704070356.1683992-1-apatel@ventanamicro.com>
References: <20250704070356.1683992-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_000548_385453_C67456B0 
X-CRM114-Status: GOOD (  14.29  )
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
message proxy implemented by the SBI implementation (machine mode
firmware or hypervisor).

The RPMI clock service group is defined by the RISC-V platform
management interface (RPMI) specification.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/clock/riscv,rpmi-mpxy-clock.yaml | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml b/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml
new file mode 100644
index 000000000000..70ffc88d0110
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
+  [1] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+  [2] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
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
