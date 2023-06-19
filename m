Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4084BEB64DA
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 15:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sMIj7MRedu8czn2oZsUHvfaqe4aT5ISPuyKBvyKhj+Y=; b=rvnyeAhr0C7LCX
	PFjRcOUElKugoTKRcNF8csFFxOHVtwrI7IQCldOgQC/MoyxqRDZr2r8+3bgJLwafe91SeoVnDb1s3
	iQFLng0tp0ZDL6MkGtLVmmv16JCjmlrv2G3NrPewVcQ9xTOSXQsm4Ct/ovmzWyyPFbDRq4xzcFrJP
	1W3Aw//zWg6pm4QYuU0cak7/Cu3YwK8t9rRTtJQjktObrw6DytjP1tynW0Rfp9V5HtkP3V4xqOZch
	J/psIIpB9L/iDZGexfKRTi4SufuFD5kReeKW6La1K0f56FyGs8i+KPEVudNlFQZBhvNm7WHvp448X
	uFuMgHv2X05KKRF9n9KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBH27-008o1G-0i;
	Mon, 19 Jun 2023 15:43:11 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBH24-008nzR-1T;
	Mon, 19 Jun 2023 15:43:09 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f87592eccfso893789e87.2;
        Mon, 19 Jun 2023 08:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687189383; x=1689781383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ONxNNZw/qmdwlne5gEPTK3bLBdHTya93hQkUoKWnPqE=;
        b=QzFQD0kW5M7hiQP0BvScCgizwq82HavcztJnTml/MMDEMrA9ytHqYflCzsjgHLoBA7
         ro+hTf+n4XIV7mQz9+v8jVS3NAzHV+/pkvfpG+AuiWc39fiOwvxSVd1dJwVVqE83OggC
         sBlYxFgc2S0pgTfFhe01MLcf9FkfMdcKpCXxtf03TkWsiS3v6IR1ERBMjXJjd+zb0j/7
         0otLD1Eyh6wu90VrPmoGsAVCZ2P+7LCFexg3EYF6RqqoX4qWcE5sPv35JoxYmy47rvdk
         /6MsgPCeVmKMt2KI3Beju3sisLU9oEwamwt6pp1WoUQHb0w9mDEFhBlxaSogONGIJRWt
         YEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687189383; x=1689781383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ONxNNZw/qmdwlne5gEPTK3bLBdHTya93hQkUoKWnPqE=;
        b=Q+c53Mhe7Jji+NnTndJTZOIy2cccgZDafxOqBneyN+FZH3PL0ycPveguHz+QloXPOn
         cIlA+4+udOWOwqk4KwGDa+5fYEuL40/z5/xEfRXnH+yfcSeEcQbY/sussVCGE87W1SK6
         LOhE03yKIzQHJ8FJbiFY1Hgm/hEhoMP1JgLVxfD2aPBkmairiMprJwsh0SuCCE3CcID4
         ZBb+T029dWqG5IO00PtFe9/atBATlIUMSwN/06luGaC7/gBXWyVHAXWLD2MeANQe8QBg
         7iUPSI5SJc7L1S3HZ8752h8NEKacg1ueWrGE7OEmIopbvaYSDnbgT+17jkC2QAud72Ha
         PFUA==
X-Gm-Message-State: AC+VfDz/4H+ymILFoWh+xgMKJOxGbVD3w/ccb1CpkklaPawR3vkI4/Nw
	Ry7OzD5X1m1LAktq4pEo81U=
X-Google-Smtp-Source: ACHHUZ4yL4aD+qEJZ0h0+bGI3YNOliImTCvoONhBTFNNWCuE57QQWU4tZRBQX1lukt9ksOQnP13AQg==
X-Received: by 2002:a19:e04d:0:b0:4e8:4abf:f19d with SMTP id g13-20020a19e04d000000b004e84abff19dmr5744863lfj.15.1687189382656;
        Mon, 19 Jun 2023 08:43:02 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id f11-20020a19ae0b000000b004f85e53250bsm1207144lfc.191.2023.06.19.08.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 08:43:02 -0700 (PDT)
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
	Andre Przywara <andre.przywara@arm.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	ChiYuan Huang <cy_huang@richtek.com>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	Haibo Chen <haibo.chen@nxp.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	William Breathitt Gray <william.gray@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Quentin Schulz <quentin.schulz@free-electrons.com>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v8 0/4] Add support for Allwinner GPADC on D1/T113s/R329/T507 SoCs
Date: Mon, 19 Jun 2023 18:42:23 +0300
Message-Id: <20230619154252.3951913-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_084308_499791_C21DA75C 
X-CRM114-Status: GOOD (  13.72  )
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
v8:
- Added patch that changes Kconfig description for previous Allwinner GPADC
- Changed Kconfig description for this GPADC driver
- Fixed 'reg' range for gpadc node in 'sunxi-d1s-t113.dtsi'

v7:
- Fixed typo in DT bindings property

v6:
- Fixed DT bindings regexp for channel properties
- Dropped checking the max number of channels from the drivers code
  (This is redundant as we raly on DT bindings check)

v5:
- Fixed DT bindings properties for child nodes

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

Maksim Kiselev (4):
  iio: adc: Kconfig change description for Allwinner GPADC
  iio: adc: Add Allwinner D1/T113s/R329/T507 SoCs GPADC
  dt-bindings: iio: adc: Add Allwinner D1/T113s/R329/T507 SoCs GPADC
  riscv: dts: allwinner: d1: Add GPADC node

 .../iio/adc/allwinner,sun20i-d1-gpadc.yaml    |  91 ++++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  10 +
 drivers/iio/adc/Kconfig                       |  12 +-
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/sun20i-gpadc-iio.c            | 276 ++++++++++++++++++
 5 files changed, 389 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
 create mode 100644 drivers/iio/adc/sun20i-gpadc-iio.c

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
