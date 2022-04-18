Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D42C4C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Apr 2022 10:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h+Kj7ddUxNYguVZWb78p4+3JyyDSURXC4etnTAwQW70=; b=DjmMAp2wU4bEe9
	/Y3qa9B2QQ177PhldGvYRjCxAAsUX3DGFJl/hudaupxBLpzPrS1Gj/lysR8Fy4dUUxYa593xAW7ML
	h45KTH0faLTE6LXHdjOuyBeFebonisb7VFOsWbKR1GkoDxfRVpVFgpzlvXjORhSFW0uJfNGiGQ41U
	zuOyRbnDO+oxBepibllON932/+8vKOQvGbuSb4Joc2TeczBgB9SHgZYTKU0kIHLPBFa88Q9MYRjUR
	FurumRFQ6zBrTYf4D1kfgzjqN9s0zDnDqtS+WvGtUX0NUlkOLigF9zR6ZQ2nM8DM/kkkIBrZzOMPv
	pB+AzUjtreed6r/fMaXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngP0x-00GNOX-38; Mon, 18 Apr 2022 10:53:51 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngP0t-00GNNC-AN
 for linux-riscv@lists.infradead.org; Mon, 18 Apr 2022 10:53:48 +0000
Received: by mail-pg1-x536.google.com with SMTP id t13so18224159pgn.8
 for <linux-riscv@lists.infradead.org>; Mon, 18 Apr 2022 03:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=her0KFXUz9ZM0eej9Tysz7JCVsy+0ZU1+POTkCVRJPk=;
 b=BTMPZTQ6i3UnKiuixUwA9qpCyzIB/p/mZE8778CnegoWieKLJqqpZfXpqkP0LqOWmi
 nQkwXeT+QlIdkJFiXcsZ6B7rh5fcmDRCMgRRI+vcernAOKt7BtmzCZEl9ThkyGehDvEL
 0stXaNy9UWBh+iKF6si6AbPtjpUBajNPUPOM6yOSwRIqeQDIiHSACwZ7/Sed5z12J/Kg
 cNdX8KDQiqbQy9Cq+zstlFwhrS3EewCTs96+HaYKVeIBkndydKJoGrBO8nX/k+z2gXiq
 LC8NhSuaVjazf15cqhWQc4QBYYFxsnGaUf7gV5Pxj6j7H+CIbopx80AT2cq+tmuDaAQe
 qoQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=her0KFXUz9ZM0eej9Tysz7JCVsy+0ZU1+POTkCVRJPk=;
 b=0WUDCCOYXkgKz9ablTsg0m7MpCmyrsq42kHUHgDBOfcUGjZXcdEnCZDoIbxd0MwJq1
 gBocgOQU9kQSD+6v/wSEQwMxJ30cIVs3OvuttRtbhqia78Stl+iVpLnpNa85WxEx/MID
 YMRrcFk+5ImRVW0+6YaYHHwMlOmOZTItbMUMCLdWVRkXJ12rpJz5aeU5fZ6m5S4skgmQ
 SP8rnGhrH1RZnq9uI97o4g3hU16WUmBHBpxNdteqq0VSwnswdIR2Er42N1pUsNimPf+p
 np6ilbD8td5aldhoGuPjPj7wrNg98yoBLUe3ZRq/fwEX6QZ/xfMSdpmhekFEXdxUZqhN
 U3xg==
X-Gm-Message-State: AOAM531b3Yf7fg6qvJo48VIasPE8NNg7ubOsoFjJ3WCZa8avZqvJ7sy3
 J5rH3UafLBM9pzMr+rb+zY5c4A==
X-Google-Smtp-Source: ABdhPJysT7CWdPdJ4dp09F7+iT+mxn/7CeeF09kO5aewy36J0xFI6mTXW+GLV3EJYhltb8j2V35j/w==
X-Received: by 2002:a65:6a07:0:b0:39d:8c35:426b with SMTP id
 m7-20020a656a07000000b0039d8c35426bmr9750747pgu.171.1650279222665; 
 Mon, 18 Apr 2022 03:53:42 -0700 (PDT)
Received: from localhost.localdomain ([122.172.241.223])
 by smtp.gmail.com with ESMTPSA id
 j13-20020a056a00130d00b004f1025a4361sm12986278pfu.202.2022.04.18.03.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 03:53:41 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v6 0/7] RISC-V IPI Improvements
Date: Mon, 18 Apr 2022 16:22:58 +0530
Message-Id: <20220418105305.1196665-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_035347_383897_1C0C1B99 
X-CRM114-Status: GOOD (  14.14  )
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

This series aims to improve IPI support in Linux RISC-V in following ways:
 1) Treat IPIs as normal per-CPU interrupts instead of having custom RISC-V
    specific hooks. This also makes Linux RISC-V IPI support aligned with
    other architectures.
 2) Remote TLB flushes and icache flushes should prefer local IPIs instead
    of SBI calls whenever we have specialized hardware (such as RISC-V AIA
    IMSIC and RISC-V SWI) which allows S-mode software to directly inject
    IPIs without any assistance from M-mode runtime firmware.

These patches were originally part of the "Linux RISC-V ACLINT Support"
series but this now a separate series so that it can be merged independently
of the "Linux RISC-V ACLINT Support" series.
(Refer, https://lore.kernel.org/lkml/20211007123632.697666-1-anup.patel@wdc.com/)

These patches are also a preparatory patches for the up-coming:
 1) Linux RISC-V AIA support
 2) KVM RISC-V TLB flush improvements
 3) Linux RISC-V SWI support

These patches can also be found in riscv_ipi_imp_v6 branch at:
https://github.com/avpatel/linux.git

Changes since v5:
 - Rebased on Linux-5.18-rc3
 - Used kernel doc style in PATCH3
 - Removed redundant loop in ipi_mux_process() of PATCH3
 - Removed "RISC-V" prefix form ipi_mux_chip.name of PATCH3
 - Removed use of "this patch" in PATCH3 commit description
 - Addressed few other nit comments in PATCH3

Changes since v4:
 - Rebased on Linux-5.17
 - Includes new PATCH3 which adds mechanism to multiplex a single HW IPI

Changes since v3:
 - Rebased on Linux-5.17-rc6
 - Updated PATCH2 to not export riscv_set_intc_hwnode_fn()
 - Simplified riscv_intc_hwnode() in PATCH2

Changes since v2:
 - Rebased on Linux-5.17-rc4
 - Updated PATCH2 to not create synthetic INTC fwnode and instead provide
   a function which allows drivers to directly discover INTC fwnode

Changes since v1:
 - Use synthetic fwnode for INTC instead of irq_set_default_host() in PATCH2

Anup Patel (7):
  RISC-V: Clear SIP bit only when using SBI IPI operations
  irqchip/riscv-intc: Allow drivers to directly discover INTC hwnode
  genirq: Add mechanism to multiplex a single HW IPI
  RISC-V: Treat IPIs as normal Linux IRQs
  RISC-V: Allow marking IPIs as suitable for remote FENCEs
  RISC-V: Use IPIs for remote TLB flush when possible
  RISC-V: Use IPIs for remote icache flush when possible

 arch/riscv/Kconfig                |   2 +
 arch/riscv/include/asm/irq.h      |   4 +
 arch/riscv/include/asm/sbi.h      |   2 +
 arch/riscv/include/asm/smp.h      |  49 +++++---
 arch/riscv/kernel/Makefile        |   1 +
 arch/riscv/kernel/cpu-hotplug.c   |   3 +-
 arch/riscv/kernel/irq.c           |  21 +++-
 arch/riscv/kernel/sbi-ipi.c       |  60 +++++++++
 arch/riscv/kernel/sbi.c           |  11 --
 arch/riscv/kernel/smp.c           | 164 +++++++++++++------------
 arch/riscv/kernel/smpboot.c       |   5 +-
 arch/riscv/mm/cacheflush.c        |   5 +-
 arch/riscv/mm/tlbflush.c          |  93 +++++++++++---
 drivers/clocksource/timer-clint.c |  41 +++++--
 drivers/irqchip/irq-riscv-intc.c  |  60 ++++-----
 include/linux/irq.h               |  11 ++
 kernel/irq/Kconfig                |   4 +
 kernel/irq/Makefile               |   1 +
 kernel/irq/ipi-mux.c              | 197 ++++++++++++++++++++++++++++++
 19 files changed, 567 insertions(+), 167 deletions(-)
 create mode 100644 arch/riscv/kernel/sbi-ipi.c
 create mode 100644 kernel/irq/ipi-mux.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
