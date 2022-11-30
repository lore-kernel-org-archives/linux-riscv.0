Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19064C352A1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 23:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=15jShYNfPVGDw5/USo1G5uUQvotDhUC/cj2mTxSTlbU=; b=mXzz39OSmhYr43
	8tA5vjb7DR/D7IYpOZ3fF9spuUL909DzgjMT0Whuj4Ma1w65ki1zXvX0NNOHeUxa0jBpTvgc8uoAq
	bFq9WROEYH7hJsv+XMY6YR7pgBnI//kKcOyDkjdbnBHeqgMMMfwXFRfAAo0y7/YVXlFAKKBgKw642
	1bJiQQTEhdcKMX9D9Va1RUZSUMqQitseCMI4fyz5tDXS1tDyGJBXIZLoZ8auvrZA9uiwcwq92hRy1
	+BYFmfR++2EEjPq2Rarm3XS2v4fn/OzLr0CzT3v7eKR64/VvTdI4UrfanqOtxzbwhgIYrCqpZNRZt
	2qjBXK4AmLpQwdT5+GDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WbP-003GqD-TS; Wed, 30 Nov 2022 23:34:56 +0000
Received: from mail-vk1-xa49.google.com ([2607:f8b0:4864:20::a49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WLE-003ADh-3u
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 23:18:13 +0000
Received: by mail-vk1-xa49.google.com with SMTP id 64-20020a1f1343000000b003b84e2caf6aso65342vkt.5
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 15:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=gGlMYVi+8cq5eUoZ5sdih51J8dbFvJ7SNZIQRLoo5uo=;
        b=fV1/K+jF8pmsrix+k0p4fqdMLOZW46RiubsdWwI2sgpOZ9mSf0o8kQB+E0gdgHGg9/
         eAw8H+6GYUyvY58pud7hGaMaECg17r4h3ufqi+AQiO/cd2K2PsiQx/t0E+ow2b29O1kq
         mE9Nc5EOzaOOCFpHTdWVwQd3VK8VqaamiQrK4JT5brdDF2lU7pSMAn1NZk1aO9R2/+nZ
         HvMEU0WPaG/hIKRtGO8ZlmpBj18ocxONAB+T3MZL6DtiiV1jniXaBXq2MSSMS+Eff7NV
         6zujBbiUfcV5uJuTUyGLRufJIGyZXhMyG5dt8JA41iQvZmB19fSGzEz6eLd/dvmJ66Ev
         FrGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gGlMYVi+8cq5eUoZ5sdih51J8dbFvJ7SNZIQRLoo5uo=;
        b=vfdGwvdIaihjtIQuOkP/eejrZakYnxHMoQaiNd4qZXix4Y06bzsH634q0ACQQty7j0
         LO5EzVSQ0zUvwiyrN8BUluWdey/ntsOUMOJT+CTCcX69LovKzipkd8MZjYvkDi9Q7TEh
         AU8mVO8T3j82sT94HjyKVdFvUFu3OFnFKYTY3g51yqxB+fbN05wAkT7plurzFJRmdxfb
         JPoVSiL8JjOdQ/kWRqTMea+EMz857NkQNJSO8bzEsELsDPM3NiNBw7weDOFiusObnd9Q
         jOUYlMVE8yEFTt0kMTs9Df9E1qFEYB92lt4DGISHFWLpbU3RWDZ/D+aDZA3xDrIGx52B
         as+w==
X-Gm-Message-State: ANoB5pl6xrP2KxATQBsCRJ/XsMYboJ5RhYU/0ZXg3Nq6jNwN3o2SKvBd
	rrZ0i4xWSK7/MeGsn3MpMsckLRkdtA4=
X-Google-Smtp-Source: AA0mqf7tkua9h/cWBirbpjwcNsrjWIz0JrBzEezpRIm7lfNzo4PInvRMnHehpz73z+PXMVC4o8EwEkWCrGc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:aa7:8bc1:0:b0:575:bfb9:b1fa with SMTP id
 s1-20020aa78bc1000000b00575bfb9b1famr7675712pfd.62.1669849831189; Wed, 30 Nov
 2022 15:10:31 -0800 (PST)
Date: Wed, 30 Nov 2022 23:09:15 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-32-seanjc@google.com>
Subject: [PATCH v2 31/50] KVM: x86: Do CPU compatibility checks in x86 code
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
X-CRM114-CacheID: sfid-20221130_151812_200969_1DA1BE33 
X-CRM114-Status: GOOD (  15.17  )
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

Move the CPU compatibility checks to pure x86 code, i.e. drop x86's use
of the common kvm_x86_check_cpu_compat() arch hook.  x86 is the only
architecture that "needs" to do per-CPU compatibility checks, moving
the logic to x86 will allow dropping the common code, and will also
give x86 more control over when/how the compatibility checks are
performed, e.g. TDX will need to enable hardware (do VMXON) in order to
perform compatibility checks.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/svm.c |  2 +-
 arch/x86/kvm/vmx/vmx.c |  2 +-
 arch/x86/kvm/x86.c     | 49 ++++++++++++++++++++++++++++++++----------
 3 files changed, 40 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 19e81a99c58f..d7ea1c1175c2 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -5103,7 +5103,7 @@ static int __init svm_init(void)
 	 * Common KVM initialization _must_ come last, after this, /dev/kvm is
 	 * exposed to userspace!
 	 */
-	r = kvm_init(&svm_init_ops, sizeof(struct vcpu_svm),
+	r = kvm_init(NULL, sizeof(struct vcpu_svm),
 		     __alignof__(struct vcpu_svm), THIS_MODULE);
 	if (r)
 		goto err_kvm_init;
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 654d81f781da..8deb1bd60c10 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -8592,7 +8592,7 @@ static int __init vmx_init(void)
 	 * Common KVM initialization _must_ come last, after this, /dev/kvm is
 	 * exposed to userspace!
 	 */
-	r = kvm_init(&vmx_init_ops, sizeof(struct vcpu_vmx),
+	r = kvm_init(NULL, sizeof(struct vcpu_vmx),
 		     __alignof__(struct vcpu_vmx), THIS_MODULE);
 	if (r)
 		goto err_kvm_init;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 66f16458aa97..3571bc968cf8 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9277,10 +9277,36 @@ static inline void kvm_ops_update(struct kvm_x86_init_ops *ops)
 	kvm_pmu_ops_update(ops->pmu_ops);
 }
 
+struct kvm_cpu_compat_check {
+	struct kvm_x86_init_ops *ops;
+	int *ret;
+};
+
+static int kvm_x86_check_processor_compatibility(struct kvm_x86_init_ops *ops)
+{
+	struct cpuinfo_x86 *c = &cpu_data(smp_processor_id());
+
+	WARN_ON(!irqs_disabled());
+
+	if (__cr4_reserved_bits(cpu_has, c) !=
+	    __cr4_reserved_bits(cpu_has, &boot_cpu_data))
+		return -EIO;
+
+	return ops->check_processor_compatibility();
+}
+
+static void kvm_x86_check_cpu_compat(void *data)
+{
+	struct kvm_cpu_compat_check *c = data;
+
+	*c->ret = kvm_x86_check_processor_compatibility(c->ops);
+}
+
 static int __kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
 {
+	struct kvm_cpu_compat_check c;
 	u64 host_pat;
-	int r;
+	int r, cpu;
 
 	if (kvm_x86_ops.hardware_enable) {
 		pr_err("kvm: already loaded vendor module '%s'\n", kvm_x86_ops.name);
@@ -9360,6 +9386,14 @@ static int __kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
 	if (r != 0)
 		goto out_mmu_exit;
 
+	c.ret = &r;
+	c.ops = ops;
+	for_each_online_cpu(cpu) {
+		smp_call_function_single(cpu, kvm_x86_check_cpu_compat, &c, 1);
+		if (r < 0)
+			goto out_hardware_unsetup;
+	}
+
 	/*
 	 * Point of no return!  DO NOT add error paths below this point unless
 	 * absolutely necessary, as most operations from this point forward
@@ -9402,6 +9436,8 @@ static int __kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
 	kvm_init_msr_list();
 	return 0;
 
+out_hardware_unsetup:
+	ops->runtime_ops->hardware_unsetup();
 out_mmu_exit:
 	kvm_mmu_vendor_module_exit();
 out_free_percpu:
@@ -12037,16 +12073,7 @@ void kvm_arch_hardware_disable(void)
 
 int kvm_arch_check_processor_compat(void *opaque)
 {
-	struct cpuinfo_x86 *c = &cpu_data(smp_processor_id());
-	struct kvm_x86_init_ops *ops = opaque;
-
-	WARN_ON(!irqs_disabled());
-
-	if (__cr4_reserved_bits(cpu_has, c) !=
-	    __cr4_reserved_bits(cpu_has, &boot_cpu_data))
-		return -EIO;
-
-	return ops->check_processor_compatibility();
+	return 0;
 }
 
 bool kvm_vcpu_is_reset_bsp(struct kvm_vcpu *vcpu)
-- 
2.38.1.584.g0f3c55d4c2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
