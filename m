Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8D6EB64DC
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jul 2023 09:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k3qCO4KTPi+E4N0ogHiUYB9gMSXdZB080l0NUHPuQ08=; b=lQvPMm7nP/9u1O
	hGAFx9wm66dpV8Xw/7Oz3RpzlTL6tlZdlbH0uGugx+lx1uHyUrUulew9tVjgSgwZF/7ps9is0pGFr
	NlSELWB3zhvH6XiZcKoIeKViPdsOkHWuk+mnfrtsA6NbMzYpgsdQY8YWNOxRV8iq238WclkaBzJXs
	dYH4hc1LpMNZr745wsxqn18TGutSNZ0gdECDEA5VhC9mplYugTxfGObHw0eVTuPjnfRAkKqe4BTXn
	LVxtIFyy/v1l5IHQqAKFAOBfv68/uiXXW6clHmudoaBlC0AP9Q5X5C8E+r9JHgdo+QSrR/7O9CwQ9
	8prrFLUqjjLAwPVIsg4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKbQG-008GlR-1k;
	Sat, 15 Jul 2023 09:18:40 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKbQC-008Gjl-2k;
	Sat, 15 Jul 2023 09:18:38 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b69e6d324aso42204131fa.0;
        Sat, 15 Jul 2023 02:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689412709; x=1692004709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=68KK9nMb/YMaoape6Ajka+6g2rtnhepcU3LV7qa+nM8=;
        b=bfn57QW6XodUliCuFKdi9Wt3QhFAThlbWatDzeTGyjXfTyWb6U3wEBLqkjU8ocesc+
         Ru6FipAGz7YCj7l8Mv7hMa0gA5IZ36ieYug0HyIwuuOtlCAVdZyl6vwqkNGDMq33JqOc
         AypdOp+/6MKch8NmyGnbHNSEQEmch7tov55O01gCCuQDNyuhZ4ufyME2gSg+Rblo+uWL
         oMNH0P/xS+JVu2tHBkEjsUw2+d6lMcrim55vfTaUo7kQIDdVBCFIG8+KxmBYPG6hepGE
         YLzLLyjMT4qz0zLSlDbApejjyWvIdYjO4d1pj149ohceqVJYbAXYRgUiYUT0yBtpjIld
         ZHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689412709; x=1692004709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=68KK9nMb/YMaoape6Ajka+6g2rtnhepcU3LV7qa+nM8=;
        b=ZdsXHNcPiAvO2d6GAHyrb77Fi7JzCeJXjOX/707KilJ4wNK8Kc1UAX5TGjvTUVVQQj
         8FkWD6dx4HbHf0K9AVTdlvnfGKSm4JEljwc5pFMBhdmCmZw+aP+Hb01vkg/J3uFEMkFy
         ANSVfiksgiNsFaRfghIt3ApXIG83JX4XrH0m1YbJ9056XQfyEIpd1kqqZsc7YBIImIbq
         5BQJtHkF07j+v9QeUVdpG2J07tN5BZgLbYwO6l7CWTz8vyyNUIYRsJH/dzSrAqMdr5Tf
         1F/WOPY1fZuWKOwjqNb/+9XwC4cAECOBGJTZYovNLSUOKgUWXqBAnR5ZcWQCC7WUEJWH
         jJRg==
X-Gm-Message-State: ABy/qLb7q47amXY+0KR4DRMSpXe+bwkKM3wLiu90EwmXMyhYQ0BavXKw
	xrIzZ+tJBj7GMXbeZUg22sLhlDDlaSLzCA==
X-Google-Smtp-Source: APBJJlFGNRjxeR4VqbwtcC7QCL/trfcaEw9mhlBfy0pd8SJcEXD8F41MebiZaa0xN5qVjoHQABdRoA==
X-Received: by 2002:a05:651c:157:b0:2b5:9f54:e290 with SMTP id c23-20020a05651c015700b002b59f54e290mr5276895ljd.0.1689412709072;
        Sat, 15 Jul 2023 02:18:29 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id b17-20020a2e9891000000b002b840f283a7sm561784ljj.36.2023.07.15.02.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jul 2023 02:18:28 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v9 0/4] Add support for Allwinner GPADC on D1/T113s/R329/T507 SoCs
Date: Sat, 15 Jul 2023 12:18:12 +0300
Message-Id: <20230715091816.3074375-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_021836_895164_AF55CB22 
X-CRM114-Status: GOOD (  13.08  )
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
v9:
- Dropped fixes tag
- Reworded commits to remove 'This patch'

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
