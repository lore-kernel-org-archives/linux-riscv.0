Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B0CC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jan 2022 05:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QVh5lEy8GOR/t/Wp/O02SIL4M6mqOd97iPa+ipGTLxs=; b=Wb0KFGuo+f5qFI
	u53nVTDAoKKddj5O7knodJuLgxKswx7bSFIsCuMdVe/g1yEA2uGZi3/6bQ0i3rC7ithJqCgAkXOS0
	khxgC3bHsKRSIn56S8hpYHg8XZaK/CGJElXBHdByhUQLll5FRiBSHQt3zbkjfYNHzakjpC7COHYID
	+x8VWdOq4ErUffv5kfNxWJYkO/iEmJr1lOtWH2zf25+himHuhly7sxaY9LiUyvqSRJzv2jORNM4b0
	Dq7l3oko1c9GQugT5TUjo69Sv2HAR53cuJZsuhwMNTPIx5EW/R3SC0eusIZmj4/2ohSOYpiiXWkpS
	FVg5+InrPWL+l2Tfq2ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCEcV-006Vje-G8; Tue, 25 Jan 2022 05:43:55 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCEcS-006Vig-Gp
 for linux-riscv@lists.infradead.org; Tue, 25 Jan 2022 05:43:54 +0000
Received: by mail-pj1-x1036.google.com with SMTP id q63so14156077pja.1
 for <linux-riscv@lists.infradead.org>; Mon, 24 Jan 2022 21:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o8bdPFvu0KYwY+deTDk1RV7vsOfEo42xcwC/j+hIQro=;
 b=kc9FKdqXuSjdbaYL7OvcZcEhkGhrE2bP6qaAjucN+PcXjc9ij2U3jpQ+BISAIkkq2Q
 PyjqHDrpfwmKoBvYHm/J6JnQKotXc7XfdsAoveyTjJKIF9D2nEJN4xMTC6XjE/PhZcS6
 e83qL0mDpTIMSm0eRXsdULP0yrFNegDbORZHmk+3igwbH4d068sJxvpiXin2zcdR2SVa
 YmA7ZLhphgVT36DnxL3h9fIyYQC5vNcYOax+v4VgA+RpRmhxWOR6igiBw6muLEgNG88b
 v1eV0mc+v02iOXGLJPc7WdJ8leLJGYSlnWbY2QiAaK/W9nO/KNyo5SRMmkZ+Le0RnfbM
 VBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o8bdPFvu0KYwY+deTDk1RV7vsOfEo42xcwC/j+hIQro=;
 b=LSyS0oCUDS2ln9UqhjGnkEcrYp9BJYxUNRbyvKM4RPs7KU3pFjP8ob2yRfwPxekoNS
 G+cAEEN6i6omnn5gXfWJWvpQu5+stkj2qIoFiUR/jmv0rrXUDB6I0yHSMRkMWEwR42aJ
 hMEjB0lzCOFVGtVlUAjz96e33WIVQiDpHZpo75j+7Z+Lpkin/UXTHy+oOCOV5QfWPEDs
 U4pFiyuBiBI1WjNxGP7USYj8KpeEzZSgoNiHfHWyCxc1RDYpYzA7FWQHpaHXWZnbBWgx
 PBOqPbrtJ2wwbg+AqUtbgUYaKh/1GsKLGKopjSO+N81OML/doSuveVKQ0jeiy6zDlwyC
 DxGw==
X-Gm-Message-State: AOAM531NXngBwG8JkK7IxK+gQzWmiN/tH7/aWAlJzdJRGdTmP8ax8ZNm
 54FqYx8Y8i8xKtCJzj/QTC7Wbk5CI3DSBA==
X-Google-Smtp-Source: ABdhPJzBpyC2qWDsq6GkdaiLHkBIUGrCHoN9Dn3I4c5Jei0Kdyvy3O0ztqpSVka+1k1kZg1p4wiRrw==
X-Received: by 2002:a17:90b:240a:: with SMTP id
 nr10mr1863085pjb.110.1643089430401; 
 Mon, 24 Jan 2022 21:43:50 -0800 (PST)
Received: from localhost.localdomain ([122.179.14.218])
 by smtp.gmail.com with ESMTPSA id c6sm19524508pfl.200.2022.01.24.21.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 21:43:49 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/6] RISC-V IPI Improvements
Date: Tue, 25 Jan 2022 11:12:11 +0530
Message-Id: <20220125054217.383482-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_214352_591740_23B8BD50 
X-CRM114-Status: GOOD (  11.07  )
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

These patches can also be found in riscv_ipi_imp_v1 branch at:
https://github.com/avpatel/linux.git

Anup Patel (6):
  RISC-V: Clear SIP bit only when using SBI IPI operations
  irqchip/riscv-intc: Set intc domain as the default host
  RISC-V: Treat IPIs as normal Linux IRQs
  RISC-V: Allow marking IPIs as suitable for remote FENCEs
  RISC-V: Use IPIs for remote TLB flush when possible
  RISC-V: Use IPIs for remote icache flush when possible

 arch/riscv/Kconfig                |   1 +
 arch/riscv/include/asm/ipi-mux.h  |  45 +++++++
 arch/riscv/include/asm/sbi.h      |   2 +
 arch/riscv/include/asm/smp.h      |  49 +++++--
 arch/riscv/kernel/Makefile        |   1 +
 arch/riscv/kernel/cpu-hotplug.c   |   3 +-
 arch/riscv/kernel/ipi-mux.c       | 217 ++++++++++++++++++++++++++++++
 arch/riscv/kernel/irq.c           |   3 +-
 arch/riscv/kernel/sbi.c           |  18 ++-
 arch/riscv/kernel/smp.c           | 164 +++++++++++-----------
 arch/riscv/kernel/smpboot.c       |   5 +-
 arch/riscv/mm/cacheflush.c        |   5 +-
 arch/riscv/mm/tlbflush.c          |  93 ++++++++++---
 drivers/clocksource/timer-clint.c |   8 +-
 drivers/clocksource/timer-riscv.c |  17 +--
 drivers/irqchip/irq-riscv-intc.c  |  62 ++++-----
 16 files changed, 521 insertions(+), 172 deletions(-)
 create mode 100644 arch/riscv/include/asm/ipi-mux.h
 create mode 100644 arch/riscv/kernel/ipi-mux.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
