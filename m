Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1673CE7716A
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Dec 2024 17:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3z0GHru94sg1DnSrDYSpGiH5nFAXa2wD1KfUrtM3rqM=; b=oiKuDFHXsfEgF8
	cNxZ/RuhaU/R9ixwJu8g/nBrl9MHFCfFD+QXbxHtfZuyEWV6yYlJ6HcZSo7mWQsuM3ki5jSuRLtth
	qnEmDY6+eoOduwgSiwfEXW+Nyii/aJZRaYWtPR9WE+8JiTkA3UAPksALeiXfJhOvVIR2jQ2EQKZKG
	1PhAZxL46apQDPzAuIZzvoN7r3w3EtnkJsoeQg2ZZ7SP16ZLE2uLtymL2M+diwNaTssetA8E5S8c2
	77Ufls7JL3VTMSY0qh1niXsLEm93G9erMd+dG0nkoT7aQHb2ZQICX7J+a8yDABAY/IyGHLlbyd5wM
	xO4YcOcmvS9nP2/8d7RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMVvC-00000006gbG-2Wo5;
	Sat, 14 Dec 2024 17:27:18 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMVu3-00000006gJs-2BKX
	for linux-riscv@lists.infradead.org;
	Sat, 14 Dec 2024 17:26:11 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so1674077a12.3
        for <linux-riscv@lists.infradead.org>; Sat, 14 Dec 2024 09:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734197166; x=1734801966; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mv0bHKD8tx/knjsXKIIRgI9/G/KQE3L8kp8HO/illC0=;
        b=bM4ioEBn8qnCb904DX7O1KMKVgHX6KAyrYVtaxqrERXqCsha8eHnWncyPZ7gG3k3op
         2xuIlLmwaTMe6NjLwVNGOvYZ+IxJMdM4xUig+WggoPjxE09eyQE2ItrDv6UkSoAuXSPa
         /tSMSLji34hVrVNpAE1AjzCwVfi7J/kL+Zyy6c51pUIkQLB9w5apwpSV6r4usktl6OBO
         cAgs4rqoqOZuUEn1M77Q67odBByd0COaEv84xOZ19+vpCwUO6dIjEDyeoLL5jdmwKPBE
         8Iduvd2sG5R86ieYNnRYs4pJFGhhucSVzcVW6SQAlQO9XJQfbwkpA/iopjfpUd2/muVv
         gRCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734197166; x=1734801966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mv0bHKD8tx/knjsXKIIRgI9/G/KQE3L8kp8HO/illC0=;
        b=t4/ZJT3GDUQw204LoNm6TwuLrGcrm1gymc27AXFRzdF/PWCULmOyWKsq1qhgwvd+QO
         ASbLbUuy5Nw2PZRZgZseL0bY2PVlDUId5iN63jgawT412QXUi7TUZVwbnPvKRYMRv7C7
         xRH8Gfi5kLLw9CfnHkNJ8J1u6KJMqJjKzz7h5YrhBrUR8765g7Uvw7bJPqzOXJFkSvjP
         L53naldpk+pEqkN+zG8aTRozPKIfFF86vdYCsBMXak+GyFlYP6Sv1jQcxkhzpxeOoBjZ
         uIfB6urFpzr6RPIHBPqvbEXYE6hhNi2v/IL0P+6cTu+bohDprPMZU0DZ07cMK1Z08T45
         jFhA==
X-Forwarded-Encrypted: i=1; AJvYcCUIFZ3vQzoEprNKtPShhUBzUr6VX9pNhhfJyw8YQVaC1hh2hsBvkzn0pP382samOXX0pk3OB5hlOu37iw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgh6ahD/BLdl0lQiDTl6rCLmi3jKY5KUzYhYc/ZZ/tF7brbLNw
	VOsl/+JQUWGhc6DrRqjEc0enU1paaMnqyWuR8zp+l2uIKFyvs5s395GLv+nRDwI=
X-Gm-Gg: ASbGncskD0cZeulmVoJVwDSD6wc2VFHMuy51hi8fZODDPFCjDzBmOYDspBojFvehWZH
	JK+mtYmKlaFBnEk07sTamiNvpbdfqofuU9OjPm8NGavrosBh++DkiSIiyGyeRa9Ypthd++qeBAZ
	9D6TPtHxGrFXbN1cNEY7VRX48Cmh+RYTboU+mLKk/SJPek1NzoD/AfFFzQ4zFt0aGDB+eBUd6gA
	wfYKjeGtv3qHVJ9vasGANNsa8jXxn5WM3wl1IG6AKfTYZ0r3TPLl2zsU6NtCp7bEY5kZR2/CqL6
	ig+n2OUJSACDhFM=
X-Google-Smtp-Source: AGHT+IHyKbANKEj4g4KxocXm4yHOhpiEBiGMph5JPaoKcbo6rZ1/8zvn09yNoAs/k0KDXpN10M7D5g==
X-Received: by 2002:a17:90b:4c43:b0:2ea:5dea:eb0a with SMTP id 98e67ed59e1d1-2f28fa5beacmr9746521a91.4.1734197165633;
        Sat, 14 Dec 2024 09:26:05 -0800 (PST)
Received: from localhost.localdomain ([223.185.132.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142f9e186sm5049811a91.41.2024.12.14.09.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 09:26:05 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v2 00/11] RISC-V IMSIC driver improvements
Date: Sat, 14 Dec 2024 22:55:38 +0530
Message-ID: <20241214172549.8842-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_092607_778413_E1461A88 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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
Cc: Anup Patel <apatel@ventanamicro.com>, Andrew Lunn <andrew@lunn.ch>, imx@lists.linux.dev, Marc Zyngier <maz@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, Shawn Guo <shawnguo@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series is based on recent discussion on LKML:
https://lore.kernel.org/lkml/20241114161845.502027-18-ajones@ventanamicro.com/

It primarily focuses on moving to RISC-V IMSIC driver use common MSI
lib and GENERIC_PENDING_IRQ.

PATCH1: Fix for handling non-atomic MSI updates
PATCH2 & PATCH3: Preparatory patches
PATCH4: Main patch which updates IMSIC driver to use MSI lib
PATCH5 & PATCH6: Preparatory patches for moving to GENERIC_PENDING_IRQ
PATCH7 to PATCH11: Patches use GENERIC_PENDING_IRQ in IMSIC driver

These patches can also be found in the riscv_imsic_imp_v2 branch at:
https://github.com/avpatel/linux.git

Changes since v1:
 - Changed series subject
 - Expand this series to use GENERIC_PENDING_IRQ in IMSIC driver

Andrew Jones (1):
  irqchip/riscv-imsic: Set irq_set_affinity for IMSIC base

Anup Patel (7):
  irqchip/riscv-imsic: Handle non-atomic MSI updates for device
  genirq: Introduce common irq_force_complete_move() implementation
  RISC-V: Enable GENERIC_PENDING_IRQ and GENERIC_PENDING_IRQ_CHIPFLAGS
  irqchip/riscv-imsic: Separate next and previous pointers in IMSIC
    vector
  irqchip/riscv-imsic: Implement irq_force_complete_move() for IMSIC
  irqchip/riscv-imsic: Replace hwirq with irq in the IMSIC vector
  irqchip/riscv-imsic: Use IRQCHIP_MOVE_DEFERRED flag for PCI devices

Thomas Gleixner (3):
  irqchip/irq-msi-lib: Optionally set default irq_eoi/irq_ack
  irqchip/riscv-imsic: Move to common MSI lib
  genirq: Introduce kconfig option GENERIC_PENDING_IRQ_CHIPFLAGS

 arch/riscv/Kconfig                         |   2 +
 drivers/irqchip/Kconfig                    |   8 +-
 drivers/irqchip/irq-gic-v2m.c              |   1 +
 drivers/irqchip/irq-imx-mu-msi.c           |   1 +
 drivers/irqchip/irq-msi-lib.c              |  11 +-
 drivers/irqchip/irq-mvebu-gicp.c           |   1 +
 drivers/irqchip/irq-mvebu-odmi.c           |   1 +
 drivers/irqchip/irq-mvebu-sei.c            |   1 +
 drivers/irqchip/irq-riscv-imsic-early.c    |  14 +-
 drivers/irqchip/irq-riscv-imsic-platform.c | 177 +++++++++------------
 drivers/irqchip/irq-riscv-imsic-state.c    | 110 +++++++++----
 drivers/irqchip/irq-riscv-imsic-state.h    |  12 +-
 include/linux/irq.h                        |  15 ++
 include/linux/msi.h                        |  11 ++
 kernel/irq/Kconfig                         |   4 +
 kernel/irq/chip.c                          |  39 ++++-
 kernel/irq/irqdomain.c                     |   1 +
 kernel/irq/migration.c                     |   9 ++
 18 files changed, 262 insertions(+), 156 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
