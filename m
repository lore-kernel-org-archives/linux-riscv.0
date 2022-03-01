Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D784C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Mar 2022 04:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZpT55G0IbbmDxoTbQsEskn7Efg4zEESBH3/ezw+KldI=; b=a4mEaHvA2864ge
	jjuT9lVzkD7S5oUeZIiIYK4qTjlOa9zPNnxvoxLe7sG4Z7Rs0bkTYlp7kgpPjoFRhPYodscR3CA32
	VPJAYdMnqegt8ZKpFFWPu9ceFfIXFhQOBXhD1WzFP7mM8L5CnI6zNL1LdoaFvOSXCiAKCP3mBCpxN
	4xBKHp+uWSYzEH5fNkr5SbxhyiX85W/KpT+/pSJDJaqu7mkwAPn3PCDJAko7+ZBkh6vQ63JVO934e
	a81b24az2RwOKza7ePj7A8E7n3e24uzn4HpX7MajgB1O+MeIdLLKtZA5zcc9NBXBQKmvqTR/bwNhB
	XnMrORUSNp88FOkOPKXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOu7W-00Et1X-PE; Tue, 01 Mar 2022 04:28:18 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOu7T-00Et0m-BE
 for linux-riscv@lists.infradead.org; Tue, 01 Mar 2022 04:28:17 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 q7-20020a7bce87000000b00382255f4ca9so48409wmj.2
 for <linux-riscv@lists.infradead.org>; Mon, 28 Feb 2022 20:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6K5ttyZHPJI6iQNDkukm5vwi+JLZaFuZquArtV81RWU=;
 b=UnkPtbKLMI6f2js1SIY0+ma/cDIrkrxu91dMh1pGTF8tMKWD0I9RZTDJMyNX0K9hFi
 HP/ONkBfixicmphAJ68CxBRNiuaN5Gv1BMYIuX8AJ/waJw2QJQ7tayDYqFRKd7J2ugBW
 q1shMzvG1PQAPN4JCGpOwq0vmFF9u7EX2DJJKPnejs4RlJD156ZYnDcaSiRF7rAbzrLf
 zxRoeXbS1vurFNNMrzHVJk8HhguuqjCEbPARr4rW0ac1F+hTTbYzHvGXncibOTKw5XwQ
 DuAtAzbOKJgsQhLgz00NRoo3TRlycVLlpsOKfmyi8L7JVHWjevFFZppsIQMK4bVDbSmP
 OUFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6K5ttyZHPJI6iQNDkukm5vwi+JLZaFuZquArtV81RWU=;
 b=tPH0xwVyEHOp0EkwzZK1Aad1+z9i/3pQM2ZyYG2T7vpBtIL1FERgCFg13NDFtERsjD
 NIkeyVHUnIT8o1BOBKzM08u0NNPKAcvqyPOu3tHh1FglQ1vwE/aPRaqNKkcg1zQYdqTP
 N94dK6k/4L2NRm3d8xihs7JI7xpkYWtVbiw8JLOE6YfvgJRZm5c4Tw6uwj7yGuQJ9Hss
 2DtCW/jaHUZLPNe3YEh8x0QKZIR7wv6Nf5giuYaiWn/xdG0ju66cL/x1KqYPfKvJTG6o
 d3/xG6QtOte+mltM0+bI3byUhoFPM/qA3AztUsnuIpj4BRVK5tbIyRwX5dgwj005dXiQ
 m6QA==
X-Gm-Message-State: AOAM532h6sepXM/vcf/VSrGV9zsKOAx4GqiZBxDRVrRTFG5AvEVJ6mey
 w+Zy8rZh/DMpaNaxRTb++M7Miw==
X-Google-Smtp-Source: ABdhPJyPiJ3pxuvdcHAjFRo93GYUTwZy1y0m1tLQYtRkHQNA0exa4gYQI/SGRx/cKfR8bpN2nRdBAQ==
X-Received: by 2002:a05:600c:14c2:b0:381:80db:c3b2 with SMTP id
 i2-20020a05600c14c200b0038180dbc3b2mr3281139wmh.56.1646108890552; 
 Mon, 28 Feb 2022 20:28:10 -0800 (PST)
Received: from localhost.localdomain ([122.179.35.69])
 by smtp.gmail.com with ESMTPSA id
 2-20020a1c1902000000b00380d3873d6asm1209107wmz.43.2022.02.28.20.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 20:28:10 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v4 0/6] RISC-V IPI Improvements
Date: Tue,  1 Mar 2022 09:57:16 +0530
Message-Id: <20220301042722.401113-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_202815_432104_88FE8752 
X-CRM114-Status: GOOD (  12.31  )
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

These patches can also be found in riscv_ipi_imp_v4 branch at:
https://github.com/avpatel/linux.git

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
 arch/riscv/kernel/irq.c           |  21 ++-
 arch/riscv/kernel/sbi.c           |  18 ++-
 arch/riscv/kernel/smp.c           | 164 +++++++++++-----------
 arch/riscv/kernel/smpboot.c       |   5 +-
 arch/riscv/mm/cacheflush.c        |   5 +-
 arch/riscv/mm/tlbflush.c          |  93 +++++++++++--
 drivers/clocksource/timer-clint.c |   8 +-
 drivers/irqchip/irq-riscv-intc.c  |  60 ++++----
 16 files changed, 546 insertions(+), 156 deletions(-)
 create mode 100644 arch/riscv/include/asm/ipi-mux.h
 create mode 100644 arch/riscv/kernel/ipi-mux.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
