Return-Path: <SRS0=6ibT=W7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96683C3A5A8
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2019 10:20:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 668A5233A1
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2019 10:20:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NPsvUHrS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="CORLaL/C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 668A5233A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=gRJGQ+NU30zrURCArBDJh9wdU59q6cexMgZPFsn/GJ8=; b=NPs
	vUHrSlStY5WCH+K1Q/VMqB1WkfE8Mnxl0JXLqbDcCai026Lhd0Ssc/BvEnoT7i/Olkomcw4F4OMtU
	mcbCGuf/c7lULWG4/wEkQVIhj7a2twMq1bdTaPxud/pk0fG2zkOLvbTYBbmIiWPjFSTVxyVu1An8w
	UsRGWnFh82M7dw7H4dPw3jMKWUX5sin3+5pHxoN0ZQWp+Mv9pNDqaMRTEaGZLc4qf9vgX/3Ju+ueH
	nRogoaCBOevufnXf0x4WFF6SzHJbZx5h+9ghsHsb0CMZlX5vOwEWRrAuj8ucePDZISjIgu5b9ZxJ0
	pkacYj5gT1fce2BT4xDoxp0qqhK4LPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5SOb-000060-CO; Wed, 04 Sep 2019 10:20:13 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5SOX-0008TG-Qm
 for linux-riscv@lists.infradead.org; Wed, 04 Sep 2019 10:20:11 +0000
Received: by mail-pg1-x542.google.com with SMTP id x15so10993416pgg.8
 for <linux-riscv@lists.infradead.org>; Wed, 04 Sep 2019 03:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=J/+/1jhl4CuoY9Z/mhDhMnmKOIqzxcucbYzyGMDV3bY=;
 b=CORLaL/CvcphzgxSNJFn4X4v7kP4bDjHR6i/EX1ozp9IxvsGPO5SOgJVs12qRzD9zq
 9FP+oVjN/1UAwoWfnjwhcQCUem38ccuPN2q9PM+47l+u31chxAQ+QyytYx8QyUj12sVZ
 yVJSvxJdNti3TuNpf7Fn/Km5A4itymNTEnpIRzEjtvDSJOKJmgZw6bNxmbI5VVkhZyl5
 iYUqxGHivRS6JP6SO1VcgPMlvtwFaTUdt5bNyqvW7pOp3AKQyA5KdFC3BrJ/RL0wWlve
 MavDd6/n8d2fbjyajYj1s0NOlOf16VCs+HrORUVsiiwBV2BHKDD5AF0Gp0pVYImxXnC+
 s5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=J/+/1jhl4CuoY9Z/mhDhMnmKOIqzxcucbYzyGMDV3bY=;
 b=ZUQV+3pAanxwZ5GPFDYzkB6yBxYotgH1n6fX8T4+mWaPh2nEGBgbgI04fZhUbtAmMO
 M7iyZd2y/S8vcBdr1RHc97M/Zo+ydQgCuKRICafVM7WYKWpSdfKOchepwFir/HfiebCt
 WRuLzHMWep32emYo9tvcK/Etu9XTdE+W1Wf8mD88UxCxIQN8xH2vhF7X79MdZJjFL+/Q
 8ORGonSxK7OhZff0OZcB3KCbmF+V/+TAhgHVVZmK+EeQLK8Hhf8RTaW1yGW5TvODC84L
 7zJ5VTiKRSiNWzYcNxF0jIzXCEC/mxk/kIDLlr0doH5E5i3GYAqNyyI/lGciDWP7hvwk
 YVhA==
X-Gm-Message-State: APjAAAXYzrtiw8R21cw4gNUq+MxF0dcqfhhK7ZZx/OiWJsppKb4IR3Y5
 xVWQhFB1VVEZJYAlF5taAltWsA==
X-Google-Smtp-Source: APXvYqwfTQYhLAozNtIm8UdrAyXLSg8j912XKe8r8DrSl6YP/T2n5628nUBZNbwocefVP9R/TCS0Fg==
X-Received: by 2002:aa7:87d3:: with SMTP id i19mr31973373pfo.57.1567592408536; 
 Wed, 04 Sep 2019 03:20:08 -0700 (PDT)
Received: from pragneshp.open-silicon.com ([114.143.65.226])
 by smtp.gmail.com with ESMTPSA id p20sm22806882pgi.81.2019.09.04.03.20.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 04 Sep 2019 03:20:08 -0700 (PDT)
From: Pragnesh Patel <pragnesh.patel@sifive.com>
To: palmer@sifive.com,
	paul.walmsley@sifive.com
Subject: [PATCH v2] dt-bindings: serial: Convert riscv,
 sifive-serial to json-schema
Date: Wed,  4 Sep 2019 15:49:11 +0530
Message-Id: <1567592383-8920-1-git-send-email-pragnesh.patel@sifive.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190904_032009_888282_DDC753B9 
X-CRM114-Status: GOOD (  13.82  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-serial@vger.kernel.org,
 linux-riscv@lists.infradead.org, Pragnesh Patel <pragnesh.patel@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Convert the riscv,sifive-serial binding to DT schema using json-schema.

Signed-off-by: Pragnesh Patel <pragnesh.patel@sifive.com>
---

Changes in v2:
- Replace enum with items in compatible property

 .../devicetree/bindings/serial/sifive-serial.txt   | 33 ------------
 .../devicetree/bindings/serial/sifive-serial.yaml  | 62 ++++++++++++++++++++++
 2 files changed, 62 insertions(+), 33 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/serial/sifive-serial.txt
 create mode 100644 Documentation/devicetree/bindings/serial/sifive-serial.yaml

diff --git a/Documentation/devicetree/bindings/serial/sifive-serial.txt b/Documentation/devicetree/bindings/serial/sifive-serial.txt
deleted file mode 100644
index c86b1e5..0000000
--- a/Documentation/devicetree/bindings/serial/sifive-serial.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-SiFive asynchronous serial interface (UART)
-
-Required properties:
-
-- compatible: should be something similar to
-	      "sifive,<chip>-uart" for the UART as integrated
-	      on a particular chip, and "sifive,uart<version>" for the
-	      general UART IP block programming model.	Supported
-	      compatible strings as of the date of this writing are:
-	      "sifive,fu540-c000-uart" for the SiFive UART v0 as
-	      integrated onto the SiFive FU540 chip, or "sifive,uart0"
-	      for the SiFive UART v0 IP block with no chip integration
-	      tweaks (if any)
-- reg: address and length of the register space
-- interrupts: Should contain the UART interrupt identifier
-- clocks: Should contain a clock identifier for the UART's parent clock
-
-
-UART HDL that corresponds to the IP block version numbers can be found
-here:
-
-https://github.com/sifive/sifive-blocks/tree/master/src/main/scala/devices/uart
-
-
-Example:
-
-uart0: serial@10010000 {
-	compatible = "sifive,fu540-c000-uart", "sifive,uart0";
-	interrupt-parent = <&plic0>;
-	interrupts = <80>;
-	reg = <0x0 0x10010000 0x0 0x1000>;
-	clocks = <&prci PRCI_CLK_TLCLK>;
-};
diff --git a/Documentation/devicetree/bindings/serial/sifive-serial.yaml b/Documentation/devicetree/bindings/serial/sifive-serial.yaml
new file mode 100644
index 0000000..e8d3aed
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/sifive-serial.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/sifive-serial.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiFive asynchronous serial interface (UART)
+
+maintainers:
+  - Pragnesh Patel <pragnesh.patel@sifive.com>
+  - Paul Walmsley  <paul.walmsley@sifive.com>
+  - Palmer Dabbelt <palmer@sifive.com>
+
+allOf:
+  - $ref: /schemas/serial.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: sifive,fu540-c000-uart
+      - const: sifive,uart0
+
+    description:
+      Should be something similar to "sifive,<chip>-uart"
+      for the UART as integrated on a particular chip,
+      and "sifive,uart<version>" for the general UART IP
+      block programming model.
+
+      UART HDL that corresponds to the IP block version
+      numbers can be found here -
+
+      https://github.com/sifive/sifive-blocks/tree/master/src/main/scala/devices/uart
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
+      #include <dt-bindings/clock/sifive-fu540-prci.h>
+      serial@10010000 {
+        compatible = "sifive,fu540-c000-uart", "sifive,uart0";
+        interrupt-parent = <&plic0>;
+        interrupts = <80>;
+        reg = <0x0 0x10010000 0x0 0x1000>;
+        clocks = <&prci PRCI_CLK_TLCLK>;
+      };
+
+...
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
