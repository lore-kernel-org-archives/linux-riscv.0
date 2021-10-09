Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4512C433FE
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:13:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5731160F5E
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:13:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5731160F5E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:
	Mime-Version:Message-Id:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=6zRwz0k+NWDAw64nLzBP2c4pgZ/nJq3eVpr8Yzzp9tk=; b=ojr
	kjp2B/5N+by84/vxpD2xBC5V9xy3SLvJwPsoMw174gLoGtGgNVj1b6kTYYvfAmj3zLiZHn8UQkaVw
	QxTEXZwoKrqat0zSacCZZxh+3f4DcDkSSn1qmca8goWSVNaWKcT/ax2URTqORIfSYkO2vMEVYq8gr
	t3ncIOYMxZ5LGUtCJWpB5aXlVDaoIVLCht5bizq+mtIoW1Htpd27vIY0OdQQb5QePlRU4jxtSYbJb
	FCakswT18XmPUt5owU+kHszaOZrOapoGy4cSJqFbguqbIbhA0sx2+ep9T6IhQ+OrgXcgjtqm0vP3K
	YcADtzjQq37B+qTnZh5UABQZl9dWhpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ1qw-004TmT-Mz; Sat, 09 Oct 2021 02:12:46 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1qt-004Tkh-Nb
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:12:45 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id
 b9-20020a5b07890000b0290558245b7eabso15002560ybq.10
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:message-id:mime-version:subject:from:to:cc;
 bh=cS1lb71+JIYOSor7OwJgk2gnjH1VOs8uFvRzBEpw+bQ=;
 b=EYM8SrcNO1Csv5h/cAGhb86L7GGVUu/ZmEz7+V+AGrx+oVzewDqxj0wLNTU/xH6TNY
 N+FoJL8OJNuYof1Wa+yyqbM3Az9BEVljXvmvjmheCO9+baWSytH2Od7jpLSRuGkenjFq
 SWm+dSeSY1sryFqxTXdHds/BNzcbaZQxJWKJakz5ZC1hzhOUvNqg2MVhVJFcJ+pDmMyn
 Z0JnLSQRsdLSZgotZ2BYpbu02wXl1yrgFTIEju5mQmsle7w1VnuD8Dj1V67lIQ1QfN5I
 48JtSMNIe7dXvP0dpfRomToMbuDi+IDLjLvZ3UscgjGgeWh4dpuSDl952WD6dDs/gFZG
 0IwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:message-id:mime-version:subject
 :from:to:cc;
 bh=cS1lb71+JIYOSor7OwJgk2gnjH1VOs8uFvRzBEpw+bQ=;
 b=YmVj2XnWVxeqfJ535KV4yoZjYsBeRyxnQPI3D4Hz/NUqaZfohEO2s2FwmgCQQCcL0X
 vmcEXWNVwIvWhPKHvw8V0SymVHPKRVI2ylAJJSjbyvMUrVpVl1g1H77E/v+gbovnoOMD
 Rm41s/ePxkTNStle7eP96WK+byDxrn8oWNflLFGEd9ixbgtTlJCrN9QEJGeGvF7i+wes
 MLRtSp36cdVcFXbJ2YUem1DEjeqW7eO6fsLm3FdQrKxJxEn+tGLOLRQTcOUyFq7dIkBi
 sDWJB8/iUEj2JMqRIXXqpEdKDy5HUjrmXAnPaPiakkRvYdls8Wn4lAMJjqbDIUpcCDQn
 ZmXQ==
X-Gm-Message-State: AOAM532/+GDlzXG89wDMLT4hgtdb2CRer9GES2pNwMEgQw5z0XTUg0kW
 8+d/1bbI08Ay14Vs+XFZqkBuXzRoicU=
X-Google-Smtp-Source: ABdhPJzl93S733o8ZxchIrko0AydsKa+w/gF7Yyof3UCHWikEoxKTRDZmabSLPZBYZUolde90hyK7YjFH8Q=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a05:6902:114a:: with SMTP id
 p10mr7381719ybu.91.1633745561743; Fri, 08 Oct 2021 19:12:41 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:11:53 -0700
Message-Id: <20211009021236.4122790-1-seanjc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 00/43] KVM: Halt-polling and x86 APICv overhaul
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, 
 Anup Patel <anup.patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Atish Patra <atish.patra@wdc.com>, 
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Sean Christopherson <seanjc@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
 linux-mips@vger.kernel.org, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, 
 Oliver Upton <oupton@google.com>, Jing Zhang <jingzhangos@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_191243_783191_E6209D60 
X-CRM114-Status: GOOD (  13.66  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This is basically two series smushed into one.  The first "half" aims
to differentiate between "halt" and a more generic "block", where "halt"
aligns with x86's HLT instruction, the halt-polling mechanisms, and
associated stats, and "block" means any guest action that causes the vCPU
to block/wait.

The second "half" overhauls x86's APIC virtualization code (Posted
Interrupts on Intel VMX, AVIC on AMD SVM) to do their updates in response
to vCPU (un)blocking in the vcpu_load/put() paths, keying off of the
vCPU's rcuwait status to determine when a blocking vCPU is being put and
reloaded.  This idea comes from arm64's kvm_timer_vcpu_put(), which I
stumbled across when diving into the history of arm64's (un)blocking hooks.

The x86 APICv overhaul allows for killing off several sets of hooks in
common KVM and in x86 KVM (to the vendor code).  Moving everything to
vcpu_put/load() also realizes nice cleanups, especially for the Posted
Interrupt code, which required some impressive mental gymnastics to
understand how vCPU task migration interacted with vCPU blocking.

Non-x86 folks, sorry for the noise.  I'm hoping the common parts can get
applied without much fuss so that future versions can be x86-only.

v2:
 - Collect reviews. [Christian, David]
 - Add patch to move arm64 WFI functionality out of hooks. [Marc]
 - Add RISC-V to the fun.
 - Add all the APICv fun.

v1: https://lkml.kernel.org/r/20210925005528.1145584-1-seanjc@google.com

Jing Zhang (1):
  KVM: stats: Add stat to detect if vcpu is currently blocking

Sean Christopherson (42):
  KVM: VMX: Don't unblock vCPU w/ Posted IRQ if IRQs are disabled in
    guest
  KVM: SVM: Ensure target pCPU is read once when signalling AVIC
    doorbell
  KVM: s390: Ensure kvm_arch_no_poll() is read once when blocking vCPU
  KVM: Force PPC to define its own rcuwait object
  KVM: Update halt-polling stats if and only if halt-polling was
    attempted
  KVM: Refactor and document halt-polling stats update helper
  KVM: Reconcile discrepancies in halt-polling stats
  KVM: s390: Clear valid_wakeup in kvm_s390_handle_wait(), not in arch
    hook
  KVM: Drop obsolete kvm_arch_vcpu_block_finish()
  KVM: arm64: Move vGIC v4 handling for WFI out arch callback hook
  KVM: Don't block+unblock when halt-polling is successful
  KVM: x86: Tweak halt emulation helper names to free up kvm_vcpu_halt()
  KVM: Rename kvm_vcpu_block() => kvm_vcpu_halt()
  KVM: Split out a kvm_vcpu_block() helper from kvm_vcpu_halt()
  KVM: Don't redo ktime_get() when calculating halt-polling
    stop/deadline
  KVM: x86: Directly block (instead of "halting") UNINITIALIZED vCPUs
  KVM: x86: Invoke kvm_vcpu_block() directly for non-HALTED wait states
  KVM: Add helpers to wake/query blocking vCPU
  KVM: VMX: Skip Posted Interrupt updates if APICv is hard disabled
  KVM: VMX: Clean up PI pre/post-block WARNs
  KVM: VMX: Drop unnecessary PI logic to handle impossible conditions
  KVM: VMX: Use boolean returns for Posted Interrupt "test" helpers
  KVM: VMX: Drop pointless PI.NDST update when blocking
  KVM: VMX: Save/restore IRQs (instead of CLI/STI) during PI pre/post
    block
  KVM: VMX: Read Posted Interrupt "control" exactly once per loop
    iteration
  KVM: VMX: Move Posted Interrupt ndst computation out of write loop
  KVM: VMX: Remove vCPU from PI wakeup list before updating PID.NV
  KVM: VMX: Handle PI wakeup shenanigans during vcpu_put/load
  KVM: Drop unused kvm_vcpu.pre_pcpu field
  KVM: Move x86 VMX's posted interrupt list_head to vcpu_vmx
  KVM: VMX: Move preemption timer <=> hrtimer dance to common x86
  KVM: x86: Unexport LAPIC's switch_to_{hv,sw}_timer() helpers
  KVM: x86: Remove defunct pre_block/post_block kvm_x86_ops hooks
  KVM: SVM: Signal AVIC doorbell iff vCPU is in guest mode
  KVM: SVM: Don't bother checking for "running" AVIC when kicking for
    IPIs
  KVM: SVM: Unconditionally mark AVIC as running on vCPU load (with
    APICv)
  KVM: Drop defunct kvm_arch_vcpu_(un)blocking() hooks
  KVM: VMX: Don't do full kick when triggering posted interrupt "fails"
  KVM: VMX: Wake vCPU when delivering posted IRQ even if vCPU == this
    vCPU
  KVM: VMX: Pass desired vector instead of bool for triggering posted
    IRQ
  KVM: VMX: Fold fallback path into triggering posted IRQ helper
  KVM: VMX: Don't do full kick when handling posted interrupt wakeup

 arch/arm64/include/asm/kvm_emulate.h |   2 +
 arch/arm64/include/asm/kvm_host.h    |   1 -
 arch/arm64/kvm/arch_timer.c          |   5 +-
 arch/arm64/kvm/arm.c                 |  60 +++---
 arch/arm64/kvm/handle_exit.c         |   5 +-
 arch/arm64/kvm/psci.c                |   2 +-
 arch/mips/include/asm/kvm_host.h     |   3 -
 arch/mips/kvm/emulate.c              |   2 +-
 arch/powerpc/include/asm/kvm_host.h  |   4 +-
 arch/powerpc/kvm/book3s_pr.c         |   2 +-
 arch/powerpc/kvm/book3s_pr_papr.c    |   2 +-
 arch/powerpc/kvm/booke.c             |   2 +-
 arch/powerpc/kvm/powerpc.c           |   5 +-
 arch/riscv/include/asm/kvm_host.h    |   1 -
 arch/riscv/kvm/vcpu_exit.c           |   2 +-
 arch/s390/include/asm/kvm_host.h     |   4 -
 arch/s390/kvm/interrupt.c            |   3 +-
 arch/s390/kvm/kvm-s390.c             |   7 +-
 arch/x86/include/asm/kvm-x86-ops.h   |   4 -
 arch/x86/include/asm/kvm_host.h      |  29 +--
 arch/x86/kvm/lapic.c                 |   4 +-
 arch/x86/kvm/svm/avic.c              |  95 ++++-----
 arch/x86/kvm/svm/svm.c               |   8 -
 arch/x86/kvm/svm/svm.h               |  14 --
 arch/x86/kvm/vmx/nested.c            |   2 +-
 arch/x86/kvm/vmx/posted_intr.c       | 279 ++++++++++++---------------
 arch/x86/kvm/vmx/posted_intr.h       |  14 +-
 arch/x86/kvm/vmx/vmx.c               |  63 +++---
 arch/x86/kvm/vmx/vmx.h               |   3 +
 arch/x86/kvm/x86.c                   |  55 ++++--
 include/linux/kvm_host.h             |  27 ++-
 include/linux/kvm_types.h            |   1 +
 virt/kvm/async_pf.c                  |   2 +-
 virt/kvm/kvm_main.c                  | 138 +++++++------
 34 files changed, 413 insertions(+), 437 deletions(-)

-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
