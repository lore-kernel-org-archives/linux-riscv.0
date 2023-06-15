Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44383EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 20:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ptsfs0FB1wYXgtRHnM3z7UfgTtpk9u6EkJu4IQCWezs=; b=psp+ERPK7pPq6m
	pQ9Sjv8TiuUSg/86iovUS3uVz0Uim0Q5SbEIQ4D3HjkRNq0s/8HjcuSSPSl7dw9kd1Oe9xXcGA6h/
	o/OmVJi9n1XYxbEYwY6ijCzqhIDlmaW48QnPUZ0yi+gRt/ZAIUfgiddeQypS/lr2eAql3ygyb3sh3
	Q3UayFboBU7iLRiz0oHdGjFBQ7vfM4IAymp4z57nSn47niMAZsl2jIxVhE6KGxuJ8B6MfjDG0VnGK
	X+uB60bn3wegSVqvx0pX9BeA9iZowbqhnJV/TjFssRkpLRdtkSRy6R+uRCAU3sA3EBV6u0kaiDYo2
	4iYflmzos8cFULvzz0OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9u1I-00G4ix-19;
	Thu, 15 Jun 2023 20:56:40 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9u1E-00G4iA-2d;
	Thu, 15 Jun 2023 20:56:38 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f8c74af64fso22752375e9.1;
        Thu, 15 Jun 2023 13:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686862594; x=1689454594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dgV1It5yzYqbMebPqzMnKIWLU3rEcZIgopMZAjPAt2g=;
        b=DfQBDDXzeQsp+dF++eEaRIp0slv3S+MuToAvwrWA4o8RaqsNOPU3dO12qNVpNiMUZd
         w/AbZyCDBx9VkQmkBqIAW43KrUvKMG/5HcAogWc3WIuZoh92crMTJkg424oVNhStKJhs
         /36r0RC7bjsil2vjJL0ew8kyY+ODbPuQeAoznYGUXWM6PQ8iw7/OeKdW1QKucxLmWfO0
         /DTVek8mtZuPrKZeRuceiS9OMTvn4W1XHTZGCIo9Jjs4ZDycqwzKpJh4tEl1yWeQ3ch3
         42/XrViLVuinuhSuXMGc4ADjsNR1lpf7Bv4d8JvUf3xfYl+9xZmiy9c0rvpFge6L+tRi
         x+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686862594; x=1689454594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dgV1It5yzYqbMebPqzMnKIWLU3rEcZIgopMZAjPAt2g=;
        b=Y0IN3H/syJRkKYo9uspoOVbGjs+6lPrkejZrNLsWzq5JdKq9Z4rkUOZ7DgQgIa8g+M
         ef3lfR2P0v5I24rflFm6zPenzVO/uJsmsQfwmXX0jPsdpZN5uRmCf2KWffLht1JJ5Z7M
         2ATCi86uhPVt5of/nbxXmv8IRf7kh86XLdKerDiWlNEy9BQZLQxfp4F3l5WSq3FBrKoT
         iv/M9ZuxlebKA52b4gFHKMMoqjcpC0IzHBiFZOoYQnzrQq3rZREUj/ZzefDOpp+pwXyn
         xSCWF0An2EprXE4hN4HQpMivJrsoOsRjdprj02yixsH3XhpmI9oqP9ICWAng2fj8jNzi
         pENQ==
X-Gm-Message-State: AC+VfDwiclu1noBnjMjUskZxc5X2fkSg+DU3i2pksu941OAePKTyG8k4
	4Mt5BVFgrwVuBamXkgeUHYE=
X-Google-Smtp-Source: ACHHUZ6W9+N2LhPksahWf6LEg4rQS8jsG3asSDIAPSQi11bN0szlV4/qXoCKy5Vuplfx3AeLUNmG9A==
X-Received: by 2002:a7b:ce92:0:b0:3f7:3074:d2f2 with SMTP id q18-20020a7bce92000000b003f73074d2f2mr213658wmj.34.1686862593604;
        Thu, 15 Jun 2023 13:56:33 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id k24-20020a7bc318000000b003f733c1129fsm176372wmj.33.2023.06.15.13.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 13:56:33 -0700 (PDT)
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
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	William Breathitt Gray <william.gray@linaro.org>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Haibo Chen <haibo.chen@nxp.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v7 0/3] Add support for Allwinner GPADC on D1/T113s/R329/T507 SoCs
Date: Thu, 15 Jun 2023 23:55:19 +0300
Message-Id: <20230615205540.1803975-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_135636_878658_FD293A20 
X-CRM114-Status: GOOD (  12.22  )
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

Maksim Kiselev (3):
  iio: adc: Add Allwinner D1/T113s/R329/T507 SoCs GPADC
  dt-bindings: iio: adc: Add Allwinner D1/T113s/R329/T507 SoCs GPADC
  riscv: dts: allwinner: d1: Add GPADC node

 .../iio/adc/allwinner,sun20i-d1-gpadc.yaml    |  91 ++++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  10 +
 drivers/iio/adc/Kconfig                       |  10 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/sun20i-gpadc-iio.c            | 276 ++++++++++++++++++
 5 files changed, 388 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
 create mode 100644 drivers/iio/adc/sun20i-gpadc-iio.c

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
