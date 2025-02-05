Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0425DC02198
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 16:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jTPtbgMdCKngVZHhkkxS+P1W8j255ARcY6SKdCoOObw=; b=1xLspO7B1jyzT1
	4pG9XPHTaxUqurhoA56W1H+Ajrf72FiZICUAGvu9qhIxfyOjGg+RNX/SC9ZNUWs+oiuA9GqGsihTX
	mAkr9tx8UQH9gbuZVjDL1YK0a/Zzd7yYaNpNgSAT7RNpF4nOcmxFxdwVVtDEyOHJX9RC9VjFTTKNW
	yV3Kwo4F/ipjfwki77cxpFjsxiCi6kCDKXZCg4WuPP+L5c0JQlx8OwAbn0C3bgHcW2XQrrbPeJiI+
	T1QeWH0b6XNNEzUovp0b9D+ABtSwjDaYHFWwH1ppkzwB6+bRJ1JYTTOjYefJV/asCUihWxUQHhCkI
	CNvugu2Qdd1Awvdq21qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhrD-00000003tMz-0256;
	Wed, 05 Feb 2025 16:02:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhor-00000003soV-0gMv
	for linux-riscv@bombadil.infradead.org;
	Wed, 05 Feb 2025 16:00:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=rp+BM2YYmo27ZSOn3/PF/LUKik/iqtqeYKVoRcFyVog=; b=cg4X2/L06yj0zBades0JqgDuCL
	Cw1bL0M8bDHH8hBTwCaOOFGZvBe8359fp0qH3rugcbR2NGIbPkE0xU1h22d5DV6XHxLO1nUnGbA37
	VOM1vvBANCpiKEhAA7zjDkyEYU3o63c8rGZma9eNAOy+P96dWaGkrLkn3Hv1t/0WAW51sEAVJKEOY
	V7j9A9R2cf/Os3EmEVcaOvWXHJ4uech+5RK7Hop65KQfBvIJNxEnZEj2aD9Ji9lTZq5wQVGVYHUYh
	U8ke4ancvhE65aIoHy6xM7pcnSIM9UvSEAt/7dpBP44RZrwloslIH4G5TBEWVg6lbQNEPISdjqYp2
	+LAwM+2Q==;
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhon-0000000GgJR-31KK
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 16:00:03 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-21628b3fe7dso129622995ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 05 Feb 2025 08:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738771199; x=1739375999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rp+BM2YYmo27ZSOn3/PF/LUKik/iqtqeYKVoRcFyVog=;
        b=WuZpBpwTEE+v0f1XcpXMnqtAlPjjryP6cjtZuO5L6YfUzBgOcBvDGGFyObxQjay4AZ
         tAdXAmoYIMfIBZbUal5rnJLhhQInwstpSHws3maw4nOi0pGJzlZNXWVkjsKNw2Uhj1N6
         gRLd1g1+NG/NGyu8EenA4/PQifNfL4jZQyIdOrkgLyxZaOvRTysJI16pgzsBqaDp/WKs
         SAzV7TuOxcl9NYMVdbO4IGmr3e3ZDRLoDDOi0w34lRsuAlL71dEDo+k3qd9NXE9TINIv
         mVj/7xeQx3IlF1VtesbBkTnQ7F7f5F83i0SDsk0xvZQpo1GXRFOlcrc7JP/AeGxo2rQ+
         nHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771199; x=1739375999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rp+BM2YYmo27ZSOn3/PF/LUKik/iqtqeYKVoRcFyVog=;
        b=jxL7S7TkwjQ8R7E5dDtdW0nNe78WJcNRZNOwyWJglwgNZGmWAGnZWhqvHhuM1A8J0y
         7mNZz3e+9TnD6v3eAtPI9JFgYRQjy+Bti7L+fBc7izIaOb8fmKz71zVLq7Ebg+4K892P
         pTX9BuMJQNNHy/UObEBGnr5kK6BtufGdpRXYkaKZL+iaBw7T4pWKPiPtsZrztz9raWEV
         dxTgw9zByPvmiCKLA6lg2LDv2wXLepgBl34henPf0A6fIz+F7WuaWwwg2qXp7a7u/W0T
         LXp6+g2kkxv7xrCraQbNFFUnTE9wDSv5jucCHNJu3VAhdFL5S9B7WRQjPb0TfJYcYkFd
         JjJA==
X-Forwarded-Encrypted: i=1; AJvYcCXaPG5sbZl8mnHZy8tnOm7rU9WY2/b5LDP5ZsxHAxLTF4L1fLZRZeXV3qhUBHuz+XN+3qv+wKthiitI6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6Vg6QJUt2yDElXAPRQ/JkC4EasmvfWsVVgO9QGAeCMmqyRh4Q
	UDCsmiIQkmd4Psg6KWTVCEmLDLJTgiZW30IuD/7i/u94E6sDXh7vvbj3A8FT3bQ=
X-Gm-Gg: ASbGncvaX7rnF9WEGnOdVaiHR9GVgpgixq+Pozc+eQ0uKwrXNNruK74UmqUoWQ1Uscm
	LXzWMNtNNN0nL7nNeE0d6mMf+O/oGNOjy9y8YRMBuo9hWx5lw5gVtKfh/MnN6mWKPO05pUEJg6l
	8RE3IdSHvRanPZDpOLBuLLK5XLh4ds0yEugaeKyTV4rmP4hDoNnQqfSW1PnooyBLzdKfzbu7IEw
	EfMZBW7byK3QzcCtlc5NhpToJgm535YmJx3vyKQkD8cgQs3HVsl6HTfdJcbmr61x85xwTxsc/Sk
	1DK7oVp8pIJEDVYtQuyDT16A85BhSNfT9FxI/e9yxOh5np/myfDDOHM=
X-Google-Smtp-Source: AGHT+IG/1yS9kPdzHzlz6pxYz4TJGEpsfp15GF1V712EzlJPFVPcBMbHsLPYkxwfxuOCVyO08gz4DA==
X-Received: by 2002:a17:903:41cf:b0:21f:dd1:8355 with SMTP id d9443c01a7336-21f17e4cabfmr58273655ad.15.1738771198793;
        Wed, 05 Feb 2025 07:59:58 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21edddf883fsm99369015ad.4.2025.02.05.07.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 07:59:58 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v4 00/11] RISC-V IMSIC driver improvements
Date: Wed,  5 Feb 2025 21:29:36 +0530
Message-ID: <20250205155948.81385-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_160001_893378_305FEA2F 
X-CRM114-Status: GOOD (  11.17  )
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
PATCH5: Preparatory patch for moving to GENERIC_PENDING_IRQ
PATCH6 to PATCH10: Patches use GENERIC_PENDING_IRQ in IMSIC driver

These patches can also be found in the riscv_imsic_imp_v4 branch at:
https://github.com/avpatel/linux.git

Changes since v3:
 - Dropped PATCH1 of v3 series and updated last patch of this series
   to handle the intermediate state for non-atomic MSI update.
 - Added new PATCH6 in this series to remove stale kconfig option
   GENERIC_PENDING_IRQ_CHIPFLAGS.

Changes since v2:
 - Rebased upon Linux-6.14-rc1
 - Dropped PATCH5 of v2 series since that patch is already merged

Changes since v1:
 - Changed series subject
 - Expand this series to use GENERIC_PENDING_IRQ in IMSIC driver

Andrew Jones (1):
  irqchip/riscv-imsic: Set irq_set_affinity for IMSIC base

Anup Patel (8):
  genirq: Introduce common irq_force_complete_move() implementation
  genirq: Introduce irq_can_move_in_process_context()
  genirq: Remove unused GENERIC_PENDING_IRQ_CHIPFLAGS kconfig option
  RISC-V: Select GENERIC_PENDING_IRQ
  irqchip/riscv-imsic: Separate next and previous pointers in IMSIC
    vector
  irqchip/riscv-imsic: Implement irq_force_complete_move() for IMSIC
  irqchip/riscv-imsic: Replace hwirq with irq in the IMSIC vector
  irqchip/riscv-imsic: Special handling for non-atomic device MSI update

Thomas Gleixner (2):
  irqchip/irq-msi-lib: Optionally set default irq_eoi/irq_ack
  irqchip/riscv-imsic: Move to common MSI lib

 arch/riscv/Kconfig                         |   1 +
 drivers/irqchip/Kconfig                    |   8 +-
 drivers/irqchip/irq-gic-v2m.c              |   1 +
 drivers/irqchip/irq-imx-mu-msi.c           |   1 +
 drivers/irqchip/irq-msi-lib.c              |  11 +-
 drivers/irqchip/irq-mvebu-gicp.c           |   1 +
 drivers/irqchip/irq-mvebu-odmi.c           |   1 +
 drivers/irqchip/irq-mvebu-sei.c            |   1 +
 drivers/irqchip/irq-riscv-imsic-early.c    |  14 +-
 drivers/irqchip/irq-riscv-imsic-platform.c | 197 ++++++++++-----------
 drivers/irqchip/irq-riscv-imsic-state.c    | 152 ++++++++++++----
 drivers/irqchip/irq-riscv-imsic-state.h    |  12 +-
 include/linux/irq.h                        |   7 +
 include/linux/msi.h                        |  11 ++
 kernel/irq/Kconfig                         |   4 -
 kernel/irq/migration.c                     |  20 +++
 16 files changed, 280 insertions(+), 162 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
