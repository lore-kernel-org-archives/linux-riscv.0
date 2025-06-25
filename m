Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6208C7EE32
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 20:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AL8d1vn2ApcUs2o3YkWkpl8Yp0NP6wbXuZqtkzuMTa0=; b=SKEbbYyfop8w++
	s3xk1qSZYze89fTucyylAvtWNJBH90ccC5Xbes8viU2ex4cGM8wy2FgqdRWb2RWn/NL/AGukHI5fz
	FVWYWn/00BMgWaFeIt4V1xLnxS95U117USCLrsOD7kYTYA3bowvY65Fg3SBgvHGUIGU73FBDkKYHt
	GzfifPMgREdS6kmPEgVqczjBUhAkD2QejxPJ/d7o0EPd35MlAdrYb7ea4VuMs6V2waIQ/LxQhpWV8
	KCswHcRsua8QkR0it28IjNQOZuOeMTI0v2m7hshNOkDV46q40xMI1t12skLsUpP9lTUIjhOukhUev
	XsPzRhqeCJGfiRCeAxhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWpX-00000009qyI-0rn4;
	Wed, 25 Jun 2025 20:34:51 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUTBe-00000009Ktm-32Ez
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 16:41:28 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7d38d562a55so5083785a.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jun 2025 09:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750869683; x=1751474483; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tDCKEZvvy/u8mP8K+Ymdr+bMEt+s7GIZAgO/5a0i/oc=;
        b=N5jLESoGxSMWnfAKRJq7PxFgXaMrq0OtSWO0L6qsNsMc7WwphsOFuc5Y/rKbP+a26c
         WyNxQdAssEPCTjow3S1sqFFJhMY74WdH84NKrpYBLQKh9YOeT4RBjfOjIAl0sWcmhxSZ
         O9c8f5z+61YxbzaAwu4rBfpg/ZFTGXNd+8oMPPLY1gH3YTAETcC4h2vvJUji3MB1WzY4
         Zo/qGAAWjtFD2OgqFb9R7wmLNrj1epeRH3P4UCK73AUWtpRoKhWaY+KTsYMmgFRew+94
         7vHgr8uu1zriwTTZGs954HTrrLYb7ONuB3BgqaSIRtExhAt6RyBOj6my9qR9MWbhaYBn
         O9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750869683; x=1751474483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tDCKEZvvy/u8mP8K+Ymdr+bMEt+s7GIZAgO/5a0i/oc=;
        b=QmQueDqNgLGVlqwVs8fe7FtHC1u7fBxJFLcHxpQ9r/tijlFTaoZdc3L7f1ZBPCuFjI
         xd5vxCmiO1ObgP49pbfAHd0jBI7ssFVa/Q3a3Osbz1V9gHktJVUm+tidy/guBVEn2kHB
         blzwo2s+qfOe/JgGnRKA1QihL5W4rIOH0Hw0ir6Hw/rbRdl9S8N/cL4c2XzA9ZIYklqv
         pZRQDwpPFyzY5AGGRbszLr/f3Gham7zdSPha/PRkMFfl2kImUKSl9WnDJ5Cob/KpMo6s
         VorgYnVnEfKvY61VFKG89CJQcRp1N2FE8RGuBITqcqd3grLwcZ3Nm9sILPYSbzMt164m
         onWw==
X-Forwarded-Encrypted: i=1; AJvYcCWJfi7CZ7Y2Al2c9qq5a+gUja2/xqcRVFgoiQDqaSRTeNpP96nhggiIQtELjLsr+pw4igE+nKk+u4ZRqA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7cfRMb6vCwnCXfaVnPHxvISZ1JG0liER9z1zMTo2xj500WvD3
	cjZDrb3AP+3C0mpy4lhn36PypnIjOQBtw3KvSTciAz82AZtcOX+8Fs2b5XiP77zRVPo=
X-Gm-Gg: ASbGncvd8rgCtXQ5S+XqvkCqPC562WyCYHsaVW/sa6mXeHtjulEp7e7IrGAPKHpjqK3
	GggWHjr+RfY3scuFdYrCw+MxgQ/uCQ8wS1lfe21Nov6NA7t+XfeUjbLv6SJqlhjIaw8EWaGki20
	5nA4xgXUOzTW3iGrU+1+EPr+o77Gi3YOlooaSlwxM7jFyl2bGAqmdjZN3Io3egks/ODF6mPAMOA
	7WjKYL0MgDdPY+EhOHDmjKzug9rCtf44yIQGQ+hNTLfC7k1D/izC1I+GjvfSFGdBoVQIyZBNGM8
	bfnoR8aFYezIJS2P6yCtwD04r5toTy3pt0WFGpsl1TnrOPbRsTFo/WtRtgb9godJee+SYzfs21w
	UEqgfTL4mIQuqphnEQpKjioxKokXAs9n2CQzR1UQtWFCCQw==
X-Google-Smtp-Source: AGHT+IF0qAzBR+5ebXXveqzmLr/2w4QQCNXjecbTJ4SgCA/yOFBNe+rVWxWjr5FO7bLbStXLn3XERQ==
X-Received: by 2002:a05:620a:40cb:b0:7d3:f1ff:5bac with SMTP id af79cd13be357-7d42972ce65mr495536885a.27.1750869683376;
        Wed, 25 Jun 2025 09:41:23 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3ffdb190esm576783085a.86.2025.06.25.09.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:41:23 -0700 (PDT)
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
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/7] spacemit: introduce P1 PMIC support
Date: Wed, 25 Jun 2025 11:41:11 -0500
Message-ID: <20250625164119.1068842-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_094126_773206_424A6177 
X-CRM114-Status: GOOD (  18.56  )
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

This version primarily updates the RTC code (in patch 4) based on
review feedback.  It also adds adds a dependency in patch 2, to
ensure the MFD_SIMPLE_MFD_I2C dependencies are met when selected.

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pmic-v4

					-Alex
Between version 3 and version 4:
  - I got confirmation from SpacemiT that the RTC hardware does not
    implement the "latch" of registers as documented, and updated the
    RTC code accordingly (looping on read)
  - The RTC set_time() callback now returns an error value if one is
    reported when a regmap write re-enables the RTC
  - Renamed the RTC Kconfig option to be RTC_DRV_SPACEMIT_P1
  - Renamed the RTC source file be "rtc-spacemit-p1.c"
  - Replaced an RTC enumerated type with simple numeric indices
  - A message is no longer reported when devm_rtc_register_device()
    returns an error in the RTC driver
  - CONFIG_MFD_SPACEMIT_P1 now depends on I2C, to avoid a build error
        
Here is version 3 of this series:
  https://lore.kernel.org/linux-rtc/20250622032941.3768912-2-elder@riscstar.com/

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

 .../devicetree/bindings/mfd/spacemit,p1.yaml  |  86 +++++++++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 138 ++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |   7 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  11 ++
 drivers/mfd/Kconfig                           |  11 ++
 drivers/mfd/simple-mfd-i2c.c                  |  18 ++
 drivers/regulator/Kconfig                     |  12 ++
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/spacemit-p1.c               | 157 ++++++++++++++++
 drivers/rtc/Kconfig                           |  10 ++
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-spacemit-p1.c                 | 169 ++++++++++++++++++
 12 files changed, 621 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
 create mode 100644 drivers/regulator/spacemit-p1.c
 create mode 100644 drivers/rtc/rtc-spacemit-p1.c


base-commit: 1b152eeca84a02bdb648f16b82ef3394007a9dcf
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
