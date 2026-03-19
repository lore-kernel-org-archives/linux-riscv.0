Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1CC109024C
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 16:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rWmS3CYnMXkawrVqG1GRd5yQa6r3j0jN6xtQ13Z5yM8=; b=kCkhF5elYrz201
	IztL6/U9WMFaJPzV/oC893O9b6zdyG8fxB8+RXbs8pHDvZqoOO1juFAujLEUzSuik+FGOo3fumKIw
	839KDk9tGvxDxgb60BZg2TvnpWer9FC/JDS+ookK3M2V44FjE8L1KoTvdegj8WlATB7jsBj4l+Djo
	HmJZG6CSVySiuaNO47vsdjHYAV16LFvVHrpyiGEkfVFZntErXgvGGvMJosW8gGBerKA+UJbDQvUUl
	wQvLRhx9nTFvqkoOPIpWZZBxkpEtKOco3wgoweLv+e768qt66YoAObz/DZZXMU6BM/V0/IUPuOpgB
	oELmgYz+wW5FVsWyBbJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GHj-0000000B5Bi-1xOH;
	Thu, 19 Mar 2026 16:31:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GHg-0000000B5B6-3kW9
	for linux-riscv@lists.infradead.org;
	Thu, 19 Mar 2026 16:31:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 552A8600AD;
	Thu, 19 Mar 2026 16:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9280C19425;
	Thu, 19 Mar 2026 16:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773937904;
	bh=S7U+CGJ0ya1Mnao17XGZKUpaHgyhCjhG54y3ICKnvxI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C9/8cJxR3VQGxMZxveGk7pIrjlJiJzEMSl6CcOxJIoL9IRThm+C5nj1WZze78M4S9
	 X+8joHd2QR7v6BLZghtWcUTgg/snBRrtGfFtWNVTYVhLoAWtgK1bS8C5znLp2Wk88i
	 QzPJSJ0xsDEXmWs9V9EIEmjsjS6jvD+xCTG6/p+5MNCVu2RNqs4ddurP0BvrC/hd7S
	 pI6+Ng0LFG0bvqY6+wMWjNuTW79Buk4i8NJiSi4bNZ64XHiUlu5P1H2UL948rL3zbJ
	 tII8LWiPse8/y550dyM4VReRfRUKPN2w1I+Wj9WbKp82VazQk3P+UsnP5akVSdARQX
	 XOiJkDA5k/ewA==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com,
	Brian.Burke@microchip.com,
	cyril.jean@microchip.com
Subject: [PATCH v1 1/5] riscv: dts: microchip: gpio controllers on mpfs need 2 interrupt cells
Date: Thu, 19 Mar 2026 16:31:15 +0000
Message-ID: <20260319-crushable-outhouse-e06ca969a01d@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260319-outsell-hypnotic-94b480408ad4@spud>
References: <20260319-outsell-hypnotic-94b480408ad4@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1518; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=4BeOAlsr/mIYH78dM9alCevkvmmBpV/vy1ewY+o5UiA=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJl7VK70f7Fdzf53+t1FHZxXp8yw9Tf/+rChbXaJ2NE2w ynfmW08OkpZGMS4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRXawMv5h0mbTU7nPXR+TX uwU96ZOtjRULuzz5Z0qtoYW5+9Gmo4wMf3ZsDVkgzsckJtpx0n12zRam9ZEMCxX0rKLXLDvY6rW LCQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

From: Conor Dooley <conor.dooley@microchip.com>

The platform has variable interrupt types for GPIO interrupts, in
addition to having multiple lines per GPIO controller. Two interrupt
cells are required.

Fixes: 528a5b1f2556d ("riscv: dts: microchip: add new peripherals to icicle kit device tree")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 5c2963e269b83..8cca84484b85d 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -473,7 +473,7 @@ gpio0: gpio@20120000 {
 			reg = <0x0 0x20120000 0x0 0x1000>;
 			interrupt-parent = <&plic>;
 			interrupt-controller;
-			#interrupt-cells = <1>;
+			#interrupt-cells = <2>;
 			clocks = <&clkcfg CLK_GPIO0>;
 			gpio-controller;
 			#gpio-cells = <2>;
@@ -485,7 +485,7 @@ gpio1: gpio@20121000 {
 			reg = <0x0 0x20121000 0x0 0x1000>;
 			interrupt-parent = <&plic>;
 			interrupt-controller;
-			#interrupt-cells = <1>;
+			#interrupt-cells = <2>;
 			clocks = <&clkcfg CLK_GPIO1>;
 			gpio-controller;
 			#gpio-cells = <2>;
@@ -497,7 +497,7 @@ gpio2: gpio@20122000 {
 			reg = <0x0 0x20122000 0x0 0x1000>;
 			interrupt-parent = <&plic>;
 			interrupt-controller;
-			#interrupt-cells = <1>;
+			#interrupt-cells = <2>;
 			clocks = <&clkcfg CLK_GPIO2>;
 			gpio-controller;
 			#gpio-cells = <2>;
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
