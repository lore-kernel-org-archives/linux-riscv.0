Return-Path: <SRS0=rXXN=NS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01EEBC4320E
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 00:57:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8D5D61029
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 00:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B8D5D61029
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:
	Mime-Version:Message-Id:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=h3L56vAigwunqsZ1oizo0LOacXlUwjsbsXU7lvgqt5A=; b=Fnd
	VcmTnOaG/snWQ3ynn8xaLFh7pDgugkrXeo74ddF0OX1ZwfB9185KrPxUKevxUjTSTiqKL5ApMZ0J4
	SFxIDQaI8yFLCNPVMRaiQ6gRCrxYI/vC/CVX0SlKR5/R0WMvbP0IKr+F1bCr01lYYP02OUNWNeg+2
	66kWzMtDLI9oY9v6JEGH0ExBUEllK7DRD9A1L7vtA+fmkVBlhhPpetp6aMrETCLOQbW4qXPZH6g5d
	Wb98xntnuDYmqlSgQaSfHrgFfuUeo+qB1qiIrEn6bJiznsAEl7cTpdviJOqWbJ+XKQwRocrMVytlK
	GPl2f+gGAOM7rXVPVtDkGM66rBO/CGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJQBa-00BApA-AJ; Fri, 27 Aug 2021 00:57:34 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJQBX-00BAnY-FT
 for linux-riscv@lists.infradead.org; Fri, 27 Aug 2021 00:57:33 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id
 15-20020a250b0f000000b0059bcca6ad6fso2573651ybl.21
 for <linux-riscv@lists.infradead.org>; Thu, 26 Aug 2021 17:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=reply-to:date:message-id:mime-version:subject:from:to:cc;
 bh=pdAXhHtRt+WRQLNkVTKYCLh0PcmkBEMxKTEjaECJXEE=;
 b=pE0mDgLPs8yki5IuCsFxvQe1gsBHydhzDBAYxi7pJLeHliAihZ/Pwk/+iSWZFPMYb7
 nd5wHjsQOvo1WkAtZ+9JJrdP32uDOuRGZQSSHsBBYlCOFlELQsp6Y6bayw0IGkkaYrUP
 kzDmY+Z9kb4aYjXPEPVy+jOyXI7f6Dx9dR0sPaesQeOveElI9QnlKJO/pFxdgo8Xz9T0
 RQOuQaqnFmIlVgKPsyHoJ4KTZf+IKGVJp+E+voVuWVkH697tIjBXChGpAzprLa8mALCj
 X1IMo88q5TLCwd0JLgo5VYcuufMpEtAPaYFCA8RlSbm1jH1vZIX3PAhTSB7XZJhoVCBr
 PkRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:date:message-id:mime-version:subject
 :from:to:cc;
 bh=pdAXhHtRt+WRQLNkVTKYCLh0PcmkBEMxKTEjaECJXEE=;
 b=RtDIWnNxcFcDISf3TB2UswKEzhMLe0O8CDRClMuVy6E7HmV+q07hYpq11ZhyADCy2l
 dcE6fR9v/BiwiOFLp2op4BVPS5UTSdVeu1x7zfhKjMR8+hwvAsPAzxAMJcKBc+yuvfgl
 +nCVVLiDsl8/fqrDPG08uMpptN2lsZ1fUQP9WOewSls17c2egY1+60I4aXhSdUTQ9Jr4
 5x3lQMLuANKA0MDPpBJaDumLU5qguc3QG13SCiQfLXmPyzbyk4+zKaoR2okGRtu9E49F
 RYcP0V6yt5sqo5bbakB0U2Wvg8zu+hNQgNuq95fWGAEy/LXq2dEsz2E7PpJUZNcg0Xrv
 Aiew==
X-Gm-Message-State: AOAM533br6TQ/i/eJAKGoZ5rCR6PZAj6mHn2isVUL7iFqbpcrjP8R1Cp
 adCFWRefhOCu5JN93OF4OLOXRTKxK6o=
X-Google-Smtp-Source: ABdhPJzVYXytuqf9A5ptHfXceux4csoEB+K5zM4u/0R22zKT7I6HN+L+rw+ywcwa0LGPxcazSYQrRmN0u2I=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:c16c:db05:96b2:1475])
 (user=seanjc job=sendgmr) by 2002:a25:b782:: with SMTP id
 n2mr1982955ybh.159.1630025849601; 
 Thu, 26 Aug 2021 17:57:29 -0700 (PDT)
Date: Thu, 26 Aug 2021 17:57:03 -0700
Message-Id: <20210827005718.585190-1-seanjc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
Subject: [PATCH 00/15] perf: KVM: Fix, optimize, and clean up callbacks
From: Sean Christopherson <seanjc@google.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Nick Hu <nickhu@andestech.com>, 
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
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
X-CRM114-CacheID: sfid-20210826_175731_548221_CD230B0A 
X-CRM114-Status: GOOD (  23.25  )
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

This started out as a small series[1] to fix a KVM bug related to Intel PT
interrupt handling and snowballed horribly.

The main problem being addressed is that the perf_guest_cbs are shared by
all CPUs, can be nullified by KVM during module unload, and are not
protected against concurrent access from NMI context.

The bug has escaped notice because all dereferences of perf_guest_cbs
follow the same "perf_guest_cbs && perf_guest_cbs->is_in_guest()" pattern,
and AFAICT the compiler never reloads perf_guest_cbs in this sequence.
The compiler does reload perf_guest_cbs for any future dereferences, but
the ->is_in_guest() guard all but guarantees the PMI handler will win the
race, e.g. to nullify perf_guest_cbs, KVM has to completely exit the guest
and teardown down all VMs before it can be unloaded.

But with help, e.g. READ_ONCE(perf_guest_cbs), unloading kvm_intel can
trigger a NULL pointer derference (see below).  Manual intervention aside,
the bug is a bit of a time bomb, e.g. my patch 3 from the original PT
handling series would have omitted the ->is_in_guest() guard.

This series fixes the problem by making the callbacks per-CPU, and
registering/unregistering the callbacks only with preemption disabled
(except for the Xen case, which doesn't unregister).

This approach also allows for several nice cleanups in this series.
KVM x86 and arm64 can share callbacks, KVM x86 drops its somewhat
redundant current_vcpu, and the retpoline that is currently hit when KVM
is loaded (due to always checking ->is_in_guest()) goes away (it's still
there when running as Xen Dom0).

Changing to per-CPU callbacks also provides a good excuse to excise
copy+paste code from architectures that can't possibly have guest
callbacks.

This series conflicts horribly with a proposed patch[2] to use static
calls for perf_guest_cbs.  But that patch is broken as it completely
fails to handle unregister, and it's not clear to me whether or not
it can correctly handle unregister without fixing the underlying race
(I don't know enough about the code patching for static calls).

This tweak

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 1eb45139fcc6..202e5ad97f82 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -2954,7 +2954,7 @@ unsigned long perf_misc_flags(struct pt_regs *regs)
 {
        int misc = 0;

-       if (perf_guest_cbs && perf_guest_cbs->is_in_guest()) {
+       if (READ_ONCE(perf_guest_cbs) && READ_ONCE(perf_guest_cbs)->is_in_guest()) {
                if (perf_guest_cbs->is_user_mode())
                        misc |= PERF_RECORD_MISC_GUEST_USER;
                else

while spamming module load/unload leads to:

  BUG: kernel NULL pointer dereference, address: 0000000000000000
  #PF: supervisor read access in kernel mode
  #PF: error_code(0x0000) - not-present page
  PGD 0 P4D 0
  Oops: 0000 [#1] PREEMPT SMP
  CPU: 6 PID: 1825 Comm: stress Not tainted 5.14.0-rc2+ #459
  Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 0.0.0 02/06/2015
  RIP: 0010:perf_misc_flags+0x1c/0x70
  Call Trace:
   perf_prepare_sample+0x53/0x6b0
   perf_event_output_forward+0x67/0x160
   __perf_event_overflow+0x52/0xf0
   handle_pmi_common+0x207/0x300
   intel_pmu_handle_irq+0xcf/0x410
   perf_event_nmi_handler+0x28/0x50
   nmi_handle+0xc7/0x260
   default_do_nmi+0x6b/0x170
   exc_nmi+0x103/0x130
   asm_exc_nmi+0x76/0xbf

[1] https://lkml.kernel.org/r/20210823193709.55886-1-seanjc@google.com
[2] https://lkml.kernel.org/r/20210806133802.3528-2-lingshan.zhu@intel.com

Sean Christopherson (15):
  KVM: x86: Register perf callbacks after calling vendor's
    hardware_setup()
  KVM: x86: Register Processor Trace interrupt hook iff PT enabled in
    guest
  perf: Stop pretending that perf can handle multiple guest callbacks
  perf: Force architectures to opt-in to guest callbacks
  perf: Track guest callbacks on a per-CPU basis
  KVM: x86: Register perf callbacks only when actively handling
    interrupt
  KVM: Use dedicated flag to track if KVM is handling an NMI from guest
  KVM: x86: Drop current_vcpu in favor of kvm_running_vcpu
  KVM: arm64: Register/unregister perf callbacks at vcpu load/put
  KVM: Move x86's perf guest info callbacks to generic KVM
  KVM: x86: Move Intel Processor Trace interrupt handler to vmx.c
  KVM: arm64: Convert to the generic perf callbacks
  KVM: arm64: Drop perf.c and fold its tiny bit of code into pmu.c
  perf: Disallow bulk unregistering of guest callbacks and do cleanup
  perf: KVM: Indicate "in guest" via NULL ->is_in_guest callback

 arch/arm/kernel/perf_callchain.c   | 28 ++------------
 arch/arm64/Kconfig                 |  1 +
 arch/arm64/include/asm/kvm_host.h  |  8 +++-
 arch/arm64/kernel/perf_callchain.c | 18 ++++++---
 arch/arm64/kvm/Makefile            |  2 +-
 arch/arm64/kvm/arm.c               | 13 ++++++-
 arch/arm64/kvm/perf.c              | 62 ------------------------------
 arch/arm64/kvm/pmu.c               |  8 ++++
 arch/csky/kernel/perf_callchain.c  | 10 -----
 arch/nds32/kernel/perf_event_cpu.c | 29 ++------------
 arch/riscv/kernel/perf_callchain.c | 10 -----
 arch/x86/Kconfig                   |  1 +
 arch/x86/events/core.c             | 17 +++++---
 arch/x86/events/intel/core.c       |  7 ++--
 arch/x86/include/asm/kvm_host.h    |  4 +-
 arch/x86/kvm/pmu.c                 |  2 +-
 arch/x86/kvm/pmu.h                 |  1 +
 arch/x86/kvm/svm/svm.c             |  2 +-
 arch/x86/kvm/vmx/vmx.c             | 25 ++++++++++--
 arch/x86/kvm/x86.c                 | 54 +++-----------------------
 arch/x86/kvm/x86.h                 | 12 +++---
 arch/x86/xen/pmu.c                 |  2 +-
 include/kvm/arm_pmu.h              |  1 +
 include/linux/kvm_host.h           | 12 ++++++
 include/linux/perf_event.h         | 33 ++++++++++++----
 init/Kconfig                       |  3 ++
 kernel/events/core.c               | 28 ++++++++------
 virt/kvm/kvm_main.c                | 42 ++++++++++++++++++++
 28 files changed, 204 insertions(+), 231 deletions(-)
 delete mode 100644 arch/arm64/kvm/perf.c

-- 
2.33.0.259.gc128427fd7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
