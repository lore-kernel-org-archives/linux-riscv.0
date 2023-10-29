Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F0BC4167B
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Oct 2023 21:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i185D81u5kw60mgTZCRThvXbjqe9yQ1Ul71fO5/vQww=; b=f60lYRZlSfybVN
	hPMjp+yH/jD+v1FeIZFGp6bxwMKXn9tSyyEMamHiH5yZLUwqfaeo3Rf6buWYlUEgYb0qaBk/ug2e8
	RazR16HSmlv6KpjVbNrkGdLv9J2sgozBkofAV5FAov+2Sso6crYmWqCB//0JBklwqY6CZPR7DNV6k
	SXbUV69sYuZOQLWUCI4lTFXgFUZIRMbTg8jUFPQhXdeJ5onVwd13gUwOXOo7u42IkGKC/VyxJpMAh
	f+CchtYVtb9tNA/odZbbEaT7waYY0HdxRuh37wgk4FAMD0F6pqYExYA52l8l6ElicJwytv5anxDN2
	3MLs9da2szdI+5YUYPiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxDKh-0028zU-2K;
	Sun, 29 Oct 2023 21:28:31 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxDK3-0028cs-2F;
	Sun, 29 Oct 2023 21:27:53 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 221405C00F5;
	Sun, 29 Oct 2023 17:27:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Sun, 29 Oct 2023 17:27:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1698614871; x=
	1698701271; bh=pqggGLCwnACae2UnEHHjv/s1fXcJLCQyy4ZCbqoi31o=; b=Z
	gqMwS2D+kJ4kswoDW9i2nb/5RDjHHQQg/nlgEd+ZmGnvnSfPEq3ES4y4nD1TbFC2
	fk/CoxFMftMxtamvIarT2HF1MXgW2vRqFrkprnSsXkfpUB5hm2VBwEhY5oMts6fk
	4zLhwSAIAsZCLlJNMVHuBmSc1hle3Oon+3m2xjMeSYL3v3kj56ANZ2ZbGuv1w5oA
	Ma0vPwUHAfPAiTtRqH0NqrkdtWmA47gFZwirZpl4MZPV7ROWZyno/PLVAfnD4Lsm
	wxROGu+uMI873u4cbReIwIa5PKA2DCXYZ0krA8IsdoIZ8JetvnOv89oHeX/UcLJ0
	WIofRgq9xo3JZFoy9NnFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1698614871; x=
	1698701271; bh=pqggGLCwnACae2UnEHHjv/s1fXcJLCQyy4ZCbqoi31o=; b=t
	JmCwC8aYLZGOFM9dYO+XRT+YMxeyVgPh1nmN2/K5bCGlXN/NFlsIJcq9Hyf3S8x5
	1oHvNdoRcU8JL4W5BtlCKNwtwWW//yz53YCczG2LR7re3TtlT3rSRjb21wC91AF0
	+j30s5Czv8ylIRQJ3SXlB8PKxO8iOKjvHppIztWa/GNKq/aWK/mtKlhRyKJpjnJW
	RYsjlzwef55QiKeto2DCKbLGh9U3/OHFG8s4c7m2LdFUy5PLt3IOXqAvrPOZMmLr
	NM420mpp94tD41XaMfJdVy7sgqoHpP3fNHf7OaGM38lpBv1n7lNtvb/DY1Bo+yPY
	hAgDv+JuMEage2Jujp/GA==
X-ME-Sender: <xms:V84-ZYpNXs0l4jUWUxn0HR_h-mpilzyOxma2J1uNMOHd33fChwL0oA>
    <xme:V84-Zeob_5mYcbaFW3RjVmO-p7qsJv9m8fr2c9xqMyZTdroD8ccqK2SNpx_9M-zcq
    4Gou1KlM15SZDRlZQ>
X-ME-Received: <xmr:V84-ZdN2y2PI5UOHn0AuaJY5ZHLPOUM5KvrNRuKEgtxRFnwjestQtKSphdBtIQuqyLPOdgZObhqNDk8LQ-FoquRCQcGStnwjlNs7QsBRKS6GzN4TyZIcKLFxcIlzW0puvWzssw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrleekgddugeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:V84-Zf6VyhNSgo-hr84p5F_xXi94fn0nGjpBWDDayw4UXN3Skgi1Fg>
    <xmx:V84-ZX7VbzZlzchlI8ynPStFghcN00SFf0aGf7blOdpiHoHLf49QNQ>
    <xmx:V84-Zfi2ezyHLXh_hYDOMReXa4KxWGJLg6Gu1KNtU7m390CQ5JYcoQ>
    <xmx:V84-Zcr0ShP3pvYkZmTrErI_4LGVgwT1JQQF9_0psqGzotL3lTv1HA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Oct 2023 17:27:50 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v8 5/5] riscv: dts: allwinner: d1: Add RGB LEDs to boards
Date: Sun, 29 Oct 2023 16:26:59 -0500
Message-ID: <20231029212738.7871-6-samuel@sholland.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231029212738.7871-1-samuel@sholland.org>
References: <20231029212738.7871-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231029_142751_812614_BF31B3D3 
X-CRM114-Status: UNSURE (   9.17  )
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

Some D1-based boards feature an onboard RGB LED. Enable them.

Acked-by: Guo Ren <guoren@kernel.org>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Tested-by: Trevor Woerner <twoerner@gmail.com>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v5)

Changes in v5:
 - New patch for v5

 .../boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts | 12 ++++++++++++
 arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts   | 13 +++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts
index 08cf716328a0..feaa75d5aead 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts
@@ -59,6 +59,18 @@ &ehci1 {
 	status = "okay";
 };
 
+&ledc {
+	pinctrl-0 = <&ledc_pc0_pin>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	multi-led@0 {
+		reg = <0x0>;
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_STATUS;
+	};
+};
+
 &mmc1 {
 	bus-width = <4>;
 	mmc-pwrseq = <&wifi_pwrseq>;
diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
index 8dbe717c79ce..73840ea300f0 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
@@ -22,6 +22,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 
 /dts-v1/;
 
@@ -121,6 +122,18 @@ pcf8574a: gpio@38 {
 	};
 };
 
+&ledc {
+	pinctrl-0 = <&ledc_pc0_pin>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	multi-led@0 {
+		reg = <0x0>;
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_STATUS;
+	};
+};
+
 &mdio {
 	ext_rgmii_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
