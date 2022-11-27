Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185ACC46467
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Nov 2022 13:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XnMqshWSPwpZqfKibfwJxl8h3F/m1m6SkuHRBixfIW8=; b=XFG2m7o081eXdm
	3xtuPpWHMe0HIhiigtiOLqNzq0siVWONB+DMuYdgz5e4itEdK+Fk+pNup0e+2M6zxXqmcV9U9xXm1
	xHFHLnxs3ZwAtdFiADTjQTy/ypkwRme2MonZXdHqNl1L7DHKl7Arkm0YZptx5vJf+S/6IXU/xY2qt
	dxnD9Lwd+uZjnEak1TlUfVV79vyjZ44B+FjMuAhuzAEFP/NjzLirk1hv1z2fRxKW98CrM8n91007i
	UI6MRsGUapISXZ8B90gT4y5t1TmdJcFPxtJ7wX+QtHDybOHinavs1Vr4SXHYG01oe3MQk692dz0xK
	YfP7cpoQvah3np9urFWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozHo1-00BPiq-RQ; Sun, 27 Nov 2022 13:34:49 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozHny-00BPgh-Se
	for linux-riscv@lists.infradead.org; Sun, 27 Nov 2022 13:34:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4F942B80AFE;
	Sun, 27 Nov 2022 13:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40455C4347C;
	Sun, 27 Nov 2022 13:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669556084;
	bh=15Z0ekmHQuePHJoUKLWnOyQhgMLVXxeI8O1zqvC62eA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kMzeE0W41o9ATyLoCvawz1PHyfR8wQ5tI/POnlSgNWQJqB1XozqFn9gm3qG3zH7qi
	 dFiACPyFOMbrVX46RQGgeBmXCIRCG3+wsNWb6PjhDseLURa5YbwlMhKeJ01gKzqy2E
	 C8CpvrWHnd6nmbCzIePmzB33vCUGavajB2Y6HmhvNzxDzuQ9Zr0QV7rrFvGzHk8F9y
	 8RBBHhDQJM5eK8sIBncJdGA+HyY20JP+PGfP+7DK6lTGV1t9ew4x+oxUI0UHGxkmaP
	 ixq5Gkq99QUHiLHuX/Zqt2C/2C5qF/lNwce0Lcr53OcjCACr4ix9uQR5eW1KFvSnys
	 J7umrnIQT73IA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v2 1/9] dt-bindings: serial: add documentation for Bouffalolab UART Driver
Date: Sun, 27 Nov 2022 21:24:40 +0800
Message-Id: <20221127132448.4034-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221127132448.4034-1-jszhang@kernel.org>
References: <20221127132448.4034-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_053447_086908_66D9E347 
X-CRM114-Status: GOOD (  12.66  )
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
---
 .../bindings/serial/bouffalolab,uart.yaml     | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/bouffalolab,uart.yaml

diff --git a/Documentation/devicetree/bindings/serial/bouffalolab,uart.yaml b/Documentation/devicetree/bindings/serial/bouffalolab,uart.yaml
new file mode 100644
index 000000000000..a8293444ca31
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/bouffalolab,uart.yaml
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
+additionalProperties: false
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
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
