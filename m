Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A73D116F3
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Nov 2025 11:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dsEBjpmMplxfMGPcke1DNa0sPGrsBoxRshBu2PRCGVg=; b=a2hozfvbimLK+9
	3jSHjeplGDE945FftFl0E5lhk+cDPS+4CflG4gMxaB+G+phhk7Wt54ERKOv4yHNx3B1lckJO2Bh2m
	rbWn7kYElbUcIM/4d33G8G3lsjPmmDCfJaS8OmzqUtDU+jO0MuRG1nJCsWeGETMlqEcH4EyvEKh6C
	bMmTf0akU5q7c7ueYAFolTcNl5xcNjHtbag1uebcn1I26UrVJVGeRTKFxPknhqfAouWDusOW5Rvqb
	+DVdWyN0nOzhc8t6WpWzinN0cwQoY6SjuOlKqgzLSoI1BNYNdbfH3wejW9Kr6nEja10aaElnsJZXa
	4ztP4eiHrLejzl15zqMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOwM2-00000000LFp-39ct;
	Fri, 28 Nov 2025 11:09:34 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOwLz-00000000LF6-3yek
	for linux-riscv@lists.infradead.org;
	Fri, 28 Nov 2025 11:09:33 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-433101f2032so9283685ab.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Nov 2025 03:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1764328170; x=1764932970; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ev8osqQslZ1HDuUmpz2SAJrU4WVNGotFbl7NHJTtz5M=;
        b=ryUGBQ4pJ8smm3lbytubmukQ2CCdcrwcDACyQTiuymBneaRSE2quYOTm/bUELV7uuK
         S/VqVT/D0WGQsyC+PU70NHj/bWJG/7+6r2YX8fnTlCEKo7E3i6QN+WH1GZoyW8sLkzER
         leVmPf33g2pAw8CyiOqNMecc7S1HjFEYkic05xPjBcv68HNWhXuBR1WseEGXaiRPFLup
         HD75hDz8fP/WYRYKKx50W02heTv5LJ7oiGHAqabJ/EWL+v0D8QxEbkCBen/d/y37/X78
         CZG6xcOAvmSjJSMXcklINu3lugMd6vW7nM7X890eCSuHzsg2xT5wKX4gOYUtoMcpYA6h
         2Mfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764328170; x=1764932970;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ev8osqQslZ1HDuUmpz2SAJrU4WVNGotFbl7NHJTtz5M=;
        b=BJ1kXpZo7cIHcs4xQZEerUR2nLhL25HETVQpSrrU6qZ+6bjv9ViPWKBatgsE+lMdBD
         Fv5DN+wwYVXE0YZgJnVYFj/B+saViI3xx9u5KvOyGUipjgF9JWa5Rp5J+5Ll0IMKyWrA
         9/CBGDzXoJn1kzVEfiaP3Dy7mkG6ZTgkYR3Jdm8wr6xS8NMqxRjjWxNqfCZFb0vBBiV6
         7xZIo/8cz1eb++Q2NW2/smx0gPi3qTLCwUg+yZX0tzLPigM6ccub+gw8V3we/9MdkPvW
         bKjRYz3f8YwL1aRqm+5TKvWy/RVR7jWFIGmw8UNSv8HH+cjx+m+Rw7h1Dzk6YDMdEuvW
         NbBg==
X-Forwarded-Encrypted: i=1; AJvYcCWq/RCo4uGGhY6zHFukRQWd1U7plKBbvHiKYo/mseHtCjnUd7BEf6A8BwNI3fAtK0OK9h1GwRc/EsGD4A==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywji8DZf9sqiqJC10dZHH3yteLKYJmLEPkXh85drtV7bCmpED4t
	t08ohx07K3lmTpjm4YUwxYd13CuBf/W/C/x/q1sUA0MgfJlmmrZ2zfN4CkfqnNRGH5kvgsAeOMw
	mB06IM8GgHQPF/SMUvENRaVHsr8ZfV9mZCQPW9SerOQ==
X-Gm-Gg: ASbGncsiKhxLwghQxAksZdsrEp9MITgtB+YpR7mh/Q8vRuWcFLNToGBJyyxSG3qxCq2
	TNTHKVdT73biFiPzM7u0ciVuotiiSh5nGpQetMZLJF9or3B/nNuQDTI3K58fo/oFjA6aG/IyF9E
	eAsretUHHxz7FEM6JGtjJdte3Rwh/flY9KEpRjPgfHC9jEvWy1Q8Yogh5QJz6WCexMNN82gvpnk
	scsstPLvV+SDrjUdHNbQmMF5rGdpQkj1YHUhgTzuI66rjL/ibGDZvOZU8QPZWb8jErWKJE=
X-Google-Smtp-Source: AGHT+IFc/ry5UpHjP3r/OfTOToFIN7uuwb7cq3NZruvPD9SmePUAvE+8mJAN0tC4qknnjQrfmNXoFUaXRVof3Et5lUs=
X-Received: by 2002:a05:6e02:1fe8:b0:433:7e25:b93d with SMTP id
 e9e14a558f8ab-435b98e6823mr258774305ab.28.1764328170460; Fri, 28 Nov 2025
 03:09:30 -0800 (PST)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Fri, 28 Nov 2025 16:39:20 +0530
X-Gm-Features: AWmQ_bmhFxPdJkF-zIY_yLVqZOdy6yi8l1326gMlp_2aI20DPgm8qhw27bUypWs
Message-ID: <CAAhSdy3C7zxovYDZJvzpuCytRmdBrGwgLF2MtOMzP7vFVm4ohQ@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv changes for 6.19
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, 
	Atish Patra <atishp@rivosinc.com>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_030932_122137_0F96E783 
X-CRM114-Status: UNSURE (   9.35  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Paolo,

We have the following KVM RISC-V changes for 6.19:
1) SBI MPXY support for KVM guest
2) New KVM_EXIT_FAIL_ENTRY_NO_VSFILE
3) Enable dirty logging gradually in small chunks
4) Fix guest page fault within HLV* instructions
5) Flush VS-stage TLB after VCPU migration for Andes cores

Please pull.

Regards,
Anup

The following changes since commit ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d:

  Linux 6.18-rc7 (2025-11-23 14:53:16 -0800)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.19-1

for you to fetch changes up to 3239c52fd21257c80579875e74c9956c2f9cd1f9:

  RISC-V: KVM: Flush VS-stage TLB after VCPU migration for Andes cores
(2025-11-24 09:55:36 +0530)

----------------------------------------------------------------
KVM/riscv changes for 6.19

- SBI MPXY support for KVM guest
- New KVM_EXIT_FAIL_ENTRY_NO_VSFILE for the case when in-kernel
  AIA virtualization fails to allocate IMSIC VS-file
- Support enabling dirty log gradually in small chunks
- Fix guest page fault within HLV* instructions
- Flush VS-stage TLB after VCPU migration for Andes cores

----------------------------------------------------------------
Anup Patel (4):
      RISC-V: KVM: Convert kvm_riscv_vcpu_sbi_forward() into extension handler
      RISC-V: KVM: Add separate source for forwarded SBI extensions
      RISC-V: KVM: Add SBI MPXY extension support for Guest
      KVM: riscv: selftests: Add SBI MPXY extension to get-reg-list

BillXiang (1):
      RISC-V: KVM: Introduce KVM_EXIT_FAIL_ENTRY_NO_VSFILE

Dong Yang (1):
      KVM: riscv: Support enabling dirty log gradually in small chunks

Fangyu Yu (1):
      RISC-V: KVM: Fix guest page fault within HLV* instructions

Hui Min Mina Chou (1):
      RISC-V: KVM: Flush VS-stage TLB after VCPU migration for Andes cores

 Documentation/virt/kvm/api.rst                   |  2 +-
 arch/riscv/include/asm/kvm_host.h                |  6 +++++
 arch/riscv/include/asm/kvm_tlb.h                 |  1 +
 arch/riscv/include/asm/kvm_vcpu_sbi.h            |  5 +++-
 arch/riscv/include/asm/kvm_vmid.h                |  1 -
 arch/riscv/include/uapi/asm/kvm.h                |  3 +++
 arch/riscv/kvm/Makefile                          |  1 +
 arch/riscv/kvm/aia_imsic.c                       |  2 +-
 arch/riscv/kvm/main.c                            | 14 ++++++++++
 arch/riscv/kvm/mmu.c                             |  5 +++-
 arch/riscv/kvm/tlb.c                             | 30 +++++++++++++++++++++
 arch/riscv/kvm/vcpu.c                            |  2 +-
 arch/riscv/kvm/vcpu_insn.c                       | 22 +++++++++++++++
 arch/riscv/kvm/vcpu_sbi.c                        | 10 ++++++-
 arch/riscv/kvm/vcpu_sbi_base.c                   | 28 +------------------
 arch/riscv/kvm/vcpu_sbi_forward.c                | 34 ++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_sbi_replace.c                | 32 ----------------------
 arch/riscv/kvm/vcpu_sbi_system.c                 |  4 +--
 arch/riscv/kvm/vcpu_sbi_v01.c                    |  3 +--
 arch/riscv/kvm/vmid.c                            | 23 ----------------
 tools/testing/selftests/kvm/riscv/get-reg-list.c |  4 +++
 21 files changed, 138 insertions(+), 94 deletions(-)
 create mode 100644 arch/riscv/kvm/vcpu_sbi_forward.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
