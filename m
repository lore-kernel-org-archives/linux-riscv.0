Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3DCC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Nov 2022 23:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wYajTY7k5zanSKhzp8hx3wL2MbSOCi06JmRFaUH37UM=; b=09fehI7uWl00Kz
	5pwDY4Yt2DQ27IMbjMDAxj2u9pPR5dAPKNtj01V/yRpCCQvlB1T11oFDM04R7HzsjNq4WhWejPxeK
	fMHVeg+Y31ZAWh3BYqeNHWNFDuZ0CuJyJxGpizGd0lSDAeSb6+AWlEPDKwu9nWWULCO+NKbvd0MK3
	Wb0heCVCFqpU68kQlYa6RbcxvNbvQPj05SC11Owj5NU+SieCns7lRlUMmg1gXdiJajYlSp9gYT/Vl
	E25HSVGotmP7GZo7HpsCISmhbzEAY/PCicDveBIGw4ywP4QUTe2xkJJE3UQRZixWhWrDlPxULHkj8
	tu5wAsuebDSFJW5TTXFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN7e-00ExTq-RA; Wed, 02 Nov 2022 23:26:14 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN1f-00EtXr-77
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 23:20:05 +0000
Received: by mail-pg1-x54a.google.com with SMTP id f22-20020a635556000000b0046fd05d55cdso99846pgm.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Nov 2022 16:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=dcXVHMPmodJgyjWSWzUUXYPY5IgSqzwbkOwCWMHEoLw=;
        b=OPMCatdO1d8dL+Ta8Py6rxwydwCiY6zCNCXIb+egUN7DrF+5aRQAdkSuE5LIETIlxg
         0Xu5vf6/r2RvlVD4iPwtBSi99UeaHj7aM3+HXPcw2HDQ3PJiTzACg++YppAQSVFrXlbX
         445lXkuRBueb2zaC++Qprbqu7U3tfRRmn8brlw2hji0dV80X6loBURwB99xjrgySZrY+
         JKVDqIwyg7Uc9H75OQ5JSJ5+ZEwkliA75F0m2UzpP0JooJPxj9jKI/TjUoYSf5R0ENlU
         Tfi5fLmiuggsYA2KxI7KZkbk+jQJ4dmmmS2w7RXuC7D2A7bEXPHvjmHFsXPqV4OoFfix
         VIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dcXVHMPmodJgyjWSWzUUXYPY5IgSqzwbkOwCWMHEoLw=;
        b=vPfDzjuDlLlUZJe/7BIuZ0qYzdXp6yv5KaZmJBGlITQbDKMxGi2M0oKn4UW2/ISDsG
         jJjsvcjjlCLGlVlRKSU/EJQwSFzI6NcWY7VXGJ/0rSonEslbDPy3/44nWDY7JbBB9cGh
         RRjdobjtUnHn6zfm99W7Og5FVemqy8K+8HPFrWqV82rWZuQqRZ6cQU64xq+UpV5w2XfA
         +ctxKUBZd8xyh1rwyke8sldmTJOIVtaY9fTtrkbpQBkH4NRNedErxhgJ6ESSVGcf11D5
         JvOYB/IXt31O/ZO6OV4S2Lb3nfDYaTP73MrjQFs/OxCj/ft9HFi9xkGCo/jhj1W8mGon
         qC+Q==
X-Gm-Message-State: ACrzQf32frKpXGytRN22u02mChxzgMw8ysSIi4YbfrAHVIZHy+9UHVaI
	brzEqlND0yJEOpe9ZIhRbIikJYMMAkw=
X-Google-Smtp-Source: AMsMyM6kcll1bBJ/V+TtC0ABRP5ZMtZsbPePz3XyDhX5IOsFn05p1qBMSY73qSxElpChUue2jr1DdAtUr0w=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:aa7:8e89:0:b0:56c:636a:fa37 with SMTP id
 a9-20020aa78e89000000b0056c636afa37mr27413782pfr.83.1667431200240; Wed, 02
 Nov 2022 16:20:00 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:18:54 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-28-seanjc@google.com>
Subject: [PATCH 27/44] KVM: Drop kvm_arch_{init,exit}() hooks
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
X-CRM114-CacheID: sfid-20221102_162003_301664_57760D53 
X-CRM114-Status: GOOD (  14.22  )
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

Drop kvm_arch_init() and kvm_arch_exit() now that all implementations
are nops.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/arm.c                | 11 -----------
 arch/mips/kvm/mips.c                | 10 ----------
 arch/powerpc/include/asm/kvm_host.h |  1 -
 arch/powerpc/kvm/powerpc.c          |  5 -----
 arch/riscv/kvm/main.c               |  9 ---------
 arch/s390/kvm/kvm-s390.c            | 10 ----------
 arch/x86/kvm/x86.c                  | 10 ----------
 include/linux/kvm_host.h            |  3 ---
 virt/kvm/kvm_main.c                 | 19 ++-----------------
 9 files changed, 2 insertions(+), 76 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 6e0061eac627..75c5125b0dd3 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2284,17 +2284,6 @@ static __init int kvm_arm_init(void)
 	return err;
 }
 
-int kvm_arch_init(void *opaque)
-{
-	return 0;
-}
-
-/* NOP: Compiling as a module not supported */
-void kvm_arch_exit(void)
-{
-
-}
-
 static int __init early_kvm_mode_cfg(char *arg)
 {
 	if (!arg)
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index ae7a24342fdf..3cade648827a 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -1010,16 +1010,6 @@ long kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 	return r;
 }
 
-int kvm_arch_init(void *opaque)
-{
-	return 0;
-}
-
-void kvm_arch_exit(void)
-{
-
-}
-
 int kvm_arch_vcpu_ioctl_get_sregs(struct kvm_vcpu *vcpu,
 				  struct kvm_sregs *sregs)
 {
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 5d2c3a487e73..0a80e80c7b9e 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -881,7 +881,6 @@ static inline void kvm_arch_sync_events(struct kvm *kvm) {}
 static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
 static inline void kvm_arch_flush_shadow_all(struct kvm *kvm) {}
 static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
-static inline void kvm_arch_exit(void) {}
 static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
 static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
 
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 36c27381a769..34278042ad27 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -2525,11 +2525,6 @@ void kvmppc_init_lpid(unsigned long nr_lpids_param)
 }
 EXPORT_SYMBOL_GPL(kvmppc_init_lpid);
 
-int kvm_arch_init(void *opaque)
-{
-	return 0;
-}
-
 EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_ppc_instr);
 
 void kvm_arch_create_vcpu_debugfs(struct kvm_vcpu *vcpu, struct dentry *debugfs_dentry)
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index cb063b8a9a0f..4710a6751687 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -65,15 +65,6 @@ void kvm_arch_hardware_disable(void)
 	csr_write(CSR_HIDELEG, 0);
 }
 
-int kvm_arch_init(void *opaque)
-{
-	return 0;
-}
-
-void kvm_arch_exit(void)
-{
-}
-
 static int __init riscv_kvm_init(void)
 {
 	const char *str;
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index f6ae845bc1c1..7c1c6d81b5d7 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -533,16 +533,6 @@ static void __kvm_s390_exit(void)
 	debug_unregister(kvm_s390_dbf_uv);
 }
 
-int kvm_arch_init(void *opaque)
-{
-	return 0;
-}
-
-void kvm_arch_exit(void)
-{
-
-}
-
 /* Section: device related */
 long kvm_arch_dev_ioctl(struct file *filp,
 			unsigned int ioctl, unsigned long arg)
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 218707597bea..2b4530a33298 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9271,16 +9271,6 @@ static inline void kvm_ops_update(struct kvm_x86_init_ops *ops)
 	kvm_pmu_ops_update(ops->pmu_ops);
 }
 
-int kvm_arch_init(void *opaque)
-{
-	return 0;
-}
-
-void kvm_arch_exit(void)
-{
-
-}
-
 static int __kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
 {
 	u64 host_pat;
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 9b52bd40be56..6c2a28c4c684 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1423,9 +1423,6 @@ int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
 					struct kvm_guest_debug *dbg);
 int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu);
 
-int kvm_arch_init(void *opaque);
-void kvm_arch_exit(void);
-
 void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu);
 
 void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 27ce263a80e4..17c852cb6842 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5833,20 +5833,8 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
 	int r;
 	int cpu;
 
-	/*
-	 * FIXME: Get rid of kvm_arch_init(), vendor code should call arch code
-	 * directly.  Note, kvm_arch_init() _must_ be called before anything
-	 * else as x86 relies on checks buried in kvm_arch_init() to guard
-	 * against multiple calls to kvm_init().
-	 */
-	r = kvm_arch_init(opaque);
-	if (r)
-		return r;
-
-	if (!zalloc_cpumask_var(&cpus_hardware_enabled, GFP_KERNEL)) {
-		r = -ENOMEM;
-		goto err_hw_enabled;
-	}
+	if (!zalloc_cpumask_var(&cpus_hardware_enabled, GFP_KERNEL))
+		return -ENOMEM;
 
 	c.ret = &r;
 	c.opaque = opaque;
@@ -5934,8 +5922,6 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
 	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_STARTING);
 out_free_2:
 	free_cpumask_var(cpus_hardware_enabled);
-err_hw_enabled:
-	kvm_arch_exit();
 	return r;
 }
 EXPORT_SYMBOL_GPL(kvm_init);
@@ -5963,7 +5949,6 @@ void kvm_exit(void)
 	on_each_cpu(hardware_disable_nolock, NULL, 1);
 	kvm_irqfd_exit();
 	free_cpumask_var(cpus_hardware_enabled);
-	kvm_arch_exit();
 }
 EXPORT_SYMBOL_GPL(kvm_exit);
 
-- 
2.38.1.431.g37b22c650d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
