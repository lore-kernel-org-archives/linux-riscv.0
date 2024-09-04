Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9612DCD37B5
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2024 00:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kUVp6K6B/rVXLvrG9fkqE8DGgNwRArh3T9s4LQmshvo=; b=2LZ1/Jp8HGf5Lr
	V5tmnjKXRL9uhh1pwcRjxn8Da5o0uW2Xj/iyafCa5ZeHVneLlsSfKAUbSoWH3IOCL7i4BCcbruAN3
	TqXyS3VDVkwMzCQ5K1myCuIQMZa0VhF2DpvoxZYavIIGK16vTfN7gTVfkEwr1//NwELvHr48r9Ngu
	b8lPzM6l5s6OMOjgyyXgmV631g+j/pI5ReMZcuWc27UPzMQHgTA38GwgaI4OlEr24ZRyeHycJLXm2
	RmHU5bP95luxqQ0GQQOUKaPImeK0mGip5y5ihi2u1DlRwQmzLRB9IeZDVtatW6fY/A16AOxU3/wOz
	sXzftSxRgLnBUqTcoWgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sldsW-00000002NSF-1whq;
	Wed, 04 Sep 2024 00:28:08 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sldsT-00000002NQk-3GtW
	for linux-riscv@lists.infradead.org;
	Wed, 04 Sep 2024 00:28:06 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 04 Sep 2024 00:27:25 +0000
Subject: [PATCH 3/3] riscv: dts: spacemit: add gpio support for K1 SoC
MIME-Version: 1.0
Message-Id: <20240904-03-k1-gpio-v1-3-6072ebeecae0@gentoo.org>
References: <20240904-03-k1-gpio-v1-0-6072ebeecae0@gentoo.org>
In-Reply-To: <20240904-03-k1-gpio-v1-0-6072ebeecae0@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=gy4hAKBYfvoYkNXZdcCiPvChAhmVEjnxfrdfroixmG0=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBm16mAzKQqhIRAHRj8x0eR0whqAE38Cg8Ov60Dg
 DzdoEyXVd2JApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZtepgF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277apQEACJgGBpAHyaenJ7eF
 T7/Q8syncOfzBxoTm7WYnlaM23Wup3C4/KD2+u0c7pRKkNgQp+K3OdqRUiO1C8pb72qQIEFHgv+
 zH2HKGcPstHabN3mw442MeRuuqla6vyX/GtS/UvBY/u4fErG7eCCbW7tWHcWgYXXCxWGHKqHbUK
 LSymTQg2IOLLIayOtuwwBqmHVk1yE12B9D91+Gn6sNZU+XCCrWX8tfsl5aS1xTSvvxENQoRO8fN
 WsUM7M/7aNXXrYMa3QASsQlgjY7ygyrjmBrtjlw2l5czaCtnQbp4ZJCpzM8bt8M+HnM3OVFr+yF
 A5c50uwUhCcy/y68IZJ9ttLVMrAEFEjLgOk0LbcP/PhMkLTg3+958cZSFIlkF/szBS7Cp95oCge
 Vr5cF6wHtezAte9s/h1BnfXj7AFpVc357t4c9OENS748G44D1U1fFuak6U0vuBVc+/2DFRlkF73
 Z0xfk+LFOkU8fzQo2yr/++kh/C8Azro0ztPI41XQHr2ebAET70n3jd0QbY5A1drZkjOFYqKj6RN
 lzOW//tphdlNAv+XNwZ4AnC/flVSb4EsR1wfUJDXfFLwsh/dddvwhGfCgnQjleX2ogYFIlhalu5
 UuaKZQ6Ly89+3cQ1nnan5hjkprBN7ONfRNp7ZpdAeVZ2WzE91p2j0EDHgeZWsg/2MjuA==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_172805_878248_4887090E 
X-CRM114-Status: UNSURE (   8.18  )
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
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Yangyu Chen <cyy@cyyself.name>, Meng Zhang <kevin.z.m@hotmail.com>, Jisheng Zhang <jszhang@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, linux-riscv@lists.infradead.org, Meng Zhang <zhangmeng.kevin@spacemit.com>
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
index a2d5f7d4a942a..648b459597a4d 100644
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
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
