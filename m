Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6312AC46467
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 17:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OjsIAcFmZt3nRCLyZVVQbi/S+l+NhSfMOboDKyaL5dM=; b=DPafG7pAWJ7V13
	W8095C6LBnmDSzb8i4TQSz11lYHLyI26KFO2B5MKg3yuPRLgNwnfrhI7vS6SQFqkoHE/i6bf8MVaP
	tPwjg27ltFpHxWgkKkmFz9r5lIcdLQLl9EXFYs88i1zCVa4OCfoA2GRffo0Uq/HW0mPaAzKejeUSg
	nBmbHa24FyDz7ntBAEcrCEdeEt/9XV3vYH0uXSl0utQtF0Moqy2ey7WbORch3vTcaC/Y1tPQYFkcS
	EZAKzhz7HbLJd3WxIYyVXN+/OgVD19tVMu0u0WqEEuz0UopythJIqM++91CgM4FCVWKoPfUCsLnKi
	qPwII5yPwPZ3slJ/ciBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCklb-003FKz-O0; Tue, 03 Jan 2023 17:07:59 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCi3Y-001rWk-JF
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 14:14:23 +0000
Received: by mail-pj1-x1033.google.com with SMTP id a11-20020a17090a740b00b00223f7eba2c4so3469418pjg.5
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jan 2023 06:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GW12ngOo/jzgFd3I2MoMFB0W6lAUEorhU5h+d0gT4yc=;
        b=VzQCrF+x0ppecP623HHrXxGlQkstU/Xb+MJBqDfOOOpIg1A+wKk3buBMT0eydqlWOz
         Rchbm8sZ1F6ukc88ax+BrFfleDZmVSEdLOL/3ved/kdyF3y3gKjlQSISRnUTPVfiMJLo
         cKxam11CFHqd85ntWtijAHSYu3S3x0OULXbuWkNKcjUgRMSPjuK8/ZH/Rq6B/b282pc2
         UQE3DKsYuCcizXSYCT4OQ4vNOYm0aFYbvPByUaXtQB8AyeYfp2X2gfa0+NK6umjDu6OX
         iarrr7vl/eJNPq00D/UxI5tyeVUFgz6eWX0/bwOJJlKTgX5wc31kVa58Syafbpu5pLU2
         myRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GW12ngOo/jzgFd3I2MoMFB0W6lAUEorhU5h+d0gT4yc=;
        b=KykLEhs27LUA6Wx2Q2xMjyaS51TyesBSAyWL8n2n8o46Ma5hMsqmo3G5AxU1IwrlDk
         Co5w9mzRdGCKbYRBbcVcgJ9YB9GhA3BTWa/xrLMQAYZaJIFFAydBMRrbWVbT1sZQIk4l
         p+32AJAc9EQRMUOMlZRrGtYYo+fByJr+IkRN9Pv49FNw2/4sd+yAwvougwXBLua/AuG3
         PjG8Tg3/kYakIFTFHkIT+l1vdOVht2qAcYNTc/v6kaPuciLWsmXokgc5cPBHMDQHNvHM
         De38FIPaka8Af7Ysvy2C7ebELqLu3gt8ICDpw5OZaHoSeFyVA9+Ml0yE8HYqQBpBVYOH
         9A6w==
X-Gm-Message-State: AFqh2kpe5Xts4y9X0wSiw05mZSmX16Mhlee+M0ddhDGSGJ1HS0dBMBDE
	EjW7bbY/MgPlSH5hTxm/mtIJrw==
X-Google-Smtp-Source: AMrXdXvxCG0tSIyhPAqijzEbUT1jIZbCSmA9AM+oOvQS7OyeMNbnHHbaORBdhzixL9xgv/u4nhMpGQ==
X-Received: by 2002:a05:6a20:1455:b0:b2:636a:7bda with SMTP id a21-20020a056a20145500b000b2636a7bdamr64930890pzi.7.1672755259306;
        Tue, 03 Jan 2023 06:14:19 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.85.241])
        by smtp.gmail.com with ESMTPSA id h1-20020a628301000000b0056be4dbd4besm5936035pfe.111.2023.01.03.06.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:14:18 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 0/9] Linux RISC-V AIA Support
Date: Tue,  3 Jan 2023 19:44:00 +0530
Message-Id: <20230103141409.772298-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_061420_757130_FA76A71C 
X-CRM114-Status: GOOD (  12.72  )
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

The RISC-V AIA specification is now frozen as-per the RISC-V international
process. The latest frozen specifcation can be found at:
https://github.com/riscv/riscv-aia/releases/download/1.0-RC1/riscv-interrupts-1.0-RC1.pdf

At a high-level, the AIA specification adds three things:
1) AIA CSRs
   - Improved local interrupt support
2) Incoming Message Signaled Interrupt Controller (IMSIC)
   - Per-HART MSI controller
   - Support MSI virtualization
   - Support IPI along with virtualization
3) Advanced Platform-Level Interrupt Controller (APLIC)
   - Wired interrupt controller
   - In MSI-mode, converts wired interrupt into MSIs (i.e. MSI generator)
   - In Direct-mode, injects external interrupts directly into HARTs

For an overview of the AIA specification, refer the recent AIA virtualization
talk at KVM Forum 2022:
https://static.sched.com/hosted_files/kvmforum2022/a1/AIA_Virtualization_in_KVM_RISCV_final.pdf
https://www.youtube.com/watch?v=r071dL8Z0yo

This series adds required Linux irqchip drivers for AIA and it depends on
the recent "RISC-V IPI Improvements".
(Refer, https://lore.kernel.org/lkml/20221101143400.690000-1-apatel@ventanamicro.com/t/)

To test this series, use QEMU v7.2 (or higher) and OpenSBI v1.2 (or higher).

These patches can also be found in the riscv_aia_v2 branch at:
https://github.com/avpatel/linux.git

Changes since v1:
 - Rebased on Linux-6.2-rc2
 - Addressed comments on IMSIC DT bindings for PATCH4
 - Use raw_spin_lock_irqsave() on ids_lock for PATCH5
 - Improved MMIO alignment checks in PATCH5 to allow MMIO regions
   with holes.
 - Addressed comments on APLIC DT bindings for PATCH6
 - Fixed warning splat in aplic_msi_write_msg() caused by
   zeroed MSI message in PATCH7
 - Dropped DT property riscv,slow-ipi instead will have module
   parameter in future.

Anup Patel (9):
  RISC-V: Add AIA related CSR defines
  RISC-V: Detect AIA CSRs from ISA string
  irqchip/riscv-intc: Add support for RISC-V AIA
  dt-bindings: interrupt-controller: Add RISC-V incoming MSI controller
  irqchip: Add RISC-V incoming MSI controller driver
  dt-bindings: interrupt-controller: Add RISC-V advanced PLIC
  irqchip: Add RISC-V advanced PLIC driver
  RISC-V: Select APLIC and IMSIC drivers
  MAINTAINERS: Add entry for RISC-V AIA drivers

 .../interrupt-controller/riscv,aplic.yaml     |  159 +++
 .../interrupt-controller/riscv,imsics.yaml    |  168 +++
 MAINTAINERS                                   |   12 +
 arch/riscv/Kconfig                            |    2 +
 arch/riscv/include/asm/csr.h                  |   92 ++
 arch/riscv/include/asm/hwcap.h                |    8 +
 arch/riscv/kernel/cpu.c                       |    2 +
 arch/riscv/kernel/cpufeature.c                |    2 +
 drivers/irqchip/Kconfig                       |   20 +-
 drivers/irqchip/Makefile                      |    2 +
 drivers/irqchip/irq-riscv-aplic.c             |  670 ++++++++++
 drivers/irqchip/irq-riscv-imsic.c             | 1174 +++++++++++++++++
 drivers/irqchip/irq-riscv-intc.c              |   37 +-
 include/linux/irqchip/riscv-aplic.h           |  117 ++
 include/linux/irqchip/riscv-imsic.h           |   92 ++
 15 files changed, 2550 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
 create mode 100644 drivers/irqchip/irq-riscv-aplic.c
 create mode 100644 drivers/irqchip/irq-riscv-imsic.c
 create mode 100644 include/linux/irqchip/riscv-aplic.h
 create mode 100644 include/linux/irqchip/riscv-imsic.h

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
