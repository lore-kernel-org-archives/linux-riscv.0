Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6555DC433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Feb 2022 05:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LRu685P+JW0WeA4LAOc6VU6eGYnYkf00O/g3PraA3uw=; b=bRENrYknPdyjXG
	+hv5Dg+EVGqxpM0SNocGJhJlHp4W5zsxYxKPvTaMlYY1cW9qB2FmVDj4/pDZhDstTXuPGeuLtyRwL
	H2dz7iVBYivccWkMauvSkAHpf5r34wRvNTiE07dfKMg6p4E28dU0NBBWbSM2Etvgum4pWrLnRIxIy
	VLK9HLcnCSa3V6+aHYnrWPRE0ZK0FDeaqT3kSOprCVWaQaiYX8ovJFe3dnhkGTDpgA3l9q+Z970RD
	njfI5kZy30LOVbsAZZ2dVlLBGlwGkEga7lPomwHOaSo41M1W+KmNSQaF4s6PzSBL/95W2tAsxLgaR
	fmm8mCrjwN22UpBVyWLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLeTx-000bwv-NH; Sun, 20 Feb 2022 05:10:01 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLeTu-000bvs-0j
 for linux-riscv@lists.infradead.org; Sun, 20 Feb 2022 05:09:59 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 q11-20020a17090a304b00b001b94d25eaecso12231384pjl.4
 for <linux-riscv@lists.infradead.org>; Sat, 19 Feb 2022 21:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J9hsPYcteR10WA7lfsDos/ZOUyC+n8S5x6ZzrXPZlWU=;
 b=WItHiDHMImZT8YkqravV5XN9IAt8UdgYE2yTJI3gUEl7h7t4Krs79t1kMYXbckyQ3p
 Ui6Zon1OHSYH1+2I+tKYeAzSfvHJ/JuSBdRf35gnRaaSt96/E15eOCxm7TvH5CTB/Gg0
 U/cJAVAtZyWOYSPrO08c24iE6CxKOEeslduPvdoNVYhRDnHzW7z60g8F1Nk46OIs8xOO
 7BmFSNVWmLEWDtbk7b+Uoan0jlwr5rFxY7hYfLc0ZLWmtCskcD9s2ZirwBJmQ18gQHjR
 jQ4jxZxv82L/7inw+9HddWTxiLOQ4P7eDxK4tXhlE29LnezJpTry4r8+clnvI/xMCZTW
 ElAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J9hsPYcteR10WA7lfsDos/ZOUyC+n8S5x6ZzrXPZlWU=;
 b=P6u7w5r/2Zi3MB+s6a16P2Z1nUQ/0yufdrDP45rd2/fLO2Cq2U8k3y7ynx+kw3zaOf
 Www3E7n1uN8YG4G3maqOxse65Bfvyiss6T+kftbWZI4hBmYOLPJTq4pr/RdbGtn+Y2d7
 Iwv5yxU+DSDXqsjbr8BbG7mhz23oNnYLZr/riNI2M8GzLrwDM3n+uM41OTq9DhgYf56h
 SVJA2p3IMtXzTvRTxtXFqpqfFGXXQg8XqpOGWVLDxIT/Ntqc6w/5QgBW5iVACMq9pKeY
 YyqyI+9PYWKc5sU5sYcaTS0hZ/TVumreMpvrlaVWrJ0UiHyFYA5xntEYBPqrXBx6KU+G
 oKCw==
X-Gm-Message-State: AOAM5324g5fegvYDLswNOHqoiY1z57hurr7Fb6iBc8ZHerLeQN28iAtN
 vkG5a3wUmkWdMz1AjlW145zbfw==
X-Google-Smtp-Source: ABdhPJzIIsM0NBtAQaKFWKl0r/CtXB/tsXYkX1yg2VL7Ra8z/kgM1Ps334KF1VdRvu12Umj2DbcGIg==
X-Received: by 2002:a17:903:11cc:b0:14d:a0d5:76f with SMTP id
 q12-20020a17090311cc00b0014da0d5076fmr14104216plh.109.1645333795268; 
 Sat, 19 Feb 2022 21:09:55 -0800 (PST)
Received: from localhost.localdomain ([122.162.118.38])
 by smtp.gmail.com with ESMTPSA id 84sm7602730pfx.181.2022.02.19.21.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Feb 2022 21:09:54 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 0/6] RISC-V IPI Improvements
Date: Sun, 20 Feb 2022 10:38:48 +0530
Message-Id: <20220220050854.743420-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220219_210958_090194_A48E5389 
X-CRM114-Status: GOOD (  12.13  )
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

These patches were originally part of the "Linux RISC-V ACLINT Support"
series but this now a separate series so that it can be merged independently
of the "Linux RISC-V ACLINT Support" series.
(Refer, https://lore.kernel.org/lkml/20211007123632.697666-1-anup.patel@wdc.com/)

These patches are also a preparatory patches for the up-coming:
 1) Linux RISC-V AIA support
 2) KVM RISC-V TLB flush improvements
 3) Linux RISC-V SWI support

These patches can also be found in riscv_ipi_imp_v3 branch at:
https://github.com/avpatel/linux.git

Changes since v2:
 - Rebased on Linux-5.17-rc4
 - Updated PATCH2 to not create synthetic INTC fwnode and instead provide
   a function which allows drivers to directly discover INTC fwnode

Changes since v1:
 - Use synthetic fwnode for INTC instead of irq_set_default_host() in PATCH2

Anup Patel (6):
  RISC-V: Clear SIP bit only when using SBI IPI operations
  irqchip/riscv-intc: Allow drivers to directly discover INTC hwnode
  RISC-V: Treat IPIs as normal Linux IRQs
  RISC-V: Allow marking IPIs as suitable for remote FENCEs
  RISC-V: Use IPIs for remote TLB flush when possible
  RISC-V: Use IPIs for remote icache flush when possible

 arch/riscv/Kconfig                |   1 +
 arch/riscv/include/asm/ipi-mux.h  |  45 ++++++
 arch/riscv/include/asm/irq.h      |   4 +
 arch/riscv/include/asm/sbi.h      |   2 +
 arch/riscv/include/asm/smp.h      |  49 +++++--
 arch/riscv/kernel/Makefile        |   1 +
 arch/riscv/kernel/cpu-hotplug.c   |   3 +-
 arch/riscv/kernel/ipi-mux.c       | 223 ++++++++++++++++++++++++++++++
 arch/riscv/kernel/irq.c           |  22 ++-
 arch/riscv/kernel/sbi.c           |  18 ++-
 arch/riscv/kernel/smp.c           | 164 +++++++++++-----------
 arch/riscv/kernel/smpboot.c       |   5 +-
 arch/riscv/mm/cacheflush.c        |   5 +-
 arch/riscv/mm/tlbflush.c          |  93 +++++++++++--
 drivers/clocksource/timer-clint.c |   8 +-
 drivers/irqchip/irq-riscv-intc.c  |  62 ++++-----
 16 files changed, 548 insertions(+), 157 deletions(-)
 create mode 100644 arch/riscv/include/asm/ipi-mux.h
 create mode 100644 arch/riscv/kernel/ipi-mux.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
