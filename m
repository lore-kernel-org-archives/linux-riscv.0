Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEFECA0EDB
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 04:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9BjtKw5BEDdcycg+YUvCgdTph0sfHa+np/DyYBpNHVU=; b=GymQHYbJZ0lyHd
	p/l3oOk/8vLA99ItYdoyodMc4iKsvm2LyYzkHYEfSYGPneCDow7Z3yzMatlf/O+zdsvbEsPO5MFuv
	hBZeEloGXFInu3UpBwHWXK+L/WdI4IMpe375kHaqErzKj9P/yvnM6IxbM6NMkNUcfMnWrhxTz7B2Z
	nbvdQgZ0TFBzF2cbASNqR5KNRZj0z0MjepZHE/c8pieOGuOxz4VOKjnM/QfFaTC1Laykae1BUv7lQ
	6aK9Ywjbg0EF38a086BPF1YjKZr9Wo8NAxUJ5lzLITOZa18AYDXLDt8Mkq2RcTfg4spRKryKT/Aot
	DXUuFMscAh1aVGTJc8MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjtRJ-00000004h3F-3vFg;
	Fri, 30 Aug 2024 04:40:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjtMz-00000004fs7-0Pd7
	for linux-riscv@bombadil.infradead.org;
	Fri, 30 Aug 2024 04:36:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rXrvUNX9wZhbo5lExM9ASJtbvOFZGKS5apQohagzpLw=; b=j6ZvEExY8XEvVnAQKUDKDp7t4K
	gO6L8E8K6+SD8RWmAQPwUpA5X9W/PBDKAf0XYSbTo3pcFmn2jfbEU9jEyKk9YlEjisSQwyKJiDwhf
	xKJ6av9g7SWabcX0rYCAZUwN28wpf6uPxjasssUDgszcfcHduIo/ktAcuH1GU48L7qAG1LaohlsrQ
	Lu5rxDxwdMQ2WDu1beLNABsvy9goo+pXNmfa7m+BjgnZP4XwgMhlC09rhLmpTCM5SuXyN7S8vl8xe
	XXbR0bXR/c0OG3mRr3wJbcNLhrN0+sE/sNvq/z3nM8VkxhPxpIE442vU9KZstmFrG91RCo4YyeE9j
	t2rtL0JA==;
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjtMr-0000000BYbb-1UD4
	for linux-riscv@lists.infradead.org;
	Fri, 30 Aug 2024 04:36:19 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e116c697904so2794988276.1
        for <linux-riscv@lists.infradead.org>; Thu, 29 Aug 2024 21:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724992568; x=1725597368; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=rXrvUNX9wZhbo5lExM9ASJtbvOFZGKS5apQohagzpLw=;
        b=R/8ikROi079PO2Ibg7u22nLkxXm2L3cSVdXilaS42eXoEzn5tdJzbwFdZG075gv8Ic
         XCy5ChtRjU3Ufl15uYScui535wBh3fw1uaip+bWA8oKjkPT/NM2S+6dXs2aa4bgOM3CS
         HG8yiva0hyizEhZd5VcHxN4N1yNw2UZS53KjgKtkwHwlUl5X+rKyp5EiEfGlEiUfje7K
         eeFZ+eQm8TCyGm4JjfhhVMvbYNDE3IhAo4kjrBQnIbyBEnQmm7TqyNU6cf6mSJ0z2+Lw
         MHJ8hAL+4BrkjYV5l91xFSPKwQ/nzAP1csIE5OsbqXWVP+H8z7PSpsrhsV+K2EIWGCbS
         Qn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724992568; x=1725597368;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rXrvUNX9wZhbo5lExM9ASJtbvOFZGKS5apQohagzpLw=;
        b=COmfMJkj6VFy1OeOylhYnQedKZ+StMARdeKpbTaSKRsot6BreINOrJlDP1ZPJpAwOg
         tk/nnCLHhcqf6qzapqrGB3lWyCP87DaeqoSnsHou7f9OvwXMdk9/HT/5BnmIvF2vb8Ds
         mt/Jtmk+hB3gW6G9l1QexSIj3RnjOUs4X2XuFYBEHAtrbQeFtnbhsfsvNRmHo2h/064t
         eJSC/BsRmN8KjYsilNFykX0kuKja/swmWprA13Z83ByHLVG8yF1yQaj7dNk2nnHwxYBA
         P7T+AYVLHU6DPYb1ZSPAc+y7OhRdx8Lb524FKBAPNXshoZoM6tj7Xf5EyZuHRj1oD8w9
         mL9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU0fbvKDW5qBbpz2HVu6J7tl/g9CqJ/L10iQ3sgNyXLVBxMj5e72+VinxkiXNUtAAnOIqsTm7on+qtM3w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIed8Xx3zT4AWZ8xs/MHSxmYzSaptOX2Djlm0uIHYz7r34IOx/
	j20a2d8uj85Q9Loqvang4EuwMfxjSIBhJagzNong30yrh71ZWiuvUZdYjxreFgT9qeDwyAve7hf
	fLg==
X-Google-Smtp-Source: AGHT+IHK8nKD+Ge3cr3Jk46xiILoB/YOTlOXKkguw7vJ+xEDltxpBfEM3rv5awZSe+50LrHq1/N4VVvl1tY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:890f:0:b0:e0e:cd5e:f8a5 with SMTP id
 3f1490d57ef6-e1a79fd4371mr25220276.4.1724992568276; Thu, 29 Aug 2024 21:36:08
 -0700 (PDT)
Date: Thu, 29 Aug 2024 21:35:52 -0700
In-Reply-To: <20240830043600.127750-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240830043600.127750-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Message-ID: <20240830043600.127750-3-seanjc@google.com>
Subject: [PATCH v4 02/10] KVM: Register cpuhp and syscore callbacks when
 enabling hardware
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Chao Gao <chao.gao@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Farrah Chen <farrah.chen@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_053613_797739_54F87DC3 
X-CRM114-Status: GOOD (  25.13  )
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

Register KVM's cpuhp and syscore callback when enabling virtualization
in hardware instead of registering the callbacks during initialization,
and let the CPU up/down framework invoke the inner enable/disable
functions.  Registering the callbacks during initialization makes things
more complex than they need to be, as KVM needs to be very careful about
handling races between enabling CPUs being onlined/offlined and hardware
being enabled/disabled.

Intel TDX support will require KVM to enable virtualization during KVM
initialization, i.e. will add another wrinkle to things, at which point
sorting out the potential races with kvm_usage_count would become even
more complex.

Note, using the cpuhp framework has a subtle behavioral change: enabling
will be done serially across all CPUs, whereas KVM currently sends an IPI
to all CPUs in parallel.  While serializing virtualization enabling could
create undesirable latency, the issue is limited to the 0=>1 transition of
VM creation.  And even that can be mitigated, e.g. by letting userspace
force virtualization to be enabled when KVM is initialized.

Cc: Chao Gao <chao.gao@intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Acked-by: Kai Huang <kai.huang@intel.com>
Tested-by: Farrah Chen <farrah.chen@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 Documentation/virt/kvm/locking.rst |   9 +-
 virt/kvm/kvm_main.c                | 174 ++++++++++-------------------
 2 files changed, 66 insertions(+), 117 deletions(-)

diff --git a/Documentation/virt/kvm/locking.rst b/Documentation/virt/kvm/locking.rst
index c0cb5ce51c1e..be3c323888b1 100644
--- a/Documentation/virt/kvm/locking.rst
+++ b/Documentation/virt/kvm/locking.rst
@@ -9,7 +9,9 @@ KVM Lock Overview
 
 The acquisition orders for mutexes are as follows:
 
-- cpus_read_lock() is taken outside kvm_lock and kvm_usage_lock
+- cpus_read_lock() is taken outside kvm_lock
+
+- kvm_usage_lock is taken outside cpus_read_lock()
 
 - kvm->lock is taken outside vcpu->mutex
 
@@ -241,9 +243,8 @@ time it will be set using the Dirty tracking mechanism described above.
 :Arch:		any
 :Protects:	- kvm_usage_count
 		- hardware virtualization enable/disable
-:Comment:	Exists because using kvm_lock leads to deadlock (see earlier comment
-		on cpus_read_lock() vs kvm_lock).  Note, KVM also disables CPU hotplug via
-		cpus_read_lock() when enabling/disabling virtualization.
+:Comment:	Exists to allow taking cpus_read_lock() while kvm_usage_count is
+		protected, which simplifies the virtualization enabling logic.
 
 ``kvm->mn_invalidate_lock``
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index b4cdb659d3e1..a5826e16a106 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5579,7 +5579,7 @@ static DEFINE_PER_CPU(bool, hardware_enabled);
 static DEFINE_MUTEX(kvm_usage_lock);
 static int kvm_usage_count;
 
-static int __hardware_enable_nolock(void)
+static int hardware_enable_nolock(void)
 {
 	if (__this_cpu_read(hardware_enabled))
 		return 0;
@@ -5594,34 +5594,18 @@ static int __hardware_enable_nolock(void)
 	return 0;
 }
 
-static void hardware_enable_nolock(void *failed)
-{
-	if (__hardware_enable_nolock())
-		atomic_inc(failed);
-}
-
 static int kvm_online_cpu(unsigned int cpu)
 {
-	int ret = 0;
-
 	/*
 	 * Abort the CPU online process if hardware virtualization cannot
 	 * be enabled. Otherwise running VMs would encounter unrecoverable
 	 * errors when scheduled to this CPU.
 	 */
-	mutex_lock(&kvm_usage_lock);
-	if (kvm_usage_count)
-		ret = __hardware_enable_nolock();
-	mutex_unlock(&kvm_usage_lock);
-	return ret;
+	return hardware_enable_nolock();
 }
 
 static void hardware_disable_nolock(void *junk)
 {
-	/*
-	 * Note, hardware_disable_all_nolock() tells all online CPUs to disable
-	 * hardware, not just CPUs that successfully enabled hardware!
-	 */
 	if (!__this_cpu_read(hardware_enabled))
 		return;
 
@@ -5632,78 +5616,10 @@ static void hardware_disable_nolock(void *junk)
 
 static int kvm_offline_cpu(unsigned int cpu)
 {
-	mutex_lock(&kvm_usage_lock);
-	if (kvm_usage_count)
-		hardware_disable_nolock(NULL);
-	mutex_unlock(&kvm_usage_lock);
+	hardware_disable_nolock(NULL);
 	return 0;
 }
 
-static void hardware_disable_all_nolock(void)
-{
-	BUG_ON(!kvm_usage_count);
-
-	kvm_usage_count--;
-	if (!kvm_usage_count)
-		on_each_cpu(hardware_disable_nolock, NULL, 1);
-}
-
-static void hardware_disable_all(void)
-{
-	cpus_read_lock();
-	mutex_lock(&kvm_usage_lock);
-	hardware_disable_all_nolock();
-	mutex_unlock(&kvm_usage_lock);
-	cpus_read_unlock();
-}
-
-static int hardware_enable_all(void)
-{
-	atomic_t failed = ATOMIC_INIT(0);
-	int r;
-
-	/*
-	 * Do not enable hardware virtualization if the system is going down.
-	 * If userspace initiated a forced reboot, e.g. reboot -f, then it's
-	 * possible for an in-flight KVM_CREATE_VM to trigger hardware enabling
-	 * after kvm_reboot() is called.  Note, this relies on system_state
-	 * being set _before_ kvm_reboot(), which is why KVM uses a syscore ops
-	 * hook instead of registering a dedicated reboot notifier (the latter
-	 * runs before system_state is updated).
-	 */
-	if (system_state == SYSTEM_HALT || system_state == SYSTEM_POWER_OFF ||
-	    system_state == SYSTEM_RESTART)
-		return -EBUSY;
-
-	/*
-	 * When onlining a CPU, cpu_online_mask is set before kvm_online_cpu()
-	 * is called, and so on_each_cpu() between them includes the CPU that
-	 * is being onlined.  As a result, hardware_enable_nolock() may get
-	 * invoked before kvm_online_cpu(), which also enables hardware if the
-	 * usage count is non-zero.  Disable CPU hotplug to avoid attempting to
-	 * enable hardware multiple times.
-	 */
-	cpus_read_lock();
-	mutex_lock(&kvm_usage_lock);
-
-	r = 0;
-
-	kvm_usage_count++;
-	if (kvm_usage_count == 1) {
-		on_each_cpu(hardware_enable_nolock, &failed, 1);
-
-		if (atomic_read(&failed)) {
-			hardware_disable_all_nolock();
-			r = -EBUSY;
-		}
-	}
-
-	mutex_unlock(&kvm_usage_lock);
-	cpus_read_unlock();
-
-	return r;
-}
-
 static void kvm_shutdown(void)
 {
 	/*
@@ -5735,8 +5651,7 @@ static int kvm_suspend(void)
 	lockdep_assert_not_held(&kvm_usage_lock);
 	lockdep_assert_irqs_disabled();
 
-	if (kvm_usage_count)
-		hardware_disable_nolock(NULL);
+	hardware_disable_nolock(NULL);
 	return 0;
 }
 
@@ -5745,8 +5660,7 @@ static void kvm_resume(void)
 	lockdep_assert_not_held(&kvm_usage_lock);
 	lockdep_assert_irqs_disabled();
 
-	if (kvm_usage_count)
-		WARN_ON_ONCE(__hardware_enable_nolock());
+	WARN_ON_ONCE(hardware_enable_nolock());
 }
 
 static struct syscore_ops kvm_syscore_ops = {
@@ -5754,6 +5668,60 @@ static struct syscore_ops kvm_syscore_ops = {
 	.resume = kvm_resume,
 	.shutdown = kvm_shutdown,
 };
+
+static int hardware_enable_all(void)
+{
+	int r;
+
+	guard(mutex)(&kvm_usage_lock);
+
+	if (kvm_usage_count++)
+		return 0;
+
+	r = cpuhp_setup_state(CPUHP_AP_KVM_ONLINE, "kvm/cpu:online",
+			      kvm_online_cpu, kvm_offline_cpu);
+	if (r)
+		goto err_cpuhp;
+
+	register_syscore_ops(&kvm_syscore_ops);
+
+	/*
+	 * Undo virtualization enabling and bail if the system is going down.
+	 * If userspace initiated a forced reboot, e.g. reboot -f, then it's
+	 * possible for an in-flight operation to enable virtualization after
+	 * syscore_shutdown() is called, i.e. without kvm_shutdown() being
+	 * invoked.  Note, this relies on system_state being set _before_
+	 * kvm_shutdown(), e.g. to ensure either kvm_shutdown() is invoked
+	 * or this CPU observes the impending shutdown.  Which is why KVM uses
+	 * a syscore ops hook instead of registering a dedicated reboot
+	 * notifier (the latter runs before system_state is updated).
+	 */
+	if (system_state == SYSTEM_HALT || system_state == SYSTEM_POWER_OFF ||
+	    system_state == SYSTEM_RESTART) {
+		r = -EBUSY;
+		goto err_rebooting;
+	}
+
+	return 0;
+
+err_rebooting:
+	unregister_syscore_ops(&kvm_syscore_ops);
+	cpuhp_remove_state(CPUHP_AP_KVM_ONLINE);
+err_cpuhp:
+	--kvm_usage_count;
+	return r;
+}
+
+static void hardware_disable_all(void)
+{
+	guard(mutex)(&kvm_usage_lock);
+
+	if (--kvm_usage_count)
+		return;
+
+	unregister_syscore_ops(&kvm_syscore_ops);
+	cpuhp_remove_state(CPUHP_AP_KVM_ONLINE);
+}
 #else /* CONFIG_KVM_GENERIC_HARDWARE_ENABLING */
 static int hardware_enable_all(void)
 {
@@ -6462,15 +6430,6 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
 	int r;
 	int cpu;
 
-#ifdef CONFIG_KVM_GENERIC_HARDWARE_ENABLING
-	r = cpuhp_setup_state_nocalls(CPUHP_AP_KVM_ONLINE, "kvm/cpu:online",
-				      kvm_online_cpu, kvm_offline_cpu);
-	if (r)
-		return r;
-
-	register_syscore_ops(&kvm_syscore_ops);
-#endif
-
 	/* A kmem cache lets us meet the alignment requirements of fx_save. */
 	if (!vcpu_align)
 		vcpu_align = __alignof__(struct kvm_vcpu);
@@ -6481,10 +6440,8 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
 					   offsetofend(struct kvm_vcpu, stats_id)
 					   - offsetof(struct kvm_vcpu, arch),
 					   NULL);
-	if (!kvm_vcpu_cache) {
-		r = -ENOMEM;
-		goto err_vcpu_cache;
-	}
+	if (!kvm_vcpu_cache)
+		return -ENOMEM;
 
 	for_each_possible_cpu(cpu) {
 		if (!alloc_cpumask_var_node(&per_cpu(cpu_kick_mask, cpu),
@@ -6541,11 +6498,6 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
 	for_each_possible_cpu(cpu)
 		free_cpumask_var(per_cpu(cpu_kick_mask, cpu));
 	kmem_cache_destroy(kvm_vcpu_cache);
-err_vcpu_cache:
-#ifdef CONFIG_KVM_GENERIC_HARDWARE_ENABLING
-	unregister_syscore_ops(&kvm_syscore_ops);
-	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_ONLINE);
-#endif
 	return r;
 }
 EXPORT_SYMBOL_GPL(kvm_init);
@@ -6567,10 +6519,6 @@ void kvm_exit(void)
 	kmem_cache_destroy(kvm_vcpu_cache);
 	kvm_vfio_ops_exit();
 	kvm_async_pf_deinit();
-#ifdef CONFIG_KVM_GENERIC_HARDWARE_ENABLING
-	unregister_syscore_ops(&kvm_syscore_ops);
-	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_ONLINE);
-#endif
 	kvm_irqfd_exit();
 }
 EXPORT_SYMBOL_GPL(kvm_exit);
-- 
2.46.0.469.g59c65b2a67-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
