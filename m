Return-Path: <SRS0=2pxE=P6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFD08C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Nov 2021 02:13:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B58DA60FA0
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Nov 2021 02:13:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B58DA60FA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oVNoRI2Un9CMWGQoc6L+Jie17ZNAOZltde7fWbZXGzg=; b=AL07ht4hHGwnSW
	Cwdka/NmXvmIrKW4EuDdcSV6R8IPKLtrLmYalVHbyUpF4/UpkhbL8OZhiMTXT41Pn7DCYZZUN7fGr
	bhv5X0i6Yd1oX74PfHLjhXDtAKM0dbOyz9GkorGn7GElaGgf4v8Qx2lmtX3CQUcYdtFQohqyJMiwC
	BJBn0p6VElE2lFPmLx5i6PMSn+TLm1ms6do+WabtYnzxTrZ4VirxMAEFEPTv2C/r3Vv5uxjESztYO
	dAJQ2R3qrbc9/ibCeVcV8qgs0uKI9as5KroRO285/bkfqi/kl0nfastO9uW76JBxdg0laGH10p4ez
	TqbslPNyHaXa3kqI70Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkzas-006nIW-Sk; Thu, 11 Nov 2021 02:13:39 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkzVN-006kWe-DN
 for linux-riscv@lists.infradead.org; Thu, 11 Nov 2021 02:08:02 +0000
Received: by mail-pj1-x104a.google.com with SMTP id
 jx2-20020a17090b46c200b001a62e9db321so2072417pjb.7
 for <linux-riscv@lists.infradead.org>; Wed, 10 Nov 2021 18:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=JkXBJDHAhyFHU3BMn5TxNvn1UhPk279A0oNuAvxWjCs=;
 b=V/Erh1076Wrysqbzd52oPttVcTj86MAahPnKpcTJq7syNcKb6Hfbc1a/qLHtW2aZzM
 ntU7/qAt53ZYhWpyQtDgus9kIEsKyCBHC9Oor9JVcDSlMaafDjmyIjCdZpzvQ66yq2bF
 4Ln7yitJs7J3vTj08rGLJxl/XgscQixibexw/j2isHouYrE3KN5luTSwIyyiHohqB2oM
 DOWc3gmIU3WsnyehgpVge5vIjiQslJURYz13x/vyJ7eIHnvpBJAi8Es5msfqjvngRBal
 GfU5K5lWZJ/c/IOjpQl51jUxu8wnvx5XYX1lWsqsltJUovOqyoHi492zQ3HRq67UjhCi
 YKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=JkXBJDHAhyFHU3BMn5TxNvn1UhPk279A0oNuAvxWjCs=;
 b=gPWdXc1ZMl9icZbRU24Ax15ZyOi1/mgcZ/XNAzuq89M+ZGKA5d6R6BEPe9vAHcpjKp
 +IaBNMavDuolj3zSmTKIMR3cHKXrylrw4xE3Gg1rTeLoH9lW7fxI++6XqN0tOUZwoYnF
 230Q159X33SYNfg7Eqht0IF2BGEAJ/WH+ASO4AsWS35vJoZqaNnMiQodcFsoPBB47r4p
 SZCvEW1vfaTpSQ2Y4qkMd0eSxlbute2txLq+vurJl+iqk6y0oi+B8oWcbFpDMdwYwv1Q
 KHJWClNfvm+/vubIfyJM1PyXcLv9BpuVyqsW2kt6kC+FchD78q1oaZUN0ctRP3XhYsxN
 5Khg==
X-Gm-Message-State: AOAM531C7snqP/E93PF99Xkuz02VYppC7KYSFBjqkKPh1JMQd/dvo3z9
 a4b+uf79whp56HOzA/7suQUllyNCtDg=
X-Google-Smtp-Source: ABdhPJzZG6X7/rhXMvPOUNuiqnAPcfgQCLc1mXz6MzBC0EQ6fiOGWNnuouHOzuVVQb9cOW5lIf9DSbIQyKk=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:a8b:b0:44d:ef7c:94b9
 with SMTP id
 b11-20020a056a000a8b00b0044def7c94b9mr3606208pfl.36.1636596475642; Wed, 10
 Nov 2021 18:07:55 -0800 (PST)
Date: Thu, 11 Nov 2021 02:07:30 +0000
In-Reply-To: <20211111020738.2512932-1-seanjc@google.com>
Message-Id: <20211111020738.2512932-10-seanjc@google.com>
Mime-Version: 1.0
References: <20211111020738.2512932-1-seanjc@google.com>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
Subject: [PATCH v4 09/17] perf/core: Use static_call to optimize
 perf_guest_info_callbacks
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
X-CRM114-CacheID: sfid-20211110_180757_580066_ED7F7069 
X-CRM114-Status: GOOD (  18.43  )
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
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/perf_event.h | 34 ++++++++--------------------------
 kernel/events/core.c       | 15 +++++++++++++++
 2 files changed, 23 insertions(+), 26 deletions(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index ea47ef616ee0..0ac7d867ca0c 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1244,40 +1244,22 @@ extern void perf_event_bpf_event(struct bpf_prog *prog,
 
 #ifdef CONFIG_GUEST_PERF_EVENTS
 extern struct perf_guest_info_callbacks __rcu *perf_guest_cbs;
-static inline struct perf_guest_info_callbacks *perf_get_guest_cbs(void)
-{
-	/*
-	 * Callbacks are RCU-protected and must be READ_ONCE to avoid reloading
-	 * the callbacks between a !NULL check and dereferences, to ensure
-	 * pending stores/changes to the callback pointers are visible before a
-	 * non-NULL perf_guest_cbs is visible to readers, and to prevent a
-	 * module from unloading callbacks while readers are active.
-	 */
-	return rcu_dereference(perf_guest_cbs);
-}
+
+DECLARE_STATIC_CALL(__perf_guest_state, *perf_guest_cbs->state);
+DECLARE_STATIC_CALL(__perf_guest_get_ip, *perf_guest_cbs->get_ip);
+DECLARE_STATIC_CALL(__perf_guest_handle_intel_pt_intr, *perf_guest_cbs->handle_intel_pt_intr);
+
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
index 1c8d341ecc77..b4fd928e4ff8 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6524,12 +6524,23 @@ static void perf_pending_event(struct irq_work *entry)
 #ifdef CONFIG_GUEST_PERF_EVENTS
 struct perf_guest_info_callbacks __rcu *perf_guest_cbs;
 
+DEFINE_STATIC_CALL_RET0(__perf_guest_state, *perf_guest_cbs->state);
+DEFINE_STATIC_CALL_RET0(__perf_guest_get_ip, *perf_guest_cbs->get_ip);
+DEFINE_STATIC_CALL_RET0(__perf_guest_handle_intel_pt_intr, *perf_guest_cbs->handle_intel_pt_intr);
+
 void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
 {
 	if (WARN_ON_ONCE(rcu_access_pointer(perf_guest_cbs)))
 		return;
 
 	rcu_assign_pointer(perf_guest_cbs, cbs);
+	static_call_update(__perf_guest_state, cbs->state);
+	static_call_update(__perf_guest_get_ip, cbs->get_ip);
+
+	/* Implementing ->handle_intel_pt_intr is optional. */
+	if (cbs->handle_intel_pt_intr)
+		static_call_update(__perf_guest_handle_intel_pt_intr,
+				   cbs->handle_intel_pt_intr);
 }
 EXPORT_SYMBOL_GPL(perf_register_guest_info_callbacks);
 
@@ -6539,6 +6550,10 @@ void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
 		return;
 
 	rcu_assign_pointer(perf_guest_cbs, NULL);
+	static_call_update(__perf_guest_state, (void *)&__static_call_return0);
+	static_call_update(__perf_guest_get_ip, (void *)&__static_call_return0);
+	static_call_update(__perf_guest_handle_intel_pt_intr,
+			   (void *)&__static_call_return0);
 	synchronize_rcu();
 }
 EXPORT_SYMBOL_GPL(perf_unregister_guest_info_callbacks);
-- 
2.34.0.rc0.344.g81b53c2807-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
