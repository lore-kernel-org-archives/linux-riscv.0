Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F00DECAAA3
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Aug 2022 05:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VW+f0MwHkrMFvUTmHX7tIeUwCnrZKBDCuH2ahU+G1f4=; b=JoAyIe3pkFOHNU
	yujSul4YZdgzH9Yq+hzgVG3l5syMIsTpGlcmK2z8c78pGEob+1WkW5S7hub3mPzcobMGr4XyxrYrI
	3i8faWmPlJNQoIGFGKxmJCO96M1kd0hW+qLjOkcoyqvNWmUTxpGZOjbJgW7A+ytfjtgCxniGxhk3Y
	B6jYEiU6tD4HDDpcPz2X8TzHCUAAxe0AOeMTjAlBglYykq75tfjLhyd+6KqIdTeOUyGUsDnldfG6w
	Gg27teAVp+GYADz6Jj9nAwbbXwVMQI2bKRd6QMdVinPFdBZtosckO/f5pJNmjHaqjtULB5Mf6VWU2
	5zwmdRqZDjUkEcYqE7hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRRcG-00Dgc0-KN; Fri, 26 Aug 2022 05:10:48 +0000
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRRbQ-00Dfr0-7p; Fri, 26 Aug 2022 05:09:57 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 9A3473200A1B;
	Fri, 26 Aug 2022 01:09:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 26 Aug 2022 01:09:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1661490594; x=1661576994; bh=vd
	531MkIYA8R3532OhIEJHc24rhSGrcsdC8Qi3NA00M=; b=bB/aZETnOTSQGlJZZ0
	180RJIJjCevFEz6Wqvc3DCJmzXzIcTtCbqMRuUAZtqaYE7K+xpE3p1s6IMx5m/AH
	jGI9PeHcCYUA2MlT1QyXYTvbOforXzfX5P8mmkleJb887LkruttWrGUMbPtT/Y6F
	g9i1y5ceqxA6uO23pgcGn/k2MDXYMKKXjzRPL5h/PlcUwbsTDtekXhZw6WXqAPH7
	i1L6nDZUYROGo0qP7O475z6djYhWQC7jXvmuiGUyl2VFgqOp6J/sTJE+HjT4sX50
	WmSP3G007wRwm17O9Xxl5kz3nEfYBcqy6huGnN4zyGbI0H6ZbBL5zebXzLGvvdJO
	SLzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1661490594; x=1661576994; bh=vd531MkIYA8R3
	532OhIEJHc24rhSGrcsdC8Qi3NA00M=; b=xk14UN/xrRzBRWuubG8bEXdX4lMPK
	Q67kdqWLk3amdrveuFhfw5le2ar0gE+2GzMA6busI6SfsS8OJGCjx7Cz2hxHu+D4
	DbqQu+kEJ+MqrkyeEnyBOUlqZnicwUB2D4L24dPJD5BMdh7ePbFiJAaMiCgp10iN
	aljDPE+hinsQBdMYf+61UU6aPfh7FxtW8icHIhqVwiJ/VoKDBB/gA75NvU71iplS
	fCGURoowSFJ1D4SaTHk/TEz27zOwv40bCMJaQn9PB/n/H04xmrskx1Vb1n18BXp+
	Pyz14EvWEQAAfLXBbI+g34ZmCMC/1+tG9Q4Cnmexn30ceSnWCt6u0jIYw==
X-ME-Sender: <xms:oVUIYz8iprudiclBp6kTcQUX6TpS-cZiJfBQsTR7ROfqb6mV0JN44Q>
    <xme:oVUIY_tKi6TE1bPsTk-6Tj4HW2pX0CEbtNZc_U16KKplVBKBDifReHVdOpVZig8Xf
    x0AkuJDh0ZUmid2HA>
X-ME-Received: <xmr:oVUIYxDHcPX3Mu39By_Nc5nxIGsHTx-76jbCdNgMNSqMyKXGlxkvWgD8xcWD2TqU8u-NZi1EuK9Vl0JE_STw6d571ThHB8WXNraqv80HiRFA4AxdhMP6kTsSSgQNe-HvbrjHWQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejgedgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:oVUIY_eNgHsmwdEt5KJmEhlSt4fjlZEL6G8v3tqFvkkyFme-wowT7g>
    <xmx:oVUIY4MgQGPipdapZvdFGTtv5Ei5JHT7-euJ8zGIVh8omKBW4X98_Q>
    <xmx:oVUIYxkmLvNtnhiTMVpz_xiaiH7ogAc4G0FOpJ72M1y-1LEM3Y4uoA>
    <xmx:olUIYxnx7fxPGlaXmyrAf9lDROCa4N0_138kcR6D1ahBwqUmoVjByQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Aug 2022 01:09:52 -0400 (EDT)
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
	Samuel Holland <samuel@sholland.org>,
	Yangtao Li <frank@allwinnertech.com>
Subject: [PATCH v5 3/6] arm64: dts: allwinner: a100: Add device node for DMA controller
Date: Fri, 26 Aug 2022 00:09:39 -0500
Message-Id: <20220826050942.20067-4-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220826050942.20067-1-samuel@sholland.org>
References: <20220826050942.20067-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_220956_335168_AB145058 
X-CRM114-Status: UNSURE (   9.89  )
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

From: Yangtao Li <frank@allwinnertech.com>

The A100 SoC has a DMA controller that supports 8 DMA channels
to and from various peripherals.

Add a device node for it.

Signed-off-by: Yangtao Li <frank@allwinnertech.com>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

Changes in v5:
 - New patch for v5, needed since the LEDC binding requires DMA
 - From previous submission: fixed off-by-one in dma-requests property

 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index 548539c93ab0..5453a3bb7d81 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -101,6 +101,18 @@ ccu: clock@3001000 {
 			#reset-cells = <1>;
 		};
 
+		dma: dma-controller@3002000 {
+			compatible = "allwinner,sun50i-a100-dma";
+			reg = <0x03002000 0x1000>;
+			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_DMA>, <&ccu CLK_MBUS_DMA>;
+			clock-names = "bus", "mbus";
+			resets = <&ccu RST_BUS_DMA>;
+			dma-channels = <8>;
+			dma-requests = <52>;
+			#dma-cells = <1>;
+		};
+
 		gic: interrupt-controller@3021000 {
 			compatible = "arm,gic-400";
 			reg = <0x03021000 0x1000>, <0x03022000 0x2000>,
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
