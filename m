Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D9DC369BD
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Apr 2025 00:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=edQtBPFnzdlyC5aZHeW99Lkz6uy/h8JsAx1Gllf0Lpg=; b=2Pk5NycPHapsfj
	BzuE2cmak8F0d0TbCXF4WWaCyPOkQe75W826QBNa8mnOODGrI5hFyveMB5bUbQSHGH++fUwBA3Ng+
	nvRrX3TdS4Js8RxUYt4cYunHrzCZHozMASz1jVHt23sBJw/t5PIwFz+1IGZCxrNxy2utPEPAjhGTj
	9XH9hkxjnJSeJMolloU0Lehui3kackACOp/y++hqi2DAyJxB7VpofuSPCS0VwpcSp61fflAr42cmU
	trmFEM0XYjn9y4IoJrnvMd4mWg/ZLKlHVglkp1u5wV5rphxO5iutfNKwlk97vm+jH31Kb9NNr38BU
	T9DDUjMIr3kw5M53cqIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4qT8-00000007cXy-36V6;
	Wed, 16 Apr 2025 00:17:34 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4qRf-00000007cEV-1YCI
	for linux-riscv@lists.infradead.org;
	Wed, 16 Apr 2025 00:16:04 +0000
Received: from [127.0.0.1] (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 6FD22343030;
	Wed, 16 Apr 2025 00:15:59 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 16 Apr 2025 08:15:28 +0800
Subject: [PATCH v2 2/2] pinctrl: spacemit: add clock support for K1 SoC
MIME-Version: 1.0
Message-Id: <20250416-02-k1-pinctrl-clk-v2-2-2b5fcbd4183c@gentoo.org>
References: <20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org>
In-Reply-To: <20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1635; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=hgCxsX2xeB7ssokjMjVuQzAe/R10W2qnEsmZP030Ffw=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBn/vazO0PhBV3WPP1OZXqUueTvxrOgsBekglOzs
 2flGSx0VBeJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ/72s18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277SahD/0e1oRz5hGAZTG1Et
 g8bInVmC8CEMmr0kzBRpOP1Js4grVnpkKsd9sGQodGaOD6sln3Qwh0O6+DggxzF1SgpQmNqui+j
 HIUSEHKA2AHR4S/vZDJQ+LD2pa/ZFQgRrI4iN+GWZAc2rt2S5jNZ9wuvmwxbP/LCnEMIR1dTxy3
 AX04edMdmRjQE3FkWQCPREeL+Ed1mRBV2LXgeRZW4khOAlWbOe38+AV5jEn+BKGFYRWlO2VJH9+
 0thGgvE4DgAgy7btKVf7v/Dm9/gpqdlj3ZVl6rRn7VzsnmhmqL42bAmALeZu1jY9YrEHm3nt4zM
 Xu8dR1HbExOZy80xmppsFUVQ/GCCJlBGHn34+NWCgjWPbsYfb1CORhVhB1EpMXF0HpxRGJlP6Gt
 Vjy0AjEliOgdvk3Pf+yhyUlPEfw21h5R/MF3HwvhqfZkf+prNS4VpzIHEQQoEOPb1g8UGa4MTio
 efLoCflAZXFBWfXsv260MRkWSBLJtWTtBV+bejJzpKHtekwn7T3uhRjD2tx0JqoEVhfA4Ue2HK1
 IxmvMj7Ql4JJxRSOSg+BUqmdyyv8Pg2QnWOrMbYLvzcXGpp3tnxzui1aaiaY5lDrhBbnfE8XC4D
 6c98W1KXB04fYZIOmISajq6/UCoTSUz1T8zEN7OkCf5LC7mgzGAw9bTjlbQ7aBz5yADg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_171603_441955_06092AC2 
X-CRM114-Status: GOOD (  11.09  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

For SpacemiT K1 SoC's pinctrl, explicitly acquiring clocks in
the driver instead of relying on bootloader or default hardware
settings to enable it.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 drivers/pinctrl/spacemit/pinctrl-k1.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
index 67e867b04a02ea1887d93aedfdea5bda037f88b1..9996b1c4a07e72f2a3832b759feddcd4e07f2159 100644
--- a/drivers/pinctrl/spacemit/pinctrl-k1.c
+++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
@@ -2,6 +2,7 @@
 /* Copyright (c) 2024 Yixun Lan <dlan@gentoo.org> */
 
 #include <linux/bits.h>
+#include <linux/clk.h>
 #include <linux/cleanup.h>
 #include <linux/io.h>
 #include <linux/of.h>
@@ -721,6 +722,7 @@ static int spacemit_pinctrl_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct spacemit_pinctrl *pctrl;
+	struct clk *func_clk, *bus_clk;
 	const struct spacemit_pinctrl_data *pctrl_data;
 	int ret;
 
@@ -739,6 +741,14 @@ static int spacemit_pinctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(pctrl->regs))
 		return PTR_ERR(pctrl->regs);
 
+	func_clk = devm_clk_get_enabled(dev, "func");
+	if (IS_ERR(func_clk))
+		return dev_err_probe(dev, PTR_ERR(func_clk), "failed to get func clock\n");
+
+	bus_clk = devm_clk_get_enabled(dev, "bus");
+	if (IS_ERR(bus_clk))
+		return dev_err_probe(dev, PTR_ERR(bus_clk), "failed to get bus clock\n");
+
 	pctrl->pdesc.name = dev_name(dev);
 	pctrl->pdesc.pins = pctrl_data->pins;
 	pctrl->pdesc.npins = pctrl_data->npins;

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
