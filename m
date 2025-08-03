Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CAFC87FDA
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Aug 2025 02:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n6o5BI4cLpNo/hNwGgEh2N4SuZXXsXYaLRE6R4M8LXU=; b=4o5CAj8UWcGNqQ
	eliZP+xONaahifh8c0rX7nHMoVa3uGkeDVZJ1TjHkT43TRCUJ2/3351kw0RvhrX24tN6/iXeXbo4/
	VRg6TKhiVesSvBiTcO22xcrLSWEN+6I4YLFZ6+i+7mt5HoCfCrZ1gZE4PaLyyc908XylLx8sQZmCW
	jq8ZvoqSoGW8jcTbOhhLfB6OMKp5ntg/EdifV2jfCq91lfbidOD5sE/Fc5i313vJFIPl+GcXHB1b8
	saOSA9oslovUpCowbwwn+FyKjT0zhCUMCVT0bf6oNbWe1iaN61T0j5GbzaK+jL13ULqupi7mestdL
	Bw6by2CQJ8joJ4cYTPvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiOvU-000000085Qv-0n1L;
	Sun, 03 Aug 2025 02:58:20 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiOvR-000000085Q2-2unE
	for linux-riscv@lists.infradead.org;
	Sun, 03 Aug 2025 02:58:19 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-87c3e35b3cbso186098139f.2
        for <linux-riscv@lists.infradead.org>; Sat, 02 Aug 2025 19:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1754189896; x=1754794696; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oY3Z8dtNrrf7QjfOHcFhMrLBNHKYAu0syOln9u3nSKA=;
        b=QeUwGwE1feJ3mxzRqUS2mB1cyyrN8+MkSVDLTjMu968BtWYjwguOBozFghMDg36m3o
         7upy68vpbgsLPCeJYFub5FVcUDg2o2+WzLY4lxgCIuUylNlOAHRhDG0bP/UiYNWQetYe
         yx8v8b/ubXZENHXRIOgwMJYKxfMRJbPajUfObzo/7hcDPrZVaE2h4ErygBCt6NL/mjIg
         EDm2TnM58LFnPeh0zHN2Sp4eXZlsS5NWPpZfdE1Rix3WTo26sJZiBqNMj+gjZcQCx495
         ODj4E45KAUO/RIx9a2YePL3kxohT1qLecWf7zAU453BQuVJJpa9ZUKWnO1vhgL/vMfJP
         V/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754189896; x=1754794696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oY3Z8dtNrrf7QjfOHcFhMrLBNHKYAu0syOln9u3nSKA=;
        b=AaXF9TILJoieZqk0l7XOSpDuvm++PUClWY82tWjJDGvU97IMRHqbrI2r8hBDUmp55L
         243TwaKCfAo16H2rgonuEnV1g2FEx65DjLasJSgYv2w8judg+/zUe69zvAN/xYVRk5gz
         QXdcQujil4zN0fqShRIk/hBp3TbS6z841nDKfHA0RzjLK/FsCUPVWJEDaleBH777dBr0
         bdWg2DgOUqACi8jIBS3SSIy5oF4LUAgtczlbzK9ydMkTqvKVOp0o6QJVwXeyVDCnxfwo
         xTCGIZP7i8ckLNpSlQAdjlt3B/d/c8nv5U931Mm0arXx8vCdvfhXJjIrR0RoVrIA3+s1
         h83w==
X-Forwarded-Encrypted: i=1; AJvYcCUWmZ7/vAlS+jdDW3WlOHznAlQW6miC/TJ531AmsXp9+4XvLG4j+r0t7Nk/UtKIE4ZUx9yAiT/lNutAuw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwP01DG6j2A3Psq95q8svX2kU9p67cgAy9vFV6Xmwe6fk+W9oEQ
	QvgUvoIdVe9EHcgQFsBCpmLdAd3/4llfKoU5ZH8ajaYLFC+tbQ+lXNEEbm+vwo0/afI=
X-Gm-Gg: ASbGncsJ2munpSZi5h1u7iDLvGVyOm73dSxgm0TkUXEHX1ZVPZSYVHe0XRBEZkYz2YZ
	yY3wk6PUgNUZ9bRiX1yDnLanFSdnJhPjyHNMqBjFdtN+Elhyu8MIGdXD5O50f8Qs6VT8d0psz+F
	rVVV3zj9cP43+kKq0jQRUNPK6ICKphi+T2tRFajosOY8847LhWa+Bs2TzXEXaT9FF6BxzLRE4ET
	FAmjz0ARDx6X8WAjpWeF3CekNbhhQQarYMO6nDimUOB/Ywj3H4aBa9x33hCYedxHyBmMDtGcgPN
	Mcyrqf4yqzu/dFbG0/GgNVLXoQUm3i3sDI36hI16xkzcmUYwtUip73RcJY8lAQClOyODeGum9sr
	SYpI4nAuntCKNy/TN3nn00OG92BHgW8iu++0Vd1xRKAE9LalqcMHgFjxBj9992tdCpg==
X-Google-Smtp-Source: AGHT+IHt2PgWb9LhAIhITIOQeAiyN5sN4fCPbyKx7y0/fVbofgmpYs/9kxt/4dYcvv4SBxyTO04ktA==
X-Received: by 2002:a05:6602:3f87:b0:87c:3d8:17aa with SMTP id ca18e2360f4ac-88168253fc7mr836026839f.0.1754189896369;
        Sat, 02 Aug 2025 19:58:16 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50a55b1ac2esm2251906173.1.2025.08.02.19.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 19:58:15 -0700 (PDT)
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
Subject: [PATCH v11 0/7] spacemit: introduce P1 PMIC support
Date: Sat,  2 Aug 2025 21:58:04 -0500
Message-ID: <20250803025812.373029-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_195817_977451_E47FAACB 
X-CRM114-Status: GOOD (  16.80  )
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

After a sequence of attempts to add a new "max_register" value
to the simple_mfd_data structure in a way that would hopefully
be useful, we have reverted to the solution that was originally
proposed, which simply defines a regmap_config containing that
value along with reg_bits and val_bits (both 8).

This version removes the second patch, which contained the added
code to support the simple_mfd_data->max_register field.  It
also addresses a dependency issue in patch 4 (now 3) that was
pointed out by the Intel kernel test robot.

Note:  Yixun Lan suggested privately that I ensure the I2C_K1
config option gets enabled, but I'm going to do that as a
follow-on patch.

					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pmic-v11

Between version 9 and version 10:
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


base-commit: b9ddaa95fd283bce7041550ddbbe7e764c477110
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
