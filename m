Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D74CC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Nov 2022 09:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZSoNWSGSTqiRw+7WfweJm+SApoRmFDTG+P+vDv9wi70=; b=B7aCZ8vK6B0KOG
	jD/A7/J9QvRzcIDgSVKUCBtX9HcMvWYQUWT0EOn9HQCHtIN719SnFpRdQGPm3et32fvTLY90UD2Vs
	hpCi82PtRaXNf4HZNR+3Sj1kj2sf/9yVk1ImY7Cp9kG0o5XXAF6X2ZUleid35nUJYywL3h96qTfKx
	mhhyhRtoAigFWqtCo6SpS8b6E2qXF/XK5g0xI4slXQfykoE5FvS2dJPcGIULTCmPOdpN5Tikx+FMJ
	FKdoaG8ODrfcTinjjuX9WxAGgYW+wvLxs7lhxlacPcxafqOKwkL8Mq/2SRqVeXDpoGF6/myY1ozld
	I323FZEm11miwGd/zcNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVwL-00HEa9-2V; Mon, 14 Nov 2022 09:39:41 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVwH-00HEXR-5X
	for linux-riscv@lists.infradead.org; Mon, 14 Nov 2022 09:39:39 +0000
Received: by mail-ot1-x333.google.com with SMTP id w26-20020a056830061a00b0066c320f5b49so6332147oti.5
        for <linux-riscv@lists.infradead.org>; Mon, 14 Nov 2022 01:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eV8k2aGjfM7iqdIwfhHzpd30GsE9w9UeElnqo1gOQMU=;
        b=PJ8CFMjLrMeXPyAd586Fg3053DQvr5aHARKbsjoa+CcDf+8TGaztqSNPIYtxw2gIC4
         xXYLM6qr0U2QXRPDAyFR2YRWyG8ELD712G7awrAiVo+s8xx8vFRJkxqjGrCU0Toz6YUw
         1vnqBxMCTbdK0RN1kb01+umMio8+hzNEXQUCpePh0UwgDx96F5isodwttkrqlG0CS82Q
         J+HA22Z22L6zjVjc+2yGwvr3/xSczNvYilUMZp+hMcsMv756tM9O3jqotAw3oQ4Sj3+Z
         yxDgZn9Kd3PnpitqMFfCZkJSKyhyI6ERAkqKMFcm/oNcz7wq53kRPuAsJS3LjHZKrsu5
         fujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eV8k2aGjfM7iqdIwfhHzpd30GsE9w9UeElnqo1gOQMU=;
        b=qLTZku2eex+PfU9vvJrh+/OAGe9egWNmet0F809jnrsQ+iJ5pt7vAmfIJ2x12os6hq
         XhFwq+KOpBwRAL76DtdqzPQ2tFaPUFKC6fJbG8n9voVZdqC5dvu1cN1OstqFukucXuQt
         2aKg9ixrLyTsuesfpQWO7FnNQwMGiMi1onfu7Kv/3T/zKl8AUIKqBUdpVGD7hKNTLWte
         HYRx24DV8AmtlZ9FlWBAOPM14IiRzLMdPjMpHO2D9B92yKOEDvHP7VR4ls/Vj6eYsw6e
         xrr+R7q9GzIHweBqdNOD39pTVYB4rQP6rq6NglU1TPX6Xj8HIriEi4t7k/Ma2dbcpJHp
         WysQ==
X-Gm-Message-State: ANoB5pnjxSU9Iz2xqcC0KSd0pcb8LpeY/+rLMKXNsVs1ttEvR/p6+fo6
	N8a+aWvJiDnsZUAmalIPvTYy5A==
X-Google-Smtp-Source: AA0mqf6hyKNfScoz1m6kuaiyz6qHJRU0MZqU3fbehjJHjEM2TSQwzjqHQnG70FCzgKA8tiZWHODOhQ==
X-Received: by 2002:a9d:6e8c:0:b0:637:28be:7934 with SMTP id a12-20020a9d6e8c000000b0063728be7934mr5953269otr.107.1668418773132;
        Mon, 14 Nov 2022 01:39:33 -0800 (PST)
Received: from anup-ubuntu64-vm.. ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id l12-20020a4ae38c000000b0049f3bdd791esm3222677oov.26.2022.11.14.01.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 01:39:32 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v11 0/7] RISC-V IPI Improvements
Date: Mon, 14 Nov 2022 15:08:57 +0530
Message-Id: <20221114093904.1669461-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_013937_246941_DA820FD3 
X-CRM114-Status: GOOD (  16.46  )
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
 2) Linux RISC-V SWI support

These patches can also be found in riscv_ipi_imp_v11 branch at:
https://github.com/avpatel/linux.git

Changes since v10:
 - Rebased on Linux-6.1-rc5
 - Drop the "!(pending & ibit)" check in ipi_mux_send_mask() of PATCH3
 - Disable local interrupts in ipi_mux_send_mask() of PATCH3 because we
   can be preempted while using a per-CPU temporary variable.

Changes since v9:
 - Rebased on Linux-6.1-rc3
 - Updated header comment block of ipi-mux.c in PATCH3
 - Use a struct for global data of ipi-mux.c in PATCH3
 - Add per-CPU temp cpumask for sending IPIs in PATCH3
 - Drop the use of fwspec in PATCH3
 - Use static key for ipi_mux_pre_handle() and ipi_mux_post_handle()
   in PATCH3
 - Remove redundant pr_warn_ratelimited() called by ipi_mux_process()
   in PATCH3
 - Remove CPUHP thingy from ipi_mux_create() in PATCH3

Changes since v8:
 - Rebased on Linux-6.0-rc3
 - Use dummy percpu data as parameter for request_percpu_irq() in PATCH4.

Changes since v7:
 - Rebased on Linux-6.0-rc1
 - Use atomic operations to track per-CPU pending and enabled IPIs in PATCH3.
   (Note: this is inspired from IPI muxing implemented in
    drivers/irqchip/irq-apple-aic.c)
 - Made "struct ipi_mux_ops" (added by PATCH3) flexible so that
   drivers/irqchip/irq-apple-aic.c can adopt it in future.

Changes since v6:
 - Rebased on Linux-5.19-rc7
 - Added documentation for struct ipi_mux_ops in PATCH3
 - Dropped dummy irq_mask()/unmask() in PATCH3
 - Added const for "ipi_mux_chip" in PATCH3
 - Removed "type" initialization from ipi_mux_domain_alloc() in PATCH3
 - Dropped translate() from "ipi_mux_domain_ops" in PATCH3
 - Improved barrier documentation in ipi_mux_process() of PATCH3
 - Added percpu check in ipi_mux_create() for parent_virq of PATCH3
 - Added nr_ipi parameter in ipi_mux_create() of PATCH3

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
 arch/riscv/include/asm/sbi.h      |   7 +
 arch/riscv/include/asm/smp.h      |  49 ++++--
 arch/riscv/kernel/Makefile        |   1 +
 arch/riscv/kernel/cpu-hotplug.c   |   3 +-
 arch/riscv/kernel/irq.c           |  21 ++-
 arch/riscv/kernel/sbi-ipi.c       |  80 +++++++++
 arch/riscv/kernel/sbi.c           |  11 --
 arch/riscv/kernel/smp.c           | 166 +++++++++---------
 arch/riscv/kernel/smpboot.c       |   5 +-
 arch/riscv/mm/cacheflush.c        |   5 +-
 arch/riscv/mm/tlbflush.c          |  93 +++++++++--
 drivers/clocksource/timer-clint.c |  43 +++--
 drivers/irqchip/irq-riscv-intc.c  |  60 +++----
 include/linux/irq.h               |  18 ++
 kernel/irq/Kconfig                |   5 +
 kernel/irq/Makefile               |   1 +
 kernel/irq/ipi-mux.c              | 268 ++++++++++++++++++++++++++++++
 19 files changed, 675 insertions(+), 167 deletions(-)
 create mode 100644 arch/riscv/kernel/sbi-ipi.c
 create mode 100644 kernel/irq/ipi-mux.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
