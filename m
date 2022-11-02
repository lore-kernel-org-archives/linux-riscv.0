Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D3EC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 00:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b95Nl3Ew182XmuYoghWP7x5M+dFow81YoQ7j8ihr7V0=; b=IUr3466O+6zPCb
	hxnotspR7TXq7MlcvuRTp4KKpcwxz12z4I6j3YkwTJ+29cXRghHW/KDdswYEHFvYe+X058TYc63jw
	KGuN4J6xIksGpWtv4WFzDgqmQxIqpP50ZHgJ+YNA9Mf8PnS/OKwcOUGUjvXMyJsai+Qgr8f4W9JSH
	tDDnmHcR2QAoJhIGLh/Bt6CPMfGCxqzsQvCr5uWuNme8riZtSdFCdorOUyKZEHS9AbcAxM5HxP4rH
	+CKruiyp+H37SYvh481F64Vfoj84tptPQFwqt2CFJo2eaKslpR0l8djORGZeBMdiBZOdEPZpLi5jM
	Yfu9r8+p5O4Lq830KREA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqOCU-00FML2-5E; Thu, 03 Nov 2022 00:35:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqO64-00FJ6v-Er
	for linux-riscv@bombadil.infradead.org; Thu, 03 Nov 2022 00:28:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4c2zoa+pA6B5dVM5IIaZmnVQdrF+CmLigOtVMLLIYD8=; b=EG7MlcFzhafTXoWI2TX2DbegwT
	k1cIp33mWirGjV6XQWpUA6zDfAF7YJxDuwFDbeNnEso3WKcQtGk9ZX6jVOJqMtiQzorn16FP6LuAT
	MvdRtJLmYO6+X6Q9MahqzPHMCxm+oQFiDH7ouW3yAyz+RCoGIwNLNHnIS6ENQhMUOZI6GdwYj2KOC
	mCqi2gbbYOVXWlmEpkpABFRugDGDF7YzjBJeTXcKAK5KeOl92NqH9bS1KQFv8vmEn+9RREUWfiqzf
	4OGNUFayPMQmBcPcja1DFu+qByuaM7OdNqlAIrL0SjVoxKMlxv0XpA05R78MM+bAoqGtS4k7atTIQ
	32zapssQ==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN1C-008Wud-Jl
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 23:19:38 +0000
Received: by mail-pj1-x104a.google.com with SMTP id nl16-20020a17090b385000b002138288fd51so2482165pjb.6
        for <linux-riscv@lists.infradead.org>; Wed, 02 Nov 2022 16:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=4c2zoa+pA6B5dVM5IIaZmnVQdrF+CmLigOtVMLLIYD8=;
        b=ECpjGJtbjyyvm3Zkn97le29FJrvdukE8ffHVj2dNk9FAwC++NI0lCVrbf3Opd4TWBf
         7ONE7EX0w7ttmK3YMIoyE2Vh0FaG9SkGVZLCFbXid7ImD6yTFbtqmq7Vw0x0n0YWc1qr
         UvPnlqsBKgTOUZmLDWND50zLAkoG2FqWh124NRVJwySYvacHzZnlXGsktrezCTNW/gFJ
         apDpep1BU4A8VIiFKZFnkDLw7l8sDdIIv36URgpIHyxEBEvEU09NfxgFq/1iQFi4+zri
         llBfs0X8HKEdffCS4sfZ+5suanib1tg9fTY0dlx5A7HaJ0XDgPt9qN3X7bOUhQWSSKhm
         Q5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4c2zoa+pA6B5dVM5IIaZmnVQdrF+CmLigOtVMLLIYD8=;
        b=bmlqNieryhjfFxj4hOIu/3t532WqmDZV/4b6eV98FChiKoPCrR1Ezlo3OLHb29HVc4
         as/ggjyL7X/pmtV6hhoYZxkdpLwcT5HkvfM5lrDryaLP+Uev7W9nF7Qwitxz1f4YlHbX
         rQQdkd39thN55+sezVDHwKXwnfsi2bydfACl2tHOosp7+MlPFIajWf2Nfbj4gLFc41A3
         eoNEM66LJ6JZ2zFpYLMKB0whYFHzgn2WrcPI5fFDp9clabVoZ/wX+eM7RMSj6/9d05S4
         ycBv6vPVpcAOEU+keRNy2/MCk/433yDxIyXI/GPSOT6WxCFvlJHlepTZvOc0ZK4MGlD+
         Wc4g==
X-Gm-Message-State: ACrzQf1Te7YNRCAE+05j6RMEx31lp7P45h5imxzrxVn1XzN0F8jIHps0
	W+Up2PhxuuSVLmf0yN72/7Dr+hTJEl0=
X-Google-Smtp-Source: AMsMyM7u9h/dkayT+hLSeOHW3eyFIXztD8JIQO3WHKnzA+a8+f1OvWCBCQrfKTAJAPpphlP/kzg5suewz9I=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f602:b0:178:9818:48a4 with SMTP id
 n2-20020a170902f60200b00178981848a4mr27063044plg.148.1667431170921; Wed, 02
 Nov 2022 16:19:30 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:18:37 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-11-seanjc@google.com>
Subject: [PATCH 10/44] KVM: VMX: Clean up eVMCS enabling if KVM initialization fails
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Fabiano Rosas <farosas@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Chao Gao <chao.gao@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Yuan Yao <yuan.yao@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_231935_462408_3C0C1413 
X-CRM114-Status: GOOD (  20.97  )
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

To make it obvious that KVM doesn't have a lurking bug, cleanup eVMCS
enabling if kvm_init() fails even though the enabling doesn't strictly
need to be unwound.  eVMCS enabling only toggles values that are fully
contained in the VMX module, i.e. it's technically ok to leave the values
as-is since they'll disappear entirely when the module is unloaded, but
doing proper cleanup is relatively simple, and having a chunk of code
that isn't unwound is confusing.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 137 +++++++++++++++++++++++------------------
 1 file changed, 78 insertions(+), 59 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 05a747c9a9ff..b3fd4049de01 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -524,6 +524,8 @@ static inline void vmx_segment_cache_clear(struct vcpu_vmx *vmx)
 static unsigned long host_idt_base;
 
 #if IS_ENABLED(CONFIG_HYPERV)
+static struct kvm_x86_ops vmx_x86_ops __initdata;
+
 static bool __read_mostly enlightened_vmcs = true;
 module_param(enlightened_vmcs, bool, 0444);
 
@@ -552,6 +554,71 @@ static int hv_enable_direct_tlbflush(struct kvm_vcpu *vcpu)
 	return 0;
 }
 
+static __init void hv_setup_evmcs(void)
+{
+	int cpu;
+
+	if (!enlightened_vmcs)
+		return;
+
+	/*
+	 * Enlightened VMCS usage should be recommended and the host needs
+	 * to support eVMCS v1 or above.
+	 */
+	if (ms_hyperv.hints & HV_X64_ENLIGHTENED_VMCS_RECOMMENDED &&
+	    (ms_hyperv.nested_features & HV_X64_ENLIGHTENED_VMCS_VERSION) >=
+	     KVM_EVMCS_VERSION) {
+
+		/* Check that we have assist pages on all online CPUs */
+		for_each_online_cpu(cpu) {
+			if (!hv_get_vp_assist_page(cpu)) {
+				enlightened_vmcs = false;
+				break;
+			}
+		}
+
+		if (enlightened_vmcs) {
+			pr_info("KVM: vmx: using Hyper-V Enlightened VMCS\n");
+			static_branch_enable(&enable_evmcs);
+		}
+
+		if (ms_hyperv.nested_features & HV_X64_NESTED_DIRECT_FLUSH)
+			vmx_x86_ops.enable_direct_tlbflush
+				= hv_enable_direct_tlbflush;
+
+	} else {
+		enlightened_vmcs = false;
+	}
+}
+static void hv_cleanup_evmcs(void)
+{
+	struct hv_vp_assist_page *vp_ap;
+	int cpu;
+
+	if (!static_branch_unlikely(&enable_evmcs))
+		return;
+
+	/*
+	 * Reset everything to support using non-enlightened VMCS access later
+	 * (e.g. when we reload the module with enlightened_vmcs=0)
+	 */
+	for_each_online_cpu(cpu) {
+		vp_ap =	hv_get_vp_assist_page(cpu);
+
+		if (!vp_ap)
+			continue;
+
+		vp_ap->nested_control.features.directhypercall = 0;
+		vp_ap->current_nested_vmcs = 0;
+		vp_ap->enlighten_vmentry = 0;
+	}
+
+	static_branch_disable(&enable_evmcs);
+}
+
+#else /* IS_ENABLED(CONFIG_HYPERV) */
+static void hv_setup_evmcs(void) {}
+static void hv_cleanup_evmcs(void) {}
 #endif /* IS_ENABLED(CONFIG_HYPERV) */
 
 /*
@@ -8435,29 +8502,8 @@ static void vmx_exit(void)
 
 	kvm_exit();
 
-#if IS_ENABLED(CONFIG_HYPERV)
-	if (static_branch_unlikely(&enable_evmcs)) {
-		int cpu;
-		struct hv_vp_assist_page *vp_ap;
-		/*
-		 * Reset everything to support using non-enlightened VMCS
-		 * access later (e.g. when we reload the module with
-		 * enlightened_vmcs=0)
-		 */
-		for_each_online_cpu(cpu) {
-			vp_ap =	hv_get_vp_assist_page(cpu);
+	hv_cleanup_evmcs();
 
-			if (!vp_ap)
-				continue;
-
-			vp_ap->nested_control.features.directhypercall = 0;
-			vp_ap->current_nested_vmcs = 0;
-			vp_ap->enlighten_vmentry = 0;
-		}
-
-		static_branch_disable(&enable_evmcs);
-	}
-#endif
 	vmx_cleanup_l1d_flush();
 
 	allow_smaller_maxphyaddr = false;
@@ -8468,43 +8514,12 @@ static int __init vmx_init(void)
 {
 	int r, cpu;
 
-#if IS_ENABLED(CONFIG_HYPERV)
-	/*
-	 * Enlightened VMCS usage should be recommended and the host needs
-	 * to support eVMCS v1 or above. We can also disable eVMCS support
-	 * with module parameter.
-	 */
-	if (enlightened_vmcs &&
-	    ms_hyperv.hints & HV_X64_ENLIGHTENED_VMCS_RECOMMENDED &&
-	    (ms_hyperv.nested_features & HV_X64_ENLIGHTENED_VMCS_VERSION) >=
-	    KVM_EVMCS_VERSION) {
-
-		/* Check that we have assist pages on all online CPUs */
-		for_each_online_cpu(cpu) {
-			if (!hv_get_vp_assist_page(cpu)) {
-				enlightened_vmcs = false;
-				break;
-			}
-		}
-
-		if (enlightened_vmcs) {
-			pr_info("KVM: vmx: using Hyper-V Enlightened VMCS\n");
-			static_branch_enable(&enable_evmcs);
-		}
-
-		if (ms_hyperv.nested_features & HV_X64_NESTED_DIRECT_FLUSH)
-			vmx_x86_ops.enable_direct_tlbflush
-				= hv_enable_direct_tlbflush;
-
-	} else {
-		enlightened_vmcs = false;
-	}
-#endif
+	hv_setup_evmcs();
 
 	r = kvm_init(&vmx_init_ops, sizeof(struct vcpu_vmx),
 		     __alignof__(struct vcpu_vmx), THIS_MODULE);
 	if (r)
-		return r;
+		goto err_kvm_init;
 
 	/*
 	 * Must be called after kvm_init() so enable_ept is properly set
@@ -8514,10 +8529,8 @@ static int __init vmx_init(void)
 	 * mitigation mode.
 	 */
 	r = vmx_setup_l1d_flush(vmentry_l1d_flush_param);
-	if (r) {
-		vmx_exit();
-		return r;
-	}
+	if (r)
+		goto err_l1d_flush;
 
 	vmx_setup_fb_clear_ctrl();
 
@@ -8542,5 +8555,11 @@ static int __init vmx_init(void)
 		allow_smaller_maxphyaddr = true;
 
 	return 0;
+
+err_l1d_flush:
+	vmx_exit();
+err_kvm_init:
+	hv_cleanup_evmcs();
+	return r;
 }
 module_init(vmx_init);
-- 
2.38.1.431.g37b22c650d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
