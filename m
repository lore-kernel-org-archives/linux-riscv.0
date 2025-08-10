Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8C0C87FCF
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Aug 2025 21:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:To:Message-Id:MIME-Version:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=qPhBGEvSeXTl6lwWVNiG9AL/gNW5zV0PElUv5gwxhlY=; b=A5qAXEwOiS3vHL
	4vQQ8Ax+kgqRtWgiMBT7WoqcWH8t18ZwTZ0AiAZDr8oDy9EbuqCJ6R9JisxIB40XYzXXQj5uh0qPi
	0Q+MWQhpvr4XCKiJxBpG2hPQs53mFJTaXVzIaNcAC95xuxBg31q5SvuI2P5OguAbh7PkNnfJr0Hos
	23SwJG1Ypt8SIZs9+cSBHd0arBchUXCylypavI/PIGOuAC2KbNsFLAS2MxkWX3bzQF1l6h6UbEftm
	NtH2+Qpb5Jb92TmxGLuQ0ZDCB8Dmdz+C2mX76KF8eZl46CrSu4eTO0ozpIRVhQVng5fDDspCkl6h7
	pOcwZK/OuTxVugSfA9ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDmy-000000063Ti-0Z5q;
	Sun, 10 Aug 2025 21:41:12 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDN4-000000060Ei-1AXr
	for linux-riscv@lists.infradead.org;
	Sun, 10 Aug 2025 21:14:29 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250810211421euoutp02f360cf0fdd7158de80b030b11460e573~ahEqx8aJZ2978629786euoutp02X
	for <linux-riscv@lists.infradead.org>; Sun, 10 Aug 2025 21:14:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250810211421euoutp02f360cf0fdd7158de80b030b11460e573~ahEqx8aJZ2978629786euoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754860461;
	bh=Mo+HO+WEp9bez+G5fTqLRqhZXEMypwaCdWht1NAhUv4=;
	h=From:Date:Subject:To:Cc:References:From;
	b=cVyOHyIQfTcKZRY6JDjMBM2Nni2T792hxqo7RUmnxSzeIT3ztE8ElXVhf2j9KVHFB
	 s4ADlvfAyriXQgFyyafbNw3JQacKszaRDmkY2wLNS8D8SOO9iJ2HoW8HahdkjEE78i
	 Drapgn7p1WDDKJzVSWGslylM/wjKDl//7MX+n20Y=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250810211419eucas1p173e5fefcfaae437d8b5531d1406ff6a6~ahEpnR34i2363123631eucas1p1d;
	Sun, 10 Aug 2025 21:14:19 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250810211419eusmtip23c5f82de8db4cfef0d66c6c2bdb7bc5f~ahEo-hH4_0966009660eusmtip2_;
	Sun, 10 Aug 2025 21:14:19 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Sun, 10 Aug 2025 23:14:19 +0200
Subject: [PATCH] reset: thead: Scope TH1520 reset driver to VO subsystem
MIME-Version: 1.0
Message-Id: <20250810-fix_reset_2-v1-1-b0d1900ba578@samsung.com>
X-B4-Tracking: v=1; b=H4sIAKoLmWgC/x2MQQqAIBAAvyJ7TlBTk74SIZJb7cVCIwLp70nHY
	ZipUDATFhhZhYw3FTpSA9kxWPaQNuQUG4MSyggnBV/p8RkLXl7xYKWLg1bW9BpacWZs+r9N8/t
	+bDYyql0AAAA=
X-Change-ID: 20250810-fix_reset_2-a618d7426534
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,  Fu Wei
	<wefu@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,  Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
	<conor+dt@kernel.org>,  Paul Walmsley <paul.walmsley@sifive.com>,  Palmer
	Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,  Alexandre
	Ghiti <alex@ghiti.fr>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250810211419eucas1p173e5fefcfaae437d8b5531d1406ff6a6
X-Msg-Generator: CA
X-RootMTR: 20250810211419eucas1p173e5fefcfaae437d8b5531d1406ff6a6
X-EPHeader: CA
X-CMS-RootMailID: 20250810211419eucas1p173e5fefcfaae437d8b5531d1406ff6a6
References: <CGME20250810211419eucas1p173e5fefcfaae437d8b5531d1406ff6a6@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_141426_903376_DB9A66F4 
X-CRM114-Status: GOOD (  16.62  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michal Wilczynski <m.wilczynski@samsung.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The reset controller driver for the TH1520 was using the generic
compatible string "thead,th1520-reset". However, the current
implementation only manages the resets for the Video Output (VO)
subsystem.

Using a generic compatible is incorrect as it implies control over all
reset units on the SoC. This could lead to conflicts if support for
other reset controllers on the TH1520 is added in the future like AP.

To ensure correctness and prevent future issues, this patch renames the
compatible string to "thead,th1520-reset-vo". The device tree bindings,
the th1520.dtsi file, and the driver itself are updated to use this new,
more specific compatible. The device tree node label is also renamed
from 'rst' to 'rst_vo' for clarity.

Fixes: 30e7573babdc ("dt-bindings: reset: Add T-HEAD TH1520 SoC Reset Controller")
Reported-by: Icenowy Zheng <uwu@icenowy.me>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml | 6 +++---
 arch/riscv/boot/dts/thead/th1520.dtsi                           | 6 +++---
 drivers/reset/reset-th1520.c                                    | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml b/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
index f2e91d0add7a60e12973c216bb5a989857c3c47c..f84c5ae8bc3569cb1d4e8f07999888ea26e175d0 100644
--- a/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
@@ -16,7 +16,7 @@ maintainers:
 properties:
   compatible:
     enum:
-      - thead,th1520-reset
+      - thead,th1520-reset-vo
 
   reg:
     maxItems: 1
@@ -36,8 +36,8 @@ examples:
     soc {
       #address-cells = <2>;
       #size-cells = <2>;
-      rst: reset-controller@ffef528000 {
-        compatible = "thead,th1520-reset";
+      rst_vo: reset-controller@ffef528000 {
+        compatible = "thead,th1520-reset-vo";
         reg = <0xff 0xef528000 0x0 0x1000>;
         #reset-cells = <1>;
       };
diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 42724bf7e90e08fac326c464d0f080e3bd2cd59b..9cc2f1adf489ac432b2f3fbb06b655490d9e14b3 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -235,7 +235,7 @@ aon: aon {
 		compatible = "thead,th1520-aon";
 		mboxes = <&mbox_910t 1>;
 		mbox-names = "aon";
-		resets = <&rst TH1520_RESET_ID_GPU_CLKGEN>;
+		resets = <&rst_vo TH1520_RESET_ID_GPU_CLKGEN>;
 		reset-names = "gpu-clkgen";
 		#power-domain-cells = <1>;
 	};
@@ -500,8 +500,8 @@ clk: clock-controller@ffef010000 {
 			#clock-cells = <1>;
 		};
 
-		rst: reset-controller@ffef528000 {
-			compatible = "thead,th1520-reset";
+		rst_vo: reset-controller@ffef528000 {
+			compatible = "thead,th1520-reset-vo";
 			reg = <0xff 0xef528000 0x0 0x4f>;
 			#reset-cells = <1>;
 		};
diff --git a/drivers/reset/reset-th1520.c b/drivers/reset/reset-th1520.c
index 7874f0693e1b427a094a68f2b6d783985e789bf8..05ed11972774618df4512b7c9f9f12e71455e48b 100644
--- a/drivers/reset/reset-th1520.c
+++ b/drivers/reset/reset-th1520.c
@@ -116,7 +116,7 @@ static int th1520_reset_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id th1520_reset_match[] = {
-	{ .compatible = "thead,th1520-reset" },
+	{ .compatible = "thead,th1520-reset-vo" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, th1520_reset_match);

---
base-commit: 561c80369df0733ba0574882a1635287b20f9de2
change-id: 20250810-fix_reset_2-a618d7426534

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
