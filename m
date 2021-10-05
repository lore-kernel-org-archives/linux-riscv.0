Return-Path: <SRS0=Z6yX=OZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04629C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 07:55:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C09F961352
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 07:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C09F961352
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xvJYcqHz+TMiaIT5M0wHAi39S6NH48g4CTLdiVv8AJQ=; b=S8Bo1sr16DiBtr
	ZKjc30Q0TK2pPKShAWtZpMIDUSADvDr243WlkRgk5Rm8wE9gcgecNoNnEttzejreSo3n9mE+LEEO5
	S2UFG75UBs3Ve6r1y3BjTFZkdQ56Li04RNXr6BOb9nHiri7sccaHDHujGMMugcFsi/bJTgmMUGm3t
	nq1dgdqPJ3KcdSPAQrudm0MMoEN2wDSQ4FJJ/wB9FFZHm/fPvWmYJu+ekMtMJ+2eI/jns4MG3WpEH
	t/jXiePZWnA53fFPGHEDyf1+gPG9Uc0c3dw2Nmu45hNXGjEYT8NoGDkslxrgolp8bBf9kdjXowI9A
	LHWju5k76Xg+nks6DkIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXfIJ-009RZI-Mg; Tue, 05 Oct 2021 07:55:23 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXfIH-009RXX-2e
 for linux-riscv@lists.infradead.org; Tue, 05 Oct 2021 07:55:22 +0000
Received: by mail-wr1-x429.google.com with SMTP id r10so19246667wra.12
 for <linux-riscv@lists.infradead.org>; Tue, 05 Oct 2021 00:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=TpulCX7npQF5e07hvQ3boQz+xIFvtGE3nVeFjtPk+QE=;
 b=jmkiurrRXdEWLLP7+WsGhKmU/GTo7CTUddVbaghaNPrSIkyQ3vaRN4k7wJdjSNUKou
 vHEdb4RvW0DfKalHKG++IRYlHyC3yMqHKa89Lds97UokeB6XGDUu7GctlGXObVrYoZz8
 OW8fnrtPtpfj8LjcdkaPlsYGuLZASe5kejFGTknsCjuPWM3dcog2AGEpEZdOUjmwHwYb
 IJfx/5H0xmQpT4k1uMvOFOmENfV+i8aIcMYY36JP7WX4LUruKlUAxrZ7fGkorUkzjU/S
 eoFKFTBCPYJ/JNl9ssuBMqBztFThk2ubiVeCh5Do3z4SuuulNAgfCK+N6ybDLajnFCVX
 I/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=TpulCX7npQF5e07hvQ3boQz+xIFvtGE3nVeFjtPk+QE=;
 b=YQ/0aTfUM3NSSKgpQlckXdfEm9CPRRvbqkLPiGdTYqs8wZWv3tfqvbaDUy7NKLeWsz
 0h1mTk8oSD/YqkRRUFsz4udjLP67Yn9rTe3jPw1dyfKBvM+KEn4F8pHjP/VeWZPfns/Q
 34HA92v8VhaDEMsGKNytUxb46DR3tGeNwCyYw5XlQNv7MyaybflK3QeCtUFiD3Y5bjab
 a/NS8LgCDAF7Ro6gUWP+vhzkZyaklvA1sSNJDGKJOIItujSY02yMEerzZ4v/ak1qRCU6
 fk07JufPvW1yKL+ZdmjncOtFlb2lzEzPPWvw+FljEUTVUHsEzSCG0lNds5OIli5PZLG1
 /Yxw==
X-Gm-Message-State: AOAM5323VExdb3mu2Niy9YDBrAfSCwfr5Ga/ZKfus0mgR+29CbP6udJH
 Bl2lcdtglSen+gvgevINAnG74PV4YiQwDHSGkt3KWGGpHuo/bw==
X-Google-Smtp-Source: ABdhPJzPD4cRXG+lZnI0BaIc2LF4yFyt+eCJr1+tsz1zoYr2KiWPdAsWfvwkjehVIrbIRCQP9EYJu6+TJcuatzfUNnU=
X-Received: by 2002:adf:e805:: with SMTP id o5mr19360415wrm.249.1633420518388; 
 Tue, 05 Oct 2021 00:55:18 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Tue, 5 Oct 2021 13:25:07 +0530
Message-ID: <CAAhSdy37xNOs3udMe4GuLJ3=huKD1bsHEO_RfUPvuMiVw56GCQ@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv for 5.16
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_005521_203663_D7CD910F 
X-CRM114-Status: GOOD (  10.25  )
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

As discussed on the KVM RISC-V v20 series thread, here's the first
KVM/riscv pull request for 5.16. This pull request has all patches of
the KVM RISC-V v20 series except PATCH1 which is available in the
shared tag "for-riscv" of the KVM tree.

Please pull.

Best Regards,
Anup

The following changes since commit 3f2401f47d29d669e2cb137709d10dd4c156a02f:

  RISC-V: Add hypervisor extension related CSR defines (2021-10-04
04:54:55 -0400)

are available in the Git repository at:

  git://github.com/kvm-riscv/linux.git tags/kvm-riscv-5.16-1

for you to fetch changes up to 24b699d12c34cfc907de9fe3989a122b7b13391c:

  RISC-V: KVM: Add MAINTAINERS entry (2021-10-04 16:14:10 +0530)

----------------------------------------------------------------
Initial KVM RISC-V support

Following features are supported by the initial KVM RISC-V support:
1. No RISC-V specific KVM IOCTL
2. Loadable KVM RISC-V module
3. Minimal possible KVM world-switch which touches only GPRs and few CSRs
4. Works on both RV64 and RV32 host
5. Full Guest/VM switch via vcpu_get/vcpu_put infrastructure
6. KVM ONE_REG interface for VCPU register access from KVM user-space
7. Interrupt controller emulation in KVM user-space
8. Timer and IPI emuation in kernel
9. Both Sv39x4 and Sv48x4 supported for RV64 host
10. MMU notifiers supported
11. Generic dirty log supported
12. FP lazy save/restore supported
13. SBI v0.1 emulation for Guest/VM
14. Forward unhandled SBI calls to KVM user-space
15. Hugepage support for Guest/VM
16. IOEVENTFD support for Vhost

----------------------------------------------------------------
Anup Patel (12):
      RISC-V: Add initial skeletal KVM support
      RISC-V: KVM: Implement VCPU create, init and destroy functions
      RISC-V: KVM: Implement VCPU interrupts and requests handling
      RISC-V: KVM: Implement KVM_GET_ONE_REG/KVM_SET_ONE_REG ioctls
      RISC-V: KVM: Implement VCPU world-switch
      RISC-V: KVM: Handle MMIO exits for VCPU
      RISC-V: KVM: Handle WFI exits for VCPU
      RISC-V: KVM: Implement VMID allocator
      RISC-V: KVM: Implement stage2 page table programming
      RISC-V: KVM: Implement MMU notifiers
      RISC-V: KVM: Document RISC-V specific parts of KVM API
      RISC-V: KVM: Add MAINTAINERS entry

Atish Patra (4):
      RISC-V: KVM: Add timer functionality
      RISC-V: KVM: FP lazy save/restore
      RISC-V: KVM: Implement ONE REG interface for FP registers
      RISC-V: KVM: Add SBI v0.1 support

 Documentation/virt/kvm/api.rst          | 193 ++++++++++++++++++++++++++--
 MAINTAINERS                             |  12 ++
 arch/riscv/Kconfig                      |   1 +
 arch/riscv/Makefile                     |   1 +
 arch/riscv/include/asm/kvm_host.h       | 266
++++++++++++++++++++++++++++++++++++++
 arch/riscv/include/asm/kvm_types.h      |   7 +
 arch/riscv/include/asm/kvm_vcpu_timer.h |  44 +++++++
 arch/riscv/include/uapi/asm/kvm.h       | 128 ++++++++++++++++++
 arch/riscv/kernel/asm-offsets.c         | 156 ++++++++++++++++++++++
 arch/riscv/kvm/Kconfig                  |  36 ++++++
 arch/riscv/kvm/Makefile                 |  25 ++++
 arch/riscv/kvm/main.c                   | 118 +++++++++++++++++
 arch/riscv/kvm/mmu.c                    | 802
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/tlb.S                    |  74 +++++++++++
 arch/riscv/kvm/vcpu.c                   | 997
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_exit.c              | 701
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_sbi.c               | 185 ++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_switch.S            | 400
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_timer.c             | 225 ++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vm.c                     |  97 ++++++++++++++
 arch/riscv/kvm/vmid.c                   | 120 +++++++++++++++++
 drivers/clocksource/timer-riscv.c       |   9 ++
 include/clocksource/timer-riscv.h       |  16 +++
 include/uapi/linux/kvm.h                |   8 ++
 24 files changed, 4612 insertions(+), 9 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_host.h
 create mode 100644 arch/riscv/include/asm/kvm_types.h
 create mode 100644 arch/riscv/include/asm/kvm_vcpu_timer.h
 create mode 100644 arch/riscv/include/uapi/asm/kvm.h
 create mode 100644 arch/riscv/kvm/Kconfig
 create mode 100644 arch/riscv/kvm/Makefile
 create mode 100644 arch/riscv/kvm/main.c
 create mode 100644 arch/riscv/kvm/mmu.c
 create mode 100644 arch/riscv/kvm/tlb.S
 create mode 100644 arch/riscv/kvm/vcpu.c
 create mode 100644 arch/riscv/kvm/vcpu_exit.c
 create mode 100644 arch/riscv/kvm/vcpu_sbi.c
 create mode 100644 arch/riscv/kvm/vcpu_switch.S
 create mode 100644 arch/riscv/kvm/vcpu_timer.c
 create mode 100644 arch/riscv/kvm/vm.c
 create mode 100644 arch/riscv/kvm/vmid.c
 create mode 100644 include/clocksource/timer-riscv.h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
