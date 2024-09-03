Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AF4CD13CF
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 12:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=itQ6D9uhUxHHgsfFeKQThAp6iE6SMD+lXr/nCSw8UfE=; b=K39rOOkjpv4u8Q
	P/IAJVHwwImLx1wSeI2ydiYQz4gfYb9kli5gg7AcWUIVt/kdJfTjUFedqRJ0QiOTtyIzDtplAQVD7
	xvbGaaJ+LYmcb4zD/cnLQqOKbyF2gWBlOExDiJFtfheoj/i7Q4XQ2rHBzNDVJUzu7Cn/9K1VDm4CL
	L2j2QJu0FFB7KL+eVy0ACLAG4C5Yxx1G8LiKCGovakNZqhpUSfDGT0oRIR6I79oTQMyBdeCcTBGwz
	IaeM7eQQxW5rycQdIeZSWdymcE83QevRK4qcHlIACb60KHc2P59bq226RGlnJDlNSNDr/ob+ZiZPu
	3Z8lBKRZw4+mJyce1Ezw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slSd9-000000009Ib-22G7;
	Tue, 03 Sep 2024 12:27:31 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slSd6-000000009GN-3UzL
	for linux-riscv@lists.infradead.org;
	Tue, 03 Sep 2024 12:27:30 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 03 Sep 2024 12:26:46 +0000
Subject: [PATCH v4 3/3] riscv: dts: spacemit: add pinctrl property to uart0
 in BPI-F3
MIME-Version: 1.0
Message-Id: <20240903-02-k1-pinctrl-v4-3-d76c00a33b2b@gentoo.org>
References: <20240903-02-k1-pinctrl-v4-0-d76c00a33b2b@gentoo.org>
In-Reply-To: <20240903-02-k1-pinctrl-v4-0-d76c00a33b2b@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2235; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=72OUePKJmY9EObBTz2p3oSPWaKFyOulBRCi5gSja9tI=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBm1wCbeyJvCjfwfjk6CxerD0e3wqymKHbG2IGb5
 8rM/z5ULKmJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZtcAm18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277WrOD/9QFex+y4trbZ+gJC
 YHw1005oEpM6MRg7yEsgUPuISrnLXM4a8S8R+J0AQaP7OV0gIF51d7rxqabRAHk9pW+GyAISSS6
 2YeBSA0Wd2luVEy4Ioc2qc0xkqYnuZR62kz/3QN4QG55JI6KRX9UQnSUwau4xNNa2ItFHGCb2cS
 qL8sVNPPdmBZe0TSUMByqV+ndT2SERktZtU0O5xkk1a3JHp6F+p5/99utf+QkkxnwkRxtVvZDtt
 B6lkhaGX5DVjygkugsuTr9Vj7C+Y8yb2w3xMdwOfc4xbMaAJ0IEhZ583peVog/STflOeJsi1nmu
 X44CAmGCODxpuMeTIW9AI5q+8Foc+sL0wt42IJB9rK58aYC+Dkq+e3IGumLNGdQmR1+xntXNxPk
 4Nsy5eYKt0aUnOJFa8sXYAB5SS06M2RKbxe4fqUio1p94ucHLvzyw8V7cIpiy8wk1dhUZJdwnaY
 HFqkW3l8kftO0cuucRmSquFfJ07ByMBcX3q0xUaIloF6j8xzV6OQwCopJYPuzAcSa0UA1wNtCVW
 TJI1OypksHZPzs4+NsFg+DVSleu9QVfWDRwIUVhr/qCzIyBKWMdTGpCbv2FbvisyuADQEL/Jxhk
 s8YcsJ+m3LJWdOfk/xJe6D85+LvkTR7QFEOuviA06Fa0nAeNjnFshLS+TiIHuynhBeNw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_052729_206255_A50B461C 
X-CRM114-Status: GOOD (  12.09  )
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
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Yangyu Chen <cyy@cyyself.name>, Meng Zhang <kevin.z.m@hotmail.com>, Jisheng Zhang <jszhang@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, linux-riscv@lists.infradead.org, Meng Zhang <zhangmeng.kevin@spacemit.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Before pinctrl driver implemented, the uart0 controller reply on
bootloader for setting correct pin mux and configurations.

Now, let's add pinctrl property to uart0 of Bananapi-F3 board.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts |  3 +++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi    | 20 ++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi            |  5 +++++
 3 files changed, 28 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 023274189b492..bc88d4de25a62 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -4,6 +4,7 @@
  */
 
 #include "k1.dtsi"
+#include "k1-pinctrl.dtsi"
 
 / {
 	model = "Banana Pi BPI-F3";
@@ -15,5 +16,7 @@ chosen {
 };
 
 &uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_2_cfg>;
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
new file mode 100644
index 0000000000000..a8eac5517f857
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (c) 2024 Yixun Lan <dlan@gentoo.org>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+#define K1_PADCONF(pin, func) (((pin) << 16) | (func))
+
+&pinctrl {
+	uart0_2_cfg: uart0-2-cfg {
+		uart0-2-pins {
+			pinmux = <K1_PADCONF(68, 2)>,
+				 <K1_PADCONF(69, 2)>;
+
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+};
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 0777bf9e01183..a2d5f7d4a942a 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -416,6 +416,11 @@ uart9: serial@d4017800 {
 			status = "disabled";
 		};
 
+		pinctrl: pinctrl@d401e000 {
+			compatible = "spacemit,k1-pinctrl";
+			reg = <0x0 0xd401e000 0x0 0x400>;
+		};
+
 		plic: interrupt-controller@e0000000 {
 			compatible = "spacemit,k1-plic", "sifive,plic-1.0.0";
 			reg = <0x0 0xe0000000 0x0 0x4000000>;

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
