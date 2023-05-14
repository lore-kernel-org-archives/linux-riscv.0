Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E44C7EE2A
	for <linux-riscv@archiver.kernel.org>; Sun, 14 May 2023 17:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2xa/vfyxzUWKf4ZWroStDzd/0DnbHbOV+EQqPMa+zr4=; b=YPiC9Z5UZGDsUe
	ErbQHPH7nG0U+n/djKM7jVsQz2qsGeskFDKjTgjsP3EcMxn+RlApdjQqQSYfYT+ceFp9iZZh3JLTz
	KdIgFWhuyTZtL3zs++1/8Xd/wuzXy8NY/z7ZkhSx/UNtv4m3VUimnNqkhVAuGgqIw9SdLKg5XZKJh
	i154LAvl4jLqAXaWcomd2qAS8IC6XubJUMMmHC3qDCNSlno4Xw2ZQLd18fOitzVwhXkw2O3EKhl6H
	sDdz9Ehp9BgGIUwdsuyd82jCQd+VIDwdkpmKSgHSxccNwKf53bFotawJ7liapKmJT/a+O1CdqRua/
	Bvkt6XlEBV+37Gw+Z8mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyFCi-00HYk4-2P;
	Sun, 14 May 2023 17:08:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyFCg-00HYjM-1I
	for linux-riscv@lists.infradead.org;
	Sun, 14 May 2023 17:08:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 082F46108D;
	Sun, 14 May 2023 17:08:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D288C433D2;
	Sun, 14 May 2023 17:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684084093;
	bh=nF3JL8RuDBTKyjXk/txorqM8FS90ktPyRcC6WV+BXac=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tG6Br1/S61N0FCgxfIiQATh1yxfuBb8K/Yabe3bjet9eBWbOL0vJkwkycEoVMoE6y
	 z+kggXrwf7qlBT2iUon62jUuaZvp8fjHD1fE+nqnTWq+Bi/y5xKgzaXWdv1LjjvJmL
	 VRuIKmRZVL9jTvTInG2UtBEvFoLGVmVd9SyeqCGyCdN0G9KlskIWA8yF/QJicLcyP6
	 ZG4ell1KsWxVqkzyTYvrywz8wK0TV2ie0/V76hwxIq63tdfac2Z485UrrjsO2r1+KB
	 NNm+LNx2yFWim8lgmkTrbPMnXV2QRpo+jRQm3RcU9K1KeNQrYIzZZGqAfsjsjPip5x
	 lY3yJRN7z/r/Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v3 03/10] dt-bindings: serial: add documentation for Bouffalolab UART Driver
Date: Mon, 15 May 2023 00:56:44 +0800
Message-Id: <20230514165651.2199-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230514165651.2199-1-jszhang@kernel.org>
References: <20230514165651.2199-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_100814_479662_71A963A9 
X-CRM114-Status: GOOD (  12.72  )
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

Add bindings doc for Bouffalolab UART Driver

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 .../serial/bouffalolab,bl808-uart.yaml        | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/bouffalolab,bl808-uart.yaml

diff --git a/Documentation/devicetree/bindings/serial/bouffalolab,bl808-uart.yaml b/Documentation/devicetree/bindings/serial/bouffalolab,bl808-uart.yaml
new file mode 100644
index 000000000000..e1c2c8ac88ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/bouffalolab,bl808-uart.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2022 Jisheng Zhang <jszhang@kernel.org>
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/bouffalolab,uart.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bouffalolab UART Controller
+
+maintainers:
+  - Jisheng Zhang <jszhang@kernel.org>
+
+allOf:
+  - $ref: serial.yaml#
+
+properties:
+  compatible:
+    const: bouffalolab,bl808-uart
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    uart0: serial@30002000 {
+        compatible = "bouffalolab,bl808-uart";
+        reg = <0x30002000 0x1000>;
+        interrupts = <53 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&xtal>;
+    };
+...
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
