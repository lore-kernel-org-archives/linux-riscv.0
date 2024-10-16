Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C03CD2068A
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 01:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xxFciF8GdlmXRgC8J8UKrN3l7dQ/Fet5W6szkzfXstk=; b=fTzrZGv69Izbbp
	CygWXt6c14lYGh8dV5tTihUgunBPk3NeH8bRneX5J9ZY+hA5XdDQyvZYPs7o/Grx/l/I2Y83d4Sps
	gRo8pVruFXh5Zs/JU8FHKH7eahyGDkVjIzCX3O9xUwDIiTNQXhcP/cjHtSV6fG8nz1kN+xpbVFhVg
	1s54cJcqrDd7I4qcS/SCkTdTckDlRVGjiEZaPIUqs6jmf3bKAjPx88sMQAxgcvQ+etqPRWSU89LOM
	UZJSl5DBGRvbxbxttkPObaXfGphTorVGz0KP1b6kQThHJGx7KqzUDgKfjbIBJE9RTmtJq57Qul5Yo
	UZuJPFRHMpv/4s/I1PQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0sOo-0000000A3ev-2chr;
	Wed, 16 Oct 2024 01:00:26 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0sOm-0000000A3dk-0DMC
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 01:00:25 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 16 Oct 2024 08:59:43 +0800
Subject: [PATCH v5 3/3] riscv: dts: spacemit: add pinctrl property to uart0
 in BPI-F3
MIME-Version: 1.0
Message-Id: <20241016-02-k1-pinctrl-v5-3-03d395222e4f@gentoo.org>
References: <20241016-02-k1-pinctrl-v5-0-03d395222e4f@gentoo.org>
In-Reply-To: <20241016-02-k1-pinctrl-v5-0-03d395222e4f@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2397; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=3f4GLOsluvHuCgnEd7+tScd/3iBGplIPsNtjui2V1jw=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnDxAUXO1zc9Ta5tpeIyJ2hq8POoNXUp36J5SWW
 j325v/ZbzCJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZw8QFF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277fn2EACeD6FHKXHz5bLlk9
 YMe230S4sl1NDB31Ct1jK3fgjJv4E1eKpGO3Wjj696e/f13vBKIfW1VLXzncYCifOQqV1yfGrRX
 wSdZOgA8RYiq8JGNn7DBvENGHjkDcQulGNZo7kac8SpHmLTeucu3R8BuQ1hj9nY+ABgYxp/dvhV
 PQKt35+Vxnd3PqVqt6HAl3sEpzFH4JnRBPKn2SDRa65UgWJ2BDQIm2UiMVcNO5uqx0cvZZlhxVg
 XTJd24XxFH8jlv/SNIXVRebnT1AN8yzs0Gspzk4EV2p5gz1VgSoLk0u94hYE8Vkz/s3+75Fk+vY
 2T0H4CgfhfhL0GQvWy0zOPSVNE75TdV/YAnKIkL/afOaNowm5af/l8FFHssDjcg8CKN/wIKN4N/
 y5e2hIb1oIKYs+cuLuTjT4uKq8b1p6OsGwmdDmn9X+r/69YNIrsebG8M4F5TVAQNDV2W7ZkXoMo
 Q7D0xOjUjmZmD5Y5TWJOZKkYxOd/7pZ88thSKMzUUCSGl2sqK3fjY4/j2ZBElqCnEvt8AVuM7kH
 PQKXdaU3I6yuqADx9JuGNHFMJkyTG1c2pIxqKxbdAvRqtVrdD6D6o1q0e7qiQne6jesgzewwvsI
 35yS9RaH5xf8S+3giwv3APN7oyMvrdawRvUGCytnYFl0j8W4qOe4Ijuwh1d4rIgces0w==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_180024_165522_77CEC586 
X-CRM114-Status: GOOD (  11.54  )
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
index 023274189b492598b312d27609051a855c021d40..bc88d4de25a621f1baa5b2b96cfa0083144847af 100644
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
index 0000000000000000000000000000000000000000..a8eac5517f8578d60cb45214589ccb45ac376b9a
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
index 0777bf9e01183f34c1eb82525418fe1a660b25a9..a2d5f7d4a942af26b3ba991928f23b2d9943366a 100644
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
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
