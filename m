Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DDC0C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Dec 2022 16:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YnqfrQ3a7z0QbTx7p4sbZEwBg51TuSHSQGlBI0nO5TE=; b=So86brLDXVusV/
	69UydL24ecPSGmXjI19VVqq4LlQfO2jF6iCqHX3xx0oML7wwZN4BinUuOIqRYcQEKwQKi0Eo+r0UE
	z6Yw/V2ySnrpjMFvqShdJdXuHMssRBO8YzRDpJVhIGBsP04kGG1iHDg0YxMAOR1ZhJi9qCdGy6g8M
	frP2pHP9XyRxq+10iQXa8GDdor3DbRIDkqoFBnCaSdOsMRGoBWcWpGt5tgMCm/LDsTg9Xu82IVvzN
	e3FrSjw+7xdJU64flmNoopqyUIPbnN3nebhgiABiWJ9mS0JFrA1QWfvhAuWomMM3PBCQJmI3u0qf1
	OoC9i5+UlrFRj0ehYcSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBf3s-007g0s-A2; Sat, 31 Dec 2022 16:50:20 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBf0H-007djL-Ik; Sat, 31 Dec 2022 16:46:39 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id D038F5C009F;
	Sat, 31 Dec 2022 11:46:36 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sat, 31 Dec 2022 11:46:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672505196; x=1672591596; bh=7u
	QYAURCHALofBgFqai+eJUuH83j/8j81wXB1dd11us=; b=Z1Lc/KcetaEibwX0dY
	JySItRjpdvUAyueivr0diViUBCr7DukMgltIDO350pBO8e2zlGGPBi1ZM5K6g8RI
	ijpH54flxMKeCD+p9jAfaJ0FAmyxb53KCENakMz5YEBliQNhlEMIkDhuoeu8S9Kx
	0ZU71TiJ9ihY5p3RqTU5E1eGPmsbGRQIlPSmy5UfBDioxvFyWAcw+ymVNPuhdUg7
	PlhhqSmJXojzy2B9WJQhvC4fp0yiCVFGchz+ncWlPl8EUYzI4b2wx83efps03v1q
	/ebkfvz+wTjFkm6Th29cL1rBogtMpAm/l97JaaA9UCqyrd+y46LkuxUpOVdqEarR
	grCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672505196; x=1672591596; bh=7uQYAURCHALof
	BgFqai+eJUuH83j/8j81wXB1dd11us=; b=uEtyUlqWQIP6KQnLbF7xCXwWgQnnI
	Q+68oZS1Q2BfaaSRj05sI6nC5Gb98mtUISzPKUuxFMVcN17GMeOmU8Qd1avNLwXE
	REPaCDhAB8os+3Zt19Ni0I+jAO3e4xjy5AStkBwIPX/DmINi5N9eDEw5jXvcp9R9
	lEofGkOsxzCviMJZVT7Tl5PXJMx0wiBedsC2ME82wRjhU6iTbs/AncZErANh/bj/
	olZlQlAyZmcBe19ZbWsPh4FRGOjndpg0dlmHmFR29vttM6Tnfumyyi93OIuFdcsp
	9/5Vs+lk2WeZrkPAv/GTX5DlC3Vh56lMiOBCblzOfkcm1jf+WrZq6ShuQ==
X-ME-Sender: <xms:bGewY2YyJsoB9GYtcd0Y7RbeHn6f28O36fil5Bk07AXHPEc4tVYFPQ>
    <xme:bGewY5Y1iZVeifPFRNJqGQbS80D47FmmWiyWe_osuVhTIcbTeXCMOlLIegRGwuQN5
    SlrDz-VkV3i3kJ2gw>
X-ME-Received: <xmr:bGewYw_tOGNGkqnPQfb69c_rE2IQtIqo0DZAH4GgJtnlcw5BupJRS1bI5t6IFkpGd1HRlFKtTt8L8aMgT-qMaeR53ovVSK0Rlor8EoRQ1mquSpfLdd3BZkjE3I6f4j5rqi_d7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieekgdelfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
    feeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:bGewY4rV7zQaxG2__glQcVtFLQp82ebxc280fvp_8943ZTBp1AxmZw>
    <xmx:bGewYxqsc8d2IjOpXGlF5GEy2pJwTFaUISDLQeg3uPNPOTj7y7QEQA>
    <xmx:bGewY2Q_vo2xQr8FYEHn3nEa79tQoZzMt4Qrus7v3zUGF5dpgZ4loQ>
    <xmx:bGewY2if-Uz-np-3MUQ1eFvqDpKhjalu6n3Z6JZ2ftPjoU-txNTSHA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 Dec 2022 11:46:35 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Samuel Holland <samuel@sholland.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 4/4] riscv: dts: allwinner: d1: Add video engine node
Date: Sat, 31 Dec 2022 10:46:27 -0600
Message-Id: <20221231164628.19688-5-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221231164628.19688-1-samuel@sholland.org>
References: <20221231164628.19688-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221231_084637_900346_9F723EFD 
X-CRM114-Status: UNSURE (   8.62  )
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

D1 contains a video engine which is supported by the Cedrus driver.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index dff363a3c934..4bd374279155 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -34,6 +34,17 @@ soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
 
+		ve: video-codec@1c0e000 {
+			compatible = "allwinner,sun20i-d1-video-engine";
+			reg = <0x1c0e000 0x2000>;
+			interrupts = <SOC_PERIPHERAL_IRQ(66) IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_VE>,
+				 <&ccu CLK_VE>,
+				 <&ccu CLK_MBUS_VE>;
+			clock-names = "ahb", "mod", "ram";
+			resets = <&ccu RST_BUS_VE>;
+		};
+
 		pio: pinctrl@2000000 {
 			compatible = "allwinner,sun20i-d1-pinctrl";
 			reg = <0x2000000 0x800>;
-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
