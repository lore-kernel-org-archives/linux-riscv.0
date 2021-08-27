Return-Path: <SRS0=rXXN=NS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CB81C432BE
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 01:03:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C49760F91
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 01:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C49760F91
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RtkCDUqzfR26fGpVJeWqJO/jAleSHZ3TpaZjYzNP4ME=; b=XbFYqph1vrOsAJ
	Lq/ZgYxDoYE6tsmXkteSY9nQ4QBmFSTgHCTpqSJknmbyksIkvzBK2Ppm/3Bh8/ustMg7uB50tbai1
	+kb5pZg9imIB6IPKHQPHRLXjMEAMVox5JxEcrErDDN+PM/hlwcmazq01CLp8Q6I097w/WJq9cnNt4
	TlagrpHfJVPFx5tHnxeOVHMe7nVMLZD34sx6S7Fm7xI6hiqB9JjAjBLKe64cb/rV7Zl4Ox94D4EUq
	M4EX/EJ3tDI686dfArubbwdB4NsDpohBh0BDuRKccZpv0ipNjYxoVmp67dqtK+wUkRSMhAIngridv
	3yrLAQzKn7imRAxdG1+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJQGp-00BDZG-O5; Fri, 27 Aug 2021 01:02:59 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJQBo-00BAxP-Up
 for linux-riscv@lists.infradead.org; Fri, 27 Aug 2021 00:57:53 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 m66-20020a257145000000b00598282d96ceso4900206ybc.3
 for <linux-riscv@lists.infradead.org>; Thu, 26 Aug 2021 17:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=AFHcFLQ8Zudn3D234yQQ371MlX0hPffSTnop5clNbU4=;
 b=ehODs2sAzX4fmqGdkUXhOCuacyAsZ5WG5XMN79bjP+xq4RU4v9fT+sBLKRTlQqGWyX
 q30luLe7UbUT+k5DL/N9U4aU2TEa+qPeGqAJxEBE/FVgE0CuiF3raXC1RXOK3ImBGaQ4
 XbKMz4w/DkAC9W9hss3rUtWCAWdzbERpB661AM+dQQmPgaw7Ftx+tH6bG8AYsTaZ9CDU
 e02FAinIj3+x9EA64fOdiwehQIAyNOzTqpYk8MnCh+cFqm78JcgPcKiioGpdAXvwto5l
 kIPH0qjJWMM4k2bYrS2zDHxLCqBbRaCfrumPTD8MLrYqYErmy2b3iS7uHQauGeKAtamE
 EuYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=AFHcFLQ8Zudn3D234yQQ371MlX0hPffSTnop5clNbU4=;
 b=t4eBHtrv1zhG0eXf5I51FSKhRRaDILK2lzXLXpcRxyUQg/L2lyM/DjqyoeayL2Q23m
 oQaZnu2MJYVX84pKHA7eN7V3o3dauljZ6+w75OFX6FIjUnfAZba9IFYkyMS0x52Yz2QU
 WSxaYsanFcSFcZe1dtQ+mZAoSNNMr+dpCH63cgRzR+P2MCsueA+yyTHo09+9vnVYFmhR
 jwjrWNpjEgSqzFqbBvk3Pz3HaaBobEqiey0Yx7enLa5i7DwtSjWfKFS2kkW2mVWlTpDi
 QV8Ddbgvwf5rQoJUI/66lEoUINXAAWqY6FvaoZC56iI1aGltxPLvZy5DwS82sjDj0Wyh
 d8dQ==
X-Gm-Message-State: AOAM533iNIBxUtNEbZcYeMUlVXgGVVpz0MjOAsvozDqRgPTLwJWXhrUm
 hF9DG2xn6p9J4FsfB0/c1BFG0+A6T2k=
X-Google-Smtp-Source: ABdhPJxdtTMoWPCFq9FJTrWuwV5L/MyoyJcLiUL8JKOdEyDnebSuapnzs9qVktMCvhy616hB+yWZoBPXnlo=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:c16c:db05:96b2:1475])
 (user=seanjc job=sendgmr) by 2002:a25:7a03:: with SMTP id
 v3mr2037918ybc.202.1630025867497; 
 Thu, 26 Aug 2021 17:57:47 -0700 (PDT)
Date: Thu, 26 Aug 2021 17:57:11 -0700
In-Reply-To: <20210827005718.585190-1-seanjc@google.com>
Message-Id: <20210827005718.585190-9-seanjc@google.com>
Mime-Version: 1.0
References: <20210827005718.585190-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
Subject: [PATCH 08/15] KVM: x86: Drop current_vcpu in favor of kvm_running_vcpu
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
X-CRM114-CacheID: sfid-20210826_175749_061097_18657172 
X-CRM114-Status: GOOD (  14.16  )
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

Now that KVM registers perf callbacks only when the CPU is "in guest",
use kvm_running_vcpu instead of current_vcpu to retrieve the associated
vCPU and drop current_vcpu.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 12 +++++-------
 arch/x86/kvm/x86.h |  4 ----
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index d4d91944fde7..e337aef60793 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8264,17 +8264,15 @@ static void kvm_timer_init(void)
 			  kvmclock_cpu_online, kvmclock_cpu_down_prep);
 }
 
-DEFINE_PER_CPU(struct kvm_vcpu *, current_vcpu);
-EXPORT_PER_CPU_SYMBOL_GPL(current_vcpu);
-
 static int kvm_is_in_guest(void)
 {
-	return __this_cpu_read(current_vcpu) != NULL;
+	/* x86's callbacks are registered only when handling a guest NMI. */
+	return true;
 }
 
 static int kvm_is_user_mode(void)
 {
-	struct kvm_vcpu *vcpu = __this_cpu_read(current_vcpu);
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
 
 	if (WARN_ON_ONCE(!vcpu))
 		return 0;
@@ -8284,7 +8282,7 @@ static int kvm_is_user_mode(void)
 
 static unsigned long kvm_get_guest_ip(void)
 {
-	struct kvm_vcpu *vcpu = __this_cpu_read(current_vcpu);
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
 
 	if (WARN_ON_ONCE(!vcpu))
 		return 0;
@@ -8294,7 +8292,7 @@ static unsigned long kvm_get_guest_ip(void)
 
 static void kvm_handle_intel_pt_intr(void)
 {
-	struct kvm_vcpu *vcpu = __this_cpu_read(current_vcpu);
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
 
 	if (WARN_ON_ONCE(!vcpu))
 		return;
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index 4c5ba4128b38..f13f15d2fab8 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -393,11 +393,8 @@ static inline void kvm_unregister_perf_callbacks(void)
 	__perf_unregister_guest_info_callbacks();
 }
 
-DECLARE_PER_CPU(struct kvm_vcpu *, current_vcpu);
-
 static inline void kvm_before_interrupt(struct kvm_vcpu *vcpu, bool is_nmi)
 {
-	__this_cpu_write(current_vcpu, vcpu);
 	WRITE_ONCE(vcpu->arch.handling_nmi_from_guest, is_nmi);
 
 	kvm_register_perf_callbacks();
@@ -408,7 +405,6 @@ static inline void kvm_after_interrupt(struct kvm_vcpu *vcpu)
 	kvm_unregister_perf_callbacks();
 
 	WRITE_ONCE(vcpu->arch.handling_nmi_from_guest, false);
-	__this_cpu_write(current_vcpu, NULL);
 }
 
 
-- 
2.33.0.259.gc128427fd7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
