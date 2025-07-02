Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712EDC83F03
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 21:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x3oUL5b2IzbzRpAnVAzn0euz+Hbbn1lGgeaDa8TyTfk=; b=ID0uytsIajfHjA
	8CetAGlxqJX7QoYhC/XpMzf7V2FoF9LSL5IQbWLEl3R0rp+HzdiwY239ancMnrsjuvKNSeSgc/pT/
	4fNThR5Dg6kd5dQrrSjfk2MBVvwEsxF+3q8BKcvUkwekBANCMfaWX/Wt9ONP0kt4bLO+Y9rtCRV8j
	GiGPZmMHFAK8tIreHeJUtv/65hWf7TJlbPwPUzeJ6M/1HZSK0fuNPRRxXJK+WI6LtXm2FhPBQ2rl0
	Xfr951ftQVFyxhPM0Eg6cczaa+66CAaFP8ZtBMfrGW82frAZPlFCklm3rPLCNGsl0AT6/xTEsesit
	JiolebkXqY6ip1FeShjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX58e-00000009bWl-3L5w;
	Wed, 02 Jul 2025 21:37:08 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX58a-00000009bVH-3uKn
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 21:37:06 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6fb0eb0f0fbso4509726d6.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 14:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751492224; x=1752097024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vCk4qTQ1xZrDDch6I+2pDpmgEt4recKLbuT/8JykNnk=;
        b=mDZ5Chk2w1nHkeZyZWbi8E5n/kwyg0OXenOnNgd9Zaz5T4Apb0gmRB+Qt5rVflAUoA
         IZUnE/SpuIwMDLvBsCQfWxTGxmi3miIYw0e+C/F/wc2tH4Sp+iHlaLwvg/p+pc0e8pnk
         LQlLN6UQ7aK/y55EYyCCRvJsXpKxx3uRPcApc+aqUVq/wZHZNXvPKCdCHR4s0h5JTPmw
         HlzQ/1P1fj7dBL0fXNi7RIbqk/V3UYM4VcArMUOZrG8rMqL0Umdy0HVMKyxYJoWnRqa/
         CmNLLR02v2Jnm2gc3MQASgFTOdyMEwcrtw2bo25vyFmy8zadbFzs+lyhyv7jLecZba5Q
         19hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751492224; x=1752097024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vCk4qTQ1xZrDDch6I+2pDpmgEt4recKLbuT/8JykNnk=;
        b=SBPSexhWci75z4cT0Y9gMPHYXphCUNHimnOqSoB9UGTnUcfmvDUiCYxNs8NbcK5l1/
         n+50Z/49XndMhC/pxQm7Pd5dgFciNMeGIZsAAu3nzI0PE9P+XYLldihzUGZsOs6BxUeF
         1RclL/1S6XFYNnOm84l3Nb0S93x7VSwguYk6kGqiMj4JgP8AejeOKD50k+BuWOes0es8
         mzkU6dl3N51jFRuunsGFhYdMjd6Q+r28EIeRmDItLyTy+hiamkdwI3C40gqVB2W+k9Le
         3yaMdhN7MmEYfXkvgRdkvcwIWxIqqloCEsg23trLGs++eTd/1qrKlSKu1dDVEjv2dBXH
         1tiw==
X-Forwarded-Encrypted: i=1; AJvYcCXuOe3ItbCFASose7ZWPZ+MOz1jE6hOqpkSnAZ5O3F9zTv6kEeIrMqsebAsxc0h2L9CvV+gI+ASE/96Dw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2LmjHBAUSl/+jEw05S/sp75HZUp5p95/BZuuzDuhQjrgjadpm
	OSb/nk24QPTufb9uSLzh358VOD6KDs7v7738VYsuzitgbhh7hYKKJa5gMKBoOtpsrIU=
X-Gm-Gg: ASbGnct4yEWV+Sqcre7XVqX2kh4xJrsIPf0RdUDIZcNydyHrhzzbnQjBvjthNwptl6B
	oVWDunFCYHIf4HMSU0NW++rn1+cUfVaA9dJOms9Ce46fKIzkQZssRDzRmHGR2dUHMUi6X8+jduU
	qmUdR+e3ZiFzMG5ZuFgaoZPt6CucmF4wDlhy9fU19oRNr5edgjitQhaSLQz7svMkYB/gYVDeB8H
	FCQg5YZT9mLZg8zjQsJ8EylLrSKoIdzEkbHwc1+E+yB1FLPM25U/iK8ZepXmh1sBKMpeRxJz/Yu
	0bLy9Z5DGMiWcTgE7u8+H3PbA1PCAbCnem0/o117vBPvGqQutg1/hqNn0kyPdsPV2sbp6Wh9AuZ
	O8TBLVGHOwpA6HqjyWld26fz7ehVmV1IGo4U=
X-Google-Smtp-Source: AGHT+IHErTJvMvE1TJ0g2EYv2CvrFgib6KyBFStvjCoRfS+zf5ffaS+AtP1I5+t4S6JkJyQfcGlk2A==
X-Received: by 2002:a05:6214:4107:b0:6fa:fc4b:8ea7 with SMTP id 6a1803df08f44-702bc4a73acmr16126856d6.21.1751492223736;
        Wed, 02 Jul 2025 14:37:03 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771bc01bsm105691746d6.40.2025.07.02.14.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 14:37:03 -0700 (PDT)
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
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/8] spacemit: introduce P1 PMIC support
Date: Wed,  2 Jul 2025 16:36:49 -0500
Message-ID: <20250702213658.545163-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_143705_205004_57886DD5 
X-CRM114-Status: GOOD (  16.22  )
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

In v6, a new patch was added to change the simple MFD driver to
allow the regmap max_register value in the simple MFD configuration.
However it also removed the option of specifying a "full" regmap
configuration, and that was not what Lee Jones actually wanted.

This version adds the max_register option, but also retains the
ability to supply a full regmap config.  (If both are specified,
the max_register value is ignored.)

					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pmic-v7

Between version 5 and version 6:
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
 drivers/mfd/simple-mfd-i2c.c                  |  27 ++-
 drivers/mfd/simple-mfd-i2c.h                  |   1 +
 drivers/regulator/Kconfig                     |  12 ++
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/spacemit-p1.c               | 157 ++++++++++++++++
 drivers/rtc/Kconfig                           |  10 ++
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-spacemit-p1.c                 | 167 ++++++++++++++++++
 13 files changed, 626 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
 create mode 100644 drivers/regulator/spacemit-p1.c
 create mode 100644 drivers/rtc/rtc-spacemit-p1.c


base-commit: 50c8770a42faf8b1c7abe93e7c114337f580a97d
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
