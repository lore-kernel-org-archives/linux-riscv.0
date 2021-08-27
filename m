Return-Path: <SRS0=rXXN=NS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46956C432BE
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 01:11:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 148D260F91
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 01:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 148D260F91
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/vClGDsB1pZo4Fic+qwxxAC19vze/4L6UfHVnvBrrRU=; b=xkaaVSwFtnpuFp
	05JDwECcHF3p0LOz2yximQehfNwcWegtyi8NIxmryjCOEIuImuYylpT4y48ixZlFmOe7fL9J0gA2L
	b2s9/XbltiKazbbcHoSM8XeVfP4+2GYlmrQL088qoCyKNm/5Li1Inv0Hhtw/FErMRRWgubS3UKwGE
	tUTDuRK/SD0yUFRIfxGi0Bk6UwZILzJRZ7oa7uak/cIm7Cv+L9OpqpKxq7nVJAnvUOGic0GA/zUpa
	c/CYePAFTg9nIgROqjAu1fLhZ9yYcnB9nL7Pv5rployKh5FL5apoutt4AT5ftv2Y6U8paZCmDYGbj
	Q3aQWa7Z3aY30G5ocLNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJQOa-00BGl1-VP; Fri, 27 Aug 2021 01:11:01 +0000
Received: from mail-qk1-x749.google.com ([2607:f8b0:4864:20::749])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJQC2-00BB7u-Vr
 for linux-riscv@lists.infradead.org; Fri, 27 Aug 2021 00:58:04 +0000
Received: by mail-qk1-x749.google.com with SMTP id
 s206-20020a3745d70000b02903b9207abc7bso2652100qka.4
 for <linux-riscv@lists.infradead.org>; Thu, 26 Aug 2021 17:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=2c1oAfv2K1kK887vDwje5mKOKCy671YkzEKzr6O0AXU=;
 b=dPpwJxjFAEvKqBeQTsJ+sGnKoHCUDoZpaVXefCBRLWJYEAXtYCk1jNkAx1AH1WF/eG
 KIy8x+/4sLPr4zdnDE2egBaEDODhNuwDeZz/fiGkGQbMwDhPfxlGMgiZv4nxwzKTONNP
 w48weamcMEaBWOvZvU5f0I92nygzL+xaBLQUBWTiwbOYY93Mwf2WxDnJ3W/MWHuZSFBN
 ySHOeq9MvFBM04dVoDNrkz77+gPtaH+dN9os6JcQtf1EK0v/gyWblqEXuz9BFALfpRnH
 6isQHkETZn28aDBmE0AV+m14demqlHfQTlvzBRY5XUHPrqkELuVFpgUnkCWViVAkwntu
 hboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=2c1oAfv2K1kK887vDwje5mKOKCy671YkzEKzr6O0AXU=;
 b=Xos0s4HBrrqiMV+8vLatq5xdri6sqgFEYSlWqjBjzWmdat6U99RC30tua06XGCnlUo
 xktMLxUeESmCH6rjUkEQr49CdV8DIHZHh9pGqzhpQK0VIxaa2avvQ5FmqccBsxTWy4YJ
 aWkRzpYxlKLl9lnvKSd1UA5RL890MsRYm3uzJvPgLpoNw7sRVwxAzSGomLqaQsf3xylv
 E4+As/vPFWAQIQ3W+lGtYeIUfVxZ+ehmjJaQsD9jlmQ7B4ZepuqSl099xPOdVZHn/cFC
 NzaOs7vsquRIXDak7l8hz2/d/h5pUYee5OVzkMghaBhkQHc9hi9earlw+XuxHVaUzIkq
 07hw==
X-Gm-Message-State: AOAM5301URkROdgcrTL+si7GuW6ddSCFzCrQLW/L+12Yl/YA1UgfNrev
 UvNimScsHSiMg9vCJI1RHUqzkTg4/iQ=
X-Google-Smtp-Source: ABdhPJyRfoK4Sj+uUxToLmh3g94becc3It6jH8S/y/rUNMio/2OXitmqg6SKQMU8b0uN77qihKZhErMmOqs=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:c16c:db05:96b2:1475])
 (user=seanjc job=sendgmr) by 2002:a0c:aa55:: with SMTP id
 e21mr7179445qvb.41.1630025880952; 
 Thu, 26 Aug 2021 17:58:00 -0700 (PDT)
Date: Thu, 26 Aug 2021 17:57:17 -0700
In-Reply-To: <20210827005718.585190-1-seanjc@google.com>
Message-Id: <20210827005718.585190-15-seanjc@google.com>
Mime-Version: 1.0
References: <20210827005718.585190-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
Subject: [PATCH 14/15] perf: Disallow bulk unregistering of guest callbacks
 and do cleanup
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
X-CRM114-CacheID: sfid-20210826_175803_085371_F7257F7C 
X-CRM114-Status: GOOD (  14.97  )
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

Drop the helper that allows bulk unregistering of the per-CPU callbacks
now that KVM, the only entity that actually unregisters callbacks, uses
the per-CPU helpers.  Bulk unregistering is inherently unsafe as there
are no protections against nullifying a pointer for a CPU that is using
said pointer in a PMI handler.

Opportunistically tweak names to better reflect reality.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/xen/pmu.c         |  2 +-
 include/linux/kvm_host.h   |  2 +-
 include/linux/perf_event.h |  9 +++------
 kernel/events/core.c       | 31 +++++++++++--------------------
 virt/kvm/kvm_main.c        |  2 +-
 5 files changed, 17 insertions(+), 29 deletions(-)

diff --git a/arch/x86/xen/pmu.c b/arch/x86/xen/pmu.c
index e13b0b49fcdf..57834de043c3 100644
--- a/arch/x86/xen/pmu.c
+++ b/arch/x86/xen/pmu.c
@@ -548,7 +548,7 @@ void xen_pmu_init(int cpu)
 	per_cpu(xenpmu_shared, cpu).flags = 0;
 
 	if (cpu == 0) {
-		perf_register_guest_info_callbacks(&xen_guest_cbs);
+		perf_register_guest_info_callbacks_all_cpus(&xen_guest_cbs);
 		xen_pmu_arch_init();
 	}
 
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 0db9af0b628c..d68a49d5fc53 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1171,7 +1171,7 @@ unsigned long kvm_arch_vcpu_get_ip(struct kvm_vcpu *vcpu);
 void kvm_register_perf_callbacks(void);
 static inline void kvm_unregister_perf_callbacks(void)
 {
-	__perf_unregister_guest_info_callbacks();
+	perf_unregister_guest_info_callbacks();
 }
 #endif
 
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 7a367bf1b78d..db701409a62f 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1238,10 +1238,9 @@ extern void perf_event_bpf_event(struct bpf_prog *prog,
 
 #ifdef CONFIG_HAVE_GUEST_PERF_EVENTS
 DECLARE_PER_CPU(struct perf_guest_info_callbacks *, perf_guest_cbs);
-extern void __perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs);
-extern void __perf_unregister_guest_info_callbacks(void);
-extern void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *callbacks);
+extern void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs);
 extern void perf_unregister_guest_info_callbacks(void);
+extern void perf_register_guest_info_callbacks_all_cpus(struct perf_guest_info_callbacks *cbs);
 #endif /* CONFIG_HAVE_GUEST_PERF_EVENTS */
 
 extern void perf_event_exec(void);
@@ -1486,9 +1485,7 @@ static inline void
 perf_bp_event(struct perf_event *event, void *data)			{ }
 
 #ifdef CONFIG_HAVE_GUEST_PERF_EVENTS
-static inline void perf_register_guest_info_callbacks
-(struct perf_guest_info_callbacks *callbacks)				{ }
-static inline void perf_unregister_guest_info_callbacks(void)		{ }
+extern void perf_register_guest_info_callbacks_all_cpus(struct perf_guest_info_callbacks *cbs);
 #endif
 
 static inline void perf_event_mmap(struct vm_area_struct *vma)		{ }
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 2f28d9d8dc94..f1964096c4c2 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6485,35 +6485,26 @@ static void perf_pending_event(struct irq_work *entry)
 #ifdef CONFIG_HAVE_GUEST_PERF_EVENTS
 DEFINE_PER_CPU(struct perf_guest_info_callbacks *, perf_guest_cbs);
 
-void __perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
-{
-	__this_cpu_write(perf_guest_cbs, cbs);
-}
-EXPORT_SYMBOL_GPL(__perf_register_guest_info_callbacks);
-
-void __perf_unregister_guest_info_callbacks(void)
-{
-	__this_cpu_write(perf_guest_cbs, NULL);
-}
-EXPORT_SYMBOL_GPL(__perf_unregister_guest_info_callbacks);
-
 void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
 {
-	int cpu;
-
-	for_each_possible_cpu(cpu)
-		per_cpu(perf_guest_cbs, cpu) = cbs;
+	__this_cpu_write(perf_guest_cbs, cbs);
 }
 EXPORT_SYMBOL_GPL(perf_register_guest_info_callbacks);
 
 void perf_unregister_guest_info_callbacks(void)
 {
-	int cpu;
-
-	for_each_possible_cpu(cpu)
-		per_cpu(perf_guest_cbs, cpu) = NULL;
+	__this_cpu_write(perf_guest_cbs, NULL);
 }
 EXPORT_SYMBOL_GPL(perf_unregister_guest_info_callbacks);
+
+void perf_register_guest_info_callbacks_all_cpus(struct perf_guest_info_callbacks *cbs)
+{
+	int cpu;
+
+	for_each_possible_cpu(cpu)
+		per_cpu(perf_guest_cbs, cpu) = cbs;
+}
+EXPORT_SYMBOL_GPL(perf_register_guest_info_callbacks_all_cpus);
 #endif
 
 static void
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index e0b1c9386926..1bcc3eab510b 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5502,7 +5502,7 @@ EXPORT_SYMBOL_GPL(kvm_set_intel_pt_intr_handler);
 
 void kvm_register_perf_callbacks(void)
 {
-	__perf_register_guest_info_callbacks(&kvm_guest_cbs);
+	perf_register_guest_info_callbacks(&kvm_guest_cbs);
 }
 EXPORT_SYMBOL_GPL(kvm_register_perf_callbacks);
 #endif
-- 
2.33.0.259.gc128427fd7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
