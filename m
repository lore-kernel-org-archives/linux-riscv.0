Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE08AC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 00:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MTRFJCIr5NmRD+Ei+r/NNDb0f8/8KmDGDngsosLVpF0=; b=GrpE4/x6cvWc4E
	VaJk4o5qq+xVTpQbDF3hw298El1bqPWdn/r72ns/7DBidAwXZT/KMEbdLFt3YOE7S12qs38qXxXj6
	KFKQC4hw6SszDVbbLNYSLSyLdFjBorSWmefurbhP9zoEi0bXWAIdqcZNuwo2GBafwjwm88HNhsjgd
	GulGC9dnvGa7no+v9pHX0WR0fNig3MxncnL3P98Eko9XziHG/XkW4+F1+/INuVJE2R3r8kL/I003A
	iNnBhEXfv742lAdHEnpC6bSGU9sy+hUiQ05x/GDgNyPXE7Y9OdesJM4dVFZ6h5YUzDsgmxLyrQsWW
	f2wFSC9YkvAwscf59R4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqO5c-00FJCY-6Q; Thu, 03 Nov 2022 00:28:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqO5a-00FJ6v-34
	for linux-riscv@bombadil.infradead.org; Thu, 03 Nov 2022 00:28:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nvDOwkn7hwg+zfvJUXf8AHfTsU5S0iCSbbYe/XAvrQI=; b=eK4G8CEV8GcAm56m1qj4jeQSeu
	D4EbblcP1AmbvXn85cISS+JtT+nGf+XsgUF+LEA6IDHvAxrIRSVOa1sfEYsV83YuoMGqkJe0wVmfX
	WDwMHqKSxZNhG72sLKLkF7RoyLSgi3WNoI44Bjw1G0cY8xctvALsozzUenwSf1k2f6FmnX7jvLZxY
	K3Zl+Q1NX7Dk2bHAy4gwZV/YXLIONeaAKY4nd12gb2+CUYM7+EU8LE3adq8u4/A8dtYdZClvxe/br
	0AcSZdFebh6UpQDZoV8Lb93ywC7cl9DpSlOWP7/iP1nVXOzP1tLApuJ9LGad0b5pzvUjaahJlDvMc
	ZfNnRpOQ==;
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN25-008X29-EJ
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 23:20:31 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 204-20020a250fd5000000b006ccc0e91098so359092ybp.13
        for <linux-riscv@lists.infradead.org>; Wed, 02 Nov 2022 16:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=nvDOwkn7hwg+zfvJUXf8AHfTsU5S0iCSbbYe/XAvrQI=;
        b=kPsyz565Bs3nWd/vXeOuSWMgvIdI7+RJdtnuc0znmJIjMQ8uzXLRwKs8W7PumGf1FB
         TInnWKg6dZjNDAKuYUbWAGztsfGiZ+tk8yY6bKPVrq1xzztMo8xlFpqIJ6lhzJTHDPrm
         lou7lyJZKFxoJ8wozjn3uJXVRhz+EYknGTCWfTAQUsNnFbSP/SLgEfh6MyRvKfldCG8U
         pqOyiOjbRpZeYdvtQ7S7c4kgRIPHFaJSoTRioybyXKPMMU3h/v/TNXPFUOrsn8FChvzn
         JAwsqVkjZPDDeC2WWvWJ0112+KgndOYyfFTaXcofTGWmMGiul8k48NIfwWZFm0EpNX4X
         UhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nvDOwkn7hwg+zfvJUXf8AHfTsU5S0iCSbbYe/XAvrQI=;
        b=7GWGyEUu5ZnSDoXcaTxLOsyDVOlTOsENgsxoBGRQiC2rDVnhCbF4crW87yjC8vzqyc
         tUmDF68LHbzJCVXDOZncog+/dZ9DXE26hhHH8seUDNfFSXyRHW5p2Re8otFKTNp4ZiFS
         X6jPDs157Ishn18YdSufsmM3eg8itrOP2CU0rWk/v35cxZB7YBC4FsLRyBlugzElMVDy
         QNdAjxr1jqhHCt6cNK4M1MN5rzyAtGQWmHttYktdzPuFpeDvFnPBrU/GJ0DdSKQoMRWw
         Zz/yak4INI5VJgwrkVC20tRBLWmwTjUZKERetUHTAG0OuaezwdhL33w+7ohPF4DQfJaa
         Avwg==
X-Gm-Message-State: ACrzQf06jOZ65RdPCZyJeZ0/6ku3hYrkC/1rZbfUho5nTFrulX9FaWk2
	Wlqsq9VHMAv8FWmcuhJeS/ttmJEpfrk=
X-Google-Smtp-Source: AMsMyM5eowv7lcJiOd868nUuFM6ikjnC3RuvYPPk5CroI1jtu45SCXqk7PcUOxGjfgiO1DuVsExFVnovkSQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:b9b:b0:367:7d5a:3403 with SMTP id
 ck27-20020a05690c0b9b00b003677d5a3403mr179885ywb.148.1667431228175; Wed, 02
 Nov 2022 16:20:28 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:19:10 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-44-seanjc@google.com>
Subject: [PATCH 43/44] KVM: Register syscore (suspend/resume) ops early in kvm_init()
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
X-CRM114-CacheID: sfid-20221102_232029_601105_3270750B 
X-CRM114-Status: GOOD (  15.11  )
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

Register the suspend/resume notifier hooks at the same time KVM registers
its reboot notifier so that all the code in kvm_init() that deals with
enabling/disabling hardware is bundled together.  Opportunstically move
KVM's implementations to reside near the reboot notifier code for the
same reason.

Bunching the code together will allow architectures to opt out of KVM's
generic hardware enable/disable logic with minimal #ifdeffery.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 64 ++++++++++++++++++++++-----------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index a18296ee731b..859bc27091cd 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5142,6 +5142,36 @@ static struct notifier_block kvm_reboot_notifier = {
 	.priority = 0,
 };
 
+static int kvm_suspend(void)
+{
+	/*
+	 * Secondary CPUs and CPU hotplug are disabled across the suspend/resume
+	 * callbacks, i.e. no need to acquire kvm_lock to ensure the usage count
+	 * is stable.  Assert that kvm_lock is not held as a paranoid sanity
+	 * check that the system isn't suspended when KVM is enabling hardware.
+	 */
+	lockdep_assert_not_held(&kvm_lock);
+	lockdep_assert_irqs_disabled();
+
+	if (kvm_usage_count)
+		hardware_disable_nolock(NULL);
+	return 0;
+}
+
+static void kvm_resume(void)
+{
+	lockdep_assert_not_held(&kvm_lock);
+	lockdep_assert_irqs_disabled();
+
+	if (kvm_usage_count)
+		WARN_ON_ONCE(__hardware_enable_nolock());
+}
+
+static struct syscore_ops kvm_syscore_ops = {
+	.suspend = kvm_suspend,
+	.resume = kvm_resume,
+};
+
 static void kvm_io_bus_destroy(struct kvm_io_bus *bus)
 {
 	int i;
@@ -5720,36 +5750,6 @@ static void kvm_init_debug(void)
 	}
 }
 
-static int kvm_suspend(void)
-{
-	/*
-	 * Secondary CPUs and CPU hotplug are disabled across the suspend/resume
-	 * callbacks, i.e. no need to acquire kvm_lock to ensure the usage count
-	 * is stable.  Assert that kvm_lock is not held as a paranoid sanity
-	 * check that the system isn't suspended when KVM is enabling hardware.
-	 */
-	lockdep_assert_not_held(&kvm_lock);
-	lockdep_assert_irqs_disabled();
-
-	if (kvm_usage_count)
-		hardware_disable_nolock(NULL);
-	return 0;
-}
-
-static void kvm_resume(void)
-{
-	lockdep_assert_not_held(&kvm_lock);
-	lockdep_assert_irqs_disabled();
-
-	if (kvm_usage_count)
-		WARN_ON_ONCE(__hardware_enable_nolock());
-}
-
-static struct syscore_ops kvm_syscore_ops = {
-	.suspend = kvm_suspend,
-	.resume = kvm_resume,
-};
-
 static inline
 struct kvm_vcpu *preempt_notifier_to_vcpu(struct preempt_notifier *pn)
 {
@@ -5865,6 +5865,7 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
 		return r;
 
 	register_reboot_notifier(&kvm_reboot_notifier);
+	register_syscore_ops(&kvm_syscore_ops);
 
 	/* A kmem cache lets us meet the alignment requirements of fx_save. */
 	if (!vcpu_align)
@@ -5899,8 +5900,6 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
 
 	kvm_chardev_ops.owner = module;
 
-	register_syscore_ops(&kvm_syscore_ops);
-
 	kvm_preempt_ops.sched_in = kvm_sched_in;
 	kvm_preempt_ops.sched_out = kvm_sched_out;
 
@@ -5934,6 +5933,7 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
 		free_cpumask_var(per_cpu(cpu_kick_mask, cpu));
 	kmem_cache_destroy(kvm_vcpu_cache);
 out_free_3:
+	unregister_syscore_ops(&kvm_syscore_ops);
 	unregister_reboot_notifier(&kvm_reboot_notifier);
 	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_ONLINE);
 	return r;
-- 
2.38.1.431.g37b22c650d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
