Return-Path: <SRS0=6gMx=OM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB6EC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Sep 2021 00:12:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0F2261159
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Sep 2021 00:12:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E0F2261159
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EgQmi2JuJgxVmmWR/ffW/PZt18nC64Oyn7KfUEjMX9w=; b=cU++EM5vAo3iXh
	kiEAG0oXPYwd78+JLtesww3uTkmXS/rQXs+5oC6K3416RtEDXH7Gg1a/jYBCAptoMnVpdJ7ZUQTYf
	Fq3lNVOtRouWeXa3Mgr/uJgHoOcWdftPwM6gqhL7iG2XsoUEjjuLqudRvTboopbHRUP8zkxz0jYlT
	7RVW3N7RZ/yOAcf1S4jMhyI5SLUjYmM7xqVyklG7BML4eWdSNXPHc+Y4Y2g1YX/Rh9aKfmISadF50
	7QZowtcIkqN8StU7ryR/AZckb4J8xc2ocCOMQhfifL1gEkjXxNq5AfLsYjKgbHjv/C8IuLERSbSKE
	QE4VA+yzXT37tmXi0l6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSprp-006KMH-He; Wed, 22 Sep 2021 00:12:05 +0000
Received: from mail-qk1-x74a.google.com ([2607:f8b0:4864:20::74a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSpm0-006HXV-Nz
 for linux-riscv@lists.infradead.org; Wed, 22 Sep 2021 00:06:06 +0000
Received: by mail-qk1-x74a.google.com with SMTP id
 w17-20020ae9e511000000b00431497430b7so5679713qkf.12
 for <linux-riscv@lists.infradead.org>; Tue, 21 Sep 2021 17:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=lHJOof24VqkiYhFcIRNTWKzKjki/p0Ze5CnPJ3pN3mI=;
 b=NAVCfHnfawHtrL2iCYw8HgTBlFYN7yri+HxZMhsBlfVlSZIQEmh1AdRNXtYQ9FoGZS
 jRIrxb0XEtBmkG58IBs5w+mP9+jXc2C3HLEK37fIIPlowXZ4g2A0PlKvfuqb2ADJxmfT
 gWcyAqrNLMzTqwoc6qruf1z2Si6VfevO8CbFRhssYP8/HJFWfja6Iw9rCUyZd9oSQg+F
 9XbckVVG4ADd3HGel6flTZI1kY7ZlS2ePo2n4ME18ZOc0prkN5QAWF7paKBJF7TwSTpL
 +vKX7u3jx0Z8b6TwojXazIBTpdi6hKJXbUEPbqRRJ9J3bLcqDW1CgpBqnGXO30fQFOsf
 UrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=lHJOof24VqkiYhFcIRNTWKzKjki/p0Ze5CnPJ3pN3mI=;
 b=VpO27cf7aWQ1FkuTvlku3CYGI8Ff/yKlqbs8DaJmyHDyXWLR5z8CtBVKC8cCyfRzfC
 G8kiewytNkD8sjucROPZrljjhoe+h8tSW0N0AaidfCV0mp60rb+0Us9+rfH8ANQ+cnhQ
 5kl/2B/223KqUJN0l8SQRBGpG+kqcsNaVbl7gQFuvi3EDf4q12SEL6rsnmLBRMi6XEAv
 MSBydQQeMQ8ZvdsBw+AlklqXIoQrQc5Y0B5uDAJZ2eW91pKRDziXfLT3tpEG8Dgiqg9B
 U78yr93/B8FZfWnVWC1fpHF03NeVbfAwzL4e2zgy6HROyD2eOYuscAeGm8R9p+qZc1Ag
 pnFg==
X-Gm-Message-State: AOAM531p1r0lzkL8UT/pTgfaKF3ujyhIJlNWzX9tE0l1+xcUYbove0if
 JoFNRuwQmLJFpSR/uU00OdC9f5sEjkU=
X-Google-Smtp-Source: ABdhPJxiVysqs+seAL8tPuZXn+zjjV1XTgLeF1Hv4M206n5zRNvGf9PMhGCvhpJwuIHM26SWahcPIvZUjtg=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:b022:92d6:d37b:686c])
 (user=seanjc job=sendgmr) by 2002:a05:6214:732:: with SMTP id
 c18mr33750621qvz.9.1632269163200; Tue, 21 Sep 2021 17:06:03 -0700 (PDT)
Date: Tue, 21 Sep 2021 17:05:26 -0700
In-Reply-To: <20210922000533.713300-1-seanjc@google.com>
Message-Id: <20210922000533.713300-10-seanjc@google.com>
Mime-Version: 1.0
References: <20210922000533.713300-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.464.g1972c5931b-goog
Subject: [PATCH v3 09/16] perf/core: Use static_call to optimize
 perf_guest_info_callbacks
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
X-CRM114-CacheID: sfid-20210921_170604_822694_B7CE55F6 
X-CRM114-Status: GOOD (  16.62  )
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

Use static_call to optimize perf's guest callbacks on arm64 and x86,
which are now the only architectures that define the callbacks.  Use
DEFINE_STATIC_CALL_RET0 as the default/NULL for all guest callbacks, as
the callback semantics are that a return value '0' means "not in guest".

static_call obviously avoids the overhead of CONFIG_RETPOLINE=y, but is
also advantageous versus other solutions, e.g. per-cpu callbacks, in that
a per-cpu memory load is not needed to detect the !guest case.

Based on code from Peter and Like.

Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: Like Xu <like.xu.linux@gmail.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/perf_event.h | 28 ++++++----------------------
 kernel/events/core.c       | 15 +++++++++++++++
 2 files changed, 21 insertions(+), 22 deletions(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index eefa197d5354..d582dfeb4e20 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1240,37 +1240,21 @@ extern void perf_event_bpf_event(struct bpf_prog *prog,
 
 #ifdef CONFIG_GUEST_PERF_EVENTS
 extern struct perf_guest_info_callbacks *perf_guest_cbs;
-static inline struct perf_guest_info_callbacks *perf_get_guest_cbs(void)
-{
-	/* Reg/unreg perf_guest_cbs waits for readers via synchronize_rcu(). */
-	lockdep_assert_preemption_disabled();
+DECLARE_STATIC_CALL(__perf_guest_state, *perf_guest_cbs->state);
+DECLARE_STATIC_CALL(__perf_guest_get_ip, *perf_guest_cbs->get_ip);
+DECLARE_STATIC_CALL(__perf_guest_handle_intel_pt_intr, *perf_guest_cbs->handle_intel_pt_intr);
 
-	/* Prevent reloading between a !NULL check and dereferences. */
-	return READ_ONCE(perf_guest_cbs);
-}
 static inline unsigned int perf_guest_state(void)
 {
-	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
-
-	return guest_cbs ? guest_cbs->state() : 0;
+	return static_call(__perf_guest_state)();
 }
 static inline unsigned long perf_guest_get_ip(void)
 {
-	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
-
-	/*
-	 * Arbitrarily return '0' in the unlikely scenario that the callbacks
-	 * are unregistered between checking guest state and getting the IP.
-	 */
-	return guest_cbs ? guest_cbs->get_ip() : 0;
+	return static_call(__perf_guest_get_ip)();
 }
 static inline unsigned int perf_guest_handle_intel_pt_intr(void)
 {
-	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
-
-	if (guest_cbs && guest_cbs->handle_intel_pt_intr)
-		return guest_cbs->handle_intel_pt_intr();
-	return 0;
+	return static_call(__perf_guest_handle_intel_pt_intr)();
 }
 extern void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs);
 extern void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs);
diff --git a/kernel/events/core.c b/kernel/events/core.c
index c6ec05809f54..79c8ee1778a4 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6485,12 +6485,23 @@ static void perf_pending_event(struct irq_work *entry)
 #ifdef CONFIG_GUEST_PERF_EVENTS
 struct perf_guest_info_callbacks *perf_guest_cbs;
 
+DEFINE_STATIC_CALL_RET0(__perf_guest_state, *perf_guest_cbs->state);
+DEFINE_STATIC_CALL_RET0(__perf_guest_get_ip, *perf_guest_cbs->get_ip);
+DEFINE_STATIC_CALL_RET0(__perf_guest_handle_intel_pt_intr, *perf_guest_cbs->handle_intel_pt_intr);
+
 void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
 {
 	if (WARN_ON_ONCE(perf_guest_cbs))
 		return;
 
 	WRITE_ONCE(perf_guest_cbs, cbs);
+	static_call_update(__perf_guest_state, cbs->state);
+	static_call_update(__perf_guest_get_ip, cbs->get_ip);
+
+	/* Implementing ->handle_intel_pt_intr is optional. */
+	if (cbs->handle_intel_pt_intr)
+		static_call_update(__perf_guest_handle_intel_pt_intr,
+				   cbs->handle_intel_pt_intr);
 }
 EXPORT_SYMBOL_GPL(perf_register_guest_info_callbacks);
 
@@ -6500,6 +6511,10 @@ void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
 		return;
 
 	WRITE_ONCE(perf_guest_cbs, NULL);
+	static_call_update(__perf_guest_state, (void *)&__static_call_return0);
+	static_call_update(__perf_guest_get_ip, (void *)&__static_call_return0);
+	static_call_update(__perf_guest_handle_intel_pt_intr,
+			   (void *)&__static_call_return0);
 	synchronize_rcu();
 }
 EXPORT_SYMBOL_GPL(perf_unregister_guest_info_callbacks);
-- 
2.33.0.464.g1972c5931b-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
