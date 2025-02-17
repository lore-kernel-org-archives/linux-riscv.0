Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB45C021A7
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 10:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u2gjSTBf+TyEGMOtPpvy5Rq9ItOj0beS8ATSYYNI7tE=; b=rW8YfG7g0647iy
	Cq373PJHyC1CHaheqK9WdJsJfP1qp4jpXPDUtOLv0D58o84KMMQwUVcdRR0FE6eBJmTw+FEEPxAq7
	8Yud78s/Ha4E4IyzsBsnrRaMv6xuSZvbfDkcQVI9j5fzbZAdKC3WYf5cUXe4SKS2qjYEpzyM6xNdz
	Vo6MPSLtckfhbwmJgvsFJJ1KuB1YCSrK3rjqui3V7wvVjGwARvO4fryab9ihw0E3zCEwRpb80EUQ1
	1qiwVPjSL9enec3C11i2k+cjtGLgOXpb7XlphULea8eNGgwIMCXzJk18gVKY7tiHCoHynp6Fe9U/M
	h5reSJDXuVx/L9KO/MDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjykN-00000004ANL-0Ilk;
	Mon, 17 Feb 2025 10:53:07 +0000
Received: from mail-pl1-f179.google.com ([209.85.214.179])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwwo-00000003pY9-3EW7
	for linux-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 08:57:52 +0000
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-221206dbd7eso15636765ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 17 Feb 2025 00:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739782669; x=1740387469; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f84RxVQSOLpB8f+3Kw6/tfkLcBysycUkVkvuR3ETJMc=;
        b=PxVdWxhN18AupSU7KglvMGiguBAgUw+XFj6hBx6fxO95d7wmQ7dpX2L/cDaBPpx/WH
         jRYBXnN/CPFCi4V3YtHlpdCOiiWJzM48OUXPIGkXKzOhHjJksu0P4RKVSQ3Lbl67mKum
         ypWpINxm4qZCdU3dzpMfBuQbQ/NQ6fd5d626JuLiao6o+vul7sxQIoviK7gGUhdV8KE3
         YT0bY1EwVFLcUW+kfPCpLnsfu2XVIfXydTEfR5AfHlT74lV53rZ1ELo7sJM4F0ZNJ4+f
         VIXE/ELaJZIihSu7tDbbLwI/zmNrs/vAla8ZGFaQR+ijAzuP4tJKVHuJMurGPdiSxxHH
         XUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739782669; x=1740387469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f84RxVQSOLpB8f+3Kw6/tfkLcBysycUkVkvuR3ETJMc=;
        b=Lf8C2Rjz6ICa4oA5rSb2A7vR8b2fu2EFuKs3NxVxqUDWqs0Z0J0qgEMGxLQP3xJhoJ
         2x1YQsi2pHIOmRFupSVaSyV4nIFKLMc0Yh0jqxY3aybsaOapqHrKF14Rloam/s+w8iT0
         gSWs+NQ7RClBHTE6d08343+3QhgZvuWjdXvYvOxAm4hHGigk9+t5Ea0TZbvrmtnq5y2d
         G/cdIp3Gm0X5Q7/hlZhVHCznguPZkNejO7f4nQUZrJsgDAqlb6GS/PPy3RhMp+NT4mg7
         rIr2xHICHr7xJr5tlu/fo0sbTH5KrO2KqQwAQ5HZE9Xzzg4Ap5s4JF02LsSI4QdEdCk2
         2xZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnqMI6va81FXHNTBZ+/Ol7Kqcfz3B+UiFk3Sw71lqN5al1zeeNMDuP/i2sTQ2q/h3jJoadg1MdJ0ZXOw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8pxiutXMWTKx/rSGdlaX1Bke/nAIBwHoXrZeylclTJAE0yQRs
	9wU5ScVmOKiB9X4MJZGpRv/zTtXtx5eqbzXWAduIwsfmqMCC/tFZknofgBJgs5U=
X-Gm-Gg: ASbGncsz29db1yZJuc9SWkVYQnLKpCfufKFA1NdQaj+5WHAqyH1qaQIWbGas+7IWNhA
	8V1rfH/iuCZoa4qLeX2pdHuGBT1bcGwJ9EpB5Q347/lQWQE8A87sQpDPsbKU8rL4Rbv8OB/ALwB
	V5SkoiZ2AKiAjZDwyv5WjXEvqK4UQkoa0QyBKWYL4Qs/2kI7sKgCA03IzMJ0DS7A+jksuCV78uf
	/B+OXXSNhSFCHMwuZ/NSCF+SNWzZbkgdJSiZdU5ezuk6XySKBELOL27RqNg4JLhkCrU3szFi6aL
	re6qUaMgVe4DCjxPEnCd5IQPtjsmPCmJap6haSvdcvc+e124G+ljHXg=
X-Google-Smtp-Source: AGHT+IF82L3fcPzRQrN7o7ULHVaO9xfwesocSc13p9Vkcov8kHTq/Q8PStQAxAacABCzFd34cRy1kw==
X-Received: by 2002:a05:6a21:e8d:b0:1ee:7ddf:f40c with SMTP id adf61e73a8af0-1ee8cb499ccmr13555954637.11.1739782669344;
        Mon, 17 Feb 2025 00:57:49 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([122.171.22.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242546867sm7632018b3a.24.2025.02.17.00.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:57:48 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Subject: [PATCH v6 00/10] RISC-V IMSIC driver improvements
Date: Mon, 17 Feb 2025 14:26:46 +0530
Message-ID: <20250217085657.789309-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_005750_807511_8EE819A6 
X-CRM114-Status: GOOD (  11.21  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Andrew Lunn <andrew@lunn.ch>, Atish Patra <atishp@atishpatra.org>, imx@lists.linux.dev, Marc Zyngier <maz@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, hpa@zytor.com, Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, Shawn Guo <shawnguo@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series is based on recent discussion on LKML:
https://lore.kernel.org/lkml/20241114161845.502027-18-ajones@ventanamicro.com/

It primarily focuses on moving to RISC-V IMSIC driver use common MSI
lib and GENERIC_PENDING_IRQ.

PATCH1 & PATCH2: Preparatory patches
PATCH3: Updates IMSIC driver to use MSI lib
PATCH4 to PATCH5: Preparatory patches for moving to GENERIC_PENDING_IRQ
PATCH6 to PATCH10: Patches to use GENERIC_PENDING_IRQ in IMSIC driver

These patches can also be found in the riscv_imsic_imp_v6 branch at:
https://github.com/avpatel/linux.git

Changes since v5:
 - Rebased upon Linux-6.14-rc1
 - Drop PATCH6 since it is already merged
 - Update commit description of PATCH1

Changes since v4:
 - Updated PATCH4 with better irq_force_complete_move() implementation
   provided by Thomas.

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

Anup Patel (6):
  genirq: Introduce irq_can_move_in_process_context()
  RISC-V: Select GENERIC_PENDING_IRQ
  irqchip/riscv-imsic: Separate next and previous pointers in IMSIC
    vector
  irqchip/riscv-imsic: Implement irq_force_complete_move() for IMSIC
  irqchip/riscv-imsic: Replace hwirq with irq in the IMSIC vector
  irqchip/riscv-imsic: Special handling for non-atomic device MSI update

Thomas Gleixner (3):
  irqchip/irq-msi-lib: Optionally set default irq_eoi/irq_ack
  irqchip/riscv-imsic: Move to common MSI lib
  genirq: Introduce common irq_force_complete_move() implementation

 arch/riscv/Kconfig                         |   1 +
 arch/x86/kernel/apic/vector.c              | 231 ++++++++++-----------
 drivers/irqchip/Kconfig                    |   8 +-
 drivers/irqchip/irq-gic-v2m.c              |   1 +
 drivers/irqchip/irq-imx-mu-msi.c           |   1 +
 drivers/irqchip/irq-msi-lib.c              |  11 +-
 drivers/irqchip/irq-mvebu-gicp.c           |   1 +
 drivers/irqchip/irq-mvebu-odmi.c           |   1 +
 drivers/irqchip/irq-mvebu-sei.c            |   1 +
 drivers/irqchip/irq-riscv-imsic-early.c    |  14 +-
 drivers/irqchip/irq-riscv-imsic-platform.c | 197 +++++++++---------
 drivers/irqchip/irq-riscv-imsic-state.c    | 152 ++++++++++----
 drivers/irqchip/irq-riscv-imsic-state.h    |  12 +-
 include/linux/irq.h                        |   7 +-
 include/linux/msi.h                        |  11 +
 kernel/irq/internals.h                     |   2 +
 kernel/irq/migration.c                     |  21 ++
 17 files changed, 389 insertions(+), 283 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
