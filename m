Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D1DC54EBD
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Dec 2022 23:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8eUaCZjiVEUkRf6TUkxLErT4S3HgUBVb+/ko+jX0ZEs=; b=xg1AoUQFVrWY/g
	euv5M4uoVvdfqGR+BYPR3jghQfeq+7OR7pTwsIRhUY9VBpgxg+I0MXGMr2z56B3/8R0sqkzel/Lnk
	fz7Vf3J23ApNEdzvd0Ob7zIA9PCzehVFNusXaQ+3WDSVMAYp1SWswEk01FF9sADIwgS7AA4aKHiq+
	3RXc85AbIrDz9dBGV2CNx9WfVw5o5L9+aQXSXTfci4vS1xzHT8emHiUVaFsVlTMHR8PzXzvqIbS2T
	T15B+/UiqI4IO/vbARrIW7/08wovSV9ZJ837F+qWActSER/Shw7cpqz7+Tyo1OSTUTSJNnPmOZXf9
	5DsvVV45t+NTVsFBBenQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBlRt-00BY8e-S0; Sat, 31 Dec 2022 23:39:33 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBlRG-00BXeX-A2; Sat, 31 Dec 2022 23:38:56 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 75BC35C00B4;
	Sat, 31 Dec 2022 18:38:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sat, 31 Dec 2022 18:38:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1672529933; x=1672616333; bh=gO0pDskAio1DvM8u+gxQDveIj
	+6lZYIxAfXbYrPCczc=; b=NSrqHYhmalEkasPVTB2RaIkUgGe3o84TGtsUnyjs6
	Uma2TYOjegBBcz5BfdmLWrLI81+YlpHgVH07KApGLQlrYRlH+hI3URgr82bg+WW9
	BdDE1r6HJkG1O7ek/XwWNNC/E3hQ7TjXY87Dv2a+c7ctITWU7AQRWxAgQTn3y08s
	IpAq+ByYEzshw2cqI8UPFFx2BIp+mVLbk/2fBckjYc/NWQHnGWdScsDkP7WGGTeu
	KhuSacOXMPunk1dAZlAIrk6UciEwqX58tPtxShqfZp1TuK+XrshqhUX5dyyC+nsa
	oJ+Y7on46BKII0GJ81lgXjEKvubMwh+Jukt88g1TeDcMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1672529933; x=1672616333; bh=gO0pDskAio1DvM8u+gxQDveIj+6lZYIxAfX
	bYrPCczc=; b=Z2fOBbGSRNGOFKCPKBZRIRmEZCfMe4TSXvRWWpWjsgv2zZuKycN
	AH+JtWs1I80A6f0vhpmhHOIwoQDEduCBuwt/fc7K75hJrkiURDnXuwYScy0MIqWZ
	ChnZgMcgTAmGOJKksUn1YtC6WCJcgkJjVRDOnV6JtTs5yt3j70AZNUl02lGnf+UH
	YHxTjj1CG2vNeTEPQqmf0Z0qMBCmukIgZGBKsZIPiXEth0itfsCPWNKCF3VwaKQr
	Y0Gl8eFOo9ik7GLFDSa7EcXenhfqdYeYqk34oIhffS3EALdD+DQKqFRQZs+7kKUr
	3XfpuEiZEv/sWYhqovvxSZLCCiSTWR/uhaw==
X-ME-Sender: <xms:DciwY0xv27cd_NvoBMvAGWMeCQPgqhCf7qockJ2486WcOnfQIXBChg>
    <xme:DciwY4THcjgNosT92k2ydbhhvUsyoiBPInJ1P0SVzrEgUnudUy-vigFbQnpeIg_lp
    WBvNRRfzGUc5IjjgA>
X-ME-Received: <xmr:DciwY2XjL4Vntc2a0u4VhXF6nhb9-MfMziplbDevWVHgTyP-V3290idaX9-ILM-WNCuN2ImcT8ysb_bOmNrd67010hsM0gNSLbdk9i9VbBWSCw1-XtNEu_i4SyKhK1bYRM74ww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieelgddugecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgvlhcu
    jfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtffrrg
    htthgvrhhnpeekheffteehtdetfffgfeetteejvdefleeuvedufffguedtjedvheelvddv
    fffhveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdr
    ohhrgh
X-ME-Proxy: <xmx:DciwYyj8rze4SAJFGHhrJq4DMyRW_zE0cn8LNiqme3wrFg7ftkMZNA>
    <xmx:DciwY2ARnjMdP2CkgT-iDQauNamIPZV2ptAdl_HTK-RhqYgqbxFaew>
    <xmx:DciwYzJCUMPybuoBpG8auXfyK4HA3AJuvWXOWwIyo_QSsjMn1ZQqiQ>
    <xmx:DciwYyzQ_my4wNp7y7QSichv-j36ggbvNexKXULtmHNGgF1KZWON5w>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 Dec 2022 18:38:52 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Andre Przywara <andre.przywara@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor@kernel.org>,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH v4 00/12] riscv: Allwinner D1/D1s platform support
Date: Sat, 31 Dec 2022 17:38:39 -0600
Message-Id: <20221231233851.24923-1-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221231_153854_485030_8EC54F06 
X-CRM114-Status: GOOD (  18.44  )
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

This series adds the Kconfig/defconfig plumbing and devicetrees for a
range of Allwinner D1 and D1s-based boards. Many features are already
enabled, including USB, Ethernet, and WiFi.

The devicetrees use bindings from the following series which have not
yet been merged to linux-next:
 - In-package LDO regulators:
   https://lore.kernel.org/lkml/20221208084127.17443-1-samuel@sholland.org/
 - Ethernet MAC binding fix (not a new issue with D1):
   https://lore.kernel.org/lkml/20221231220546.1188-1-samuel@sholland.org/

The only remaining DT validation issue is that gpio-fan is missing a
YAML conversion, although one is on the list here (v2):
https://lore.kernel.org/lkml/20221217210423.836948-1-clabbe@baylibre.com/

$ make ARCH=riscv CROSS_COMPILE=riscv64-linux-musl- dtbs_check
  SYNC    include/config/auto.conf.cmd
  LINT    Documentation/devicetree/bindings
  CHKDT   Documentation/devicetree/bindings/processed-schema.json
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
  DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-clockworkpi-v3.14.dtb
  DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dtb
  DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dtb
  DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dtb
  DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dtb
  DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dtb
  DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dtb
  DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dtb
  DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dtb
  DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dtb
arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dtb:0:0: /fan: failed to match any schema with compatible: ['gpio-fan']

Note that validation requires dt-schema v2022.12 or newer.

I thoroughly tested earlier versions of this series (DMIC, Ethernet,
LEDs, MMC, PMIC, touch, and USB, where available) on several boards.
v4 has only trivial changes, and I boot-tested it on sun20i-d1-nezha.

This series is pretty much just waiting on the regulator binding to
land. I do not expect to send another version. For the rest of the
hardware blocks, DT additions will be based on top of this series.

Changes in v4:
 - Rebase on v6.2-rc1 + soc2arch-immutable
 - Drop the now-redundant 'select SIFIVE_PLIC'

Changes in v3:
 - Drop dummy DCXO clock-frequency property
 - Decrease the PLIC's riscv,ndev property to 175
 - Fix `make W=1 dtbs` warnings (unnecessary #address/#size-cells)
 - Drop mmc aliases
 - Change LED_FUNCTION_BACKLIGHT to LED_FUNCTION_STATUS (the backlight
   regulator is disconnected by default, so this is a standalone LED)
 - Fix `make W=1 dtbs` warnings (missing reg properties)
 - ARCH_SUNXI depends on MMU && !XIP_KERNEL

Changes in v2:
 - Add MangoPi MQ (non-Pro) board
 - Split into separate files for sharing with D1s/R528/T113
 - Use SOC_PERIPHERAL_IRQ macro for interrupts
 - Rename osc24M to dcxo and move the frequency to the board DTs
 - Drop analog LDOs due to the missing binding
 - Correct tcon_top DSI clock reference
 - Add DMIC, DSI controller, and DPHY (bindings are in linux-next)
 - Add CPU OPP table
 - Common regulators moved to MangoPi MQ patch, removed analog LDOs
 - Removed LRADC (depends on analog LDOs)
 - Added XR829 host-wake interrupt
 - Added DMIC sound card to Lichee RV dock and Lichee RV 86 Panel
 - Removed LRADC (depends on analog LDOs)
 - Added LED (GPIO shared between onboard LED and backlight regulator)
 - Added PMIC GPIO controller node (binding merged for 6.2)
 - Sort Kconfig as if we had done s/SOC_/ARCH_/ for future-proofing

Samuel Holland (12):
  MAINTAINERS: Match the sun20i family of Allwinner SoCs
  dt-bindings: vendor-prefixes: Add Allwinner D1/D1s board vendors
  dt-bindings: riscv: Add Allwinner D1/D1s board compatibles
  riscv: dts: allwinner: Add the D1/D1s SoC devicetree
  riscv: dts: allwinner: Add MangoPi MQ devicetree
  riscv: dts: allwinner: Add Allwinner D1 Nezha devicetree
  riscv: dts: allwinner: Add Sipeed Lichee RV devicetrees
  riscv: dts: allwinner: Add MangoPi MQ Pro devicetree
  riscv: dts: allwinner: Add Dongshan Nezha STU devicetree
  riscv: dts: allwinner: Add ClockworkPi and DevTerm devicetrees
  riscv: Add the Allwinner SoC family Kconfig option
  riscv: defconfig: Enable the Allwinner D1 platform and drivers

 .../devicetree/bindings/riscv/sunxi.yaml      |  69 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   4 +
 MAINTAINERS                                   |   2 +-
 arch/riscv/Kconfig.socs                       |   9 +
 arch/riscv/boot/dts/Makefile                  |   1 +
 arch/riscv/boot/dts/allwinner/Makefile        |  11 +
 .../allwinner/sun20i-common-regulators.dtsi   |  35 +
 .../allwinner/sun20i-d1-clockworkpi-v3.14.dts | 252 ++++++
 .../dts/allwinner/sun20i-d1-devterm-v3.14.dts |  36 +
 .../sun20i-d1-dongshan-nezha-stu.dts          | 117 +++
 .../sun20i-d1-lichee-rv-86-panel-480p.dts     |  29 +
 .../sun20i-d1-lichee-rv-86-panel-720p.dts     |  10 +
 .../sun20i-d1-lichee-rv-86-panel.dtsi         | 119 +++
 .../allwinner/sun20i-d1-lichee-rv-dock.dts    |  97 ++
 .../dts/allwinner/sun20i-d1-lichee-rv.dts     |  87 ++
 .../allwinner/sun20i-d1-mangopi-mq-pro.dts    | 142 +++
 .../boot/dts/allwinner/sun20i-d1-nezha.dts    | 166 ++++
 arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi  |  66 ++
 .../dts/allwinner/sun20i-d1s-mangopi-mq.dts   | 134 +++
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi |  76 ++
 .../boot/dts/allwinner/sunxi-d1-t113.dtsi     |  15 +
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 837 ++++++++++++++++++
 arch/riscv/configs/defconfig                  |  22 +-
 23 files changed, 2334 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/riscv/sunxi.yaml
 create mode 100644 arch/riscv/boot/dts/allwinner/Makefile
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-common-regulators.dtsi
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-clockworkpi-v3.14.dts
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dts
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dts
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dts
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel.dtsi
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dts
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dts
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
 create mode 100644 arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
 create mode 100644 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi

-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
