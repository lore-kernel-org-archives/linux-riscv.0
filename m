Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD47C54EDA
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 11:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qGtJ42A+vmCmun3NHGDQ0CICEt1T9wDQb8v4VdR3MfI=; b=B6ywkpkY7hWc3E
	ra3AZSINoGgek7Lw9jXCpJIQVcnF01oUfgcLqJd3XaEjWMxNFcrzC5dcIPnOhi9N4vrOEC+J2YY45
	6nO1VbSgx5GpAmVaEBoinecg+WyUrl25oxE6zWHTbQMf0770ANBHPbt+czFExpjHhoC4ykkRaO+fi
	R8B9EXxUR9DwfsFwAHOX819C5dN2+ErlbrFDDWJXltkRK5xURiPAdeFEFqfIqzBV6Gg3y5ZJdNYBS
	ia6Fgqy2WDglM6KcKQf3Pjc9jMq7KWMNGpCssVLJXAiZp8i3fJ4Fpf5cGtb/YgM+3BKvallRSovw9
	NOf89KWqEE728EZ5KJYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjGtj-0000000F9bU-2eSy;
	Wed, 28 Aug 2024 11:31:35 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjGth-0000000F9Zk-1oob
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 11:31:34 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 28 Aug 2024 11:30:26 +0000
Subject: [PATCH v3 4/4] riscv: dts: spacemit: add pinctrl property to uart0
 in BPI-F3
MIME-Version: 1.0
Message-Id: <20240828-02-k1-pinctrl-v3-4-1fed6a22be98@gentoo.org>
References: <20240828-02-k1-pinctrl-v3-0-1fed6a22be98@gentoo.org>
In-Reply-To: <20240828-02-k1-pinctrl-v3-0-1fed6a22be98@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=866; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=gWmuyPDq21pf5ffpnoMsUraKHy3KBjlrnMFcvKOQvaI=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmzwp+dNwsze5x6kE2drkUS3CYIhx7W9r0YYHWh
 qujNIb5U1aJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZs8Kfl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277RHED/9AUoLSvz1XUzdUzJ
 TV5XF6y+RiHjT6Ve92uIaXPUOjhjDSbVWmi9v3hi5ZmDpB760wH7S+5x6BuwUg42fQk+VwbHX43
 OpklJnMTWxGH9oplyUxy4i/mT/5cXqm3GSzmNDCuvmswryhiuN9Hq4R44Xy8In+k8gzE6uX5UCS
 /Wk/YyHNYDcnj92fdaivdsh6nQKDPVHY+CUzL96B3m63YzRW3C58p/jwu1Sv43GKBM6LF3fd8E9
 sJTkBomP6EwPh1Jq8ieynq1crp52uDB72L1jCMuifwoO8ECiTvTviWHW/KHxdsw6AsjVly4zOJp
 ET7e8JVyb42WtAHYrRsBPcirMbvw3BT0ZE6Bfeb8/Jx4PwsPD+jbFfR3QvzeGWpZKiLHixvBKVq
 W2kz0gDPQTOtt+GUtdwJEyOZdlgBEshiq2dvAe3wMIFj82D0u99WLr9O4PYBdtWmCTc+Wfmu3f+
 erZ8B8oOuxX1RcpIBXYjjiCMN4+JELm6d5EbQ7/vq4b4SE7AvAzDu88zMAzi6auUHt6RNh6xyBs
 4EdCdSIVcMyMpSSes5kdppXVN10P6XnjEjkH4YOdl72DD16Ue8UwzrPeBE3kzJG/jmOXuTNXAl1
 w7Tsj8GrVgWveJjhvnK4Z9UYf+kvk0xOeJYzDF8r+LETWCe2JkYrrUPmTNcFVgZXuoDQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_043133_520541_76DC1ABE 
X-CRM114-Status: UNSURE (   7.69  )
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
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, Meng Zhang <zhangmeng.kevin@spacemit.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <jesse@rivosinc.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Before pinctrl driver implemented, the uart0 controller reply on
bootloader for setting correct pin mux and configurations.

Now, let's add pinctrl property to uart0 of Bananapi-F3 board.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 3 +++
 1 file changed, 3 insertions(+)

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

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
