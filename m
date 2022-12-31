Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 582D3C4332F
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Jan 2023 00:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WHLa0N7Xob9Ti2BJXfM+g8mBM1RN6qe3oXa3hoB3NLU=; b=Y23ZZbteeUQmmB
	28rQZLC1RSnmn1JpJ8Q1cI/vAyj4Gqg4f592tI5aqtxZ1po7Ki+LftGpFPVHOS+smyQeBYyJKz2TJ
	b6woe2irnodLnprbd4fWiDviJX5yi2FtW/cukPip8N7XmsQsi7cyC7AXS9ycNIQcSpn40NNwNWN8z
	Aii/lzzrf2lZRktuf70bnS6P6kpVlKOjfkbIj4HuYKu56xAlyX0McmvzeQvGil7/iy9JUdIY8UTgq
	cppucZAdmvF2i1ZGag2RKvudQpa4zdxD5+kWD9k7vD+BWMgxQQrSU9BByIqNWn/nZLWU3vXEylaQj
	yLx7h5TTYNxlx1+3bKtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBlwD-00Bo3R-Pi; Sun, 01 Jan 2023 00:10:53 +0000
Received: from new2-smtp.messagingengine.com ([66.111.4.224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBlhZ-00BftF-Bx; Sat, 31 Dec 2022 23:55:47 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id 953035816B4;
	Sat, 31 Dec 2022 18:55:43 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sat, 31 Dec 2022 18:55:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1672530943; x=1672538143; bh=pTEZggda+tOfZg7lY89KlH18L
	nud0xfDB+BCBVcDtdQ=; b=O4aYKMtL/Ol6TXmF28k8d7KPJVn7SUjFDUdKbNJUn
	nk4rrRU/320BwQ4em1PkAtkC25b3h3Ma0m7NpYKYdjhb5Mquzfb99aJsjgNZgSGT
	QyOWtqWcG0rtJPbiTXc9smTumrM6nz+nNudBeK9BUH3X+7arouBYGD7oPq+8tJhV
	pjMF2KJzV8D3awcFnDHeD1yWX+TGu9ZPMh+ufSjK/R7q8pRQq7ylDWfEoewiUzjz
	MfvUd3XTi8yjXRD0N37NcYXJ3AcaNJ0u3XLZr/zhea/oos8xovtNAC9owDFB05hW
	aDBqX99XDdWBKivAUKqn4rewHAY4ZFLAkBgMzq0RhNXvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1672530943; x=1672538143; bh=pTEZggda+tOfZg7lY89KlH18Lnud0xfDB+B
	CBVcDtdQ=; b=phuA8hr+iYwKNrjL3M8Gds61FdmsaXcHXpzYqb53MniGJChPcHZ
	VtfLBk4jOWDtIHjipMRSIWWnfg1Gq5gpiauV+Y+wlakQEATgL1KsqmFn++fJNEMa
	DfXUMoYyDEENbbiDvXsQr96WJXn4pzDRlS1c1oYdzLRbItqGLsF3cfByRp+HbFW/
	khbXSvOCbp/D0Ftjv/aoGIAw9yMX0CGmoD0EWyY7V9r7WlmgBPktRxzfNvMsPqEz
	pKg0QoPuKVvhMr0BjE8jscZIU8d5HNWE/mDfiYqzcfZfbjuE806zuiLmqYdsM8pX
	OrxQodpW94g96ehRgbokrlzs/47eH5i59Dw==
X-ME-Sender: <xms:_suwY2Mqr_vyArpSylsZ0_HlKHwlgjjTXqiUwsL_I1I_Loc15kCCcQ>
    <xme:_suwY08a5L74f2u5vJ7Pz2FUFGinei4WWRMmPSa_BaQBGtLR6P1zRJM5V-XpGibPu
    GFEAI5-MZXv0o9HMw>
X-ME-Received: <xmr:_suwY9SF9vD192w9uUlMdpN5RBObROhmAIHdlRoJX5LVLqzx5eLwPX9B3jvpuVKmFw9lGy2Bf3gjymwSCHtObJF-g2tQ6dnI9M9tDkZmxOyYZxZiNQCF7q95jA-0tnQjwdxa1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieelgddujecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgvlhcu
    jfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtffrrg
    htthgvrhhnpeekheffteehtdetfffgfeetteejvdefleeuvedufffguedtjedvheelvddv
    fffhveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdr
    ohhrgh
X-ME-Proxy: <xmx:_suwY2vfhpFx9hDkoWEOk897y9QtZ3LsLGFJjnpteH3PotbxL9H4aA>
    <xmx:_suwY-cGDyDpt4My5W1USFp1NNRqp2Pjpl1T4U0wVG9dDYohCpufhg>
    <xmx:_suwY60WdFaZVrdTQrPo1oTTzdW6yaWjgnrnic5LuBRoiAWAo2BXQg>
    <xmx:_8uwY89gCf25i-fPmgQAvrUUjiUHp5fJz6RaHv0lxuWz5m-J3dNHgA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 Dec 2022 18:55:41 -0500 (EST)
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
Subject: [RESEND PATCH v7 0/5] leds: Allwinner A100 LED controller support
Date: Sat, 31 Dec 2022 17:55:35 -0600
Message-Id: <20221231235541.13568-1-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221231_155545_836955_D967BAA8 
X-CRM114-Status: GOOD (  14.82  )
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

[Resending because it has been a couple of months since v7 with no LED
maintainer feedback, and LEDs now have an additional maintainer.]

This series adds bindings and a driver for the RGB LED controller found
in some Allwinner SoCs, starting with A100. The hardware in the R329 and
D1 SoCs appears to be identical.

Patches 4-5 depend on the D1 devicetree series[1], but the rest of this
series can/should be merged without them.

This driver was tested on the D1 Nezha board.

[1]: https://lore.kernel.org/lkml/20221231233851.24923-1-samuel@sholland.org/

Changes in v7:
 - Use DEFINE_SIMPLE_DEV_PM_OPS

Changes in v6:
 - Drop the A100 DMA controller DT node patch, which was merged via a
   different series

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

 .../leds/allwinner,sun50i-a100-ledc.yaml      | 139 +++++
 .../arm64/boot/dts/allwinner/sun50i-a100.dtsi |  14 +
 .../allwinner/sun20i-d1-lichee-rv-dock.dts    |  12 +
 .../boot/dts/allwinner/sun20i-d1-nezha.dts    |  13 +
 arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi  |   6 +
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  15 +
 drivers/leds/Kconfig                          |   9 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-sun50i-a100.c               | 555 ++++++++++++++++++
 9 files changed, 764 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/allwinner,sun50i-a100-ledc.yaml
 create mode 100644 drivers/leds/leds-sun50i-a100.c

-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
