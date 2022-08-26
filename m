Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C30CECAAD2
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Aug 2022 05:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pagDLVPO/tmrEMX+2ntZtXFBpElsrVwYXJr9TdQ6GVg=; b=EDLPi4gd2rNAgc
	R0lt1kv9542e9DJquft+01QLIbXkgjQZJX5yZL/d2sU7yP9CGEJDSMtqRO3v5cTLmuSg2NXRk+dlZ
	fMiuawcg40ic1h+4I27r5ux+RLvhrPmVsMwByn7vvvgOWogJ2uPD5JIQVJfKWa0SXwqrwKhFRIBcn
	mfDxa3HOsG4kRUmrcUTeCd8MCFmwD5ISlL9JngFj3E5tgE4n3pZdhKeZo/lGnl/rfIP/PDzOA0xiJ
	PKh8bYX3tVcThgdQWKfvgD8l8wgFXBX9FHgKgbHHcopmmiPK3X5NSARSCr7P/X/MhTxvAajvUnSsB
	3wfQLsW+yWsK++p1LPJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRRbY-00Dg4S-MC; Fri, 26 Aug 2022 05:10:04 +0000
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRRbK-00DfiA-Oo; Fri, 26 Aug 2022 05:09:52 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 208683200A8A;
	Fri, 26 Aug 2022 01:09:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 26 Aug 2022 01:09:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1661490584; x=1661576984; bh=NEvgS4Y1TGOoJYMfZcyVI7VSq
	u0kF4KmZH4aP8oll78=; b=f8802ZT0NXEE+nsRnbik4K9cWZcHki4hnSdjJZfGn
	PBgM6nwfWv691zRaAK77mn+43zu0xFXjMGA0i3QLNI3hpTnweYHI0Kw4LmqWLZfC
	QUgZBj80ayu+BYuBKHbbz1em3Yj+qNSeTIb8XcLfQ0qcoUGAn3timDgkhC6OpMXI
	OYBSh47xGcrHvLt06VsQILSSNKkRNuqMlB2/iRZdPmka+6LYrqlx3u1bFJE1nNFZ
	+bxcvtcXdl2sBqgR/LU0d5RAiBSquFv4mUhWh34CETvoJRNPNCqSw23rOj4DM70h
	iU4Zro3OgouG3TE6fLRRwmBsixTWucDiE9o6YYzVhbZLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1661490584; x=1661576984; bh=NEvgS4Y1TGOoJYMfZcyVI7VSqu0kF4KmZH4
	aP8oll78=; b=YNSmRSML2ldp/e9zXzgdBhzVPrRhlFXUacx2mCIlkJAreIK24FV
	hS9ey9XNCPCMjJC5aYYH8DvK66X2S7p8g2iID9nS0fJ6ChkEIylObpCwlYSiWgsd
	TKtD4D3M0K2enCV19wFxQHgghdj7PAOi3VP55RfZfBTCRzIQXCfI6c0sjbuTNa0X
	BvJuPQOxtk8s11tYWyQCs/Bwkd7EtNBloFPatWNNLlMx27pi70TB8sZ3K74fDy0D
	rEGoQ7MmM5MOnebfjSSGjYFmPRTOetk8S+HTTtggi+OUQtgq1spszhCnGz8pOX/O
	1a1LcAj4f3nXBlH4R0Jv52wp3S7UqhemBsw==
X-ME-Sender: <xms:mFUIY8MBMQnlzLkG6OGsoaFw6qLEeQjNBa6mjRpimGauLfmPn_hF3w>
    <xme:mFUIYy8OLfPPugBExTwKIuB30LAkBZGMfJ5r7zOZTHLFqjHrbI5l29R0ywSsjiDCi
    Lp3OFSf020YfI49BQ>
X-ME-Received: <xmr:mFUIYzScodFYc7oMlO-7JoltIBvDkLmNZDeZBE-3O91LmxLDFUuK43hW35flrPHpNDIwsFVFwkLryOefjmibzGemc7KW9bTV8E1Ei95YRiFAaXoFykHok1YwEpS-W_z8m7Ev1Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejgedgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepkeehffethedtteffgfefteetjedvfeelueevudffgfeutdejvdehledv
    vdffhfevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
    rdhorhhg
X-ME-Proxy: <xmx:mFUIY0um-dA0-TUql_kJQgsSGpbfeo_bURQjsilFxtJ6gEt1c8voyw>
    <xmx:mFUIY0f0GtmvgtYxBLAxh6kjP-2RZA4fH_RZMcz-SRfqjMButhNp8A>
    <xmx:mFUIY41oTOzbWnPgFdIe_Yt_p6OvPe7HYVMyelx76C1zaGJYdGl11Q>
    <xmx:mFUIY1UmUzaDG3fFjkAm4cvTI90F4Qdt5xPqeHdmMpp5v5ba7RNlew>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Aug 2022 01:09:43 -0400 (EDT)
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
Subject: [PATCH v5 0/6] leds: Allwinner A100 LED controller support
Date: Fri, 26 Aug 2022 00:09:36 -0500
Message-Id: <20220826050942.20067-1-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_220951_260288_313F7887 
X-CRM114-Status: GOOD (  15.09  )
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

This series adds bindings and a driver for the RGB LED controller found
in some Allwinner SoCs, starting with A100. The hardware in the R329 and
D1 SoCs appears to be identical.

Patch 3 is included because the LED controller binding requires the DMA
properties. That patch was sent previously[1], but never got merged.

Patches 5-6 depend on the D1 devicetree series[2], but the rest of this
series can be merged without them.

This driver was tested on the D1 Nezha board.

[1]: https://lore.kernel.org/linux-arm-kernel/20201110040553.1381-7-frank@allwinnertech.com/
[2]: https://lore.kernel.org/linux-riscv/20220815050815.22340-1-samuel@sholland.org/

Changes in v5:
 - A100 contains the original implementation, so use that as the base
   compatible string, and rename the binding to match
 - Add "unevaluatedProperties: false" to the child multi-led binding
 - Rename the driver R329 -> A100, since that is the actual original
   implementation

Changes in v4:
 - Use "default" instead of "maxItems" for timing properties
 - Depend on LEDS_CLASS_MULTICOLOR

Changes in v3:
 - Removed quotes from enumeration values
 - Added vendor prefix to timing/format properties
 - Renamed "format" property to "pixel-format" for clarity
 - Dropped "vled-supply" as it is unrelated to the controller hardware
 - Added vendor prefix to timing/format properties
 - Renamed "format" property to "pixel-format" for clarity
 - Dropped "vled-supply" as it is unrelated to the controller hardware
 - Changed "writesl" to "iowrite32_rep" so the driver builds on hppa

Changes in v2:
 - Fixed typo leading to duplicate t1h-ns property
 - Removed "items" layer in definition of dmas/dma-names
 - Replaced uint32 type reference with maxItems in timing properties
 - Renamed from sunxi-ledc to sun50i-r329-ledc
 - Added missing "static" to functions/globals as reported by 0day bot

Samuel Holland (5):
  dt-bindings: leds: Add Allwinner A100 LED controller
  leds: sun50i-a100: New driver for the A100 LED controller
  arm64: dts: allwinner: a100: Add LED controller node
  riscv: dts: allwinner: d1: Add LED controller node
  riscv: dts: allwinner: d1: Add RGB LEDs to boards

Yangtao Li (1):
  arm64: dts: allwinner: a100: Add device node for DMA controller

 .../leds/allwinner,sun50i-a100-ledc.yaml      | 139 +++++
 .../arm64/boot/dts/allwinner/sun50i-a100.dtsi |  26 +
 .../allwinner/sun20i-d1-lichee-rv-dock.dts    |  12 +
 .../boot/dts/allwinner/sun20i-d1-nezha.dts    |  13 +
 arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi  |  21 +
 drivers/leds/Kconfig                          |   9 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-sun50i-a100.c               | 554 ++++++++++++++++++
 8 files changed, 775 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/allwinner,sun50i-a100-ledc.yaml
 create mode 100644 drivers/leds/leds-sun50i-a100.c

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
