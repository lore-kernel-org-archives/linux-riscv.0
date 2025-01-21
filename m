Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DF2C02185
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 03:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XKjhPCuWVDuhcb3pmAXGe3OJAgEagrRFoSCWw7+jiv0=; b=LUMWK0I3uDOS/Q
	tpKL3M4BBZgdJ97SbkK8FymN09q8qc4YCRW2n/qSezG//sjD/3xSFRss2YEfppcU8VsPE3y6Xw/0z
	r/pfj5ONxJ65d2YNkdg5i3BIt7JMmC5jl3Yf8iqfCogU/f5Q/k1rgaCyxT3lev92PK2/jj8HwHiR1
	1vvX7CGqX/VetAFbegtDhqeihiA2qp0b1xEorMS5IMvzndNhGBeAI3juJMBF0mBP6JzCEH9dhuCGz
	kNyuuZ5XaX+mG+21SY+4hsw236gLgjbWxMujG94vo79PLTgxCGvbuu21tLPjC1CmzGh3KDcWs+i7d
	CD1E427l1uLvgoXAiA9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta56p-00000006pFq-2oZ1;
	Tue, 21 Jan 2025 03:39:23 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta56n-00000006pEx-2cNl
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jan 2025 03:39:22 +0000
Received: from [127.0.0.1] (unknown [116.227.99.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 88661342F94;
	Tue, 21 Jan 2025 03:39:15 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 21 Jan 2025 11:38:13 +0800
Subject: [PATCH v4 3/4] riscv: dts: spacemit: add gpio support for K1 SoC
MIME-Version: 1.0
Message-Id: <20250121-03-k1-gpio-v4-3-4641c95c0194@gentoo.org>
References: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
In-Reply-To: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2178; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=c67nuX1SWyYm6oK6igpyLH+agNwjaZ2+WqnfxmmcZIo=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnjxbKB8EyJKp9UOI6tEb9R/HxmhGdR8uy59GxR
 v6Lm7DfluqJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ48Wyl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277dZED/9c7R/PVDkWyDj6rJ
 KksTrPBh5zlX7a5kh5kNWkCAKiwJ3CzuFa2xgzCJtm920UB3qtMEHzBXg/mXuQdB6Xnch91yn1q
 IkeoN/7GXNN2R7ZOISPD5BNhfQjjQl7A66fpQBU8Mnl6oDPFkqxZVaWjHMC6n7R5nDiPcq6c/E7
 fs+qIbkvT+73TODSM8HqNrlnhmingI3mOs9FLyst8fbOQlaDa/CtQ0oFSAPJ9MOR6WcaOkIlBRP
 8377No5UrwS0WrBxeEuatW34FNnNv6Ah5mvDojj2tfITSitmOaHmaOhtCHBs/OOnSxaOGXR4Evm
 B9LJvK1DM4h/2YDQvB3159/M9o7sfX2juD9o0NRjyhKaIz4gaR3wRMlwlv1IxS13IF7vZpwfoN8
 Jgv4gf6Zrswe+uBrj37NBfAcBmGvU4iXlA+xMKeO1eYR4Q1OUTlekZTkhH8hEpoW0OmSgvvkzBS
 p2KZhZbw8WRkapaPhW6/rKsAyzKoFhGPZc9r3l6Y0JfWIE5ZUfNnhy8tkWjYxKkHvkdzMIvn8OV
 +eHAzL2ueePiNEKz2xv1R0RjiHTpLi7I80aUdv6T22uc56c92pGYsqx06drZTY2yPIWOsU5JcXq
 rBC80wG6nm4oA9CHgz8qSf7sJ/TvNl/kWySoqHRG1s4GETwe1R9Vu/KkVceA62Dz45jw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_193921_695603_39023DD5 
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
Cc: devicetree@vger.kernel.org, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Populate the GPIO node in the device tree for SpacemiT K1 SoC.
Each of 32 pins will act as one port and map to the pinctrl controller.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 55 ++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index c670ebf8fa12917aa6493fcd89fdd1409529538b..005f24b95d9ddae686dda07932d0086379cff219 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -404,6 +404,61 @@ uart9: serial@d4017800 {
 			status = "disabled";
 		};
 
+		gpio: gpio@d4019000 {
+			compatible = "spacemit,k1-gpio";
+			reg = <0x0 0xd4019000 0x0 0x800>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port0: gpio-port@0 {
+				compatible = "spacemit,k1-gpio-port";
+				reg = <0x0>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupts = <58>;
+				interrupt-parent = <&plic>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				gpio-ranges = <&pinctrl 0 0 32>;
+			};
+
+			port1: gpio-port@4 {
+				compatible = "spacemit,k1-gpio-port";
+				reg = <0x4>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupts = <58>;
+				interrupt-parent = <&plic>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				gpio-ranges = <&pinctrl 0 32 32>;
+			};
+
+			port2: gpio-port@8 {
+				compatible = "spacemit,k1-gpio-port";
+				reg = <0x8>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupts = <58>;
+				interrupt-parent = <&plic>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				gpio-ranges = <&pinctrl 0 64 32>;
+			};
+
+			port3: gpio-port@100 {
+				compatible = "spacemit,k1-gpio-port";
+				reg = <0x100>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupts = <58>;
+				interrupt-parent = <&plic>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				gpio-ranges = <&pinctrl 0 96 32>;
+			};
+		};
+
 		pinctrl: pinctrl@d401e000 {
 			compatible = "spacemit,k1-pinctrl";
 			reg = <0x0 0xd401e000 0x0 0x400>;

-- 
2.48.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
