Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874EEC5320E
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Aug 2024 13:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=15mjp8Hpu/lYrM0wsxZe5/My1kGbFuO7uInVzESacFU=; b=d8bo6LhhTjvFcb
	kJXScx3gB7tOUFr9P13jBrye+atq77V1x8IaXEsRnmHLA4TdQJI5+RrENuJMYExCC9zR+apgH936a
	2Qk3kQAmCRHcvObMQaj+fVONJiE+Emrqsa3BLDMgSkJAef+M3oUECwtASq6g35mfBVvXbY7cRMYcb
	7vggNpW1lAU5VdAzCVxDb+9gDJx2hpiyDWJ1Erc/DMOqNaoQr05zfGo7DXKy95HNp/FBjoG+4tnZD
	V/rcJkFdTAHBOQ1qwbQd9cco8y4YQjpWzqBsFLf3+D6dIntdPjoPv91je9KjJvS1R67zrXFNltUmT
	uiLdjdNuUAp4t+ueMidg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siD1z-00000004MUX-0vcK;
	Sun, 25 Aug 2024 13:11:43 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siD1D-00000004MEO-18qy
	for linux-riscv@lists.infradead.org;
	Sun, 25 Aug 2024 13:10:56 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Sun, 25 Aug 2024 13:10:04 +0000
Subject: [PATCH v2 3/4] riscv: dts: spacemit: add pinctrl support for K1
 SoC
MIME-Version: 1.0
Message-Id: <20240825-02-k1-pinctrl-v2-3-ddd38a345d12@gentoo.org>
References: <20240825-02-k1-pinctrl-v2-0-ddd38a345d12@gentoo.org>
In-Reply-To: <20240825-02-k1-pinctrl-v2-0-ddd38a345d12@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1698; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=QJkxKsIU1argkVZ7JBifjLz+hDB2JTSsXXcaDwOQPxU=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmyy1IxeA2T6+u17A8pLbXNoLeUlQZi6Ywlz20n
 KjDdniBCAeJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZsstSF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277eJyD/9lPJ1nku5/PKAZwH
 SBVrSAu7teWSK9l23NmtgkFZwfW+7CbsOU7HHMi7WRGOs6N0bnRSqBojguaaZkt1EuQcFwubHsB
 FjGf18Z3Q5RGMRtE10jbwzR343oKoZGZsqXjvJYwRbj5xhGoxdVtg9BEBwv3CYgjRcSmlzwzk1Y
 2/4oVqgVuW4d/4oopeFca0Iz8n/Z+yN35kce2iPHq195b5cTVbaeKRECuVEoZWyziXSRRSoIHi5
 oH06yaihWCx24XfGN6sY1tiDnfa4vAERtQjyDG60m0CCd4ok2AlKNO9BlMALhfoEttsBw/Xno5i
 /GwxRA1n4iMCFD3r8ARmZmpGlgvoNSybdvBbCLifpusIXDABg9wlagKYegEdMxAZo4/wTo0v1WP
 d9GISECoyeXjS2Ob6xuDAlRVH4uFSrNU1DlzHr3OIXWcOYfbWc++gS/pdFgJQoDPSp8nW4Uu2zW
 HFjo7iJWxBKsRsrd0ANL2WVe/udBkISjvNn/evuTttO0AyPpV4Oklgji5f+0c/gg6s5ZwqF+Zc9
 r4bQGhxCaz1CRc9q3T79GWmgjV9kIe2RYJGRyma9HZbXLqF9fVyM8Evu2yF8USq+9MtHxs1DmSH
 Izgnl5AKgMO6GFQJvuLTjafWZwpbQ2+TGUbeyEJ4GPf/jl/yM4jl7P+J0xvTT2IsH6Gw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_061055_381629_B72C6F3D 
X-CRM114-Status: GOOD (  10.00  )
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
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 19 +++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi         |  5 +++++
 2 files changed, 24 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
new file mode 100644
index 0000000000000..38ccaad1209f5
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (c) 2024 Yixun Lan <dlan@gentoo.org>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/spacemit,k1-pinctrl.h>
+
+&pinctrl {
+	uart0_2_cfg: uart0-2-cfg {
+		uart0-2-pins {
+			pinmux = <K1_PADCONF(GPIO_68, 2)>,
+				 <K1_PADCONF(GPIO_69, 2)>;
+
+			bias-pull-up;
+			drive-strength-microamp = <32>;
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
