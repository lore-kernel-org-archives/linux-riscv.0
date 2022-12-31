Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD34C4332F
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Jan 2023 00:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2OaBT4yWluVYhS6BhFI47MaoeajRy6sChSh/r/jwGks=; b=xANFDodQ2bKxkI
	x6kO3m9FpGe4lv0vNDuN+3ZeICsecLsy0a3bS1g5KeEd2GU/IH4jiVMjE/XKilvDHDNkuXmynxXI8
	tpRPY8kynNc93842gEcO3X6I0ANvHub5ypqq0eNbRabwJQYpy5hujKZzhX9bKollrIa5f7EE9GFsG
	Apj+N1/FsxLzRInJFvkMeGA2iOmW1KuZymOPS3ET+EXc7vj60Bab6acKdVS3udeiDI5k0RGHP2fPA
	2179OU/7wqiXC9bQYU/GmyGVmCj8FrFRolRAxXuHK2pIufgRS9BWStpRMqSclEzPuW9ZxMxcxYmkk
	ixVqUEVpFfaB1UuEAkFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBlzU-00Bq1f-3v; Sun, 01 Jan 2023 00:14:16 +0000
Received: from new2-smtp.messagingengine.com ([66.111.4.224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBlhe-00Bfwz-Fz; Sat, 31 Dec 2022 23:55:52 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 7BE4A5818F5;
	Sat, 31 Dec 2022 18:55:49 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sat, 31 Dec 2022 18:55:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672530949; x=1672538149; bh=3l
	UzKMMvF7vk9xmGqukiUQTKJhZZpCfvn0wSoYuZP9A=; b=BVkco794bS3VyPN8pf
	40Gap/hkUSZFoR3L103zIUWpJl8AoX565M2YqTlwVWeD26wbd+DIw3aiy0uyIO1/
	B+4pyZvJqM1br3j6qEoWeYonS0pD4eegMPXwrgg0lxm2NI6YdcLtT8Bqhr17P26N
	6U4buAijem2cFkaVR8DGhPlTes6j0nEvspNHT7xx1cIDW7ko9PqlinuhZkMALpXl
	caYEqxzYUxwNpTQC2+XHuTC2mLaVTcto7IkbOr92KXoibgMDsX1pi8epGuZBgzQS
	dyqRed8X/307JlyLWtFsTQNUncZoMF1iPLxAJbzgVFFXXvJPLIySJHxl9xt+rnFf
	CUCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672530949; x=1672538149; bh=3lUzKMMvF7vk9
	xmGqukiUQTKJhZZpCfvn0wSoYuZP9A=; b=lYDxZJIRxJ15BiBXVJx+vsb/INpLX
	jt9nueLiX2E8jwMiIIPxnJPCk/HH2NbjWn3riyPUFOSWzOQQcm0uvIZfK52HGKFH
	TASwbpUWzADSv3fB/4Xgh0OfxVaWtxbTb8H36wUaD0nRZ1hBjDyi7ORPglPc+dEI
	qq70A19UuQuvJFW0CVyT7oXdlq6sTgCqY1suCSp5K9Lt8sx3Mux/kuD/4EBodiLG
	wMGqMTgANLXNhJRXAm7s1WtW608DggvepNKLWmfrLsY2snS4O7GEFfJqmHdIrFNd
	USFW7QdxgXAR5SCzc69799OUUY5lH66EkPgrMdxucHcJU4Gh4B70kdwGw==
X-ME-Sender: <xms:BcywYxZAy2VdNn-y2Oo6zaKQX9SJyrm8r8qjMBv0_cEYWOBiEh4hnA>
    <xme:BcywY4YpXGPZzOCF3zgsEPSw_qCjaxXdJahcFCenyEH2HX6dL9zIhRY4qD2U9vqwO
    Z90zh_bPh9yoJikug>
X-ME-Received: <xmr:BcywYz9qdI79EpKu1S3e1R2JY2Mycq-7p-kNBfrJT0st3IwIuWmbEDeaIFdeLkEIi5JNI8yeqGKFz-Pvk_Djb_wuykldBMfIBqW2G_Ge6BaZaIY9NMrpXpUqPr6kcfa7RBuMrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieelgddujecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
    feeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:BcywY_pC_Reu3FX_Y42ZJXyw6WHRIHeqXYeROWIM7jTUIYm5_BfkrQ>
    <xmx:BcywY8rkvYem8Tgu2YYXFPpTzTBE6E0bTXmwevCtVCJsbhnr-0pXRA>
    <xmx:BcywY1SChv5KQcI_gchdR-ISeNI13wQBfZFl8tZhP7GEOM-_JtiDhw>
    <xmx:BcywYwoeGPjalucCOXbZdNgk8oIaXk7UaYQGK1149wJvw817GhxTJA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 Dec 2022 18:55:48 -0500 (EST)
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
Subject: [RESEND PATCH v7 4/5] riscv: dts: allwinner: d1: Add LED controller node
Date: Sat, 31 Dec 2022 17:55:39 -0600
Message-Id: <20221231235541.13568-5-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221231235541.13568-1-samuel@sholland.org>
References: <20221231235541.13568-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221231_155550_677144_1842E58B 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Allwinner D1 contains an LED controller. Add its devicetree node, as
well as the pinmux used by the reference board design.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v5)

Changes in v5:
 - New patch for v5

 arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi      |  6 ++++++
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 15 +++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi
index 97e7cbb32597..28a6df83ec08 100644
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
index dff363a3c934..6b70b3cf4965 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -138,6 +138,21 @@ ccu: clock-controller@2001000 {
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
 		dmic: dmic@2031000 {
 			compatible = "allwinner,sun20i-d1-dmic",
 				     "allwinner,sun50i-h6-dmic";
-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
