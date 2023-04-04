Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF536C77B6C
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 15:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MpuYZ1IbA6E7oZ9qH5ZRDut8JqUeB1seAmTJy3+N70I=; b=BeXinMrcX4xRRm
	mlfO1G9lVMAu9EqEPK2SeOokjq4Ko9tvahA3j2D7gmWI8BR9jQQEu9oZtNHL+bCz8eEcFVUo+nW4h
	HTzWcnGV7eUgWfLtaHrBrlyvTDkemFA/A28XEiImLi2CLxOraZPaNTJQYgB6do5HmJLzW2GfEdfnO
	jV/ljLFuEMzB6Prc8QbXOzka32du2E4Ib9iPT7xMujLwTxalEpsgf/oeHErV1rnCjIIscTT/SM23g
	YLZdKr5CKwpcFLiLf/TgR22CV+7OZ1/H2aes4as6ZB6ZctWAri3wp7U15axdcKzmIZFqe1czIu4pA
	pJTeT3gpBRXXAGquQz6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjigk-00218E-2a;
	Tue, 04 Apr 2023 15:35:14 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjigi-00217O-0P
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 15:35:13 +0000
Received: by mail-oi1-x233.google.com with SMTP id bj20so24501129oib.3
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 08:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680622510; x=1683214510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C6R4aOyJyDkIgHIVotRNcx/chT2oC7UuU6Y6qIEoUAE=;
        b=j4Q5gDOHHnM+qB7ifoJy+oxC06Zdjb9mpbd7zIX7SMvhGKkBoDsWify1l6fwb3SssM
         N02pq7k5H0o9Hmlxm2NiGEwFdUER2roPwv10kwFFy8YE0Cd1C9H9eKvfB9OdFpJGozYm
         FLMkRMNBQgL5JkXiSaR9238raAY8paxS8rmwYLS0pnfW/uIN0NBYqUNKOCd7kVKcKPZ6
         h82T3FzgWs/iIAjpTKhFEh4nrllSp/gPvdowFqLjmartx45XFKmLMN5j2Y8yOzH0ZsPm
         s+sy5jMukDwXigjWAVzcmaRwq7jf3mWiySiJcR0XOvU1ROc3iKWZ+dVPDzUVm+60yFZg
         KeNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680622510; x=1683214510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C6R4aOyJyDkIgHIVotRNcx/chT2oC7UuU6Y6qIEoUAE=;
        b=FMrdPiFCbLbcdBTuJb3p6P5BNDWnrInihW/x2QTMgBkk2uNLTJPPLhMS8uBeOAen8e
         DsV/3RHOCRzEUXqKhkCN3MWtmFSISsdWgxIIyfgko2+hzyYjV1VkSpaLqk+0zeI4P9RC
         r4GGYXGZjvgmGwfY+lGZZPYuQs2GEUq5R/wAcAprNz+KKTaAHl89a8pw+8bC7p4GbJHK
         CHbIG/PP9BezSWP3KvS8IQJLWCkWjThMUHRoqEftU2FK8cF6kYUn9Lf6TNqGRj/DZsdJ
         3w5M/ZpoExARdvE5C3rbCaw1LdoB3GenYf6TPt6BqZXFojR8GP0mf99K5flVrtyymMH8
         eWsg==
X-Gm-Message-State: AAQBX9coJ3pdNiknn7+Dbc6nupvZSRU3zpPkzF2DeuGHOjMWU8YXaGsq
	ajAo6Qaa5EZqaSzi+83lShsYiA==
X-Google-Smtp-Source: AKy350bhAMUu2udM02Eak5zwTeupgQEs2dp62vPjEaPrpcdme8sxsXnyn58f0Ujpp4CaSj2io/h7JQ==
X-Received: by 2002:a05:6808:2d5:b0:386:d629:81a1 with SMTP id a21-20020a05680802d500b00386d62981a1mr1300978oid.35.1680622510321;
        Tue, 04 Apr 2023 08:35:10 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id w124-20020acadf82000000b00387384dc768sm5325803oig.9.2023.04.04.08.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 08:35:09 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v4 0/9] RISC-V KVM virtualize AIA CSRs
Date: Tue,  4 Apr 2023 21:04:43 +0530
Message-Id: <20230404153452.2405681-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_083512_171613_55DBD694 
X-CRM114-Status: GOOD (  11.50  )
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
https://github.com/riscv/riscv-aia/releases/download/1.0-RC3/riscv-interrupts-1.0-RC3.pdf

This series implements first phase of AIA virtualization which targets
virtualizing AIA CSRs. This also provides a foundation for the second
phase of AIA virtualization which will target in-kernel AIA irqchip
(including both IMSIC and APLIC).

The first two patches are shared with the "Linux RISC-V AIA Support"
series which adds AIA driver support.

To test this series, use AIA drivers from the "Linux RISC-V AIA Support"
series and use KVMTOOL from the riscv_aia_v1 branch at:
https://github.com/avpatel/kvmtool.git

These patches can also be found in the riscv_kvm_aia_csr_v4 branch at:
https://github.com/avpatel/linux.git

Based-on: 20230401112730.2105240-1-apatel@ventanamicro.com
(https://lore.kernel.org/lkml/20230401112730.2105240-1-apatel@ventanamicro.com/)

Based-on: 20230403121527.2286489-1-apatel@ventanamicro.com
(https://lore.kernel.org/lkml/20230403121527.2286489-1-apatel@ventanamicro.com/)

Changes since v3:
 - Split PATCH7 into two patches
 - Addressed comments in PATCH7, PATCH8 and PATCH9

Changes since v2:
 - Rebased on Linux-6.3-rc5
 - Split PATCH5 into two separate patches as suggested by Atish.

Changes since v1:
 - Addressed from Drew and Conor in PATCH1
 - Use alphabetical ordering for SMAIA and SSAIA enum in PATCH2
 - Use GENMASK() in PATCH3

Anup Patel (9):
  RISC-V: Add AIA related CSR defines
  RISC-V: Detect AIA CSRs from ISA string
  RISC-V: KVM: Drop the _MASK suffix from hgatp.VMID mask defines
  RISC-V: KVM: Initial skeletal support for AIA
  RISC-V: KVM: Implement subtype for CSR ONE_REG interface
  RISC-V: KVM: Add ONE_REG interface for AIA CSRs
  RISC-V: KVM: Use bitmap for irqs_pending and irqs_pending_mask
  RISC-V: KVM: Virtualize per-HART AIA CSRs
  RISC-V: KVM: Implement guest external interrupt line management

 arch/riscv/include/asm/csr.h      | 107 ++++-
 arch/riscv/include/asm/hwcap.h    |   8 +
 arch/riscv/include/asm/kvm_aia.h  | 137 +++++++
 arch/riscv/include/asm/kvm_host.h |  14 +-
 arch/riscv/include/uapi/asm/kvm.h |  18 +-
 arch/riscv/kernel/cpu.c           |   2 +
 arch/riscv/kernel/cpufeature.c    |   2 +
 arch/riscv/kvm/Makefile           |   1 +
 arch/riscv/kvm/aia.c              | 627 ++++++++++++++++++++++++++++++
 arch/riscv/kvm/main.c             |  23 +-
 arch/riscv/kvm/mmu.c              |   3 +-
 arch/riscv/kvm/vcpu.c             | 190 +++++++--
 arch/riscv/kvm/vcpu_insn.c        |   1 +
 arch/riscv/kvm/vm.c               |   4 +
 arch/riscv/kvm/vmid.c             |   4 +-
 15 files changed, 1083 insertions(+), 58 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_aia.h
 create mode 100644 arch/riscv/kvm/aia.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
