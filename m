Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F19CC433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Nov 2022 23:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pPXQ/n5F5CDFW87d/ygA3lKo4VOg0gJpgK6ZYOl7leE=; b=LqngSr7gDjFGLR
	EhZt4LQiONF2dEjyFJfcPuulw05QCjzhnjhZusbnuUjrE259isdH28LlesFwweQi1pAQGFia/cZJh
	NGzItdPe+ozPVYuqgLdBXFTEbctTGOinXpfCEzlSxIrwAgJ22pK8wuHQSmKJDZgTYwcjoLJKHzhUa
	tUVucU47CMe8FJJf3lzAVRZnOMsE695C1SGHNAaV3rceWnQxys8KhevvZz2wAhox2HXFlOYACvgWx
	xrqpMyK2svLFXziXiwi12niv0/YnA4Abpy5IG/K0kkKkXePzNT/1AfMLLgVgynGL6ze3tyZbXL4v+
	ZHtkTLL5BRzy2VWzuZ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqNJ8-00F3KQ-2S; Wed, 02 Nov 2022 23:38:06 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN9V-00EyXi-9e
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 23:28:10 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id k7-20020a256f07000000b006cbcc030bc8so348887ybc.18
        for <linux-riscv@lists.infradead.org>; Wed, 02 Nov 2022 16:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=OIMXqLasKb2O7+CMjQgfYLOt6T5DmXDJujGgVXhHqFI=;
        b=a1O/5J/wwBHL5DdZlnXyBx3ad/wWPMoFwu33ObN+0h9wckbMWe8lEdCsf3vv9dBpgd
         Og1tkQtFVeN8Yaq0826BqmvMwQ236D77oay2sYYYSosRusWw8ffouoxC4D4VSugKPkv6
         eFSXHeIkk4rxzIyC2jBSOKzzG944O7R7WfzIzWLb9f4+zjzqLEX7pMuEWnereIkmHCla
         z9Wi0z30aLvdj67Gj18fnOk19FrwVJlssI8qaBiE05oy40Xc5I9xoCB6VMFe6e9n0+Qe
         iXYDA9B6ROLH1CUwVEa9sH8tNUrl6u56cDEtM0Lb6ytwc6hrZDZzuAPDLoXNIWglaaUo
         bPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OIMXqLasKb2O7+CMjQgfYLOt6T5DmXDJujGgVXhHqFI=;
        b=1GJKJPiSEv+vJ2dlBj2ApTs47T1fA4E6/BLyS0MSSjmX18Aa7U5hRy27B4Ynki1ooP
         Dtv9Z53YNsMmhscEHMzz6WVCxto+KLQ9NePwpSzyF4Kgo5JLW6FyUjBhlYf1063T4ZOG
         /BCfoBB0UTE6x/pW/w49eDgxJCkABvrUSiWhgh0bNOBqfzp9oNbyz4kz8oXtoRQ9V9oB
         IREpIom7VTch5CT+N4PXOr4XwgGyyItGvC4iCCAxRexo7McIY6/EYOYLc/vD8kkpe8YC
         TEmaSihH1xdYXvxt/a4dD32mIy4iyxXtHI57bfxBC3vLFnK0PY15s7+5asgbJZsN7TZy
         T1ew==
X-Gm-Message-State: ACrzQf0cotNVB9QPbh2da6/5A5oU3RO2wdNqVKmeSgs27FOJj2RBp3rV
	5iap/uGn6UF3GiDbVUC9jNXCvBBVXfg=
X-Google-Smtp-Source: AMsMyM6yCCCYKkQ3PoeOADSfJNFYsKEgxfAWyhUa6qA376xUH3n8/ExaQ+otuspws7tagrIY8b2ugf0DdfA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:1713:0:b0:36b:3a6b:4b49 with SMTP id
 19-20020a811713000000b0036b3a6b4b49mr26413129ywx.500.1667431224514; Wed, 02
 Nov 2022 16:20:24 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:19:08 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-42-seanjc@google.com>
Subject: [PATCH 41/44] KVM: Use a per-CPU variable to track which CPUs have
 enabled virtualization
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
X-CRM114-CacheID: sfid-20221102_162809_351308_F6D32721 
X-CRM114-Status: GOOD (  17.22  )
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

Use a per-CPU variable instead of a shared bitmap to track which CPUs
have successfully enabled virtualization hardware.  Using a per-CPU bool
avoids the need for an additional allocation, and arguably yields easier
to read code.  Using a bitmap would be advantageous if KVM used it to
avoid generating IPIs to CPUs that failed to enable hardware, but that's
an extreme edge case and not worth optimizing, and the low level helpers
would still want to keep their individual checks as attempting to enable
virtualization hardware when it's already enabled can be problematic,
e.g. Intel's VMXON will fault.

Opportunistically change the order in hardware_enable_nolock() to set
the flag if and only if hardware enabling is successful, instead of
speculatively setting the flag and then clearing it on failure.

Add a comment explaining that the check in hardware_disable_nolock()
isn't simply paranoia.  Waaay back when, commit 1b6c016818a5 ("KVM: Keep
track of which cpus have virtualization enabled"), added the logic as a
guards against CPU hotplug racing with hardware enable/disable.  Now that
KVM has eliminated the race by taking cpu_hotplug_lock for read (via
cpus_read_lock()) when enabling or disabling hardware, at first glance it
appears that the check is now superfluous, i.e. it's tempting to remove
the per-CPU flag entirely...

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 41 ++++++++++++++++++-----------------------
 1 file changed, 18 insertions(+), 23 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 4a42b78bfb0e..31949a89fe25 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -102,7 +102,7 @@ EXPORT_SYMBOL_GPL(halt_poll_ns_shrink);
 DEFINE_MUTEX(kvm_lock);
 LIST_HEAD(vm_list);
 
-static cpumask_var_t cpus_hardware_enabled;
+static DEFINE_PER_CPU(bool, hardware_enabled);
 static int kvm_usage_count;
 static atomic_t hardware_enable_failed;
 
@@ -5008,21 +5008,17 @@ static struct miscdevice kvm_dev = {
 
 static void hardware_enable_nolock(void *junk)
 {
-	int cpu = raw_smp_processor_id();
-	int r;
-
-	if (cpumask_test_cpu(cpu, cpus_hardware_enabled))
+	if (__this_cpu_read(hardware_enabled))
 		return;
 
-	cpumask_set_cpu(cpu, cpus_hardware_enabled);
-
-	r = kvm_arch_hardware_enable();
-
-	if (r) {
-		cpumask_clear_cpu(cpu, cpus_hardware_enabled);
+	if (kvm_arch_hardware_enable()) {
 		atomic_inc(&hardware_enable_failed);
-		pr_info("kvm: enabling virtualization on CPU%d failed\n", cpu);
+		pr_info("kvm: enabling virtualization on CPU%d failed\n",
+			raw_smp_processor_id());
+		return;
 	}
+
+	__this_cpu_write(hardware_enabled, true);
 }
 
 static int kvm_online_cpu(unsigned int cpu)
@@ -5054,12 +5050,16 @@ static int kvm_online_cpu(unsigned int cpu)
 
 static void hardware_disable_nolock(void *junk)
 {
-	int cpu = raw_smp_processor_id();
-
-	if (!cpumask_test_cpu(cpu, cpus_hardware_enabled))
+	/*
+	 * Note, hardware_disable_all_nolock() tells all online CPUs to disable
+	 * hardware, not just CPUs that successfully enabled hardware!
+	 */
+	if (!__this_cpu_read(hardware_enabled))
 		return;
-	cpumask_clear_cpu(cpu, cpus_hardware_enabled);
+
 	kvm_arch_hardware_disable();
+
+	__this_cpu_write(hardware_enabled, false);
 }
 
 static int kvm_offline_cpu(unsigned int cpu)
@@ -5861,13 +5861,11 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
 	int r;
 	int cpu;
 
-	if (!zalloc_cpumask_var(&cpus_hardware_enabled, GFP_KERNEL))
-		return -ENOMEM;
-
 	r = cpuhp_setup_state_nocalls(CPUHP_AP_KVM_ONLINE, "kvm/cpu:online",
 				      kvm_online_cpu, kvm_offline_cpu);
 	if (r)
-		goto out_free_2;
+		return r;
+
 	register_reboot_notifier(&kvm_reboot_notifier);
 
 	/* A kmem cache lets us meet the alignment requirements of fx_save. */
@@ -5940,8 +5938,6 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
 out_free_3:
 	unregister_reboot_notifier(&kvm_reboot_notifier);
 	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_ONLINE);
-out_free_2:
-	free_cpumask_var(cpus_hardware_enabled);
 	return r;
 }
 EXPORT_SYMBOL_GPL(kvm_init);
@@ -5967,7 +5963,6 @@ void kvm_exit(void)
 	unregister_reboot_notifier(&kvm_reboot_notifier);
 	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_ONLINE);
 	kvm_irqfd_exit();
-	free_cpumask_var(cpus_hardware_enabled);
 }
 EXPORT_SYMBOL_GPL(kvm_exit);
 
-- 
2.38.1.431.g37b22c650d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
