Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38FAEC352A1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 23:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mgi7pOqaf0EO1l3pLpFIfrqe2J91JUwpwNweqsrtOaE=; b=loS0F87mk9EvzE
	el9CXhW063GLPd2rEvU03CF9SlNOP7w7k38v4dGopW+un+mc9ywGlAzijTUIp9zCYZb55AU0nDgb2
	wA0uAG2In9uS8EubcBSQDIazIwNQX+DeF4Q5Gf/9YR6jyQj0xfoza/pb9sfGPZF7zRAgp28wQX09Y
	nZX7VYG3udzfYAnpcEJ1n4tESgXztqBF6D0H6d8kmotsgPu8FOUiV/TtCDvu0/1nlCYEo8WHYM4As
	RLusyclk7Qai4ITZ0hbLS3h/wOfCjGoxDzEBxqVhPXCm0mo9UmESuARyRnD68nBxhgQxBrrajsskP
	fwNkch99RCtD57hi/j8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WDM-0036IB-Lp; Wed, 30 Nov 2022 23:10:04 +0000
Received: from mail-oa1-x4a.google.com ([2001:4860:4864:20::4a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WCz-00362V-Kk
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 23:09:43 +0000
Received: by mail-oa1-x4a.google.com with SMTP id 586e51a60fabf-14289aba38aso96083fac.18
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 15:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Ol+f04sMmomAVy3XzqNXK+ShxWrn6gIN96B7OKl5yaM=;
        b=S5armvpc10OdJc+V4p2ZjsfPOSB2+gt+Iv6GXjLvIxarCpnvSzXAszP1ZRQLfxrpVn
         4VKntdMIRcH9d5x9XG1oGb5HbZFayk+JATeZBYQSlvM+DpwmfecZQ8AsDtvEHJv8Um6T
         UA3gJNgXD7v57R6+HWMBuEe+F5z07hORTUOLfSKyijFbwT8eHearvUCVMdt7/m5zjOT/
         RJHYTQwmhGaPhaOc8DfHyXLVsjojQiPBCzNQuFpX8g3cosCwY+5F+o1XrOjsJNDhsv4X
         dI+LD+RMI6RHxUg1kkU/xRepaC5EvnuL3x5vvCzRlD3QPj+jjInfZWGepttgPw2FHtVt
         S1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ol+f04sMmomAVy3XzqNXK+ShxWrn6gIN96B7OKl5yaM=;
        b=gANjoo011dKcKlQ6weQje7CDd2fB+l1oKS0e12YS+XP4f9s4lmDGAe3RWQ/+OXAiQb
         6DxkpKp1kS1c35vfP42PLvR4ryx4+LjbcEO8iPvk9SQmQcDQaVZjTuiPMC+JElNtjT0a
         oehuxGoDqS3dJKcWfXIwfdfux3npznR0on2jvGU+wjiXINlf9B6DFDXBZb8Lu4VSHhvK
         CT3vvWzQpkuTf93o4SyXHGyDhrOVyDOkPw4IeVT1Q/yJC+lWSgZAYP+/a0Law126Q4ll
         Ep+K1V0fuZFb+tjvEg4AfQk2szh6ElnMbF0y3Np7cHbG2l1f30Da59zoYEz4e9B7MgP3
         yI9A==
X-Gm-Message-State: ANoB5pkB+jVbE0nBRKoxyG7ZakiagA75Qe94lduyXLetTsYp1J7EXfd1
	EHl5siP+/p5/FDebgAbajKb+voibsxA=
X-Google-Smtp-Source: AA0mqf5M2pMTumXNgDe8Hfk4OhWDWk4TI1AuNKSU3xW+oTTlboWhE7bh5wRjvWcn8RwiB3BV7R0iM4jxw2w=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6870:bb1a:b0:143:74c2:f928 with SMTP id
 nw26-20020a056870bb1a00b0014374c2f928mr15086226oab.64.1669849778974; Wed, 30
 Nov 2022 15:09:38 -0800 (PST)
Date: Wed, 30 Nov 2022 23:08:45 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-2-seanjc@google.com>
Subject: [PATCH v2 01/50] KVM: Register /dev/kvm as the _very_ last thing
 during initialization
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
X-CRM114-CacheID: sfid-20221130_150941_707574_57A40708 
X-CRM114-Status: GOOD (  11.71  )
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

Register /dev/kvm, i.e. expose KVM to userspace, only after all other
setup has completed.  Once /dev/kvm is exposed, userspace can start
invoking KVM ioctls, creating VMs, etc...  If userspace creates a VM
before KVM is done with its configuration, bad things may happen, e.g.
KVM will fail to properly migrate vCPU state if a VM is created before
KVM has registered preemption notifiers.

Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 1782c4555d94..b60abb03606b 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5919,12 +5919,6 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
 
 	kvm_chardev_ops.owner = module;
 
-	r = misc_register(&kvm_dev);
-	if (r) {
-		pr_err("kvm: misc device register failed\n");
-		goto out_unreg;
-	}
-
 	register_syscore_ops(&kvm_syscore_ops);
 
 	kvm_preempt_ops.sched_in = kvm_sched_in;
@@ -5933,11 +5927,24 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
 	kvm_init_debug();
 
 	r = kvm_vfio_ops_init();
-	WARN_ON(r);
+	if (WARN_ON_ONCE(r))
+		goto err_vfio;
+
+	/*
+	 * Registration _must_ be the very last thing done, as this exposes
+	 * /dev/kvm to userspace, i.e. all infrastructure must be setup!
+	 */
+	r = misc_register(&kvm_dev);
+	if (r) {
+		pr_err("kvm: misc device register failed\n");
+		goto err_register;
+	}
 
 	return 0;
 
-out_unreg:
+err_register:
+	kvm_vfio_ops_exit();
+err_vfio:
 	kvm_async_pf_deinit();
 out_free_4:
 	for_each_possible_cpu(cpu)
@@ -5963,8 +5970,14 @@ void kvm_exit(void)
 {
 	int cpu;
 
-	debugfs_remove_recursive(kvm_debugfs_dir);
+	/*
+	 * Note, unregistering /dev/kvm doesn't strictly need to come first,
+	 * fops_get(), a.k.a. try_module_get(), prevents acquiring references
+	 * to KVM while the module is being stopped.
+	 */
 	misc_deregister(&kvm_dev);
+
+	debugfs_remove_recursive(kvm_debugfs_dir);
 	for_each_possible_cpu(cpu)
 		free_cpumask_var(per_cpu(cpu_kick_mask, cpu));
 	kmem_cache_destroy(kvm_vcpu_cache);
-- 
2.38.1.584.g0f3c55d4c2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
