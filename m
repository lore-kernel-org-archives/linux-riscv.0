Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20686C71156
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 21:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K0r34IykRBHWojouGltN1WmSxSIIAfMqQyGw7vVsMdk=; b=i79TQHl2Wd53FD
	fUzg7tHmEvb10IwWObPCNy8SMedfxIY23a4JWnEoVdNJjU9j0mC++NZpeDdnjsiDR02eqVBsdXjuT
	GHO0x1PMXMzxujGC2oG4ipmsdG+iDO8lrQHHBpJ8h0hhcz3RfumbA6u+O+0SgD9TJnYV/eStkz8N4
	dmf7Ec+HjDwx+NF2XjDKf5GNfW3HSgpXwXzHmIcmMFBF6VaDThZssPlp7sigoRsWTVLhVAubIc2Ee
	UeL8uRBLOE7DNJ+CX6ECmDuzb09UzQuTMQp/PonTK7c2mDJ9pBDucF24vA1VJslwAp5KExvnSEW4D
	YBJWHY+nTQ2ZIj1zK0HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBa9-000000003vI-1k9V;
	Fri, 13 Jun 2025 21:05:01 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBX9-000000003IN-2vDn
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 21:01:57 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3ddda14b56cso8950775ab.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Jun 2025 14:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749848515; x=1750453315; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/nSScsiqRBJeianI+qHcrQDt2tXUry1jim/akdgTKzo=;
        b=rRhvwdor4r8TkDeYQSvhY2J6TYqRDCmVxAuMy+JplSVfod8QfhG5T9MoSf5P+eF6sP
         w3joZemJQPILXF2fijG2Th1a33xnbvU7rykHEGvQ0HyZ3RVN+vGphCIWRhJmS+DYHB0r
         SStfhwvX2hzoKH7XHdbZFblkMvB/loR4DR1Y2ivgTDhLvryy/y1Lw1zyp7pEKgD/Ralx
         zzTKaSx2OkH+RHcF4cLiUBpcOErEUwmCNGOQQ6u8HwEVZV2cWEZWC7IYNBrAF4wCi9/Y
         5hrh99GG/DWCqFPillVpnvfp88txU35mTP16uh3wZdu9bRortuFKey8/GSsma7C8UEZm
         k7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749848515; x=1750453315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/nSScsiqRBJeianI+qHcrQDt2tXUry1jim/akdgTKzo=;
        b=D5U4muiahOroEe2P5iPDsXpLyyuFrZ6hma9YHfh2Yqi/Oaj41IM6M9wJ+zAdMR8jWy
         g57msRVOmWyqdRIyIBQGcuPr/i0vGqbv52hchgHwvMCj9azx1j24bZuj8ViwR1dQqeu/
         l8y8d9+7vBZfWTiimzOBqKA1FOAzhtx9nfgl+GJhJqEs3LAK2PIIrKW9yJSSlOrDt199
         ncsF5Ae97cAWREeGE4V9dPsAbzhLpbSAKJyKbQ+eBC6pStnUVqKrxpPyzzgdn2HxDK5h
         k4e/vTkDzMI59jxmG/c1AnyCkve1Zo3/KBPM5nj3Dv3xX6j0L/mLg7tCojFndFQxtwZn
         OOHg==
X-Forwarded-Encrypted: i=1; AJvYcCUYFFpERBSxi52zlnHibYH47g3e1P5Gn7u+Ydu/cc7GamR72cWe68G4T7tosFqK9NFrGM64pvAy8qTK9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxjBgnNQGY+ieQCTzIcXO3PK4pwm0XLAivve4A/CLGg4bPBNamF
	DvaIGF1tCI27qWpe/IvDJvMmHZyW9t1ng0zXIAfKAqGVZaBHz4gDXVHfeF4tBRu2fDU=
X-Gm-Gg: ASbGncucj/AYFzR3bPScqdfqGVfc2FlXIOQ/21AnkgwEBniKdZbXwdbxKf4cF1Cqu6G
	+R09UtqanrJvpXJNvDDcJT4A4u7i6I1a1Wr/aRzVB79oOuB3eb2DXrJI6iAhukRNtWJZPGUo/DV
	9zZY6wA4sGGu+Q/5LKwPIfJ04Z3mt7l/s6GfgWcOAqdioRIz0utuAgIS67k4n46ATgObmYLwBJB
	PXEyHXbONVYUoC/X2DYfC5hi52clF0xCfTxpLvFrDiT5Mj610gD6Qmwd+pZ53tlhbI6ahPXuGEP
	BYLV5fN+hHPUFBMjrDzSSAmW9NiQaKYMbIbgsRsNLGvDEFl9dFSx1ALyBN0UZSvWR8/+EXUrJDI
	I14yxGKM0+xw2l5pGC9ND1312B/m2vX0=
X-Google-Smtp-Source: AGHT+IHDcIli2szJaJCMzYiSgz3vKDNO6J57pPYGeBj4TOdFPi4bGMhE8W4WUaTIJisML0Aw8vxewg==
X-Received: by 2002:a05:6e02:1a81:b0:3dc:7f3b:acb1 with SMTP id e9e14a558f8ab-3de07cc207bmr13106355ab.13.1749848514714;
        Fri, 13 Jun 2025 14:01:54 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de019b44b3sm4996315ab.10.2025.06.13.14.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 14:01:54 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] spacemit: introduce P1 PMIC and regulator support
Date: Fri, 13 Jun 2025 16:01:43 -0500
Message-ID: <20250613210150.1468845-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_140155_816748_3376DD56 
X-CRM114-Status: UNSURE (   8.02  )
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

The SpacemiT P1 is an I2C-controlled PMIC that implements six buck
converters and twelve LDOs.  It contains a load switch, ADC channels,
GPIOs, a real-time clock, and a watchdog timer.

This series introduces a multifunction driver for the P1 PMIC as well
as a driver for its regulators.

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pmic-v1

					-Alex

Alex Elder (6):
  dt-bindings: mfd: add support the SpacmiT P1 PMIC
  mfd: spacemit: add support for SpacemiT PMICs
  regulator: spacemit: support SpacemiT P1 regulators
  riscv: dts: spacemit: enable the i2c8 adapter
  riscv: dts: spacemit: define fixed regulators
  riscv: dts: spacemit: define regulator constraints

 .../devicetree/bindings/mfd/spacemit,p1.yaml  |  86 ++++++++++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 138 ++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |   7 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  11 ++
 drivers/mfd/Kconfig                           |  11 ++
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/spacemit-pmic.c                   |  91 +++++++++++
 drivers/regulator/Kconfig                     |   9 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/spacemit-p1.c               | 154 ++++++++++++++++++
 10 files changed, 509 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
 create mode 100644 drivers/mfd/spacemit-pmic.c
 create mode 100644 drivers/regulator/spacemit-p1.c


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
