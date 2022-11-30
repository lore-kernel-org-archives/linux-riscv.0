Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E13C4321E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 00:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZcX/hAexT9p7IcbbR3hOmsbOEyS/bOiaVxw2KoAkiLM=; b=KdmBjpNzx9KFKI
	WClcLFaax7Gugcl/BQYCopCZ7Cl1vz3bxiRy9iie7rgdVhrG0JADfE4dHpR7T0EUsxNex0gmm4fUu
	Oj6IQh1UvgZ0Bi6PEFKegvhSW36FQTx/gAGHvf2Wih96FM3e1FLe9dic2c5kqiRNc9SyI6vZUT44n
	HYZGja241p493dbl2tROdxYeAF9+wQ3hxEK7CViL4E7Ghy5Y6HPeTLN2lPoz8/9huK9S33FOyCGkz
	0yEpH5neFBrYZMzJTG2PV/kfY9+0iPdRgkFPCHDb478GrcDrAkKYQN/wjmoEoWwBEsxWdp/VU/Irf
	NnOTgOubvbTh3gcNKU2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0X5c-003UMX-Cw; Thu, 01 Dec 2022 00:06:08 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Wbf-003Gqn-Ux
	for linux-riscv@bombadil.infradead.org; Wed, 30 Nov 2022 23:35:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7yWYfpXTDQbZLx47MbNcDj0N66CBaR6qG+PnY/I15CM=; b=fDdN6LzKBaVJANCW+1oHCF09cc
	+ZfiuDnHS19OF3i1xLDOT80GTiRieycI2jHoMdHitkQYX+y43uIMSWRM3uMjqG8a2lg00qQI3d4gF
	Ww2NfixQ7004j3DEj6i71P41JNHu9NrZ+M24jPnRWdeoY7JZiM4UYT1fk4y+GpXw2gAy8u7CtDKqz
	By2+WQ8xo2LKCN/UW88vZt4YJY3nrhf00V+Z60DZDOB5hpUM3MZwM0Scd0QMewLNZoGwjc5XYRU/C
	x1+SFo7Sz3aSccpeYak2iL+XRZgbTxUxXVGiKg+hEdAO0qU/Qg83S7fsmPY75unF5gqp42TScEKkO
	XjfhtL7Q==;
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WDP-00FPoG-9R
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 23:10:11 +0000
Received: by mail-pj1-x1049.google.com with SMTP id n9-20020a17090a2bc900b0021010dca313so159197pje.7
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 15:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=7yWYfpXTDQbZLx47MbNcDj0N66CBaR6qG+PnY/I15CM=;
        b=bT3dL2RNgcw1MpeUO77l7FsTfdHMpEPlJatekk/DzFXJMm693HavywTCaGv6OqR75P
         CEGSx4lH9Jtd0fa2semdatuM2+6/GtUmIUJQimOKEXQM8pMgCWT8njsrI/UOhbCPveML
         q4zrbtboaVnIfVEgvLRQEAam2V+r4+zAGV7lL18Zl2LduEOPaMTpPlFnw/B6EsrXnukj
         2pbaAxvJ9zg/7eNsW555x3IFXEMVva/FgAmoY74Di0SuLoDCFLXDc3bBoL6HnnnAq35N
         reo1l2pMb3FCDaYjA4+6K/LTtV98kIt8jz3I1oCTyDyB/5twL2Ezyrmfizfy7s3Xbw19
         DN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7yWYfpXTDQbZLx47MbNcDj0N66CBaR6qG+PnY/I15CM=;
        b=3AIcxI05h3DrqN7FkutWB9r9CfAScEEUc8Ztpp+Ht4MWGIv0HuymZUrZYpa7r2oolA
         3Nz0uVJcA5C/D/+qZY/Ad4YEv+nb4HwUa8J0DDDz90cGSJV/cZNQE64mLstNnJtK3NMq
         uLZAzzyr7j2sRTcp532rdIaLQrFqCiq9S/PuEAObIoJjuEyz5zeRp8ADSLrZM2UzCoth
         Q6rRfg96xOXWO9GJsfyWq62LghvD787rXPAO1iEHqV+iLn/NDSBwWHtOxIWamcWNQgK/
         J/KUUu0ebquXrPq/dpvWr/W+4W6osz4XUrQ/8wyYHXJt4ky9OIbA8oNLvoEfkY+L+NzI
         grSw==
X-Gm-Message-State: ANoB5pkoxbFPACGx5/gtTIrYWt+RalSbQN6fx4AyoX36C6ai8A7ltQps
	ewmHfZBDjc/hP0NGwItV5NmftqNyceY=
X-Google-Smtp-Source: AA0mqf63J5CYVyPrHNleGtfRjvZIjPjkTqLR79wPGUIq9AORVm0CVLKuvvqzhbFB0T9FDbVeahYix13Gv4o=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ee55:b0:176:a16a:417d with SMTP id
 21-20020a170902ee5500b00176a16a417dmr47218439plo.46.1669849797761; Wed, 30
 Nov 2022 15:09:57 -0800 (PST)
Date: Wed, 30 Nov 2022 23:08:56 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-13-seanjc@google.com>
Subject: [PATCH v2 12/50] KVM: VMX: Move Hyper-V eVMCS initialization to helper
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yuan Yao <yuan.yao@intel.com>, 
	Cornelia Huck <cohuck@redhat.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>, Fabiano Rosas <farosas@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Kai Huang <kai.huang@intel.com>, Chao Gao <chao.gao@intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_231007_380941_0F684BC5 
X-CRM114-Status: GOOD (  16.14  )
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

Move Hyper-V's eVMCS initialization to a dedicated helper to clean up
vmx_init(), and add a comment to call out that the Hyper-V init code
doesn't need to be unwound if vmx_init() ultimately fails.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 73 +++++++++++++++++++++++++-----------------
 1 file changed, 43 insertions(+), 30 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index c0de7160700b..b8bf95b9710d 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -523,6 +523,8 @@ static inline void vmx_segment_cache_clear(struct vcpu_vmx *vmx)
 static unsigned long host_idt_base;
 
 #if IS_ENABLED(CONFIG_HYPERV)
+static struct kvm_x86_ops vmx_x86_ops __initdata;
+
 static bool __read_mostly enlightened_vmcs = true;
 module_param(enlightened_vmcs, bool, 0444);
 
@@ -551,6 +553,43 @@ static int hv_enable_l2_tlb_flush(struct kvm_vcpu *vcpu)
 	return 0;
 }
 
+static __init void hv_init_evmcs(void)
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
+			vmx_x86_ops.enable_l2_tlb_flush
+				= hv_enable_l2_tlb_flush;
+
+	} else {
+		enlightened_vmcs = false;
+	}
+}
+
 static void hv_reset_evmcs(void)
 {
 	struct hv_vp_assist_page *vp_ap;
@@ -577,6 +616,7 @@ static void hv_reset_evmcs(void)
 }
 
 #else /* IS_ENABLED(CONFIG_HYPERV) */
+static void hv_init_evmcs(void) {}
 static void hv_reset_evmcs(void) {}
 #endif /* IS_ENABLED(CONFIG_HYPERV) */
 
@@ -8500,38 +8540,11 @@ static int __init vmx_init(void)
 {
 	int r, cpu;
 
-#if IS_ENABLED(CONFIG_HYPERV)
 	/*
-	 * Enlightened VMCS usage should be recommended and the host needs
-	 * to support eVMCS v1 or above. We can also disable eVMCS support
-	 * with module parameter.
+	 * Note, hv_init_evmcs() touches only VMX knobs, i.e. there's nothing
+	 * to unwind if a later step fails.
 	 */
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
-			vmx_x86_ops.enable_l2_tlb_flush
-				= hv_enable_l2_tlb_flush;
-
-	} else {
-		enlightened_vmcs = false;
-	}
-#endif
+	hv_init_evmcs();
 
 	r = kvm_init(&vmx_init_ops, sizeof(struct vcpu_vmx),
 		     __alignof__(struct vcpu_vmx), THIS_MODULE);
-- 
2.38.1.584.g0f3c55d4c2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
