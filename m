Return-Path: <SRS0=hxmM=NT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1FD1C43216
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Aug 2021 00:37:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B380A61073
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Aug 2021 00:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B380A61073
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:
	Mime-Version:Message-Id:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=dgQe80GVEIFWp1S1aTQN5Ufqg1jMvgsjzgl9i2hDOkk=; b=gCb
	+0e0QPytuq/1WOoWBRHORr3UGgTZBYPp/6dCRjYYu5WRy2QIXDfbNK20GUR9snG5r2ICcDESIzoBm
	5VVI3f/VMAnQ9fQ3V3zxrztJG5nLwFPUiQwimBL9WusCJP843MzdYyFwS760NVj9AILkO+jeoovzm
	kkqZ6MJjqfVsZip+5guVGpHRBU348VahUbxO6oHceZz1mAZwoHlmdJy0UpXAON6rsGOzZULI18+Xx
	wNsR6/seZH3j0mD7P0UTLTeOwOkHMAgUuPfC9W6j1s4lVMvOxGKn867ZQ8nxgJR8vGZqLx6ncDLUH
	t9t/9D65sGx+HeD8YxQlbU+JhL+cRHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJmKn-00DQzt-F7; Sat, 28 Aug 2021 00:36:33 +0000
Received: from mail-qv1-xf4a.google.com ([2607:f8b0:4864:20::f4a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJmKj-00DQwy-Tf
 for linux-riscv@lists.infradead.org; Sat, 28 Aug 2021 00:36:31 +0000
Received: by mail-qv1-xf4a.google.com with SMTP id
 q2-20020ad45ca2000000b00374fa0dbedfso4469407qvh.1
 for <linux-riscv@lists.infradead.org>; Fri, 27 Aug 2021 17:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=reply-to:date:message-id:mime-version:subject:from:to:cc;
 bh=xh3b83AHgc+X5acCCZf2iVRK+ee8SLHX2uHx4t+xrBY=;
 b=FsrBDBj81I24PUYsfqY9aNe2Br6Cge4C10V9fErKyzcL9jN9JzP/kqqqUHGaBFgQcQ
 0U9g5lP31TKw2LT3YjTlFAgoG4AS3SMwwYaB+iZ9VL+rH1PuDacZvkVF5TZDPvt+SCVp
 hoVnB9YrhsLy30buyfkioR3VRr/U9QgKrM+qQnkI0aZ8yrDkdgGSixnrY69JIAMGRumH
 CIa10muamcOBBpjShGeSCvzY0V1rXxFeRJk/BexUgt5cyg06R0PXRjlCeTWZrE9Yduwb
 tvUde2o7UVIgOctvxLjj8VW7xpdvOez/m4ccG77zN+autZ2tCUck8ZbNdlcpaKwRcScv
 Xlrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:date:message-id:mime-version:subject
 :from:to:cc;
 bh=xh3b83AHgc+X5acCCZf2iVRK+ee8SLHX2uHx4t+xrBY=;
 b=QwzRZbifWBUodVTBBKPCv2GLe99q87hA4gAat9Ov0cM7dCuZUHqgdwEGKQsMTBA9+C
 8QMUzdHbQO0zjOa8PSJBr2aAbdPRptagNH7ujYPm/pVfB335JO97jai5X1Pw3Dnv0hmZ
 XMy/PJcmD2OWBp3Ccv+Jzj6LPPTAaUR9Suf+pAysq0fwXgYNP4GUwdwVzu8rWs+mzrZR
 zoGRMEI02EM1oA2nE2FSLRrMhprHH4qN+Z8zppo3h3S3zwaBIqxjqsgidTgnF2ItDM9a
 GrT/excY+a9GcnotwEa2xMVoUAu0UC8RlLO7K2kNkqifDqIdAYa0/tQqtEJha99STaEI
 w2lw==
X-Gm-Message-State: AOAM531ROnjWg9U7H+n9aouL6A4AcyFdeLy7PQ4P3oUVyxSHUN9eeaTs
 AQaKdvSmcT2PnYArDpSXj2mMuVI0vuo=
X-Google-Smtp-Source: ABdhPJzkOydjwKSx1IUjIGSvBy+QMF11RiN4xe9UgjoUhzwRgFrcyVUOeAZyVTnBYwiNIqVlWoCONvUze1Q=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:f66c:b851:7e79:7ed4])
 (user=seanjc job=sendgmr) by 2002:a05:6214:10c4:: with SMTP id
 r4mr12642407qvs.58.1630110985252; Fri, 27 Aug 2021 17:36:25 -0700 (PDT)
Date: Fri, 27 Aug 2021 17:35:45 -0700
Message-Id: <20210828003558.713983-1-seanjc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
Subject: [PATCH v2 00/13] perf: KVM: Fix, optimize, and clean up callbacks
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Guo Ren <guoren@kernel.org>, 
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>, 
 Vincent Chen <deanbo422@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
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
 Like Xu <like.xu.linux@gmail.com>, Zhu Lingshan <lingshan.zhu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_173630_007745_20727C69 
X-CRM114-Status: GOOD (  16.10  )
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

Patch 1 fixes a mostly-theoretical bug where perf can deref a NULL
pointer if KVM unregisters its callbacks while they're being accessed.
In practice, compilers tend to avoid problematic reloads of the pointer
and the PMI handler doesn't lose the race against module unloading,
i.e doesn't hit a use-after-free.

Patches 2 and 3 fix an Intel PT handling bug where KVM incorrectly
eats PT interrupts when PT is supposed to be owned entirely by the host.

Patches 4-7 clean up perf's callback infrastructure and switch to
static_call for arm64 and x86 (the only survivors).

Patches 8-13 clean up related KVM code and unify the arm64/x86 callbacks.

Based on "git://git.kernel.org/pub/scm/virt/kvm/kvm.git queue", commit
680c7e3be6a3 ("KVM: x86: Exit to userspace ...").

v2 (relatively to static_call v10)
  - Split the patch into the semantic change (multiplexed ->state) and
    introduction of static_call.
  - Don't use '0' for "not a guest RIP".
  - Handle unregister path.
  - Drop changes for architectures that can be culled entirely.

v2 (relative to v1)
  - Drop per-cpu approach. [Peter]
  - Fix mostly-theoretical reload and use-after-free with READ_ONCE(),
    WRITE_ONCE(), and synchronize_rcu(). [Peter]
  - Avoid new exports like the plague. [Peter]

v1:
  - https://lkml.kernel.org/r/20210827005718.585190-1-seanjc@google.com

v10 static_call:
  - https://lkml.kernel.org/r/20210806133802.3528-2-lingshan.zhu@intel.com

Like Xu (2):
  perf/core: Rework guest callbacks to prepare for static_call support
  perf/core: Use static_call to optimize perf_guest_info_callbacks

Sean Christopherson (11):
  perf: Ensure perf_guest_cbs aren't reloaded between !NULL check and
    deref
  KVM: x86: Register perf callbacks after calling vendor's
    hardware_setup()
  KVM: x86: Register Processor Trace interrupt hook iff PT enabled in
    guest
  perf: Stop pretending that perf can handle multiple guest callbacks
  perf: Force architectures to opt-in to guest callbacks
  KVM: x86: Drop current_vcpu for kvm_running_vcpu + kvm_arch_vcpu
    variable
  KVM: x86: More precisely identify NMI from guest when handling PMI
  KVM: Move x86's perf guest info callbacks to generic KVM
  KVM: x86: Move Intel Processor Trace interrupt handler to vmx.c
  KVM: arm64: Convert to the generic perf callbacks
  KVM: arm64: Drop perf.c and fold its tiny bits of code into arm.c /
    pmu.c

 arch/arm/kernel/perf_callchain.c   | 28 ++------------
 arch/arm64/Kconfig                 |  1 +
 arch/arm64/include/asm/kvm_host.h  | 13 ++++++-
 arch/arm64/kernel/perf_callchain.c | 28 +++++++++++---
 arch/arm64/kvm/Makefile            |  2 +-
 arch/arm64/kvm/arm.c               | 11 +++++-
 arch/arm64/kvm/perf.c              | 62 ------------------------------
 arch/arm64/kvm/pmu.c               |  8 ++++
 arch/csky/kernel/perf_callchain.c  | 10 -----
 arch/nds32/kernel/perf_event_cpu.c | 29 ++------------
 arch/riscv/kernel/perf_callchain.c | 10 -----
 arch/x86/Kconfig                   |  1 +
 arch/x86/events/core.c             | 36 ++++++++++++++---
 arch/x86/events/intel/core.c       |  7 ++--
 arch/x86/include/asm/kvm_host.h    |  8 +++-
 arch/x86/kvm/pmu.c                 |  2 +-
 arch/x86/kvm/svm/svm.c             |  2 +-
 arch/x86/kvm/vmx/vmx.c             | 25 +++++++++++-
 arch/x86/kvm/x86.c                 | 58 +++++-----------------------
 arch/x86/kvm/x86.h                 | 17 ++++++--
 arch/x86/xen/pmu.c                 | 32 +++++++--------
 include/kvm/arm_pmu.h              |  1 +
 include/linux/kvm_host.h           | 10 +++++
 include/linux/perf_event.h         | 26 ++++++++-----
 init/Kconfig                       |  3 ++
 kernel/events/core.c               | 24 ++++++------
 virt/kvm/kvm_main.c                | 40 +++++++++++++++++++
 27 files changed, 245 insertions(+), 249 deletions(-)
 delete mode 100644 arch/arm64/kvm/perf.c

-- 
2.33.0.259.gc128427fd7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
