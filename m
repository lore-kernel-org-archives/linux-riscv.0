Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24803C07545
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 07:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f0ew4IupxRcpUtYtawGsnfA44aktOpdQAtzxI8AT/hw=; b=h2zqxGnk+RWSe/
	RbjvcbPS7gw+vSNK05LaTHnIgpH5JefZRI6d7Q7dRkwWOzv8EaXg/DKZQyni9BXNXTPmMErlysDdu
	95Dihbxh0FZEyqIxugjf2m2e+TYPyyH86/hn+g6qizE6YTEuG1ilfmVEzI3mnMlH5A+yv0jiC7kT0
	F4DKHFfMoOPkOWO4Npd8PmBAYgO0jZrQCt+nSGObWPs//CKLm0rqmW1InKf6PRQsHeWdEBwNvlJLZ
	uyO8P3kXE6HNn64t1CDF0M42wTvtOhV3wCp4O1d5Wuh1XmaSJu8mf5AG/skA45/Z/aUmxcAyt8GLF
	xNvRWbaNYj5iwSdhhjTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvCG7-0097om-1P;
	Tue, 24 Oct 2023 07:55:27 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvCG3-0097nu-2q
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 07:55:25 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-5a9bf4fbd3fso3059324a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Oct 2023 00:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1698134122; x=1698738922; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o1OkbJmnnWIN+URdErn5nNacnovVGr3BkRnPR6Q0V5U=;
        b=Ec8JiZeTXU5ynpRN6V8t9NjXUaRIKFxTzMRIHqi6cyu8FXnE8foo8MchbZmjlPVwa4
         bMXGUXFC1Oejt2wETE2SesACrK/QeuG0gU6L75J6fMADyJQE5HZM6pY7RcRdDI9pJdVR
         42TyYVgA4zQOgzUIrqA3QgmRGQS5pMYIyH5vQV7OLMosR+MJ0PCKwut6ru8HyCz9JD2n
         gizohzNGm7jqs7M/FaIcjCvj7DZSxRVF/XRBM5gB4zUZ75jIOR9f2KFSyhgDz5ShyZwH
         +vDZ8VK/mfPFFf5PvbR8lckxDjpqRHpWgP/ukhg0WVpiiin0pala9tdwjZUeVAhXrZ6p
         yBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698134122; x=1698738922;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o1OkbJmnnWIN+URdErn5nNacnovVGr3BkRnPR6Q0V5U=;
        b=ZJ8Q8U0AWr0l7gg90yFFg+Vz3lM8nFOd1MEFI28w//UnN49GiqQQvnzS0K82mLvsc0
         sAXJNO7nrd9YWIt8DOfZA1w9UhNDMQStQ1v44W/R7hbSPcRW4DPo5tvkzsqMm3mxmfwT
         Oz/aiswzk35spte1EqoGja1izAaETQUtsv5w2bk5xVwrEqK2PqDTguz2VDrr8B8qXN7H
         T4J1wHNtsk0KZzlSAX7VbA6ouoiwmivU4rOWbv1wy4orgczDhAHVbc21OPQZSsIAbl82
         Jm/lCnUM+5WFmxF5XhQxYPNVor00S5/H6jCMAmo1Bt1E47HaUatqimMYmpiKlkUsBGvS
         xm6Q==
X-Gm-Message-State: AOJu0YxaeP51OXybtqoaRZn9KN5IOG3K02eIlHqLTJ5y/zIqeqjbG1S5
	xDxlP+UWNXhVvEfHf3R6g9IUJqeVBiJuvHUdOWBUCg==
X-Google-Smtp-Source: AGHT+IESe7yLkYn4jHtaeEJUILf4yttqOK3b1t5e2moa34SyCMsGt2bc8wSXfYGQfzjaQgUOGClTATr8/JZzduHM9YQ=
X-Received: by 2002:a05:6a20:729e:b0:15e:bb88:b76e with SMTP id
 o30-20020a056a20729e00b0015ebb88b76emr2006406pzk.14.1698134122184; Tue, 24
 Oct 2023 00:55:22 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Tue, 24 Oct 2023 13:25:10 +0530
Message-ID: <CAAhSdy2p0h8i=GPBx+=ZJVr_PSwOHhTqanJQmOc0O0bw1ffrmw@mail.gmail.com>
Subject: KVM/riscv changes for 6.7
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_005524_137216_CBAA61D8 
X-CRM114-Status: UNSURE (   7.71  )
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

We have the following KVM RISC-V changes for 6.7:
1) Smstateen and Zicond support for Guest/VM
2) Virtualized senvcfg CSR for Guest/VM
3) Added Smstateen registers to the get-reg-list selftests
4) Added Zicond to the get-reg-list selftests
5) Virtualized SBI debug console (DBCN) for Guest/VM
6) Added SBI debug console (DBCN) to the get-reg-list selftests

Please pull.

Please note that the following four patches are part of the
shared tag kvm-riscv-shared-tag-6.7 provided to Palmer:
 - dt-bindings: riscv: Add Zicond extension entry
 - RISC-V: Detect Zicond from ISA string
 - dt-bindings: riscv: Add smstateen entry
 - RISC-V: Detect Smstateen extension

Regards,
Anup

The following changes since commit 94f6f0550c625fab1f373bb86a6669b45e9748b3:

  Linux 6.6-rc5 (2023-10-08 13:49:43 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.7-1

for you to fetch changes up to d9c00f44e5de542340cce1d09e2c990e16c0ed3a:

  KVM: riscv: selftests: Add SBI DBCN extension to get-reg-list test
(2023-10-20 16:50:39 +0530)

----------------------------------------------------------------
KVM/riscv changes for 6.7

- Smstateen and Zicond support for Guest/VM
- Virtualized senvcfg CSR for Guest/VM
- Added Smstateen registers to the get-reg-list selftests
- Added Zicond to the get-reg-list selftests
- Virtualized SBI debug console (DBCN) for Guest/VM
- Added SBI debug console (DBCN) to the get-reg-list selftests

----------------------------------------------------------------
Andrew Jones (3):
      MAINTAINERS: RISC-V: KVM: Add another kselftests path
      KVM: selftests: Add array order helpers to riscv get-reg-list
      KVM: riscv: selftests: get-reg-list print_reg should never fail

Anup Patel (11):
      RISC-V: Detect Zicond from ISA string
      dt-bindings: riscv: Add Zicond extension entry
      RISC-V: KVM: Allow Zicond extension for Guest/VM
      KVM: riscv: selftests: Add senvcfg register to get-reg-list test
      KVM: riscv: selftests: Add smstateen registers to get-reg-list test
      KVM: riscv: selftests: Add condops extensions to get-reg-list test
      RISC-V: Add defines for SBI debug console extension
      RISC-V: KVM: Change the SBI specification version to v2.0
      RISC-V: KVM: Allow some SBI extensions to be disabled by default
      RISC-V: KVM: Forward SBI DBCN extension to user-space
      KVM: riscv: selftests: Add SBI DBCN extension to get-reg-list test

Mayuresh Chitale (7):
      RISC-V: Detect Smstateen extension
      dt-bindings: riscv: Add smstateen entry
      RISC-V: KVM: Add kvm_vcpu_config
      RISC-V: KVM: Enable Smstateen accesses
      RISCV: KVM: Add senvcfg context save/restore
      RISCV: KVM: Add sstateen0 context save/restore
      RISCV: KVM: Add sstateen0 to ONE_REG

 .../devicetree/bindings/riscv/extensions.yaml      |  12 ++
 MAINTAINERS                                        |   1 +
 arch/riscv/include/asm/csr.h                       |  18 ++
 arch/riscv/include/asm/hwcap.h                     |   2 +
 arch/riscv/include/asm/kvm_host.h                  |  18 ++
 arch/riscv/include/asm/kvm_vcpu_sbi.h              |   7 +-
 arch/riscv/include/asm/sbi.h                       |   7 +
 arch/riscv/include/uapi/asm/kvm.h                  |  12 ++
 arch/riscv/kernel/cpufeature.c                     |   2 +
 arch/riscv/kvm/vcpu.c                              |  76 +++++--
 arch/riscv/kvm/vcpu_onereg.c                       |  72 ++++++-
 arch/riscv/kvm/vcpu_sbi.c                          |  61 +++---
 arch/riscv/kvm/vcpu_sbi_replace.c                  |  32 +++
 tools/testing/selftests/kvm/riscv/get-reg-list.c   | 233 +++++++++++++--------
 14 files changed, 418 insertions(+), 135 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
