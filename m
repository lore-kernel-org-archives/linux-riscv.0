Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C143C7618E
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 17:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cqPPi2mH6zAWTevuWB8MKYRBPVVfjCKldj/cifNHwxQ=; b=fV297NwbYfrMha
	wshhfkfqYyVberksZ2rsxECoJi1E3Ca0hRvOATgtKjBq6Q6dBsNge0a2diONu3Tynk5dtul19M7f8
	0XNut5N94BFbZt+Pv1mkjdUSfyQ80ETWBaTYL/CtQDPJGrVqKvzYiM+XRpxi87mjVJlwoytrxC9fY
	7GnYuCn9StuelAMvteYMo1Nrwk27GzKIYrGfiulk5nQHJZzCLwCUIfh6bTwSNwZFPTAlaXJCrDrIC
	qb+kZqccE2fjKajrjSG364RPpNRQmdIHk3JQ6cgbrxicRS7c5JVwiRXuvmIlXQHSxaOpgGQ9cPAZr
	C94xhmgKzRZW765D5fKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppueH-00BVYz-14;
	Fri, 21 Apr 2023 17:34:17 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppueE-00BVYK-1C
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 17:34:16 +0000
Received: by mail-ed1-x543.google.com with SMTP id 4fb4d7f45d1cf-5051abd03a7so2808418a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Apr 2023 10:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1682098452; x=1684690452;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gmbHaAEPuU4oEmlAG224eV0NF90p/lDU8WXg7UgBfxs=;
        b=0Yf4QFtDYxApW8e+Npa8eclnh1VPHECPdGgPfNTV+QtqQajhKU+b5z/94b/0kjjMLO
         9jNHHye49I5lSjPgdZmti3vLwUqQcMJnmyh/k7xXfuVJE10F2oGKWSHY2vIV+kwa8+t7
         fAML1NpJB08gTXg/dasdPltO/cgah/Ls7Z5pUVlUFcVxGQkjmTyIr1nNUgLZZc3okHyY
         QXECeu32BbNB0dcFw81iIE0FZynz/mP4m1+JRBODA+gM7xc7GOzGrO4ONwx0ZbG/DmM4
         8DhlSRRP5Wfd0gAb2llDQJ61n6Bcb6dtzWtEzY/ZU5YWucTfG3tX0eGFlVl7S5AImlQn
         aY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682098452; x=1684690452;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gmbHaAEPuU4oEmlAG224eV0NF90p/lDU8WXg7UgBfxs=;
        b=PLmMeSUTaDbLdStn+UemaVbIV2rSFZsIux2TLQl6Xyp0gsDm5vuSmauxMx7g5z1LLs
         aBPgLuBWe/mwBMfx4ypznMfVcueGJFJXPmqXKbepS7XGP+Llar57VYL6fr7NchP+5dM8
         MeKyKgvEo4rB6xSwcoWj+uoOrZIyzwMhV92NIXd5h2nNDtNYT09XVqXuFQGXPSrBbHze
         OvyBF3FhHqixl5Ffe5ls2o/CDI7w7QL5oK1jPffrgTxyIwrH49DXWW1yQJITvsC6ZEF5
         Iate8ndNUSdXDUDyC8j775jqx0S1KCIbvTef/Ld4xSFKxvBVrUAd98zRb7W2/PzWvvn0
         rsNg==
X-Gm-Message-State: AAQBX9eFFgM0OtZZ6WgA9J59GKp17zKjC0Ji9u1iwjKPqN+0jnL7303N
	lQFt0pHwma53qdLNbG9v05Iyaifn7UOKN9dBR5Q4nQ==
X-Google-Smtp-Source: AKy350ZyHJzBdNd9Rl58RWyYWoyAjvKclDuYlwqb0MZh+iKf0jW1tajFN5kR9NWZ4LTB8iD0kOx3hQ7QlL/dJY8wNHM=
X-Received: by 2002:a17:906:58c:b0:953:429e:fff6 with SMTP id
 12-20020a170906058c00b00953429efff6mr3148032ejn.51.1682098451946; Fri, 21 Apr
 2023 10:34:11 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Fri, 21 Apr 2023 23:04:00 +0530
Message-ID: <CAAhSdy2RLinG5Gx-sfOqrYDAT=xDa3WAk8r1jTu8ReO5Jo0LVA@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv changes for 6.4
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_103414_672204_971E3248 
X-CRM114-Status: UNSURE (   9.58  )
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

We have the following KVM RISC-V changes for 6.4:
1) ONE_REG interface to enable/disable SBI extensions
2) Zbb extension for Guest/VM
3) AIA CSR virtualization
4) Few minor cleanups and fixes

Please pull.

Please note that the Zicboz series has been taken by
Palmer through the RISC-V tree which results in few
minor conflicts in the following files:
arch/riscv/include/asm/hwcap.h
arch/riscv/include/uapi/asm/kvm.h
arch/riscv/kernel/cpu.c
arch/riscv/kernel/cpufeature.c
arch/riscv/kvm/vcpu.c

I am not sure if a shared tag can make things easy
for you or Palmer.

Regards,
Anup

The following changes since commit 6a8f57ae2eb07ab39a6f0ccad60c760743051026:

  Linux 6.3-rc7 (2023-04-16 15:23:53 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.4-1

for you to fetch changes up to 2f4d58f7635aec014428e73ef6120c4d0377c430:

  RISC-V: KVM: Virtualize per-HART AIA CSRs (2023-04-21 18:10:27 +0530)

----------------------------------------------------------------
KVM/riscv changes for 6.4

- ONE_REG interface to enable/disable SBI extensions
- Zbb extension for Guest/VM
- AIA CSR virtualization

----------------------------------------------------------------
Andrew Jones (1):
      RISC-V: KVM: Alphabetize selects

Anup Patel (10):
      RISC-V: KVM: Add ONE_REG interface to enable/disable SBI extensions
      RISC-V: KVM: Allow Zbb extension for Guest/VM
      RISC-V: Add AIA related CSR defines
      RISC-V: Detect AIA CSRs from ISA string
      RISC-V: KVM: Drop the _MASK suffix from hgatp.VMID mask defines
      RISC-V: KVM: Initial skeletal support for AIA
      RISC-V: KVM: Implement subtype for CSR ONE_REG interface
      RISC-V: KVM: Add ONE_REG interface for AIA CSRs
      RISC-V: KVM: Use bitmap for irqs_pending and irqs_pending_mask
      RISC-V: KVM: Virtualize per-HART AIA CSRs

David Matlack (1):
      KVM: RISC-V: Retry fault if vma_lookup() results become invalid

 arch/riscv/include/asm/csr.h          | 107 +++++++++-
 arch/riscv/include/asm/hwcap.h        |   8 +
 arch/riscv/include/asm/kvm_aia.h      | 127 +++++++++++
 arch/riscv/include/asm/kvm_host.h     |  14 +-
 arch/riscv/include/asm/kvm_vcpu_sbi.h |   8 +-
 arch/riscv/include/uapi/asm/kvm.h     |  51 ++++-
 arch/riscv/kernel/cpu.c               |   2 +
 arch/riscv/kernel/cpufeature.c        |   2 +
 arch/riscv/kvm/Kconfig                |  10 +-
 arch/riscv/kvm/Makefile               |   1 +
 arch/riscv/kvm/aia.c                  | 388 ++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/main.c                 |  22 +-
 arch/riscv/kvm/mmu.c                  |  28 ++-
 arch/riscv/kvm/vcpu.c                 | 194 +++++++++++++----
 arch/riscv/kvm/vcpu_insn.c            |   1 +
 arch/riscv/kvm/vcpu_sbi.c             | 247 ++++++++++++++++++++--
 arch/riscv/kvm/vcpu_sbi_base.c        |   2 +-
 arch/riscv/kvm/vm.c                   |   4 +
 arch/riscv/kvm/vmid.c                 |   4 +-
 19 files changed, 1129 insertions(+), 91 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_aia.h
 create mode 100644 arch/riscv/kvm/aia.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
