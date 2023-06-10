Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE9EC7EE2F
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 12:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1IDpTzrMcC4OFyAlaiV/5HCqbfOCG/IOvNo/IFIFzG0=; b=ylM2Dplp23JY5N
	rjK5SsdcoD4Z15iGlEh/xEl6QTTw0VcB4HhVUMy/4+c+gUlJjW5zpoBVVHdNu1Un/5BhGvaezwAZE
	sJoXIeb2WfQ9T3UueP1Csf/spCKb3IXseUuz4uzZBgS6rlKvFsRj2+I4LmkJJa/Az2btNSpM6LwzQ
	dsjpC2ay4i7WYD93mwajXnENLNB3pLND5cmBPj4fUMHC/rAxpD4fSDgYg9AX6zLO1uUXnMavnxioA
	6NGQTWcqPWc9IPM9bq27UQ7xqUmZ33FsY4nAUMogQojpQgysJnRpbBi/ZmQ5O6mE8YxtVpfQxN2fm
	tA22d35qNvLmIoJ/CS1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7xjD-00G5dl-2i;
	Sat, 10 Jun 2023 12:29:59 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7xjA-00G5d6-2p;
	Sat, 10 Jun 2023 12:29:58 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f739ec88b2so19792055e9.1;
        Sat, 10 Jun 2023 05:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686400194; x=1688992194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FK/BTEpi1h8QPadFMEPE8CQ/83P2AbocLoI9C/+A1BY=;
        b=aJ3Eu++PfSnISHhhC4Q9T0cjluUXnOgJlp+cWSALsVAq71T+rU638SgsRY2kiQEj9d
         f0TAdOKcCsLDrd4Rnd5sOT4a47vnhgRFCjJHDrcJQIP1QBb6XPTgg/ORktEKw7iSDB4K
         4/0Ra9AOFtPYJ900Czi/VUG9qsUDSRvGX6PeNqbcrzmodR14eQAx1SOkRTIPTfe+podw
         +njDm/lqk1AKUMMc40PrK5OaWFTo8+QxyX7Sq05SDDJqqbax/PUaN+0K18IIejnSG5jA
         OdLXFzGP78gBuVVeM40uhP4PyWlaFet1+OHmZ8/ynTj4ysc4z4zexGyPmfwA7jGg42RS
         vC+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686400194; x=1688992194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FK/BTEpi1h8QPadFMEPE8CQ/83P2AbocLoI9C/+A1BY=;
        b=eRErwa1Ov+WBSnkbMIyiZmnIRjq02HSKe1ehqkVqos4xc9OoXislv8Jt7Bw4X+YtpP
         C9kZvldveKoi0GAerLe0DD1ANVvtbtmviXQkhwRSj4M6SdTuog9Iz2CxqXvKpC5RKBfV
         CluEl5LFE6fTCexZme2K2gM/m08ID4nc3CtR+MZ1xcwCnHdcC0FH4OtIdUwZMwEActLs
         pAgEP4T5Fd55yoxKEF5uNk7wHjz2cCXuY64DnuFaaZXajWOQY4Gv68dDmyBk4y/DMOFB
         N9z0sCovF4X2rNGHQdMG5KZKYGwCJ/PBMEqZgSmLtLH3vst/NJZn1Kh7Y/tS/YmxYw22
         eYcw==
X-Gm-Message-State: AC+VfDw4WWgtwOiA8/PV4BtLSNKr/hdrXdPLFUt3IVA6n/CWGq95OPMC
	0s2uu074CLDAHBGEZbB4xAE=
X-Google-Smtp-Source: ACHHUZ6a32iAuvgt0yTJfQcHaQvVHXnVjIKQ6bUuHQx1QXzyI+6JpnqGHo3g6/SThfeC6Chhpu7lxg==
X-Received: by 2002:a7b:c4c8:0:b0:3f4:239c:f19 with SMTP id g8-20020a7bc4c8000000b003f4239c0f19mr2492715wmk.36.1686400193609;
        Sat, 10 Jun 2023 05:29:53 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id v26-20020a1cf71a000000b003f80e81705asm2310487wmh.45.2023.06.10.05.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 05:29:53 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-iio@vger.kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	William Breathitt Gray <william.gray@linaro.org>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Haibo Chen <haibo.chen@nxp.com>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 0/3] Add support for Allwinner GPADC on D1/T113s/R329/T507 SoCs
Date: Sat, 10 Jun 2023 15:29:06 +0300
Message-Id: <20230610122934.953106-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_052956_937874_DD042798 
X-CRM114-Status: GOOD (  11.76  )
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

This series adds support for general purpose ADC (GPADC) on new
Allwinner's SoCs, such as D1, T113s, T507 and R329. The implemented driver
provides basic functionality for getting ADC channels data.

Change History:
v4:
- Fixed DT bindings warnings
- Used GENMASK to clear the irq register
- Minor formatting fixes

v3:
- Added DT bindings dual license, fixed property order and example formatting
- Added explanations comments for timeout and mutex
- Dropped unnecessary regmap and used readl/writel instead
- Added error message about getting channel number
- Renamed labels and variables to make them self-explanatory

v2:
- Added lastch flag to avoid addition work for already selected channel
- Added reset assertion on module remove
- Added dynamic channel allocation and dropped iio_chan_spec arrays
- Changed IIO_CHAN_INFO_SCALE type to FRACTIONAL_LOG2
- Dropped separate compatible strings and configs for T113s and R329
- Fixed includes
- Fixed Kconfig description
- Removed duplicate probe error messages
- Used FIELD_PREP for bit setup

v1:
- Initial version
Maxim Kiselev (3):
  iio: adc: Add Allwinner D1/T113s/R329/T507 SoCs GPADC
  dt-bindings: iio: adc: Add Allwinner D1/T113s/R329/T507 SoCs GPADC
  riscv: dts: allwinner: d1: Add GPADC node

 .../iio/adc/allwinner,sun20i-d1-gpadc.yaml    |  91 ++++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  10 +
 drivers/iio/adc/Kconfig                       |  10 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/sun20i-gpadc-iio.c            | 281 ++++++++++++++++++
 5 files changed, 393 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
 create mode 100644 drivers/iio/adc/sun20i-gpadc-iio.c

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
