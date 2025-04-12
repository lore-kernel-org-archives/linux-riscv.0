Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2770CC369AB
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Apr 2025 06:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=voHK24c9i1RMGvSPdl2fP2kx6WktTN/fxEBEIxQ1FeU=; b=Gnuy9sTXeFCwUd
	hQ5Kyu23pMauupk9HarqDunHOOiPna2WQTWUJLg82yt1JIdkufNTigcM2PAB8l3nsK90PcodtFmMb
	V8OlKbVOeh3KQFPphoTW9Q8RS/jgmBQy4/dKUfLxiLVwIaymlTb0gFAKxLLv9XgJhB3nkFea524I+
	gWvpDHxoq918iDV5Jr9qrXo2nAleOzxo994F1+dD/NZdqRSDz805BLZoYEiwGJF33HbCR1kiGppDr
	8OewU4/R8vskOm64ywXZIYxKAh7ufHRr0nULeSm/bv1PC65krHA+kXWphwFHdOstBjUJGTlFRmBmP
	KqIke90Lf6bX07tJAoYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3UpA-0000000FYZS-2nxP;
	Sat, 12 Apr 2025 06:58:44 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Up8-0000000FYYk-16Uo
	for linux-riscv@lists.infradead.org;
	Sat, 12 Apr 2025 06:58:43 +0000
Received: from [127.0.0.1] (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 45F0434375E;
	Sat, 12 Apr 2025 06:58:37 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sat, 12 Apr 2025 14:58:11 +0800
Subject: [PATCH 2/2] pinctrl: spacemit: add clock support for K1 SoC
MIME-Version: 1.0
Message-Id: <20250412-02-k1-pinctrl-clk-v1-2-e39734419a2d@gentoo.org>
References: <20250412-02-k1-pinctrl-clk-v1-0-e39734419a2d@gentoo.org>
In-Reply-To: <20250412-02-k1-pinctrl-clk-v1-0-e39734419a2d@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1653; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=n7GbuJLw/44DNPKz3PzwbXAURd9IBpfJrhXcy+GGj2Y=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBn+g8SiIjiGMLHykiyn4luij0gAqj6VC5tcOEr4
 HHe+VWgPUKJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ/oPEl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277YSMD/4g8g5GHPkKUntp3e
 OUiaaGAEMBegOZVUQnYe7W9IivHp7oo0NXJYfVxHm0C0ozc0zivlgL4JDwWNfOUCiPPbO0+4k3d
 PELS5KD+K7QOO6PM1Q855Ifh+V/3afxJhgC0xGuIG7vwqvtW0obb2Ud6UB0gc9pZBgFs7VUaTli
 D0ixzy3PY+KB+vE6zReYoqBa+0Ebkq33N2+06+fYEB90Y1mmMJb6GGCcUyb7Kv6TKe6ufr+Td9e
 L412SlKPdD7HEKC71bc7tDrYgQ58j//vFhWnV7QblT0fzJ+7Ta/1GEoFdG/mIsfeCZhxkbfKOWD
 f7M5R3tYJpqZP5hxkq4M2N53YOEWLfjGTeICFk9vSpNzFBpmyYlDn4iYygP1PxX/ncCUrtqAxlh
 LOPwerOKBWu3s4kcuS8CIzzGarqJO2Jw6usEVGXEfuUJ2Rvlod8rK3rQT44917gJUkGLJHbuM5e
 gZcEaI6CQTY+EnYQS1xZOORTAfFc8FM5+XrJuM8riWO+GP5IexwmtGre1Ymn0kmXQfYEhSSNscy
 5mklqCbq/YoE99pOf6NrUo/+iExnV/iPs3Qvq0KGb2+1XTNMjfbtyvvXxnxR0jrD7zDwY0tO33w
 K/S7bz1FW4bT49hINK8lhbHn557gewzTFpEIiHxMy7xw+mbUrJp1yuaK1nxj9zKUmBTA==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_235842_330864_0B070871 
X-CRM114-Status: GOOD (  10.82  )
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
index 67e867b04a02ea1887d93aedfdea5bda037f88b1..3805fb09c1bc3b8cf2ccfc22dd25367292b397b9 100644
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
 
+	func_clk = devm_clk_get_optional_enabled(dev, "func");
+	if (IS_ERR(func_clk))
+		return dev_err_probe(dev, PTR_ERR(func_clk), "failed to get func clock\n");
+
+	bus_clk = devm_clk_get_optional_enabled(dev, "bus");
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
