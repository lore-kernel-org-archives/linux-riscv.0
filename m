Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F8DC369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 10:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n6YV0WE096Wd4CZzAGxHy6omUQF6nCG1eI1QMGZ1Ej0=; b=Gg7IVXQZPjilGX
	ZlwTBUVlX7+QkwcTgWKQutXkLpmFX62gQXNhB5EYxGw2DAXpjb3qDicZqKr8cMjZR836v6GGijw8C
	62BUcTVMDvjb3Yn0wttYsPSwANSfNN2El354pZ3sIwdxWFm6zL2dQecyfFvLNZaIj0dCtGUlcJwAH
	rcHcQ2wS6fmRYCmrngesr3uS1rNJd/WCBZtuy3qx/gSaTdqSwrO7p1Y6bDVfSZvHNMBdqOYrSMOJc
	OqGSRoNi8jLdDo1J7rOFT3dsqi5QrhSGOYnC5DHm61T8KxBR1NDeid0vyi1FfmSg4/0hZi0jGZE+e
	o3dtvXQFqrFiMuxYkYww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7u1A-0000000DiWz-2xlA;
	Thu, 24 Apr 2025 10:41:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7t5X-0000000DXs5-14Rx
	for linux-riscv@bombadil.infradead.org;
	Thu, 24 Apr 2025 09:41:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=5eLNtZrmvnbYSyqRCVzLByDD8J5mZe+/x3gMPpX9h4o=; b=bNmeJxcpTz4GV0KdkQa6DB17cD
	Yhk6ZqXe/2ovdbtNDZ5TBDRYcB+J66h1AM0egnboqd44u0dVsetVrRyS0mtkyLjxI1al168K4obbI
	VAVa1wtmSQ/Lwx6FXqTBW83rg3SLn4V5ml6m33ZnIlkV9WYctiMvJsahXOZyln+su3knbup7diATx
	Uf5ffnj6Q1AEymNcAY9hAyi1Vot3SlNKIybKKRnuy6rX2Pn1eIQcaJX+Y1mnPjdOaLk/mGDhDumtp
	9YUOPqONaWc3C2IiuFLYdxjPTLhd54Kc6/BQmcQ8GLCF/wCNT1On287p66oFUyVjNz9fi/Vh13z72
	mh/q4koQ==;
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7t5U-0000000Bh7K-1Gjn
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 09:41:46 +0000
Received: from [127.0.0.1] (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 36248341C25;
	Thu, 24 Apr 2025 09:41:34 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 24 Apr 2025 17:40:50 +0800
Subject: [PATCH v9 2/3] riscv: dts: spacemit: add gpio support for K1 SoC
MIME-Version: 1.0
Message-Id: <20250424-03-k1-gpio-v9-2-eaece8cc5a86@gentoo.org>
References: <20250424-03-k1-gpio-v9-0-eaece8cc5a86@gentoo.org>
In-Reply-To: <20250424-03-k1-gpio-v9-0-eaece8cc5a86@gentoo.org>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1905; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=iNaOoUEoymoBiBYdwwkQ25zsZpW8c2VndainDOUrHVE=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoCgc8f6B1lgW+pmYKJ6f8TDONFg/Knz7C48t87
 4C3VC1YsFWJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaAoHPF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277btkEACZ0kHXXxE62dVklV
 +deYMCDSMF+LM7Q/yLJzv2wcuzKsOjlJY2gVwjs4feeLdh7Ni3RmRzzSRpdGD7UqQ0asTLQRMuk
 P75RK7PexH/vFp/kBrLDp9qUyf3GvRG54luADGWjnWvb+FCM636Os0Z+oDaf9dBKxZ1+4qo1ojp
 Ft6NzujtxXrkSaYoW0zvHwJWxy/jyiXrwcFKt4fP3qV7tcjkaRwM+80e9RTPv5pt0ZlTF87MrMd
 PT8Z83jXXuwAAk9ExwYudHu8icKwzF91D5JXlf791+1L8/S5V55ae2Ps6/uSg6rwHm3C7BBMvvs
 +FXNh9mvBd3ha13AhLK/YhvkOCEeo0CaPuZC3MiyMFKMar6ICEkveHz33VVwylFMUggVG9Fw0DN
 To+RqlnH2Vdxb1F3kuZReiRUbcBY9AyNd4RTxMuryP8hW5/B1BysY2Wr9VH+zL2nebKHJW6VQi5
 v5jwzUcQhA9o+1I3keuxpdzAGcLYUP6TEXzwItgR4V1iexfNkL3e4PvHpw0aSnhCqBtGmYP65x0
 gWJXNo4gxvVdNzWjUeBhb1nkE4G6QUbuhyksak/wzESFwJItToebRsM8z12tt6asMVHSc5s9f83
 rDdZp7us/ISwtPHGkaxaPly55gIvNm2ciglx/r+RIr3KybTZYnbdTif1sVmLQOcB1fOg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_104144_684370_941AD666 
X-CRM114-Status: UNSURE (   7.38  )
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
Cc: devicetree@vger.kernel.org, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Populate the GPIO node in the device tree for SpacemiT K1 SoC.
Each of 32 pins will act as one bank and map pins to pinctrl controller.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi |  3 +++
 arch/riscv/boot/dts/spacemit/k1.dtsi         | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+)

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
index 584f0dbc60f5b0d078c7127cc4021ad6022cb182..fbc4f1965c52c4f1aa80eaa0cda97a4be438c4f2 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -447,6 +447,24 @@ uart9: serial@d4017800 {
 			status = "disabled";
 		};
 
+		gpio: gpio@d4019000 {
+			compatible = "spacemit,k1-gpio";
+			reg = <0x0 0xd4019000 0x0 0x100>;
+			clocks = <&syscon_apbc CLK_GPIO>,
+				 <&syscon_apbc CLK_GPIO_BUS>;
+			clock-names = "core", "bus";
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
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
