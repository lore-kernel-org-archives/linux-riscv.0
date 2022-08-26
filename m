Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE954ECAAD2
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Aug 2022 05:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iNKrmeMoGJa6EqckClJfaY4fqnp+vucEWXlXw7pgF2g=; b=kh0PadgQm3PCX2
	NMdozGvjFKmQIYl61GOdZ09Kf0PbhtfWfyyemyYqwfDybcH8jDW+j0JuBUK7caPbKikyNwK8qEG+L
	COJVjEJRe1gBT1812eaUICdLSX8amqHu+l4RB7WQFIr/hiyr4gETX0tx//Gsp30kkJ2Ys9Ap4IBh4
	ETmin67ZLqvk9PhzcGVU2SrsAv0ftS29R5xJhKTEOHuQdnDkMDOdD1ZHkEigm0+w/40m82K5fN7ZA
	aR2o4Zmz7mUhM62F57RNhSSYzhBk9rImWRnHPMex3aqHaHWe4VY0XJSLC+fChQR541bvvfFo4f3MW
	nVrCmT6QfsyFlq9SwRSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRRd2-00DhLF-6d; Fri, 26 Aug 2022 05:11:36 +0000
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRRbV-00DfxC-S9; Fri, 26 Aug 2022 05:10:03 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 4F4563200A99;
	Fri, 26 Aug 2022 01:10:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 26 Aug 2022 01:10:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1661490599; x=1661576999; bh=eV
	ZqDBsZhHP5u+DP9tb0OjNqX/1M2tAqFGR+hrOMxok=; b=PqZYP2N2jfVTKaw/Uh
	4CR4ganMslPLNivgqVex85E3HPs9LYllVUPcy6XxmorYUmFba8i0NSXSyVOmr+Tb
	6DcAnSRy4YguN6W7L6+BsuaFk1UhiMrZagfQ2wN/NNT1FlLcB1jqIR0ihhxckdnX
	SZ2ZBNCA/pMMR6ZWHVPO/gyizCi55tckKt1KeD5/2vuU137YV6gwmoYhqo5FSdxg
	l8PkI9SAxWA8wXV0leNmGaQv7lzi0Af/3RWs5Le8OxH3QkVq6cLlwQ/EqKQA5got
	oD7uWivbxXdQJ9BKHcH0F5L2Jv/Uc56RIJ3Kq2rNFSgsM7G/P8pCpr5rT9KxdzKk
	4m2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1661490599; x=1661576999; bh=eVZqDBsZhHP5u
	+DP9tb0OjNqX/1M2tAqFGR+hrOMxok=; b=aTEEvwIT0Lh2mzRSIe98Gi6XLJPT9
	YJl0Z9PqM3BaUQJeM5Dv0PlKH9N4m4NqPbq7Go3FfzNJ+JFPn+0Pl5kCu2xniR0l
	oc4g9nPRzWbmA7JtaDZbx4FuSdscmbYIqsCqTDFqolTpHlqqa+sPwE2Adbq61M4S
	it0C8aoCx6YzuOwGOz/kOipW6taR4pWzkOaYj3Hq+NX3IkcajNO5VRozb7uS76xA
	HZExWEdmV0grnVQAauuTzWmMQZcKTdOjzBSa5wMe219xn3XABbIFj6+srTgJUCR9
	G3i2C3+UHWuC3wFY6VrmNOVCmuTEzmxrhblqwzq+fPwNsrf7IS+f+L56g==
X-ME-Sender: <xms:p1UIY6Oz_k07ASFIUZI_ZaQCghIoGa8vGM0Yaq9ww4Ex21Fiue3RQw>
    <xme:p1UIY48KEUczFZV5a8S5YwZaVQoiAlQn83BCkjis7BNfetnH5-de28kKDHhfEaXhH
    xMW2NnwtFUxbeqK-Q>
X-ME-Received: <xmr:p1UIYxRR8kaBpt6lJoXYvPqSstlUQnOxyOFufVW1IImPjFArXwNAOQWTOZ-W__IB0cyS5m07pXcoNtHeKDqI9CpmVY1dDa9z25_RmYn1HanFRLUB0Zs-35DbHoprNM62jH_nmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejgedgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:p1UIY6vpV0W0byK6_lpk2YewI-FTFibTGmADLaE7X4fZ4DQF9K5zCA>
    <xmx:p1UIYyfkRXJ3qy7SLsx_v2GyhUFJR7H3NdWBoGGOysHdiu3BXgD20Q>
    <xmx:p1UIY-3Klxnp-vYOqzuunRcWx2toDBxsG9tB9uh57TeYK-KjxocY-g>
    <xmx:p1UIYzXOmSF44ZNx97YlrnrasOjghF16hRD7BpdpqJ5Jrnp3_lAxSw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Aug 2022 01:09:59 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Pavel Machek <pavel@ucw.cz>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH v5 5/6] riscv: dts: allwinner: d1: Add LED controller node
Date: Fri, 26 Aug 2022 00:09:41 -0500
Message-Id: <20220826050942.20067-6-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220826050942.20067-1-samuel@sholland.org>
References: <20220826050942.20067-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_221002_017586_9E67151B 
X-CRM114-Status: UNSURE (   8.44  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Allwinner D1 contains an LED controller. Add its devicetree node, as
well as the pinmux used by the reference board design.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

Changes in v5:
 - New patch for v5

 arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi | 21 ++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi
index 9a9b3e0fe79d..53b0cb64906f 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi
@@ -115,6 +115,12 @@ lcd_rgb666_pins: lcd-rgb666-pins {
 				function = "lcd0";
 			};
 
+			/omit-if-no-ref/
+			ledc_pc0_pin: ledc-pc0-pin {
+				pins = "PC0";
+				function = "ledc";
+			};
+
 			/omit-if-no-ref/
 			mmc0_pins: mmc0-pins {
 				pins = "PF0", "PF1", "PF2", "PF3", "PF4", "PF5";
@@ -178,6 +184,21 @@ ccu: clock-controller@2001000 {
 			#reset-cells = <1>;
 		};
 
+		ledc: led-controller@2008000 {
+			compatible = "allwinner,sun20i-d1-ledc",
+				     "allwinner,sun50i-a100-ledc";
+			reg = <0x2008000 0x400>;
+			interrupts = <36 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_LEDC>, <&ccu CLK_LEDC>;
+			clock-names = "bus", "mod";
+			resets = <&ccu RST_BUS_LEDC>;
+			dmas = <&dma 42>;
+			dma-names = "tx";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 		lradc: keys@2009800 {
 			compatible = "allwinner,sun20i-d1-lradc",
 				     "allwinner,sun50i-r329-lradc";
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
