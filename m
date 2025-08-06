Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF345C87FD3
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 20:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eELgIlyVlCgXIPo6adX5GI/Ufvqq77cM9xP5058iTF4=; b=VCAfuW1m9IVoqj
	NzoD5myj4fkhgph+zztGRGFvxuj34eeX9ooxKMLcCLpPj7X3vdgFiHqDiaNfPxoDu78ntK8WM8r7C
	6kDwx7ILxm7HFa70HDBGSRzQVEjYQ5JqO0pth22U4qvFGdwN++aP39xj7wIG/P2cIIjxdfvG4Psn4
	txAQhUFrAviUEbscGj9QtDALVhD4dpZdZyw8hTrmD4RznhEL1jY2xOJSyK49Zq/94o4A+GH6iBghl
	I6jrcA2kRF5tfcJSRJjYbIvAoVfHxzdPypaCOb4O/0a8nEKN3sjMu8sZ+W67+PLd89pTLnwbdRORM
	W2yDxMzxyEBtTLQAvIMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkRJ-0000000GKY1-1paj;
	Wed, 06 Aug 2025 20:08:45 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkGW-0000000GG7W-2ynT
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 19:57:38 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-31eec17b5acso271346a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 06 Aug 2025 12:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510255; x=1755115055; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=rYhmmFtojtIGRiNFVnTHHWtxjI2pG0Wx0DryIldmwBo=;
        b=1hkUl9oZMZ7GTjvvsczRbQZW0C1UmatqowzN7VxNXYm1r4DsEBGlR6IXOivutDw/GC
         8+f7jiMcFqjrkzIjLQi2KXsLnHgd7S/NqFRnA0+HIlmGa3BfD4lENeG70ikLSrvoyLV6
         uxOrvYH2TMpf1k9/uiyP/cvSzLQjtul854/boHqOEtBHU3VoR/jQgE0gtgNm8QK2ryu3
         6ztbUm59iTScipYrqrpK8kBHghMjbdYSwxfy/T8NgnGr7z8dwflue49xt6w1pnRaYPEI
         nh1RGmtmMvEiKPC7gDoLsVBM33tuq4ZlX3re4ZbdSdkMmBefU5F+kyUwxd60O33sAc0r
         VJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510255; x=1755115055;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rYhmmFtojtIGRiNFVnTHHWtxjI2pG0Wx0DryIldmwBo=;
        b=lz4M9hThqZq7U2HbKQJLCWv8bL4oGiikmGG+LK687zfCujQ6PwMOW2R0KAeGFaOzju
         kL+n9rST1F6jmaAqIxxDMo3LVe9OOzdx6+0ZZITqd8BRhSmTilXqqH0h0aUK6x/TVJm/
         fuJpjkEqj5HwrvHwRjwXt9mgM8n9V9018FKLEktHk5sbSZgCBfSzFTe4WA5qQ6/iigRw
         QoAM6BqjzwfnpHgGtxuQ/W07EkfkcZiUGRZwzf4VFP8JyFcX8MEfWJa1YQ+O7+tixrHO
         nwMBCnbiqwdPGy75UivxVpOSTUORmtkg4VIZ+GiK62rt/6H/jEetFiBQ2P0nDa2Gmmjz
         YWxw==
X-Forwarded-Encrypted: i=1; AJvYcCVy3wRT9x3KvCd6W/2lGi88W79pOxA3g02ndOuwHEdafcJNqotozaygDEuyl5tzWcFqflEkS2yCYVZkDQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRZasmUZ2mt4d8S62zPpSkoVJKros2lgOkfwOr44Zxz78+mT9t
	Y4GkHh9MLdG2i84s2qU2///dcaEKQHF9ZGZzBc5hZEZ51T/MBHUKUXH+hoWmctgHGusvDpzaRe6
	iNKlHtQ==
X-Google-Smtp-Source: AGHT+IE1JXMzx+3+mEhB/aRAtKWF6tsabKOHfV9vXr8D6RhEuIeRQytpFLmD0EN42AoRsIYuN8o0xUeAxdE=
X-Received: from pjbso3.prod.google.com ([2002:a17:90b:1f83:b0:311:1a09:11ff])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4ac1:b0:31e:f193:1822
 with SMTP id 98e67ed59e1d1-32166ccac82mr5176638a91.28.1754510255466; Wed, 06
 Aug 2025 12:57:35 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:26 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-5-seanjc@google.com>
Subject: [PATCH v5 04/44] perf: Add APIs to create/release mediated guest vPMUs
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Kan Liang <kan.liang@linux.intel.com>, 
	Yongwei Ma <yongwei.ma@intel.com>, Mingwei Zhang <mizhang@google.com>, 
	Xiong Zhang <xiong.y.zhang@linux.intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_125736_754099_6FFA4C1F 
X-CRM114-Status: GOOD (  21.79  )
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

From: Kan Liang <kan.liang@linux.intel.com>

Currently, exposing PMU capabilities to a KVM guest is done by emulating
guest PMCs via host perf events, i.e. by having KVM be "just" another user
of perf.  As a result, the guest and host are effectively competing for
resources, and emulating guest accesses to vPMU resources requires
expensive actions (expensive relative to the native instruction).  The
overhead and resource competition results in degraded guest performance
and ultimately very poor vPMU accuracy.

To address the issues with the perf-emulated vPMU, introduce a "mediated
vPMU", where the data plane (PMCs and enable/disable knobs) is exposed
directly to the guest, but the control plane (event selectors and access
to fixed counters) is managed by KVM (via MSR interceptions).  To allow
host perf usage of the PMU to (partially) co-exist with KVM/guest usage
of the PMU, KVM and perf will coordinate to a world switch between host
perf context and guest vPMU context near VM-Enter/VM-Exit.

Add two exported APIs, perf_{create,release}_mediated_pmu(), to allow KVM
to create and release a mediated PMU instance (per VM).  Because host perf
context will be deactivated while the guest is running, mediated PMU usage
will be mutually exclusive with perf analysis of the guest, i.e. perf
events that do NOT exclude the guest will not behave as expected.

To avoid silent failure of !exclude_guest perf events, disallow creating a
mediated PMU if there are active !exclude_guest events, and on the perf
side, disallowing creating new !exclude_guest perf events while there is
at least one active mediated PMU.

Exempt PMU resources that do not support mediated PMU usage, i.e. that are
outside the scope/view of KVM's vPMU and will not be swapped out while the
guest is running.

Guard mediated PMU with a new kconfig to help readers identify code paths
that are unique to mediated PMU support, and to allow for adding arch-
specific hooks without stubs.  KVM x86 is expected to be the only KVM
architecture to support a mediated PMU in the near future (e.g. arm64 is
trending toward a partitioned PMU implementation), and KVM x86 will select
PERF_GUEST_MEDIATED_PMU unconditionally, i.e. won't need stubs.

Immediately select PERF_GUEST_MEDIATED_PMU when KVM x86 is enabled so that
all paths are compile tested.  Full KVM support is on its way...

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
[sean: add kconfig and WARNing, rewrite changelog, swizzle patch ordering]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/Kconfig       |  1 +
 include/linux/perf_event.h |  6 +++
 init/Kconfig               |  4 ++
 kernel/events/core.c       | 82 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 93 insertions(+)

diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index 2c86673155c9..ee67357b5e36 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -37,6 +37,7 @@ config KVM_X86
 	select SCHED_INFO
 	select PERF_EVENTS
 	select GUEST_PERF_EVENTS
+	select PERF_GUEST_MEDIATED_PMU
 	select HAVE_KVM_MSI
 	select HAVE_KVM_CPU_RELAX_INTERCEPT
 	select HAVE_KVM_NO_POLL
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index ec9d96025683..63097beb5f02 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -305,6 +305,7 @@ struct perf_event_pmu_context;
 #define PERF_PMU_CAP_EXTENDED_HW_TYPE	0x0100
 #define PERF_PMU_CAP_AUX_PAUSE		0x0200
 #define PERF_PMU_CAP_AUX_PREFER_LARGE	0x0400
+#define PERF_PMU_CAP_MEDIATED_VPMU	0x0800
 
 /**
  * pmu::scope
@@ -1914,6 +1915,11 @@ extern int perf_event_account_interrupt(struct perf_event *event);
 extern int perf_event_period(struct perf_event *event, u64 value);
 extern u64 perf_event_pause(struct perf_event *event, bool reset);
 
+#ifdef CONFIG_PERF_GUEST_MEDIATED_PMU
+int perf_create_mediated_pmu(void);
+void perf_release_mediated_pmu(void);
+#endif
+
 #else /* !CONFIG_PERF_EVENTS: */
 
 static inline void *
diff --git a/init/Kconfig b/init/Kconfig
index 666783eb50ab..1e3c90c3f24f 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1955,6 +1955,10 @@ config GUEST_PERF_EVENTS
 	bool
 	depends on HAVE_PERF_EVENTS
 
+config PERF_GUEST_MEDIATED_PMU
+	bool
+	depends on GUEST_PERF_EVENTS
+
 config PERF_USE_VMALLOC
 	bool
 	help
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 1753a97638a3..bf0347231bd9 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -5651,6 +5651,8 @@ static void __free_event(struct perf_event *event)
 	call_rcu(&event->rcu_head, free_event_rcu);
 }
 
+static void mediated_pmu_unaccount_event(struct perf_event *event);
+
 DEFINE_FREE(__free_event, struct perf_event *, if (_T) __free_event(_T))
 
 /* vs perf_event_alloc() success */
@@ -5660,6 +5662,7 @@ static void _free_event(struct perf_event *event)
 	irq_work_sync(&event->pending_disable_irq);
 
 	unaccount_event(event);
+	mediated_pmu_unaccount_event(event);
 
 	if (event->rb) {
 		/*
@@ -6182,6 +6185,81 @@ u64 perf_event_pause(struct perf_event *event, bool reset)
 }
 EXPORT_SYMBOL_GPL(perf_event_pause);
 
+#ifdef CONFIG_PERF_GUEST_MEDIATED_PMU
+static atomic_t nr_include_guest_events __read_mostly;
+
+static atomic_t nr_mediated_pmu_vms __read_mostly;
+static DEFINE_MUTEX(perf_mediated_pmu_mutex);
+
+/* !exclude_guest event of PMU with PERF_PMU_CAP_MEDIATED_VPMU */
+static inline bool is_include_guest_event(struct perf_event *event)
+{
+	if ((event->pmu->capabilities & PERF_PMU_CAP_MEDIATED_VPMU) &&
+	    !event->attr.exclude_guest)
+		return true;
+
+	return false;
+}
+
+static int mediated_pmu_account_event(struct perf_event *event)
+{
+	if (!is_include_guest_event(event))
+		return 0;
+
+	guard(mutex)(&perf_mediated_pmu_mutex);
+
+	if (atomic_read(&nr_mediated_pmu_vms))
+		return -EOPNOTSUPP;
+
+	atomic_inc(&nr_include_guest_events);
+	return 0;
+}
+
+static void mediated_pmu_unaccount_event(struct perf_event *event)
+{
+	if (!is_include_guest_event(event))
+		return;
+
+	atomic_dec(&nr_include_guest_events);
+}
+
+/*
+ * Currently invoked at VM creation to
+ * - Check whether there are existing !exclude_guest events of PMU with
+ *   PERF_PMU_CAP_MEDIATED_VPMU
+ * - Set nr_mediated_pmu_vms to prevent !exclude_guest event creation on
+ *   PMUs with PERF_PMU_CAP_MEDIATED_VPMU
+ *
+ * No impact for the PMU without PERF_PMU_CAP_MEDIATED_VPMU. The perf
+ * still owns all the PMU resources.
+ */
+int perf_create_mediated_pmu(void)
+{
+	guard(mutex)(&perf_mediated_pmu_mutex);
+	if (atomic_inc_not_zero(&nr_mediated_pmu_vms))
+		return 0;
+
+	if (atomic_read(&nr_include_guest_events))
+		return -EBUSY;
+
+	atomic_inc(&nr_mediated_pmu_vms);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(perf_create_mediated_pmu);
+
+void perf_release_mediated_pmu(void)
+{
+	if (WARN_ON_ONCE(!atomic_read(&nr_mediated_pmu_vms)))
+		return;
+
+	atomic_dec(&nr_mediated_pmu_vms);
+}
+EXPORT_SYMBOL_GPL(perf_release_mediated_pmu);
+#else
+static int mediated_pmu_account_event(struct perf_event *event) { return 0; }
+static void mediated_pmu_unaccount_event(struct perf_event *event) {}
+#endif
+
 /*
  * Holding the top-level event's child_mutex means that any
  * descendant process that has inherited this event will block
@@ -13024,6 +13102,10 @@ perf_event_alloc(struct perf_event_attr *attr, int cpu,
 	if (err)
 		return ERR_PTR(err);
 
+	err = mediated_pmu_account_event(event);
+	if (err)
+		return ERR_PTR(err);
+
 	/* symmetric to unaccount_event() in _free_event() */
 	account_event(event);
 
-- 
2.50.1.565.gc32cd1483b-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
