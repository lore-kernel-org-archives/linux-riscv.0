Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5028CC3ABDD
	for <linux-riscv@archiver.kernel.org>; Mon, 19 May 2025 12:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GfuIBF/gcN8jcDBsIgYGEbnGFjUjwCdcDmz1khOHUGU=; b=JuQht5uGoCZFEU
	oC6PVmb6N7afvoqRAD2Ew1muQgm11F8WyOqdMy10RyBtIqNKEmgvb4YTWc57geg0DeOdtn5DmLoIP
	8CV4W4siL5UKiMb81guQtlD+QUtt7OhUacG/MtMaACLVV3qLJiYJnGmOFw63/eemdttUfyXqHgF97
	6nkK2DrzBMuwoaE0rzFOVVuIuUu4bEIaV4FSlF8D+tpCCcdxoaf3e65ZBNUi8M/VyGc7ymfXaEs+2
	H7srOFuX/aXizXGaiNHQucyiGIYl9PWIaLZcDurSGymyzPXOMH6iM0SS+hes4eTi6yYRteIT7QwJR
	Ckqkyxx3pxzMfy1xWzgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzSO-000000097k2-1L03;
	Mon, 19 May 2025 12:19:00 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzOt-000000096yg-3cG8
	for linux-riscv@lists.infradead.org;
	Mon, 19 May 2025 12:15:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=zix02Rf2UN8dkt
	KxUMJpGTMpr0tknfsIvIDaFLjGkBU=; b=OfS3hmmpN6YsEPr8bsgpBis3TabWtE
	Xz/ybh6VGsKWv91v0TKP/cHNcNALo1ydU97CoAEkgWD563P0wjx5riAOZdaVmAcm
	BicbYuqL0M4G8fM6KBh9oBbNydZAJocW8ZlBFHG5UlqDj1zrR4ivKoYWb3jDhz2m
	lX0pKomIaHk6Wm+jjzPW+gV2D4g9y/bspoXU4NHwZwHKVmaJrXXkzVcbtn2Rmzg/
	NSbp3LvZSyloZgdID/TcuIMkZZ5VWLpYydIEtmWR8A96yl5Hv/ieUlW1rQKhp7NW
	Ak2OhjdYeLAQ+IF762FNdG2omfeAA4c9A5kTi5hr2F/A+j4VuD7ppGSg==
Received: (qmail 2474961 invoked from network); 19 May 2025 14:15:21 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 14:15:21 +0200
X-UD-Smtp-Session: l3s3148p1@y0H0FXw1CJpZz6+V
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	loongarch@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	WANG Xuerui <kernel@xen0n.name>
Subject: [PATCH 0/7] archs: use proper node names for GPIO based I2C busses
Date: Mon, 19 May 2025 14:15:00 +0200
Message-ID: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_051524_175753_6853C502 
X-CRM114-Status: GOOD (  10.32  )
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

A lot of boards across various archs have a superfluous '-' in their
node name for GPIO based I2C busses. 'dtbs_check' complains, so fix
them.

Based on linux-next as of 20250516. Build bots are happy. ARM patches
depend on another cleanup series[1], the rest has no dependencies. I
suggest that patches go via their subsystem trees.

Tested on Calao USB boards using AT91 chipsets and a Renesas Lager board
using R-Car H2.

[1] "[PATCH 0/4] ARM: dts: use recent scl/sda gpio bindings"
    https://lore.kernel.org/r/20250519112107.2980-1-wsa+renesas@sang-engineering.com

Wolfram Sang (7):
  arm64: dts: exynos: use proper node names for GPIO based I2C busses
  arm64: dts: mediatek: use proper node names for GPIO based I2C busses
  ARM: dts: microchip: use proper node names for GPIO based I2C busses
  ARM: dts: samsung: use proper node names for GPIO based I2C busses
  ARM: dts: stm32: use proper node names for GPIO based I2C busses
  LoongArch: dts: use proper node names for GPIO based I2C busses
  riscv: dts: allwinner: use proper node names for GPIO based I2C busses

 arch/arm/boot/dts/microchip/at91-foxg20.dts      |  2 +-
 arch/arm/boot/dts/microchip/at91-qil_a9260.dts   |  2 +-
 arch/arm/boot/dts/microchip/at91-sam9_l9260.dts  |  2 +-
 arch/arm/boot/dts/microchip/at91rm9200.dtsi      |  2 +-
 arch/arm/boot/dts/microchip/at91sam9260.dtsi     |  2 +-
 arch/arm/boot/dts/microchip/at91sam9260ek.dts    |  2 +-
 arch/arm/boot/dts/microchip/at91sam9261.dtsi     |  2 +-
 arch/arm/boot/dts/microchip/at91sam9263.dtsi     |  2 +-
 arch/arm/boot/dts/microchip/at91sam9263ek.dts    |  2 +-
 .../boot/dts/microchip/at91sam9g20ek_common.dtsi |  2 +-
 arch/arm/boot/dts/microchip/at91sam9g45.dtsi     |  2 +-
 arch/arm/boot/dts/microchip/at91sam9n12.dtsi     |  2 +-
 arch/arm/boot/dts/microchip/at91sam9rl.dtsi      |  4 ++--
 arch/arm/boot/dts/microchip/at91sam9rlek.dts     |  4 ++--
 arch/arm/boot/dts/microchip/at91sam9x5.dtsi      |  6 +++---
 arch/arm/boot/dts/microchip/ethernut5.dts        |  2 +-
 arch/arm/boot/dts/microchip/evk-pro3.dts         |  2 +-
 arch/arm/boot/dts/microchip/mpa1600.dts          |  2 +-
 arch/arm/boot/dts/microchip/tny_a9263.dts        |  2 +-
 .../arm/boot/dts/microchip/usb_a9260_common.dtsi |  2 +-
 arch/arm/boot/dts/microchip/usb_a9263.dts        |  2 +-
 arch/arm/boot/dts/microchip/usb_a9g20_lpw.dts    |  2 +-
 arch/arm/boot/dts/samsung/exynos3250-monk.dts    |  2 +-
 arch/arm/boot/dts/samsung/exynos3250-rinato.dts  |  2 +-
 arch/arm/boot/dts/samsung/exynos4210-i9100.dts   |  6 +++---
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi   | 10 +++++-----
 .../boot/dts/samsung/exynos4412-galaxy-s3.dtsi   |  4 ++--
 arch/arm/boot/dts/samsung/exynos4412-midas.dtsi  |  6 +++---
 arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi |  8 ++++----
 arch/arm/boot/dts/samsung/s5pv210-aries.dtsi     | 16 ++++++++--------
 arch/arm/boot/dts/samsung/s5pv210-galaxys.dts    |  2 +-
 .../boot/dts/st/ste-ux500-samsung-codina-tmo.dts |  8 ++++----
 .../arm/boot/dts/st/ste-ux500-samsung-codina.dts |  8 ++++----
 .../arm/boot/dts/st/ste-ux500-samsung-gavini.dts | 12 ++++++------
 .../arm/boot/dts/st/ste-ux500-samsung-golden.dts |  8 ++++----
 .../arm/boot/dts/st/ste-ux500-samsung-janice.dts | 16 ++++++++--------
 arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts  |  8 ++++----
 .../arm/boot/dts/st/ste-ux500-samsung-skomer.dts |  8 ++++----
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi   |  2 +-
 .../dts/mediatek/mt7986a-bananapi-bpi-r3.dts     |  4 ++--
 arch/loongarch/boot/dts/loongson-2k1000.dtsi     |  4 ++--
 .../dts/allwinner/sun20i-d1-devterm-v3.14.dts    |  2 +-
 42 files changed, 94 insertions(+), 94 deletions(-)

-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
