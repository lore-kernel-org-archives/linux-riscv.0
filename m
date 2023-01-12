Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE39C54EBC
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 14:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Tnlqh3mOyVsFy0QxT3EL403X59kN3rX53vOMIvNlvQg=; b=MJClWVpYXMigzD
	frJpWPqKC7R6M8Wq9dGo6GqWW68C+AlWWD0QFPF8676tK5ZzgIhH9KrRaLzVrJ35v/hzsGEIX+UhO
	Y9bv8NDhgut3/sBieIY2gdkiMRv5OOfxA5ufpnOZhGSkFtDDmYwqxzGjF9A6te40KohukLEIZ9xRL
	HcVp58ywXNi/PHFimNxpjn/xS93bKbzq5E6UTvfV3yq4XaWsOVqng4gZ4i4ClCXept0xCMvV8H7eh
	BbS6gZpqsGX3PaeW9nKdwH3zN9fqqA+WQRxSVxpEndaHFEINEAQlH5DeRwSDam+/1KLVcaX0+lujB
	kHjpxuvi3SCA28+dgQqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFyAv-00FHX7-6c; Thu, 12 Jan 2023 14:03:25 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFyAs-00FHVv-Ra
	for linux-riscv@lists.infradead.org; Thu, 12 Jan 2023 14:03:24 +0000
Received: by mail-pl1-x62a.google.com with SMTP id y1so20327006plb.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jan 2023 06:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SYAMfoPma/2nQAfBEMxDluOdt4GLLWOFoMahVP43u/U=;
        b=Mf/tlkmlfMBejawj3GBrzWk2JkrS5z/ymRrcMYXZYmNw+hoZMokkdmj1uePxiCQQ7T
         +pobWmWlxNHwvSUoRUoY3W6l3NQp2Uk1qIguf+oxGsk+OFIl4JcvmLE7W/nsyEezxITQ
         mL1Ewx1jQ4UrF+OvIRPnzUqTeoOyrZZ67vJuJCyA6Roj5fc4FGR+1bfUJKodVK6AWTtS
         YPgCGXwxLqtzi09IJIRC+pHbUkM7SIyDe5sXnDfagMc5IATQy9silgLk4f7/xJVyfKxl
         VJw2Im3boyYWeS2Qj6GHHxpfBvPXpZa1tFMcvsQUyv86tVJGlWxIW5K4nvf0XfT8MaeE
         CCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SYAMfoPma/2nQAfBEMxDluOdt4GLLWOFoMahVP43u/U=;
        b=bcpbuuF2dZ1Z/yXvL1Qc2s0jy599cnZvVHYYRKcLtHwCXeKcteCDGfwEWC4Flxe7wO
         v1ec5ygJmcDoy01EHg5AEHbXrc9fI16oOYNRJyS1r/klAbZZtwKimrOAJNBp8oJFuapV
         toRvb7Kg82m7l3pBBkzj+hf3zq0EIn0qynidkN3bCEEQByhaZGNo7K+y1c/wRGrgyhlD
         oph7pF34TxOTQm8pci5HK7vp1tmEfBAx4IprM4mAeybBZ9pjdoO8WseShfvihxYv/Crb
         fSxOApgoWcCeyLkQmeQStyb6U881XNCmaXmLGa8UVVCjQCxC0vjW/1obUlsWLOji4/OA
         K++g==
X-Gm-Message-State: AFqh2ko+SofH1276ymtU4RKjBw5N9quTLGRo10idy42LGXhLiBG2g3RX
	+pqc3gp8YZ7W5eZIe5Mdu6R4Ew==
X-Google-Smtp-Source: AMrXdXslITcQTVnMcKFsd09fLItgDivV8yXOl4rnwDD026pL3dkblJOdaOcQoIfmj0GfXrGwcPfYHw==
X-Received: by 2002:a17:902:a3c1:b0:193:2a8c:28cb with SMTP id q1-20020a170902a3c100b001932a8c28cbmr14480469plb.21.1673532199587;
        Thu, 12 Jan 2023 06:03:19 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id d11-20020a170902cecb00b001925016e34bsm12351455plg.79.2023.01.12.06.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 06:03:18 -0800 (PST)
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
Subject: [PATCH 0/7] RISC-V KVM virtualize AIA CSRs
Date: Thu, 12 Jan 2023 19:32:57 +0530
Message-Id: <20230112140304.1830648-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_060322_907657_6872A390 
X-CRM114-Status: GOOD (  10.34  )
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

This series implements first phase of AIA virtualization which targets
virtualizing AIA CSRs. This also provides a foundation for the second
phase of AIA virtualization which will target in-kernel AIA irqchip
(including both IMSIC and APLIC).

The first two patches are shared with the "Linux RISC-V AIA Support"
series which adds AIA driver support.

To test this series, use AIA drivers from the "Linux RISC-V AIA Support"
series and use KVMTOOL from the riscv_aia_v1 branch at:
https://github.com/avpatel/kvmtoo.git

These patches can also be found in the riscv_kvm_aia_csr_v1 branch at:
https://github.com/avpatel/linux.git

Anup Patel (7):
  RISC-V: Add AIA related CSR defines
  RISC-V: Detect AIA CSRs from ISA string
  RISC-V: KVM: Drop the _MASK suffix from hgatp.VMID mask defines
  RISC-V: KVM: Initial skeletal support for AIA
  RISC-V: KVM: Add ONE_REG interface for AIA CSRs
  RISC-V: KVM: Virtualize per-HART AIA CSRs
  RISC-V: KVM: Implement guest external interrupt line management

 arch/riscv/include/asm/csr.h      | 101 ++++-
 arch/riscv/include/asm/hwcap.h    |   8 +
 arch/riscv/include/asm/kvm_aia.h  | 137 +++++++
 arch/riscv/include/asm/kvm_host.h |  14 +-
 arch/riscv/include/uapi/asm/kvm.h |  22 +-
 arch/riscv/kernel/cpu.c           |   2 +
 arch/riscv/kernel/cpufeature.c    |   2 +
 arch/riscv/kvm/Makefile           |   1 +
 arch/riscv/kvm/aia.c              | 624 ++++++++++++++++++++++++++++++
 arch/riscv/kvm/main.c             |  14 +
 arch/riscv/kvm/mmu.c              |   3 +-
 arch/riscv/kvm/vcpu.c             | 185 +++++++--
 arch/riscv/kvm/vcpu_insn.c        |   4 +-
 arch/riscv/kvm/vm.c               |   4 +
 arch/riscv/kvm/vmid.c             |   4 +-
 15 files changed, 1072 insertions(+), 53 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_aia.h
 create mode 100644 arch/riscv/kvm/aia.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
