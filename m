Return-Path: <SRS0=jvqQ=W4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78853C3A5A4
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  1 Sep 2019 07:12:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A74023429
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  1 Sep 2019 07:12:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VjoKaIPn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="nkBdHU1b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A74023429
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=vT1cu3Vc7PSwnOBZl4mhp0KUd/UiZmIX0Sc+PRw8KxM=; b=Vjo
	KaIPnKbA/dQ8y5ZFYanLmT1edyDV0JAGfTZQ+eRNA/ySYGeIGg91sL3shkmyphT2AAzNljA/VTqw/
	LJqCVY1ydJHbuvVIkC2wCOvCVZjHYI9tHX4To6AffTRFBX0LdivqRFLoD9ZueOGjcU1gkdrgRf6GW
	deq/izCDK9xfOWh+ijOv03Qa0D6sy2Pu6DxqlytXhXhYkRABSroMZE/raUocPFfh58Xp+g3vpyJy9
	SWQTMFM+6fLHCSZ786Kvpw9H/1nCegy6XORfdYO5PFeI9yGaEhR8Y4LbkA7mOrvRjWsatW0SjL9U1
	pn4O6XlfAfvjfZVsbkZWCHd1pk5nA6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i4K1v-0006NB-O2; Sun, 01 Sep 2019 07:12:07 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i4K1s-0006Mj-5A
 for linux-riscv@lists.infradead.org; Sun, 01 Sep 2019 07:12:06 +0000
Received: by mail-pl1-x643.google.com with SMTP id w11so5214891plp.5
 for <linux-riscv@lists.infradead.org>; Sun, 01 Sep 2019 00:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=vKTwNtpfVl/ofq1lszN6uNSXidoJKzu+EuY1m89tIBg=;
 b=nkBdHU1bLcqhB0Pu13xor/HRU8pRbyHtm401VWyDRE09OfgA47ny3+8CsXdIm62QgZ
 6sHuK8HnBmweVy81dP9vA2W6dmBiqC1Wb2mwfWlx3HwjwizUmBrxbTuqmLrYh5IQwUOg
 IeW4PL+tq0zAmAdoH6vgWAyB2sWk8xxbWIW1BwIQWmrP6XANhXQsPToLBlSxOdm11P/L
 TzcS/bG13nyF32qDIcsfaZk/QGb96vFzNz5+5Sno225zTqGNgLp80wKsvaWlFFr1wYY+
 xpoqw0Ig04OhxhMkl+ckQhegRFM6pm1FtEXAlVhDyqCnen3hY4gdIqwBMcg3kQMN082o
 tX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=vKTwNtpfVl/ofq1lszN6uNSXidoJKzu+EuY1m89tIBg=;
 b=Ms9SEUcAcyY8cf3gk6j4BOr7rIzlbxjxoNLhYr92zvU5R9nSha3gZlLagHc+UUm1q5
 /fD1MPRtgVE1glSgBkx9tScx2Xf2aleWVkqvU2VK7dx66fdVZGoYsQQRX3jKcgctXBRn
 juLoUgV/9NTZGaaYx+RMwPSD+CEQtt4kiRo/T9H4Z36eF9S5XerllgoY+u9hCto8j1HN
 AqJVfl3SF6u9QDW68UIhv+lYMtUv1QleswptLSW7inPYclf+quUp3FL8ycO7FJc4MVPn
 GaXzNM1AhWRvQ2LzNdoMA4kJyZpOZN5n/lgMmhnNenCvWya24yjiVlEhBQref+xOcw7g
 +dKQ==
X-Gm-Message-State: APjAAAVOU2aVuyI0In19xc7NOEfBRdJaRG1/SR54n0X8vOpNQFAJpy8k
 CxL+AN3eNIZSWoLfjYXdfIi5KQ==
X-Google-Smtp-Source: APXvYqwQny1Nmrz/C5sgtbnJWlSSGimvrNW83Dy1il6BLDq9WjeTfmJnQVGgEdpz2lT6oF5Pw/kQ/g==
X-Received: by 2002:a17:902:f216:: with SMTP id
 gn22mr25329995plb.59.1567321921847; 
 Sun, 01 Sep 2019 00:12:01 -0700 (PDT)
Received: from localhost.localdomain ([103.81.243.14])
 by smtp.gmail.com with ESMTPSA id b185sm6968998pfg.14.2019.09.01.00.11.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 01 Sep 2019 00:12:01 -0700 (PDT)
From: Pragnesh Patel <pragnesh.patel@sifive.com>
To: palmer@sifive.com,
	paul.walmsley@sifive.com
Subject: [PATCH] dt-bindings: serial: Convert riscv,
 sifive-serial to json-schema
Date: Sun,  1 Sep 2019 12:39:21 +0530
Message-Id: <1567321765-3738-1-git-send-email-pragnesh.patel@sifive.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190901_001204_237409_927202B6 
X-CRM114-Status: GOOD (  13.90  )
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
index 0000000..56fa935
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
+    enum:
+      - sifive,fu540-c000-uart
+      - sifive,uart0
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
