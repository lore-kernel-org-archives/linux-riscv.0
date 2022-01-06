Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D0CC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jan 2022 13:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hV//WFkHy+Qi/GdyMUUSub2wQot7lHwPKI1+ezUL2Ow=; b=P/5J5BfBI5wVaA
	IwOxgPQGjrGf2lBLE9OmPLRi/oGsxqFyefOn0ov4FEJLL2MwoMUXCFC6PZEEJMvUol/72NdR+5hAm
	UrpPX24qrfhCxbov6R5LipRB6gDwQmsQtG1mUAVGUMJNmOiHKD0SINldCzZLkoIJalH12OTnyC5dc
	u5kBOzELFMFV6XQQZcvosStrOWQNaiePzc1DDrUlm0Dc7lKINA4loamyVC09qZUyFcQf5rzS+MvOk
	TzRX83VjPYmm07+cl5mmgT12ZVzzXz6yP1cMeDFkxSxI5k9EiQmzshU+4lAtN5U0P1loMZGX3p/mL
	5h16r781XdayLuDAmNcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5Sho-0009dk-OI; Thu, 06 Jan 2022 13:21:24 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5Shl-0009aM-HL
 for linux-riscv@lists.infradead.org; Thu, 06 Jan 2022 13:21:23 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 p1-20020a1c7401000000b00345c2d068bdso3656282wmc.3
 for <linux-riscv@lists.infradead.org>; Thu, 06 Jan 2022 05:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=FEwZHSoug1dOrMofJocJDbwU7ylidc8yair4c5/4LYw=;
 b=NLNA5+yeGoQdZTDSUOpDkZHMxhAP4Hu5s1d9oVzz5nsPOgkJbQ+qJh/bo7pITC+lxL
 YKh1kKhrNNlbR6DWRNiq21ZjW8k2g+CLc+PmQTNRWWFeGqr2ZYpHmwVR8rlT2yt+jXUB
 OdTXt7nvm6W3R3+J7g+4so5ZxGdf8nD4IeOwMgDma1cANLDwYaQ6KXluKo9zbDNhAK/f
 JWeY23zRtB6iWB2yfG0K8718jwgJb+5T+8+Uxp58OfH2bbSUjs6TeCQWUrMO9JuTzV6p
 EL8+46oN7UWo5rVvTrkYPvRmqukT8ze4fTdQEetqztKRarTm7aZtIZxoDYgAIU/CTH6d
 ljMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=FEwZHSoug1dOrMofJocJDbwU7ylidc8yair4c5/4LYw=;
 b=bAb2jG0QT769daJyrnE2Ek3ESD9iFi9EG9WXyVVC0QI/Cp1ecW8fZz1k33/Hdyaysw
 HSafYXXzSCfixQEmEep4MZ9tULDVK6muPFCwrOt2QH0t+APjgQ5aOlJhuIx6VZpr+o7o
 erAfM+7nBMTAdfiT2ErLsf3ifMdeUac3dZkQqkVSEyTB2NKtI7+2lNfYcNFgu6ImBZKU
 2VlxyT4PtM+Zq21bFh213x/yzNp4TBT/34UtyTAX+1OU3R8XdmA6JDxSHT64ZxahwvX1
 yM5Iex8noFGoAh6HY9cK8JZYYXlXOGdFFaw88LX6+yd+cg+AeoQedss4iWvwG3p/0x6z
 VuQw==
X-Gm-Message-State: AOAM532AyoJHc1Vb0STwRlAWErmg1OTAzwFXONyKcQntjqb3BR+/K5UF
 hc0xDJ3k6CgAwHM8L3aoU96c5H8ki0iWE1lBh3ttcqsYN1inC5aH
X-Google-Smtp-Source: ABdhPJyuYQg1E3xaLQAzjA28pfA0Ql48QdtnO98R1CYhsbt3qG+WFpFm5mAkWZtL9VPRSUcSleT2ahd6Nc3dJaKWr8o=
X-Received: by 2002:a05:600c:3d8e:: with SMTP id
 bi14mr7006042wmb.137.1641475275727; 
 Thu, 06 Jan 2022 05:21:15 -0800 (PST)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Thu, 6 Jan 2022 18:51:01 +0530
Message-ID: <CAAhSdy2iRgCBt=6t2p5AE_Rq18s2QcRoM62ZAGiAcn5A6TfB4w@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv changes for 5.17, take #1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
 KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_052121_699081_7F52E379 
X-CRM114-Status: UNSURE (   9.23  )
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

Hi Palao,

This is the first set of changes for 5.17. We have two new
features for KVM RISC-V:
1) SBI v0.2 support and
2) Initial kvm selftest support.

Please pull.

Regards,
Anup

The following changes since commit 5e4e84f1124aa02643833b7ea40abd5a8e964388:

  Merge tag 'kvm-s390-next-5.17-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD
(2021-12-21 12:59:53 -0500)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-5.17-1

for you to fetch changes up to 497685f2c743f552ec5626d60fc12e7c00faaf06:

  MAINTAINERS: Update Anup's email address (2022-01-06 15:18:22 +0530)

----------------------------------------------------------------
KVM/riscv changes for 5.17, take #1

- Use common KVM implementation of MMU memory caches
- SBI v0.2 support for Guest
- Initial KVM selftests support
- Fix to avoid spurious virtual interrupts after clearing hideleg CSR
- Update email address for Anup and Atish

----------------------------------------------------------------
Anup Patel (5):
      RISC-V: KVM: Forward SBI experimental and vendor extensions
      RISC-V: KVM: Add VM capability to allow userspace get GPA bits
      KVM: selftests: Add EXTRA_CFLAGS in top-level Makefile
      KVM: selftests: Add initial support for RISC-V 64-bit
      MAINTAINERS: Update Anup's email address

Atish Patra (6):
      RISC-V: KVM: Mark the existing SBI implementation as v0.1
      RISC-V: KVM: Reorganize SBI code by moving SBI v0.1 to its own file
      RISC-V: KVM: Add SBI v0.2 base extension
      RISC-V: KVM: Add v0.1 replacement SBI extensions defined in v0.2
      RISC-V: KVM: Add SBI HSM extension in KVM
      MAINTAINERS: Update Atish's email address

Jisheng Zhang (1):
      RISC-V: KVM: make kvm_riscv_vcpu_fp_clean() static

Sean Christopherson (1):
      KVM: RISC-V: Use common KVM implementation of MMU memory caches

Vincent Chen (1):
      KVM: RISC-V: Avoid spurious virtual interrupts after clearing hideleg CSR

 .mailmap                                           |   2 +
 MAINTAINERS                                        |   4 +-
 arch/riscv/include/asm/kvm_host.h                  |  11 +-
 arch/riscv/include/asm/kvm_types.h                 |   2 +-
 arch/riscv/include/asm/kvm_vcpu_sbi.h              |  33 ++
 arch/riscv/include/asm/sbi.h                       |   9 +
 arch/riscv/kvm/Makefile                            |   4 +
 arch/riscv/kvm/main.c                              |   8 +
 arch/riscv/kvm/mmu.c                               |  71 +---
 arch/riscv/kvm/vcpu.c                              |  28 +-
 arch/riscv/kvm/vcpu_fp.c                           |   2 +-
 arch/riscv/kvm/vcpu_sbi.c                          | 213 ++++++------
 arch/riscv/kvm/vcpu_sbi_base.c                     |  99 ++++++
 arch/riscv/kvm/vcpu_sbi_hsm.c                      | 105 ++++++
 arch/riscv/kvm/vcpu_sbi_replace.c                  | 135 ++++++++
 arch/riscv/kvm/vcpu_sbi_v01.c                      | 126 +++++++
 arch/riscv/kvm/vm.c                                |   3 +
 include/uapi/linux/kvm.h                           |   1 +
 tools/testing/selftests/kvm/Makefile               |  14 +-
 tools/testing/selftests/kvm/include/kvm_util.h     |  10 +
 .../selftests/kvm/include/riscv/processor.h        | 135 ++++++++
 tools/testing/selftests/kvm/lib/guest_modes.c      |  10 +
 tools/testing/selftests/kvm/lib/riscv/processor.c  | 362 +++++++++++++++++++++
 tools/testing/selftests/kvm/lib/riscv/ucall.c      |  87 +++++
 24 files changed, 1291 insertions(+), 183 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_vcpu_sbi.h
 create mode 100644 arch/riscv/kvm/vcpu_sbi_base.c
 create mode 100644 arch/riscv/kvm/vcpu_sbi_hsm.c
 create mode 100644 arch/riscv/kvm/vcpu_sbi_replace.c
 create mode 100644 arch/riscv/kvm/vcpu_sbi_v01.c
 create mode 100644 tools/testing/selftests/kvm/include/riscv/processor.h
 create mode 100644 tools/testing/selftests/kvm/lib/riscv/processor.c
 create mode 100644 tools/testing/selftests/kvm/lib/riscv/ucall.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
