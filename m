Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C51C54ED1
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 11:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fk/ulSjZyQnqkm3RuwUwdugtJlJigeO6ZDn9LNFKdF0=; b=1B/gUSsLErZemD
	6ZmPCwRtkkIPvFpwY+ifjJDk0/I0dQtQvd4wKDwhA1b4SQmrBHIl6z2CXDQFCU6U8yn64uYgM9mby
	+chLDux1S4neL6Bl1LuSan+wPX+XkAhYRDoE1yti5gGXMgq4WkCSnqzrNgSOpf6rEyrfHU/i1WhtC
	yRdy5Sd16SDPDMphCs4yUKlZOoMK29d3tmP38Y+BNsw2Kwh5c/3q+xU9XzQwXXOgHcCLwNKE8iIEb
	54Nx+D+5M8Dd/Pj3B9JxYY6WcUIYBqFF7aoT+snPuFNh/zvSbQ3V3Zud1lC34bZXqXekKAHSzlpIa
	OOiVcEnsNF6zP8q+l2jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjGtf-0000000F9ZT-2zwd;
	Wed, 28 Aug 2024 11:31:31 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjGtd-0000000F9Xk-0KLe
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 11:31:30 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 28 Aug 2024 11:30:25 +0000
Subject: [PATCH v3 3/4] riscv: dts: spacemit: add pinctrl support for K1
 SoC
MIME-Version: 1.0
Message-Id: <20240828-02-k1-pinctrl-v3-3-1fed6a22be98@gentoo.org>
References: <20240828-02-k1-pinctrl-v3-0-1fed6a22be98@gentoo.org>
In-Reply-To: <20240828-02-k1-pinctrl-v3-0-1fed6a22be98@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6744; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=p1p1WAL05rt3WJ7NUwpBBLmgwfVLHLe/43l/u/2X4eE=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmzwp7UaNcqoOgW2J0wg376lgyuJaVkokNaZ+tY
 LP1nXrTkw+JApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZs8Ke18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277Q/4D/4kSvQy+byExoIneB
 hcrqBuTDkXAxeZxTEYQLUf7/pLf9uqYHWHlzuAUfMAIUgKuVIV5AP6uus/UF0w8wgqnkbPsa4cu
 5MfGhd+f+C6q1QjaOBihRmlOsID/fkAesYzVUnHvdJwt5CS+KObs9Kw4a9a61GmSR4atF3FaxcN
 x36Y9/C9RF6KtjG5wKuEyQyyStiOBPniWmLWnjJz4VxJ6V6Qzaoycah7L8H9S+TvbIysclabrkT
 nEvcbBb3AYN87PSmvpOAbcXhgSHJSuCdEwDRJWWN/GoZIb+8zzGJqlL/Mzu0yHqPA8F2TLIFP/Q
 N/nZv9FyWGOip6av2h9MZ/QO+NMkzBf3Vv1Q97fnc3qZBq/HpCx13N7R8creCTQMKQ7WcCmgtLC
 7Wa7JIKiRrKG1uKER7yxLq7wM5n+jVHxLGr6Mmi6RIJ34927DBz0jod6hYcEXJqtwAi8g4b3NnN
 rDY9xHC1GFZ1Ait0lOQ7j3YUgEd8xc9qZ9ZLb+dYCCUcir3Ga45LZMZSSgCqHC3T5WxbnCuRGLp
 rlLEdNL/xCt5sM+19DaBNXnxXzQN/qsNjSUTI+53ZWoQIm4j3Y27cfh3y8vawBAWBYA+lH7Isxk
 HKDG2aGeFUJAC9Z8mQ6tSikWJk7wfINH4sUd/TdiNJ7i7BXdSFiqz5ZxFWtcgA5butbw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_043129_179689_9591A5E3 
X-CRM114-Status: GOOD (  11.61  )
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
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, Meng Zhang <zhangmeng.kevin@spacemit.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <jesse@rivosinc.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add pinctrl device tree data to SpacemiT's K1 SoC.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Note, only minimal device tree data added in this series,
which just try to demonstrate this pinctrl driver, but
more dt data can be added later, in separate patches.
---
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi |  19 ++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.h    | 161 +++++++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi         |   5 +
 3 files changed, 185 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
new file mode 100644
index 0000000000000..1082f92753176
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (c) 2024 Yixun Lan <dlan@gentoo.org>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include "k1-pinctrl.h"
+
+&pinctrl {
+	uart0_2_cfg: uart0-2-cfg {
+		uart0-2-pins {
+			pinmux = <K1_PADCONF(GPIO_68, 2)>,
+				 <K1_PADCONF(GPIO_69, 2)>;
+
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+};
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.h b/arch/riscv/boot/dts/spacemit/k1-pinctrl.h
new file mode 100644
index 0000000000000..3be4e29553c29
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.h
@@ -0,0 +1,161 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
+ * Copyright (c) 2022-2024 SpacemiT (Hangzhou) Technology Co. Ltd
+ * Copyright (c) 2024 Yixun Lan <dlan@gentoo.org>
+ *
+ */
+
+#ifndef _SPACEMIT_K1_PINCTRL_H
+#define _SPACEMIT_K1_PINCTRL_H
+
+#define PINMUX(pin, mux) \
+	(((pin) & 0xffff) | (((mux) & 0xff) << 16))
+
+/* pin offset */
+#define PINID(x)	((x) + 1)
+
+#define GPIO_INVAL  0
+#define GPIO_00     PINID(0)
+#define GPIO_01     PINID(1)
+#define GPIO_02     PINID(2)
+#define GPIO_03     PINID(3)
+#define GPIO_04     PINID(4)
+#define GPIO_05     PINID(5)
+#define GPIO_06     PINID(6)
+#define GPIO_07     PINID(7)
+#define GPIO_08     PINID(8)
+#define GPIO_09     PINID(9)
+#define GPIO_10     PINID(10)
+#define GPIO_11     PINID(11)
+#define GPIO_12     PINID(12)
+#define GPIO_13     PINID(13)
+#define GPIO_14     PINID(14)
+#define GPIO_15     PINID(15)
+#define GPIO_16     PINID(16)
+#define GPIO_17     PINID(17)
+#define GPIO_18     PINID(18)
+#define GPIO_19     PINID(19)
+#define GPIO_20     PINID(20)
+#define GPIO_21     PINID(21)
+#define GPIO_22     PINID(22)
+#define GPIO_23     PINID(23)
+#define GPIO_24     PINID(24)
+#define GPIO_25     PINID(25)
+#define GPIO_26     PINID(26)
+#define GPIO_27     PINID(27)
+#define GPIO_28     PINID(28)
+#define GPIO_29     PINID(29)
+#define GPIO_30     PINID(30)
+#define GPIO_31     PINID(31)
+
+#define GPIO_32     PINID(32)
+#define GPIO_33     PINID(33)
+#define GPIO_34     PINID(34)
+#define GPIO_35     PINID(35)
+#define GPIO_36     PINID(36)
+#define GPIO_37     PINID(37)
+#define GPIO_38     PINID(38)
+#define GPIO_39     PINID(39)
+#define GPIO_40     PINID(40)
+#define GPIO_41     PINID(41)
+#define GPIO_42     PINID(42)
+#define GPIO_43     PINID(43)
+#define GPIO_44     PINID(44)
+#define GPIO_45     PINID(45)
+#define GPIO_46     PINID(46)
+#define GPIO_47     PINID(47)
+#define GPIO_48     PINID(48)
+#define GPIO_49     PINID(49)
+#define GPIO_50     PINID(50)
+#define GPIO_51     PINID(51)
+#define GPIO_52     PINID(52)
+#define GPIO_53     PINID(53)
+#define GPIO_54     PINID(54)
+#define GPIO_55     PINID(55)
+#define GPIO_56     PINID(56)
+#define GPIO_57     PINID(57)
+#define GPIO_58     PINID(58)
+#define GPIO_59     PINID(59)
+#define GPIO_60     PINID(60)
+#define GPIO_61     PINID(61)
+#define GPIO_62     PINID(62)
+#define GPIO_63     PINID(63)
+
+#define GPIO_64     PINID(64)
+#define GPIO_65     PINID(65)
+#define GPIO_66     PINID(66)
+#define GPIO_67     PINID(67)
+#define GPIO_68     PINID(68)
+#define GPIO_69     PINID(69)
+#define GPIO_70     PINID(70)
+#define GPIO_71     PINID(71)
+#define GPIO_72     PINID(72)
+#define GPIO_73     PINID(73)
+#define GPIO_74     PINID(74)
+#define GPIO_75     PINID(75)
+#define GPIO_76     PINID(76)
+#define GPIO_77     PINID(77)
+#define GPIO_78     PINID(78)
+#define GPIO_79     PINID(79)
+#define GPIO_80     PINID(80)
+#define GPIO_81     PINID(81)
+#define GPIO_82     PINID(82)
+#define GPIO_83     PINID(83)
+#define GPIO_84     PINID(84)
+#define GPIO_85     PINID(85)
+
+#define GPIO_101    PINID(89)
+#define GPIO_100    PINID(90)
+#define GPIO_99     PINID(91)
+#define GPIO_98     PINID(92)
+#define GPIO_103    PINID(93)
+#define GPIO_102    PINID(94)
+
+#define GPIO_104    PINID(109)
+#define GPIO_105    PINID(110)
+#define GPIO_106    PINID(111)
+#define GPIO_107    PINID(112)
+#define GPIO_108    PINID(113)
+#define GPIO_109    PINID(114)
+#define GPIO_110    PINID(115)
+
+#define GPIO_93     PINID(116)
+#define GPIO_94     PINID(117)
+#define GPIO_95     PINID(118)
+#define GPIO_96     PINID(119)
+#define GPIO_97     PINID(120)
+
+#define GPIO_86     PINID(122)
+#define GPIO_87     PINID(123)
+#define GPIO_88     PINID(124)
+#define GPIO_89     PINID(125)
+#define GPIO_90     PINID(126)
+#define GPIO_91     PINID(127)
+#define GPIO_92     PINID(128)
+
+#define GPIO_111    PINID(130)
+#define GPIO_112    PINID(131)
+#define GPIO_113    PINID(132)
+#define GPIO_114    PINID(133)
+#define GPIO_115    PINID(134)
+#define GPIO_116    PINID(135)
+#define GPIO_117    PINID(136)
+#define GPIO_118    PINID(137)
+#define GPIO_119    PINID(138)
+#define GPIO_120    PINID(139)
+#define GPIO_121    PINID(140)
+#define GPIO_122    PINID(141)
+#define GPIO_123    PINID(142)
+#define GPIO_124    PINID(143)
+#define GPIO_125    PINID(144)
+#define GPIO_126    PINID(145)
+#define GPIO_127    PINID(146)
+
+#define SLEW_RATE_SLOW0		0
+#define SLEW_RATE_SLOW1		1
+#define SLEW_RATE_MEDIUM	2
+#define SLEW_RATE_FAST		3
+
+#define K1_PADCONF(pin, func) (((pin) << 16) | (func))
+
+#endif /* _SPACEMIT_K1_PINCTRL_H */
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
