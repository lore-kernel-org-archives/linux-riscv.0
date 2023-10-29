Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33DA1C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Oct 2023 21:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pt8oK8OM/NzPtdl9MG2FXnhbKNYtcuf6vuhyYkTFCxM=; b=K1X2OqaFKv4tqX
	5O3PpMTkvSAV8LwW4Bn+ZPUS+eGXc235HHsyE6n3rA23QzMzfWfl93DBBNI3l4vlRnkaL4UlwkGBH
	72zycsD4brxoE0VHr3gEa2uzZ/ZwSuKdF51+PtVM41yFSSRsuI8EKkulhE+y2XEVMC+q+8L83wQn4
	dpzWdx+M8+cH8JUSZSzReuJOFYoGRNj+1SX0E2NT48pxhgLsAekuGY8TvL23jJ9WNyAIgUpAxVR8o
	Y9kg8jW1oPmYmfBP3uVx7CX2eoojvA5Oe7A/IHi8J8JkcDbvG2RPOeWvidHtvE8JYyGpx5k7nSra5
	ChxZyXqwhQ41oxxy7uRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxDKX-0028um-2U;
	Sun, 29 Oct 2023 21:28:22 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxDK2-0028bw-0S;
	Sun, 29 Oct 2023 21:27:51 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 8AF385C0195;
	Sun, 29 Oct 2023 17:27:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sun, 29 Oct 2023 17:27:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1698614869; x=
	1698701269; bh=Uya9a1BC8Na+HTXRovX+d1wlxedeh/xYXLNyXbjnaHM=; b=y
	dWKhjeQxRnwmMJYv55er3v5Qoa0/lM+Co29bHkbHbOo2eqX17zLXz0c6s8ACNPOt
	0qCBF0sacmwhDJLgTOQlQyAk4wrtbv3gmKrTru6PTBS4mSxIEMijMu3XzW9/YF+p
	6SDXSHoliYPKpVn+XMCC3Nqlx8VhzfLLNiQVpO94Uv3x0Okvlyho8JCXvOUqsqKX
	SA0Myc/m2N3rF8FNr4W+LCQs6Hbc/CGHPM+McEdGujp+D6DSJQHIUqiVmUlZDSiM
	LiW5DxwrsERChLz9y0VW41F4J18hCep5XIPoMa5cpHWfYK2JRx3LZIq4ajef5lXm
	jPi/bCTKTgysCXR8KQxSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1698614869; x=
	1698701269; bh=Uya9a1BC8Na+HTXRovX+d1wlxedeh/xYXLNyXbjnaHM=; b=J
	Nui7if+5+cA+svFA2HPLjpncsOngAA5fXHBU+hpTjvL1gooPSRfTuV+r0nWWvS+M
	qKpLy1EbVD6cXqJEEw6c6ZC1sA7VaAxlDD1oSqlXF+ghpa+BUiQmprcFrlxqXyAC
	btit2xqCA1tf0cYJYM/Xx6Dw/U7nstM6paoMw5TAB5Ii1w84ksxfFyVGawZN24w7
	Gn7G/aVi7Z07XrXA1OZvARC7xujhwuqqa/NQO5rP76s6xy/yNzUplN0un9rYP5Qm
	epUZShs5zeq1n2o5pWvWvvij5HYlAJ1bkCYtZqyWY2caSGiQ6qM4TYQCxYYnknWZ
	3i4EdgF39xfwsgVLLIWig==
X-ME-Sender: <xms:Vc4-ZapMGmXxfX_Oj8M1gU9JNMG-vj3I6z2cFhAaWuUNDHjTC8Q13Q>
    <xme:Vc4-ZYp8wQ0Bc2Xhwk4JkOsOtMC7aU8_r_0KIxLiAtWuKyiJpoFgPQGn9STfycr08
    OfAmWbX5x9dFEvfGA>
X-ME-Received: <xmr:Vc4-ZfNa3iMtXhrFO8qFyADnpe_H3GjH4JilQA8JJnXo9MZlHhK8FmHWlitpMRLOo95S1zRHfqNiHHxHIdbK8vJmyV7ZLKRXce0XipVM44qZV758nmvLg2RppDKiVi4eKYvj-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrleekgddugeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:Vc4-ZZ53SuL4kuePQ3WHEzU-0MC0wuWIeOGRpNwnwNWzuVNIq0rAjA>
    <xmx:Vc4-ZZ6mGMdpMUBWjbhP8Qg9PkG33KO8nWzRRUgU_g1tLOcQByA41w>
    <xmx:Vc4-ZZiBvwkGWzK2t-Xq5a6BL6VhXSrfV3_uDlXF_iau4cSBFWdJ9Q>
    <xmx:Vc4-ZeoDlanQES7efe55ZL3DuJd6ygjMXW3uibm1aZNBQzpUGnov1g>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Oct 2023 17:27:48 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v8 4/5] riscv: dts: allwinner: d1: Add LED controller node
Date: Sun, 29 Oct 2023 16:26:58 -0500
Message-ID: <20231029212738.7871-5-samuel@sholland.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231029212738.7871-1-samuel@sholland.org>
References: <20231029212738.7871-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231029_142750_251474_637807A3 
X-CRM114-Status: UNSURE (   8.16  )
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
Cc: Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-sunxi@lists.linux.dev, John Watts <contact@jookia.org>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Maksim Kiselev <bigunclemax@gmail.com>, linux-riscv@lists.infradead.org, Marc Kleine-Budde <mkl@pengutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, linux-arm-kernel@lists.infradead.org, Trevor Woerner <twoerner@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Allwinner D1 contains an LED controller. Add its devicetree node, as
well as the pinmux used by the reference board design.

Acked-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Tested-by: Trevor Woerner <twoerner@gmail.com>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v5)

Changes in v5:
 - New patch for v5

 arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi      |  6 ++++++
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 15 +++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi
index b18f368e06e0..b0fb0ea377bc 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi
@@ -58,6 +58,12 @@ i2c2_pb0_pins: i2c2-pb0-pins {
 		function = "i2c2";
 	};
 
+	/omit-if-no-ref/
+	ledc_pc0_pin: ledc-pc0-pin {
+		pins = "PC0";
+		function = "ledc";
+	};
+
 	/omit-if-no-ref/
 	uart0_pb8_pins: uart0-pb8-pins {
 		pins = "PB8", "PB9";
diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 5a9d7f5a75b4..a476b59ba306 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -156,6 +156,21 @@ ccu: clock-controller@2001000 {
 			#reset-cells = <1>;
 		};
 
+		ledc: led-controller@2008000 {
+			compatible = "allwinner,sun20i-d1-ledc",
+				     "allwinner,sun50i-a100-ledc";
+			reg = <0x2008000 0x400>;
+			interrupts = <SOC_PERIPHERAL_IRQ(20) IRQ_TYPE_LEVEL_HIGH>;
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
 		gpadc: adc@2009000 {
 			compatible = "allwinner,sun20i-d1-gpadc";
 			reg = <0x2009000 0x400>;
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
