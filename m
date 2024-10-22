Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0EAD1715D
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 04:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mqD4gjq9EtfuWfMKrqbD+ligcOZAE1ZVSILHqKX+Ues=; b=bsT8S1be0wqBTG
	gxAvOgnTtxJ6rUWPNdtbO1aQQCZ6vW0DlKGfcx7pkSm2z9chrFPE4f0rphDWNf1dvu2/Wm8GpKmDb
	IWX/FJuH6ZxvwU+p6pUaAu9qoMuwPFZrYL78DRkVKkzzH0JpAS9GPALw+s9f3uTGdchvRoT3K2Ks0
	R1wpPldZyQ7WS9ABC/LESd6a1cNnfk12ZOb5GjpoEvsG4QmIvwhpPrHJWVd6b0eQq3PWha8KpieDj
	T7+XX8WwJ2U9pUhGFNJ2vNWDTLILQh9ma0G9KmLK/vms+qrlQzITyupauz5UXks/h8/Vd/Pl8m+IA
	rBuB/NfwT2L44AOhdj5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t366Y-00000009WJ5-3eWL;
	Tue, 22 Oct 2024 04:02:46 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t366V-00000009WHU-1pX9
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 04:02:44 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-71e49ef3b2bso3676543b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 21 Oct 2024 21:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729569762; x=1730174562; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESpVDdqvWArJZ/zn9KV45HICoQoUKaqzB0C6fhXH0e8=;
        b=e4nXsZtNIxXTEj7KBVbVif+ZIvJLPBI4mri1SsrauiEJludIK9jGoFdXaAFIgQMPdo
         JSUt9FAkb53HQh+bM8e/MQzIbdKhH7U1yV3JdfosVUQSmEnAWKiZW0nxvIDEaSzUwuCy
         0BE0SfLghwQPxA1AP1xoUP1kajwLZUrN2qXg2WHSbq3Sa4HmrIh0HrjXCXjwTjI8XLL8
         TSl/TWw52xS0ecK6kkRJR7dJV3m1sOWPClQjXzMr4F6XHdWZmli9yNeD7zVbPRNZCwXp
         UCN2dpMd6lAmuFSGIUME0TsYiWLRSbfBwSD8Zr0jhjKUaNgOhA4MCWnw7vjwthvRFbHZ
         O9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729569762; x=1730174562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ESpVDdqvWArJZ/zn9KV45HICoQoUKaqzB0C6fhXH0e8=;
        b=SJFE+tYjMpqc9DrnnOiwo3hxzpDbs5AqtsVBPq49qSmHGBbjhY3rI7DIjtYlBu9tYe
         8rKINjwqVjRIHe/qhQV3KhlBEdMbWLcJvuF7BoB9vl9VgWojB0EGKZqVlRr9cefiMIBN
         WH5n0fYfIXaj/FFu4yuERGIBVLg9h0SaZvEUWZVsKA9shm2SslvS/vBsl4mMay0mf7zv
         zoLQgaGMXUSG3XAmVCP9mltCbfjxMFNHtiQtAqzRqfGVwCFgBzyTf0yQRd21JKaMMaBp
         I07gECttnctikfw/D0ec28R+X1lrQwLdTn3iKIelU51RB5JowYaFpRPkLkQ2d2o/h1vH
         s+xw==
X-Forwarded-Encrypted: i=1; AJvYcCW5MvDT1Ud5s0MWXgQC0nnRz5T4KP/s3fznNrdMsFZSTsazZ0kG5vvff/4/Bszbxf00pCAlIizcSncyQg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRRIqZ4uLYdC1FSV9aegK6hC2ylJJUblzWHoTh4lCWNKsBc5GC
	RRLsXPixUb3qHO0Cm8Dh4A2CBZQ53KAQdANjgv2JXNOlV1VM/Ljr
X-Google-Smtp-Source: AGHT+IFpvbKAGMcBFfuBrPC9vCpoH+zVcNDvH81Wljcvo2dEo6JSn4vRv3yO5yMxJ/YDoSwbgcxnyw==
X-Received: by 2002:a05:6a00:9282:b0:71e:587d:f268 with SMTP id d2e1a72fcca58-71edbbc153bmr2884829b3a.4.1729569761875;
        Mon, 21 Oct 2024 21:02:41 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1338c80sm3718457b3a.48.2024.10.21.21.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 21:02:41 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Hal Feng <hal.feng@starfivetech.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/3] dt-bindings: interrupt-controller: Add Sophgo SG2044 ACLINT SSWI
Date: Tue, 22 Oct 2024 12:02:15 +0800
Message-ID: <20241022040218.450573-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241022040218.450573-1-inochiama@gmail.com>
References: <20241022040218.450573-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_210243_489172_065D7034 
X-CRM114-Status: GOOD (  14.57  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Sophgo SG2044 has a new version of T-HEAD C920, which implement
a fully featured ACLINT device. This ACLINT has an extra SSWI
field to support fast S-mode IPI.

Add necessary compatible string for the T-HEAD ACLINT sswi device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../thead,c900-aclint-sswi.yaml               | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
new file mode 100644
index 000000000000..0106fbf3ea1f
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/thead,c900-aclint-sswi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo sg2044 ACLINT Supervisor-level Software Interrupt Device
+
+maintainers:
+  - Inochi Amaoto <inochiama@outlook.com>
+
+description:
+  The SSWI device is a part of the riscv ACLINT device. It provides
+  supervisor-level IPI functionality for a set of HARTs on a RISC-V
+  platform. It provides a register to set an IPI (SETSSIP) for each
+  HART connected to the SSWI device.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - sophgo,sg2044-aclint-sswi
+      - const: thead,c900-aclint-sswi
+
+  reg:
+    maxItems: 1
+
+  "#interrupt-cells":
+    const: 0
+
+  interrupt-controller: true
+
+  interrupts-extended:
+    minItems: 1
+    maxItems: 4095
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#interrupt-cells"
+  - interrupt-controller
+  - interrupts-extended
+
+examples:
+  - |
+    interrupt-controller@94000000 {
+      compatible = "sophgo,sg2044-aclint-sswi", "thead,c900-aclint-sswi";
+      reg = <0x94000000 0x00004000>;
+      #interrupt-cells = <0>;
+      interrupt-controller;
+      interrupts-extended = <&cpu1intc 1>,
+                            <&cpu2intc 1>,
+                            <&cpu3intc 1>,
+                            <&cpu4intc 1>;
+    };
+...
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
