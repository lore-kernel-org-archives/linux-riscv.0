Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA02CA0EDC
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 02:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k3H9i6u5x1IjLclm7iErWkvFR6HUeVTlz51lCFm3pI8=; b=faN20zP3RHiWK7
	/2XUX9Ub7IMfX1ViyfR/GTskxnF9vFp/CFuT/2Xteb/RNYAdzkCPnIIDaDVxXFJ8eQFy7VBy4qZ+l
	CBbSGPYYd066KiUu3qlrLUpM93SkE3Bf2GmgsQ02iRZQeBy+3qAoqIc+ofv4xfdWp2PbjR2ZfZDS0
	IercTKacrfM+77PnEXx6mMz6VHYkodukYFzyzSHd/EyUNNmv+tlgAcd+6q8X0fLJgtt6CwhTfuux+
	jkkWsxyW7nFwC17ID0fCyJEKob4nZbAxz+uCZYatVRqgmC6V02DjaQPSHfmX2Raeh0N0E37LHuNsD
	F8Ff51A/WvhMYWmIueYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um1UL-0000000CQfT-0Rum;
	Wed, 13 Aug 2025 02:45:17 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um1UI-0000000CQep-39vB
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 02:45:16 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3e40ac40940so2645025ab.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Aug 2025 19:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755053114; x=1755657914; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=niKBP2EZ19X+wqMs4ZG9wJKfN7oQpwL1MM9OL7zTge0=;
        b=zT/Mpp/HkqL2o0IxfnWmAiBUy5j/Qx/E3j8pqHtvggfWu4CDwwod+4yTrv9P7e136K
         hepGE1PLqyPKmhGJqyNGMSggAk/gBW38Nm8vtCTfUtvKSzJ12mz0DErixaGWwanJUMMR
         ernt1ELoHBizdMOBdYmRnwnHBamiEvA8/mBYEo5Io8vIkMJP5vq3a6LfG2FdOmn4P9S0
         XJjyVVaJwJEGK5TxI9hVBuRxYm1iG9OInyT2jxzSojk9NiKBBRXc+pvWF9cK8GMjEccP
         sVLUv/f8PMob7jFx3hfgJ3/8gTY3k4/+0AvShEVXXNN8w3YhQntltjRbu+q4qGfP+ZXq
         GKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755053114; x=1755657914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=niKBP2EZ19X+wqMs4ZG9wJKfN7oQpwL1MM9OL7zTge0=;
        b=TT04KpFSnTDT9vz1SaK9Iv7+UgcZ9NY6wtufZD+ab1zRKOs2k+z3CbIwf+jLYOetB5
         FdvAloPYV8kEoDHBQmohiNCNZZVIKYeHg7m34vzycz+DV+8YhM1VOngZxuEOJTPLJ/d1
         iMpkgiorOxlJdCnucndEIgfZ2Ho82nW0YuyoefP8I0RzcLCmfuaP0AzSH08pYsKHVlKX
         iUWXJt7Kar5qKyDcKW3WAIzDliqLA7Orn/LsRRNw+0eQJZRP1of4oT5OM7qgx2mULaE9
         z0dAARmOl3+LHliOkulYVMHHO7+/ngbnkXNwi9dp4+p/vT/3KAstEVQT8YkUT7Nh1nUU
         H6Kw==
X-Forwarded-Encrypted: i=1; AJvYcCW8lylpjHpPvBcFhG3WVMhVZDl+udYS5hopIu5mKLUI0+P80BrcrqV7bBmN4HASbrnNrjsxkAwwxlC1OQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwrIYDlzZ7DxaWUZsWsEX2FcPLugG0uYD7NEr4ey/HmrJZSk/fh
	UTdxVkJfKFR8oxfNRgnRZ+yy239mGoUfpJccjbItfGFLVzheWrB2oueGH1yXPq6jspE=
X-Gm-Gg: ASbGncvO0y8LHriInM6L6OKeUEbbPMiLH179dGbpbDofy+TvJLIYMAaoR3SbR9CYPu9
	Cnh/75KFQQCUF57kg7ncaZbwcO2dGWLmaT0aP8d5sa4z+lj6QpGRtQFIZwcJHlb6NfdbHsC98ER
	wn+6cW5Y+kFwIMAM0pB9YeacnMpJmMod9IBrII/jZcyyc5GsjRfeBwweLbCakZ7oZvf2mfrreNR
	In+QaYyLdWfSdxWuuh5c86OP+Z2HhNUvsbigOnGJK64ip5JMbUcrfGKUn6MaCV7OpAVOJunF7rM
	BC1pM8JBH8nyvPbfS4emCoZgEcwMIJ7OggRzXtnJlferUpKypfKKAzcIf3hPqGgHizoXyHEyncS
	MCukOGP1SbR80ItIIFImBl1hGNXBdafHx319+pK/6Q4f96HNrDPOcnDnKWtwPAu8ySc2jgJcacL
	OP
X-Google-Smtp-Source: AGHT+IEBZwyeOzbbOcVhNNK5J1cGS+53cBPTwwwfowqlesyNWISPovkwp31RGRTV3tyrIRkYbuJPkg==
X-Received: by 2002:a05:6e02:19cd:b0:3e3:b3d0:26cf with SMTP id e9e14a558f8ab-3e5685aa5bcmr15459295ab.10.1755053113531;
        Tue, 12 Aug 2025 19:45:13 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ae9bcfbf6sm3430829173.54.2025.08.12.19.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 19:45:13 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux.amoon@gmail.com,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 0/7] spacemit: introduce P1 PMIC support
Date: Tue, 12 Aug 2025 21:45:01 -0500
Message-ID: <20250813024509.2325988-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_194514_953105_8DB91840 
X-CRM114-Status: GOOD (  14.00  )
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

This series introduces a multifunction driver for the P1 PMIC as
well as drivers for its regulators and RTC.

The content of this version is identical to the previous one.
It has simply been rebased onto Linux v6.17-rc1.

					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pmic-v12

Between version 11 and version 12:
  - Simple rebase

Here is version 11 of this series:
  https://lore.kernel.org/lkml/20250803025812.373029-1-elder@riscstar.com/

Between version 10 and version 11:
  - Abandon trying to implement a simple_mfd_data->max_register field
  - Fix a missing dependency pointed out by the kernel test robot

Here is version 10 of this series:
  https://lore.kernel.org/lkml/20250726131003.3137282-1-elder@riscstar.com/

Between version 9 and version 10:
  - The #address-cells and #size-cells for the i2c8 DTS node
    were moved into its primary definition in "k1.dtsi".
  - The interrupts property for the i2c8 DTS node was moved
    below its clock-related properties.
  - The status property in the pmic@41 DTS node was dropped.
  - The function that provides the regmap_config structure
    to use was reworked a bit.
  - A new function was added to free the regmap_config
    structure after it's no longer needed.

Here is version 9 of this series:
  https://lore.kernel.org/lkml/20250724202511.499288-1-elder@riscstar.com/

Between version 8 and version 9:
  - The max_config value is always used if it is provided with the
    simple_mfd_data structure.
  - The regmap_config structure used is allocated dynamically if
    necessary; otherwise regmap_config_8r_8v is used.
  - A small duplicated comment is removed

Here is version 8 of this series:
  https://lore.kernel.org/lkml/20250710175107.1280221-1-elder@riscstar.com/

More complete history is available at that link.


Alex Elder (7):
  dt-bindings: mfd: add support the SpacemiT P1 PMIC
  mfd: simple-mfd-i2c: add SpacemiT P1 support
  regulator: spacemit: support SpacemiT P1 regulators
  rtc: spacemit: support the SpacemiT P1 RTC
  riscv: dts: spacemit: enable the i2c8 adapter
  riscv: dts: spacemit: define fixed regulators
  riscv: dts: spacemit: define regulator constraints

 .../devicetree/bindings/mfd/spacemit,p1.yaml  |  86 +++++++++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 135 ++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |   7 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  13 ++
 drivers/mfd/Kconfig                           |  11 ++
 drivers/mfd/simple-mfd-i2c.c                  |  18 ++
 drivers/regulator/Kconfig                     |  13 ++
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/spacemit-p1.c               | 157 ++++++++++++++++
 drivers/rtc/Kconfig                           |  10 ++
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-spacemit-p1.c                 | 167 ++++++++++++++++++
 12 files changed, 619 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
 create mode 100644 drivers/regulator/spacemit-p1.c
 create mode 100644 drivers/rtc/rtc-spacemit-p1.c


base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
