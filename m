Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B235CC3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 16:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jG+osAZEX3FMZ4QauH5CxKLY81mEEscBzmhR2myX5ZM=; b=ObK2a0uztOdtKi
	rENweX0PgOy9sOYN0/hMXsyhxiKZ4vGpFE7+PSBK9CTi8f8ECr5UdHJnYE2tyz8x7sg8soWY4gvi7
	pCyRBqbbNnfMYukFsk9/2uBt1ynlm5FX7cdU1cGFqmvrhzrt4/hkY4oJUI1AtLH218Cm1T2w1mDzz
	/f950Bzsu6pFtAPYcSOWt6No1KYhtj+P+sI4qOYA7DT4iCupuYXIrmVsW7iuG1b9adnAGoG044AAA
	t2qwKF2smzOTKQClNX8+ZcYZfy51pSu0axb+P07+jqUql2wtm5IDZVISCVcDPsSToj+dFV6u09Pmc
	Yi9j1tn9ESw6lovelbmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPPTW-009Xz2-0O;
	Mon, 15 Jan 2024 16:06:10 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPPTT-009XyS-1f
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 16:06:09 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5ce07cf1e5dso4417349a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 08:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705334766; x=1705939566; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yDa16CVmSfs+N/D++bcE7PtMkJn0aFkGKpqTBxiLGsQ=;
        b=RI1RxyAmCiJpRtP84N3w0SbTPmn7NUsPN5zZRR/TC6r8sE7+B6OurlsukYhRIDCQ83
         cQ43iN+Ry+yk1NjAoe68hfhvy8C2w6v4V5X63+DKU6ZlJkG72QDsrfqBwmAZ0fNy/XzZ
         JmLOjOQOXJz6sZYiVZJZkbFFPLoMX/NS66r0AWe0Ru7m50irPlUp5Yxfv77AH3hzR4mO
         IOPA8o0sG39gWBdKPla2XYHdc0PJyPlsSZHNQUx6qXZSUKDI/AH0w1EHo2QXrnnwQvV3
         sWIN3qtABHOtSYG8xhrMok/gifTOTPP9D6JJV53YhHuv1I0U/Ld+AC+kveguc0b4UkXG
         0H2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705334766; x=1705939566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yDa16CVmSfs+N/D++bcE7PtMkJn0aFkGKpqTBxiLGsQ=;
        b=LQxn3PGgYkflVpl/NVbGadM9kNvHHTc42QOOVk5LhrFxhOXNLUOm6TFQJ1gEHJd5R5
         PM3FMkyckLTTn7eIgVWyeFsj6GQiIoA074x6UyTXUGbuJOf7XTlMGk3E5VBAtQOMbp6b
         Ym7Jg/IOi5J2p3Cw6DSQ9AWYwAed6iTCFcgx6Nz6gyAUVv2ONKwDCbgaxeMc/RJG2R45
         wBMwnRbYk+bPm308BULRkROM5BnhW/FTQR5mUUfh/j2NSn6p5BF5S7zuYuQMqVrkKcdG
         gm3jd6iiR2CSkxSrIKdWynwxlnwm1R7ryu5hNB5PEUsAUxnV/RP5hVE4QahGrkbOyz55
         KWZQ==
X-Gm-Message-State: AOJu0YzPg4lawGGwFCw32P4v1ijTiI+dCtyp13DS6yPA8QKc1x/O+C93
	dYVtLbT6oIDZqbXUZuy1sFo=
X-Google-Smtp-Source: AGHT+IFJtE0KE+EoKxq7n4ougV/OrUqltD5x3+pgimBp47DSgYBBvcKSSCZGIhA8medm7ns1Q5Q18w==
X-Received: by 2002:a17:90b:1e12:b0:28c:f9d8:14e2 with SMTP id pg18-20020a17090b1e1200b0028cf9d814e2mr2927632pjb.84.1705334765968;
        Mon, 15 Jan 2024 08:06:05 -0800 (PST)
Received: from localhost ([124.131.233.112])
        by smtp.gmail.com with ESMTPSA id li16-20020a17090b48d000b0028e55789456sm2313340pjb.24.2024.01.15.08.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 08:06:05 -0800 (PST)
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	chao.wei@sophgo.com,
	unicorn_wang@outlook.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dlan@gentoo.org,
	inochiama@outlook.com
Subject: [PATCH v6 0/3] riscv: rtc: sophgo: add mfd and rtc support for CV1800
Date: Tue, 16 Jan 2024 00:05:57 +0800
Message-ID: <20240115160600.5444-1-qiujingbao.dlmu@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_080607_573039_995D6D02 
X-CRM114-Status: GOOD (  15.37  )
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

Real Time Clock (RTC) is an independently powered module
within the chip, which includes a 32KHz oscillator and
a Power On Reset/POR submodule. It can be used for time
display and timed alarm generation.

Power On Reset/POR submodule only using register resources
so it should be empty. The 32KHz oscillator only provides
pulses for RTC in hardware.

Changes since v5:
- remove unnecessary lock
- fix cv1800_rtc_alarm_irq_enable()
- remove duplicate checks
- using alrm->enabled instead of unconditionally
  enabling
- remove disable alarms on probe
- using rtc_update_irq() replace mess of alarm
- remove leak clk
- useing devm_rtc_allocate_device() and
  devm_rtc_register_device() instead old way
- add judgment for rtc_enable_sec_counter()
- add POR nodes in DTS. This POR device shares
  the register region with the RTC device

v5: https://lore.kernel.org/all/20240108072253.30183-1-qiujingbao.dlmu@gmail.com/

Changes since v4:
- remove POR dt-bindings because it empty
- remove MFD dt-bindings because SoC does
  not have MFDs
- add syscon attribute to share registers
  with POR

v4: https://lore.kernel.org/all/20231229090643.116575-1-qiujingbao.dlmu@gmail.com/

Changes since v3:
- temporarily not submitting RTC driver code
  waiting for communication with IC designer
- add MFD dt-bindings
- add POR dt-bindings

v3: https://lore.kernel.org/all/20231226100431.331616-1-qiujingbao.dlmu@gmail.com/

Changes since v2:
- add mfd support for CV1800
- add rtc to mfd
- using regmap replace iomap
- merge register address in dts

v2: https://lore.kernel.org/lkml/20231217110952.78784-1-qiujingbao.dlmu@gmail.com/

Changes since v1
- fix duplicate names in subject
- using RTC replace RTC controller
- improve the properties of dt-bindings
- using `unevaluatedProperties` replace `additionalProperties`
- dt-bindings passed the test
- using `devm_platform_ioremap_resource()` replace
  `platform_get_resource()` and `devm_ioremap_resource()`
- fix random order of the code
- fix wrong wrapping of the `devm_request_irq()` and map the flag with dts
- using devm_clk_get_enabled replace `devm_clk_get()` and
  `clk_prepare_enable()`
- fix return style
- add rtc clock calibration function
- use spinlock when write register on read/set time

v1: https://lore.kernel.org/lkml/20231121094642.2973795-1-qiujingbao.dlmu@gmail.com/

Jingbao Qiu (3):
  dt-bindings: rtc: sophgo: add RTC support for Sophgo CV1800 series SoC
  rtc: sophgo: add rtc support for Sophgo CV1800 SoC
  riscv: dts: sophgo: add rtc dt node for CV1800

 .../bindings/rtc/sophgo,cv1800-rtc.yaml       |  55 +++
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi       |  12 +
 drivers/rtc/Kconfig                           |   7 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-cv1800.c                      | 397 ++++++++++++++++++
 5 files changed, 472 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml
 create mode 100644 drivers/rtc/rtc-cv1800.c


base-commit: e3d3fe7e7bf08820a83c9d9a4c38c7b29a2927f1
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
