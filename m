Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768C8C05027
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 06:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iOWl6V5nvA8kZ5xggiBC5dMbGhwf10jSq2UZ9qC39VM=; b=fusEzHAIPIk9Sh
	Ut987fN5TFaIP54IH47Lhc4pQf+TeeZSwHuy5WlzdftQHDSBnFHfsb4PKhuQDkAKqvnQBBKFwWncH
	irVd7P14HoOrJXqsis7S/Xvd4LMEGVZUbJpZh400hT5dPxsKMXXxrJwnqDVpEuRiuurxVR58d6RYV
	g7Fju6RkIvIy70i14oRrgCyAulo8Z8kLkurL2sOVK2XaPpyqXEtBqH8RJ8fDTIgoTAXS8RlMjM62Q
	rntFIBSrya/N/IbYJU/fXr7zyG9b2x9sY+0muoIt/Av3zxoshaNP1KVdhWuCEIL56rqQ2xft9YpMR
	ReGIEwPl7T5DeLvHfTFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKvqn-009kSy-Sp; Thu, 26 Jan 2023 06:35:09 +0000
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKvqB-009kFL-CB; Thu, 26 Jan 2023 06:34:32 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id CEC30320092E;
	Thu, 26 Jan 2023 01:34:29 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 26 Jan 2023 01:34:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1674714869; x=1674801269; bh=Ob
	MekPzegFWo+wBsswL5Mv22V9QXAO26FNLwMRm8iqc=; b=Vm9AXhg0gVaC5/ft9A
	FqTnAa/U1xCK50dU8Gm3sCRQOk8KYtlElCoIwHgM0d6kr2vwE7JWOdNPOOLFsvYK
	7DfYdyof2A2CKJI7o5G9lB5+poXkPXztcL1BB2DHF1NrbCq149QZPSvWylfWdYdt
	fOfZbWtLDHoalO0O+WD8zp6gcFeNzVcBMsVIZiqDWHl5Xuu4jDgFvJp66z/RcAK5
	Psv2esbZNXYOFF48MlI6MkPUhwbbQkW7yUowsUTNA614sJe12P1maRkKOkXokfCj
	YSZ9dBElOVdDCboTywPird8nQqJf2at0InanVkBTKtArBkH0hKhBTAff7TGal777
	RxUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1674714869; x=1674801269; bh=ObMekPzegFWo+
	wBsswL5Mv22V9QXAO26FNLwMRm8iqc=; b=CVlFV0P2pFp/0KWpFkP1/4O9AU/kB
	q5Mb8iXB7YSwa7wIVf9X0lboAMO8Klr6ZErON1x+C+7yjGu+XXD/1xeBjtpyRH4H
	Kiv0lceVr2ICtFMSYC2con0Hfgh4II4qmnlOsUazFYNMaGW1DhL8V4ToWi06JRyU
	m9uJWpiQWgT0eE/8X/w76YEL4qWW9ot4lHiS+Ixnhs04ImawUdj428UCRhzjsHyp
	/zdkI3NPrkZbyOmQ+XotzsrSycF1uz3JMvlZiKZZRcKSoZI0JRtv0qdfLHGp/psN
	gAMfbDqMtc3TpVH2SpBLJa08U4neqsLX3MYVeBDsolYqiF4hCOqVZJWOg==
X-ME-Sender: <xms:9R7SY-FrOL0L80cstx81k__ERMc_k5rUmocKJJadgJBOQuRv-iSkYA>
    <xme:9R7SY_UwVBslMhLx-e8N-kD6HykCYw6hEXvmMT98--FdBO9ZWJc1VIa55UaWdNMbA
    uNnpCkX4QPHnUSNZg>
X-ME-Received: <xmr:9R7SY4JOEdaWe3j2XQJjKqIRzX7MctAwUHEW43Df5ZjNyInP4nCTUamF71I3o9soU_y6_l7FQOfH7Qp4zAkohSMXH3Fg1m49B-2pHrdS-H-6A9VmhIzyZE4acfI2SulBw6K7Bg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvfedgleeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:9R7SY4GlohJ68L6sBqAgPx9Jds94MKrFYY6wlGzHp2f0MTyi8iF4SQ>
    <xmx:9R7SY0UiIr26njO3ngbuv-uDVp8OsiG8gcuTB5R1IB8KfwSoYC--Ag>
    <xmx:9R7SY7Mx1SBLoA7C9yYMTI5Z-b94EuchjqR2nacVnDecpDhQRTkICg>
    <xmx:9R7SY1VisV61jvPWcNuzczcmowmBbtBpF5a_0cOsx4aRImkqOlw0vA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jan 2023 01:34:28 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Conor Dooley <conor@kernel.org>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 3/3] riscv: dts: allwinner: d1: Add power controller node
Date: Thu, 26 Jan 2023 00:34:19 -0600
Message-Id: <20230126063419.15971-4-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20230126063419.15971-1-samuel@sholland.org>
References: <20230126063419.15971-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_223431_507465_9BCA809D 
X-CRM114-Status: UNSURE (   9.99  )
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

The Allwinner D1 family of SoCs contain a PPU power domain controller
separate from the PRCM. It can power down the video engine and DSP, and
it contains special logic for hardware-assisted CPU idle.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

Changes in v2:
 - Include a patch adding the device tree node

 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 3723612b1fd8..6fadcee7800f 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -799,6 +799,14 @@ tcon_tv0_out_tcon_top_hdmi: endpoint {
 			};
 		};
 
+		ppu: power-controller@7001000 {
+			compatible = "allwinner,sun20i-d1-ppu";
+			reg = <0x7001000 0x1000>;
+			clocks = <&r_ccu CLK_BUS_R_PPU>;
+			resets = <&r_ccu RST_BUS_R_PPU>;
+			#power-domain-cells = <1>;
+		};
+
 		r_ccu: clock-controller@7010000 {
 			compatible = "allwinner,sun20i-d1-r-ccu";
 			reg = <0x7010000 0x400>;
-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
