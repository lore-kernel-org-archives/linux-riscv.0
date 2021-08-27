Return-Path: <SRS0=rXXN=NS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93E66C432BE
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 01:04:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E68C60FDC
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 01:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4E68C60FDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kwJjvw3FMY5mVHraZl2E+75uWFGCNXzBOeCylyyFO3Q=; b=rqLFItWcyBS5Ia
	0LhOVc9FgvykrxS4eB+tJMy2KnKMoBoZRPoZL9wuf+bnvWR1KLPePSE1HbaWvDVSYoO/EwQGx+sH6
	g7Ru4u+YpSsPneIoGQDHzDDSKULNH8CsL/IfdzZ7RBwNRTLPJvgOO2k6GKZm8ljA0j2R6nJAGdP7F
	neIontvN91XYGq9edCTZykWdreXADtkUtEEU+QW8wX/+MPcbysS2XHOSw8bqT5sfSw2PBu4n1oF0T
	K78COHWPB7p08sGPudW/27ZcXzI4ZXXBMiPDb+oL0H92uGlKYu3M2VlI4EXFXswFkfEyOVbxnC5GX
	EyEgs+rl8foIMHfPwXjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJQHi-00BE1W-Vs; Fri, 27 Aug 2021 01:03:55 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJQBr-00BAzG-Gc
 for linux-riscv@lists.infradead.org; Fri, 27 Aug 2021 00:57:55 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id
 m10-20020a25d40a000000b00598bbbf467dso1937054ybf.1
 for <linux-riscv@lists.infradead.org>; Thu, 26 Aug 2021 17:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=URtT+dB+jST+gZg2WrKoRMxEnnvOGJ2KoTQrrGCl7oY=;
 b=QMyMyW8S+UdMR+QA1dMUWcj1nvV4awF9BhU25l5pymBfzXZEUMcpGdZL0BxhsVUTrH
 wwnMpXfbLu54yCHCCtgV2+evWSEDbv+dXSyufVgmFg3L3pcb8KjT8SWqp9r8G6c8kSxp
 pLoenRdXaSghZld5WzFyBNBLJKTOW1nT55C2Sva+2Zv2/tE3SOwtK+UMfx8kFjDDzDJK
 t9N4Z7NvWPgoYl3X+kWUq4jXGlgLXhzG/pWtR82HNRigu9ZhzdlUBMpgi1gtDf4WrxBF
 kafWIVt0+yu4zS7kftTHzy2ydn7SjePf/9Jkus2cGK2V680+vkX5sdV4/U0/KQUCmBkV
 IaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=URtT+dB+jST+gZg2WrKoRMxEnnvOGJ2KoTQrrGCl7oY=;
 b=JAhZCwQTwbEPGCl7VL1xs9tOZMXg2CVbEiNDJ6YkqlHfK2gnRK9P7uSjJZnmAhcJsc
 IQaELK2XiAfeTHbUvSO3FALfcVO9z+sLv03HKe5o8qwOCY7j0wl3rhS0CC37/Yr6fjzA
 qxM3F6QBvLuYRWfjeKRKfH8jGj133tu7NwjM+xfoNxCDsgaWEXp3IX9mGILtQG1BRNNy
 2YcOUikIfRMyXyZTZxo1NvDX8zaaSuTx8QQ5WYVM8O91/GIfqoznf0qSkU/xHdNhC2GO
 /0nd6TzJa06l55dqGxuHQrZEZvoz6+bKq2NFSzYEeTo+sY59KoJY7Ii0zIyLWrk/mXz1
 8Ndg==
X-Gm-Message-State: AOAM533h6xngEBBEtWFr5hsgM4ZuoXMfuFgtdCjtK636yYTmZfrytevp
 jZT3xjTxYgycdOwcSW5n5saVZdGi5Ds=
X-Google-Smtp-Source: ABdhPJx9DS89m5L71YrEHQukjJpAjWUrBsdJUeHGSEcBnJIrikQ0Z8d/TNTUFittLfnOlgJyGEhI291z6yw=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:c16c:db05:96b2:1475])
 (user=seanjc job=sendgmr) by 2002:a25:afcd:: with SMTP id
 d13mr1863343ybj.504.1630025869822; 
 Thu, 26 Aug 2021 17:57:49 -0700 (PDT)
Date: Thu, 26 Aug 2021 17:57:12 -0700
In-Reply-To: <20210827005718.585190-1-seanjc@google.com>
Message-Id: <20210827005718.585190-10-seanjc@google.com>
Mime-Version: 1.0
References: <20210827005718.585190-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
Subject: [PATCH 09/15] KVM: arm64: Register/unregister perf callbacks at vcpu
 load/put
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
X-CRM114-CacheID: sfid-20210826_175751_677225_BA90ABB1 
X-CRM114-Status: GOOD (  16.24  )
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

Register/unregister perf callbacks at vcpu_load()/vcpu_put() instead of
keeping the callbacks registered for all eternity after loading KVM.
This will allow future cleanups and optimizations as the registration
of the callbacks signifies "in guest".  This will also allow moving the
callbacks into common KVM as they arm64 and x86 now have semantically
identical callback implementations.

Note, KVM could likely be more precise in its registration, but that's a
cleanup for the future.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/include/asm/kvm_host.h | 12 ++++++++++-
 arch/arm64/kvm/arm.c              |  5 ++++-
 arch/arm64/kvm/perf.c             | 36 ++++++++++++++-----------------
 3 files changed, 31 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index ed940aec89e0..007c38d77fd9 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -671,7 +671,17 @@ int kvm_handle_mmio_return(struct kvm_vcpu *vcpu);
 int io_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa);
 
 void kvm_perf_init(void);
-void kvm_perf_teardown(void);
+
+#ifdef CONFIG_PERF_EVENTS
+void kvm_register_perf_callbacks(void);
+static inline void kvm_unregister_perf_callbacks(void)
+{
+	__perf_unregister_guest_info_callbacks();
+}
+#else
+static inline void kvm_register_perf_callbacks(void) {}
+static inline void kvm_unregister_perf_callbacks(void) {}
+#endif
 
 long kvm_hypercall_pv_features(struct kvm_vcpu *vcpu);
 gpa_t kvm_init_stolen_time(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index e9a2b8f27792..ec386971030d 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -429,10 +429,13 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	if (vcpu_has_ptrauth(vcpu))
 		vcpu_ptrauth_disable(vcpu);
 	kvm_arch_vcpu_load_debug_state_flags(vcpu);
+
+	kvm_register_perf_callbacks();
 }
 
 void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 {
+	kvm_unregister_perf_callbacks();
 	kvm_arch_vcpu_put_debug_state_flags(vcpu);
 	kvm_arch_vcpu_put_fp(vcpu);
 	if (has_vhe())
@@ -2155,7 +2158,7 @@ int kvm_arch_init(void *opaque)
 /* NOP: Compiling as a module not supported */
 void kvm_arch_exit(void)
 {
-	kvm_perf_teardown();
+
 }
 
 static int __init early_kvm_mode_cfg(char *arg)
diff --git a/arch/arm64/kvm/perf.c b/arch/arm64/kvm/perf.c
index 039fe59399a2..2556b0a3b096 100644
--- a/arch/arm64/kvm/perf.c
+++ b/arch/arm64/kvm/perf.c
@@ -13,33 +13,30 @@
 
 DEFINE_STATIC_KEY_FALSE(kvm_arm_pmu_available);
 
+#ifdef CONFIG_PERF_EVENTS
 static int kvm_is_in_guest(void)
 {
-        return kvm_get_running_vcpu() != NULL;
+	return true;
 }
 
 static int kvm_is_user_mode(void)
 {
-	struct kvm_vcpu *vcpu;
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
 
-	vcpu = kvm_get_running_vcpu();
+	if (WARN_ON_ONCE(!vcpu))
+		return 0;
 
-	if (vcpu)
-		return !vcpu_mode_priv(vcpu);
-
-	return 0;
+	return !vcpu_mode_priv(vcpu);
 }
 
 static unsigned long kvm_get_guest_ip(void)
 {
-	struct kvm_vcpu *vcpu;
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
 
-	vcpu = kvm_get_running_vcpu();
+	if (WARN_ON_ONCE(!vcpu))
+		return 0;
 
-	if (vcpu)
-		return *vcpu_pc(vcpu);
-
-	return 0;
+	return *vcpu_pc(vcpu);
 }
 
 static struct perf_guest_info_callbacks kvm_guest_cbs = {
@@ -48,15 +45,14 @@ static struct perf_guest_info_callbacks kvm_guest_cbs = {
 	.get_guest_ip	= kvm_get_guest_ip,
 };
 
+void kvm_register_perf_callbacks(void)
+{
+	__perf_register_guest_info_callbacks(&kvm_guest_cbs);
+}
+#endif /* CONFIG_PERF_EVENTS*/
+
 void kvm_perf_init(void)
 {
 	if (kvm_pmu_probe_pmuver() != 0xf && !is_protected_kvm_enabled())
 		static_branch_enable(&kvm_arm_pmu_available);
-
-	perf_register_guest_info_callbacks(&kvm_guest_cbs);
-}
-
-void kvm_perf_teardown(void)
-{
-	perf_unregister_guest_info_callbacks();
 }
-- 
2.33.0.259.gc128427fd7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
