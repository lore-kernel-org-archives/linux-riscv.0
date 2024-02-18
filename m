Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73732C48BC4
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Feb 2024 02:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C5iroSQhEB8D9dR0WIfOuLMTQY0uNtU1aExfgHrRV5U=; b=w2FhpcuhPSkw2f
	YLohDgmCqMO1jJHOMQ+IN71bGAKWSxBSdOtbPWahMnAdYWpzV4o562SD3aXsXALZuJwG6EHNIH4sr
	4kpJYLPau0xJG/DbKZHEkrtSykcAOXjO3rsvVNO8FgJKOky6TDTtUUUYjOOHoZ+d+8dNTW25pnmgE
	n0iiTmT5hjnqV31xc8I05HnPu4nANI4AzbEWyo1AM5dqQeOQcJjj0sTE7qj5/nhEo55B/facbRtku
	O4MjmwdbYEyqMcNDb0v5dxvsvmjRZDPO2bEA4wDuJbvmgpfpn5Tt9bCQNaprROmr81jl+05zRherH
	rHZDmnh4QbPtvPnk89lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbXGJ-00000006qYN-0aT3;
	Sun, 18 Feb 2024 02:50:39 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbXGG-00000006qXr-1tYI
	for linux-riscv@lists.infradead.org;
	Sun, 18 Feb 2024 02:50:37 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-21e95f4ed73so283409fac.0
        for <linux-riscv@lists.infradead.org>; Sat, 17 Feb 2024 18:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708224635; x=1708829435; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nAJ5ltGfAiLD6zWuVubqrGKYwXO9kCBenaTuBOXA/Uo=;
        b=ZdOQRJnDIhB8AlDhG9iMtpcQEYLJAzBVrKx4gei0yUVO3BB6NfcicF+ZvUxFWpXJqa
         YPx2CKbT95WyFRO3SX34+8Uuo40/f0B0rfB7mSWWPeGE0iGq4xRQpbpftqOCwOUnuW3x
         zSdcyKA4V3eTiWm7p1jFcJWFI12Z6R7qfnIPFce8YSe7FIGyR9VQfT7ANdggYJhhnY/f
         72JMXOtSz99N/mlS6+mY/sY9miK6fiZrX5fKLqHvbCW8Omuic6KSwQ/Q6wpkXkHAYZly
         smo4VTNbgJCo4BjKWUo2MFEdqDeRw4CTWqSaXqmVRb8YA+ImiheBcJ88dkhW1Dv1ICw4
         Pi3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708224635; x=1708829435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nAJ5ltGfAiLD6zWuVubqrGKYwXO9kCBenaTuBOXA/Uo=;
        b=b4IXLXzrD3poFOWOsH7Au/pkAF0k4wYfr2p3FkzpaQjECBawUW443ONPG2qMdUJ4dP
         Ahlku+ULoTWRln5pPI7gWVh9Am/w+++1jIUk92U9ZM3Z5Mb0CIrbN3HwQhs+T7Mty1gC
         sjIEqXzAsRcTXLHIHlFxD4Bi2pumvN0R30LtsjSe3j6QaBNRjJvfHxroidXUIaeqYCkO
         5CxfQsrwePiqada1eJf1B0niwBPhI/JNli9RCQwJ5XwzNDlVcmpxGVuoebnBi+Byc3/f
         eQCqgmV+7lEETWiAIDvApDfU0LiZIAfSj2fKaDdRrzop93jQtJvhbZwqDNJrlQmO5T/j
         se6g==
X-Forwarded-Encrypted: i=1; AJvYcCWnIk62qrfJj6V/hnfSv1nBPr8esK7EF7FpMgwQeWzjj+uEUbz4nVxVAHVsNSZ2lbNIQe9BO05qOXgWYrXJekyykA8K7pbLWgDVxMWHdFig
X-Gm-Message-State: AOJu0YySRIIBdmZPifKvM2Avghk9kuClcYR/YoP8QwcdCMwiUufWkRbO
	cGor52Yvrrjagrp97eeTXib2qHDWxPrkj/vWkFyUrRhArGHZkaGc
X-Google-Smtp-Source: AGHT+IEZdWRSv6OyEylfT18OqTojeVi3763UrXEQaBYtIT8k8y19STYJnEqc1AWmgd13V+RGI5e++Q==
X-Received: by 2002:a05:6870:440e:b0:219:aa92:a4de with SMTP id u14-20020a056870440e00b00219aa92a4demr10225680oah.21.1708224634539;
        Sat, 17 Feb 2024 18:50:34 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id oz21-20020a056871789500b0021a12cae134sm745615oac.48.2024.02.17.18.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 18:50:34 -0800 (PST)
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
Subject: [PATCH v10 0/5] riscv: sophgo: add clock support for sg2042
Date: Sun, 18 Feb 2024 10:50:25 +0800
Message-Id: <cover.1708223519.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_185036_529435_1A71F989 
X-CRM114-Status: GOOD (  16.94  )
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

Changes in v10:

  The patch series is based on v6.8-rc4.

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
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |   48 +
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/sophgo/Kconfig                    |    8 +
 drivers/clk/sophgo/Makefile                   |    2 +
 drivers/clk/sophgo/clk-sophgo-sg2042.c        | 1401 +++++++++++++++++
 drivers/clk/sophgo/clk-sophgo-sg2042.h        |  233 +++
 .../dt-bindings/clock/sophgo,sg2042-clkgen.h  |  111 ++
 include/dt-bindings/clock/sophgo,sg2042-pll.h |   14 +
 .../dt-bindings/clock/sophgo,sg2042-rpgate.h  |   58 +
 14 files changed, 2026 insertions(+)
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


base-commit: 841c35169323cd833294798e58b9bf63fa4fa1de
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
