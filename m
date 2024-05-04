Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455DEC4345F
	for <linux-riscv@archiver.kernel.org>; Sat,  4 May 2024 03:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zzR9sfFPOWesBY0VVQsOhG+TyKvzDrG1N4Lw2BsPXBA=; b=EjWxpj8uEEzYkv
	hK8LDF+3rErQ1CGtVcc5jAjjYwAAf1ID0XJzJ2KJRVe9wbbzPEpV4o7P/h3olC3g6y1ZzMm9Guzs9
	qT6mkbg/JYisy5LRSuPBO8MZU6hkkgW3jqyw03hv+2qXP0762gMHRrEofUiA3Z6SOSyL2XLRWlQzT
	wXbSF+Ah9t5g9HlxMbFmTQKL47kj2Culcs3rc5Itek//WQql0s4hqnbkLs9XPrpfG6CobhkVT/Sbb
	3YI3grDF0nTb9kXaINoQM1uWWy2/jO+wN4o73RGmu74LLLwwgwvnCsPtcNJLJ8Om9/MaucRa/rwFF
	6uqh3PKQxlWYwGT1hJUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s36Cj-00000001A9I-0XRd;
	Sat, 04 May 2024 03:36:53 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s36Cc-00000001A70-3suJ
	for linux-riscv@lists.infradead.org;
	Sat, 04 May 2024 03:36:49 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-7de80bc1f7cso14769539f.0
        for <linux-riscv@lists.infradead.org>; Fri, 03 May 2024 20:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1714793798; x=1715398598; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WrQPfuHK9ZPrb7b1skq1LAAIb1YBEYUCzbNgahRzdcQ=;
        b=tjrWu/mEfqFaewAXi58u/3/8Kz9yk3NURmIw2/FeHtXJKzWoYQSLDTecp9/zRbKOFK
         qG54QkqHfU5+XgxE+wDkV37UXU/8KQJZj/aGGzmrGV5A6B8bcra3SIx8BiOb7aY2OMZA
         B6chkWu2yAK8P6NRZPMRf7YwRiMymJ3B7NiDYRPKG9GDxS3cR7FOszzkCEjI1QIiu7Rx
         1JOqIRkDYmRAfF0xY4Q2mjBkE5Cbgvmy+GZt/dLq0c0R/DlYXNqZCcOtICKmVARmyitN
         WzsEwrcIzNOmFgBpQGTz+X7RF8HKCBC+QylPXdY5u5BJZEa1de75qy7JGTxMv/SHBNO0
         iifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714793798; x=1715398598;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WrQPfuHK9ZPrb7b1skq1LAAIb1YBEYUCzbNgahRzdcQ=;
        b=kVl197YUi8nc1vU7rwDwe1WfKL7TltqZWPz8qpsP7/xahwfVI4GNggH+KVB1O7sex9
         dtuqdUf+JoAyLLEryxLNTBiWsMYrcFSqj+nSR2Uw4l65IXwa4cmDDtsnpwORggbJ9hA2
         uQ8FURCIZsjzWHciwYBSPHiZ8ZUbLLD4Y1yn4nJDNE5w7KSBruJKB3Fstrn+zddt+cqs
         olf5+vfP9eXS2UyD5i6I5tZ9gJyk3k0nwL1KdbLw9EtLXvM7Tvdd9IIiwtp+HIFCWJ2J
         OJMMsPL4ptkmRsl0JLacd3XU8Dd6S9zcBceuBDbJ0PaxrTU2YoQSqoPCdZsuNY4jeu3K
         jTag==
X-Forwarded-Encrypted: i=1; AJvYcCXjL/BRWGTez0d1J4pHbLdjEUW/Y2vof5UGjdq7UchdQa5offkGNMVt2c0WpaH635y3so8PrvozW8tWoikOGGuLboz14g6FZVv4Z3WL/dMg
X-Gm-Message-State: AOJu0Yz+dLpmZtX8/ByAGic0tC6IpygqeThVUVkiMO8ZkbvzC5EsQfSL
	DvlVb+JAxGo2+jYZAfPfJAzgrpUFDokgJb95AXuXCyAmI5RP41tjT1/gMesVlhhvjmn0bRfrfUf
	Q1Pu7j5dEQ4QZSOPpu++xBRuE5JN632yZfAtveg==
X-Google-Smtp-Source: AGHT+IE+XMb9sTPv9u8dDdzHuc12dQbmwrRLhkJV+w0HApRFDG7vEhpWj6KAvofx5l8XLzMGT1U4LzxR6i2eDD2pXpQ=
X-Received: by 2002:a05:6e02:1aae:b0:36b:2a07:6767 with SMTP id
 l14-20020a056e021aae00b0036b2a076767mr6127246ilv.12.1714793798636; Fri, 03
 May 2024 20:36:38 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Sat, 4 May 2024 09:06:27 +0530
Message-ID: <CAAhSdy3C7N11wV8U7qMWsKtT2U+_G_FsW8EVMER8fkKHPgy8rg@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv changes for 6.10
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>, 
	Atish Patra <atishp@rivosinc.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_203647_215239_2EB41E5C 
X-CRM114-Status: GOOD (  12.79  )
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

We have the following KVM RISC-V changes for 6.10:
1) Support guest breakpoints using ebreak
2) Introduce per-VCPU mp_state_lock and reset_cntx_lock
3) Virtualize SBI PMU snapshot and counter overflow interrupts
4) New selftests for SBI PMU and Guest ebreak

Please pull.

Regards,
Anup

The following changes since commit fec50db7033ea478773b159e0e2efb135270e3b7:

  Linux 6.9-rc3 (2024-04-07 13:22:46 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.10-1

for you to fetch changes up to 5ef2f3d4e747c7851678ad2b70e37be886a8c9eb:

  KVM: riscv: selftests: Add commandline option for SBI PMU test
(2024-04-26 13:14:15 +0530)

----------------------------------------------------------------
 KVM/riscv changes for 6.10

- Support guest breakpoints using ebreak
- Introduce per-VCPU mp_state_lock and reset_cntx_lock
- Virtualize SBI PMU snapshot and counter overflow interrupts

----------------------------------------------------------------
Atish Patra (24):
      RISC-V: Fix the typo in Scountovf CSR name
      RISC-V: Add FIRMWARE_READ_HI definition
      drivers/perf: riscv: Read upper bits of a firmware counter
      drivers/perf: riscv: Use BIT macro for shifting operations
      RISC-V: Add SBI PMU snapshot definitions
      RISC-V: KVM: Rename the SBI_STA_SHMEM_DISABLE to a generic name
      RISC-V: Use the minor version mask while computing sbi version
      drivers/perf: riscv: Fix counter mask iteration for RV32
      drivers/perf: riscv: Implement SBI PMU snapshot function
      RISC-V: KVM: Fix the initial sample period value
      RISC-V: KVM: No need to update the counter value during reset
      RISC-V: KVM: No need to exit to the user space if perf event failed
      RISC-V: KVM: Implement SBI PMU Snapshot feature
      RISC-V: KVM: Add perf sampling support for guests
      RISC-V: KVM: Support 64 bit firmware counters on RV32
      RISC-V: KVM: Improve firmware counter read function
      KVM: riscv: selftests: Move sbi definitions to its own header file
      KVM: riscv: selftests: Add helper functions for extension checks
      KVM: riscv: selftests: Add Sscofpmf to get-reg-list test
      KVM: riscv: selftests: Add SBI PMU extension definitions
      KVM: riscv: selftests: Add SBI PMU selftest
      KVM: riscv: selftests: Add a test for PMU snapshot functionality
      KVM: riscv: selftests: Add a test for counter overflow
      KVM: riscv: selftests: Add commandline option for SBI PMU test

Chao Du (3):
      RISC-V: KVM: Implement kvm_arch_vcpu_ioctl_set_guest_debug()
      RISC-V: KVM: Handle breakpoint exits for VCPU
      RISC-V: KVM: selftests: Add ebreak test support

Yong-Xuan Wang (2):
      RISCV: KVM: Introduce mp_state_lock to avoid lock inversion
      RISCV: KVM: Introduce vcpu->reset_cntx_lock

 arch/riscv/include/asm/csr.h                       |   5 +-
 arch/riscv/include/asm/kvm_host.h                  |  21 +-
 arch/riscv/include/asm/kvm_vcpu_pmu.h              |  16 +-
 arch/riscv/include/asm/sbi.h                       |  38 +-
 arch/riscv/include/uapi/asm/kvm.h                  |   1 +
 arch/riscv/kernel/paravirt.c                       |   6 +-
 arch/riscv/kvm/aia.c                               |   5 +
 arch/riscv/kvm/main.c                              |  18 +-
 arch/riscv/kvm/vcpu.c                              |  85 ++-
 arch/riscv/kvm/vcpu_exit.c                         |   4 +
 arch/riscv/kvm/vcpu_onereg.c                       |   6 +
 arch/riscv/kvm/vcpu_pmu.c                          | 260 +++++++-
 arch/riscv/kvm/vcpu_sbi.c                          |   7 +-
 arch/riscv/kvm/vcpu_sbi_hsm.c                      |  42 +-
 arch/riscv/kvm/vcpu_sbi_pmu.c                      |  17 +-
 arch/riscv/kvm/vcpu_sbi_sta.c                      |   4 +-
 arch/riscv/kvm/vm.c                                |   1 +
 drivers/perf/riscv_pmu.c                           |   3 +-
 drivers/perf/riscv_pmu_sbi.c                       | 316 +++++++++-
 include/linux/perf/riscv_pmu.h                     |   8 +
 tools/testing/selftests/kvm/Makefile               |   2 +
 .../selftests/kvm/include/riscv/processor.h        |  49 +-
 tools/testing/selftests/kvm/include/riscv/sbi.h    | 141 +++++
 tools/testing/selftests/kvm/include/riscv/ucall.h  |   1 +
 tools/testing/selftests/kvm/lib/riscv/processor.c  |  12 +
 tools/testing/selftests/kvm/riscv/arch_timer.c     |   2 +-
 tools/testing/selftests/kvm/riscv/ebreak_test.c    |  82 +++
 tools/testing/selftests/kvm/riscv/get-reg-list.c   |   4 +
 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c   | 681 +++++++++++++++++++++
 tools/testing/selftests/kvm/steal_time.c           |   4 +-
 30 files changed, 1674 insertions(+), 167 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/include/riscv/sbi.h
 create mode 100644 tools/testing/selftests/kvm/riscv/ebreak_test.c
 create mode 100644 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
