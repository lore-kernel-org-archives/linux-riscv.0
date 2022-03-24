Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE09C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Mar 2022 15:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zgaGQlI7on3crjYb091u6xrB+tuF9s6O8FFOlT07ZDg=; b=kK7B1n+gABmsDN
	jGvoOj2bFDS/evhBdAib1kDtfrbtnPzIo0ZYgXqt/toR2uS/dL96LTD7yyExy0pfk657oPE9kN45Q
	La7V9t9lfHU8iick2bQfge20Ms9DskzbFF3K8g9pzHkwXp8eN1SN9msc5xzzTXgnmjYSZSpk91RE3
	gPZsfOCQEIg79WEZOtmYPc/m99b6w9Sa1uBpTjLz38dZ5BPkTJfk1V1rAEmub+ojLF5JGiqlUGtsk
	IWb5oLC5LKsWNd2IXYnQThhqUCleVXonESQoGpd9MU0MIBpsxGLm6qhnZOQ9gnSKXsp4b36rhPtRf
	eb4kNP9wSHFjkjs+nkKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXPA7-00H0Go-6G; Thu, 24 Mar 2022 15:14:07 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXPA4-00H0Fx-AL
 for linux-riscv@lists.infradead.org; Thu, 24 Mar 2022 15:14:05 +0000
Received: by mail-pl1-x62d.google.com with SMTP id x2so5002502plm.7
 for <linux-riscv@lists.infradead.org>; Thu, 24 Mar 2022 08:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/lHQwYCz6iMd1XYierGzMlVkOLDpnchjw8A/t5vp6xQ=;
 b=UABAOxJzfwjqipTEfrpgHIDYtfS42ghYAxlCG9X9F4EcQR6zMncrbecT+H3Tz+DPnP
 qskduDciaHgzsfc9Tw4cEbXt5mJrdMoVh/mvPXB0mpjLNMf26IUToeO21tUr3SgwafgE
 o4RAIPikGlHr3Ptcw02hgIGeYSTpDQGqQpDxL9ecJmJQp328ozU15VtzeK8PN0TrGi/T
 SNFGhUpg/dGmukBd0PFNmYdPaGIh9v4yG8nyfldh1U0AkBy9PaJpW7TXoMWbdQ0aFovh
 W6AOM12lPGLtZ7mBGa0xKCA8JY7xCUmR4DxXE2Mz3hbxM3mrktxHOz241Zm4de3ELW+u
 rWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/lHQwYCz6iMd1XYierGzMlVkOLDpnchjw8A/t5vp6xQ=;
 b=uqp1m6edNYurp9VKrtLRYw4/3XHeU+D3EIE428vAESQJO0Hbeb6tio/vwK8L268FHZ
 jiS4zXIkslM4ZOmZu5dgF3WojEU7LM5cm5++fXJgDdrgOq6kIzH42iu+I7ELo9+Lhy3a
 5QT5ozybz9ZpRozn+EJWIUoPtZMnSUCMt9gQANXhBJC1i4pkvURxrBumMcsk2Gf4GJyJ
 EpuJF79+1ksgYBwaKDI9FRL6kq/vcVvty9AERwU1YgD4idv0Bg0djidl2akwZDOi1HZV
 C6FasgectjL/lQZ2wbu/Wx5D7C3lQaQ5j0+NBJWLZ74WySbBtHoXzNsiOLHh+Zj+/Hd7
 8ZnA==
X-Gm-Message-State: AOAM532HHMMwrxxFR5ptiBLk4r4F+64A+KS4icSseWzzbpf/UeILF4ih
 6PR5xjqZDFbNTdHgsa75ANzPUA==
X-Google-Smtp-Source: ABdhPJxd6U3Ruv7PpJ436PVg71gkDyH1nkaWTeT7Uk4oN78ga7bi4rqlCshe73IUNVBMkb12y+Cbyw==
X-Received: by 2002:a17:903:240c:b0:153:c8df:7207 with SMTP id
 e12-20020a170903240c00b00153c8df7207mr6372719plo.44.1648134842828; 
 Thu, 24 Mar 2022 08:14:02 -0700 (PDT)
Received: from localhost.localdomain ([122.171.187.87])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a056a00239000b004fa7103e13csm4166065pfc.41.2022.03.24.08.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 08:14:02 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v5 0/7] RISC-V IPI Improvements
Date: Thu, 24 Mar 2022 20:42:51 +0530
Message-Id: <20220324151258.943896-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_081404_386620_2F79A787 
X-CRM114-Status: GOOD (  13.26  )
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

These patches can also be found in riscv_ipi_imp_v5 branch at:
https://github.com/avpatel/linux.git

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
 arch/riscv/kernel/sbi-ipi.c       |  60 ++++++++++
 arch/riscv/kernel/sbi.c           |  11 --
 arch/riscv/kernel/smp.c           | 164 +++++++++++++-------------
 arch/riscv/kernel/smpboot.c       |   5 +-
 arch/riscv/mm/cacheflush.c        |   5 +-
 arch/riscv/mm/tlbflush.c          |  93 ++++++++++++---
 drivers/clocksource/timer-clint.c |  41 +++++--
 drivers/irqchip/irq-riscv-intc.c  |  60 +++++-----
 include/linux/irq.h               |  28 +++++
 kernel/irq/Kconfig                |   4 +
 kernel/irq/Makefile               |   1 +
 kernel/irq/ipi-mux.c              | 190 ++++++++++++++++++++++++++++++
 19 files changed, 577 insertions(+), 167 deletions(-)
 create mode 100644 arch/riscv/kernel/sbi-ipi.c
 create mode 100644 kernel/irq/ipi-mux.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
