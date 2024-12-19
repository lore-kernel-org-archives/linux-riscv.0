Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DC5E77184
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Dec 2024 07:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T+AmbeGWSQjlxwhnz4Wmk6uDGG+iqH+sP0+F5mMjjVM=; b=pqdJ61dgKsNKO8
	iruSQGVf6e7fIanLnm2PAGcULsyaCLKq6Qll2uL1m4veNJKImjOEKnpPEa+qDDfKHiNWJ4q719Mxk
	7sfjFt6/QvzW2E++ahqJiMtSUMMywbDuGIDvjKO6kE9pMzHp0pW4msQtdPWqp+swL12vKOMzaqsW+
	pGQElw6ZmN35SLw06D6HFCclVSIjo8/iZnuUDXUV3gLzoJkPPLdn0uN7vBx2HPv79EDgMIvTL+gCn
	/xwSgTEQcI2qWrANOj1/9ublfE4vnRcDQbhfjHQzP2N6/lpGmrSzAcG0RLM9OxVeZAFiQ4TVCO6Qw
	xuxSGawuU7oP5fXkUV2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOAo4-000000013hn-49sv;
	Thu, 19 Dec 2024 07:18:48 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOAo2-000000013gn-3g0X
	for linux-riscv@lists.infradead.org;
	Thu, 19 Dec 2024 07:18:47 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 19 Dec 2024 15:17:45 +0800
Subject: [PATCH v2 3/3] riscv: dts: spacemit: add gpio support for K1 SoC
MIME-Version: 1.0
Message-Id: <20241219-03-k1-gpio-v2-3-28444fd221cd@gentoo.org>
References: <20241219-03-k1-gpio-v2-0-28444fd221cd@gentoo.org>
In-Reply-To: <20241219-03-k1-gpio-v2-0-28444fd221cd@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=8k9ZtiUx47mbBAMnpFiZwSbwpeenY/eKCaJy4BYVKmc=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnY8i4EceF6Gs079MvZbYKcN5sLCLXXWwNziHU3
 JPXJwbDXYWJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ2PIuF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277YI1D/oDKcjA3apmQ3Anjp
 ebtiMVXd64vaS6P1BS3Q93YZQzYikbuHKCCMrEfkyYgIVSIOYO+NO0KgJ3xkL37q7rkVYnzr/7w
 LvqaAfI+e0l8jUE0D65ya0BAPkOGYIpEoEdWns2ynXFhqkiJlWpb3NBekZ/YtRoUc6ccugmDIPS
 XcShp7Qq4/2l75obrkplYCCHVAPobVgaTkN99Fexith6JvQXsQrsrt8gqdgZbGtniX32Mo0gt4K
 qF19x2ZyRTR7wDaO5QUTHStvF0coZkJGMlc602IOxGoqZpWRLLN0SlE416NEhBrCu5PCmsBzI20
 VCCg9ozkr57OjpAKUXxttM2Kvm8/5+Ow8uVOcKTcMSgLPnrlpvrR2JVVlFDzcHEoDNKjLZ7YRIt
 9qsAFFB3bV6j5KkKOeT3nI77LECaVyfxVvJJV45BahbGlFpXOVp2+1hP2o0GD4tM35uWIkenuHZ
 7Q5O10OkOwxGf1tReMa9Ak/IwXQBPvIfHnz/2oY8Mru3UqT2B8VJuJxwo8t2QdDe/df/MSdQqHO
 RxgQCmbXkC6dbmAjjemvF8hqhljFUn/HNyu9Ej6B0FVnngSjUha6cKSf55+mMY+1ZsKoUnauJOZ
 fD943wJIGjp2xNjofyZWLTJ1FERgkQJptObUz3rbeuaffN6tipVryT9xhUe7nZCiu/Kg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_231846_943563_BF10CE70 
X-CRM114-Status: UNSURE (   8.21  )
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
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, Meng Zhang <zhangmeng.kevin@spacemit.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Populate the GPIO node in the device tree for K1 SoC.
Also, map all 128 pins as GPIO to the pinctrl controller.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index a2d5f7d4a942af26b3ba991928f23b2d9943366a..648b459597a4d0ecb6a29881dac76bd4cd749c8c 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -416,6 +416,19 @@ uart9: serial@d4017800 {
 			status = "disabled";
 		};
 
+		gpio: gpio@d4019000 {
+			compatible = "spacemit,k1-gpio";
+			reg = <0x0 0xd4019000 0x0 0x800>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupts = <58>;
+			interrupt-names = "gpio_mux";
+			interrupt-parent = <&plic>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 128>;
+		};
+
 		pinctrl: pinctrl@d401e000 {
 			compatible = "spacemit,k1-pinctrl";
 			reg = <0x0 0xd401e000 0x0 0x400>;

-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
