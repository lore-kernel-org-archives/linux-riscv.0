Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D489AC19F32
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Mar 2025 19:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uglOVZ0GNTp3SIqcfwaeD93sdW9nzshRzxuKKk/TmWQ=; b=jFlwGxFRJZEsld
	DhDAUIbn9rWRgg7BHr5YbT/nlKu+Md2J8dY2B3vvylt6KqeT40RqoD4Xc75LLCR+wDs5COSCPMUYK
	WW57zGjxGzzBsICvbyKRmmH82w1wEq2s4hiixaZwXFoHkE3+dv71PAs9yYlBmfb98VEnixecJ1xkJ
	PtdKOP5ZKR413qNsJFVHjLrc7EoHB/Q8WqvGubVMxmyMR+laRTN0xvNtuMAtzVk9xnrB9mIForE5g
	kx88RqhJvkzxt6lnpqOMPH8y8DJmenp/jP5vflNr5l0tDHG2BZuONaUbnh5zxJpL/kNhl5mG8YjEj
	oFRcOU2Tm2u95QPBqtFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1topMP-0000000GbWK-3zmQ;
	Sun, 02 Mar 2025 19:52:25 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1topMM-0000000GbV1-1iyj
	for linux-riscv@lists.infradead.org;
	Sun, 02 Mar 2025 19:52:23 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5e058ca6806so5993696a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 02 Mar 2025 11:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740945140; x=1741549940; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fYP8t9F2eM7G3LZt0fHBklDkCmd8trcuPA/HoTpu2pc=;
        b=AkBiXVm1v2lMY0N4G7v6TE97bng7ZObOOb3rWzAct67eorJXs4md5ct+4tkGSI8h7T
         hkkXZWlSbDU+EhmiVYyOxKIv7XVW790feGd5Eg2Z2GhiARO9j5xqmPMKYzUd/9DtMCPI
         dEezFs8F6bddPo3FA7eJpo93ng3tNp/3gKfMRKlxOkCnzzQo9lWtvj+WO0aUlWOlJuIk
         MIiec497EczIDrZ/GKjzpWGKYVimLgFkESyuSsn/eyN+qSWlLGujOonxIzvAM3UHklbV
         dDYVZPn1v+KHJyv5jNDi//xOzAmc6Kyi+BM2OWRR5xatHJ1uBJ5/gXUCIg+Hj2t1kQsE
         NJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740945140; x=1741549940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fYP8t9F2eM7G3LZt0fHBklDkCmd8trcuPA/HoTpu2pc=;
        b=c7xZIx8n2vFJg4bxoCdJXTGnxlVQAALXtVpjg//gpbCZqOxkmPD2jyID61w4PpFUXB
         aW089GMw3DZIWzH+zZ7fkjCv3kQiRfVhdzLtheDGiMFI4RconjQbz2yYNVFTFAPJkF/P
         tyOgydna7la2Hr2UOlXv/Qfnduh7/maLwSN0Zgjizhf+I8X3JL1/pMMkghj5QeC69ZAz
         lDvCPOBBrW8M8/xX3mPBQTCwHo/w/WiIVBpeocX/E9xVNJ37In0P16WQO6b74VMb+Tko
         c+Q/uRmOBufK/9hwLW68HzYkk9NnEUt2TsICs9Ldpsq7RvKKDS2LpTQVcA2JyLUTBkbL
         6Ejg==
X-Forwarded-Encrypted: i=1; AJvYcCU3YuLz0Prsh1tXPW0yv3ReD67kxSIbiL3kdXq0ZxaF1Ujhtk51sxWXDl3WH/KnCGdPrhSOPEn9MXNtLA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9Nq7QLh+NOeWI2xLHvUnZhbkjsZyoQixkq9gdHqngpuELWEej
	tdgOTjTRFrRcNDI3xmJph4U6KS9fHHaKAAyJsotDIEXTUaGerJ3k
X-Gm-Gg: ASbGncvp/hLFLY/Vapq75ydskS49WI2ZCZXzFRvOxcTE5wWpoRGneLx3zaF4sajB3Tr
	hHXhonzXa1/fBAtshzB8FiVXUWd4mqLg5KWuJ5azM3FS1lPIFflJv0job2eok6keK+wYDBXH+dk
	DBfFT/+XAEuL+laz7G5VysOKbZwTftgScu/dZojswXmi78uTP7hH2EncWOwILYBPcVh28nNU+S2
	z4/si4iJcBHi9W4sSbvjCjj5oYer1M73PgGiDqXmsC5fPid30k1OgNLJOIwKl+jhz2+j+spae4F
	Cpb3FJ627UVmHyxkKLsOfuBKkBpK6oYiG7ZQxXSGLI1ViaqFiCA06rfAoA==
X-Google-Smtp-Source: AGHT+IHxK+9x3N2RoBOpHXrRdxjUeE8wFstYk1+WdPhSYJmBzIWPQk2M+kfSD+vWEG2gL6GzseXg5w==
X-Received: by 2002:a05:6402:2113:b0:5de:dfd0:9d20 with SMTP id 4fb4d7f45d1cf-5e4d6b6ea41mr11133730a12.24.1740945139838;
        Sun, 02 Mar 2025 11:52:19 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a5acdsm5809705a12.77.2025.03.02.11.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 11:52:19 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	dlan@gentoo.org,
	linux-kernel@vger.kernel.org,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	sophgo@lists.linux.dev
Subject: [PATCH v12 0/3] riscv: rtc: sophgo: add rtc support for CV1800
Date: Sun,  2 Mar 2025 20:51:53 +0100
Message-ID: <20250302195205.3183174-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_115222_459000_00B0FA10 
X-CRM114-Status: GOOD (  20.32  )
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

Real Time Clock (RTC) is an independently powered module within the chip,
which includes a 32KHz oscillator and a Power On Reset/POR submodule. It
can be used for time display and timed alarm generation.

This series aims to provide complete DT bindings, but the drivers are only
focusing on RTC implementation. Possible Power Management and remoteproc
can be implemented later (hence the RTC driver is using syscon, because
MMIO space is really interleaved among different functions).

Series is tested on Milk-V Duo Module 01 EVB (SG2000 SoC).

Changes since v11:
- dropped restart handling (will be implemented in PSCI)
- split RTC driver into MFD stub and a platform RTC driver
- dropped Reviewed-by: Krzysztof Kozlowski from bindings, they've got a
  rework
- changed bindings maintainer from Jingbao Qiu <qiujingbao.dlmu@gmail.com>
  to sophgo@lists.linux.dev
- added link to TRM into bindings description
- bindings: mentioned 8051 core in the description
- bindings are now MFD, not RTC
- bindings: added "syscon" compatible
- bindings: added "interrupt-names", "clock-names" (because of added
  PM/remoteproc)
- bindings: main compatible "sophgo,cv1800-rtc" -> "sophgo,cv1800b-rtc"
- new patch "mfd: sophgo: cv1800: rtcsys: New driver (handling RTC only)"
- added both MFD and RTC drivers into MAINTAINERS file (N: K: entries
  didn't apply)
- RTC: depends on cv1800-rtcsys MFD driver
- RTC: use syscon for regmap
- RTC: get named clock from parent MFD
Changes since v10:
- only start RTC on set_time;
Changes since v9:
- further simplified bitmask macros;
- unconditional RTC start (rtc_enable_sec_counter()), otherwise
didn't start on SG2000;
- dropped ANA_CALIB modification (has been forgotten in v8 with
the drop of SW calibration to switch to HW calibration);
- successfully tested on SG2000;

Changes since v10:
- only start RTC on set_time;
- add machine restart handler (as separate patch 3/3);

Changes since v9:
- picked up orphaned series;
- further simplified bitmask macros;
- unconditional RTC start (rtc_enable_sec_counter());
- dropped ANA_CALIB modification;
- successfully tested on SG2000;

v9: https://lore.kernel.org/linux-riscv/20240428060848.706573-1-qiujingbao.dlmu@gmail.com/

Changes since v8:
- delete unused macros
- using 0/1 instead of the DISABLE/ENABLE macro
- pass in the correct pointer when applying for IRQ
- convert the incoming pointer into an appropriate
  structure pointer in the irq handler

v8: https://lore.kernel.org/all/20240204044143.415915-1-qiujingbao.dlmu@gmail.com/

Changes since v7:
- pass checkpatch.pl --strict
- using u32 replace uint32
- using devm_kzalloc(*) replace
  devm_kzalloc(sizeof())
- sort header files alphabetically
- delete unnecessary header files
- fix wrap error
- drop dependent description
- using hardware automatic calibration replace
  software calibration. see documentation 197 page

v7: https://lore.kernel.org/all/20240122080500.2621-1-qiujingbao.dlmu@gmail.com/
documentation: https://github.com/milkv-duo/duo-files/blob/main/duo/datasheet/CV1800B-CV1801B-Preliminary-Datasheet-full-en.pdf

Changes since v6:
- completely delete POR dt node
- remove syscon tag
- use devm_regmap_init_mmio() replace
  syscon_node_to_regmap

v6: https://lore.kernel.org/all/20240115160600.5444-1-qiujingbao.dlmu@gmail.com/

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

Alexander Sverdlin (1):
  mfd: sophgo: cv1800: rtcsys: New driver (handling RTC only)

Jingbao Qiu (2):
  dt-bindings: mfd: sophgo: add RTC support for Sophgo CV1800 series SoC
  rtc: sophgo: add rtc support for Sophgo CV1800 SoC

 .../bindings/mfd/sophgo,cv1800b-rtc.yaml      |  86 +++++++
 MAINTAINERS                                   |   2 +
 drivers/mfd/Kconfig                           |  14 ++
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/cv1800-rtcsys.c                   |  66 ++++++
 drivers/rtc/Kconfig                           |  12 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-cv1800.c                      | 218 ++++++++++++++++++
 8 files changed, 400 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/sophgo,cv1800b-rtc.yaml
 create mode 100644 drivers/mfd/cv1800-rtcsys.c
 create mode 100644 drivers/rtc/rtc-cv1800.c

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
