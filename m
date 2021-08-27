Return-Path: <SRS0=rXXN=NS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97706C432BE
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 01:08:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5553760FC1
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 01:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5553760FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h1/Ye3ULe75FutKPuuOI6IuZt0OIXmSxPmfUGawuDmE=; b=LDCvgISB42T2G5
	IKuuAVIRtHDSRWg7ilGlvyXvov/uUDnJ3AUZLfFS7DoaCAtAdWiDmjh3fR4i8D0IynADK5vJD+YCR
	mBcKnLkBzfiIvsJMPTGJGw++tIRIa6PMy6QXnIidSPBacCS79fb7yFA6wRNnUAc7828nPs2fsu58d
	iKe1mEAASxQrM+mYARP89FMN2p/MrYwcE/NriWiZ1On0rTYrJlfZf+0dhS+GnEowkMlQNVVXSsNWv
	QsMpFI9n2oSmd7Lxsc62KQxECete/cUB0uT8rYD8S8L36QS5kZkSDQ8VzcKbWBGDohRBUT//5Rg7n
	5U0uhmDSNSrTF0aiSKww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJQM9-00BFyO-Cj; Fri, 27 Aug 2021 01:08:29 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJQC0-00BB6N-Dy
 for linux-riscv@lists.infradead.org; Fri, 27 Aug 2021 00:58:02 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 q9-20020a252a09000000b0059b9b61f6ceso4876895ybq.19
 for <linux-riscv@lists.infradead.org>; Thu, 26 Aug 2021 17:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=2Yb1yGb5fDFVhiHzotpZzkExCo5t0u5SIR8VcomG6Y8=;
 b=oWsDHoiAgF+Rhb3fLUc6FI/hmLn3kcWZvx8XtETflRRGA0RhU5jY1yIZDAGsQhoBpp
 1GJBEG0ciVc5J+SUb8a+Ao9XHC+o6ePIJEaj6rwWcsyMNZs4gGZqc7lzXXQCKUD4cl0c
 TRH/cFXEm6Rx0y/hBRfKtUfta8tkBrKjcdPY8umqV9V9fsCKuHTQ7mSyJMBSrgahXH0x
 lar1IXWEl6SGlmj++N0CiAloA9rKj68iYW0I4yXj2kb3Jns102ph3m6+Q2Bdd5QiIhz6
 k5kD3EQUqFV+FChTG+7KKqC3KPQuPp+dCSp1iLM55DlUy2uQ6DK+nKRfDfTvKe6dg2+c
 5JTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=2Yb1yGb5fDFVhiHzotpZzkExCo5t0u5SIR8VcomG6Y8=;
 b=DfHmEPFuFWnWflh2HZYBAslU7ZYJcEgBR7N469J1oG8FHi3aODNGn3CCr5hWl9WuLs
 eoeWRK9C9qwCd2TpcOGZcumXIZdXpJZpE+vqwQA6nskR1iDh/mXObAO5I+6Y4b9q2oVO
 90rCIKpYd3/7hr+w78gGcnQkRdf/+grJk8I8gT1MvBVEVdN1GdEY0XBCTCfKqIp8dLcz
 BnUNRVtoqlyzLKrteRXGCvqb6SVQcqUJXnn8GJidIPDyi8Jf5htC3huknWlUjondewEk
 hY2Q3Jw+CIFG3WrY5tncz7Usd1fhSSgBM84UcbouGGmZIAnoLcyVJuf0lYbGIkneOcTs
 CS8A==
X-Gm-Message-State: AOAM531xZpZZd54Gi8hRk+wBV91IAtwdabr+iAepctWF2OhMYSC5ICj5
 WG7C9DOrOJxy6PMWyBekzM4mmFjwUac=
X-Google-Smtp-Source: ABdhPJyKOmCo1JFta7E0dfGCF9Bd2CrFpGk6nB1tappPD2rgxLfvtZsunCu2ZMBBzPSrD7zu0QWkL018uCA=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:c16c:db05:96b2:1475])
 (user=seanjc job=sendgmr) by 2002:a5b:c0a:: with SMTP id
 f10mr1802450ybq.353.1630025878542; 
 Thu, 26 Aug 2021 17:57:58 -0700 (PDT)
Date: Thu, 26 Aug 2021 17:57:16 -0700
In-Reply-To: <20210827005718.585190-1-seanjc@google.com>
Message-Id: <20210827005718.585190-14-seanjc@google.com>
Mime-Version: 1.0
References: <20210827005718.585190-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
Subject: [PATCH 13/15] KVM: arm64: Drop perf.c and fold its tiny bit of code
 into pmu.c
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
X-CRM114-CacheID: sfid-20210826_175800_588069_9AE9F308 
X-CRM114-Status: GOOD (  17.87  )
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

Fold that last few remnants of perf.c into pmu.c and rename the init
helper as appropriate.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/include/asm/kvm_host.h |  2 --
 arch/arm64/kvm/Makefile           |  2 +-
 arch/arm64/kvm/arm.c              |  3 ++-
 arch/arm64/kvm/perf.c             | 20 --------------------
 arch/arm64/kvm/pmu.c              |  8 ++++++++
 include/kvm/arm_pmu.h             |  1 +
 6 files changed, 12 insertions(+), 24 deletions(-)
 delete mode 100644 arch/arm64/kvm/perf.c

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 12e8d789e1ac..86c0fdd11ad2 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -670,8 +670,6 @@ unsigned long kvm_mmio_read_buf(const void *buf, unsigned int len);
 int kvm_handle_mmio_return(struct kvm_vcpu *vcpu);
 int io_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa);
 
-void kvm_perf_init(void);
-
 #ifdef CONFIG_PERF_EVENTS
 #define __KVM_WANT_PERF_CALLBACKS
 #else
diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
index 989bb5dad2c8..0bcc378b7961 100644
--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -12,7 +12,7 @@ obj-$(CONFIG_KVM) += hyp/
 
 kvm-y := $(KVM)/kvm_main.o $(KVM)/coalesced_mmio.o $(KVM)/eventfd.o \
 	 $(KVM)/vfio.o $(KVM)/irqchip.o $(KVM)/binary_stats.o \
-	 arm.o mmu.o mmio.o psci.o perf.o hypercalls.o pvtime.o \
+	 arm.o mmu.o mmio.o psci.o hypercalls.o pvtime.o \
 	 inject_fault.o va_layout.o handle_exit.o \
 	 guest.o debug.o reset.o sys_regs.o \
 	 vgic-sys-reg-v3.o fpsimd.o pmu.o \
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index dfc8078dd4f9..57e637dee71d 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1747,7 +1747,8 @@ static int init_subsystems(void)
 	if (err)
 		goto out;
 
-	kvm_perf_init();
+	kvm_pmu_init();
+
 	kvm_sys_reg_table_init();
 
 out:
diff --git a/arch/arm64/kvm/perf.c b/arch/arm64/kvm/perf.c
deleted file mode 100644
index ad9fdc2f2f70..000000000000
--- a/arch/arm64/kvm/perf.c
+++ /dev/null
@@ -1,20 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Based on the x86 implementation.
- *
- * Copyright (C) 2012 ARM Ltd.
- * Author: Marc Zyngier <marc.zyngier@arm.com>
- */
-
-#include <linux/perf_event.h>
-#include <linux/kvm_host.h>
-
-#include <asm/kvm_emulate.h>
-
-DEFINE_STATIC_KEY_FALSE(kvm_arm_pmu_available);
-
-void kvm_perf_init(void)
-{
-	if (kvm_pmu_probe_pmuver() != 0xf && !is_protected_kvm_enabled())
-		static_branch_enable(&kvm_arm_pmu_available);
-}
diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index 03a6c1f4a09a..d98b57a17043 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -7,6 +7,14 @@
 #include <linux/perf_event.h>
 #include <asm/kvm_hyp.h>
 
+DEFINE_STATIC_KEY_FALSE(kvm_arm_pmu_available);
+
+void kvm_pmu_init(void)
+{
+	if (kvm_pmu_probe_pmuver() != 0xf && !is_protected_kvm_enabled())
+		static_branch_enable(&kvm_arm_pmu_available);
+}
+
 /*
  * Given the perf event attributes and system type, determine
  * if we are going to need to switch counters at guest entry/exit.
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 864b9997efb2..42270676498d 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -14,6 +14,7 @@
 #define ARMV8_PMU_MAX_COUNTER_PAIRS	((ARMV8_PMU_MAX_COUNTERS + 1) >> 1)
 
 DECLARE_STATIC_KEY_FALSE(kvm_arm_pmu_available);
+void kvm_pmu_init(void);
 
 static __always_inline bool kvm_arm_support_pmu_v3(void)
 {
-- 
2.33.0.259.gc128427fd7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
