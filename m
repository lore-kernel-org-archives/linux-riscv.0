Return-Path: <SRS0=rXXN=NS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46160C4320A
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 00:58:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 140AC60FD9
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 00:58:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 140AC60FD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RL4tMb5qrGgO/vS5wuzVJ2anbKoUl5zXVm1HgQtbPIc=; b=sOd1gD7qWA/Y76
	gXmt8v+DuoyVAwwDtRHXXkMp+G365iD+uUCyHASrjocrk1feNGXZk7re0HZ68rMU8Zs29jNfPxnJG
	jVpz4/VH/9kSc9g32CO18+Vuo6J5TDYTjhEuw8xDsF6PHsmJw+Bfmv92G9bjatNDc6VQpSeV8bA1+
	HIoiHCAsQzQW/qIzuh1pySke0iNydHlBR+6xWCJyLfMDUgQnC/X/8/l+R3DxYGoUQGz2Sz3xg+5az
	vEXwOzJDVRZz0k9YR68TQ6u1smJphr4edTZS1jbrIjr8b0zr1GtzNAm/bLVBTY5OTDmxwDDPcJ0lz
	SPL/gOcSAkTEFBYvre3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJQCW-00BBJl-TN; Fri, 27 Aug 2021 00:58:32 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJQBd-00BAqh-NO
 for linux-riscv@lists.infradead.org; Fri, 27 Aug 2021 00:57:41 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 a62-20020a254d410000b0290592f360b0ccso4852484ybb.14
 for <linux-riscv@lists.infradead.org>; Thu, 26 Aug 2021 17:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=eP9YaQYNW7r9kDgd3qsENCfayArScJUKtUCsIWC6thw=;
 b=gOniotWtk3lF6UxW7PdX3cKBegQhQ5iSNPyRKiZnf7i4heaRZqrQ1XCsGWban4SbR3
 zT78dU1sNSEA3eGttRbFIpH02VqDw13xoWcy7Sfk4tIv++vO+etrK6M3ti5f11KLiaWk
 1daQFTv1q/kqM0brBtb0nHD2u0m8MDQpM5+8PsH3w6Z05mKqPfmuHjU7qM9+5Sj+kcBb
 gAYqeA/M/6f3cWOzErOPhZXRkPntcLBBVHGFfK6lCV5FFCTaXib0sUPQGN6FqPZYEFCR
 UHQKuNrOdNIpgxqKsPRBI3amPjQd+V9fPU7ixqHBNtOzNWjW5HvPxd+EPsCi/2nrvxhZ
 DoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=eP9YaQYNW7r9kDgd3qsENCfayArScJUKtUCsIWC6thw=;
 b=FC2RFGS8RYxAWUttg1D/V3VdfyRQKeukjWUE5VGwebqaajru/ZnZkD2OWjTt+dQOcx
 F5a2tk+IfoKRj9JcyxMthI77fIx0i3ay1isIAY1iavT04RZMziaEfc9F+c4qqndY4CH0
 2El3EliSDKnPisAur/laOmVaAchovkBytu/fXRo7SyV0SJ8zbxqpMcMvtWpZnBnB3MoX
 aEK+/AV3F7iZxi3RAq84b1cMckI3yNd9jVP6SGUK9ZDc+q3ELRrpwM5QLEj8j5myERAy
 8Jjs6BV1k1M7g3anfg9qlTUEXRzrFOY8q0aF1uVAqV7XfAk09MZQ4qxdWmvSmV4+4bwp
 DKbA==
X-Gm-Message-State: AOAM531lpEje9Deu7vPQ6L9pqXy0w5f5CMOLBsmCCrUTB7Knff56ODD+
 V9gXm0e60xXOWdTiP+35GLqFst83pmw=
X-Google-Smtp-Source: ABdhPJwZRp53eRz0Z/v+xyvl25SCOdBtWAUo/SC0imtmbIVISGgjbBGEInyTeCMf+kN6ORdJxMuSSuIsoks=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:c16c:db05:96b2:1475])
 (user=seanjc job=sendgmr) by 2002:a25:2785:: with SMTP id
 n127mr1853573ybn.235.1630025856235; 
 Thu, 26 Aug 2021 17:57:36 -0700 (PDT)
Date: Thu, 26 Aug 2021 17:57:06 -0700
In-Reply-To: <20210827005718.585190-1-seanjc@google.com>
Message-Id: <20210827005718.585190-4-seanjc@google.com>
Mime-Version: 1.0
References: <20210827005718.585190-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
Subject: [PATCH 03/15] perf: Stop pretending that perf can handle multiple
 guest callbacks
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
X-CRM114-CacheID: sfid-20210826_175737_853016_70EE6A3A 
X-CRM114-Status: GOOD (  17.28  )
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

Drop the 'int' return value from the perf (un)register callbacks helpers
and stop pretending perf can support multiple callbacks.  The 'int'
returns are not future proofing anything as none of the callers take
action on an error.  It's also not obvious that there will ever be
cotenant hypervisors, and if there are, that allowing multiple callbacks
to be registered is desirable or even correct.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/include/asm/kvm_host.h |  4 ++--
 arch/arm64/kvm/perf.c             |  8 ++++----
 arch/x86/kvm/x86.c                |  2 +-
 include/linux/perf_event.h        | 11 +++++------
 kernel/events/core.c              | 11 ++---------
 5 files changed, 14 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 41911585ae0c..ed940aec89e0 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -670,8 +670,8 @@ unsigned long kvm_mmio_read_buf(const void *buf, unsigned int len);
 int kvm_handle_mmio_return(struct kvm_vcpu *vcpu);
 int io_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa);
 
-int kvm_perf_init(void);
-int kvm_perf_teardown(void);
+void kvm_perf_init(void);
+void kvm_perf_teardown(void);
 
 long kvm_hypercall_pv_features(struct kvm_vcpu *vcpu);
 gpa_t kvm_init_stolen_time(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/kvm/perf.c b/arch/arm64/kvm/perf.c
index 151c31fb9860..039fe59399a2 100644
--- a/arch/arm64/kvm/perf.c
+++ b/arch/arm64/kvm/perf.c
@@ -48,15 +48,15 @@ static struct perf_guest_info_callbacks kvm_guest_cbs = {
 	.get_guest_ip	= kvm_get_guest_ip,
 };
 
-int kvm_perf_init(void)
+void kvm_perf_init(void)
 {
 	if (kvm_pmu_probe_pmuver() != 0xf && !is_protected_kvm_enabled())
 		static_branch_enable(&kvm_arm_pmu_available);
 
-	return perf_register_guest_info_callbacks(&kvm_guest_cbs);
+	perf_register_guest_info_callbacks(&kvm_guest_cbs);
 }
 
-int kvm_perf_teardown(void)
+void kvm_perf_teardown(void)
 {
-	return perf_unregister_guest_info_callbacks(&kvm_guest_cbs);
+	perf_unregister_guest_info_callbacks();
 }
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index ffc6c2d73508..bae951344e28 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -11092,7 +11092,7 @@ int kvm_arch_hardware_setup(void *opaque)
 
 void kvm_arch_hardware_unsetup(void)
 {
-	perf_unregister_guest_info_callbacks(&kvm_guest_cbs);
+	perf_unregister_guest_info_callbacks();
 	kvm_guest_cbs.handle_intel_pt_intr = NULL;
 
 	static_call(kvm_x86_hardware_unsetup)();
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 2d510ad750ed..05c0efba3cd1 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1237,8 +1237,8 @@ extern void perf_event_bpf_event(struct bpf_prog *prog,
 				 u16 flags);
 
 extern struct perf_guest_info_callbacks *perf_guest_cbs;
-extern int perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *callbacks);
-extern int perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *callbacks);
+extern void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *callbacks);
+extern void perf_unregister_guest_info_callbacks(void);
 
 extern void perf_event_exec(void);
 extern void perf_event_comm(struct task_struct *tsk, bool exec);
@@ -1481,10 +1481,9 @@ perf_sw_event(u32 event_id, u64 nr, struct pt_regs *regs, u64 addr)	{ }
 static inline void
 perf_bp_event(struct perf_event *event, void *data)			{ }
 
-static inline int perf_register_guest_info_callbacks
-(struct perf_guest_info_callbacks *callbacks)				{ return 0; }
-static inline int perf_unregister_guest_info_callbacks
-(struct perf_guest_info_callbacks *callbacks)				{ return 0; }
+static inline void perf_register_guest_info_callbacks
+(struct perf_guest_info_callbacks *callbacks)				{ }
+static inline void perf_unregister_guest_info_callbacks(void)		{ }
 
 static inline void perf_event_mmap(struct vm_area_struct *vma)		{ }
 
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 464917096e73..baae796612b9 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6482,24 +6482,17 @@ static void perf_pending_event(struct irq_work *entry)
 		perf_swevent_put_recursion_context(rctx);
 }
 
-/*
- * We assume there is only KVM supporting the callbacks.
- * Later on, we might change it to a list if there is
- * another virtualization implementation supporting the callbacks.
- */
 struct perf_guest_info_callbacks *perf_guest_cbs;
 
-int perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
+void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
 {
 	perf_guest_cbs = cbs;
-	return 0;
 }
 EXPORT_SYMBOL_GPL(perf_register_guest_info_callbacks);
 
-int perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
+void perf_unregister_guest_info_callbacks(void)
 {
 	perf_guest_cbs = NULL;
-	return 0;
 }
 EXPORT_SYMBOL_GPL(perf_unregister_guest_info_callbacks);
 
-- 
2.33.0.259.gc128427fd7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
