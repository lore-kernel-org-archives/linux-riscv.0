Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34428C02199
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Feb 2025 04:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZAgHbFBqzvMXhyHGt6WMU+f066f1A0Ljy15FKGgk6ZA=; b=QIydwmui+JYKRy
	jl0QDcuXqK9HJN5HMySwvLx6coASun3EPPCCuw6Ow8lB00SrG3CO3FRbeNv7KJCh1ULN2N5hB0uOC
	YqS6kk6mI7Vorasp+nwMELNOxAnYfYbU8ccJlXI0AU1fpZee/bSB3ZvvJjzIzPJGRbT/awjQJkuFA
	M17DyHw3kmeSntuLEeSAA5ip4kYaI9CI0VDJJhsZUWX2C6FAjhUbu/d9AjE9aL12KN7kdjF/3mE6n
	kmwjQkk50GMsh+EH8LRgPlM+U9rmOohBQkYM9W/9LXGTTPO0jjoavrOwdOXqBlWcGN4K/EWeF3u5c
	EWACl7iyYXeQq7ig7aIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgymJ-0000000E2iJ-0gXV;
	Sun, 09 Feb 2025 04:18:43 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgyks-0000000E2FP-3Ylm
	for linux-riscv@lists.infradead.org;
	Sun, 09 Feb 2025 04:17:17 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2fa5af6d743so698018a91.3
        for <linux-riscv@lists.infradead.org>; Sat, 08 Feb 2025 20:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739074634; x=1739679434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ffChoDiFR+PyqcOvwXXG+VNE/Bmtc2ogucfc93fQxUk=;
        b=MptYRKoGCGiSZaVfXo0GoXnF/eIvfh79K3SNTryflBL4yg0c6hA6ruN0VBIwfkPsGD
         LSrigDR2AYXOnIf97bR0TyNs4cCh1ysbrdGnYxKoKgXBLkQRedHRF+biVnz3RfXHVRSV
         vWfVvcuWLwspwdJ6ptPUceYLScNAX5tSwuRCDyBDVWTUsOG1rCIKH0LymqbNU80tKjAq
         p4SvcI7DztAwE17s6+Xq4DcvZI5Gp//+Y523F5Oql+oErk0F+iUUEu3wZw+GEeCilhiP
         WYjG0hR+OEJdqVLm0sIkzNgaVPImngbD6j2vQVyI0i0pErXxEWgK0lcABOlG8S84XiIP
         f6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739074634; x=1739679434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ffChoDiFR+PyqcOvwXXG+VNE/Bmtc2ogucfc93fQxUk=;
        b=w5y6XgqdDtVe+3dBP6E5WhrPltAhFcDYCZj02Jy7qw7K7GJYwFRldBICpVonsTVhVH
         7FQW9v1N8LUXXkqVEt4VaN0pl+yYIiFdBbgrKCm5I8fD9wak7t97WXpP1MyuyY23hBzl
         qG+mksTdmMffRiRh1EPfMMbPilGqsPmih86zYf27DLr/XUgbgzzfJGenTJOAIsCY0pjO
         bAykO//yUoq3WmcnBNtgUjQqY5Gzcy8VZCSOomfe7+s6NRZ6ZtDZrWuk/KT0bJBd3aQp
         lsX4DQqjDyIs/SWFFWPBcru5vBIgitJulOLIaS+FzEyQLQKjXKnTv1/NQuHUG3RArv9Q
         yM1g==
X-Forwarded-Encrypted: i=1; AJvYcCU86cnBsr6zqlvq7u343d0Az1SspACrqZADRfdaydZbySQR2JgIn7L7wL810W9Sdqa3iQTR54pswL25+g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyP+9iLIqQyTaEuWhsMCTCrTc6N3jDS9niALkvNaQZPgWd4s9F/
	4wRnPw1UFS1NU/rYgq+yl0PB1MUZU4U/BVZHedS0NjeuvwVSVIi1zHAfYyL0mLs=
X-Gm-Gg: ASbGncvIm2IYH6ZGt7vJvo5fzovElKs7xuufRjF2tPrgZegdhBl1udZAgJDEM9DaIjT
	7L9BnjjEfNPVIOfzQy+F+rV3iZzLHYtZoLn6t/gFz3NQKCj2Vj3UJ3wJYRctRFy0C7CUJuFhRjW
	7zPvB2j/fyfYEPr2v8oVshYQplrcANMJQxzrxT54JFaO3Aoev5y0wCfu7OihDP9WevgmAv3UzkB
	Ngj89si0oSq3h54PasbTEhdUZIS2MP38u/tGK0mq4YgfVEx/y/QITcYXkuVVcd0ghmRZqvMzKyq
	fPUP0M5vPwtozj30qcOT0PvQrmq8Bh0rFtPTwIOsEHMp0iMYlNYGV6s=
X-Google-Smtp-Source: AGHT+IHWyivxqea4vrX5Vzo7+S2VcgVE1uEfRrP93aVaeTeSGQZ/oELVi9DGSUIrYGP8OYhXJU+GpQ==
X-Received: by 2002:a05:6a00:2289:b0:725:460e:6bc0 with SMTP id d2e1a72fcca58-7305d2ac0admr15893367b3a.0.1739074633666;
        Sat, 08 Feb 2025 20:17:13 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73073eba116sm1898410b3a.124.2025.02.08.20.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 20:17:13 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Subject: [PATCH v5 00/11] RISC-V IMSIC driver improvements
Date: Sun,  9 Feb 2025 09:46:44 +0530
Message-ID: <20250209041655.331470-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_201715_571652_3D67A373 
X-CRM114-Status: GOOD (  11.33  )
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
PATCH3: Main patch which updates IMSIC driver to use MSI lib
PATCH4 to PATCH6: Preparatory patch for moving to GENERIC_PENDING_IRQ
PATCH7 to PATCH11: Patches use GENERIC_PENDING_IRQ in IMSIC driver

These patches can also be found in the riscv_imsic_imp_v5 branch at:
https://github.com/avpatel/linux.git

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

Anup Patel (7):
  genirq: Introduce irq_can_move_in_process_context()
  genirq: Remove unused GENERIC_PENDING_IRQ_CHIPFLAGS kconfig option
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
 kernel/irq/Kconfig                         |   4 -
 kernel/irq/internals.h                     |   2 +
 kernel/irq/migration.c                     |  21 ++
 18 files changed, 389 insertions(+), 287 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
