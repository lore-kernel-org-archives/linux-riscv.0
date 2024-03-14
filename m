Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4102FC54E67
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 10:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eaPglba0e2RT1vNCl2GQqFS+cXvNBwBz9vtN80D+iT0=; b=TsAqYqGJwt5RNj
	G2oBj+VevV9sVbUMluRlH6AxTqAVeDRS70fUnWXK2QSM/uux5HWyxg1T0q80jka0WOHr/AfaCCcnq
	vpX2mbVC5aWMbB24WVpqwvH9p032ZlsVhdWXxJPNw7VxmnkxrRTqqmwEu945B9j/1i/QvY1cczOXN
	2uSNMu8L27hErBD98+HAHiVoojtIVOcDUmND2L0ud+l3W5LNI52ph5dWXp5gjNH7NH41814itgyI2
	MRoeJFj0gtLdO28vMFf/m1eOMQAp0BKYUGCUhHbBji048MH1OHedKubdjhDhzKqNrWdJ8W+W21NYn
	Ft/Y/85QAaPyKXbrtuLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkhuG-0000000Doml-027z;
	Thu, 14 Mar 2024 10:01:48 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkhuC-0000000Doli-0sNV
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 10:01:45 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6e46dcd8feaso565708b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 03:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710410501; x=1711015301; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bADiP2JMoy9tupS84LlT0K2ooRmfm9NBpaoBAI0A3AU=;
        b=dEAiAme/nouBoYcglHwrf0qeACCOWu9t9JwTf8j7VaCgtPrV0TyyiiIFrohvlsQxAs
         SO2osiBKTPDZDGb9r0sKDXPUZpzOho0+VVsAMYbpVvm57wXq5Dqt/2ki5cvVdVTsziLu
         yLO8IzmHql+Ua+5V09Aqe+7uBJIPq6tC1tBlZ+jLXBBGrwGya0GCL2JlwCZeHefOiVke
         6ePbmDZrs8qnEMPI3lYq9IaATnH8lTEGlGun4DaI3Sq4PPlWkgD4ucMFyS6NlElSAZua
         AwVaVKneqTpDnzsUSQ2sYAsChx+dYSfJ+Rvoh2KPzjN/AngsHB192S9VphGCBep4LhH8
         eQig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710410501; x=1711015301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bADiP2JMoy9tupS84LlT0K2ooRmfm9NBpaoBAI0A3AU=;
        b=dZZ1sQD8UuKWe/J1olFc0ABhZjgBqgxsDXSbzej3UVAs2Q2422ZUtXeoq5wSyPsaA4
         0cbIAdVtS2hr8goYKs+3LMojct2OXC771v+mW6VtSreXBs66NWpoGNNKOGKHRfsqe9h7
         BIbqANnHynPidRSJohxpofpJzcf1G7HMdAD9XV3z2prTMdt18LviEdOqOJv8Ym0HfHAo
         Kw2EwNaRUwyNerUrRBpefGY3ETgY6R7RebCSbxLx4zz6J6dz/cggib50c7Syst9x5g9R
         yE4aBo0n0Pa39NQKClpD+1zZhhVG/+8yDYVSBmI2E4A9GNfT2xLt/alojUiwZRZLZ8i/
         n3kQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2EcYb+4xa0etJPWJO/IzeBtNaUWeafOwsowDufX6jQg1DLoo8/CCSF7osx7Y+Bhxr/3Sktz8WaSAhyZ3B9FpqbE8H9J7NgfHzzjEDEiO1
X-Gm-Message-State: AOJu0YwlEE3gZ5y5zXDUUcPAxhcLUTOBSfBAyHwbAEsVdhUAR33xgJRi
	k/CmsHaDzXGWsNb/Su5XmSgHqPsQrnO6gNzWZJ8wro5pKJv2pwW0
X-Google-Smtp-Source: AGHT+IFFzJM+HQEOJ7Cz4atZvEGs+rBe4yQQcu9ZWDjJnEVxLYoMA196zIfehODsDYXjZPNscvpwDA==
X-Received: by 2002:a05:6a00:23c3:b0:6e6:b129:1842 with SMTP id g3-20020a056a0023c300b006e6b1291842mr1281104pfc.28.1710410500940;
        Thu, 14 Mar 2024 03:01:40 -0700 (PDT)
Received: from localhost ([2001:da8:a801:69b2:6cee:23f3:5da6:de15])
        by smtp.gmail.com with ESMTPSA id lc24-20020a056a004f5800b006e6bda407b6sm1073123pfb.202.2024.03.14.03.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 03:01:40 -0700 (PDT)
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
To: u.kleine-koenig@pengutronix.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dlan@gentoo.org,
	inochiama@outlook.com,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Subject: [PATCH v5 0/2] riscv: pwm: sophgo: add pwm support for CV1800
Date: Thu, 14 Mar 2024 18:01:29 +0800
Message-Id: <20240314100131.323540-1-qiujingbao.dlmu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_030144_275790_C5234F39 
X-CRM114-Status: GOOD (  12.33  )
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

The Sophgo CV1800 chip provides a set of four independent
PWM channel outputs.
This series adds PWM controller support for Sophgo cv1800.

Changes since v4:
- drop filename
- fix macro
- optimize cv1800_pwm_set_polarity()
- optimize cv1800_pwm_set_oe()
- add comment for cv1800_pwm_set_oe()
- use ticks replace tem
- fix duty_cycle larger than period_val
- use devm_clk_rate_exclusive_get() replace
  clk_rate_exclusive_get()
- map linux polarity to register polarity 

v4: https://lore.kernel.org/all/20240304085933.1246964-1-qiujingbao.dlmu@gmail.com/

datasheet Link: https://github.com/milkv-duo/duo-files/blob/main/duo/datasheet/CV1800B-CV1801B-Preliminary-Datasheet-full-en.pdf
page 614

Changes since v3:
- use macro instead of npwm number
- add support for polarity feature
- add support for Output-Enable/OE feature

v3: https://lore.kernel.org/all/20240223082014.109385-1-qiujingbao.dlmu@gmail.com/

Changes since v2:
- use 0x08 instead of macro
- split if statements based on conditions
- in order to round up, first calculate the
  number of high-level cycles, then subtract
  it from the PERIOD to obtain the number of HLPERIOD
- use new pwmchip_alloc() API instead of old style

v2: https://lore.kernel.org/all/20240212121729.1086718-1-qiujingbao.dlmu@gmail.com/

Changes since v1:
- drop full stop from subject
- re-order maintainers and description
- pass checkpatch.pl --strict
- fix naming errors
- add "Limitations" section
- use a driver specific prefix for all defines
- using bool instead u32 in cv1800_pwm_enable
- check and set state->polarity
- use mul_u64_u64_div_u64
- use clk_rate_exclusive_get(), balance with clk_rate_exclusive_put()
- using macro definitions instead of shift operations
- remove shift operation on 0
- use priv replace cv_pwm
- hardcode npwm
- set atomic to true
- remove MODULE_ALIAS

v1: https://lore.kernel.org/all/20240207055856.672184-1-qiujingbao.dlmu@gmail.com/

Jingbao Qiu (2):
  dt-bindings: pwm: sophgo: add pwm for Sophgo CV1800 series SoC
  pwm: sophgo: add pwm support for Sophgo CV1800 SoC

 .../bindings/pwm/sophgo,cv1800-pwm.yaml       |  45 +++
 drivers/pwm/Kconfig                           |  10 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-cv1800.c                      | 315 ++++++++++++++++++
 4 files changed, 371 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/sophgo,cv1800-pwm.yaml
 create mode 100644 drivers/pwm/pwm-cv1800.c


base-commit: 8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
