Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B303C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jan 2022 05:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JUe4ZMcXNG5AeHkyXJbImC3Fcvf3iCd9YyE4vgVdTpo=; b=L7Dxkq4pJEnp+Z
	YLInIBhTVSSdNyoV5Rc8KzVFzfEU8kosMb1BNckqpwmNlGl43gf7cOVnAJ7q8FSaJwYosowDiNj0r
	Fv6ofmubbmLO84Bsgz8PSGYoXy7y8CS37GviKXYfq8ioh800K/TTUlPU0QMcFqryPAxJnVIoqRyGm
	U1Fq+qt7Malp/voIFKV1IOqrZSSbsNLRzMfnrf7mfdC6OJ2fshfQFRykt+ar5HBbNmbeisH3gsXoU
	IcqXyvBpPfRr5Q+m0lgLMsMZjCsjJn0kG2xfus62E7mlGCad2LKGGzHQC25biWjZP7amxNutzxwEg
	Iy4Kn5F4V2ArCWbax+8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDJlc-000RU3-PW; Fri, 28 Jan 2022 05:25:48 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDJlZ-000RTd-Kk
 for linux-riscv@lists.infradead.org; Fri, 28 Jan 2022 05:25:47 +0000
Received: by mail-pf1-x42b.google.com with SMTP id i17so5106639pfq.13
 for <linux-riscv@lists.infradead.org>; Thu, 27 Jan 2022 21:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DUZSzAcBhhZobyRqFeEeGc1759qGpQJqQcRHPtjlbUQ=;
 b=TEF4bPPwMHipCR6h448CMERqnyvi/R7CVUVo5I/BGCZC6VmMF1O1OVn0AzQrJunM5F
 pvT8wXP3kw91xkxEvvjkgNF88OTWWptcIwbkLV0sMyhRJcJkSlbgLeA8MqF75pZDssrG
 E2YrUZf4Vsovudo+OfLuj2FYq72lWEVnxDtTU+HsbodjxLJmO4CuQLNEadbhDTNH4D1B
 Zkw7Zu51/0k+OQVj9jDxtcDJrxS4mknTzssjtUAWER5ROv3PkYz96pkAgcYpntX53QP5
 X23kPt64tl6woC8cCvq6BBnJT4jbr2gMCnJZRT1o5riDDFA4Wajg7sZsmiXSfXYVroza
 viog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DUZSzAcBhhZobyRqFeEeGc1759qGpQJqQcRHPtjlbUQ=;
 b=kjWWZ3Sm/4pA3bQCeX9mMZwxWmELiL/I4pkToQJAshHlPWXbfvC9BCak4F3Ua1NbHh
 uuJx519iy6kbJrMdKGhe1ja33aHPdRP0vHfVzZddDtJZ8wunvCttCJ7KhF/KsxVQdLNC
 rN2MBadiFLE7K+JglM7n/2Y0ZJRAUrYwnip6IWEOTzSTcMWghZs4CYCNaW1M2JUcYPsV
 L27SCeYwH0fBNZs+xTUbOsnigo0sULLqiRGhDkg98G1p/tZIUyOLhT9nThVpH3ZOZswG
 zQ2IkC0gM1a8g8cu8DfuesT9JUbMncNa0NzXXQy89IIXB3Iqpc6T/0/1uphhNB6uUZM1
 OIIA==
X-Gm-Message-State: AOAM530EDb78zwn5JCdy66xOm/fZ4sJpvxitKXkS1RrUwpv8+lIcHwTV
 trBT95Gi0jK3Dsjz+GFD2q0Uag==
X-Google-Smtp-Source: ABdhPJwGmC85dSyvoA9FlcpwnwdXnTb6JDpj7JG673O2Cyimnrc2fRGqbcNyrCwVYDsKEKcCA2K32A==
X-Received: by 2002:a62:e317:: with SMTP id g23mr6320329pfh.49.1643347544629; 
 Thu, 27 Jan 2022 21:25:44 -0800 (PST)
Received: from localhost.localdomain ([122.171.184.231])
 by smtp.gmail.com with ESMTPSA id b20sm7731744pfv.134.2022.01.27.21.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 21:25:44 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 0/6] RISC-V IPI Improvements
Date: Fri, 28 Jan 2022 10:54:59 +0530
Message-Id: <20220128052505.859518-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_212545_710870_4C9B2955 
X-CRM114-Status: GOOD (  10.81  )
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
    IMSIC and RISC-V ACLINT) which allows S-mode software to directly inject
    IPIs without any assistance from M-mode runtime firmware.

These patches were already part of the "Linux RISC-V ACLINT Support" series
but this now a separate series so that it can be merged independently of
the "Linux RISC-V ACLINT Support" series.
(Refer, https://lore.kernel.org/lkml/20211007123632.697666-1-anup.patel@wdc.com/)

These patches are also a preparatory patches for the up-coming:
 1) Linux RISC-V ACLINT support
 2) Linux RISC-V AIA support
 3) KVM RISC-V TLB flush improvements

These patches can also be found in riscv_ipi_imp_v2 branch at:
https://github.com/avpatel/linux.git

Changes since v1:
 - Use synthetic fwnode for INTC instead of irq_set_default_host() in PATCH2

Anup Patel (6):
  RISC-V: Clear SIP bit only when using SBI IPI operations
  irqchip/riscv-intc: Create domain using named fwnode
  RISC-V: Treat IPIs as normal Linux IRQs
  RISC-V: Allow marking IPIs as suitable for remote FENCEs
  RISC-V: Use IPIs for remote TLB flush when possible
  RISC-V: Use IPIs for remote icache flush when possible

 arch/riscv/Kconfig                |   1 +
 arch/riscv/include/asm/ipi-mux.h  |  45 ++++++
 arch/riscv/include/asm/irq.h      |   2 +
 arch/riscv/include/asm/sbi.h      |   2 +
 arch/riscv/include/asm/smp.h      |  49 +++++--
 arch/riscv/kernel/Makefile        |   1 +
 arch/riscv/kernel/cpu-hotplug.c   |   3 +-
 arch/riscv/kernel/ipi-mux.c       | 223 ++++++++++++++++++++++++++++++
 arch/riscv/kernel/irq.c           |  16 ++-
 arch/riscv/kernel/sbi.c           |  18 ++-
 arch/riscv/kernel/smp.c           | 164 +++++++++++-----------
 arch/riscv/kernel/smpboot.c       |   5 +-
 arch/riscv/mm/cacheflush.c        |   5 +-
 arch/riscv/mm/tlbflush.c          |  93 +++++++++++--
 drivers/clocksource/timer-clint.c |  21 ++-
 drivers/clocksource/timer-riscv.c |  11 +-
 drivers/irqchip/irq-riscv-intc.c  |  67 ++++-----
 drivers/irqchip/irq-sifive-plic.c |  19 +--
 18 files changed, 563 insertions(+), 182 deletions(-)
 create mode 100644 arch/riscv/include/asm/ipi-mux.h
 create mode 100644 arch/riscv/kernel/ipi-mux.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
