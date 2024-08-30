Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80245CA0EE4
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 05:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RrmlJw71GIM0yedhrn7s9Qlc+IjiFVk3gkZ5xWzow84=; b=0S3T+KNO1VLFpR
	ZWv1NHsT2ThETdhDvY/OTg4DQMg7D2C3Kh2+/Ujy3+9G2KPU5WOtW5CG0db+Y+iOKy85hnHMfjWuf
	Z7xoPndDwuyZbO2i6A87gD8/nz5ToeC5Ve69EdebJKMFm9SaJlMVOssRum7DZYKNXXKRVa3QaNZKS
	rbvq/r8xJ6APjePyLqy14bSClQB+lINO6eGQNtrwR8dMK0WWbIh4w45DPigDxyvy5TPLv0IzWaCpg
	yBLRAjpQ4UV+a3GoCcYKT0edPLqk49Ds7LD02hHf46fDLtMbxE0qDdlMY4PQTQDjvjYsqjo3Zx5NE
	JOAP+pxxUtK9VdJe3uxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjuSW-00000004qdW-1trf;
	Fri, 30 Aug 2024 05:46:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjtMv-00000004fpD-1L6a
	for linux-riscv@bombadil.infradead.org;
	Fri, 30 Aug 2024 04:36:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aHFUvm+FsXoP3qIyVsbx5uEplmYhc4fKnKOy7PZyclA=; b=FNaII5njMPKu6Wf8tAk1iEsDdb
	KpYVXJ4AdobaxAGL+6aAmDJtsrvdPsE1FHBGtUO7pet1+f+ciYs6eGVuwQ7+R5yC3I5Xhcel0aZai
	/00d3an91WFI7WxTfRQQ6mbUBJWZFs3ONQaXJuxKHxI+IIAs6ftft1k0gpn52dfG2xXV2AN+egTz9
	tpetuxaGyNJJaX/nt8+zLkqInCaL+bmtkoO3mKnd44XFi2tO4uo/7zDrmKaRV4oZBQB4KGHEr/CDX
	n1IaV6ugu67ti75EyCRx4OUZykEzsC/B+xzs8iRu/hEdJtprLj8zPcDjxPVRbgsVqWNPAG37Frxu5
	QvNt/5Pg==;
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjtMp-0000000BYbX-40hR
	for linux-riscv@lists.infradead.org;
	Fri, 30 Aug 2024 04:36:15 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6b3825748c2so31543577b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 29 Aug 2024 21:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724992566; x=1725597366; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=aHFUvm+FsXoP3qIyVsbx5uEplmYhc4fKnKOy7PZyclA=;
        b=Qi+ds33ZuFhFL2WdIH3Oxf2Wcvsxt6b2pm+NZKZ0D3CbuF0vP577i23Cgepl/FlKLC
         tO/YeZG1cdwwUQOXZA7X+km905gkNJs5sF6tRFu/TGgvTdVm2CrCBtG5xcoLB/mWEUOT
         1o4e8b0S9h3hWlU0Jhnsd31JK1g1ojtghUtuXJWwaEEDHEimOQxwZzrhJfZw7YNJm2zv
         LQGDXFZ3yaY/0G2NwECXSoE9dIyOHiuNPLgYGKceDglQMskazlMjdeJyOX2pbRL4fgWq
         KiUTLr3Y9TiseS7TN7s0hdtpqj5dmBXd38b13QiMf8g7YI8W+q+xjlrYmcXhfTsMBXBg
         Zx3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724992566; x=1725597366;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aHFUvm+FsXoP3qIyVsbx5uEplmYhc4fKnKOy7PZyclA=;
        b=gDeZmdoZokTkLveKRomj8BQXeYzJA+/S9fZe2B8pammqtcaTgrKl240HRAs61hT+jz
         KGbvB+FJutqKaFkJtiZFtlCnmK9Tm5DWvcDD3AuIvF8km7IQzLX0PaLNXpyCcM8BOP0z
         +mi25wutZUA07CkfFy4cgJ84Xfj3wKEFkrxvzGGnXQUS2OQ3LgLrjhp1+oiPi5jncBQH
         lQnMKM2N+C56/1cCxZM5aq5RXEVSpSFfOcem/dZIye3AkCh7NYMG3vcGENUd1w6gvmud
         nEudEuw6rwpAgLpfvkHWnvkogFrrY80SboOvGyNFwXAHuLenDtyCWBFXADXqlIryPbdU
         W+CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmSdccrR/abgVkly6KRpcYDazOXvL2XT1kgqjJxLvQm1n05UPqT81X3lmsK6f4KGidITVPyIfoCu1ZBw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzvoqZ5U34cuUmzghuYyFbnKZas/XObsOgCshgX5PTgI/iJ5Jfw
	AruUZD4AME+WRB0TqnPT54NsVFE5ON5u9y5GO878B1imr0NLEst4pDAzmkNI6wBAYmM1m0ISCC0
	7VA==
X-Google-Smtp-Source: AGHT+IEEIm57E7ZhayVART8ADQcxGPIPqWcj0BvzrgRRlVCf3l6FJVWmFUT6VBh+RffSDLzBCOKmsEJxIDM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:63c8:b0:6af:623c:7694 with SMTP id
 00721157ae682-6d40b0f96b2mr822357b3.0.1724992566315; Thu, 29 Aug 2024
 21:36:06 -0700 (PDT)
Date: Thu, 29 Aug 2024 21:35:51 -0700
In-Reply-To: <20240830043600.127750-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240830043600.127750-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Message-ID: <20240830043600.127750-2-seanjc@google.com>
Subject: [PATCH v4 01/10] KVM: Use dedicated mutex to protect kvm_usage_count
 to avoid deadlock
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
X-CRM114-CacheID: sfid-20240830_053612_592718_F430E683 
X-CRM114-Status: GOOD (  18.84  )
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

Use a dedicated mutex to guard kvm_usage_count to fix a potential deadlock
on x86 due to a chain of locks and SRCU synchronizations.  Translating the
below lockdep splat, CPU1 #6 will wait on CPU0 #1, CPU0 #8 will wait on
CPU2 #3, and CPU2 #7 will wait on CPU1 #4 (if there's a writer, due to the
fairness of r/w semaphores).

    CPU0                     CPU1                     CPU2
1   lock(&kvm->slots_lock);
2                                                     lock(&vcpu->mutex);
3                                                     lock(&kvm->srcu);
4                            lock(cpu_hotplug_lock);
5                            lock(kvm_lock);
6                            lock(&kvm->slots_lock);
7                                                     lock(cpu_hotplug_lock);
8   sync(&kvm->srcu);

Note, there are likely more potential deadlocks in KVM x86, e.g. the same
pattern of taking cpu_hotplug_lock outside of kvm_lock likely exists with
__kvmclock_cpufreq_notifier():

  cpuhp_cpufreq_online()
  |
  -> cpufreq_online()
     |
     -> cpufreq_gov_performance_limits()
        |
        -> __cpufreq_driver_target()
           |
           -> __target_index()
              |
              -> cpufreq_freq_transition_begin()
                 |
                 -> cpufreq_notify_transition()
                    |
                    -> ... __kvmclock_cpufreq_notifier()

But, actually triggering such deadlocks is beyond rare due to the
combination of dependencies and timings involved.  E.g. the cpufreq
notifier is only used on older CPUs without a constant TSC, mucking with
the NX hugepage mitigation while VMs are running is very uncommon, and
doing so while also onlining/offlining a CPU (necessary to generate
contention on cpu_hotplug_lock) would be even more unusual.

The most robust solution to the general cpu_hotplug_lock issue is likely
to switch vm_list to be an RCU-protected list, e.g. so that x86's cpufreq
notifier doesn't to take kvm_lock.  For now, settle for fixing the most
blatant deadlock, as switching to an RCU-protected list is a much more
involved change, but add a comment in locking.rst to call out that care
needs to be taken when walking holding kvm_lock and walking vm_list.

  ======================================================
  WARNING: possible circular locking dependency detected
  6.10.0-smp--c257535a0c9d-pip #330 Tainted: G S         O
  ------------------------------------------------------
  tee/35048 is trying to acquire lock:
  ff6a80eced71e0a8 (&kvm->slots_lock){+.+.}-{3:3}, at: set_nx_huge_pages+0x179/0x1e0 [kvm]

  but task is already holding lock:
  ffffffffc07abb08 (kvm_lock){+.+.}-{3:3}, at: set_nx_huge_pages+0x14a/0x1e0 [kvm]

  which lock already depends on the new lock.

   the existing dependency chain (in reverse order) is:

  -> #3 (kvm_lock){+.+.}-{3:3}:
         __mutex_lock+0x6a/0xb40
         mutex_lock_nested+0x1f/0x30
         kvm_dev_ioctl+0x4fb/0xe50 [kvm]
         __se_sys_ioctl+0x7b/0xd0
         __x64_sys_ioctl+0x21/0x30
         x64_sys_call+0x15d0/0x2e60
         do_syscall_64+0x83/0x160
         entry_SYSCALL_64_after_hwframe+0x76/0x7e

  -> #2 (cpu_hotplug_lock){++++}-{0:0}:
         cpus_read_lock+0x2e/0xb0
         static_key_slow_inc+0x16/0x30
         kvm_lapic_set_base+0x6a/0x1c0 [kvm]
         kvm_set_apic_base+0x8f/0xe0 [kvm]
         kvm_set_msr_common+0x9ae/0xf80 [kvm]
         vmx_set_msr+0xa54/0xbe0 [kvm_intel]
         __kvm_set_msr+0xb6/0x1a0 [kvm]
         kvm_arch_vcpu_ioctl+0xeca/0x10c0 [kvm]
         kvm_vcpu_ioctl+0x485/0x5b0 [kvm]
         __se_sys_ioctl+0x7b/0xd0
         __x64_sys_ioctl+0x21/0x30
         x64_sys_call+0x15d0/0x2e60
         do_syscall_64+0x83/0x160
         entry_SYSCALL_64_after_hwframe+0x76/0x7e

  -> #1 (&kvm->srcu){.+.+}-{0:0}:
         __synchronize_srcu+0x44/0x1a0
         synchronize_srcu_expedited+0x21/0x30
         kvm_swap_active_memslots+0x110/0x1c0 [kvm]
         kvm_set_memslot+0x360/0x620 [kvm]
         __kvm_set_memory_region+0x27b/0x300 [kvm]
         kvm_vm_ioctl_set_memory_region+0x43/0x60 [kvm]
         kvm_vm_ioctl+0x295/0x650 [kvm]
         __se_sys_ioctl+0x7b/0xd0
         __x64_sys_ioctl+0x21/0x30
         x64_sys_call+0x15d0/0x2e60
         do_syscall_64+0x83/0x160
         entry_SYSCALL_64_after_hwframe+0x76/0x7e

  -> #0 (&kvm->slots_lock){+.+.}-{3:3}:
         __lock_acquire+0x15ef/0x2e30
         lock_acquire+0xe0/0x260
         __mutex_lock+0x6a/0xb40
         mutex_lock_nested+0x1f/0x30
         set_nx_huge_pages+0x179/0x1e0 [kvm]
         param_attr_store+0x93/0x100
         module_attr_store+0x22/0x40
         sysfs_kf_write+0x81/0xb0
         kernfs_fop_write_iter+0x133/0x1d0
         vfs_write+0x28d/0x380
         ksys_write+0x70/0xe0
         __x64_sys_write+0x1f/0x30
         x64_sys_call+0x281b/0x2e60
         do_syscall_64+0x83/0x160
         entry_SYSCALL_64_after_hwframe+0x76/0x7e

Cc: Chao Gao <chao.gao@intel.com>
Fixes: 0bf50497f03b ("KVM: Drop kvm_count_lock and instead protect kvm_usage_count with kvm_lock")
Cc: stable@vger.kernel.org
Reviewed-by: Kai Huang <kai.huang@intel.com>
Acked-by: Kai Huang <kai.huang@intel.com>
Tested-by: Farrah Chen <farrah.chen@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 Documentation/virt/kvm/locking.rst | 32 +++++++++++++++++++++---------
 virt/kvm/kvm_main.c                | 31 +++++++++++++++--------------
 2 files changed, 39 insertions(+), 24 deletions(-)

diff --git a/Documentation/virt/kvm/locking.rst b/Documentation/virt/kvm/locking.rst
index 02880d5552d5..c0cb5ce51c1e 100644
--- a/Documentation/virt/kvm/locking.rst
+++ b/Documentation/virt/kvm/locking.rst
@@ -9,7 +9,7 @@ KVM Lock Overview
 
 The acquisition orders for mutexes are as follows:
 
-- cpus_read_lock() is taken outside kvm_lock
+- cpus_read_lock() is taken outside kvm_lock and kvm_usage_lock
 
 - kvm->lock is taken outside vcpu->mutex
 
@@ -24,6 +24,12 @@ The acquisition orders for mutexes are as follows:
   are taken on the waiting side when modifying memslots, so MMU notifiers
   must not take either kvm->slots_lock or kvm->slots_arch_lock.
 
+cpus_read_lock() vs kvm_lock:
+- Taking cpus_read_lock() outside of kvm_lock is problematic, despite that
+  being the official ordering, as it is quite easy to unknowingly trigger
+  cpus_read_lock() while holding kvm_lock.  Use caution when walking vm_list,
+  e.g. avoid complex operations when possible.
+
 For SRCU:
 
 - ``synchronize_srcu(&kvm->srcu)`` is called inside critical sections
@@ -227,10 +233,17 @@ time it will be set using the Dirty tracking mechanism described above.
 :Type:		mutex
 :Arch:		any
 :Protects:	- vm_list
-		- kvm_usage_count
+
+``kvm_usage_lock``
+^^^^^^^^^^^^^^^^^^
+
+:Type:		mutex
+:Arch:		any
+:Protects:	- kvm_usage_count
 		- hardware virtualization enable/disable
-:Comment:	KVM also disables CPU hotplug via cpus_read_lock() during
-		enable/disable.
+:Comment:	Exists because using kvm_lock leads to deadlock (see earlier comment
+		on cpus_read_lock() vs kvm_lock).  Note, KVM also disables CPU hotplug via
+		cpus_read_lock() when enabling/disabling virtualization.
 
 ``kvm->mn_invalidate_lock``
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^
@@ -290,11 +303,12 @@ time it will be set using the Dirty tracking mechanism described above.
 		wakeup.
 
 ``vendor_module_lock``
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+^^^^^^^^^^^^^^^^^^^^^^
 :Type:		mutex
 :Arch:		x86
 :Protects:	loading a vendor module (kvm_amd or kvm_intel)
-:Comment:	Exists because using kvm_lock leads to deadlock.  cpu_hotplug_lock is
-    taken outside of kvm_lock, e.g. in KVM's CPU online/offline callbacks, and
-    many operations need to take cpu_hotplug_lock when loading a vendor module,
-    e.g. updating static calls.
+:Comment:	Exists because using kvm_lock leads to deadlock.  kvm_lock is taken
+    in notifiers, e.g. __kvmclock_cpufreq_notifier(), that may be invoked while
+    cpu_hotplug_lock is held, e.g. from cpufreq_boost_trigger_state(), and many
+    operations need to take cpu_hotplug_lock when loading a vendor module, e.g.
+    updating static calls.
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 92901656a0d4..b4cdb659d3e1 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5576,6 +5576,7 @@ __visible bool kvm_rebooting;
 EXPORT_SYMBOL_GPL(kvm_rebooting);
 
 static DEFINE_PER_CPU(bool, hardware_enabled);
+static DEFINE_MUTEX(kvm_usage_lock);
 static int kvm_usage_count;
 
 static int __hardware_enable_nolock(void)
@@ -5608,10 +5609,10 @@ static int kvm_online_cpu(unsigned int cpu)
 	 * be enabled. Otherwise running VMs would encounter unrecoverable
 	 * errors when scheduled to this CPU.
 	 */
-	mutex_lock(&kvm_lock);
+	mutex_lock(&kvm_usage_lock);
 	if (kvm_usage_count)
 		ret = __hardware_enable_nolock();
-	mutex_unlock(&kvm_lock);
+	mutex_unlock(&kvm_usage_lock);
 	return ret;
 }
 
@@ -5631,10 +5632,10 @@ static void hardware_disable_nolock(void *junk)
 
 static int kvm_offline_cpu(unsigned int cpu)
 {
-	mutex_lock(&kvm_lock);
+	mutex_lock(&kvm_usage_lock);
 	if (kvm_usage_count)
 		hardware_disable_nolock(NULL);
-	mutex_unlock(&kvm_lock);
+	mutex_unlock(&kvm_usage_lock);
 	return 0;
 }
 
@@ -5650,9 +5651,9 @@ static void hardware_disable_all_nolock(void)
 static void hardware_disable_all(void)
 {
 	cpus_read_lock();
-	mutex_lock(&kvm_lock);
+	mutex_lock(&kvm_usage_lock);
 	hardware_disable_all_nolock();
-	mutex_unlock(&kvm_lock);
+	mutex_unlock(&kvm_usage_lock);
 	cpus_read_unlock();
 }
 
@@ -5683,7 +5684,7 @@ static int hardware_enable_all(void)
 	 * enable hardware multiple times.
 	 */
 	cpus_read_lock();
-	mutex_lock(&kvm_lock);
+	mutex_lock(&kvm_usage_lock);
 
 	r = 0;
 
@@ -5697,7 +5698,7 @@ static int hardware_enable_all(void)
 		}
 	}
 
-	mutex_unlock(&kvm_lock);
+	mutex_unlock(&kvm_usage_lock);
 	cpus_read_unlock();
 
 	return r;
@@ -5725,13 +5726,13 @@ static int kvm_suspend(void)
 {
 	/*
 	 * Secondary CPUs and CPU hotplug are disabled across the suspend/resume
-	 * callbacks, i.e. no need to acquire kvm_lock to ensure the usage count
-	 * is stable.  Assert that kvm_lock is not held to ensure the system
-	 * isn't suspended while KVM is enabling hardware.  Hardware enabling
-	 * can be preempted, but the task cannot be frozen until it has dropped
-	 * all locks (userspace tasks are frozen via a fake signal).
+	 * callbacks, i.e. no need to acquire kvm_usage_lock to ensure the usage
+	 * count is stable.  Assert that kvm_usage_lock is not held to ensure
+	 * the system isn't suspended while KVM is enabling hardware.  Hardware
+	 * enabling can be preempted, but the task cannot be frozen until it has
+	 * dropped all locks (userspace tasks are frozen via a fake signal).
 	 */
-	lockdep_assert_not_held(&kvm_lock);
+	lockdep_assert_not_held(&kvm_usage_lock);
 	lockdep_assert_irqs_disabled();
 
 	if (kvm_usage_count)
@@ -5741,7 +5742,7 @@ static int kvm_suspend(void)
 
 static void kvm_resume(void)
 {
-	lockdep_assert_not_held(&kvm_lock);
+	lockdep_assert_not_held(&kvm_usage_lock);
 	lockdep_assert_irqs_disabled();
 
 	if (kvm_usage_count)
-- 
2.46.0.469.g59c65b2a67-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
