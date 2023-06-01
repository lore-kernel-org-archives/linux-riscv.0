Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74680C77B7E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 22:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=81BzrAUoPDoyFm+5mt9oqoCjceMYEIVz0qorNArWkF4=; b=tzGQsHJePf8o2T
	V0gyBN+udki95WqqKzZTc3pfh1cRhXMVAo6H1ZCK4N6t4PBBh6Stq4IaI812jluV6uoLRJxnT4J7H
	SJtbG5IE4uMxDLTDKKzQPT5f4tNR5YCod0pqV21hYMeBlTNTZ0yxrMjrE+2pTGPjtefbI2rKzKJtN
	WsAemoqUJ49DvxPGD+wAvUjKbBw6I889LvIn63cP//gkPKWpJn45YqE72ZGjphhzwocEMBLINpXbm
	kJ1j1/qX9LVpSgW88AzJWUOkfun7pvAAH8L/tOr5Imi1Omz6uNgqLqq5LNduvuYgOzTtcJsaDiz4j
	p5kl5G0dQykvVzFyRf6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4qpW-0058OP-0A;
	Thu, 01 Jun 2023 22:31:38 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4qpR-0058NQ-2q;
	Thu, 01 Jun 2023 22:31:35 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f6ef9a928fso13746355e9.3;
        Thu, 01 Jun 2023 15:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685658691; x=1688250691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=osoH9NCUgVkUT2GWNEII1U4b/cNjTB8p6KRKoRqNDT8=;
        b=naj2UO5gI1HpInnq8r9brslsJi6aK6GHpQ+JlqqQEu8p5t/EllUoZ9IIo+UBfEVF2W
         tdBt9KF7gLnRoKqjeKOf272ogLec2lO9xM+U1BLL8Bv/8rDKrVUCLYz8GZVgmi3tWRjO
         vmDqslEbw6nIqWRTObo4r6hIabmWrkBhvA4+sLaE9y0rpwPqTLIapgQhwpMaMEyGFxxh
         t40jUKAuLCSIu8szr30DhvYUJVMKl2P26TP8NgE2uyybCroHZr2YkUcz45aZhRzkURD9
         7LCRmm9IYb17YxdsCzs9EcSwzns8mxTK5etW+friu5lsxH1+9QCgnvJw6sM5ldfk0koe
         gQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685658691; x=1688250691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=osoH9NCUgVkUT2GWNEII1U4b/cNjTB8p6KRKoRqNDT8=;
        b=SZ5lbCFs88A3Es7PWyth1gHaluU/NxnmIX4Oou6fePcojFlb8VFltG5apUm3eNzWGF
         8npP222cF/Mu7pcuLOvRIqiqyxOrlHGJhIWMWkUZSgjs/oTxfgCAdhipvms5u2qgjN9S
         eAFZtKU80jsNGuSmgBwBT1pbiws8+mKXEhmsf8D2LK4Pq36mlskRjVgtWLL/Gg9qZc7P
         LzpGQgrAVGx2wx83hZG+e+os5EQHyrEABP6sUH1jnjMcx7aq3eDj5pWDZ4FcBB0Cf8mz
         wroOMH6rjtjQaNzEp8i6uiUFz2/iIcpkM8+FbE7frf4G4T/1agQT+OrNejLL0FuR3qbT
         CDRg==
X-Gm-Message-State: AC+VfDxlQVYV8uZjYZm42RV4bN3V+vv71CID0gdgLzwA8Yd/vf4/5GHo
	DyhVwOo8PrYkoQ/q8aOpkII=
X-Google-Smtp-Source: ACHHUZ4ORFM0ZTf9TzhKeprt3bYgADAf/+yqvqGV4ek3VhH5dOxGcnauozS9O5zvjkrLTY1DpL0VFA==
X-Received: by 2002:adf:e810:0:b0:306:31e0:958 with SMTP id o16-20020adfe810000000b0030631e00958mr2445035wrm.15.1685658690884;
        Thu, 01 Jun 2023 15:31:30 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id b7-20020a5d4d87000000b0030af8da022dsm8619149wru.44.2023.06.01.15.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 15:31:30 -0700 (PDT)
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
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	William Breathitt Gray <william.gray@linaro.org>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Haibo Chen <haibo.chen@nxp.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/3] Add support for Allwinner GPADC on D1/T113s/R329/T507 SoCs
Date: Fri,  2 Jun 2023 01:30:38 +0300
Message-Id: <20230601223104.1243871-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_153133_939349_20DEAB29 
X-CRM114-Status: GOOD (  12.09  )
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

 .../iio/adc/allwinner,sun20i-d1-gpadc.yaml    |  79 +++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  10 +
 drivers/iio/adc/Kconfig                       |  10 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/sun20i-gpadc-iio.c            | 296 ++++++++++++++++++
 5 files changed, 396 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
 create mode 100644 drivers/iio/adc/sun20i-gpadc-iio.c

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
