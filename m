Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D5CC48BF6
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 06:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vsaVi0KBo05ie8MgxqaWDSE1Xol9/O6fVjuYdhZWU1Q=; b=Dc2xWoF11lDi/q
	fEPV+PU8jj7h4di3+eBW17aigvBZZOR/wGnuCNIa+7XQPO9qKfh8WDAM8AT1PsbjGWVQSEnLfHTKz
	4aZ11b9l+JFDVdrVWlcHMHN/3COXtZ8YRk/eIKW6h26y6al4AfW5tlHrAX+eeZAUYwxAqOu8PWEq/
	iqF1ayzAE4Obc9Ghtvn8B+yEDSVHUKjmySLf6lc2YOrlVvUTgXL70WWHIgQ//mRy/v7gK368yrXo0
	m+0MHtWnh/vGwJDGDYvlzhfkBreLb+iLRjRRFuWMq2mR5T5SCNEAtSRQhXPLGUMhRggFn5d6vLcKy
	Qddn9hvDhfoi2PMx23fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri7Vb-00000003JH4-3vXV;
	Thu, 07 Mar 2024 06:45:39 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri7VY-00000003JFb-0DT3
	for linux-riscv@lists.infradead.org;
	Thu, 07 Mar 2024 06:45:37 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-365aff1fa8dso1169235ab.2
        for <linux-riscv@lists.infradead.org>; Wed, 06 Mar 2024 22:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1709793933; x=1710398733; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jFdoT6NxUd7wijjg0PVr8J+9hYlZ4u3LPtuf4wizZgI=;
        b=Oobtn411F97ceiA8VymrnYEvNc+535rv6FyimEo7FKgiWW5JEMKzfg7PCgBqnIjn+L
         dwOjAq0VsWUH3CxXd+rQb/3aKffPvXeZidVD/nxUAKCex8BEPHteFjSiUqsn7fgZ1v5V
         qpILfu3MGol2mhO1EmHI5PYoVjali+pTnIzdAcAu3ZAEZELSU5VS8V/SV2WOhoY7HF7H
         vmxCFP0sVxpuDiFfxcOywuWpKOU1+PluJS4tznBF1MGRyeXMXjeYvi23uEapNwojmYnW
         O0dwfj+PWchMCON+Em3gWnaMjjj4dpOlngzxFDMhSpmmkQ4IERKinTr9b1Ds2PqNWduq
         42Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709793933; x=1710398733;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jFdoT6NxUd7wijjg0PVr8J+9hYlZ4u3LPtuf4wizZgI=;
        b=CLG9zHqmXOK75qHeYeJPfMNRf6cM7Lv7TYn4Yo/ln8gAAJHFFmgdhTTWFXyZCGMo6a
         5HZLmUNxlx/NA9iEuG1hmU70l4H6yRXd2yTLQRGWtjBGkmKCI5c62ULMz7aS7tcf92ix
         1Lhrb5GKlIJufHdu6okqZEwToORLc2yXGKEOIC0j5iOH4CAlp45DsoIq2y1NH2lcdnxL
         V1LSg8v2+3tc3ubv+FDJRzg3djvCIic4h0DYClIqmigjyx3hYUJewtCkqbj0yXSr4VpS
         McHFFcdc0LSgoiv5xyl5TTmphym2j28K/ys7ZYtcuAdE22u8c/YOxUWwQJmDay3l9gJ5
         ZM/w==
X-Forwarded-Encrypted: i=1; AJvYcCU4UY1m5kxq/H+K5PZxjxF5/nmsgaLtWQle3lYq17ADsok0Dq+T6Rp3KUWICvrlH6i+WghLwTQ2HPSRrZAehMo1zinsoQ7AtNRuOIgVXvdN
X-Gm-Message-State: AOJu0YxK5dLvKfOOkx81aY/1G1gPOOpEAY8ho57eSxISAENG7r8d+4YJ
	TyosxAgyhqyoiknqkGu+cm1rm77iDD9xEw0F7J5HfTsWhAPd1LtHByn6BWXSE/ezqaQdCSSMrsS
	BkB6RZw+fftBYCUsdVXiwYTGW5tyv1FBlRmER4w==
X-Google-Smtp-Source: AGHT+IF968ZqmYYThRYVmnBpyJc6Q8Hnnpb/12/shALsyC4DrXEZfzmp+mUo2vV3lFDMBhD2/0h1w0r5r0TJ414mxHs=
X-Received: by 2002:a05:6e02:148d:b0:365:1dd9:ee6b with SMTP id
 n13-20020a056e02148d00b003651dd9ee6bmr25804253ilk.25.1709793933163; Wed, 06
 Mar 2024 22:45:33 -0800 (PST)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Thu, 7 Mar 2024 12:15:21 +0530
Message-ID: <CAAhSdy1rYFoYjCRWTPouiT=tiN26Z_v3Y36K2MyDrcCkRs1Luw@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv changes for 6.9
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>, 
	Atish Patra <atishp@rivosinc.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_224536_318509_1B7E09BF 
X-CRM114-Status: UNSURE (   8.44  )
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

We have the following KVM RISC-V changes for 6.9:
1) Exception and interrupt handling for selftests
2) Sstc (aka arch_timer) selftest
3) Forward seed CSR access to KVM user space
4) Ztso extension support for Guest/VM
5) Zacas extension support for Guest/VM

Please pull.

Regards,
Anup

The following changes since commit d206a76d7d2726f3b096037f2079ce0bd3ba329b:

  Linux 6.8-rc6 (2024-02-25 15:46:06 -0800)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.9-1

for you to fetch changes up to d8c0831348e78fdaf67aa95070bae2ef8e819b05:

  KVM: riscv: selftests: Add Zacas extension to get-reg-list test
(2024-03-06 20:53:44 +0530)

----------------------------------------------------------------
KVM/riscv changes for 6.9

- Exception and interrupt handling for selftests
- Sstc (aka arch_timer) selftest
- Forward seed CSR access to KVM userspace
- Ztso extension support for Guest/VM
- Zacas extension support for Guest/VM

----------------------------------------------------------------
Anup Patel (5):
      RISC-V: KVM: Forward SEED CSR access to user space
      RISC-V: KVM: Allow Ztso extension for Guest/VM
      KVM: riscv: selftests: Add Ztso extension to get-reg-list test
      RISC-V: KVM: Allow Zacas extension for Guest/VM
      KVM: riscv: selftests: Add Zacas extension to get-reg-list test

Haibo Xu (11):
      KVM: arm64: selftests: Data type cleanup for arch_timer test
      KVM: arm64: selftests: Enable tuning of error margin in arch_timer test
      KVM: arm64: selftests: Split arch_timer test code
      KVM: selftests: Add CONFIG_64BIT definition for the build
      tools: riscv: Add header file csr.h
      tools: riscv: Add header file vdso/processor.h
      KVM: riscv: selftests: Switch to use macro from csr.h
      KVM: riscv: selftests: Add exception handling support
      KVM: riscv: selftests: Add guest helper to get vcpu id
      KVM: riscv: selftests: Change vcpu_has_ext to a common function
      KVM: riscv: selftests: Add sstc timer test

Paolo Bonzini (1):
      selftests/kvm: Fix issues with $(SPLIT_TESTS)

 arch/riscv/include/uapi/asm/kvm.h                  |   2 +
 arch/riscv/kvm/vcpu_insn.c                         |  13 +
 arch/riscv/kvm/vcpu_onereg.c                       |   4 +
 tools/arch/riscv/include/asm/csr.h                 | 541 +++++++++++++++++++++
 tools/arch/riscv/include/asm/vdso/processor.h      |  32 ++
 tools/testing/selftests/kvm/Makefile               |  27 +-
 tools/testing/selftests/kvm/aarch64/arch_timer.c   | 295 +----------
 tools/testing/selftests/kvm/arch_timer.c           | 259 ++++++++++
 .../selftests/kvm/include/aarch64/processor.h      |   4 -
 .../testing/selftests/kvm/include/kvm_util_base.h  |   2 +
 .../selftests/kvm/include/riscv/arch_timer.h       |  71 +++
 .../selftests/kvm/include/riscv/processor.h        |  72 ++-
 tools/testing/selftests/kvm/include/test_util.h    |   2 +
 tools/testing/selftests/kvm/include/timer_test.h   |  45 ++
 tools/testing/selftests/kvm/lib/riscv/handlers.S   | 101 ++++
 tools/testing/selftests/kvm/lib/riscv/processor.c  |  87 ++++
 tools/testing/selftests/kvm/riscv/arch_timer.c     | 111 +++++
 tools/testing/selftests/kvm/riscv/get-reg-list.c   |  19 +-
 18 files changed, 1380 insertions(+), 307 deletions(-)
 create mode 100644 tools/arch/riscv/include/asm/csr.h
 create mode 100644 tools/arch/riscv/include/asm/vdso/processor.h
 create mode 100644 tools/testing/selftests/kvm/arch_timer.c
 create mode 100644 tools/testing/selftests/kvm/include/riscv/arch_timer.h
 create mode 100644 tools/testing/selftests/kvm/include/timer_test.h
 create mode 100644 tools/testing/selftests/kvm/lib/riscv/handlers.S
 create mode 100644 tools/testing/selftests/kvm/riscv/arch_timer.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
