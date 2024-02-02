Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE7CC47258
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 06:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x2V9IN2ErFmZLPJ9ErzhF5L/Wyv/G6tHEA+WytbLR/M=; b=mylD8iCc3YQJol
	m6x4HzB0wq2Th4vj5/M9rSLKq6Ufmo2fhfJW+0buwROkqw4XL4MkDcItATVI5xGKXHwR6TusG9agj
	naOECP140Kx3Aay7Wqz/NkFx+N37nJfEtRGKiQJTNVDD4drVa+wFruIVMmGYk3y6BRw4TH1qlwCCy
	8bounp73mQCzCH0YaGaYc99Scgjy2WmWVtGAI8k4RuywvV5m+4U74vXUOBh99BupztBExiHCLS3mM
	5qD93uK7H8MxyBwK896A3FsDvUgvfH54iSElfSHfWq2Ee8sywfpmt9s+R+6X4NthgpvardkWuY4UU
	ez7q4MeP+35GxCNgU7HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVnCp-0000000ARd0-0z5L;
	Fri, 02 Feb 2024 06:39:19 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVnCm-0000000ARcC-2IXZ
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 06:39:18 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-59a1896b45eso824604eaf.1
        for <linux-riscv@lists.infradead.org>; Thu, 01 Feb 2024 22:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706855949; x=1707460749; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jJbEo/Toazrk+xPxIk8inyWPiuGq5pJrmcLxJn+T+WI=;
        b=ZULiNV9EQJpqq64sWoQWdF7Hu+HKAs8GJbAQg3debIygOW0/6PficQXaT6R866yw/2
         KMnrfqvxWwnL42JA/766UVU4XaCxXAnybTHGFvfxJbAtdbYi8bmc6c5AeTMP1BesqVyg
         VAuk574/gPogKXk9AR2Cgl13eJgR5tZUeFmuDQlddGZ2hMypaXa7vu3Pzy27i3KpK9XC
         E71Dldf4gskwKBrYocbW/ocZveniHGY+yd+atymd/Z4/eBQSnRcDujdeuBix3U9BsP0z
         Q2auG/SNa5fNsbroykSGy0f1haXxSifNvrRaItIrylg2TYNG92IQcyIo66W2pe0+P6ZG
         pVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706855949; x=1707460749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jJbEo/Toazrk+xPxIk8inyWPiuGq5pJrmcLxJn+T+WI=;
        b=PpTmvx31HyaDg4JBYYROjO3yXbxZqatFl0FO6Ho0kaK0tib6yVPPZ/gEKvW5LHR4rk
         k+pJ6EdyRBdYWOLv2pprU5haPeVjP9lruCGHR5x0Db58fr8Cy1MV4wcYn+C7H/lUgAMI
         VS7n5x1XkViKqdyfuF4k3Kqba7VbXn8ntaxV31wSGmiLJYZMpdoU/d++LwdjPn0ZmvA3
         bGl9SpnQxhwkKxALzQPI0MzM3/YxGajKCEvBE+3mTcFhP2H5mWklavHlGFUQbRUoHAZv
         LTyfrYbI8LZH6GBO5yFa3GTpzUMYHeiCGZTuxRSUJgk0s9s3Uyg0JSZ3efYJyJ/ujqIb
         1pRg==
X-Gm-Message-State: AOJu0Yx+Ry0sxgZREKrLFpGMHU8zIBlh+hzGM1MVZN4QxC7/vNc7CO2R
	ZsLM/3OzDKPGHRIxXU8H2AgB02zWamEiDC7OzqSYzPmf2z0Bw2VT
X-Google-Smtp-Source: AGHT+IGwsUmKtKQ7cPmsSLpZJJolXyk1TGNZXnqP9wf9YCFH9Dg7QrcMIbyRoqm83Ityw48qUXsJtQ==
X-Received: by 2002:a4a:d6ca:0:b0:599:ba9c:393a with SMTP id j10-20020a4ad6ca000000b00599ba9c393amr6598794oot.0.1706855948981;
        Thu, 01 Feb 2024 22:39:08 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUoW95Sf6wGde/380u1EAZ2lKERzkZFeHkae99XR42pzvscPXgjIwes+2uaUHVqR8QAX/yV2DcOUgWX97pQ/MoGDd5LPuqL9t0TQXTKldZIL9T0iMM/pngv325PB99DIqVn8zTwhiNAfSg448iKnf/KR/1O2Gao9RM3ynIQU5YS3vGzZWCuRwBxUSUhqidHk3nmsssBJ04gFXcEZ1xSAritxbJGm2DpBS1iJHEZ5d5ELRMTBignY9trUMNwEsQ1kQ7+2B+OOqlnWSdcIvR50PEIWSAF6aNfIMFOnJPFm8UIUZRRKXc7tcWuD2gOjweKpLu2zrJAFBGZ2onhI4pENe1MLIgY+Ww7tN95bzaEvw5GkZoEbe4BHWAq1Ns5CQIiLWU5A6MpVg95eGVpQRY1SywnT3O7ApMfwJIMkTnQQ/xUVsVB4aUcauEc6ZgjHInCvZRCjz5ApIH0WzKb9TOSHQbQLKaLX36I19GV2rNkartAeXB7OhdkQBiwrztEVGyNyAtvnI3/uJKW96SEQ9aISJbDTGVxIPNGxwouxtGjrehdhot+p82CyXgOUEfZfG+6Mm4EX1/PBy2n1n4EB/jdpcp+gvH03L2xpHNDS8plO7pzLiXTFttBztPJ0osxReFuVSvntRSCh1vYL0TetnrxqX4mKqoIH7EVFKwi0TSKqNZp+T4=
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 17-20020a4ae1b1000000b0059a530f54c6sm281948ooy.10.2024.02.01.22.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 22:39:08 -0800 (PST)
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
Subject: [PATCH v9 0/5] riscv: sophgo: add clock support for sg2042
Date: Fri,  2 Feb 2024 14:39:00 +0800
Message-Id: <cover.1706854074.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_223916_623773_6583B993 
X-CRM114-Status: GOOD (  17.18  )
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

Changes in v9:
  The patch series is based on v6.8-rc2.

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

---

Chen Wang (5):
  dt-bindings: clock: sophgo: add pll clocks for SG2042
  dt-bindings: clock: sophgo: add RP gate clocks for SG2042
  dt-bindings: clock: sophgo: add clkgen for SG2042
  clk: sophgo: Add SG2042 clock driver
  riscv: dts: add clock generator for Sophgo SG2042 SoC

 .../bindings/clock/sophgo,sg2042-clkgen.yaml  |   37 +
 .../bindings/clock/sophgo,sg2042-pll.yaml     |   45 +
 .../bindings/clock/sophgo,sg2042-rpgate.yaml  |   37 +
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |   12 +
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |   41 +
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/sophgo/Kconfig                    |    8 +
 drivers/clk/sophgo/Makefile                   |    2 +
 drivers/clk/sophgo/clk-sophgo-sg2042.c        | 1401 +++++++++++++++++
 drivers/clk/sophgo/clk-sophgo-sg2042.h        |  233 +++
 .../dt-bindings/clock/sophgo,sg2042-clkgen.h  |  111 ++
 include/dt-bindings/clock/sophgo,sg2042-pll.h |   14 +
 .../dt-bindings/clock/sophgo,sg2042-rpgate.h  |   58 +
 14 files changed, 2001 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2042-pll.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2042-rpgate.yaml
 create mode 100644 drivers/clk/sophgo/Kconfig
 create mode 100644 drivers/clk/sophgo/Makefile
 create mode 100644 drivers/clk/sophgo/clk-sophgo-sg2042.c
 create mode 100644 drivers/clk/sophgo/clk-sophgo-sg2042.h
 create mode 100644 include/dt-bindings/clock/sophgo,sg2042-clkgen.h
 create mode 100644 include/dt-bindings/clock/sophgo,sg2042-pll.h
 create mode 100644 include/dt-bindings/clock/sophgo,sg2042-rpgate.h


base-commit: 41bccc98fb7931d63d03f326a746ac4d429c1dd3
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
