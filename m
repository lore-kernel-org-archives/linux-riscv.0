Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46412C83013
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 05:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3yf1K/WI5KK7Rl3BcASyupLP0eAN2iABDXrFQ2Kzr6s=; b=s5XJEDZGWKfpAR
	YIEU+e13dM8D+oXeAqZJSFY4C8blBNrzHN0X815JYCuUCcDHFpZjJoZhUPEwrq7iVJHytEWWOYHig
	ND0TbNcCv5/h9sMVH/LjzloMlmo/H3WHRq/XutYVwSKssv01a61L1XKpqh/PQ6wl1hH3xGBqTCowX
	m/Cp0t3BP1AD35NxOEQxmsnjQgLs41IaWVFaPp5hkY8MuoDGM/SUGvicTUhEIDfcA2gOC+fZXg3wb
	yt1Fbgh+g4XacNz3jcv1ivj4MGp8hd6NBWtb1Uvm9bOBe7lnYl8wXu7t5+82csw/06m+nuh4ttZQX
	Gt2u2mDKK2WRJXWemM+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWpuF-00000007HP3-14rZ;
	Wed, 02 Jul 2025 05:21:15 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWpoK-00000007Fvt-0UdS
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 05:15:09 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-234c5b57557so39438555ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 01 Jul 2025 22:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433307; x=1752038107; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UM/HZQdb2lcK8V7OkC2GVlA2nnGt1f60vmRpDyo8E4k=;
        b=cNOyRQ/dPOm88czDNCv611qMRa8uMRAkBDlIJn0jImN4qBn2t7mnAZVIvhSEDgA+00
         SPyAS539/ZjhSPrPy1hO44emuTgHiUogApWK8zdTv422YWfNh8qpIyexWZnBzFkxdsFS
         MwOEy5DGELIHJVvPnwTBCRhq4KktXM4pKxqcPwtTFlNU4UNy1U1z9M5/Y5M/xpQgI8xL
         wKylfGgrwWmLkk9EZw1lCFSfydXEpsVdz2PF/xVQdcqkc1ggm0hPf64cqNyO9cZTYG1b
         HETD8Xy38xPCibCFnfhk9zuts3BVE7L7T2X9p11B2rgzTBYsJB1ruRhxb8eQpgxWPs3F
         752Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433307; x=1752038107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UM/HZQdb2lcK8V7OkC2GVlA2nnGt1f60vmRpDyo8E4k=;
        b=aPmeE9loGJCs5+W/u8CJ6r5zXN3Yi5QN1TfaRzZVZx8pcBdKFXsGVkFDInGOemP0BB
         tRzptm3hPmv7tvc4yDq4vQeCMwrOxxu/uYfONopempDAs04k8XHUFtWTqbin9fk4/5vW
         SZYtEGiYjHg6Pcgrgmz8jIGbcS/v/4rtvULtXkQHkRjJXRTho20yZpTSbenfK9K5d4X6
         Kk7XvY+AfWsY81c8wlNt7+VEZ9MbZJ3RKIBcxthp5mILzbOPTXqXjS5TWV2DKVly93pr
         es1GLkkE8309WWf71LG3dZcMXqXaWWLnVdTT5E196a7NobvjzheRpMLMNC8s2kZC33Pb
         +IoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUk5FkJ4hPvK/InZi6sxMaUAISI1re8YjHWzD8jIn5O07dmJv8iXBG09AgNOkOv5SRAOYeJBilUf0A+Iw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwwLlm1MmnsofxTDnRq4alX+Bmx5xMpjc4K8iaxiJM582B1lBSe
	hBlSDyUXczSaaMmUxQERhJSbo0sx9f30mhrrSZE5qzcz4QhgLWqbXdtXF1iRcyEhpgw=
X-Gm-Gg: ASbGncv93zntWzFLzP3TI5iZsi4+OWMvWFgoNAopM19Fd4EPcFWll3NgbqwejPYJRHX
	4BENqD0sQs/8GW1hGlJYD9ALn0Lv3dldtHHFzdB7LzPa8swhJwysBTF+HMiSLP7lD8KDfa4AmZh
	/PzoDTgrPocjXbrSNHVjx19+OFEZQR9cX+bzu0iPQhju7q6wjkl/ZfBA8k0/1msmQ4OvL7DIa24
	mWrebnjcZvPIgsK2ovZEBAYqUoGIx5Xi+PzLzK6ZPj5Vi7qSD4GCRsA/VDeknUHcRtLzVWJPhmc
	4AkhGSzZLV8Hik/ltJ1d2crjRFYEhLL6p+y8odKXPocJEi3bpWL6yDG591ULkIXIIxWde5ktFAQ
	JYnF/OeLe5VRkiW8e
X-Google-Smtp-Source: AGHT+IFWsFKRwiLkn4+0FNNQ8TzbjWmTlTzoQeJ28wANDKR6xWxbc9yBEEWGSmlqOiJ156vxO88y8g==
X-Received: by 2002:a17:903:1988:b0:234:f580:a11 with SMTP id d9443c01a7336-23c6e4b9ba9mr22182535ad.19.1751433307410;
        Tue, 01 Jul 2025 22:15:07 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:15:06 -0700 (PDT)
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
Subject: [PATCH v7 08/24] dt-bindings: clock: Add RPMI clock service message proxy bindings
Date: Wed,  2 Jul 2025 10:43:29 +0530
Message-ID: <20250702051345.1460497-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702051345.1460497-1-apatel@ventanamicro.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_221508_156929_F5AF8FC0 
X-CRM114-Status: GOOD (  15.23  )
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
