Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20293C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Feb 2022 16:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N7MxS1AQUiPOD+pxwjMGzP+wL4KtqwPY7ZkyctVSnM0=; b=ERPzbh5FGj1OcO
	h8usDhORdOl4RKB3PDlqvX+ZtgCpMqKu5iecLcK4kBA0K6pEXYFFneS/MkX0Uj5mBmA8PYTNMPfZm
	H09qpWklb2HyXJ6G/FRfengKEtd6hs2pjMUY/VqUHFxAGb/XlJnhuvVLl6EUCRCw6pMaLdgzjcUkw
	NVbnX8+qq9O4fVX7dyFuKf5jL/cR7ruOE7jKrMxSZhbk/3HiPINBJaIvk1LTAOZHLOld6g1k3RFlU
	D2Ai2RD4FoZr6xDw9XIa8wPOyDZwERFPZUyaESlzRczH0eStTItH6/GP/kIwBjKXwcFp8nQ4g6Z1s
	4406MAQHKDZrh/MVrXrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nH6w9-00B6WR-OI; Mon, 07 Feb 2022 16:32:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH6o2-00B3qs-5B
 for linux-riscv@lists.infradead.org; Mon, 07 Feb 2022 16:24:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644251038; x=1675787038;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EtYuILF7xkob3kdvffJYLceJMqnJTJAXi3Gd2XazbpE=;
 b=MEMAAt5XZjyNkx5VEkWxFedGzx+HEypq/sNhZTIKBfuJSHkhA+NSH70R
 0mHneB5iYgwUTwqINC4FPFWs/yhj5ocK8YRBZ/6+XZTDIHySScawDqFbR
 0j2LKOyT/A/6l2pCPfHAyZsjp1jhw2Plx3MWU/xXnX3AKDF4WifHciNYI
 1LpFzcn69oJrq239xmJWqCJTc3y0GW6q6xFmKydpchrA2/fVMkq1rvP42
 h3tTrwWbYdgBJh5mnhL475aW8UxTxrnN7GqOAxhO/zzhs4CVaFMTrrbSJ
 QznFroyMd5TQ+22UCD5Ccc3KTAosEhMXsICRJg3tKtGa1ueXvKzWyLKXG A==;
IronPort-SDR: 7YV8HRI5rXY7Vn6T2TxIMpNcJ3Rm+MahC19d9vcNiJQK7iRLdGOTa4+zFKH/7kyesesrHAZX3d
 Mbd3Wc338Rq/ecaTv3gBC25LmQGQhhzZ+C7wTtPLqyAnJYFkgosxUwa1sMg9IBUu7W0HfU9+hA
 5DUdePk8XYehKYfUZVZT7hojdGoTnjpU23S3jwEMLLu6T+f7vqDmB7F1ugFuHtoqkuWWLWI0NP
 KzUnL93Jgm5U4fCSzrB+qIFZ5fB6ONP/lentWHIDmUowqTx3PDuWazcgUufwB7V/Y0wQZbIUZU
 +oMx5xmhTv4mWHzHRaHSgnLe
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="152200144"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Feb 2022 09:23:57 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 7 Feb 2022 09:23:55 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 7 Feb 2022 09:23:51 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh+dt@kernel.org>,
 <jassisinghbrar@gmail.com>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <geert@linux-m68k.org>, <krzysztof.kozlowski@canonical.com>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
CC: <bin.meng@windriver.com>, <heiko@sntech.de>, <lewis.hanly@microchip.com>, 
 <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
 <ivan.griffin@microchip.com>, <atishp@rivosinc.com>, Rob Herring
 <robh@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v6 01/12] dt-bindings: soc/microchip: update syscontroller
 compatibles
Date: Mon, 7 Feb 2022 16:26:27 +0000
Message-ID: <20220207162637.1658677-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220207162637.1658677-1-conor.dooley@microchip.com>
References: <20220207162637.1658677-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_082358_328244_2F001C0D 
X-CRM114-Status: UNSURE (   8.19  )
X-CRM114-Notice: Please train this message.
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

From: Conor Dooley <conor.dooley@microchip.com>

The Polarfire SoC is currently using two different compatible string
prefixes. Fix this by changing "polarfire-soc-*" strings to "mpfs-*" in
its system controller in order to match the compatible string used in
the soc binding and device tree

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 ...larfire-soc-mailbox.yaml => microchip,mpfs-mailbox.yaml} | 6 +++---
 ...s-controller.yaml => microchip,mpfs-sys-controller.yaml} | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename Documentation/devicetree/bindings/mailbox/{microchip,polarfire-soc-mailbox.yaml => microchip,mpfs-mailbox.yaml} (82%)
 rename Documentation/devicetree/bindings/soc/microchip/{microchip,polarfire-soc-sys-controller.yaml => microchip,mpfs-sys-controller.yaml} (75%)

diff --git a/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
similarity index 82%
rename from Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
rename to Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
index bbb173ea483c..082d397d3e89 100644
--- a/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/mailbox/microchip,polarfire-soc-mailbox.yaml#"
+$id: "http://devicetree.org/schemas/mailbox/microchip,mpfs-mailbox.yaml#"
 $schema: "http://devicetree.org/meta-schemas/core.yaml#"
 
 title: Microchip PolarFire SoC (MPFS) MSS (microprocessor subsystem) mailbox controller
@@ -11,7 +11,7 @@ maintainers:
 
 properties:
   compatible:
-    const: microchip,polarfire-soc-mailbox
+    const: microchip,mpfs-mailbox
 
   reg:
     items:
@@ -38,7 +38,7 @@ examples:
       #address-cells = <2>;
       #size-cells = <2>;
       mbox: mailbox@37020000 {
-        compatible = "microchip,polarfire-soc-mailbox";
+        compatible = "microchip,mpfs-mailbox";
         reg = <0x0 0x37020000 0x0 0x1000>, <0x0 0x2000318c 0x0 0x40>;
         interrupt-parent = <&L1>;
         interrupts = <96>;
diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
similarity index 75%
rename from Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
rename to Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
index 2cd3bc6bd8d6..f699772fedf3 100644
--- a/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/soc/microchip/microchip,polarfire-soc-sys-controller.yaml#"
+$id: "http://devicetree.org/schemas/soc/microchip/microchip,mpfs-sys-controller.yaml#"
 $schema: "http://devicetree.org/meta-schemas/core.yaml#"
 
 title: Microchip PolarFire SoC (MPFS) MSS (microprocessor subsystem) system controller
@@ -19,7 +19,7 @@ properties:
     maxItems: 1
 
   compatible:
-    const: microchip,polarfire-soc-sys-controller
+    const: microchip,mpfs-sys-controller
 
 required:
   - compatible
@@ -30,6 +30,6 @@ additionalProperties: false
 examples:
   - |
     syscontroller: syscontroller {
-      compatible = "microchip,polarfire-soc-sys-controller";
+      compatible = "microchip,mpfs-sys-controller";
       mboxes = <&mbox 0>;
     };
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
