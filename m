Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446B5C87FCA
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Jul 2025 13:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qttkuEvqsEPrS78p1frWosEcaN4Vaw3UTvGRI+LbzT4=; b=Ks13LHJC6uy2bz
	Tk4YHZIwj7f2XVpJYVr8dtDiEdR4v2lCmjLhtrh+Vze6LucLLm0ic4rqyVgznrCb+uOsRjDn4z1/8
	1SbbbER/+DUJpAuhhSyI+PRrgCw8rE7XRLD+SbFjtrRqw0C3A4NehCvMEU+2W1G6KwwrT2JyCA40h
	pwHp8szyyefkqCaKBQTwmgksQkgk2Niwf8aJ5kDIfqNs5L89B19OmU8/bGyClRWi/gcvkV0V1gTmz
	+RusQ1wSMCIwdXXNEeLCfy2g8GyM3q8i/pgCOmKO28mHQ+fpD4v8QCIlfawotiGXhkpDjjrVrRe0/
	gd/AkkoqeryBHVlc5PGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufefF-0000000BU6R-31Oq;
	Sat, 26 Jul 2025 13:10:13 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufefB-0000000BU5N-2Zlf
	for linux-riscv@lists.infradead.org;
	Sat, 26 Jul 2025 13:10:12 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-879399faac9so216766839f.3
        for <linux-riscv@lists.infradead.org>; Sat, 26 Jul 2025 06:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753535408; x=1754140208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MYc/mcd7ReJMM0Lef/+R1Ouv9sDF5M6QV2+DoYGQnmU=;
        b=TfnqQNvdsd4AAbXAr4r6j3vituaFsaBwXeRoqrSzj2bThB0DemaMHwccxUDIkh7/hR
         tbZ2M891yqOm2UoEGCu+Tla6DUb+Rpkh6NgY1o8juJwKsUZUfVuSlNcJl2pWYT+oD4TD
         c/JcFp8dgorVPiOc00dKmZAapQByPZ5ni3eJLxGrIkx+XS5Gh+h6DfQUDC8guj14GDXd
         IsvwTsrwr/t6vtA1PvVf2zkmaqT7h0r2Djq6dRYF5e47rPB344MfY98DSw3ZZcN+kqbC
         XpDHlt/ZvJ8Jh9chpwymR28xpHva3T5xhru+xc+qvQLen+YecOuNsCZVU+B54RLHjSDD
         5DUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753535408; x=1754140208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYc/mcd7ReJMM0Lef/+R1Ouv9sDF5M6QV2+DoYGQnmU=;
        b=Cs2xXBqar/rp2OEnZ68VLmVb98NaOnswsadFPKZw2fo8rBzzDUYCVAeSRZOxvPHnq5
         29PMUIab5hOOqOf9omTifIX6AmdSOGwZ+gKFL1Awz3wdZqNvsQDtZLquBijJWQZncPvA
         jjlI1G8jLV/Qr3WzCUTPmtlJwoEqsJ94mWkFmEGFd44lqX/0TRVJ7SHf0mjWJpMfE7+A
         KJtJHuyWFMs5givxv+wmb1DikgeXh5C05DHYZEnNr9nCl9bE24+Io2EY5OyRkcx2vQaG
         8oQQxXgHUUo8z/ZW1JtfHqK2f03ZeDlrxyToYWA/nAHRUdGueQhRTe7UI89ohg2V5xa8
         JcSg==
X-Forwarded-Encrypted: i=1; AJvYcCXBO0AiFfxWdJ0DjtY2SnBWQshYeP5A1b1yMlnqWHB5S6FdBrCzY5iA9LhHYn3qMYpgu9/LtDCnjDd8eg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzC7LSCVXhqHsyFhehBGl5ROl8e21lmECB6mJgMUyMYskuqukXr
	xbF7cDI52/jNUeYj1XmeZloX9wGO9jFijgETPxa7cM5A4EFy8b/a32gQK+kAkv8Sao0=
X-Gm-Gg: ASbGncut9OHRPAikq6l39BrTD08YnPnjnfGLVkDSIMyXhLZ8qSD+fR+Yp01TLxRIWJM
	sd4qYhryvIuKosEj8vx0AOM/E7BEsvsWgc0QzQImvyRPLUnVcb3FXl4iePeFcnNU41+VyMy7GRa
	NxuvEBlXTy+P5hweKcdmC0pP0N+waUTL9IcGx0746Yp6RXpOA8VLyoD+D+4txG6WUO6JhYOdbCq
	sE098tveknbfmYytuWTXlTLzusC9RXGh3/h4F4tKimLV9pdkDCeuYILZ3k4SBw+rgEi2LBlBrqd
	s4U01CRdA4Ln3gh8pLPyHcH/mv9qQEF9+DU+mn3S2BFruWPBll3uIxgeG868xrHrewS7MKgAXZy
	dzE8WlwXpAeMT3VgciKLX/aamrwwA3laxPfD4uDLkwQ05U7E9TvV7gsax/0Iv3D4TPw==
X-Google-Smtp-Source: AGHT+IEVMqsRYx/eZWJrDGuA6CkNio+e8WgeHMt6w0uQJD0Qdm/zWA6Cch8r5o09n+huHNyuFFJcMQ==
X-Received: by 2002:a05:6602:2c85:b0:87c:4609:d10a with SMTP id ca18e2360f4ac-88022aa5b32mr1018565339f.9.1753535408253;
        Sat, 26 Jul 2025 06:10:08 -0700 (PDT)
Received: from zippy.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-880f7a4ee9fsm49551439f.33.2025.07.26.06.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 06:10:07 -0700 (PDT)
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
Subject: [PATCH v10 0/8] spacemit: introduce P1 PMIC support
Date: Sat, 26 Jul 2025 08:09:54 -0500
Message-ID: <20250726131003.3137282-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_061009_892539_FF2B71CE 
X-CRM114-Status: GOOD (  14.08  )
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

This version makes a few minor changes to DTS files suggested by
Yixun Lan.  It also reworks the function that determines the
regmap_config structure to use, and adds a function that frees
that structure when it's no longer needed (if it was dynamically
allocated).

					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pmic-v10

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
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 135 ++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |   7 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  13 ++
 drivers/mfd/Kconfig                           |  11 ++
 drivers/mfd/simple-mfd-i2c.c                  |  57 +++++-
 drivers/mfd/simple-mfd-i2c.h                  |   5 +-
 drivers/regulator/Kconfig                     |  12 ++
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/spacemit-p1.c               | 157 ++++++++++++++++
 drivers/rtc/Kconfig                           |  10 ++
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-spacemit-p1.c                 | 167 ++++++++++++++++++
 13 files changed, 653 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
 create mode 100644 drivers/regulator/spacemit-p1.c
 create mode 100644 drivers/rtc/rtc-spacemit-p1.c


base-commit: d7af19298454ed155f5cf67201a70f5cf836c842
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
