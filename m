Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7402C87FCA
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 20:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z5FbbIDab5/DcJVuHr032tq2CnDRl1X377JF8+ddyKM=; b=cJIkDUShAHA584
	d/Y+l3+fszqXHw++OIJYo16puJnH56lI+BmfaDsr5p7KuPxeLh6rNEXCjEziv1UhzCcqPdyHsUOvy
	t4XAkCvMDyR+qasTUUFbjtZ8I6EA3EO6C/MgDJUgcrUqqYrfRbBuHNzVPt4OVTeKXzyEjghaPH42B
	0FBGxnLp0/2poLr28EyWFJbwAMgVehtC5J0oXSSushpkxMD/Mn5rb/6oUnFQd46CfZRPNWmE6b6wg
	h+67q/uVuLfeiAhKv6eYPy6yVIv/LyT6dpvGNnDdfl+yE7wSc2abX4yRNFOYA3wIksbyUwjK8iH0Q
	SG2cID1ZoNvtCUsX4cMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf2VF-00000008Nrp-2g2X;
	Thu, 24 Jul 2025 20:25:21 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf2VC-00000008NqI-0wla
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 20:25:19 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3e2c44be5abso17736665ab.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Jul 2025 13:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753388715; x=1753993515; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lrEbbbAkAppzih/TPSBGsQGG4aRG/XXDaMLZfTbNAAw=;
        b=WoqwE3bxI2Kou6+TCOGnKdaAkh845YWkHCxLFmCt15wr+OkcNzpuqdmKXOastdqwLE
         RXB4a0xTaf0vL4W3TL1t8thTm1ZADU4+0sBcGEGE5vi9JbcBgKYQt+ufYrd9CD/vYnil
         EnCNw8xJ8PzeLV8CAtbsFYWhsoL5xS+BVjspcF+IkbDeg1x235tQdnqNe9ChSMqueAyr
         kUJOuEg4+Waz2VWU0AWsf70lZ0OVWkFl7d3lIc7YOzBt7F662OMvY1CDvsh9luraV3+f
         EGYsWNVF3LVrDOc/q4XsKeM3vH5r6tp2tkWMJw7JXZL5kE9UG97JD/t27cx1OGDCrVkA
         IUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753388715; x=1753993515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lrEbbbAkAppzih/TPSBGsQGG4aRG/XXDaMLZfTbNAAw=;
        b=iJhrv3lpBYpbFCydP9WwepFN5FErUCWb5v4Y7yMMVb5qMLB+LlTUJf+uT/Kd5cULu4
         G7qj0YblnF86Iw0k4/LpywHW/9+4z5/h6SbxBy68j3z0nfGRSXhJK1YqRNW0IxBASO6R
         vbaOzWqPVWYIGgIKvSd9gdMs7RRpeVhcWjgV0fPzBcxcniTRErNJPX0i8+P0/JE03Mip
         3hzM9b6Jy8TU04AjtZWhYBZ1FRoNodrA8HB5f70lxfBsVGHjCvy3idcaHeg9fbXyzlu2
         TYn2Vq9gqT9eoSds3DCtOQleTYll6Qe3aYaJkfUyOZrDP0MInO1NpV5RTApaGfa4RU9P
         Pu+w==
X-Forwarded-Encrypted: i=1; AJvYcCVhjn1vqtFfqd+E4m3fSbECKPU1i5ukKTZRgmupF7r2LjagUQDdy/tOrns0LDsWBBjeP4gEMOe1CY+CSg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRIP4GRzxuKbtbr1jU3iUeLaa/rKBRPDVN6/nxUozfAmFXLnOK
	+yvOkIPtPM61LvghFH6vJ8+B9MvXGsPLNJ6BUqGMj7OEdV/8MdG/v6MO0WlPYlKSkN0=
X-Gm-Gg: ASbGnctzK+mFsvso6HIbJPugiVOxx5kr2XleyNp6WHBYTLCmhEcldpCTvVrURpFdCbR
	MqEsUDRyO0zFFLamOstVUkxYYcFAEucjVQ07QtFIUgc720QMtwuqWhu8d79xH0zORHd0shhG9FA
	fuNyqh2fRbQrqwLKnapM2REJOwoB2v5Wyp4E6Kq53rtcjCSUgQtllDJ4fleaHWjgTjbnTYHPYpn
	7S23d0xR/mHeJXHnYoR1Qu7a2kWG9PQMLMj2LC2hAUCfbCwsXxLM9/eKE+hJw7Y6xsoxu8jzFB7
	aVzvYQtdBnKUP/zAnqLz6rvAFcDK4SUX8e0vNzojhdkib9pgUJmajBtPaapo72zlQtgoeg0uS5U
	Po1re2+ryI6xPgeLQa5mGC/MG0aHPM65PJOGx9Xwm
X-Google-Smtp-Source: AGHT+IE5uFkVwfcYSkjHyZF/c2W8eIlexXUx47CDYyxHzh9kAbZHbQXPpnACm7peHUuN/ml5vSYqEw==
X-Received: by 2002:a05:6602:1551:b0:87c:6d49:deb1 with SMTP id ca18e2360f4ac-87c6d4a568fmr1148165839f.8.1753388715572;
        Thu, 24 Jul 2025 13:25:15 -0700 (PDT)
Received: from zoltan.localdomain ([199.59.116.160])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-87c74316a3bsm63080239f.23.2025.07.24.13.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 13:25:14 -0700 (PDT)
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
Subject: [PATCH v9 0/8] spacemit: introduce P1 PMIC support
Date: Thu, 24 Jul 2025 15:25:01 -0500
Message-ID: <20250724202511.499288-1-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_132518_497260_7ED3946A 
X-CRM114-Status: GOOD (  19.27  )
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

Version 8 provided the ability in "simple-mfd-i2c.c" to specify the
max_register value for the regmap configuration as an alternative
to providing a "full" regmap structure.  Lee Jones asked that the
max_register value take precedence if the regmap_config was also
provided.

This version changes a few things from v8:
  - Alexandre Belloni's ack is added to patch 5.
  - The max_register value in simple_mfd_data is always used if
    it is non-zero, as requested by Lee Jones.
  - The global regmap_config_8r_8v structure is back to being
    const again.
  - A new function simple_regmap_config() has been added in patch 2
    to encapsulate the logic that determines what regmap_config
    structure will be used.
      - It uses regmap_config_8r_8v if simple_mfd_data is not supplied
        for some reason.
      - It uses regmap_config_8r_8v if the simple_mfd_data defines
        neither regmap_config nor max_register.
      - Otherwise, it dynamically allocates a regmap_config structure.
        If simple_mfd_data refers to a regmap_config structure, it is
	copied into the allocated struct; otherwise regmap_config_8r_8v
	is copied.
      - Finally, if the simple_mfd_data structure provides a non-zero
        max_register value, it is used in the regmap_config.
  - A small duplicated comment in "simple-mfd-i2c.h" is removed.

  					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pmic-v9

Between version 8 and version 9:
  - The max_config value is always used if it is provided with the
    simple_mfd_data structure.
  - The regmap_config structure used is allocated dynamically if
    necessary; otherwise regmap_config_8r_8v is used.
  - A small duplicated comment is removed

Here is version 8 of this series:
  https://lore.kernel.org/lkml/20250710175107.1280221-1-elder@riscstar.com/

Between version 7 and version 8:
  - Change the global regmap_config to not be const in patch 2.

Here is version 7 of this series:
  https://lore.kernel.org/lkml/20250702213658.545163-1-elder@riscstar.com/

Between version 6 and version 7:
  - Revise patch 2 to preserve the option to provide a full regmap config

Here is version 6 of this series:
  https://lore.kernel.org/lkml/20250627142309.1444135-1-elder@riscstar.com/

Between version 5 and version 6:
  - Added Rob Herring's reviewed-by to patch 1
  - Add the simple MFD functionality suggested by Lee Jones
  - Update patch 3 (previously 2) accordingly

Here is version 5 of this series:
  https://lore.kernel.org/lkml/20250625164119.1068842-1-elder@riscstar.com/

Between version 4 and version 5:
  - Only check the seconds register for change when looping on read
  - Return without re-enabling the RTC if writing registers fails
  - If the RTC is disabled when reading, return an error

Here is version 4 of this series:
  https://lore.kernel.org/lkml/20250625164119.1068842-1-elder@riscstar.com/

More complete history is available at that link.


Alex Elder (8):
  dt-bindings: mfd: add support the SpacemiT P1 PMIC
  mfd: simple-mfd-i2c: specify max_register
  mfd: simple-mfd-i2c: add SpacemiT P1 support
  regulator: spacemit: support SpacemiT P1 regulators
  rtc: spacemit: support the SpacemiT P1 RTC
  riscv: dts: spacemit: enable the i2c8 adapter
  riscv: dts: spacemit: define fixed regulators
  riscv: dts: spacemit: define regulator constraints

 .../devicetree/bindings/mfd/spacemit,p1.yaml  |  86 +++++++++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 138 +++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |   7 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  11 ++
 drivers/mfd/Kconfig                           |  11 ++
 drivers/mfd/simple-mfd-i2c.c                  |  50 +++++-
 drivers/mfd/simple-mfd-i2c.h                  |   5 +-
 drivers/regulator/Kconfig                     |  12 ++
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/spacemit-p1.c               | 157 ++++++++++++++++
 drivers/rtc/Kconfig                           |  10 ++
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-spacemit-p1.c                 | 167 ++++++++++++++++++
 13 files changed, 647 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
 create mode 100644 drivers/regulator/spacemit-p1.c
 create mode 100644 drivers/rtc/rtc-spacemit-p1.c


base-commit: 9ee814bd78e315e4551223ca7548dd3f6bdcf1ae
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
