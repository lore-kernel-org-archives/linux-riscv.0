Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFE6C021A9
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 12:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dYJhBeeh2IEYUdoqp9GcHg11Y0qNgrPHFMlGw3fCO8g=; b=3KymW6sZIR3T5z
	W6wZC2DBys6xiltCZRAN5qmLsygb50HiZknkFPbgPX//ZDiK7pVZcWHSudqlKGhaKQf3wDlQ1oNKB
	u6wQmqeD8sGbFhqZkU3NI9cQV/EHS/USxf9gxfmgl9m0qfbTsyMfHyfRc7vIsItriosSckuflF8ti
	i3ZTYxZ7dVCGSYCVfYAklr6qfR7UUjddRWnbAoo05TsByokpq3gkYc7gxhSgBFlKtVCf+HqF9hZar
	wGpVrgnB/tmbBhufYxUd0msp/l8Bk8CA2KjHKN+UdWVuFjmzxEZjTRzlHjOnYgTqVjTkMCiJ9tef0
	3ilST6el/erX87dAswKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk0i6-00000004Y7D-0eDg;
	Mon, 17 Feb 2025 12:58:54 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk0i3-00000004Y4t-1KZU
	for linux-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 12:58:52 +0000
Received: from [127.0.0.1] (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 844CF343083;
	Mon, 17 Feb 2025 12:58:44 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Mon, 17 Feb 2025 20:57:47 +0800
Subject: [PATCH v5 4/5] riscv: dts: spacemit: add gpio support for K1 SoC
MIME-Version: 1.0
Message-Id: <20250217-03-k1-gpio-v5-4-2863ec3e7b67@gentoo.org>
References: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org>
In-Reply-To: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1785; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=WVBz+R9XhlQhdzku9JAMTki0K5OuMCV+ma1IEixq6JY=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnszJjEkNRYJm+jpFpDKfHlEE5r9b/y639sXg/R
 rB574NORAWJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ7MyY18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277eF5D/wL0sPxLR1LrXWnQ3
 4myIo8WzuuteNyHsN7ZkVyzl74Bpe+3nFfUhPrHscL21GlIoj3g7PzUtKU60jBAI3tOrgtVETT3
 D8o2SXsZuMJrUh94Cs6lirwR5QBlkGwwsGSDFr9XoGuMB6p13Kfjx9sm4NPP3BUHD39SIDWRMnG
 4VxxLqKZXn4Fd54HWrl7Rddpm686YWmsnWu3/V8gtn848DSRMZokApH9GlGnMsFmYzFU/GfTSE/
 a5jrfo3dxPTc2b1iYGQ8R0YB345qR0uV/m1mO3ykPwFAHG+g/VkVhIcoY6KttqK5VnXDC7dtvwr
 2X0aYDHHUEUtl1D7nIMq4ALvksnVWilyRKpfsx5QHdZ9PgzOv/q+Psr951hkMhAQkpq/fTt63Pr
 LUj6J18JuW/d87JcBG3RBhnZmBwnEz5Y2fxVIBF7UkZnAJMfrc3iHX/yF/6IXofFI9QI5bmRau6
 AsY0QMPRosDaID9/IGWpYFHCK6F1RFr2rueM+P8JINbrWo/R5ifRi1Q7BHA9eaGxAhl1wKcyJ/i
 yBh/pQhiCGfn9Ry4+yBhY8g9wth3zDSDXDqnM09glVHoF16kVo7PwFgUwCfueqJhB13qI9UQIoc
 ZshpzZwNNN4fxTDZ+vTR0e3bXjLPTqOVvksbGTXs3SQth6h/8itYMFEzpS90LRDTMdjw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_045851_382355_31A606C5 
X-CRM114-Status: UNSURE (   8.12  )
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
Cc: devicetree@vger.kernel.org, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Populate the GPIO node in the device tree for SpacemiT K1 SoC.
Each of 32 pins will act as one bank and map pins to pinctrl controller.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi |  3 +++
 arch/riscv/boot/dts/spacemit/k1.dtsi         | 15 +++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index a8eac5517f8578d60cb45214589ccb45ac376b9a..283663647a86ff137917ced8bfe79a129c86342a 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -7,6 +7,9 @@
 
 #define K1_PADCONF(pin, func) (((pin) << 16) | (func))
 
+/* Map GPIO pin to each bank's <index, offset> */
+#define K1_GPIO(x)	(x / 32) (x % 32)
+
 &pinctrl {
 	uart0_2_cfg: uart0-2-cfg {
 		uart0-2-pins {
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index c670ebf8fa12917aa6493fcd89fdd1409529538b..d65ff76ead8cbe303412954c8abafbefecf8081e 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -404,6 +404,21 @@ uart9: serial@d4017800 {
 			status = "disabled";
 		};
 
+		gpio: gpio@d4019000 {
+			compatible = "spacemit,k1-gpio";
+			reg = <0x0 0xd4019000 0x0 0x100>;
+			gpio-controller;
+			#gpio-cells = <3>;
+			interrupts = <58>;
+			interrupt-parent = <&plic>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			gpio-ranges = <&pinctrl 0 0 32>,
+				      <&pinctrl 0 32 32>,
+				      <&pinctrl 0 64 32>,
+				      <&pinctrl 0 96 32>;
+		};
+
 		pinctrl: pinctrl@d401e000 {
 			compatible = "spacemit,k1-pinctrl";
 			reg = <0x0 0xd401e000 0x0 0x400>;

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
