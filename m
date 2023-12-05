Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07298C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 00:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=erdHzANN7eGysW1KOCY1yxd3W6kZV1vR/+H4BI16KIs=; b=QRqkwITPziRsYD
	UZBM1PBNV16+KjBvytanFNE6TBmrwfsvwbElsYljJMEny9Y9M/FvWfiOB38S1M+By2OdtoBj5eJHp
	HM11NlzgRXnXrWDd/4msecfbu0TOekyWuWq+wKXBFoRkZOFnS50uCKU5C8CxCeSPOLdNxtQXeJZfC
	53EAlwjCZBVkxUBiVK3bHmSsrFdOYYYDUs+pvE453rgoSKp3/XTzHxuYEKX54KASXnhCiI2KquWR+
	riXLaf9YnZmMjwJQGIbfy/+IYbCVOTqkdVS6hnGudbOqMZTbuaRgJfN1F/kDvfnhGdrSgbVPblO81
	qNpcc2/7WDsxxCRGtOow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAJCj-005rcG-2e;
	Tue, 05 Dec 2023 00:22:25 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAJCg-005rbS-01
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 00:22:23 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-1fae23895c9so2840302fac.3
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 16:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701735739; x=1702340539; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AceSiloMzdXvIE2DaEevBBcic/LsMH6cBLoMMH2zSsQ=;
        b=D4EkIYQ/2q9+OdaQ87cQclDGOCpDqq8z/+YR+7OQhtLu9Tnei1UJNMcdJkB6DbSh4L
         5Gx7OErl2E7hzQ/IoR0M29eXpMkJMpul+j7wy0lMPWWjG6oQVoteB92WR4sko6UdQyEu
         PXaBLVNkLYdXfmyDjPgOO8+0AroRx0h4Uk1o2QGzUcELXh5eWSPu11fEj1HfwEnhSEDW
         Wi95KZfsAyWTaBC/rwRRgx+hirQ7weINfUhnRT2tYWFuuUbug5A5X+j/Y1kNbw3Myslf
         RAHt9dE7mPI4YupZ9tdRLt3PYxJQ1rCPn4vR3msBR1RcKO1WIt8k6EI7x2LZkdfmvMFn
         n1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701735739; x=1702340539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AceSiloMzdXvIE2DaEevBBcic/LsMH6cBLoMMH2zSsQ=;
        b=TNG4LOE7Z4R+w5r0fxgsqGCbEFDcAYTtMyK7svmAoyhTIB1D5goe6brIMYiHDjZ4Kd
         KwCxe3QG7NoKjduE9ghs4lyDQRFKAfAMkSY9iWkQXQCXq7SZ5bbeVzYPQI0s9mLs613o
         I/w75pqsqMYH8ulWOfcTB1dA+xa6ECnSAgiAXtDT//QLzIVDWPW8C2nnuEUmdp/NCVcd
         kD7D1+k54CLwpU7lRAMEkaUSc9o3vwTtAcKJHuf7cd0o0C08xOE63EouZxlPktBEstv7
         yyb0ioMfEOVfO7jV8jSmIVkSvO4vhVx9uPWgCjoAG6kAzs8jU1cfM18DIj31+yS/4LWU
         OIoQ==
X-Gm-Message-State: AOJu0Yzdv7eQGyow1/GIPrgSCXtLxAgJaGYuvIcREYMsyEYcI5CA5RZ/
	UTKHeMb3Ujn21/V6PlNWMBE=
X-Google-Smtp-Source: AGHT+IGGpyH/uvDWZtUKbPGliRelSXQEiyxnYM/KxdFEwKMgIWFm+BsnmtfipMmVy4gfgRrC6v6CIg==
X-Received: by 2002:a05:6871:4004:b0:1fa:26e7:c428 with SMTP id kx4-20020a056871400400b001fa26e7c428mr6236892oab.19.1701735738877;
        Mon, 04 Dec 2023 16:22:18 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id o11-20020a9d404b000000b006d87f95566bsm1142899oti.51.2023.12.04.16.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 16:22:18 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	richardcochran@gmail.com,
	robh+dt@kernel.org,
	sboyd@kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	inochiama@outlook.com,
	samuel.holland@sifive.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH v4 0/4] riscv: sophgo: add clock support for sg2042
Date: Tue,  5 Dec 2023 08:22:06 +0800
Message-Id: <cover.1701734442.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_162222_051620_ADF66D22 
X-CRM114-Status: GOOD (  10.87  )
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

From: Chen Wang <unicorn_wang@outlook.com>

This series adds clock controller support for sophgo sg2042.

Thanks,
Chen

---
Changes in v4:
  The patch series is based on v6.7-rc1. You can simply review or test the
  patches at the link [5].
  - dt-bindings: fixed a dt_binding_check error.

Changes in v3:
  The patch series is based on v6.7-rc1. You can simply review or test the
  patches at the link [3].
  - DTS: don't use syscon but define sg2042 specific system control node. More
    background info can read [4].
  - Updating minor issues in dt-bindings as per input from reviews.

Changes in v2:
  The patch series is based on v6.7-rc1. You can simply review or test the
  patches at the link [2].
  - Squashed the patch adding clock definitions with the patch adding the
    binding for the clock controller.
  - Updating dt-binding for syscon, remove oneOf for property compatible;
    define clock controller as child of syscon.
  - DTS changes: merge sg2042-clock.dtsi into sg2042.dtsi; move clock-frequency
    property of osc to board devicethree due to the oscillator is outside the
    SoC.
  - Fixed some bugs in driver code during testing, including removing warnings
    for rv32_defconfig.
  - Updated MAINTAINERS info.

Changes in v1:
  The patch series is based on v6.7-rc1. You can simply review or test the
  patches at the link [1].

Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v1 [1]
Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v2 [2]
Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v3 [3]
Link: https://lore.kernel.org/linux-riscv/MA0P287MB03329AE180378E1A2E034374FE82A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM/ [4]
Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v4 [5]

---

Chen Wang (4):
  dt-bindings: soc: sophgo: Add Sophgo system control module
  dt-bindings: clock: sophgo: Add SG2042 bindings
  clk: sophgo: Add SG2042 clock generator driver
  riscv: dts: add clock generator for Sophgo SG2042 SoC

 .../clock/sophgo/sophgo,sg2042-clkgen.yaml    |   50 +
 .../soc/sophgo/sophgo,sg2042-sysctrl.yaml     |   35 +
 MAINTAINERS                                   |    7 +
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |    4 +
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |   79 +
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/sophgo/Kconfig                    |    8 +
 drivers/clk/sophgo/Makefile                   |    2 +
 drivers/clk/sophgo/clk-sophgo-sg2042.c        | 1371 +++++++++++++++++
 drivers/clk/sophgo/clk-sophgo-sg2042.h        |  226 +++
 .../dt-bindings/clock/sophgo,sg2042-clkgen.h  |  169 ++
 12 files changed, 1953 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo/sophgo,sg2042-clkgen.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.yaml
 create mode 100644 drivers/clk/sophgo/Kconfig
 create mode 100644 drivers/clk/sophgo/Makefile
 create mode 100644 drivers/clk/sophgo/clk-sophgo-sg2042.c
 create mode 100644 drivers/clk/sophgo/clk-sophgo-sg2042.h
 create mode 100644 include/dt-bindings/clock/sophgo,sg2042-clkgen.h


base-commit: b85ea95d086471afb4ad062012a4d73cd328fa86
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
