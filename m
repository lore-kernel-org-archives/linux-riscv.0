Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E69ECD4F24
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 07:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EgR0RTJmw15RSP9of3kxMzXY+1/6uPXsmtloMp8lL/E=; b=z2Bhq81bZFfVg4
	nCJoqvK/HfHWm/LDhesu1TY3pYxwzz3ZXm10EgGzAlDCwobdDxaQRyO1n8VFeUlml7HwZ6sbtz9jX
	lsk3XFsqZ3iQaxq77C0rdQI1w4+93HLNL+crJAUa5G/Vxhk3ZLbLpI+8Gd4SrXSchnzNhYFqAZ5Xa
	jyH8ex21lMswaSZxbVRb34RwjqjNLQvds5JTrBzCatgzjjIgE52G4+aKUCHm58ggNAib6GbufKX9Y
	zZLcigayZKM/JzyteOu97dMOutWqM9ti6PoMyyf8VxpL2++aRtqcAtCfUNtisY1LTR9d1qyxHwxM7
	GBwRZaSYtrKSU79/B/Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN3t0-00000001Xkv-0yGT;
	Wed, 13 May 2026 07:20:07 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN3sx-00000001XjU-0b0E
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 07:20:04 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso73086225e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 00:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778656801; x=1779261601; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EKJgblmvlEcKiYekKnfozYVRzdG1dmcVyVFAo6SuTOg=;
        b=HNbn+Ad61PlK1/mfAMRQZHPujmfdFcH6FsIUx7OmqvVaXSYXu+sFHUnE86kBijATFE
         kY8YYUIGujk3QYMJEajklq94zayAVq0UOtpUOHrFBCxaEXasLh68i8gKEuqF/6czvkdG
         FxpSnFT46etiMMk8xlFi+VXcR6W+CAZldgwHRRDIdKuNJjs/ZCWspP15Vf84i5R+l0eh
         s4MLnoGEXlTcT0HFWOyoKoAgBxurV9/VKLVoaxiAsFpu44IvsmODqryji/3EC3Evbptv
         rF8Qchu7c2cSziXovDH4zPk+vxDi0hbSZe8t2JEEOk8a3i9LSvVIP8lBe+qZCfr5GGQV
         vMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778656801; x=1779261601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKJgblmvlEcKiYekKnfozYVRzdG1dmcVyVFAo6SuTOg=;
        b=J4zAZYvk7GWZWUt4irLcrubsjuMpoS+YO3rLVO53kbxminOyL9IbUJeEMnfnGI3aoz
         SPlZU7t7F4z5Zz+3vo8WP5TbVXqfr5JqnG0mD31zZ+dDP40djsIrtQmPp73d5hhSPw3D
         Bq9PVjDEKMbKjlfhPYUzBUSuNKr3P4Jz1bNrBP8iIR9CVwUlizytXp8HmsGuGrmhu/I2
         uD1/J4F0huS7NpavoFeam2rATRGQxbLZpStVoQXr0onzH7POOIFxndQSeUnrjBUmnjWJ
         /IqSQ/F2gzAbY6SskWvDKlCFv+FElaIUz35d9k4laTkwUH9CC6y+/DruVWVKTXpV/y8S
         0iwg==
X-Gm-Message-State: AOJu0YyJQVkoPgSe7tMLzQZ4h2C1yOl6529NU18mzAQ10QRM1dUnZx1O
	okKJ0+OAuxxPY5C1Bjig3e0LLrQ9ZljaInPBOt15/i7vsKAoyhJB7hbt
X-Gm-Gg: Acq92OGLyNxD5x91vqYde9VONn2L/Dm0WXeu8w4holL/X6RsoLIthWQeSuPXYYqaJKJ
	+cF0CbN5aKZuAyLzVJYKH5Nwy37Ll8SQpYDJq8EiaK3r0TZvT++7XDRuomboYYscLEJd/2Ijlk3
	yylew8hCWhZwRJRCS8rOtxb7lf29hjKwa20QJf+aWeZvSTLgmjPYZmFppwKfsKy0twZK4Jv7Uby
	0PgOTO/BeFqifafO7tPpxO9qKUPA9LVh90jJl7f++XsQ1nhAih3TQncctSNC3ZMJjg2B8qLs4Kq
	Y/Bo6eJ2fG9UM6K1ribUGmxQbrN4PK9CfhEd7oM7IVH3RoUqFpLzYJTvBwp+58hL9liARyhh0kq
	8SzTgmVkBGsFhyHV237XZZaZQdbt0iLM4WlkOtrpx6Yqjb00igtDxz0aVUI21R37GtQCVkE0/KE
	ol7zhNzglAciuDLfedFAnmoPnbW7kvE0aJAI8VGmGJuRkXDTvbJez8PtDSwHtR4r925Q==
X-Received: by 2002:a05:600c:3f0f:b0:488:a2ac:a334 with SMTP id 5b1f17b1804b1-48fce99d7e5mr18903665e9.3.1778656800876;
        Wed, 13 May 2026 00:20:00 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d62422sm58498115e9.11.2026.05.13.00.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:20:00 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH v3 0/6] spacemit: k1-musepi-pro: add missing devices
Date: Wed, 13 May 2026 09:19:48 +0200
Message-ID: <20260513071958.29574-1-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_002003_214294_5F8EE709 
X-CRM114-Status: UNSURE (   6.63  )
X-CRM114-Notice: Please train this message.
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

Add the missing devices with their required regulators. The regulators are named after
their label in the vendor schematics[0].

v3:
- drop reg_usb_vbus, non-controllable and served only as vin-supply
- fixed regulator-vcc-4v0 typo
- fold addition of pmic regulator labels into the pmic patch
- eeprom is a GT24C02B, fixed commit message
- added reg_qspi_vcc1v833
- fixed uboot nor name offset
- add missing "reg_" prefix for reg_pcie_vcc_3v3
- drop pcie{1,2}'s vpcie3v3-supply, it's already specified on the root ports

v2:
- drop reg_vcc_5v0_sys as per "non-controllable" review comments on
  similar patches for other boards (kept the root reg_usb_vbus for though)
- add reg_vcc_4v0 instead as p1 vin?-supply, misread the schematics
- drop mpcie_vcc_3v3 and use pcie_vcc_3v3 for pcie2* too
  ("non-controllable" again)
- all of the above makes it consistent with other k1 boards

v1: https://lore.kernel.org/spacemit/20260505160623.1369347-1-a.heider@gmail.com/T/#t

$ cat /sys/kernel/debug/regulator/regulator_summary
 regulator                      use open bypass  opmode voltage current     min     max
---------------------------------------------------------------------------------------
 regulator-dummy                  1    0      0 unknown     0mV     0mA     0mV     0mV
 PCIE_VCC3V3                      5    4      0 unknown  3300mV     0mA  3300mV  3300mV
    ca400000.pcie:pcie@0-vpcie3v3   1                                 0mA     0mV     0mV
    ca800000.pcie:pcie@0-vpcie3v3   1                                 0mA     0mV     0mV
    ca800000.pcie-vpcie3v3        1                                 0mA     0mV     0mV
    ca400000.pcie-vpcie3v3        1                                 0mA     0mV     0mV
 VCC4V0                           8   10      0 unknown  4000mV     0mA  4000mV  4000mV
    buck1                         1    0      0 unknown  1050mV     0mA   500mV  3450mV
    buck2                         1    0      0 unknown   900mV     0mA   500mV  3450mV
    buck3                         1    1      0 unknown  1800mV     0mA   500mV  1800mV
       2-0050-vcc                 0                                 0mA     0mV     0mV
    buck4                         2    2      0 unknown  3300mV     0mA   500mV  3300mV
       d4280000.mmc-vmmc          0                                 0mA  3300mV  3300mV
       QSPI_VCC1833               2    1      0 unknown  1833mV     0mA  1833mV  1833mV
          spi0.0-vcc              1                                 0mA     0mV     0mV
    buck5                         3    7      0 unknown  2100mV     0mA   500mV  3450mV
       dldo1                      0    0      0 unknown  1200mV     0mA   500mV  3400mV
       dldo2                      0    0      0 unknown   500mV     0mA   500mV  3400mV
       dldo3                      0    0      0 unknown   500mV     0mA   500mV  3400mV
       dldo4                      1    0      0 unknown  1800mV     0mA   500mV  3400mV
       dldo5                      0    0      0 unknown   500mV     0mA   500mV  3400mV
       dldo6                      1    0      0 unknown  1800mV     0mA   500mV  3400mV
       dldo7                      0    0      0 unknown   500mV     0mA   500mV  3400mV
    buck6                         1    0      0 unknown  1100mV     0mA   500mV  3450mV
    aldo1                         1    1      0 unknown  3300mV     0mA   500mV  3400mV
       d4280000.mmc-vqmmc         1                                 0mA     0mV     0mV
    aldo2                         0    0      0 unknown   500mV     0mA   500mV  3400mV
    aldo3                         0    0      0 unknown   500mV     0mA   500mV  3400mV
    aldo4                         0    0      0 unknown   500mV     0mA   500mV  3400mV
 5V_VBUS                          2    1      0 unknown  5000mV     0mA  5000mV  5000mV
    c0a00000.usb-vbus             1                                 0mA     0mV     0mV
 VCC5V0_HUB                       2    1      0 unknown  5000mV     0mA  5000mV  5000mV
    c0a00000.usb:hub@1-vdd        1                                 0mA     0mV     0mV

[0] https://github.com/spacemit-com/docs-product/blob/main/en/k1_muse_pi_pro/pi_pro_hw.md

Andre Heider (6):
  riscv: dts: spacemit: k1-musepi-pro: add PMIC and power infrastructure
  riscv: dts: spacemit: k1-musepi-pro: add 24c02 eeprom
  riscv: dts: spacemit: k1-musepi-pro: enable QSPI and add SPI NOR
  riscv: dts: spacemit: k1-musepi-pro: enable USB 3 ports
  riscv: dts: spacemit: k1-musepi-pro: enable PCIe ports
  riscv: dts: spacemit: k1-musepi-pro: set default console baud rate

 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 309 +++++++++++++++++-
 1 file changed, 308 insertions(+), 1 deletion(-)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
