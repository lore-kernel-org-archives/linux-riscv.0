Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CEBEC7115A
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 17:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1OX3hxlaqTcSn29WfMC3OV42rf/2Pb1JjKKTurYperE=; b=X9mok1v7vGlcbJ
	rl510G4C1ADiQAfCqcuVrLfi5xCfkyDphrVeHL2Dtdgs4mLPvQxmR4j4yARBJNuZeIT8gavicJNvG
	p1Pddj6Hz+LMhHqWpXUhwtV86BRgY6Y9xFrrohqw0Vbf7+ghJDGccI4IOvdaHKciBp60FIk3P2PMj
	57a1ubDq/e5dhlido8qnAhlF3KU321SXO9+bG9C1koDLkH6MyZIkQptzjRT3FfXp+o96yX5DEY8RY
	MQIcIGnW8AmdV1mxnX868q5psxg/JJtVqxV3aUysuKjjXtlgnMPEoqZvPHUVfEpEAPZ7v3cOlJxHd
	E4ylKJYEUHqmoxipRDGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIei-0000000DerD-0ru5;
	Thu, 19 Jun 2025 17:02:28 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSFgK-0000000DDxZ-2DIl
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 13:51:57 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-8762a0866a3so792939f.2
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jun 2025 06:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750341115; x=1750945915; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E4/kRfI7GtIIigr3/HBRf4Is34RYmI+DLhB76yDRywQ=;
        b=AijYDr2U8+2KXjRLM5iebV4a4E4AKsrRKJIfBT/cYjc22Ux9zAVJWvKOpB5R1X1PQf
         EevY8+4k+Kn8RLeWtBVTT0izMLF/zGvKjeBrWmyrSysGFrwqJb4qa/+DgbOHkplmhH6o
         PovBBLA1rmT/YEV6tU/w8M61QR2TB/IpICZ+SUOzBTtbKscb+xALMcoLxllW9/aQKrmU
         CtIHkEdMUXgx1MLvD6WpsKIh7IsHWS0ZX0bZn6+3g17MXtEmVHd7Ffww1geC6ioNnChd
         /jaTHkYDhTWGwDM6WeqHJhLyX/SZ+C1rpdEri6xImoo5/8DNUXcezACW36sKRD2BTrGO
         XVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750341115; x=1750945915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E4/kRfI7GtIIigr3/HBRf4Is34RYmI+DLhB76yDRywQ=;
        b=rUxfeVkIMVtnNIprzmyFoPSRdnXSdFNmY2t+OKAjh20iFmDdWhoQQ5RMSDdX9c3f+e
         ixhSC5dr7+B6F8LFREq2JD8Bbxpi7H8LVyL+hcz2QDs7/p0VgheDXmpdU7c5No6rxVMq
         nZnheBETW0MUUE8g3TaLEciyJ9hbhs7CkPF04uAi6TYQd+aVUzu+emZAlMfC3LPJRt9r
         10d2+z6rnZdQdqatC3xc0OFg7w6FEWOM+0bHsctOKATPYIkL104JnCH/nK9stkHEoQMA
         evx9cYwoz3XejMf1+5feWm23VjBKUgPPVDnw2RZi30MGqOfX/lEQxLs6OUr03TsAMj5C
         6VDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVurS7UTZ9LlH4kv2+edengCLaUdaLC31K5ijjBAOfPUSMYAsDBX/H4n9+vgaqSsKYOHRLQ9JCk0wuiMg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywlowa5ZEjU2u/iShXUkNniw4sH7LjEd12nzPbLaW0gbkxNQt9B
	1hKFFrCb3Dyvtg7gLpOVisVRYqyoBgfn1XlxD5a/I4dEoT63Hc2zxr65c5R3MfZTtk8=
X-Gm-Gg: ASbGnctDwkFz6u8jm2hGWPXLmgLw1zlrVcBRe+T14sOOk6naSPr47sx1rZXnfF0JGL1
	zGn4KXoCBnFH7S2Mm/5HAbe0o3DuMkCIol4Fh5Iv3u1gk+v/0N7cRe8Q8yaWkFvZHWY1KaDBgyr
	WBWU18lgmvD/JNvhmh4qKYzdu7zriol+oIYfZSsM5VQkDNDgBio3rclwfnvDYOL4z+nbYhSn0ip
	6Pd923xUX74bktuOiHTv0DM7hVr7xSd/F0l9B7rQtr+2p622Jt+Y0gj87fVFzV9ScWKw0+sGtL6
	spQ2xtGoRqUFJ9LLAAXmjVwpWk3qdKg+0IupRcipCo88Sxje1Kpt9xoDMCoJ3pNPqsP7SLF/TI5
	chjWiBInv9+XUfboLtkYLyXxxNTBsuzU=
X-Google-Smtp-Source: AGHT+IFrbensFAkg/HByCyIpWD6NGm/n/XxGHWXyYgLJ12Gm8oYiEV2EbCqtiQI2rbB+Z4f+NfDTKw==
X-Received: by 2002:a05:6e02:17cb:b0:3dd:8663:d182 with SMTP id e9e14a558f8ab-3de07d6875emr211780235ab.13.1750341115180;
        Thu, 19 Jun 2025 06:51:55 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de01a453b4sm38246015ab.47.2025.06.19.06.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 06:51:54 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org,
	lgirdwood@gmail.com
Cc: wangruikang@iscas.ac.cn,
	dlan@gentoo.org,
	troymitchell988@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] spacemit: introduce P1 PMIC and regulator support
Date: Thu, 19 Jun 2025 08:51:44 -0500
Message-ID: <20250619135151.3206258-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_065156_568392_2E53132A 
X-CRM114-Status: GOOD (  11.59  )
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
  https://github.com/riscstar/linux/tree/outgoing/pmic-v2

					-Alex

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

Alex Elder (6):
  dt-bindings: mfd: add support the SpacemiT P1 PMIC
  mfd: spacemit: add support for SpacemiT PMICs
  regulator: spacemit: support SpacemiT P1 regulators
  riscv: dts: spacemit: enable the i2c8 adapter
  riscv: dts: spacemit: define fixed regulators
  riscv: dts: spacemit: define regulator constraints

 .../devicetree/bindings/mfd/spacemit,p1.yaml  |  86 ++++++++++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 138 +++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |   7 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  11 ++
 drivers/mfd/Kconfig                           |  13 ++
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/spacemit-pmic.c                   |  83 +++++++++
 drivers/regulator/Kconfig                     |  11 ++
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/spacemit-p1.c               | 157 ++++++++++++++++++
 10 files changed, 508 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
 create mode 100644 drivers/mfd/spacemit-pmic.c
 create mode 100644 drivers/regulator/spacemit-p1.c

base-commit: 2c923c845768a0f0e34b8161d70bc96525385782
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
