Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F02C4332F
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Jan 2023 00:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8k058nEKOwzu9FZbSX5u2K8j3oFPjMHtOfLtSjNntzM=; b=sgTdBaMPvz2vYC
	VoHho0ae01SMsLpPWwJggcr92IerFCSf4OlS+N55z5w3Rg89cYx0mLQUAZwqvNwx7j3+4CxU2qPMk
	5td6SuODxlDbEIYzf6XsriRbQqNi4UlYsUYpfhEk1LPCZnlhR78a13BTcKQDZVh37U3r1TjSMfS/A
	B/YPnqXB0eHlTSeHsP33I54tgBq0RihAQiuD4I23ppKHCNqc/xpvfWb93PG8NT1rKnvFN322L00pQ
	76zv6Y25tIF7FBBKi8ktEbPyFc+NoMphUxpLzmhNLoO4N6gM7lqr9IqUK97TXgtMfu5CWXjaUKIfw
	Y6dqlzXHzAGz6od6VPkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBlzt-00BqGa-Im; Sun, 01 Jan 2023 00:14:42 +0000
Received: from new2-smtp.messagingengine.com ([66.111.4.224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBlhf-00Bfy6-NA; Sat, 31 Dec 2022 23:55:54 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.nyi.internal (Postfix) with ESMTP id DA6CC5818F8;
	Sat, 31 Dec 2022 18:55:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sat, 31 Dec 2022 18:55:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672530950; x=1672538150; bh=wn
	k0fQbI6LUgf3REBg+Sy4nR0IreskH+9S4EM6UJtpU=; b=shCDSFTvEqAHOEyrxt
	Pv2aJGNrDPL5wlUYOjMbwrsiWrgpNDy5CV0rJO+edySI3WEC8ZLAQLg3kWkVBqLh
	pvV6pwWFqKC+AtpKWV9q0Rbu/c/QQHVPZzCX5882xFFgUWLSMIeTWMrY7kiOMQHy
	+zu22cxq+E6Ictnf8TmIjzjkiCLOfJiZKEVjY/IIO/hX8QMxx4jXOvX1kXEuL+//
	kx06iM7lO16wjzV2XeXgcm7JYWp1faW+emkMFgmRzZgvIUKCJVuBk8Eiid09Tk/t
	r22ZTrRmSRZmCV1Bv+9EYptLJfW/2pmFwdbOepcUqHCqBOeyJDO6lv8qxrr1aybS
	I0Bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672530950; x=1672538150; bh=wnk0fQbI6LUgf
	3REBg+Sy4nR0IreskH+9S4EM6UJtpU=; b=nbjip5LZ5R6aeAqtNWwTmofZixgFu
	6U3fvstgZfGHgnPvbfNqMTGcZ5MWUc5miBWpnoeS4Pe6rHnxRCysjumqYtl757rz
	lVl07D+DvN21gy6et+K+/SD34odTQwz6V2TnVffkxZvl13/KuRJNubBWWcJyU76L
	1xBboRkdvk1FW+dt1pEksyHVa6DOuD0rePjUbYaOvTMhFKx4C575CvtSIVLNFHMK
	scJRXRQ+nVWs61DflCRYV0iuQZXe7Ybe9Ovva6W2kQUH7QbtrMUR1EU/I/aVIVrI
	sX9oHy7OJ0fogO/3X5/RJwfvsyq97levbS1Lno2PXdc69mWTzdX1+Sv+Q==
X-ME-Sender: <xms:BsywY6ANxssPWxs22Fyrmt3KU_SYDinXh2TaSUoy2xdScLg5wRqLjg>
    <xme:BsywY0ipB0vqj3DWy6FOm-klDMCp-hR7PmoKu_vF8SMJZ_Kw0kQQsm8J2y9nTEoZj
    n-tlF_eTJh-oR7Ikg>
X-ME-Received: <xmr:BsywY9kbGkrBgommwN5XWzsNBT1zCZYWBI11ylVMGxw7jBpjZb6Lurb2WREaQth236EoXTcS6WHUeSbQM-uugFnmBbvgUTdxiidvFkOig7I2tpqEbXiS_NpJlqdnBJsP1_oKuA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieelgddujecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
    feeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:BsywY4w9EiFMZb_QViO-CKldIjqzfnJXLYvFiIPAgNnGhcwailXlKQ>
    <xmx:BsywY_TAY9neLTaqZFM-fbUhyuHWM3EY6Af3YC05UAr1VZJyFiJ9DA>
    <xmx:BsywYzb8qiir7hkec5zegEXUQS53hF8jAwX6SQPmlkEnJWBnvURoqA>
    <xmx:BsywYwTPWDH1o83qYidISamGkTdIAfN_Ny1PeFVS8gFgj0zvw1NSsA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 Dec 2022 18:55:49 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Heiko Stuebner <heiko@sntech.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [RESEND PATCH v7 5/5] riscv: dts: allwinner: d1: Add RGB LEDs to boards
Date: Sat, 31 Dec 2022 17:55:40 -0600
Message-Id: <20221231235541.13568-6-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221231235541.13568-1-samuel@sholland.org>
References: <20221231235541.13568-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221231_155552_593624_90D85C23 
X-CRM114-Status: UNSURE (   9.28  )
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

Some D1-based boards feature an onboard RGB LED. Enable them.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v5)

Changes in v5:
 - New patch for v5

 .../boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts | 12 ++++++++++++
 arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts   | 13 +++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts
index 52b91e1affed..7efcec906a71 100644
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
index a0769185be97..2e5be1bbb00f 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
@@ -3,6 +3,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 
 /dts-v1/;
 
@@ -93,6 +94,18 @@ pcf8574a: gpio@38 {
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
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
