Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9589C021B2
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Feb 2025 11:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t8f12ASwibT2Sir2QEexISuTbQ4fkWBJYe3cILAvCUE=; b=g7dJHapwOlbYkz
	32/Q2dTTCacyDAhhMkGEbuebbmWi8RWOk+0XOiZP5kZKh0RHwK1JekmCYNyzYARZ1xpN+dDwQ2g6S
	WWf9FLTjbeaZ11s+Gxj+v9q0MqGcw0JRCo/6ZX908qCn/wKSYkY+veB11tjxFZHKkdhzh6OaphKyp
	Xsk5hkeBShG4XpArX9AIE8jrnV3BS5fvoL2hJQ+hh7LdXeYfjq4bO7eqRCbF8a+EYlqzvlKxh2l7G
	/tQl8pLz4defc8j57D2LRO0/FkmuO+x8GR4yW5vJ+IOHzZIQtLq+0LcinFdI5M6D5UIet+7MQRoUl
	ZmQ2LKSOsOpLWuzbNQPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmAVI-0000000B1ax-1w3C;
	Sun, 23 Feb 2025 11:50:36 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmAVG-0000000B1Zp-1CPx
	for linux-riscv@lists.infradead.org;
	Sun, 23 Feb 2025 11:50:35 +0000
Received: from [127.0.0.1] (unknown [180.172.118.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 5ED2A343003;
	Sun, 23 Feb 2025 11:50:28 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sun, 23 Feb 2025 19:49:34 +0800
Subject: [PATCH v6 3/4] riscv: dts: spacemit: add gpio support for K1 SoC
MIME-Version: 1.0
Message-Id: <20250223-03-k1-gpio-v6-3-db2e4adeef1c@gentoo.org>
References: <20250223-03-k1-gpio-v6-0-db2e4adeef1c@gentoo.org>
In-Reply-To: <20250223-03-k1-gpio-v6-0-db2e4adeef1c@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1793; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=wtQfZAe5q6h9LIhqpr/DAcv/omJD+9pnXTTCbG9Weq4=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnuwtp8wjgDLyfsc8/aGEqxfmS8LF+zSDQP7b30
 pFom2BPw+SJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ7sLaV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277RgtEACN3iMvAqmFefluWH
 MoKlUv9qiM5+v8wtcMeAcOFoJJYgHBvRpyE5Osy5gHcMJ8IYEKR0WrpxRWn8x0qWSH1UGn54/cz
 IE2jPpQXF9qcyRRVMgrvL8jBRAARL5iLjqVgQ/ONFE667cRzCuUzWiSPeHqM1P+Hcwf5c6sWixN
 UsGX2oJH37P/dM1aM4pGs0xjylmthAWiAdo3aB0nNzg9OWiVB2gZ4U9TjOtYT6rAuQ7tvLHLUb3
 SJEIxljMXVbT8Wr6VXT0Q5no8vtkiTZ5Iv2Q2DEtJbAXHbjiR8wL1oTLVjj13BFLAhqK2uzKBuw
 92F1MxMeR+GNPnW3hJt17Id2/lb44owjwt6vRIpZFufWmvOhOBqC9JtzQtnToEd6nXQvGQkYGWo
 TfzjYkZfF93uc858ELQqba6F3a1Dw+w5wn5QpJXRKBFp3Y1niVVlgWWg4h4NjZQao0RfioApQTg
 R4sBnW9d6beGgBXrrTWGcC/abXx9EULMaJXzr4ExGEu9c0N1p2rY3TVlHoxI8q+6XBeEqGGGl1z
 Sl01nn41LKAq9mjJOwzkGJtyJEU3Qd9i7A1ccQL96H9OSGk/jH3msTW1lVORpiNXb4MMUlk92BK
 rjTmmnX97Qmb2pCUZxSrS3G1D8hik5Tfs9ZyCdcF9XLaloUKNXXD956e1Oyti3jJit4g==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_035034_361534_89DF68F0 
X-CRM114-Status: UNSURE (   8.02  )
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
index c670ebf8fa12917aa6493fcd89fdd1409529538b..ff86a02c25f2e0818a48ed56c75e911d8612f6d1 100644
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
+			gpio-ranges = <&pinctrl 0 0 0 32>,
+				      <&pinctrl 1 0 32 32>,
+				      <&pinctrl 2 0 64 32>,
+				      <&pinctrl 3 0 96 32>;
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
