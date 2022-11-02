Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E575DC43217
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Nov 2022 23:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DgkWTmdUNJ17OPEdbH4GwJ2HsudS6zuZC3mlOu3r97o=; b=v3x6P9c+n2pfQL
	rqaDu35ynqvCSUtz8+L4WVG2tUPZmel/NeLQo+Xmsa34IimI5Ea8tdb+8I8oKUitGEdgYF0Z6mtku
	v0HndcLwanAviiJpg/wOCzdP25rl/UXvuVv5ml3KE8mpX5syfugtwDLQgXMzjGnZMLpcZJ0smUpFM
	u/QJFyBmh2ymiV5Kk70wUPn6TVzGq+pFixY/45GLE7Q1/ZX8syUvPNHwgb/WRcFpbBVRHjA4K/A4t
	UDrL8O9wEf8MMF7WWrRZTVQI205y5Q+iWY7OEcQzCaa6aEa+quE4nRLTrY+jmemWCl/JTOKvTs0On
	S3+DepvGyDlfceD0zjMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN1C-00EtH0-8S; Wed, 02 Nov 2022 23:19:34 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN0x-00Et4S-Hv
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 23:19:21 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-37010fefe48so538597b3.19
        for <linux-riscv@lists.infradead.org>; Wed, 02 Nov 2022 16:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=7+eEYWgdfK2f235NQouH0yOVJiIE3XUzS6aBBcpH2Xg=;
        b=GJuDT4qIFRmN0zrEcesKp5eZ38WFJtAk7eJLI6MT/Ki4scur3JzxZHizyJ8pIsBMLg
         TZsxQflrMw0vV6/LQ4eLuVGkeHataXwJMbFJYWT60aCHjdYTQzerfB15KOU/infpl1Yg
         Dq7XMjNzBlwZlnSc61H5gBHFkm3TEEd35yWHpJa13qtav7MsW7uSfcNWliarLL2r1uQq
         n4Uyhy3npcssGJRIlfdRDpGm7iF4EKYzBOtaYqDiDMZ0E2gBBrutJfjyLCbotmATUg5n
         cvQzCJ4G8GbG22iIRvx4lfqlDB2hxbUTz17cEFGPuQiDi1PGB1ilnB2TMVHOT/GiMblc
         mfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7+eEYWgdfK2f235NQouH0yOVJiIE3XUzS6aBBcpH2Xg=;
        b=R0WQWemqvy/EOyCxoaNaMF6NYBnXe+46AMHJMgFqaoUaxU64M0l8VYDKxLPPp+5ic/
         3C1oQZj9YJ/MwnGXuKVXNgYyTViRb7gTQm1aHH9G+9fjkNz8aI2Ouo26wc7xvQFuzVtv
         r8fDKguU1GuzNV8uvCENxJsb5beuy68OiMbFpp5+lHO3MVZAEn1F5hpLu0ekmjPkrZQa
         uGvtLijtR4CpYzG6raEyNHoH6mujt182kikAsMeCAoB/w+XC8M2ZEpRr61S02q/cLtfa
         p26up+0f8ysoyviybwwCfE0NphPkPSWsluafbWReeTjMGaiGrykKOmod0FAvpKXUOCVD
         GKUw==
X-Gm-Message-State: ACrzQf3QBVzASRSISDsbwznWubRd1IUksh+/95KqGOealRIfcvpuQ54d
	pKvsIMinTHh/mDZDPw8MQFPmGrKAAWE=
X-Google-Smtp-Source: AMsMyM70haTx/XR5G28CKoYVC6XM4t6KIj6EhKrnhdUb7b9djmPG/60PGXPcAfFKa85v8fvZQusLb10dmQQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:afc2:0:b0:6cd:3a43:a395 with SMTP id
 d2-20020a25afc2000000b006cd3a43a395mr12532811ybj.220.1667431158134; Wed, 02
 Nov 2022 16:19:18 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:18:29 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-3-seanjc@google.com>
Subject: [PATCH 02/44] KVM: Initialize IRQ FD after arch hardware setup
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
X-CRM114-CacheID: sfid-20221102_161919_613468_F79EE631 
X-CRM114-Status: GOOD (  16.28  )
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

Move initialization of KVM's IRQ FD workqueue below arch hardware setup
as a step towards consolidating arch "init" and "hardware setup", and
eventually towards dropping the hooks entirely.  There is no dependency
on the workqueue being created before hardware setup, the workqueue is
used only when destroying VMs, i.e. only needs to be created before
/dev/kvm is exposed to userspace.

Move the destruction of the workqueue before the arch hooks to maintain
symmetry, and so that arch code can move away from the hooks without
having to worry about ordering changes.

Reword the comment about kvm_irqfd_init() needing to come after
kvm_arch_init() to call out that kvm_arch_init() must come before common
KVM does _anything_, as x86 very subtly relies on that behavior to deal
with multiple calls to kvm_init(), e.g. if userspace attempts to load
kvm_amd.ko and kvm_intel.ko.  Tag the code with a FIXME, as x86's subtle
requirement is gross, and invoking an arch callback as the very first
action in a helper that is called only from arch code is silly.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 37 ++++++++++++++++++-------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index a188d27f78af..e0424af52acc 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5833,24 +5833,19 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
 	int r;
 	int cpu;
 
+	/*
+	 * FIXME: Get rid of kvm_arch_init(), vendor code should call arch code
+	 * directly.  Note, kvm_arch_init() _must_ be called before anything
+	 * else as x86 relies on checks buried in kvm_arch_init() to guard
+	 * against multiple calls to kvm_init().
+	 */
 	r = kvm_arch_init(opaque);
 	if (r)
-		goto out_fail;
-
-	/*
-	 * kvm_arch_init makes sure there's at most one caller
-	 * for architectures that support multiple implementations,
-	 * like intel and amd on x86.
-	 * kvm_arch_init must be called before kvm_irqfd_init to avoid creating
-	 * conflicts in case kvm is already setup for another implementation.
-	 */
-	r = kvm_irqfd_init();
-	if (r)
-		goto out_irqfd;
+		return r;
 
 	if (!zalloc_cpumask_var(&cpus_hardware_enabled, GFP_KERNEL)) {
 		r = -ENOMEM;
-		goto out_free_0;
+		goto err_hw_enabled;
 	}
 
 	r = kvm_arch_hardware_setup(opaque);
@@ -5894,9 +5889,13 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
 		}
 	}
 
+	r = kvm_irqfd_init();
+	if (r)
+		goto err_irqfd;
+
 	r = kvm_async_pf_init();
 	if (r)
-		goto out_free_4;
+		goto err_async_pf;
 
 	kvm_chardev_ops.owner = module;
 
@@ -5927,6 +5926,9 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
 	kvm_vfio_ops_exit();
 err_vfio:
 	kvm_async_pf_deinit();
+err_async_pf:
+	kvm_irqfd_exit();
+err_irqfd:
 out_free_4:
 	for_each_possible_cpu(cpu)
 		free_cpumask_var(per_cpu(cpu_kick_mask, cpu));
@@ -5938,11 +5940,8 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
 	kvm_arch_hardware_unsetup();
 out_free_1:
 	free_cpumask_var(cpus_hardware_enabled);
-out_free_0:
-	kvm_irqfd_exit();
-out_irqfd:
+err_hw_enabled:
 	kvm_arch_exit();
-out_fail:
 	return r;
 }
 EXPORT_SYMBOL_GPL(kvm_init);
@@ -5967,9 +5966,9 @@ void kvm_exit(void)
 	unregister_reboot_notifier(&kvm_reboot_notifier);
 	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_STARTING);
 	on_each_cpu(hardware_disable_nolock, NULL, 1);
+	kvm_irqfd_exit();
 	kvm_arch_hardware_unsetup();
 	kvm_arch_exit();
-	kvm_irqfd_exit();
 	free_cpumask_var(cpus_hardware_enabled);
 	kvm_vfio_ops_exit();
 }
-- 
2.38.1.431.g37b22c650d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
