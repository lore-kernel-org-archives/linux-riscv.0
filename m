Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEB0C83F1A
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 19:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5cU7UHr9isxG7n9uhQJUqk1sXuFAVdUV4wm3PTVe8Yo=; b=kZUzt0nWF1Q0Ul
	yd5FhKW6Q3Bozfyjejvhyx7lPsAg71bTJDQmJsHuGiSb5+IUpO7DM05n6XSKC4nhRtLZjnNb/4fBQ
	lWsHPL9hiizSlr3Z9R3RSkiMq8TYWFXS0uvmZWPEsRg4Af/qSUnww8f3RqXmjhQxSe+2m69mxPTfY
	60yvBCErnu1FhYRkNsIiVx+VWXL5sIpSdlKPujjL4vZNIGGWshK9BE1QcbsCJD2bGH1emL15CE/1n
	inoldjMJw3zq6CpScN6wgBi01/KFzWJ+gj/uF/oFci/r6PgvEBNJy4iLEB5aADRoQo02Y0bdUDu7A
	eYdip7NHwTd49aiyiHJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxAM-0000000CqBA-3RD6;
	Thu, 10 Jul 2025 19:42:46 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvQO-0000000CdM0-1B0d
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 17:51:15 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4a43d2d5569so15516161cf.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Jul 2025 10:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1752169871; x=1752774671; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JNMqoqzDLeOgTO7xvZUUvwlywxm/pgloUgJcLaLBW1w=;
        b=Tx7x/xnIPfQ0Ncl6XWWKzv5z0iKdZGaPJfCA2Ff9laf7ReNVyJ2SMvKGd8VkJwcY8h
         sFQXk4tYd07TB+PNcuMXnOkZh/Nwc+rvkGw/z13w6HiXvvwElzEmSe7W4uwjpGOa7Kyb
         V1rFdYXsyDY8xHP/IkiSFdNeZPqOLxS9+UV8sx+9jkQ2y7J0VjSwNs5nrOYeMF7Ogsz6
         Hk+Wjf0TX3QnwhKYjH0IypR+4kN3p79lOKdZuQ1GF/y4UF7mURiDICXiAYJYs/H864uI
         CpzjaWJZsmPvDgpHvB52QDOIF0ONbjs3P7hotNCf8FEPLNxlBwMMx/QEMg7goyFmDxLG
         gAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169871; x=1752774671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JNMqoqzDLeOgTO7xvZUUvwlywxm/pgloUgJcLaLBW1w=;
        b=Vmrwr3kVr3M03/PFP7gomrY1VXs5Vs7RN+/Cf/LM3Wefd+kjlCDePhXwTsCVsYCaAs
         nBVvV2O6Tve/8a8Wh2Vm5aURMHsA/XlS1/nam/0kKOP6GIH/Ta/wr9ZSYD7DAxg+GmHl
         b5aw6KrrEiqefYuw4tkuW6DU6sIfOJsRdJnAvHJTZRQLK9wWrtpkoaGN0N18pXn4UexE
         fPAqCXsbx02+Kro/E7jQn0NHHaiZH9dq0I5wmqU4U0DBBaXW1oUjgp4dYPNoobCsHGg5
         WfgdFZNbjPo5ApJPF1Xhr1rESJdLd1DRAWlRTOI61HBt0ajQCpa5qxYprHqTet7COrZM
         D+Ig==
X-Forwarded-Encrypted: i=1; AJvYcCXQQ9dpsTe8rHo2tnHSFwPn+vAs+OJTiD66cibssGOvRHoW2JkMThPjGjj4E9lUr5gPcm1QXqw2EDOHHQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2u+BGXHP+SmDUSe4B4Iu7b6V5rbcILruDTqOXThvWyqMUTy4Y
	vk2TSPKkudKlmYzOtgZtl3D6TFR+/cRCbiGfgbtk3KSQQssYMlNbMmBBN6fQ3pRKmGY=
X-Gm-Gg: ASbGncubTCRFTcJ6M4TnzXLfVGzj/pkVr5GbKmnDPTZiHmt+BqCLYpgJSOs1EFaW+GW
	nCgBV+eanCiLKYUmzqtrmmWypogsJSdtYwECIziXQupbuTGzrrHc9/6DlfobnKq7wwuCleIWpjA
	M/CPu5lhOQKE5gu19gC75SFkkzUq4sVBNBoLgU6GIW/3pfX4SIQR/V8DCOz9phcJD0bCwwCueBI
	oyVuQknv1dkaxr+xJwDtlfSZYDa9BIbmfhX8eserLs3ykWDfEb9jZkUVBBIHORoLRAVG7ldO4IH
	oBmTh5y++ezfHUTfhvYMquTpyUDx41vDmyvAzlvgMUmShBeafSduGUKcjiJSInLJNR4grqNxqyk
	Rmz+nDVQ3QdqLzYcM/EFTZx4Q6DUXkjlBL5M=
X-Google-Smtp-Source: AGHT+IFI/jmo2fMFePpFAuOhqVGzgvVfNMFnzvNUuKjn8MCsLC2IQtc9MHCE70TXETEly/c6N52yZg==
X-Received: by 2002:a05:622a:28e:b0:477:c04:b512 with SMTP id d75a77b69052e-4a9fb89853amr5290841cf.16.1752169870948;
        Thu, 10 Jul 2025 10:51:10 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee300sm11165941cf.73.2025.07.10.10.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:51:10 -0700 (PDT)
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
Subject: [PATCH v8 0/8] spacemit: introduce P1 PMIC support
Date: Thu, 10 Jul 2025 12:50:58 -0500
Message-ID: <20250710175107.1280221-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_105113_200427_57F8497B 
X-CRM114-Status: GOOD (  17.04  )
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

Version 7 provided the ability in "simple-mfd-i2c.c" to specify the
max_register value for the regmap configuration as an alternative
to providing a "full" regmap structure.  The max_register value is
ignored if a regmap_config is also supplied in simple_mfd_data.

Lee Jones felt the logic in v7 was more complex than it needed to
be, and suggested removing the const qualifier from the global
regmap_config structure used by default.

This version does what Lee suggested, and the logic is indeed
simpler.  However in order to avoid compile warnings the const
qualifier was removed from other places as well.  (Checkpatch
even complains about this.)

Frankly I think my original solution--which simply used the
existing ability to provide a regmap_config structure--was the
best (version 5 of the series is done this way).  I don't think
adding simple_mfd_data->max_register provides real benefit.
  https://lore.kernel.org/lkml/20250625164119.1068842-1-elder@riscstar.com/

					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pmic-v8

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
 drivers/mfd/simple-mfd-i2c.c                  |  20 ++-
 drivers/mfd/simple-mfd-i2c.h                  |   3 +-
 drivers/regulator/Kconfig                     |  12 ++
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/spacemit-p1.c               | 157 ++++++++++++++++
 drivers/rtc/Kconfig                           |  10 ++
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-spacemit-p1.c                 | 167 ++++++++++++++++++
 13 files changed, 621 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
 create mode 100644 drivers/regulator/spacemit-p1.c
 create mode 100644 drivers/rtc/rtc-spacemit-p1.c


base-commit: b551c4e2a98a177a06148cf16505643cd2108386
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
