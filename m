Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35BEC4706C
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 07:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kohnQDcIsYQTh3OWWB174AH+4DEQ8duAW3rNv+UQmZ0=; b=4hTIYz6tZPwC2M
	RbDXGjZHssvAX3UugBpt7qQa4irjzBNxrfsmpAjib+VgijDxosODunPMBqRGQ0Ou4UiOcBbJy8bSB
	bqrpbKCBZsNlUVVXVMdc+B2mLG1SijdfnmVzR7AQ7yIhdnCWExIEv+EHRZp12eAeE4xDNvL5nkmvl
	QAB1RErTLZs3OPQvdwbOB4qENTcQtaUWiyrSah3XSx525IqcnhK8Sp55eDnuOCPKGXsdLCzWz+HhL
	QvkfvTXdDIQPJUi41dX4UACN7ufhBwkS+gZ+sCa9/5wZ5S0jL8eAUxalGZ41JyU5Ba5iTtD8xf+Ph
	KfkXAK8E2nx6yoWKazJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPdlg-00BC5y-2g;
	Tue, 16 Jan 2024 07:21:52 +0000
Received: from mail-oo1-f47.google.com ([209.85.161.47])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPdld-00BC4Y-1Y
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jan 2024 07:21:51 +0000
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5961a2726aaso5126540eaf.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 23:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705389648; x=1705994448; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jJqSlAU7q9YYEOU/puykZteEqit8IcDYwZiXQDq5f5Q=;
        b=ihneafP9VnVV8/pK5NNCUgJ0VfoDQLcFPjV53WGx7XINrVc0Hlxs17RSZ1+NKrbfV3
         vMkBR6qT5Uzje/X+4EnInu+AuThIKJvp8h12Ug55+ciCzmpABzIP8vmqh3Vo+KnnTxNT
         kAg9t/wzLHUi+rWl8QlJKrLtrY1TgTQ4aG1BY0jnvXTYEfdonplTTq9VrjD6rxEtvdo6
         p4SYN2M3gW4hK1nlmWO0QOQ04LKWQ/rOOEXDobHq39L1Dym7olGJ3QyFrU0OSnrriVZZ
         TUM1gTP4Gz6xu0OHJY67O2GtzI1tT/4x5+c8gJ9lkekq/G9oN/KfZrCYDOSqx1grVF1o
         NLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705389648; x=1705994448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jJqSlAU7q9YYEOU/puykZteEqit8IcDYwZiXQDq5f5Q=;
        b=oOH6GH1+wY2IpdYOaXIMjRh2yuvGm9vAJbrqkvf8Go7SrLX9FNpLBr/mzCcyKqqAUV
         izjSrtMmXQUsHmwKgpTPmeKhPCjp9C8dyxsQL912r+P35YBQup81dvg2wuuF4caIWJqz
         vnOxLEzKZSlL/XuRM9PEwMtvu+xrtW8R2ysf0zJQL5RkvuLSpfljAp8e8+lQeiNxcuzM
         DSC+drcX8trfSH+n6GuDViSEjWRaXz5TjwHq/Rc62Jk0GNKWBuuduq0XV1zh1cFzUXUW
         zFC2LsIsIxq5Eynes/e0YQsjIYZko1MDc4gkHMq5hgPxEN7Xi8FApWkzQc1Gp6CDHuFE
         JNCA==
X-Gm-Message-State: AOJu0YxukwWqSl+NsOPq/YSrCpx5gChut1PvgSx09p09THYv5v7mNy+C
	jDjoQSDeINXNVHFipZ/w5Q0=
X-Google-Smtp-Source: AGHT+IEUP96NmVar7W4hsw8EHmyGci8/JfqqXe3D9G9HzR5hlIK2NsHXM0P3vBPPjoIdRNIUEPsD4g==
X-Received: by 2002:a4a:8c66:0:b0:598:bffb:f1c3 with SMTP id v35-20020a4a8c66000000b00598bffbf1c3mr3028339ooj.13.1705389645949;
        Mon, 15 Jan 2024 23:20:45 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id b5-20020a4aac85000000b005984163c66fsm1949246oon.7.2024.01.15.23.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 23:20:45 -0800 (PST)
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
Subject: [PATCH v8 0/5] riscv: sophgo: add clock support for sg2042
Date: Tue, 16 Jan 2024 15:20:37 +0800
Message-Id: <cover.1705388518.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_232149_521702_172BFD37 
X-CRM114-Status: GOOD (  14.95  )
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

Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v1 [1]
Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v2 [2]
Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v3 [3]
Link: https://lore.kernel.org/linux-riscv/MA0P287MB03329AE180378E1A2E034374FE82A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM/ [4]
Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v4 [5]
Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v5 [6]
Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v6 [7]
Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v7 [8]
Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v8 [9]

---

Chen Wang (5):
  dt-bindings: clock: sophgo: add sysclk for SG2042
  dt-bindings: soc: sophgo: Add Sophgo system control module
  dt-bindings: clock: sophgo: add clkgen for SG2042
  clk: sophgo: Add SG2042 clock generator driver
  riscv: dts: add clock generator for Sophgo SG2042 SoC

 .../bindings/clock/sophgo,sg2042-clkgen.yaml  |   40 +
 .../bindings/clock/sophgo,sg2042-sysclk.yaml  |   44 +
 .../soc/sophgo/sophgo,sg2042-sysctrl.yaml     |   46 +
 MAINTAINERS                                   |    7 +
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |   12 +
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |   39 +
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/sophgo/Kconfig                    |    8 +
 drivers/clk/sophgo/Makefile                   |    2 +
 drivers/clk/sophgo/clk-sophgo-sg2042.c        | 1387 +++++++++++++++++
 drivers/clk/sophgo/clk-sophgo-sg2042.h        |  233 +++
 .../dt-bindings/clock/sophgo,sg2042-clkgen.h  |  111 ++
 .../dt-bindings/clock/sophgo,sg2042-sysclk.h  |   63 +
 14 files changed, 1994 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2042-sysclk.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.yaml
 create mode 100644 drivers/clk/sophgo/Kconfig
 create mode 100644 drivers/clk/sophgo/Makefile
 create mode 100644 drivers/clk/sophgo/clk-sophgo-sg2042.c
 create mode 100644 drivers/clk/sophgo/clk-sophgo-sg2042.h
 create mode 100644 include/dt-bindings/clock/sophgo,sg2042-clkgen.h
 create mode 100644 include/dt-bindings/clock/sophgo,sg2042-sysclk.h


base-commit: 0dd3ee31125508cd67f7e7172247f05b7fd1753a
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
