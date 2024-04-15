Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967A7C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 07:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+geDcdvh+/ql/p4v4nnEz3Wz9IC+FQRlxrMWWKlLhW4=; b=RlyoiodBk2WRDq
	mc66hgVdJLJi05zCPmQmHb6LiJvXXJ05+8MH6vi2y7Dk/JjWGVGTje83Orp6R6XokjjCb/mhIwzDh
	lrrLT1g487gbjwmXKAhYxia80PRysalRhjk0iUC7ZN4bempcMHXlEj3ptOXVi8kT6T6Hun8+xmIAA
	UTBTll15AtinJfYDuZJTftA8O62eT3Nx0xCL41FctboFZbnfVlA/Ox0bIUFIYebLFhPaeFVkzrBIH
	trCKI887k5a+3Bzl97YI4uN/aoKIuCqEgs6yr330IfZDGLpdo1+3Su2FIb5Cq1EyCzoeXuKCUTQo3
	ZaQ2JJ3JhE9X54tfJMHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwGfM-00000007Jt2-207H;
	Mon, 15 Apr 2024 07:22:12 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwGfI-00000007Jmb-1g8W
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 07:22:10 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-22a96054726so2529023fac.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 00:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713165713; x=1713770513; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YtAqaBR5s+OAli9OJSXa66ymNYqzO2AN9NU6Kk2lvFc=;
        b=bc7vyd87JhsJ0KA0fTOeEehr09d+0TDkV6fgGieE/ZEaEzkbZJ81iPXh1lhHTCuqPu
         +2r4E64bADWkzbYXDl+uTXfx6eUfhnuEDSkzqsci3S6krXSd1466DGyP8TjAqtQjfJpv
         f8M0deoJl0a9pFwRbvyPuMNSPXXKuG1Hd7OGxs+bqmahYnCGB0JUtG5M2OQyl4jJG+wz
         2SDCh0YmIyVbnAPA4l6kBuUGdRTrOyirvuXxN9gOks/p/mXr87r6PzuX6HB+FVTqB9iJ
         gl+CBIQEBMOr+pwoKAZPxaS5mnvBm7jpsbRAIpS+EL8GmsEe57YsPCAWpoMRNfxwXOHN
         81ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713165713; x=1713770513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YtAqaBR5s+OAli9OJSXa66ymNYqzO2AN9NU6Kk2lvFc=;
        b=XsQJ80E3arQfhlbGaryGjaG9gRfjGZVwDGE0Ou60vsL4AikeGjB0h77EhNr7kb/vHq
         tq3fcE+33BWxKAAjyB2zGfInTxH5W/SmHZdlYglJe+td/MmdSUrQlKr++lZa+jzQvgyR
         LXi/Xe+z3V//GjY6T8dgyU7vWxVcUVMAOdvNj8yzIDAdcvbY3GYTezgPyHufdxcj6Nbd
         1fW9iD6b1Rn+ePPp/YCKb5SIgXkkAjAf7VCgM1hjS9K1r0fdRo2GQtfpM1i5DqK/pDsO
         8VrLV8iGguXh846PQY9G3xplmAPOFLPdeFdMgXa3c5/O0SLm1QNA8/3L1kugZPBm6iyr
         gZ6g==
X-Forwarded-Encrypted: i=1; AJvYcCVPu6FHi4LvWZH1h/pQsTZjj0mRC3oWkUZiJNwjIe1YGn/pa5XZAmC70fbJ5KB+XN78bbxk/+2LUQu7XPoL5QragTfWEvgUVV1dKTQFmzjX
X-Gm-Message-State: AOJu0YwPyzCwE2garYwZcO83RVwbvqAUqmfOJmNslvbRX1pJHrDGpe00
	ova4BAV6qmHwUEQzqIr6QsTByxOx8GqFFEAcBURxINb32L6dGV7V
X-Google-Smtp-Source: AGHT+IFteLOZEFU+1qO1NsrBE/PdWJenuyhmqP93UfuT7SKJZ0n16xUcFNBJ2adDdN9oFi1cxx87Gg==
X-Received: by 2002:a05:6870:200b:b0:229:f31d:8c3 with SMTP id o11-20020a056870200b00b00229f31d08c3mr11812880oab.50.1713165712674;
        Mon, 15 Apr 2024 00:21:52 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id ny23-20020a056871751700b0022eeab387b8sm2157451oac.52.2024.04.15.00.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 00:21:49 -0700 (PDT)
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
Subject: [PATCH v14 0/5] riscv: sophgo: add clock support for sg2042
Date: Mon, 15 Apr 2024 15:21:35 +0800
Message-Id: <cover.1713164546.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_002208_464006_9AB20881 
X-CRM114-Status: GOOD (  20.69  )
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

Changes in v14:

  The patch series is based on v6.9-rc1. 

  Improved the dirvier code as per 2nd review comments from Stephen Boyd.
  - Inline the header file into source file.
  - Use devm_xxx functions for pll/div/gate registeration.
  - Use clk_parent_data for mux clocks initialization.
  - Use u32 for registers readl/writel.
  - Use devm_platform_ioremap_resource instead of devm_of_iomap.
  - Cleanup some dead code and add definitions for some magic numbers.
  - Add include files missed.
  - Use kernel-doc to improve comments for some structure and functions.
  - Other misc code cleanup work as per input from reviewers.

Changes in v13:

  The patch series is based on v6.9-rc1. You can simply review or test the
  patches at the link [14].

  Just added a minor fix for clk driver which was missed in v12.

Changes in v12:

  The patch series is based on v6.9-rc1. You can simply review or test the
  patches at the link [13].

  Improved the dirvier code as per review comments from Stephen Boyd.
  - Remove default y for CLK_SOPHGO_SG2042.
  - Optimize sg2042_pll_get_postdiv_1_2, move postdiv1_2 to the function.
    scope and add more explaniation.
  - Optimize sg2042_get_pll_ctl_setting.
  - Switch to platform driver.
  - Use clk_hw for initialization of struct clks.
  - Don't use ignore_unused when using critical.
  - Other code cleanup as per input form the reviewers.

Changes in v11:

  The patch series is based on v6.8-rc5. You can simply review or test the
  patches at the link [12].

  Quick fixed some dt_binding_check errors reported by Rob.

Changes in v10:

  The patch series is based on v6.8-rc4. You can simply review or test the
  patches at the link [11].

  Add input clocks for rpgate & clkgen.

Changes in v9:
  The patch series is based on v6.8-rc2. You can simply review or test the
  patches at the link [10].

  From this version, drop the system-controller node due to there is no actual
  device corresponding to it in IC design. SYS_CTRL is just a registers segment
  defined on TRM for misc functions. Now three clock-controllers are defined for
  SG2042, the control registers of the three clock-controllers are scattered in
  different memory address spaces:
  - the first one is for pll clocks;
  - the second one is for gate clocks for RP subsystem;
  - the third one is for div/mux, and gate clocks working for other subsystem
    than RP subsystem.

Changes in v8:
  The patch series is based on v6.7. You can simply review or test the
  patches at the link [9].
  
  In this version, the main change is to split one clock provider into two.
  Strictly follow the hardware instructions, in the memoymap, the control
  registers of some clocks are defined in the SYS_CTRL segment, and the
  control registers of other clocks are defined in the CLOCK segment.
  Therefore, the new design defines two clock controllers, one as a child
  node of the system control and the other as an independent clock controller
  node.

  This modification involves a major modification to the binding files, so
  the reviewed-by tags has been deleted.

Changes in v7:
  The patch series is based on v6.7. You can simply review or test the
  patches at the link [8].
  - fixed initval issue.
  - fixed pll clk crash issue.
  - fixed warning reported by <lkp@intel.com>
  - code optimization as per review comments.
  - code cleanup and style improvements as per review comments and checkpatch
    with "--strict"

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

Link: https://lore.kernel.org/linux-riscv/cover.1699879741.git.unicorn_wang@outlook.com/ [1]
Link: https://lore.kernel.org/linux-riscv/cover.1701044106.git.unicorn_wang@outlook.com/ [2]
Link: https://lore.kernel.org/linux-riscv/cover.1701691923.git.unicorn_wang@outlook.com/ [3]
Link: https://lore.kernel.org/linux-riscv/MA0P287MB03329AE180378E1A2E034374FE82A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM/ [4]
Link: https://lore.kernel.org/linux-riscv/cover.1701734442.git.unicorn_wang@outlook.com/ [5]
Link: https://lore.kernel.org/linux-riscv/cover.1701938395.git.unicorn_wang@outlook.com/ [6]
Link: https://lore.kernel.org/linux-riscv/cover.1701997033.git.unicorn_wang@outlook.com/ [7]
Link: https://lore.kernel.org/linux-riscv/cover.1704694903.git.unicorn_wang@outlook.com/ [8]
Link: https://lore.kernel.org/linux-riscv/cover.1705388518.git.unicorn_wang@outlook.com/ [9]
Link: https://lore.kernel.org/linux-riscv/cover.1706854074.git.unicorn_wang@outlook.com/ [10]
Link: https://lore.kernel.org/linux-riscv/cover.1708223519.git.unicorn_wang@outlook.com/ [11]
Link: https://lore.kernel.org/linux-riscv/cover.1708397315.git.unicorn_wang@outlook.com/ [12]
Link: https://lore.kernel.org/linux-riscv/cover.1711527932.git.unicorn_wang@outlook.com/ [13]
Link: https://lore.kernel.org/linux-riscv/cover.1711692169.git.unicorn_wang@outlook.com/ [14]

---

Chen Wang (5):
  dt-bindings: clock: sophgo: add pll clocks for SG2042
  dt-bindings: clock: sophgo: add RP gate clocks for SG2042
  dt-bindings: clock: sophgo: add clkgen for SG2042
  clk: sophgo: Add SG2042 clock driver
  riscv: dts: add clock generator for Sophgo SG2042 SoC

 .../bindings/clock/sophgo,sg2042-clkgen.yaml  |   49 +
 .../bindings/clock/sophgo,sg2042-pll.yaml     |   45 +
 .../bindings/clock/sophgo,sg2042-rpgate.yaml  |   43 +
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |   12 +
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |   49 +-
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/sophgo/Kconfig                    |    8 +
 drivers/clk/sophgo/Makefile                   |    2 +
 drivers/clk/sophgo/clk-sophgo-sg2042.c        | 1645 +++++++++++++++++
 .../dt-bindings/clock/sophgo,sg2042-clkgen.h  |  111 ++
 include/dt-bindings/clock/sophgo,sg2042-pll.h |   14 +
 .../dt-bindings/clock/sophgo,sg2042-rpgate.h  |   58 +
 13 files changed, 2037 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2042-pll.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2042-rpgate.yaml
 create mode 100644 drivers/clk/sophgo/Kconfig
 create mode 100644 drivers/clk/sophgo/Makefile
 create mode 100644 drivers/clk/sophgo/clk-sophgo-sg2042.c
 create mode 100644 include/dt-bindings/clock/sophgo,sg2042-clkgen.h
 create mode 100644 include/dt-bindings/clock/sophgo,sg2042-pll.h
 create mode 100644 include/dt-bindings/clock/sophgo,sg2042-rpgate.h


base-commit: 4cece764965020c22cff7665b18a012006359095
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
