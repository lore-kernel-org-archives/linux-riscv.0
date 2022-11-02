Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778B4C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Nov 2022 23:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+icGQ8JbP9fUKozrz5GtpMuXpmF1oVIUJrrVZ0TPet0=; b=R/Z+x0QZkPi3Yv
	XvoXbhoua4TeAFGyk/Rzfauh/9JuDsc1g/n4vnYbheIQgHwiD2e0jsFNzmr4Wh2X21aN2ii9vkvtA
	w2oZND6BqBmeFHPgmWA3qCnc3wuNdrB3sM++I2jjJIwxtRuQY5bk0B1MHjEcJrD4HeriA3JbryJYm
	Ue26YaYobw9gYUCWskrKzHHf+Ux8hMjmK7dJeo+tklJ8RgeYROt6d4K8RvMGidAyP9gF9zlIPjKJW
	llEY31tUM2rlnJ/R+TH7cKfj3gQVshbX4Y7ghMsaLBWNfaT0fqNQOqOcNYHtYyEgoJkYtP6x0wS2/
	ePil1aPwtO4KF/tjOo1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqNXm-00FCaM-2e; Wed, 02 Nov 2022 23:53:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqNGi-00F1m3-Kq
	for linux-riscv@bombadil.infradead.org; Wed, 02 Nov 2022 23:35:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ny13H9j4cIjKO1SZwLLCS8PC9upQWvRm8VxGRZ8ZYmk=; b=nxcB+1tJxBd+OnSbS5P/SKGJAi
	hwvevhlczBH22o+Bvg10s4nKr9NRjcN9+45YnkDdenv58Mbyfm8lKf+8qzI1DZ2eJMXl5nBncYvdn
	Ox6JwSHIUwVKwx3NcXNZbmNpTwUCK3a7PFEIkJ7pwcA7U8DvDta5s3X556fHrNJdY6YPVy38V6650
	0iqUI4mpT04eadgLiDkuMD2Yd8qop+mT3HbPVY/0Ax5WO0+vuEXFAZUtP3YazgZmR6OAx87z2KeVz
	/p2ARdUMSM5k/mFJsaEF9Lt0bQc/8oFLNHWbGZ1CJfuEb1bKmL80ym98aHdRRhTROBxTQHEiigRkb
	XRq7zVsA==;
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN1M-005vnN-Ve
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 23:19:48 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id b14-20020a056902030e00b006a827d81fd8so334254ybs.17
        for <linux-riscv@lists.infradead.org>; Wed, 02 Nov 2022 16:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ny13H9j4cIjKO1SZwLLCS8PC9upQWvRm8VxGRZ8ZYmk=;
        b=aJLuaf2vXfUATM8W1/jE2OXBe4WAQ8dl1SISKNHYxZm6XYiaEQEldvLhewXR2eoETv
         Fw/jD0wjvKzFfk4tKXiMdcaQANZjBOqWFwpUTkCiYrS1KoWMoASaSZ1AAVRSXXWHKzcy
         J5winaqMDM1M55OWGJMjEIBCPn6rmyyWEn4JEc/So2d0X3wfww0UB3fpj4xWGWuHGH+o
         bs6a+b61s/pjW8I+hfWKEAZojN69i8ynJ5A/X5/CrkMV2FiIZWRTDzucxZRStyDIQPKv
         ZMaWAm5aAaOoUdh/mazRbnD+v8xZzK1hmty4pgDvHoXILXiliGAwX6BXN0kBESciCUz4
         3jqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ny13H9j4cIjKO1SZwLLCS8PC9upQWvRm8VxGRZ8ZYmk=;
        b=G51AonGqONst//d7ifd15dOSnH1wmTrpBfzb24nr/huyv6IzC/hppUQLoHPtyj/LuY
         MBGF4HO7G9OUpaWvNxlvLJ6e2Ai1SWwS9KQsu64cumlAR30ykUXzkgfsChIBs4QCTdch
         /fPX/M9n/4GUP6X7qXBMAstd3OIIviT8lG+CMqum+1V0bMxOPW///2FGX+tyPkBTbdQw
         XX9yuOB1PvoHfSPS4lx/luwZ+MKHzBjDhyJN91V3bNj8+The4ZQac8OQ5O5tdOYBg/UP
         xa90hyyLIbEfDqeWk+SOKYckcIaz1REBBZlwYHy2sx+ryA+dBAknCEwPdCR2fpu08G1a
         yTXw==
X-Gm-Message-State: ACrzQf3NZ9XDdsnvit9BnaDdE4cYkyYaBAsNA+mMTe819iI8WgKnago4
	Ahpm9h4XLBq1wHOMNueldnQDNWndceA=
X-Google-Smtp-Source: AMsMyM4ziWAoxK3B7TTCH6W4aFyoFb3DGw1decUo8flpRCJHJwk9oxmuretGO0t2fbQiTdSn9tHNgCtS0bI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:703:b0:6ca:a928:159f with SMTP id
 k3-20020a056902070300b006caa928159fmr25507895ybt.303.1667431176012; Wed, 02
 Nov 2022 16:19:36 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:18:40 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-14-seanjc@google.com>
Subject: [PATCH 13/44] KVM: x86: Serialize vendor module initialization
 (hardware setup)
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
X-CRM114-CacheID: sfid-20221102_231945_057614_69567F54 
X-CRM114-Status: GOOD (  11.47  )
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

Acquire a new mutex, vendor_module_lock, in kvm_x86_vendor_init() while
doing hardware setup to ensure that concurrent calls are fully serialized.
KVM rejects attempts to load vendor modules if a different module has
already been loaded, but doesn't handle the case where multiple vendor
modules are loaded at the same time, and module_init() doesn't run under
the global module_mutex.

Note, in practice, this is likely a benign bug as no platform exists that
supports both SVM and VMX, i.e. barring a weird VM setup, one of the
vendor modules is guaranteed to fail a support check before modifying
common KVM state.

Alternatively, KVM could perform an atomic CMPXCHG on .hardware_enable,
but that comes with its own ugliness as it would require setting
.hardware_enable before success is guaranteed, e.g. attempting to load
the "wrong" could result in spurious failure to load the "right" module.

Introduce a new mutex as using kvm_lock is extremely deadlock prone due
to kvm_lock being taken under cpus_write_lock(), and in the future, under
under cpus_read_lock().  Any operation that takes cpus_read_lock() while
holding kvm_lock would potentially deadlock, e.g. kvm_timer_init() takes
cpus_read_lock() to register a callback.  In theory, KVM could avoid
such problematic paths, i.e. do less setup under kvm_lock, but avoiding
all calls to cpus_read_lock() is subtly difficult and thus fragile.  E.g.
updating static calls also acquires cpus_read_lock().

Inverting the lock ordering, i.e. always taking kvm_lock outside
cpus_read_lock(), is not a viable option, e.g. kvm_online_cpu() takes
kvm_lock and is called under cpus_write_lock().

The lockdep splat below is dependent on future patches to take
cpus_read_lock() in hardware_enable_all(), but as above, deadlock is
already is already possible.

  ======================================================
  WARNING: possible circular locking dependency detected
  6.0.0-smp--7ec93244f194-init2 #27 Tainted: G           O
  ------------------------------------------------------
  stable/251833 is trying to acquire lock:
  ffffffffc097ea28 (kvm_lock){+.+.}-{3:3}, at: hardware_enable_all+0x1f/0xc0 [kvm]

               but task is already holding lock:
  ffffffffa2456828 (cpu_hotplug_lock){++++}-{0:0}, at: hardware_enable_all+0xf/0xc0 [kvm]

               which lock already depends on the new lock.

               the existing dependency chain (in reverse order) is:

               -> #1 (cpu_hotplug_lock){++++}-{0:0}:
         cpus_read_lock+0x2a/0xa0
         __cpuhp_setup_state+0x2b/0x60
         __kvm_x86_vendor_init+0x16a/0x1870 [kvm]
         kvm_x86_vendor_init+0x23/0x40 [kvm]
         0xffffffffc0a4d02b
         do_one_initcall+0x110/0x200
         do_init_module+0x4f/0x250
         load_module+0x1730/0x18f0
         __se_sys_finit_module+0xca/0x100
         __x64_sys_finit_module+0x1d/0x20
         do_syscall_64+0x3d/0x80
         entry_SYSCALL_64_after_hwframe+0x63/0xcd

               -> #0 (kvm_lock){+.+.}-{3:3}:
         __lock_acquire+0x16f4/0x30d0
         lock_acquire+0xb2/0x190
         __mutex_lock+0x98/0x6f0
         mutex_lock_nested+0x1b/0x20
         hardware_enable_all+0x1f/0xc0 [kvm]
         kvm_dev_ioctl+0x45e/0x930 [kvm]
         __se_sys_ioctl+0x77/0xc0
         __x64_sys_ioctl+0x1d/0x20
         do_syscall_64+0x3d/0x80
         entry_SYSCALL_64_after_hwframe+0x63/0xcd

               other info that might help us debug this:

   Possible unsafe locking scenario:

         CPU0                    CPU1
         ----                    ----
    lock(cpu_hotplug_lock);
                                 lock(kvm_lock);
                                 lock(cpu_hotplug_lock);
    lock(kvm_lock);

                *** DEADLOCK ***

  1 lock held by stable/251833:
   #0: ffffffffa2456828 (cpu_hotplug_lock){++++}-{0:0}, at: hardware_enable_all+0xf/0xc0 [kvm]

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index a0ca401d3cdf..218707597bea 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -128,6 +128,7 @@ static int kvm_vcpu_do_singlestep(struct kvm_vcpu *vcpu);
 static int __set_sregs2(struct kvm_vcpu *vcpu, struct kvm_sregs2 *sregs2);
 static void __get_sregs2(struct kvm_vcpu *vcpu, struct kvm_sregs2 *sregs2);
 
+static DEFINE_MUTEX(vendor_module_lock);
 struct kvm_x86_ops kvm_x86_ops __read_mostly;
 
 #define KVM_X86_OP(func)					     \
@@ -9280,7 +9281,7 @@ void kvm_arch_exit(void)
 
 }
 
-int kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
+static int __kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
 {
 	u64 host_pat;
 	int r;
@@ -9413,6 +9414,17 @@ int kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
 	kmem_cache_destroy(x86_emulator_cache);
 	return r;
 }
+
+int kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
+{
+	int r;
+
+	mutex_lock(&vendor_module_lock);
+	r = __kvm_x86_vendor_init(ops);
+	mutex_unlock(&vendor_module_lock);
+
+	return r;
+}
 EXPORT_SYMBOL_GPL(kvm_x86_vendor_init);
 
 void kvm_x86_vendor_exit(void)
@@ -9435,7 +9447,6 @@ void kvm_x86_vendor_exit(void)
 	cancel_work_sync(&pvclock_gtod_work);
 #endif
 	static_call(kvm_x86_hardware_unsetup)();
-	kvm_x86_ops.hardware_enable = NULL;
 	kvm_mmu_vendor_module_exit();
 	free_percpu(user_return_msrs);
 	kmem_cache_destroy(x86_emulator_cache);
@@ -9443,6 +9454,9 @@ void kvm_x86_vendor_exit(void)
 	static_key_deferred_flush(&kvm_xen_enabled);
 	WARN_ON(static_branch_unlikely(&kvm_xen_enabled.key));
 #endif
+	mutex_lock(&vendor_module_lock);
+	kvm_x86_ops.hardware_enable = NULL;
+	mutex_unlock(&vendor_module_lock);
 }
 EXPORT_SYMBOL_GPL(kvm_x86_vendor_exit);
 
-- 
2.38.1.431.g37b22c650d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
