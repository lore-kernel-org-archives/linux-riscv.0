Return-Path: <SRS0=6gMx=OM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72CFCC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Sep 2021 00:12:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FB7E61159
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Sep 2021 00:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3FB7E61159
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b2MIUwSgNn5PVY/eycI+Q83azplgwVo56pTdHlyeZIU=; b=yrc06/vXkYuDVy
	U27r2gmBXhhpctCHpP1quTaltaLdOHvuNeQRQGfvo7koU6hXzqOAlMXH8YGba9fkGMv/6PuBZRCOv
	4Y6bjM7cM4uGRdb+uNkV/oBHozXZpkb8KhLVQuj4mzKflYJ8qOYet5Eb1qgoSnO5WM8oaO9zL3mp6
	EmSj6cvlEOgZVa4JFCudjNdlE9oQDnfeCQsPrdTJxaZehaQIJU/MyYrITFmNYFtcqxxFIfpJK/luP
	EOFdUTT+yx1duXNVUsCpYN5nIxOFdBtZpnF86C9VUoytAfLV7YpvOsBzStJYJxL53BW3XSKKQALZi
	8BxgULruFSutgdeyfyCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSprj-006KIt-7j; Wed, 22 Sep 2021 00:11:59 +0000
Received: from mail-qt1-x84a.google.com ([2607:f8b0:4864:20::84a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSply-006HWI-SQ
 for linux-riscv@lists.infradead.org; Wed, 22 Sep 2021 00:06:04 +0000
Received: by mail-qt1-x84a.google.com with SMTP id
 e5-20020ac84905000000b002a69dc43859so5257652qtq.10
 for <linux-riscv@lists.infradead.org>; Tue, 21 Sep 2021 17:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=hxRuLxBMmtgulqNWBhVm63T2q6otFpWhzuzOzQjwuz0=;
 b=AEH25mNfVOzaOi5d6c3BruylgDezaEPCOtesGovpuwBViHkaZN0oJqqsI3ayCNTU47
 g0/dG78HVaz39C6dylQWgabX8vR0or8V+qWDB8Hco6j0Zy1BH84lLC4DdigOee9qRXx5
 Z0GBtiUbse1uPHuGSgRHXOGN+MswC1H/vEN/9eWkP/kvKiaoxNiLyYnf9+trtkLu2SB3
 N3xMQRLYQClaWUgxFLgSR/Ws7M+M5HGzh33BkasWfYaCdmeGEgaOiZCARYtsiDGcOzZZ
 QmwqXobkE3+q1ncVsZzvdLP7llxDj6xtQ34TQ5DGMtVmRDULQ5ytAScISNgwHfdTAtDC
 Jt9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=hxRuLxBMmtgulqNWBhVm63T2q6otFpWhzuzOzQjwuz0=;
 b=ToCeGYHBhWsB78CdzQ1/kS7Ojaa/Z0oDKVMAP41pATQncsCkeNDuwSvfrjFrPQ5n/X
 hRjelEsFbysM9cbYtPGUok44rWNfHkGnDrnbIgkZAShGQluYz5kEIDgEAoMlOmrO+F69
 DeNctHnUt2ESexYFi5LLTXIQ816VaWlG0BQiukTFMmroqSJ1tvFe/Fk8732SZiduUN7v
 PirhcB0Be5vV9Z43AdVzxtDo4rnmYTjB2fkIcu3ZyYSbLRfjuKgpoOu69AWUOI0c2bzO
 3s9s+Cj00/qhAI4HQILbXDHfXXNr3AvsDP0eWXgrhCX+XvJq+VxweGEpDbNSMI9/DDoL
 hWMw==
X-Gm-Message-State: AOAM530UzZWFJ6g2tSc5Oa9Q+9eiCyKFs5NS/lLN+lrtz/5dxRRl0hY3
 Jv4YfoNlDc/73Tv971OcigHi87DL+F0=
X-Google-Smtp-Source: ABdhPJzZXZc/uBJgDh9/jjk115DCwSnPOWZBsVnqx8QA2MhIXqiGwOq328gHdkdfukulUyubJVoFUxWXEpY=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:b022:92d6:d37b:686c])
 (user=seanjc job=sendgmr) by 2002:a05:6214:6aa:: with SMTP id
 s10mr33034215qvz.56.1632269161091; Tue, 21 Sep 2021 17:06:01 -0700 (PDT)
Date: Tue, 21 Sep 2021 17:05:25 -0700
In-Reply-To: <20210922000533.713300-1-seanjc@google.com>
Message-Id: <20210922000533.713300-9-seanjc@google.com>
Mime-Version: 1.0
References: <20210922000533.713300-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.464.g1972c5931b-goog
Subject: [PATCH v3 08/16] perf: Force architectures to opt-in to guest
 callbacks
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, 
 Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>,
 Nick Hu <nickhu@andestech.com>, 
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, 
 Namhyung Kim <namhyung@kernel.org>, James Morse <james.morse@arm.com>, 
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
 Joerg Roedel <joro@8bytes.org>, Stefano Stabellini <sstabellini@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kvmarm@lists.cs.columbia.edu, 
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org, 
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
 Artem Kashkanov <artem.kashkanov@intel.com>, Like Xu <like.xu.linux@gmail.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_170602_982296_3A6D5D24 
X-CRM114-Status: GOOD (  12.56  )
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

Introduce GUEST_PERF_EVENTS and require architectures to select it to
allow registering and using guest callbacks in perf.  This will hopefully
make it more difficult for new architectures to add useless "support" for
guest callbacks, e.g. via copy+paste.

Stubbing out the helpers has the happy bonus of avoiding a load of
perf_guest_cbs when GUEST_PERF_EVENTS=n on arm64/x86.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/Kconfig     | 1 +
 arch/x86/kvm/Kconfig       | 1 +
 arch/x86/xen/Kconfig       | 1 +
 include/linux/perf_event.h | 6 ++++++
 init/Kconfig               | 4 ++++
 kernel/events/core.c       | 2 ++
 6 files changed, 15 insertions(+)

diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index a4eba0908bfa..f2121404c7c6 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -37,6 +37,7 @@ menuconfig KVM
 	select HAVE_KVM_IRQ_BYPASS
 	select HAVE_KVM_VCPU_RUN_PID_CHANGE
 	select SCHED_INFO
+	select GUEST_PERF_EVENTS if PERF_EVENTS
 	help
 	  Support hosting virtualized guest machines.
 
diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index ac69894eab88..699bf786fbce 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -36,6 +36,7 @@ config KVM
 	select KVM_MMIO
 	select SCHED_INFO
 	select PERF_EVENTS
+	select GUEST_PERF_EVENTS
 	select HAVE_KVM_MSI
 	select HAVE_KVM_CPU_RELAX_INTERCEPT
 	select HAVE_KVM_NO_POLL
diff --git a/arch/x86/xen/Kconfig b/arch/x86/xen/Kconfig
index afc1da68b06d..d07595a9552d 100644
--- a/arch/x86/xen/Kconfig
+++ b/arch/x86/xen/Kconfig
@@ -23,6 +23,7 @@ config XEN_PV
 	select PARAVIRT_XXL
 	select XEN_HAVE_PVMMU
 	select XEN_HAVE_VPMU
+	select GUEST_PERF_EVENTS
 	help
 	  Support running as a Xen PV guest.
 
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index c0a6eaf55fb1..eefa197d5354 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1238,6 +1238,7 @@ extern void perf_event_bpf_event(struct bpf_prog *prog,
 				 enum perf_bpf_event_type type,
 				 u16 flags);
 
+#ifdef CONFIG_GUEST_PERF_EVENTS
 extern struct perf_guest_info_callbacks *perf_guest_cbs;
 static inline struct perf_guest_info_callbacks *perf_get_guest_cbs(void)
 {
@@ -1273,6 +1274,11 @@ static inline unsigned int perf_guest_handle_intel_pt_intr(void)
 }
 extern void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs);
 extern void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs);
+#else
+static inline unsigned int perf_guest_state(void)		 { return 0; }
+static inline unsigned long perf_guest_get_ip(void)		 { return 0; }
+static inline unsigned int perf_guest_handle_intel_pt_intr(void) { return 0; }
+#endif /* CONFIG_GUEST_PERF_EVENTS */
 
 extern void perf_event_exec(void);
 extern void perf_event_comm(struct task_struct *tsk, bool exec);
diff --git a/init/Kconfig b/init/Kconfig
index 55f9f7738ebb..acc7e8ba4563 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1776,6 +1776,10 @@ config HAVE_PERF_EVENTS
 	help
 	  See tools/perf/design.txt for details.
 
+config GUEST_PERF_EVENTS
+	bool
+	depends on HAVE_PERF_EVENTS
+
 config PERF_USE_VMALLOC
 	bool
 	help
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 2e3dc9fbd5d9..c6ec05809f54 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6482,6 +6482,7 @@ static void perf_pending_event(struct irq_work *entry)
 		perf_swevent_put_recursion_context(rctx);
 }
 
+#ifdef CONFIG_GUEST_PERF_EVENTS
 struct perf_guest_info_callbacks *perf_guest_cbs;
 
 void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
@@ -6502,6 +6503,7 @@ void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
 	synchronize_rcu();
 }
 EXPORT_SYMBOL_GPL(perf_unregister_guest_info_callbacks);
+#endif
 
 static void
 perf_output_sample_regs(struct perf_output_handle *handle,
-- 
2.33.0.464.g1972c5931b-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
