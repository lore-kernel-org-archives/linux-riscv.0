Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549B2C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 01:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Uo92aikB5JLsYjERAiLmfTcVzpngZwrYttj2gCZZeYU=; b=UktZ+Sfk0IuSUA
	GsLTPcWlcTJUsdQE7M5myWHSJRlR2AHf6EbeCIvi1i6v8Rj3EFNtJorB8kRuIMu828ek1dpd+nXsw
	NJdnLRQH6iSyMGJXx8YRuMq25njK/hRsannwajVUYGpzeTqd3xHI6Y3OBp4Ws3olWGFx0GiVngpvw
	k4Pusj38jgy1hIiLIRnvrv4yY1XIDZvswbw24vfJNplukkcE2+u7tNvQ0/eTGhW+8SNy6/5usWZHr
	lzLWrz/ixHSHnj+EJe66IZC/d+qk+/DehgiWkTcj1FDUhF71mzySGSX3jVmsirJ+NnJuhyvGA0Ief
	AJEjZ1srYhC4hhT4g9fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBPQZ-00EQt4-38;
	Fri, 08 Dec 2023 01:13:15 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBPQW-00EQsA-2j
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 01:13:14 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6d9e0f0cba9so559225a34.1
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 17:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701997989; x=1702602789; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O9CqMmARklhu+aWShYkB4W+scqzZcjMk/LYLPQHxTpw=;
        b=SUWc7IEzP082awKbnL5bAGC8L3nKpjyoWAuO3mjv/DDqYduT9dOH4CzI2ADW4zQYvK
         X8ak3rhp2AbuV6fAst013+x8BiODKzd2Owzmv1rdtVg5ao0EtYjqBGy67BoKXM+0thl7
         AuaTY08qVgHOp7XERJlwZupKOOQEpdHgs04dYW0fMvqy9vixcRRFNiu5A0M0rTaR2YbJ
         zZt+oXJ/OPH0o52PreZHprTSuHeHKtjGWk96HlpdsLFuVlL++KqGIpjjgGpMkSya1ioo
         yunAAItFF7AZ/9YeWzq77fosG2WAaZigky52utFI9w5fnQvJ3v0UYT2U66cfovWwlR5X
         +qTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701997989; x=1702602789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O9CqMmARklhu+aWShYkB4W+scqzZcjMk/LYLPQHxTpw=;
        b=jQxaZT+d6uodFQGbqwMmTD2vO/dupWyOwnSeUxrFxE5tBAnHwAgCPHSPutLP94TE+A
         /TXIjZIyiYzuYN0mjAO0Q8PicF230ZqRfJYfQkatk7wSMoKaWkIk82ncnZ1K2zc+3luj
         nC4h7n6em5iG121KVDbw3rNe+o1TVb3tpsDvKZxTWgaGeGFb2K8dKVs5ZnjSJemYnyNa
         ZTwucVKM+A/5V8uFYTNa24a8bFrvu1G3X9oH9bkB+6d/g4qnLa2x/NstmQsdpt2FgS4/
         IOHAoS8bUIsM9tBg9RjQ2rqt0FuoULnM5P48VV+UiowDqb7Ox7QbROWA1UFc7FjVeq2P
         zlzg==
X-Gm-Message-State: AOJu0YyB+oyI+bn9PJOncEgo219h5xclb7BLQRKBGBLUX3qtMbqxpA/y
	3sVx73BwXie2ho7UqEPZCnk=
X-Google-Smtp-Source: AGHT+IHj76UivPYn5LBdsNNyN1HlcikxOqd5/9AFXqCLTbYyAnf/YPa+czn5QHTd0NUlupNDAZmDYg==
X-Received: by 2002:a05:6870:b68b:b0:1fb:3700:ee1b with SMTP id cy11-20020a056870b68b00b001fb3700ee1bmr3537230oab.47.1701997989445;
        Thu, 07 Dec 2023 17:13:09 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id pq15-20020a0568709c8f00b001fa24002089sm206570oab.30.2023.12.07.17.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 17:13:09 -0800 (PST)
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
Subject: [PATCH v6 0/4] riscv: sophgo: add clock support for sg2042
Date: Fri,  8 Dec 2023 09:13:00 +0800
Message-Id: <cover.1701997033.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_171312_906874_9E7D34B7 
X-CRM114-Status: GOOD (  12.04  )
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

Changes in v6:
  The patch series is based on v6.7-rc1. You can simply review or test the
  patches at the link [7].
  - fixed some warnings/errors reported by kernel test robot <lkp@intel.com>.

Changes in v5:
  The patch series is based on v6.7-rc1. You can simply review or test the
  patches at the link [6].
  - dt-bindings: improved yaml, such as:
    - add vendor prefix for system-ctrl property for clock generator.
    - Add explanation for system-ctrl property.
  - move sophgo,sg2042-clkgen.yaml to directly under clock folder.
  - fixed bugs for driver Makefile/Kconfig
  - continue cleaning-up debug print for driver code.

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
Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v5 [6]
Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v6 [7]

---

Chen Wang (4):
  dt-bindings: soc: sophgo: Add Sophgo system control module
  dt-bindings: clock: sophgo: support SG2042
  clk: sophgo: Add SG2042 clock generator driver
  riscv: dts: add clock generator for Sophgo SG2042 SoC

 .../bindings/clock/sophgo,sg2042-clkgen.yaml  |   53 +
 .../soc/sophgo/sophgo,sg2042-sysctrl.yaml     |   34 +
 MAINTAINERS                                   |    7 +
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |    4 +
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |   79 +
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/sophgo/Kconfig                    |    8 +
 drivers/clk/sophgo/Makefile                   |    2 +
 drivers/clk/sophgo/clk-sophgo-sg2042.c        | 1356 +++++++++++++++++
 drivers/clk/sophgo/clk-sophgo-sg2042.h        |  226 +++
 .../dt-bindings/clock/sophgo,sg2042-clkgen.h  |  169 ++
 12 files changed, 1940 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml
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
