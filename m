Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FE7C25B75
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jun 2024 08:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=50OUXH4tOqVFlxs7ZlwHvss7DwkWHS05Wc9a+o0L3fs=; b=uQ15Jb1LCvwkDV
	GIcJ2kBu6QQwTYjUyULdRZY9nePG9cEVy9j4Idcljit+TWyEt/qtlD080AvGvl9yHwzzPJRCiRK6O
	dNEQnGUiUwKikGGLI5juUVRzbiWLXaNhOShrYJaV4LNySntcmsSH64dW/bVAs7KH8lOKXnvXYfKW1
	gbC8ev6OsoZt6ti1CUV6FSLFgw9eYi8ehS73ky9Q0naxS8K9hEuggxFGAIBpNKO3DQkigSJXaWtVl
	3B7aVFY3owWeRFvVR/jIFodjs5u2EAyuiezwxP0BtPj6udxS7tGvEIIZv7hEMHoCiJkB5vuXaPTg6
	mUoPAsoza6oxSs/WXuUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8bd-00000008rPS-1EuJ;
	Thu, 06 Jun 2024 08:36:21 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8ba-00000008rNS-0txR
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jun 2024 08:36:19 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-5ba68cc920fso758314eaf.0
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jun 2024 01:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717662974; x=1718267774; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l/J1TIi/7S4IHb480Bty9F4Vdib6r6GgqM8DD5E175o=;
        b=AluEJmoM2JvfAokGlNX8sSMx8HfB4xM39XW0sBgDGCqzeZnFTXUJWTmgzTjiYhpiuY
         tEormuEm4grhBWWvarS2w7XWyAD2GsHrHyX9WHYWuleR40Vj3GUTS2C3OcCHwzUax9c6
         2gB2V1wuwxgNQFE8ZxviJWyp3JrgyNwrFDPlbBqR1xqNAADhWBbeO8yzjxmhaVyHLNGe
         LkEzmqmbymQuIfLvORAaQGRW+Yn5ZjJnt1MvGGqYzMOTU5cI/MR6dy9NC8687cm5xlYd
         or8MLyaUqanLqBjJ5y2QsiErSgWFypncYgw+LF2yWHWmB8LnV6KoYrPOHX+mf9CwRpKk
         cJ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717662974; x=1718267774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l/J1TIi/7S4IHb480Bty9F4Vdib6r6GgqM8DD5E175o=;
        b=Uor5+JlDXCt6Wotd/K8E/7xTUltUsfccs+rm63qisO0KJyyGdTghuD3rwXQ2bEM5Ut
         Bjh9oCtTGjM2rScVYe0Qh04wFb6kude17cqzK004TAHjCEIgecum/VApdewN++sD/kQz
         WevZM9hOp+Ddg+6SKGH6T4k4N7KKS5nJdTUJrOXf7efJuJzGgSBb+SJ8eFksRXcKbEhY
         DX+DkV4f4FXKs1N02l75xZoNE0GzkCLEqje70yUmXDZDjFzPIe90W23sQlLvz6D/7fLn
         OAUkhqrh1yDNYpeoQ3qoKc58mVHeMS8A6VoRgMPLk6Ju2Bq22eqdEj4gNui7+415LRsE
         70Xw==
X-Forwarded-Encrypted: i=1; AJvYcCV4wsIxNKUsYXbm9b6DHr1HG2PNsg08FW3swY2LPst1sXyrsTIzjjESYPuN2KqwEePXuGUYnOI4W94aOz4PEi8Pz8pqgHppmFJp5YZAUF5T
X-Gm-Message-State: AOJu0YwmUU0g5XGhVrDR9BTzwLjoGa3/V+KI6IZoJ1YHu8rb7U6+uNfT
	DI8CFmfRF/4VXWY1i5JzQutWzzb/21Di2w4jDDdubQxQ/avXsw1z
X-Google-Smtp-Source: AGHT+IF35oLFaWQj+hx8WmPQ4FtMX7jukB9MjmKafgBVECEtPc5fpKtMXkXT+P0QtvixG3SwQGYS6A==
X-Received: by 2002:a05:6870:9613:b0:24c:a8cd:c0fa with SMTP id 586e51a60fabf-2544077953cmr953560fac.21.1717662973990;
        Thu, 06 Jun 2024 01:36:13 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25447eb8f8bsm267977fac.27.2024.06.06.01.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 01:36:13 -0700 (PDT)
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
Subject: [PATCH v16 0/5] riscv: sophgo: add clock support for sg2042
Date: Thu,  6 Jun 2024 16:36:04 +0800
Message-Id: <cover.1717661798.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_013618_300992_68EC2164 
X-CRM114-Status: GOOD (  23.31  )
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

Changes in v16:

  The patch series is based on v6.10-rc1.

  Improved the dirvier code as per comments from Emil Renner Berthing.
  - Split driver source file into three and change from built-in to module.
  - Directly use status/enable pll register, no need to store them.
  - Use FIELD_PREP/FIELD_GET to simplify the code.
  - Some misc code improvements, such as for macro and local variables.

Changes in v15:

  The patch series is based on v6.9-rc5. You can simply review or test the
  patches at the link [16].

  Improved the dirvier code as per 3rd review comments from Stephen Boyd.
  - Converted all parents described by strings to use clk_parent_data or
    clk_hw directly.
  - Just use struct clk_init_data::parent_hws when only have a clk_hw.
  - Removed extra cleanup when use devm.
  - Some misc code improvements.

Changes in v14:

  The patch series is based on v6.9-rc1. You can simply review or test the
  patches at the link [15].

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
Link: https://lore.kernel.org/linux-riscv/cover.1713164546.git.unicorn_wang@outlook.com/ [15]
Link: https://lore.kernel.org/linux-riscv/cover.1714101547.git.unicorn_wang@outlook.com/ [16]

---

Chen Wang (5):
  dt-bindings: clock: sophgo: add pll clocks for SG2042
  dt-bindings: clock: sophgo: add RP gate clocks for SG2042
  dt-bindings: clock: sophgo: add clkgen for SG2042
  clk: sophgo: Add SG2042 clock driver
  riscv: dts: add clock generator for Sophgo SG2042 SoC

 .../bindings/clock/sophgo,sg2042-clkgen.yaml  |   61 +
 .../bindings/clock/sophgo,sg2042-pll.yaml     |   53 +
 .../bindings/clock/sophgo,sg2042-rpgate.yaml  |   49 +
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |   12 +
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |   55 +-
 drivers/clk/sophgo/Kconfig                    |   28 +
 drivers/clk/sophgo/Makefile                   |    4 +
 drivers/clk/sophgo/clk-sg2042-clkgen.c        | 1152 +++++++++++++++++
 drivers/clk/sophgo/clk-sg2042-pll.c           |  570 ++++++++
 drivers/clk/sophgo/clk-sg2042-rpgate.c        |  291 +++++
 drivers/clk/sophgo/clk-sg2042.h               |   18 +
 .../dt-bindings/clock/sophgo,sg2042-clkgen.h  |  111 ++
 include/dt-bindings/clock/sophgo,sg2042-pll.h |   14 +
 .../dt-bindings/clock/sophgo,sg2042-rpgate.h  |   58 +
 14 files changed, 2475 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2042-pll.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2042-rpgate.yaml
 create mode 100644 drivers/clk/sophgo/clk-sg2042-clkgen.c
 create mode 100644 drivers/clk/sophgo/clk-sg2042-pll.c
 create mode 100644 drivers/clk/sophgo/clk-sg2042-rpgate.c
 create mode 100644 drivers/clk/sophgo/clk-sg2042.h
 create mode 100644 include/dt-bindings/clock/sophgo,sg2042-clkgen.h
 create mode 100644 include/dt-bindings/clock/sophgo,sg2042-pll.h
 create mode 100644 include/dt-bindings/clock/sophgo,sg2042-rpgate.h


base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
