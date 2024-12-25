Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5155FE7718D
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Dec 2024 00:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OaUQpJyY432DV6Pmy5p/DqaRxmOb3U0chq4QnS7gniM=; b=NXYdTRZjiFJDUt
	cdBl5USfH7cTMBmvZJLCGvxYWEl3caSnNSKbxdLGM4KQznjGada4wi2x3CQZ6Sxc+8sLTgzD8ZhEK
	DzMwnCwo9g7kfMzqHuGeX5CcQSSmXi+u3PE/9y4Ij8AoUEMUZJ18ZMZDJaiwmxDEH4FMtivII0E7J
	gyKnX+QTlUHlPT94egjYol85/3TSz49pxWdABemQ0d0xZhns9SWCsAvF8MpJ7EmWUDg2IaF9abUs7
	5xDjf1cyHtcgpmQakiCcTpulOJc0x6VmwyrB3AwYOBHq9iSsrAuVtrW2Mtd7wzhKfBWYs0FQIHKlc
	+WdZ77DMaezkQu7UBMJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQFLF-0000000CzhF-034s;
	Wed, 25 Dec 2024 00:33:37 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQFLD-0000000Czgl-15pY
	for linux-riscv@lists.infradead.org;
	Wed, 25 Dec 2024 00:33:36 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 25 Dec 2024 08:32:41 +0800
Subject: [PATCH v3 3/3] riscv: dts: spacemit: add gpio support for K1 SoC
MIME-Version: 1.0
Message-Id: <20241225-03-k1-gpio-v3-3-27bb7b441d62@gentoo.org>
References: <20241225-03-k1-gpio-v3-0-27bb7b441d62@gentoo.org>
In-Reply-To: <20241225-03-k1-gpio-v3-0-27bb7b441d62@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1055; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=AySrMTveJUwwqh3zG/JqbY/pPxQJ1p6ycMJxkwoG/gA=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBna1LEBQFMqC3ZhScCywepFcpG6RzRKU+OFbTPM
 fSiW6ix5aSJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ2tSxF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277dt4D/9kr6A3nhOojcBbd3
 7Wf+9AjNtpQvQ7IQQ4qVBzyhfB1WpmQlGFc9Y3T6yYhGaC2qS6gUTPFvLIdg8pxzyP2iP7PT3D2
 K9L1FG/77l+7Z2N5JpIoGiAPL/NVAB1Jju7VN00hhi/SwDMfkqJRtZRoEm011rFEw8l4UKltg8u
 MNyMd3424Y3zft2JDoN/pvglijSIvnAjc0rIJ9t+We9Y/47ODaCuXDs0+YsM7qcTVbxzlhBXUZN
 kDYDG4Fnor6Xs//n4yA4bH2TQU2sUa6hMDgzqUEvGl08c6ZTPRNFt9KzIiIiI4IWA88Cey/gNSt
 Yt1bfx/elDL1W/VMn+WhfHXRsKfhWR1o7GjEurYUssSNqEk3Le8m8veduO3bBSxz0FD/gBi/VWp
 tjb61DAj2oo85xLEpvoRL0iH02eKRqNV9Ghu8iwH3yWRt3kOfzZ/DJDGpKxpFApQxdvKQkDlfmK
 JMBJygesalq0BHcxn/Qfg2bh6ISQk/D5rgaZYCNBwXcNdhvHPx6gq4XOmXzjjQbknB/HQ0RZLoC
 OLtnlQxmmWvE2DuMVDQ4/VpEnBjsgaa7/IEYY4SRzWcz9+OEQEPnQm1aVQvV0oDkstmeqXAn6R2
 qTZzxSNNVpiGXO2PEnM8B7LBCWxD+AVM60WQbHUwwgHKMedsqna2PA0u/w8TtC+TLMQw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_163335_335500_63E87E29 
X-CRM114-Status: UNSURE (   7.46  )
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

Populate the GPIO node in the device tree for K1 SoC.
Also, map all 128 pins as GPIO to the pinctrl controller.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index a2d5f7d4a942af26b3ba991928f23b2d9943366a..bdd25584d67c9a9e41f8d8227fe84a1bdeed7b41 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -416,6 +416,18 @@ uart9: serial@d4017800 {
 			status = "disabled";
 		};
 
+		gpio: gpio@d4019000 {
+			compatible = "spacemit,k1-gpio";
+			reg = <0x0 0xd4019000 0x0 0x800>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupts = <58>;
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
2.47.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
