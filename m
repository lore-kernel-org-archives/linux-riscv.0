Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35A9C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 21:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jQPZZqlbm2M7ialHU59pIWEPi602Y84ijXT5Uk59jPE=; b=J+JRghanmP9of1
	Q18jVRDXcSsgT6RttoWiGRg9fwO76W5Al5TTVvVTdNC5Sb9YbaODAs0Fn5wV3FrwKXXwahhvqqYT5
	Z52wgmRHFtyZ9veJuuPuESDZAs4mDxSiVWSal3jX4Yu26SuqdFjRdqqV2bzBx3tHZxuXf5S/JD/7T
	y6joU6nx1pme8HdNcqLMvudTpUNclwxTXTh9d5byhcyEgupWB96QV8C79kqn0PTJBsB1KnJStl4U8
	vqnYIraN5Rwvq8EwbJWQYbqxtH3RjXWlKnCWwwhal4nZPc9xvgXCwhlIHeeXW+GjeoeZk5Jzo8QvE
	bFlHZD8qnJ5PlI7RC/DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pejyr-00DsS5-2n;
	Tue, 21 Mar 2023 21:57:21 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pejyF-00Ds64-2X;
	Tue, 21 Mar 2023 21:56:46 +0000
Received: from localhost (unknown [188.24.179.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 59F2166030E0;
	Tue, 21 Mar 2023 21:56:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679435802;
	bh=N/ZvfamKX7ttvXbRjuUCngvIStvDvApje9cACLj84nc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DqaZ5y5wGDXGe9EAD5npPYnOvO8wTs3kNVCLiDkTuyJH7ci44MX8ygIEFgwNjQNyv
	 sqBKfbH5NULmGNhEnqAny3aDt1UklimcwMHGKe3QsS4C18Php76Uwvcy5C5acRqSgU
	 9ymwDXiVb3HW6dfk2SD+FWFK00TmK8vZVuyHZfdSzqLZwJb3Rp66yXy5Wd+mniHzQm
	 HbaocTMIi2y2VmHj5H97kNMjZNVLXihy5ZuEYBfvyQ+vcefBsOSeIeE9tCqVfiLsna
	 mtjcISN1N3a5tKbCODUy2AMlT5JCuwLsdKudj5rXfD1XCRuVVo74Qv8JEVlTjMCfyB
	 s20AE7DVsgyug==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Cc: linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 04/10] ARM: dts: sun8i: v3s: Switch dma-names order for snps,dw-apb-uart nodes
Date: Tue, 21 Mar 2023 23:56:18 +0200
Message-Id: <20230321215624.78383-5-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230321215624.78383-1-cristian.ciocaltea@collabora.com>
References: <20230321215624.78383-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_145643_978063_4E8553B4 
X-CRM114-Status: GOOD (  13.81  )
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
dma-names properties") documented dma-names property to handle Allwinner
D1 dtbs_check warnings, but relies on the rx->tx ordering, which is the
reverse of what a bunch of different boards expect.

The initial proposed solution was to allow a flexible dma-names order in
the binding, due to potential ABI breakage concerns after fixing the DTS
files. But luckily the Allwinner boards are not affected, since they are
using a shared DMA channel for rx and tx.

Hence, the first step in fixing the inconsistency was to change
dma-names order in the binding to tx->rx.

Do the same for the snps,dw-apb-uart nodes in the DTS file.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm/boot/dts/sun8i-v3s.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v3s.dtsi
index db194c606fdc..b001251644f7 100644
--- a/arch/arm/boot/dts/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
@@ -479,7 +479,7 @@ uart0: serial@1c28000 {
 			reg-io-width = <4>;
 			clocks = <&ccu CLK_BUS_UART0>;
 			dmas = <&dma 6>, <&dma 6>;
-			dma-names = "rx", "tx";
+			dma-names = "tx", "rx";
 			resets = <&ccu RST_BUS_UART0>;
 			status = "disabled";
 		};
@@ -492,7 +492,7 @@ uart1: serial@1c28400 {
 			reg-io-width = <4>;
 			clocks = <&ccu CLK_BUS_UART1>;
 			dmas = <&dma 7>, <&dma 7>;
-			dma-names = "rx", "tx";
+			dma-names = "tx", "rx";
 			resets = <&ccu RST_BUS_UART1>;
 			status = "disabled";
 		};
@@ -505,7 +505,7 @@ uart2: serial@1c28800 {
 			reg-io-width = <4>;
 			clocks = <&ccu CLK_BUS_UART2>;
 			dmas = <&dma 8>, <&dma 8>;
-			dma-names = "rx", "tx";
+			dma-names = "tx", "rx";
 			resets = <&ccu RST_BUS_UART2>;
 			pinctrl-0 = <&uart2_pins>;
 			pinctrl-names = "default";
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
