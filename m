Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94F4CA0FE7
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 19:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VSYq4be5q4qU080bPC/hazl9I/RTG6ozzjIuOb9/4AA=; b=XeprALfPAHDauS
	coq2j7ujrXB9DUVlnJo1E6vnMaACxIYg+AEaH9A2ooBQ8xEhUk0/iXYGwGOxbY0TTP9ewdAniXO92
	IfeiPzRCLspElcMFyBOQChySbOuMdFKxsqQTmA2DXAiGr7nXStXO+NQMSMY+kbJZcDfed1XoTstH3
	rgA02Vy/JYAqky2h/ck71XKLNgL/02goW8myiPdAWcTU1UZq3uj++YEXgjeyxGtFlvRmfAU5gkCYX
	hEHSQxF4hUb0SEvly51wqgugn/rqpw6jj/61buADGZ1iiEPHbDafuf/EgOVqkEeXH7e0qpuRoEcwz
	LaGhEWN1+xarnm4pCjgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqcYQ-00000009B9h-1pAh;
	Mon, 25 Aug 2025 19:08:30 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqasR-00000008orD-3Utm
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 17:21:05 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-8844ee2cb61so124348339f.2
        for <linux-riscv@lists.infradead.org>; Mon, 25 Aug 2025 10:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1756142463; x=1756747263; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CDRNDuzfDsv2nazycUSggd95+r+QXZLBa3yNf0OnFtg=;
        b=MeQErKXbRYX8aD/c4ReiswUxz+rsisZLWuZUX/fatJES98DyAsBHCVhyUrjxs3evCv
         uzhFxNKDikmJsh6pKHsdMh84nxsA9FQS6Q/4FUKnn6hHZ/d75xwox6c0mqNVJA50bCoQ
         3wuyE3sWtPOSwENr89t2iSXK+U2NhxaEFxlV8NAF/E+T+hufVf+/I5GVMaETePBRQ4X9
         979LPTCYPJnVASPJ1fgqThNcc5Lx9KJC4TJdxPlRbR6WxUUCUq3X5NT1UPM6LYsdr3KE
         3zpINUlN9U0gMD+jJKc87Ah7ohtspzOGOrvaWue1XyUaqgKOr6Sy4UBqMSZbUDLttCG3
         Y5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756142463; x=1756747263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CDRNDuzfDsv2nazycUSggd95+r+QXZLBa3yNf0OnFtg=;
        b=ih54OE1KrAmwP4r90lvFd57jasif/TAvpw5CE8alUihZMvzNmSUjMah0AoU8A821YQ
         z9TolbEYyy6zMmuUDaJhpgmVwIZae5XncLGqz7QhjnbhHPMnqfo5Zf/1FNv0tZqcTpJV
         DJ9ykuXiL88O1XDtRR1W0S2hbCntHXAO0N//Rhg+oOi2iUip8l05cWlbZbZpJhFHQciR
         9IcVlZa/yLdy1EUIrER5xyN+77ewGRcrGLgbwx+j4YsBiEMs7hLrfVX0DtgVDasnWaEq
         77J+X41Z3PtSKwvdTpIp1m9LJmUVcFKxoG6xPQVqIE9gCbheBI4xVc8k5zuSzIpemWq6
         lYTw==
X-Forwarded-Encrypted: i=1; AJvYcCXCzMXnQcRV9vHRVriCOFBNKzY+TCiHx2kw2dE8hy6D2/gBo/PJcD1X4r4iqTllsi411jlM7ZaWrMA/BQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyvUOkiHPuBD711hQA16zcW2smsROc6kYq5P1ZKb0WBbfg3/EzM
	kqgPGisy/QY7ZLkhp1b44hVrWp2sGTl/KEkyav3Em8MAJl7T3UT+VFOOXTogkjeJPdQ=
X-Gm-Gg: ASbGnct7hrp+qDzq6evF0nnFSLOmqQ3se1+suDBGC/YiOtsafOmR9LFo4Bz5nT/Sh6M
	CPh0wSS8D0bAHHF1d0fSnin95iWPhNdNOwHvTVr8+rT7D0nj/dWnCMOuWbpYc59XreV/7CKsb6h
	D2gAr3d2fufliMBJNbWDvkvDDgZZD7hoPyAJf4gEr6otnUserqyOulTjcE5ZWtckW0qcFXzxImw
	0v8RSUpLd88AUI7dVBFAZ3krgYQXvEO9FoPA3Z8oNdpet/bt3VF+BsTheg2qyh7AnnBkzaHDCGm
	A+GNhvr28SSjhpd30svnQ3hL4NGxaXWnm10ax0PDygVKzhXgNG6qxps6Wf3wM6npKwqqkP2aX83
	GvPsCnsieezE2ZkUE/QR4lShJCUREXXQd6dUfYYad9xRSt/Z7RclOokFdM8QrD5UfVA==
X-Google-Smtp-Source: AGHT+IGEzPSBz+bPlXOat9c0EsPU9K3GuEWngl1Fa2CoYcKOTcciz21i7xthvFdDRasSvDgUl27o7w==
X-Received: by 2002:a05:6602:6d1b:b0:881:659f:cd59 with SMTP id ca18e2360f4ac-886bd1313a9mr2196495139f.5.1756142462660;
        Mon, 25 Aug 2025 10:21:02 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-886e60c4737sm76275439f.26.2025.08.25.10.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 10:21:02 -0700 (PDT)
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
Subject: [PATCH v13 0/7] spacemit: introduce P1 PMIC support
Date: Mon, 25 Aug 2025 12:20:49 -0500
Message-ID: <20250825172057.163883-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_102104_111002_1B4C9CD9 
X-CRM114-Status: GOOD (  16.08  )
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

In this version I updated Troy Mitchell's e-mail address, and
modified the definition of the MFD_SPACEMIT_P1 config option so
it enables I2C_K1, to allow it to be usable.  The series is now
based on net-next rather than linux-v6.17-rc1.

					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pmic-v13

Between version 12 and version 13:
  - Rebased onto August 25 linux-next
  - Updated Troy Mitchell's e-mail address in patch 1
  - Add Troy Mitchell's Acked-by in patch 1
  - In patch 2, have MFD_SPACEMIT_P1 select I2C_K1 and depend on
    ARCH_SPACEMIT as suggested (privately) by Yixun Lan

Here is version 12 of this series:
  https://lore.kernel.org/lkml/20250813024509.2325988-1-elder@riscstar.com/

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
 drivers/mfd/Kconfig                           |  13 ++
 drivers/mfd/simple-mfd-i2c.c                  |  17 ++
 drivers/regulator/Kconfig                     |  13 ++
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/spacemit-p1.c               | 157 ++++++++++++++++
 drivers/rtc/Kconfig                           |  10 ++
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-spacemit-p1.c                 | 167 ++++++++++++++++++
 12 files changed, 620 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
 create mode 100644 drivers/regulator/spacemit-p1.c
 create mode 100644 drivers/rtc/rtc-spacemit-p1.c


base-commit: 6c68f4c0a147c025ae0b25fab688c7c47964a02f
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
