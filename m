Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E39C43219
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Nov 2022 23:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DC4RamxG7ahaTODe6ML4aM1sTKzpJ3CN16eE9HPBB6o=; b=Qp/0rWWksUy17A
	a4wDwruwKhwXH6H4q5DoCkw0n+ybK+gtXBRsG/axoWkBkOPDZyGu8nSenyAGYISREFFmZuC4JnsZ1
	yqVvZd7gqf2JCggN7SBqvTg6rVtorJXP55C557brul9mELXT1ijLDmHC6JcHdLWEpiif5KwLKUXHq
	P9IM3+yz0svmFEaskC9KNITXVpTmiWtGDAFw06HssLrmZ6jlD20klVd2GbZtpn1Q9yPs5Zv49QnUh
	E/esZr5nJ1warXQ/4wt4K7kBp7U+z3eXdVVcN50hssEmVbQ4pHYFWLvS9bETPZBaCrPhDFD74vBS+
	CVzFlbuG2J6WobxfnrzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN1y-00Etn7-BH; Wed, 02 Nov 2022 23:20:22 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN10-00Et5d-9d
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 23:19:25 +0000
Received: by mail-pl1-x64a.google.com with SMTP id b2-20020a170902d50200b001871a3c51afso227943plg.8
        for <linux-riscv@lists.infradead.org>; Wed, 02 Nov 2022 16:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Pm9EI+cM+5edeoncgirJOK1OjdMfit/iE/V7h68jiBA=;
        b=bL+6TpNkM7xunyoG+gMR3bDhbv+lOJER+h6vrXBg2jRt79YqAlbOV3s6/VQkeIpj52
         Ky1J7zaHaUxciHs2i3/MW5CLnr8pffu2zrCWdSsWEvN6vkqzU4pIQp/Uj0gPLK6GDxI3
         GXoAw0QLp0yQS3/DSHQFoQOG98RSEwY0diep14lnnAfxj0vljm9xePUY2AEeRFGvmBXm
         tRsmblxsjx3f7i/4+Y9GUkzbutc8U0tSPE9xz/PT80Ld6mJSu9LlyVnSoU2uILnp4M37
         3H0YxDU1PZnTyFdDu6Y+lDm6+PExiZVQW1JgbUHVisjW0UqEwp57euCcN8FduUynf2n5
         u4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pm9EI+cM+5edeoncgirJOK1OjdMfit/iE/V7h68jiBA=;
        b=oOaHBndcyg+uM94jR9rOkN8G9YGHnapw3hxUKewoKrLAWvm7z3/XSbZsUgPPz9eiIW
         uomc5LRTRiA/8v5CvY/nA6zZhl0jWTqadlENkkhP5ruO4NjqJ2oXCiAa8Yg8e4zpWm8N
         3/B2HWbPMiKjSXnxwiOdLTWuFeIIOKMhJb05e+KrnNfpPc3cbOSICubHGYEcQwLcEC5v
         1LR2Q9MTlMV3wVyDO98yTVL5IK0isb77Qs4URMCg/vwZMXrnHrXpxlvAJMXLdEvN/YVB
         a3nI0yzIJNXjB8ol66O537IPwmWIewJo471YqQVrFwV8flJvEABGk9Jdd2NHsLJmmnZK
         1IGQ==
X-Gm-Message-State: ACrzQf0Eifyc0KYjY4RPw+eniXM27ObUjiAvjiatEqFpVfx2SEJkH6mv
	J42G2bC9FDATyYExb5aMx9R4JvLkgl0=
X-Google-Smtp-Source: AMsMyM6cjV/OPOyVIfIANSlI60mryZ5mbwTKQzkf0thAVt8NDrReB3H6IytQCpI+wrkAP6TPRUKjJyN3TqA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a62:3281:0:b0:56d:385:149b with SMTP id
 y123-20020a623281000000b0056d0385149bmr27381564pfy.29.1667431159662; Wed, 02
 Nov 2022 16:19:19 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:18:30 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-4-seanjc@google.com>
Subject: [PATCH 03/44] KVM: Allocate cpus_hardware_enabled after arch hardware setup
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
X-CRM114-CacheID: sfid-20221102_161922_415627_0387CFCE 
X-CRM114-Status: GOOD (  11.22  )
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

Allocate cpus_hardware_enabled after arch hardware setup so that arch
"init" and "hardware setup" are called back-to-back and thus can be
combined in a future patch.  cpus_hardware_enabled is never used before
kvm_create_vm(), i.e. doesn't have a dependency with hardware setup and
only needs to be allocated before /dev/kvm is exposed to userspace.

Free the object before the arch hooks are invoked to maintain symmetry,
and so that arch code can move away from the hooks without having to
worry about ordering changes.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index e0424af52acc..8b7534cc953b 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5843,15 +5843,15 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
 	if (r)
 		return r;
 
+	r = kvm_arch_hardware_setup(opaque);
+	if (r < 0)
+		goto err_hw_setup;
+
 	if (!zalloc_cpumask_var(&cpus_hardware_enabled, GFP_KERNEL)) {
 		r = -ENOMEM;
 		goto err_hw_enabled;
 	}
 
-	r = kvm_arch_hardware_setup(opaque);
-	if (r < 0)
-		goto out_free_1;
-
 	c.ret = &r;
 	c.opaque = opaque;
 	for_each_online_cpu(cpu) {
@@ -5937,10 +5937,10 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
 	unregister_reboot_notifier(&kvm_reboot_notifier);
 	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_STARTING);
 out_free_2:
-	kvm_arch_hardware_unsetup();
-out_free_1:
 	free_cpumask_var(cpus_hardware_enabled);
 err_hw_enabled:
+	kvm_arch_hardware_unsetup();
+err_hw_setup:
 	kvm_arch_exit();
 	return r;
 }
@@ -5967,9 +5967,9 @@ void kvm_exit(void)
 	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_STARTING);
 	on_each_cpu(hardware_disable_nolock, NULL, 1);
 	kvm_irqfd_exit();
+	free_cpumask_var(cpus_hardware_enabled);
 	kvm_arch_hardware_unsetup();
 	kvm_arch_exit();
-	free_cpumask_var(cpus_hardware_enabled);
 	kvm_vfio_ops_exit();
 }
 EXPORT_SYMBOL_GPL(kvm_exit);
-- 
2.38.1.431.g37b22c650d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
