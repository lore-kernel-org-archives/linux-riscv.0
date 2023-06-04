Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73C5C77B73
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jun 2023 18:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bHL0XHDaP9ohRt4GR4f9pyz8Ipbef+JdL7zm02ApQFk=; b=Coq/mRElYvyWsS
	XJ9sATLoJ4FgOXRgv5RH1I7+QZHb0XDSw2Boab8qQbeJld8PWFZV07brwlSjixt+/25p46pzv9wkF
	bkjCCOJWWpEwUHxtIbiz/p7iVq1Dtcj4U+2SRZSZgr+sbZplN2yYHepHoRFTZreUBRSyasWbUbcbw
	ePCxjEdSDxv3Sb98wFQPwsWTfd7sVq5CJ7ecbIWrZ9hC8pFX9iaDG4R4KypKhCHOnc2u13k7wJEoq
	6QWEPopcVjqFbEn24vUNw+O2GldFWga91dWDbHI9H3wNR2QBR0VXMitqpMV56kfDO9T4O+J4DGYy5
	6jhAL3Zyrj8zIPoYDhAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5sru-00CnjG-2v;
	Sun, 04 Jun 2023 18:54:22 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5srr-00CnhT-0l;
	Sun, 04 Jun 2023 18:54:20 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-30e407daab5so468281f8f.0;
        Sun, 04 Jun 2023 11:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685904856; x=1688496856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VJAnB3wQ7FughqK6LyFwMtJAGYslbkQgDXV0PukOLCU=;
        b=EgzyQTrWj7L7nc4HbbBrWc0/LVWQucNLLiAwomp7bWUNMM+oS/yk4bE6+Avc9WS49x
         aGbNZrxVxFL7aKpwZetTHFXq/R7q/UQa7rkfgDG09UNazrXKBxx7BMZ6tm0FrIS0fSWh
         mDQfKtmojwJmsXEK1EZRrWtDlgadDkEIrxcZMNdlb/U3WAKEKf5U9ugU1bvppA+Okso+
         lHKbigH4XJTo2CoRkaloxmCMqVUx5CEIYysWejnUaNc7kM73PEDqGDyey61jQHHknFN2
         Co2YxtihUNmTVuAkjCuAMQwNFDW1oH2aXjZue9P2n6aNmpe1nbIbZwspYdss3RhPJYLN
         hZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685904856; x=1688496856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VJAnB3wQ7FughqK6LyFwMtJAGYslbkQgDXV0PukOLCU=;
        b=Jhiiha0JWo5Cb6uOM73Q4njjzQpzO+k8kDhR+uAa7SVsZP9/P3yil/SM2xIfaldS/O
         HYbIgc26iMYBpKCBc8mujwYAW/XK7z6NMdJAFx+dJRCmcqsYoVopJmPumyCkuHBI1mMP
         EpTY1LqnhR1UGNqugSuHV4QJQ4ZObx+xwFBObGylgbePLVxeTAI6TumLV62T90QtJsui
         nN8mI5/xE5+4xV7ryh4i1tZvfv6NrsVCb/VlNyTxkhXHjjKvaevT4bDJfMHR8WZR9i+G
         mABwFxzLI/FdIrfD3fpZ5RQLSvqkB1J/BZLiU1Y1kbMuLZ/BUWUbIqHXVhwO5NnUPWUo
         VBUg==
X-Gm-Message-State: AC+VfDx1/4zVCaO3dJLDdXO/39AhMCVHJquDgEkorsPPRetkDS9jZLRC
	GAJdq6F13ZADfJWPJ2yr8oc=
X-Google-Smtp-Source: ACHHUZ4sY3o9cbVrBFJd6vd/C/mZ9S9DqzSPS+JpMykxOlZJwiAp6wAppUkUK6bHzzhccyQC4qDjwA==
X-Received: by 2002:a5d:468d:0:b0:307:9194:9a94 with SMTP id u13-20020a5d468d000000b0030791949a94mr4923534wrq.17.1685904855997;
        Sun, 04 Jun 2023 11:54:15 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id l8-20020a5d4108000000b00304adbeeabbsm7636433wrp.99.2023.06.04.11.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 11:54:15 -0700 (PDT)
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
	Ulf Hansson <ulf.hansson@linaro.org>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	William Breathitt Gray <william.gray@linaro.org>,
	Haibo Chen <haibo.chen@nxp.com>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 0/3] Add support for Allwinner GPADC on D1/T113s/R329/T507 SoCs
Date: Sun,  4 Jun 2023 21:53:13 +0300
Message-Id: <20230604185336.1943889-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_115419_280412_710CF041 
X-CRM114-Status: GOOD (  11.88  )
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

 .../iio/adc/allwinner,sun20i-d1-gpadc.yaml    |  90 ++++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  10 +
 drivers/iio/adc/Kconfig                       |  10 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/sun20i-gpadc-iio.c            | 296 ++++++++++++++++++
 5 files changed, 407 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
 create mode 100644 drivers/iio/adc/sun20i-gpadc-iio.c

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
