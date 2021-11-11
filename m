Return-Path: <SRS0=2pxE=P6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36CC8C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Nov 2021 02:08:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC13161073
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Nov 2021 02:08:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC13161073
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:
	Mime-Version:Message-Id:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=CCveXv+0S/nmRd5tHL2UFLj7oASccEDNXdJiAnyljjg=; b=xkm
	M4DVQwk/XbKwjcnLSJQpt4rZjrsNEkX4Z3+/FIysaLXn4zqW/5pHikclyF2pYvFhOn27EjHQ+K/mI
	lXm1MpqiuFKlRoEoV1+PZeXGU6mJsZ+2H9BY33oox+REpEar8FQnP/aG/+p+gWSkMekW1I7GwbbSg
	JPBGm5sbDmfrw3Armmm3LqarXPTyme1dw/BMeKb7x+xh3Ko8E7j/yK75/i/5IRnUcJECo70d5PDLl
	+DfLHuJs4tfjmyAULhrf54E2XYa+QwX89v9Q5vLtLBMHCFAogkBHRldLdKK06GpEkVvZE5wGNnlej
	ekZ1c/nkfDjn1k/s2XTMfCF502sm6Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkzVW-006kfa-My; Thu, 11 Nov 2021 02:08:06 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkzV9-006kLp-6d
 for linux-riscv@lists.infradead.org; Thu, 11 Nov 2021 02:07:45 +0000
Received: by mail-pg1-x549.google.com with SMTP id
 j18-20020a63fc12000000b002dd2237eb1cso2507740pgi.5
 for <linux-riscv@lists.infradead.org>; Wed, 10 Nov 2021 18:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:message-id:mime-version:subject:from:to:cc;
 bh=tUIQRP/L4Fp0gX6OhmNi7HbxcL+5uZ5JBj+c5s8Epc0=;
 b=SHNbfqTm3J0sCYDnSCPJl2DJ6T9yOTXJQHvuHx8d04TG6gGxpzfaf/C1v4gFFxrBPV
 Nqw7AUHS01qZz0UD93QTZiHv9vFDhe2GdeiYEKJ4f9tX2pvUysavfJFD5gQ4gNAG6pKe
 lJuw7Z3tdfLgDKejGON+MO9SGmEzmVIPRzmdTSDCNpCRdZIISx15JlmN7eHU6e0hABbO
 ggSU2q0H1akcoFCvWhLk23HEYoCc8zZRMmEW+nbv3sbHxH0cDekH6WrEbtb1X+tgaA6k
 FbiWW2J5zLyfWA9uMi2CyYilMp6JqRACLddKb1B7Cqi9I+sv88k2AOHAQxuAqltrxkop
 Ei4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:message-id:mime-version:subject
 :from:to:cc;
 bh=tUIQRP/L4Fp0gX6OhmNi7HbxcL+5uZ5JBj+c5s8Epc0=;
 b=6/ChesKiolyrnAoiq69GNGfogni63aPYGSWYCaeLN7yH8+C1lfveKwt35Huv4FmHms
 jmyftGhNaA3EQSlPoeiLz2v2NmMTQMj0MQdV4pC91ohFEiPPfwsGnYgobLlFLWp+noF7
 bTB8vZ7/jzsQbjvB6Io1jPY5vNl6OQNVFCULqK4b41LAVDpmltAWENsgVWC0ZmDMUI7p
 hRpSO3oyQPJ78LH21Jt3b+TGLYKw+vPUGOotnjxCsgWjGJTI55VGHNXxBkxxT04G8Bdw
 WzHdO+XWN6KTTWt5dsMevxYXMxH9OGR2AWrg98PQIq/wFIZmLA5fwW4HkOyLZsAWSgW2
 FBXg==
X-Gm-Message-State: AOAM533DpKp1KuHFiSk3yYJpOx6ejwx/EqoQ0HJgG0rh1AWTXR3sx2ip
 i1kP72yrZtZn+YZtLMbl+/LYuA3mATA=
X-Google-Smtp-Source: ABdhPJyLbpoo29ePfTjvBFgohxjl3NBLChAqmG4K4wYBtXh/2rWx5xqvq1BN1sRzHdfKDemaaNnkz7tBMNU=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:903:2004:b0:142:6344:2c08
 with SMTP id
 s4-20020a170903200400b0014263442c08mr3739627pla.51.1636596461111; Wed, 10 Nov
 2021 18:07:41 -0800 (PST)
Date: Thu, 11 Nov 2021 02:07:21 +0000
Message-Id: <20211111020738.2512932-1-seanjc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
Subject: [PATCH v4 00/17] perf: KVM: Fix, optimize, and clean up callbacks
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, 
 Russell King <linux@armlinux.org.uk>, Marc Zyngier <maz@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>, 
 Vincent Chen <deanbo422@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
 Juergen Gross <jgross@suse.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, 
 Namhyung Kim <namhyung@kernel.org>, James Morse <james.morse@arm.com>, 
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 "H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.cs.columbia.edu, linux-csky@vger.kernel.org, 
 linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Artem Kashkanov <artem.kashkanov@intel.com>, 
 Like Xu <like.xu.linux@gmail.com>, Like Xu <like.xu@linux.intel.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_180743_257053_83552E19 
X-CRM114-Status: GOOD (  19.28  )
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

This is a combination of ~2 series to fix bugs in the perf+KVM callbacks,
optimize the callbacks by employing static_call, and do a variety of
cleanup in both perf and KVM.

For the non-perf patches, I think everything except patch 13 (Paolo) and
patches 15 and 16 (Marc) has the appropriate acks.

Patch 1 fixes a set of mostly-theoretical bugs by protecting the guest
callbacks pointer with RCU.

Patches 2 and 3 fix an Intel PT handling bug where KVM incorrectly
eats PT interrupts when PT is supposed to be owned entirely by the host.

Patches 4-9 clean up perf's callback infrastructure and switch to
static_call for arm64 and x86 (the only survivors).

Patches 10-17 clean up related KVM code and unify the arm64/x86 callbacks.

Based on Linus' tree, commit cb690f5238d7 ("Merge tag 'for-5.16/drivers...).

v4:
  - Rebase.
  - Collect acks and reviews.
  - Fully protect perf_guest_cbs with RCU. [Paolo].
  - Add patch to hide arm64's kvm_arm_pmu_available behind
    CONFIG_HW_PERF_EVENTS=y.

v3:
  - https://lore.kernel.org/all/20210922000533.713300-1-seanjc@google.com/
  - Add wrappers for guest callbacks to that stubs can be provided when
    GUEST_PERF_EVENTS=n.
  - s/HAVE_GUEST_PERF_EVENTS/GUEST_PERF_EVENTS and select it from KVM
    and XEN_PV instead of from top-level arm64/x86. [Paolo]
  - Drop an unnecessary synchronize_rcu() when registering callbacks. [Peter]
  - Retain a WARN_ON_ONCE() when unregistering callbacks if the caller
    didn't provide the correct pointer. [Peter]
  - Rework the static_call patch to move it all to common perf.
  - Add a patch to drop the (un)register stubs, made possible after
    having KVM+XEN_PV select GUEST_PERF_EVENTS.
  - Split dropping guest callback "support" for arm, csky, etc... to a
    separate patch, to make introducing GUEST_PERF_EVENTS cleaner.
  
v2 (relative to static_call v10):
  - Split the patch into the semantic change (multiplexed ->state) and
    introduction of static_call.
  - Don't use '0' for "not a guest RIP".
  - Handle unregister path.
  - Drop changes for architectures that can be culled entirely.

v2 (relative to v1):
  - https://lkml.kernel.org/r/20210828003558.713983-6-seanjc@google.com
  - Drop per-cpu approach. [Peter]
  - Fix mostly-theoretical reload and use-after-free with READ_ONCE(),
    WRITE_ONCE(), and synchronize_rcu(). [Peter]
  - Avoid new exports like the plague. [Peter]

v1:
  - https://lkml.kernel.org/r/20210827005718.585190-1-seanjc@google.com

v10 static_call:
  - https://lkml.kernel.org/r/20210806133802.3528-2-lingshan.zhu@intel.com

Like Xu (1):
  perf/core: Rework guest callbacks to prepare for static_call support

Sean Christopherson (16):
  perf: Protect perf_guest_cbs with RCU
  KVM: x86: Register perf callbacks after calling vendor's
    hardware_setup()
  KVM: x86: Register Processor Trace interrupt hook iff PT enabled in
    guest
  perf: Stop pretending that perf can handle multiple guest callbacks
  perf: Drop dead and useless guest "support" from arm, csky, nds32 and
    riscv
  perf: Add wrappers for invoking guest callbacks
  perf: Force architectures to opt-in to guest callbacks
  perf/core: Use static_call to optimize perf_guest_info_callbacks
  KVM: x86: Drop current_vcpu for kvm_running_vcpu + kvm_arch_vcpu
    variable
  KVM: x86: More precisely identify NMI from guest when handling PMI
  KVM: Move x86's perf guest info callbacks to generic KVM
  KVM: x86: Move Intel Processor Trace interrupt handler to vmx.c
  KVM: arm64: Convert to the generic perf callbacks
  KVM: arm64: Hide kvm_arm_pmu_available behind CONFIG_HW_PERF_EVENTS=y
  KVM: arm64: Drop perf.c and fold its tiny bits of code into arm.c
  perf: Drop guest callback (un)register stubs

 arch/arm/kernel/perf_callchain.c   | 28 ++------------
 arch/arm64/include/asm/kvm_host.h  | 11 +++++-
 arch/arm64/kernel/image-vars.h     |  2 +
 arch/arm64/kernel/perf_callchain.c | 13 ++++---
 arch/arm64/kvm/Kconfig             |  1 +
 arch/arm64/kvm/Makefile            |  2 +-
 arch/arm64/kvm/arm.c               | 10 ++++-
 arch/arm64/kvm/perf.c              | 59 ------------------------------
 arch/arm64/kvm/pmu-emul.c          |  2 +
 arch/csky/kernel/perf_callchain.c  | 10 -----
 arch/nds32/kernel/perf_event_cpu.c | 29 ++-------------
 arch/riscv/kernel/perf_callchain.c | 10 -----
 arch/x86/events/core.c             | 13 ++++---
 arch/x86/events/intel/core.c       |  5 +--
 arch/x86/include/asm/kvm_host.h    |  7 +++-
 arch/x86/kvm/Kconfig               |  1 +
 arch/x86/kvm/pmu.c                 |  2 +-
 arch/x86/kvm/svm/svm.c             |  2 +-
 arch/x86/kvm/vmx/vmx.c             | 25 ++++++++++++-
 arch/x86/kvm/x86.c                 | 58 +++++------------------------
 arch/x86/kvm/x86.h                 | 17 +++++++--
 arch/x86/xen/Kconfig               |  1 +
 arch/x86/xen/pmu.c                 | 32 +++++++---------
 include/kvm/arm_pmu.h              | 19 ++++++----
 include/linux/kvm_host.h           | 10 +++++
 include/linux/perf_event.h         | 44 ++++++++++++++++------
 init/Kconfig                       |  4 ++
 kernel/events/core.c               | 41 +++++++++++++++------
 virt/kvm/kvm_main.c                | 44 ++++++++++++++++++++++
 29 files changed, 246 insertions(+), 256 deletions(-)
 delete mode 100644 arch/arm64/kvm/perf.c

-- 
2.34.0.rc0.344.g81b53c2807-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
