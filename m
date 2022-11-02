Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FC3C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Nov 2022 23:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LAI9Qc/u1uz7MnH+WYgHpGch/Av1OLgfz9dAXM2jIxc=; b=IN/IzrM5rhP6eQ
	M8rEDAAnqWwiwrf32pUf6MYRfGtVwHxWm12mNd5FNNo5bKKKHR7UX6VoNrZaOUOY0+wIQHtLa234z
	Mg8eOW3v3Kin4mq9lWfRuWXWx1xeoAV5ihnOsg9w8n+XHS6iedBMs6rMJ4tHZ8yQaN45svl+Lkv3u
	1k/ogeXMXqv5g47Abv/Y4ckabvOvzvCV3d60mR64ox2g8WrtAZMZM6d5O/OfOpSAfjvbngDepDwC2
	vV+BGbcXrlALFIAsWbcWUBUHuKfqznwhq2Yaw7TVVpBMQG5cTG9UkxtynQWMawXRnhLmfjAyaEdQ3
	AoBjQ01qVJaffIwehxng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqNN5-00F5Xt-EA; Wed, 02 Nov 2022 23:42:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqNGV-00F1m3-5t
	for linux-riscv@bombadil.infradead.org; Wed, 02 Nov 2022 23:35:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XOm5gmY5yRxyVbM7h5atP3/v80uNjlEWUwmtqPuKnrU=; b=k0f5NcaejmRXfEXLIIr29cMr9K
	LP6MLpgWdIZfD/t8Ma/f1095Oytr7plShbFIuFXADIP3y7lazJjKTTg3m+t5mWBhGzgeBST7i9Tjx
	/5EczjKyzp0/qPRU/ovkyjqBOlppNMGpMyVexxqe6H/Rz3tYjYwGKbV51yHfARgCw5ZjXeXEf5tOO
	tIHt+e8uvndtc3lDKbshUPBxglkUvQ8BEhbtibcJOxyqHbhK8Qz5EJcX6/EsQ/SWkN2HcE53tijhk
	r3PPRHEt2Pvho54ct02mUYuZHY2WHe/ZH3jQaBGjZRCSY70kXLyX2OpIppEkZXu3xrytu25+8GDpm
	iUJOI6Tg==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN20-005vw5-Hm
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 23:20:27 +0000
Received: by mail-pf1-x449.google.com with SMTP id z19-20020a056a001d9300b0056df4b6f421so15516pfw.4
        for <linux-riscv@lists.infradead.org>; Wed, 02 Nov 2022 16:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=XOm5gmY5yRxyVbM7h5atP3/v80uNjlEWUwmtqPuKnrU=;
        b=P098Tzj2rpCJt/4nT8TrXTmUFPSgbhycgPry+JJrhxDuao4X1xtJJMmkpRB4trEL+1
         55zpGfmzGI5TBm87M6Zs05xZAzJVQeNB6vBpk6WWQfA3tICCm87E6sO59+ssVnP2DMV3
         hznDyqUbjHe4LGoM3DU21pBPc947dC5uIYbWgsImqI8pmwnLywsM+KMu/sYgtS/f8Vg6
         ulJ7edDhRMBnHlx6lfmMwV1MS6wrSEBngjldBD8LoOWj74JJvfznExcwtcTban7qi7hz
         //M7aBh24hO/B6RinKg6thqufqaedpAYEyt0W7Am9UJmOQXk6WzZPIZJVcSMq0UtYuH2
         blnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XOm5gmY5yRxyVbM7h5atP3/v80uNjlEWUwmtqPuKnrU=;
        b=l0+criJIq/9voKy25c3oHX2K/8oKkuHbAhWxMXcmV9Q80J9LRtDQyjAdJE2YbZxwoN
         dHeLbpLch4ih8yYpDDeQVYN8ke9qVz8g8KHqQyBQYO1PHTKsjf1PmPNvDOfqABrfzoBc
         GDGAQRqwwhNEm3GePEX9fpvgQcs6iNQi9qHgsnwf1EIoiIXEvfDDW/SbM5yqy2MmoWHt
         PCJrySMrjzBi9NgelMA1dhzXKtOXVKv9zFHi2a8SP4FHsYEiSmqZv0Bot9Yd4LHtEt7C
         tdoYqUG/Rj9A/5K7g+KDtCidw1LDjrwM/TkyKouxGPitjnzTEX/OgOz2QBelr7HqqTxs
         h79Q==
X-Gm-Message-State: ACrzQf2kBVFmxQOw1uQfEx+F97mmAy6ZhuERm3N9HFfXMIeNXyVTCOtt
	b+gnBLl9zdrSz7Us6WMe2FQSr0puKEc=
X-Google-Smtp-Source: AMsMyM5ohXm4oyR4jft0wXrIcDwmrJUMZ0my1jgH1DEVPjOvKwP7xekYGMEgfn4JBdiC2vhG8AasDNojAdM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a62:8141:0:b0:56b:c435:f003 with SMTP id
 t62-20020a628141000000b0056bc435f003mr27425626pfd.15.1667431217428; Wed, 02
 Nov 2022 16:20:17 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:19:04 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-38-seanjc@google.com>
Subject: [PATCH 37/44] KVM: Rename and move CPUHP_AP_KVM_STARTING to ONLINE section
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
X-CRM114-CacheID: sfid-20221102_232024_625290_E3C93C7B 
X-CRM114-Status: GOOD (  14.16  )
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

From: Chao Gao <chao.gao@intel.com>

The CPU STARTING section doesn't allow callbacks to fail. Move KVM's
hotplug callback to ONLINE section so that it can abort onlining a CPU in
certain cases to avoid potentially breaking VMs running on existing CPUs.
For example, when KVM fails to enable hardware virtualization on the
hotplugged CPU.

Place KVM's hotplug state before CPUHP_AP_SCHED_WAIT_EMPTY as it ensures
when offlining a CPU, all user tasks and non-pinned kernel tasks have left
the CPU, i.e. there cannot be a vCPU task around. So, it is safe for KVM's
CPU offline callback to disable hardware virtualization at that point.
Likewise, KVM's online callback can enable hardware virtualization before
any vCPU task gets a chance to run on hotplugged CPUs.

Rename KVM's CPU hotplug callbacks accordingly.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Chao Gao <chao.gao@intel.com>
Reviewed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
Reviewed-by: Yuan Yao <yuan.yao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/cpuhotplug.h |  2 +-
 virt/kvm/kvm_main.c        | 30 ++++++++++++++++++++++--------
 2 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index 7337414e4947..de45be38dd27 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -185,7 +185,6 @@ enum cpuhp_state {
 	CPUHP_AP_CSKY_TIMER_STARTING,
 	CPUHP_AP_TI_GP_TIMER_STARTING,
 	CPUHP_AP_HYPERV_TIMER_STARTING,
-	CPUHP_AP_KVM_STARTING,
 	/* Must be the last timer callback */
 	CPUHP_AP_DUMMY_TIMER_STARTING,
 	CPUHP_AP_ARM_XEN_STARTING,
@@ -200,6 +199,7 @@ enum cpuhp_state {
 
 	/* Online section invoked on the hotplugged CPU from the hotplug thread */
 	CPUHP_AP_ONLINE_IDLE,
+	CPUHP_AP_KVM_ONLINE,
 	CPUHP_AP_SCHED_WAIT_EMPTY,
 	CPUHP_AP_SMPBOOT_THREADS,
 	CPUHP_AP_X86_VDSO_VMA_ONLINE,
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index dd13af9f06d5..fd9e39c85549 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5026,13 +5026,27 @@ static void hardware_enable_nolock(void *junk)
 	}
 }
 
-static int kvm_starting_cpu(unsigned int cpu)
+static int kvm_online_cpu(unsigned int cpu)
 {
+	int ret = 0;
+
 	raw_spin_lock(&kvm_count_lock);
-	if (kvm_usage_count)
+	/*
+	 * Abort the CPU online process if hardware virtualization cannot
+	 * be enabled. Otherwise running VMs would encounter unrecoverable
+	 * errors when scheduled to this CPU.
+	 */
+	if (kvm_usage_count) {
+		WARN_ON_ONCE(atomic_read(&hardware_enable_failed));
+
 		hardware_enable_nolock(NULL);
+		if (atomic_read(&hardware_enable_failed)) {
+			atomic_set(&hardware_enable_failed, 0);
+			ret = -EIO;
+		}
+	}
 	raw_spin_unlock(&kvm_count_lock);
-	return 0;
+	return ret;
 }
 
 static void hardware_disable_nolock(void *junk)
@@ -5045,7 +5059,7 @@ static void hardware_disable_nolock(void *junk)
 	kvm_arch_hardware_disable();
 }
 
-static int kvm_dying_cpu(unsigned int cpu)
+static int kvm_offline_cpu(unsigned int cpu)
 {
 	raw_spin_lock(&kvm_count_lock);
 	if (kvm_usage_count)
@@ -5822,8 +5836,8 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
 	if (!zalloc_cpumask_var(&cpus_hardware_enabled, GFP_KERNEL))
 		return -ENOMEM;
 
-	r = cpuhp_setup_state_nocalls(CPUHP_AP_KVM_STARTING, "kvm/cpu:starting",
-				      kvm_starting_cpu, kvm_dying_cpu);
+	r = cpuhp_setup_state_nocalls(CPUHP_AP_KVM_ONLINE, "kvm/cpu:online",
+				      kvm_online_cpu, kvm_offline_cpu);
 	if (r)
 		goto out_free_2;
 	register_reboot_notifier(&kvm_reboot_notifier);
@@ -5897,7 +5911,7 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
 	kmem_cache_destroy(kvm_vcpu_cache);
 out_free_3:
 	unregister_reboot_notifier(&kvm_reboot_notifier);
-	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_STARTING);
+	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_ONLINE);
 out_free_2:
 	free_cpumask_var(cpus_hardware_enabled);
 	return r;
@@ -5923,7 +5937,7 @@ void kvm_exit(void)
 	kvm_async_pf_deinit();
 	unregister_syscore_ops(&kvm_syscore_ops);
 	unregister_reboot_notifier(&kvm_reboot_notifier);
-	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_STARTING);
+	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_ONLINE);
 	on_each_cpu(hardware_disable_nolock, NULL, 1);
 	kvm_irqfd_exit();
 	free_cpumask_var(cpus_hardware_enabled);
-- 
2.38.1.431.g37b22c650d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
