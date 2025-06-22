Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3400C7115C
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Jun 2025 03:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jFzDNQ54QiITH1i9MXYA2PO1/sE22VOlS9gqjfZP9M8=; b=eZSQFDkqJTxNY2
	jTolqP+1+/gHDEgH27XUoXs0NVkquqcWMb6morRMhcGzL2jFIwmAZ/+79nPwbrfIIEyfJakkI9iN9
	NW2DQdXGjbtI1jCbaO8zgvk+eDlzX89znnVcuODrXovsOOiY1CloPtsOUo7OXcA5VKTByXrHjQKdP
	QAboGfYDxxteKFezGgncnUolIPfoySee8i4bwoU5SxK8JIF5it1mwn8JeXCxlFs/NHMalO9mWYGVx
	vyp/aim4HIk8swJzmZ9MNFYDgEEeyluDr5eoIkxSD6iMBxqL3rqFBpRrONg7bdfnXFxtwCLjHn3cy
	FjRkI4zIy+Pbh+yDE/tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTBOv-00000000Tg1-3LSl;
	Sun, 22 Jun 2025 03:29:49 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTBOt-00000000Tf6-1ocS
	for linux-riscv@lists.infradead.org;
	Sun, 22 Jun 2025 03:29:49 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-6facc3b9559so51666906d6.0
        for <linux-riscv@lists.infradead.org>; Sat, 21 Jun 2025 20:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750562986; x=1751167786; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cgrserUFU/DcGo28DBPZa+gth4hnjdPTKAQjzFeKIM8=;
        b=s1tmC9OB5njB59Xzzs2Zjt2NzP5LNNRdiNvFgmPqDDp/tAgY756uV5AGSleFs0kp5l
         qjwWqJZUUbx1xeUC+5KZbZoWUUjZ7RANij6egGhtYkqI3TqiBCqlgKzj0rUH24chFA/Z
         bp8XcYoURzr4JYgRZ2lXWvHuS9vtHeHLBr21cVt3OVdjSo7SfOjgJAejFfJ4b+1vMuYl
         CNK3BJoBr18grhg7hXFCnqoz+u7FrshHorAfUzZF76eKqe+j5alFtkJQktno5FMOVDEl
         843iO+/Ck+XHoOB628Z3redKaT/fecp6o/9OpU2Fam9CmMCSLEi4C3kn1oBQ1LGyyIzL
         vLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750562986; x=1751167786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cgrserUFU/DcGo28DBPZa+gth4hnjdPTKAQjzFeKIM8=;
        b=PHl8CxpPu98tl7THvvwMPXMsdZO1GbwuKhrA4ecfcU5/pJlrfV4eGGHJND8OIqyg62
         G/EOA7zYRrmzZFIcepczocyYWPTuDNcvB5UbPvwuus5EjBrTj6o1bx6I8kZd99U9WhaZ
         yN3oVeK4voby9FahvsBqRie6rdBvJT5UDt+n6p9nWy7ymsDoiLNFcglIc/6DCWDhl0kH
         StswLnIdShgvY2A5bJachyYEQaB4euyvgX1IYlzX2CP7QhIRGgAJCKzQPJPfoZ51wp8f
         UgejpLgbHXH0zMTQld+94SKlG2nNMLDVP8o3PvO6QvYjyZQraRV/pfSaVyWrCo2CIqVB
         +96g==
X-Forwarded-Encrypted: i=1; AJvYcCUYfx4o7ZkCrcGXH1uNc+spbzmr7DHfxuUnyOOdX+LkZtNfCi0IfLZUXeXKiGs3M51RG+b7rU284B9bBw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd27d2rXrA9nVFQZZbPwqn4Y6AoJm9Yjer8vzbyFTT14G04jcR
	tFvgtpOEMPubd2NUZf5EZy2oa+6mnWVrhf0bNGcs46A94D3HozkdYoOfBeS0ltJxxxo=
X-Gm-Gg: ASbGncs0uB+qD/S64zmmqLklUVkQBE7E5LVHmCiZK7mGZGNPw99Fy18HSy9HhtqQjUK
	AB42/hnyobEnfunjJ4+lfsl5Fqxdpx0kT8y5uVytqBwwy7cYPoDm1shyoenhw/0tLo3Bu3t58d5
	qQOdoszQyCtAkMMXsvf7DtNv2mQNY5/ARBocykqRMFSPCgcjsjl4Dkun3mZkmbuQMsOEorYdi2y
	DuF56IQE7j6xubnWPIuNwcpr8i5J7X4wmUd2DawC6/vC0WoCCeUYZbNvCdqX4tcepKrlXdT5Jv3
	ogVo1hqXOqD3PTRVg1HmeOO6wRIl5/Bt+O+DiBCBkhFYmz/s75uqjP2kiweLsDItp27HuuEyWHY
	NezRjrgvorS//K+3B3Fd9qolAUzfwpVDxbXI=
X-Google-Smtp-Source: AGHT+IFeIAU1AkteDl39FgQydYRwtm5GM125i8YSXLkjgyUSEEtkYenBUd8CxZ/YJ2gC3UkZwdaRjQ==
X-Received: by 2002:a05:6214:509c:b0:6fa:fb7d:6e4c with SMTP id 6a1803df08f44-6fd0a54d8c8mr142353156d6.25.1750562985883;
        Sat, 21 Jun 2025 20:29:45 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd0945183dsm30014526d6.44.2025.06.21.20.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 20:29:45 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	alexandre.belloni@bootlin.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	wangruikang@iscas.ac.cn,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-rtc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/7] spacemit: introduce P1 PMIC support
Date: Sat, 21 Jun 2025 22:29:32 -0500
Message-ID: <20250622032941.3768912-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_202947_706930_FA79A717 
X-CRM114-Status: GOOD (  12.24  )
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

The SpacemiT P1 is an I2C-controlled PMIC that implements 6 buck
converters and 12 LDOs.  It contains a load switch, ADC channels,
GPIOs, a real-time clock, and a watchdog timer.

This series introduces a multifunction driver for the P1 PMIC as well
as drivers for its regulators and RTC.

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pmic-v3

					-Alex
Between version 2 and version 3:
  - Removed "spacemit-pmic.c" and updated "simple-mfd-i2c.c" instead
  - Added an RTC driver, so that the MFD has more than one sub-device
  - Other suggestions were directed at "spacemit-pmic.c"

Here is version 2 of this series:
  https://lore.kernel.org/lkml/20250613210150.1468845-1-elder@riscstar.com/

Between version 1 and version 2:
  - Added Reviewed-by tag from Mark Brown to patch 3
  - Implemented suggestions from Vivian Wang:
      - Fixed a typo in the subject line in patch 1
      - Now use module_i2c_driver() for the PMIC driver in patch 2
      - Added MODULE_ALIAS() for both drivers (patches 2 and 3)
      - Defined and used DRV_NAME in both drivers
      - Added additional Kconfig module help text for both drivers

Here is version 1 of this series:
  https://lore.kernel.org/lkml/20250613210150.1468845-1-elder@riscstar.com/

Alex Elder (7):
  dt-bindings: mfd: add support the SpacemiT P1 PMIC
  mfd: simple-mfd-i2c: add SpacemiT P1 support
  regulator: spacemit: support SpacemiT P1 regulators
  rtc: spacemit: support the SpacemiT P1 RTC
  riscv: dts: spacemit: enable the i2c8 adapter
  riscv: dts: spacemit: define fixed regulators
  riscv: dts: spacemit: define regulator constraints

 .../devicetree/bindings/mfd/spacemit,p1.yaml  |  86 ++++++++++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 138 +++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |   7 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  11 ++
 drivers/mfd/Kconfig                           |  10 ++
 drivers/mfd/simple-mfd-i2c.c                  |  18 ++
 drivers/regulator/Kconfig                     |  12 ++
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/spacemit-p1.c               | 157 ++++++++++++++++++
 drivers/rtc/Kconfig                           |  10 ++
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-p1.c                          | 137 +++++++++++++++
 12 files changed, 588 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
 create mode 100644 drivers/regulator/spacemit-p1.c
 create mode 100644 drivers/rtc/rtc-p1.c


base-commit: 5d4809e25903ab8e74034c1f23c787fd26d52934
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
