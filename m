Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D95AC4321E
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 23:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XCwsuwhWeNaQ/cJ78pGAuTMYwVhLE464LXgQXrzp6n0=; b=Z2eqEXdQO/l0Ie
	eGmogl/zDjTtvmWMmRy60PfgO1AvS2kuUBZ4PWnVhppO+6eGKmAKBxwrC4ojqMkYwCOiKh0jTmt1f
	Lh1E1KeQmv+g802IZvf0rMqNRRBBCSM4OdzamxI1MNLGAz0xhZ7eZhK773jAvE6IUV5d47ag3WkTJ
	NaBNCunxUCFprXkBZRqkaTeoS+3rQ/rjct3bbinYt0doTmWmPIyrEKab0o6Zurc9uh63wIasFXgo2
	SHgyXZ7MgS36i7qPgtw7K5aEQWYD9M7BU/VO4w6RUXcaOygQ2yS2Yb3SSSv+zFoXeBRzjhn2nPP8A
	lRXOy3jX3EGo6IWm1O9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Wrf-003Ntu-Qq; Wed, 30 Nov 2022 23:51:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WUe-003E7h-9V
	for linux-riscv@bombadil.infradead.org; Wed, 30 Nov 2022 23:27:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=esfNuzSAi/jMqEjqcJNo6bIy6sJwzrzidHm2yeELoEE=; b=hUVLHnmAI2toz7B1xEVlvq1azo
	J5vta0qEwafCIKbe0f/ny9nGWKrK3itmEP03gc3boYW03TvOnRcv6tOazAnXPZW17LdHBN+RCuh97
	cATRhceGlJ5uoKtR/f1XlQCQ8LTUybxpePDmj+HF3MR3cZ1H8HYk2DCn3ME2TpFdD1i7+hkN1Vwdt
	SpJrFqTQgk0mwBqYd4k10NoKzHQM3PR9gNQx5cMx3S/prRGJS5M934fA1UNpq8nKrNqYbma9uYVm4
	qloX5+cpmXj+0FP5eD+165hNh06Xw9sDn7sGJVU0sY2qfT4ACP2d5DkZQrYNbx8foMabAsv29fYKj
	EaJFwZbg==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WDG-006B72-9p
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 23:10:05 +0000
Received: by mail-pj1-x104a.google.com with SMTP id md9-20020a17090b23c900b00218fa3308a9so155916pjb.8
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 15:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=esfNuzSAi/jMqEjqcJNo6bIy6sJwzrzidHm2yeELoEE=;
        b=RHjA8cOArqP2LyeykqmAhEEzgihArYtCw4eZPNsGjabk6EQQDpguK3dzIBeh0ut2C7
         PPDN/VqxLVg8WLs42m8fnp/J4Rw/PqEx2bEWgR/G8bafWlBBHGcYbV6d5pPiGmkb2pzW
         9MQwIZ/R/X2SvMhJdYca9rHP411MfEi5HhKen+9TmeridULcN9q+xVvOizSgO5aHdLNB
         OfUR1PLANgTJwrCH2LfR2DV1ZiL4M/R+MN/04sld9hh0pGP7jhvIgwq004EtxJ2aer+5
         G+wvXxp+5g9bTFYHRVhBvg6+cjfBRSwHIVy9QtEk1wovK+KCS0HL1G3XNYXWGocr8Ait
         87XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=esfNuzSAi/jMqEjqcJNo6bIy6sJwzrzidHm2yeELoEE=;
        b=tJiX7K1+7Jlx0XUyJqvg/CpegC9USJiPU4GzKDEpWLvdMxTYIJDBaRMU+SveYy0cTW
         2RTY6rdvCh+ErSKa+j3nqlLyGFAxQFxWyeUJI4CY9J/aMeVAVIyjMPS0eW0+6wAB6vbx
         4ftLHREGr12v4ZOIilFypcajrkGTfJSKefNwS45dYjtCXHSwV7fsOHqRrlHQQADIQLc4
         L5One75AB/jrVFWZ7QNNm5RSVY6qjKydiaoWfIngA9dAdle267P1JlijFYLWL0kLiwBP
         L41GoOkEaxteCXNxq31JLAfkFgO8Dx/Pnd/via9KSjKSu6Hht7v2d5d/Tbwqw4/F9euF
         XwIg==
X-Gm-Message-State: ANoB5pnvKbTV4wmuJsDd1/TB1PUQqxDEPbxsqai0Et+8iTLZj/2umW4k
	eUrnivufqdmuJrt3HeO7Vpar7VlSs2Q=
X-Google-Smtp-Source: AA0mqf6VCCRS4k0TLjDpnoby5i4cra48ljK8Gw56qbYi0tKiUNfM4Har78Bt4viDX2riIS5uhRMjlWJGOTo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:238b:b0:219:7904:6de with SMTP id
 mr11-20020a17090b238b00b00219790406demr111983pjb.136.1669849791256; Wed, 30
 Nov 2022 15:09:51 -0800 (PST)
Date: Wed, 30 Nov 2022 23:08:52 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-9-seanjc@google.com>
Subject: [PATCH v2 08/50] KVM: x86: Move hardware setup/unsetup to init/exit
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
X-CRM114-CacheID: sfid-20221130_230958_670545_21D69B02 
X-CRM114-Status: GOOD (  17.43  )
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

Now that kvm_arch_hardware_setup() is called immediately after
kvm_arch_init(), fold the guts of kvm_arch_hardware_(un)setup() into
kvm_arch_{init,exit}() as a step towards dropping one of the hooks.

To avoid having to unwind various setup, e.g registration of several
notifiers, slot in the vendor hardware setup before the registration of
said notifiers and callbacks.  Introducing a functional change while
moving code is less than ideal, but the alternative is adding a pile of
unwinding code, which is much more error prone, e.g. several attempts to
move the setup code verbatim all introduced bugs.

Add a comment to document that kvm_ops_update() is effectively the point
of no return, e.g. it sets the kvm_x86_ops.hardware_enable canary and so
needs to be unwound.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 121 +++++++++++++++++++++++----------------------
 1 file changed, 63 insertions(+), 58 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index a873618564cd..fe5f2e49b5eb 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9258,6 +9258,24 @@ static struct notifier_block pvclock_gtod_notifier = {
 };
 #endif
 
+static inline void kvm_ops_update(struct kvm_x86_init_ops *ops)
+{
+	memcpy(&kvm_x86_ops, ops->runtime_ops, sizeof(kvm_x86_ops));
+
+#define __KVM_X86_OP(func) \
+	static_call_update(kvm_x86_##func, kvm_x86_ops.func);
+#define KVM_X86_OP(func) \
+	WARN_ON(!kvm_x86_ops.func); __KVM_X86_OP(func)
+#define KVM_X86_OP_OPTIONAL __KVM_X86_OP
+#define KVM_X86_OP_OPTIONAL_RET0(func) \
+	static_call_update(kvm_x86_##func, (void *)kvm_x86_ops.func ? : \
+					   (void *)__static_call_return0);
+#include <asm/kvm-x86-ops.h>
+#undef __KVM_X86_OP
+
+	kvm_pmu_ops_update(ops->pmu_ops);
+}
+
 int kvm_arch_init(void *opaque)
 {
 	struct kvm_x86_init_ops *ops = opaque;
@@ -9331,6 +9349,24 @@ int kvm_arch_init(void *opaque)
 		kvm_caps.supported_xcr0 = host_xcr0 & KVM_SUPPORTED_XCR0;
 	}
 
+	rdmsrl_safe(MSR_EFER, &host_efer);
+
+	if (boot_cpu_has(X86_FEATURE_XSAVES))
+		rdmsrl(MSR_IA32_XSS, host_xss);
+
+	kvm_init_pmu_capability();
+
+	r = ops->hardware_setup();
+	if (r != 0)
+		goto out_mmu_exit;
+
+	/*
+	 * Point of no return!  DO NOT add error paths below this point unless
+	 * absolutely necessary, as most operations from this point forward
+	 * require unwinding.
+	 */
+	kvm_ops_update(ops);
+
 	kvm_timer_init();
 
 	if (pi_inject_timer == -1)
@@ -9342,8 +9378,32 @@ int kvm_arch_init(void *opaque)
 		set_hv_tscchange_cb(kvm_hyperv_tsc_notifier);
 #endif
 
+	kvm_register_perf_callbacks(ops->handle_intel_pt_intr);
+
+	if (!kvm_cpu_cap_has(X86_FEATURE_XSAVES))
+		kvm_caps.supported_xss = 0;
+
+#define __kvm_cpu_cap_has(UNUSED_, f) kvm_cpu_cap_has(f)
+	cr4_reserved_bits = __cr4_reserved_bits(__kvm_cpu_cap_has, UNUSED_);
+#undef __kvm_cpu_cap_has
+
+	if (kvm_caps.has_tsc_control) {
+		/*
+		 * Make sure the user can only configure tsc_khz values that
+		 * fit into a signed integer.
+		 * A min value is not calculated because it will always
+		 * be 1 on all machines.
+		 */
+		u64 max = min(0x7fffffffULL,
+			      __scale_tsc(kvm_caps.max_tsc_scaling_ratio, tsc_khz));
+		kvm_caps.max_guest_tsc_khz = max;
+	}
+	kvm_caps.default_tsc_scaling_ratio = 1ULL << kvm_caps.tsc_scaling_ratio_frac_bits;
+	kvm_init_msr_list();
 	return 0;
 
+out_mmu_exit:
+	kvm_mmu_vendor_module_exit();
 out_free_percpu:
 	free_percpu(user_return_msrs);
 out_free_x86_emulator_cache:
@@ -9353,6 +9413,8 @@ int kvm_arch_init(void *opaque)
 
 void kvm_arch_exit(void)
 {
+	kvm_unregister_perf_callbacks();
+
 #ifdef CONFIG_X86_64
 	if (hypervisor_is_type(X86_HYPER_MS_HYPERV))
 		clear_hv_tscchange_cb();
@@ -9368,6 +9430,7 @@ void kvm_arch_exit(void)
 	irq_work_sync(&pvclock_irq_work);
 	cancel_work_sync(&pvclock_gtod_work);
 #endif
+	static_call(kvm_x86_hardware_unsetup)();
 	kvm_x86_ops.hardware_enable = NULL;
 	kvm_mmu_vendor_module_exit();
 	free_percpu(user_return_msrs);
@@ -11957,72 +12020,14 @@ void kvm_arch_hardware_disable(void)
 	drop_user_return_notifiers();
 }
 
-static inline void kvm_ops_update(struct kvm_x86_init_ops *ops)
-{
-	memcpy(&kvm_x86_ops, ops->runtime_ops, sizeof(kvm_x86_ops));
-
-#define __KVM_X86_OP(func) \
-	static_call_update(kvm_x86_##func, kvm_x86_ops.func);
-#define KVM_X86_OP(func) \
-	WARN_ON(!kvm_x86_ops.func); __KVM_X86_OP(func)
-#define KVM_X86_OP_OPTIONAL __KVM_X86_OP
-#define KVM_X86_OP_OPTIONAL_RET0(func) \
-	static_call_update(kvm_x86_##func, (void *)kvm_x86_ops.func ? : \
-					   (void *)__static_call_return0);
-#include <asm/kvm-x86-ops.h>
-#undef __KVM_X86_OP
-
-	kvm_pmu_ops_update(ops->pmu_ops);
-}
-
 int kvm_arch_hardware_setup(void *opaque)
 {
-	struct kvm_x86_init_ops *ops = opaque;
-	int r;
-
-	rdmsrl_safe(MSR_EFER, &host_efer);
-
-	if (boot_cpu_has(X86_FEATURE_XSAVES))
-		rdmsrl(MSR_IA32_XSS, host_xss);
-
-	kvm_init_pmu_capability();
-
-	r = ops->hardware_setup();
-	if (r != 0)
-		return r;
-
-	kvm_ops_update(ops);
-
-	kvm_register_perf_callbacks(ops->handle_intel_pt_intr);
-
-	if (!kvm_cpu_cap_has(X86_FEATURE_XSAVES))
-		kvm_caps.supported_xss = 0;
-
-#define __kvm_cpu_cap_has(UNUSED_, f) kvm_cpu_cap_has(f)
-	cr4_reserved_bits = __cr4_reserved_bits(__kvm_cpu_cap_has, UNUSED_);
-#undef __kvm_cpu_cap_has
-
-	if (kvm_caps.has_tsc_control) {
-		/*
-		 * Make sure the user can only configure tsc_khz values that
-		 * fit into a signed integer.
-		 * A min value is not calculated because it will always
-		 * be 1 on all machines.
-		 */
-		u64 max = min(0x7fffffffULL,
-			      __scale_tsc(kvm_caps.max_tsc_scaling_ratio, tsc_khz));
-		kvm_caps.max_guest_tsc_khz = max;
-	}
-	kvm_caps.default_tsc_scaling_ratio = 1ULL << kvm_caps.tsc_scaling_ratio_frac_bits;
-	kvm_init_msr_list();
 	return 0;
 }
 
 void kvm_arch_hardware_unsetup(void)
 {
-	kvm_unregister_perf_callbacks();
 
-	static_call(kvm_x86_hardware_unsetup)();
 }
 
 int kvm_arch_check_processor_compat(void *opaque)
-- 
2.38.1.584.g0f3c55d4c2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
