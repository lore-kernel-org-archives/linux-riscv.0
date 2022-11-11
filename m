Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D313C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Nov 2022 04:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AT3jpHnX/hJ/7IRJuIsDT1lV/y7ar8cawhd68KKAUzY=; b=TfaUnTS3g5h192
	PubrJbeSYOsxdCVLm20rgsqc/Bi53F6554CUoCXIeyQwQlmMVgPvjUJNJRvZtJ0RJAeAZQJtfAut7
	Q4wsv+Qm3pEKNjPT2R8/cJCrhNF94WlMknVSDKJgWu25MdH5HPLTXgJjh6ObS8+9btiaxCCqVfPxS
	gqA4zaDp+f6OIGV1gy2ywbCBNOXt07IY/XSRZehjYiJtSAT2OxGuTLp1b3DXGq3fjpH1eoDf1BBbS
	CYuAdMa5cyjlOxcQWPYnLTvmxQJ00pjlWX9SybkklK/d2xWd/mkoPEXc4c7LG/F4UDfLNklzQYKNA
	iUrcoXOz1ZYDOd64+hQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otLsO-00Cywp-R9; Fri, 11 Nov 2022 04:42:48 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otLsK-00CyvV-Ko
	for linux-riscv@lists.infradead.org; Fri, 11 Nov 2022 04:42:46 +0000
Received: by mail-oi1-x234.google.com with SMTP id c129so4021350oia.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Nov 2022 20:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5rRCdDoP4ucuHJTu4Dp35ZlpfeELCSDaYd2hKM7VLR8=;
        b=Ah9ALclYD+mRrHhK5dzn2/JkJ5HxliwwDYtD/JQV6/7PU5gcF/nGWIceSm5kyLSF/x
         F+vAiZT8lVqGvGO8CeWYjDrqAVQGySjalFTLunBFcc88mR33+D+KrXWbFkLIqgFgxMPo
         k8KqKhA9zaokx2Ly0yz/gukqPpKK6jxQMYstYdMZo3rEAzPtwTactGy1IByOBla6SwAF
         G+RFXRFFLhYKU9e/fX17c6LbTom4Gv4BrvXeMMxKJrAaPbB7Q6gfbxEzaTYhJ4HWHacb
         f9HTXX4q5//06+49rHn+TktjO+G6Gby1C7CCe3pW9ZTFNJc7SihrcVrzlLlG36awoZRd
         +m0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5rRCdDoP4ucuHJTu4Dp35ZlpfeELCSDaYd2hKM7VLR8=;
        b=psLp7ZKHzsKbBGUnnIlEe1uMvXCWzCnahYqW8xb0d83BdKa5kpwdqIH24ucC4V/0Zw
         BjlcOhpEma5Y7IBI+f2EreUz8TK3AtViY36WBHsq5COeOzvwz6jQhv01vFS8Xln36gF1
         rnJOp6IUynCsCLhWJTA5Us6/TFsclrvg6MBwdNcEPok1plo9onbvH02msk5AoxsqSObg
         74Pf7bt1j7KXG6nr6//TsSDkk7tu31JioKmLeiKhWTVp/pCb0i0UI8gvQ/c7rYANdHB/
         XnhrFf9YfeZao4ONPE3SJ5U1uVKLjsxuQJKjeeFUL5C1lNFHyyE25C/lrLWcvPJtorNV
         9gUA==
X-Gm-Message-State: ACrzQf2nAvhhkbamdUPPwcuiCvLhiBdCTzXMNpCS76V7eBQmCsc8JDSW
	jI10sSKTKMW3hyv5ED7RDuRDkA==
X-Google-Smtp-Source: AMsMyM6ccFBGCQhM+86XrT4r7MAESQqQ3bT7i9DXvYWPsUkIqaLCjxouX/GRGmYeduFJ0b4L6HovRg==
X-Received: by 2002:aca:f241:0:b0:35a:1a81:1961 with SMTP id q62-20020acaf241000000b0035a1a811961mr2787471oih.251.1668141763441;
        Thu, 10 Nov 2022 20:42:43 -0800 (PST)
Received: from anup-ubuntu64-vm.. ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id k14-20020a056870350e00b0013d9bd4ad2esm787353oah.12.2022.11.10.20.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 20:42:43 -0800 (PST)
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
Subject: [PATCH 0/9] Linux RISC-V AIA Support
Date: Fri, 11 Nov 2022 10:11:58 +0530
Message-Id: <20221111044207.1478350-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_204244_718049_FFC670E9 
X-CRM114-Status: GOOD (  10.61  )
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

To test this series, use QEMU v7.1 (or higher) and OpenSBI v1.1 (or higher).

These patches can also be found in the riscv_aia_v1 branch at:
https://github.com/avpatel/linux.git

Anup Patel (9):
  RISC-V: Add AIA related CSR defines
  RISC-V: Detect AIA CSRs from ISA string
  irqchip/riscv-intc: Add support for RISC-V AIA
  dt-bindings: Add RISC-V incoming MSI controller bindings
  irqchip: Add RISC-V incoming MSI controller driver
  dt-bindings: Add RISC-V advanced PLIC bindings
  irqchip: Add RISC-V advanced PLIC driver
  RISC-V: Select APLIC and IMSIC drivers for QEMU virt machine
  MAINTAINERS: Add entry for RISC-V AIA drivers

 .../interrupt-controller/riscv,aplic.yaml     |  136 ++
 .../interrupt-controller/riscv,imsic.yaml     |  174 +++
 MAINTAINERS                                   |   12 +
 arch/riscv/Kconfig.socs                       |    2 +
 arch/riscv/include/asm/csr.h                  |   92 ++
 arch/riscv/include/asm/hwcap.h                |    8 +
 arch/riscv/kernel/cpu.c                       |    2 +
 arch/riscv/kernel/cpufeature.c                |    2 +
 drivers/irqchip/Kconfig                       |   32 +-
 drivers/irqchip/Makefile                      |    2 +
 drivers/irqchip/irq-riscv-aplic.c             |  656 +++++++++
 drivers/irqchip/irq-riscv-imsic.c             | 1207 +++++++++++++++++
 drivers/irqchip/irq-riscv-intc.c              |   37 +-
 include/linux/irqchip/riscv-aplic.h           |  117 ++
 include/linux/irqchip/riscv-imsic.h           |   92 ++
 15 files changed, 2564 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,imsic.yaml
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
