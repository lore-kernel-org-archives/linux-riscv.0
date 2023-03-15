Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D2AC6FD1D
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 11:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZFE60Yx6lFYdODD2wD4KVY+LHvdHRehBGYQt/3Q5gnw=; b=hwVu0f3NaeD0he
	yfWwkCq18oo93I/rklwv8BTALToW3sa2bibyWwNSUnKoGXg8iptGqpzREszbgvhxrzsPyo2NVosW3
	CkU6QrJvyJXa++iCr5hP/NSCaIi5pXsY0bJ5uMSLBCvifIQtO8+il/s4z3weVThd0tBI0ndXf8JQ0
	7NAcg1X/rSwBU0QQlrXugMWwKU1V5Yowr4CDB61rzPAQkHCQb06F9IqTHVU1/167Wwe1ISZZ0JPp7
	O51ZsePQNQWStvM5U6Dp3vOPkI0BoKwMbld5dg1+SwW8moti2ZALYnlNaZuQ87VL144yrw3VuHBkx
	fC0LN7H5jJu4t4b6cbUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcPcP-00DE5B-0B;
	Wed, 15 Mar 2023 11:48:33 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcPcC-00DDxY-1v;
	Wed, 15 Mar 2023 11:48:22 +0000
Received: from localhost (unknown [188.24.156.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 57B026603058;
	Wed, 15 Mar 2023 11:48:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678880898;
	bh=C+CkBCBIxEIFOAjzgyNm1268qn0Q1m0JZg82+SgLbSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X58SfGRMKG9NMnROtcQIsHKPqTiN3hEwxxvjMK1CBZAuNkvJZzsUYX46U7ZK9w6S6
	 dF4cWgtlSfBpB8jUa/4djaWG13TVCtFcT45OS/83t3Yw6fakhmegMNTgKGABCsilX/
	 wHS2lvwEUTbpSNOotY3XW9z1pVo7f5vlTrQWiLpSupOFiyAOoNrA8OYMPLMmr5TPyN
	 JcBcMmqRoAFaPZMBUMUwP7t2IyoYiSr8EtaBYoSFn2xK3I5BULLPfOYbfOu6Wk2QXq
	 wcRNhblusYn5BaeQW5QYIAVEuJsdJVOaqvBKDSUpfN1l8nBSghvjXURdUp51ZFH4+v
	 PCS7fq1RtkfSA==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Drake <drake@endlessm.com>,
	Katsuhiro Suzuki <katsuhiro@katsuster.net>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 02/11] dt-bindings: serial: snps-dw-apb-uart: Relax dma-names order constraint
Date: Wed, 15 Mar 2023 13:47:57 +0200
Message-Id: <20230315114806.3819515-3-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_044820_771154_FB3C2541 
X-CRM114-Status: GOOD (  11.36  )
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

Commit 370f696e4474 ("dt-bindings: serial: snps-dw-apb-uart: add dma &
dma-names properties") documented dma-names property to handle Allwiner
D1 dtbs_check warnings, but relies on a strict rx->tx ordering, which is
the reverse of what a different board expects:

  rk3326-odroid-go2.dtb: serial@ff030000: dma-names:0: 'rx' was expected

A quick and incomplete check shows the inconsistency is present in many
other DT files:

$ git grep -A10 snps,dw-apb-uart | grep dma-names | sort -u
arch/arm64/boot/dts/rockchip/px30.dtsi-         dma-names = "tx", "rx";
arch/arm64/boot/dts/rockchip/rk3328.dtsi-       dma-names = "tx", "rx";
arch/arm64/boot/dts/rockchip/rk3588s.dtsi-      dma-names = "tx", "rx";
arch/arm/boot/dts/rk3066a.dtsi-                 dma-names = "tx", "rx";
arch/arm/boot/dts/rk3128.dtsi-                  dma-names = "tx", "rx";
arch/arm/boot/dts/rk3288.dtsi-                  dma-names = "tx", "rx";
arch/arm/boot/dts/rv1126.dtsi-                  dma-names = "tx", "rx";
arch/arm/boot/dts/socfpga.dtsi-                 dma-names = "tx", "rx";
arch/arm/boot/dts/sun6i-a31.dtsi-               dma-names = "rx", "tx";
arch/arm/boot/dts/sun8i-a23-a33.dtsi-           dma-names = "rx", "tx";
arch/arm/boot/dts/sun8i-v3s.dtsi-               dma-names = "rx", "tx";
arch/arm/boot/dts/sunxi-h3-h5.dtsi-             dma-names = "rx", "tx";
arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi-  dma-names = "rx", "tx";

Do not enforce the order of the dma-names items.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 .../devicetree/bindings/serial/snps-dw-apb-uart.yaml   | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index 2becdfab4f15..d374844a61a5 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -71,9 +71,13 @@ properties:
     minItems: 2
 
   dma-names:
-    items:
-      - const: rx
-      - const: tx
+    oneOf:
+      - items:
+          - const: tx
+          - const: rx
+      - items:
+          - const: rx
+          - const: tx
 
   snps,uart-16550-compatible:
     description: reflects the value of UART_16550_COMPATIBLE configuration
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
