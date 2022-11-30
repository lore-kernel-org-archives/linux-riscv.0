Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8EFC4321E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 00:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4eA00ZKe9MV5r2z3Cmvnim+Ec6hg5j6xpTL5gwxqCa4=; b=JR7lCHKhlolKO8
	V311HDXmvGfy4QDIIvIRTiHpxUt1H8mls5zfKKPrNJcKH98ch3l2rYci0A1sELX5WKB5yyOVbD/1p
	NEmGj4W4wvTplb7UGdlKLq/6rScwF/dqK8nTMXD9xx6gQRU3SqMcJhiqjvL3SVyg7KCmb1vKLAAxw
	LI/EYigOmF05kBqBYNE7HeiUk7AcjoTiZF4HNbXdtp7FK4QdxFklHvbBlbaZr2JQLH6h9sPk960gF
	YK7uUPEJfZfJgeR+WMVgiJReDuh1GbaiEBeNvbT5wbnnOhWZNHLR0mJyc5ZcTmSNgpDPfkEdfDxQ8
	TDPr6KkRh15hDBRtWSMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0X4K-003Tkk-VF; Thu, 01 Dec 2022 00:04:49 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Wbf-003Gqn-D0
	for linux-riscv@bombadil.infradead.org; Wed, 30 Nov 2022 23:35:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MJave+Z+CqVOQlKYNh+9u1XLbNgTtvhVtL4XdeBXq3U=; b=JGyk4nR1BLBknztYfk0hR8frd4
	bCaNae5atV85pQXA9XONa6pK4qKrMZdYOsZ4IFBEHwPvPOreCTHh/mevd+zv1ZpS0rVrHK5a0V+Ip
	tkM6eJxB17pwL2ZkZ+F5DQABXRwPabuI/6M+GXocIUN22ZX6M1YuUqWd/aaQuI/3tKTVvsITw8bMt
	i7MqzZIhr6wdmmBk/m8a13nlYrBRL56VdGK1WeJIKBqlkwoeb02dMmT4641+9HFwZhq5l709THeKD
	AbxqxpejZqDLL5FJsxsExKJPqJlPzMHp2HJD+bjMmR7ggd3cvC/t0KhYkZSOpvJcVE6jEkDubdy5F
	s2d7VhGQ==;
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WDQ-00FPpn-O4
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 23:10:12 +0000
Received: by mail-pf1-x44a.google.com with SMTP id t18-20020aa79392000000b0057539377070so150294pfe.21
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 15:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=MJave+Z+CqVOQlKYNh+9u1XLbNgTtvhVtL4XdeBXq3U=;
        b=ZO3Ftedng5ZXtAj1HLjLejIkXeEuGF++TCmzhSGUO/jffRhjc4H+xBEcj7yIeqEdat
         0U3Y+Ads6LzFvxNp27Uo8B2HMacUCZIv0pSE92rlIHxzWTi7f9KsRULC+bwhGX87ZVPR
         vnMRqpKsuzzrvEbFNarvM7whj/3tQRNLMCHwuLgw98CUXaVYGXJOn+GNNpcbHsAkPmeN
         tXU852Btu7ns0KpVR55ygwmLkYJEnvUvyvy5iEVsL5b//kXV7FWMRdutGQwiv7w9+h2Y
         WeYcLiKtjVQOAjeb0ZzTx4wnLQ7dUbOEoRqTrEQ9fS/dnvpncahogy2siy31VVqOiND3
         XFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MJave+Z+CqVOQlKYNh+9u1XLbNgTtvhVtL4XdeBXq3U=;
        b=buGJz7g/1/3gfS62k0jVaAqO6WhaskLrR9RZQU1DXIF6khFmpKTwE0GhEwKEGAVUB3
         snDN6/n1aqbIT3NntRlvP+MZFMeM8ZO3+iG0Xwg3DVgh7q0bHcIdRbJS3eQglU6ALHhn
         bUmgrkbnTig2qFydE0R9+g/9QsT+y/kBauulaLRzBe3aCBJrEyricQ9x090CtoWcGlHy
         Nco9BGBhS6MqMiJ4tBTR9ofnNzJ8pFSlh0CGaUbhHFxmrqqnbiGHvj5n2UIdI4dp7uaM
         +Zm1dyFGeeQgfEs3B4jLTsFsyojj2LkIV6paABnMqG/a34ixEjSewpedcYsK1V6F07g3
         PlFA==
X-Gm-Message-State: ANoB5pnqV6z2kWJAUeig/hsCRfvmozHYP/MkVGMBwh3OXOnVKuIm4l2R
	9Ns0PNg1q/r4zvg6sxW96OlD8IvuW/k=
X-Google-Smtp-Source: AA0mqf5OF5+sS7pzLlgqnJtqaKfzLdsx3EOQi2ZpWetSPzJEZYu9zjdDHGwAbdG5EGES6Cvu/KbnbnXMVFE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:aa7:8090:0:b0:575:4e92:189e with SMTP id
 v16-20020aa78090000000b005754e92189emr14689428pff.59.1669849799328; Wed, 30
 Nov 2022 15:09:59 -0800 (PST)
Date: Wed, 30 Nov 2022 23:08:57 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-14-seanjc@google.com>
Subject: [PATCH v2 13/50] KVM: x86: Move guts of kvm_arch_init() to standalone helper
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
X-CRM114-CacheID: sfid-20221130_231008_966917_3D55A9E8 
X-CRM114-Status: GOOD (  15.74  )
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

Move the guts of kvm_arch_init() to a new helper, kvm_x86_vendor_init(),
so that VMX can do _all_ arch and vendor initialization before calling
kvm_init().  Calling kvm_init() must be the _very_ last step during init,
as kvm_init() exposes /dev/kvm to userspace, i.e. allows creating VMs.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  3 +++
 arch/x86/kvm/svm/svm.c          | 23 +++++++++++++++++++++--
 arch/x86/kvm/vmx/vmx.c          | 21 +++++++++++++++------
 arch/x86/kvm/x86.c              | 15 +++++++++++++--
 4 files changed, 52 insertions(+), 10 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 70af7240a1d5..04a9ae66fb8d 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1758,6 +1758,9 @@ extern struct kvm_x86_ops kvm_x86_ops;
 #define KVM_X86_OP_OPTIONAL_RET0 KVM_X86_OP
 #include <asm/kvm-x86-ops.h>
 
+int kvm_x86_vendor_init(struct kvm_x86_init_ops *ops);
+void kvm_x86_vendor_exit(void);
+
 #define __KVM_HAVE_ARCH_VM_ALLOC
 static inline struct kvm *kvm_arch_alloc_vm(void)
 {
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 91352d692845..19e81a99c58f 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -5091,15 +5091,34 @@ static struct kvm_x86_init_ops svm_init_ops __initdata = {
 
 static int __init svm_init(void)
 {
+	int r;
+
 	__unused_size_checks();
 
-	return kvm_init(&svm_init_ops, sizeof(struct vcpu_svm),
-			__alignof__(struct vcpu_svm), THIS_MODULE);
+	r = kvm_x86_vendor_init(&svm_init_ops);
+	if (r)
+		return r;
+
+	/*
+	 * Common KVM initialization _must_ come last, after this, /dev/kvm is
+	 * exposed to userspace!
+	 */
+	r = kvm_init(&svm_init_ops, sizeof(struct vcpu_svm),
+		     __alignof__(struct vcpu_svm), THIS_MODULE);
+	if (r)
+		goto err_kvm_init;
+
+	return 0;
+
+err_kvm_init:
+	kvm_x86_vendor_exit();
+	return r;
 }
 
 static void __exit svm_exit(void)
 {
 	kvm_exit();
+	kvm_x86_vendor_exit();
 }
 
 module_init(svm_init)
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index b8bf95b9710d..8e81cd94407d 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -8529,6 +8529,7 @@ static void vmx_exit(void)
 #endif
 
 	kvm_exit();
+	kvm_x86_vendor_exit();
 
 	vmx_cleanup_l1d_flush();
 
@@ -8546,23 +8547,25 @@ static int __init vmx_init(void)
 	 */
 	hv_init_evmcs();
 
+	r = kvm_x86_vendor_init(&vmx_init_ops);
+	if (r)
+		return r;
+
 	r = kvm_init(&vmx_init_ops, sizeof(struct vcpu_vmx),
 		     __alignof__(struct vcpu_vmx), THIS_MODULE);
 	if (r)
-		return r;
+		goto err_kvm_init;
 
 	/*
-	 * Must be called after kvm_init() so enable_ept is properly set
+	 * Must be called after common x86 init so enable_ept is properly set
 	 * up. Hand the parameter mitigation value in which was stored in
 	 * the pre module init parser. If no parameter was given, it will
 	 * contain 'auto' which will be turned into the default 'cond'
 	 * mitigation mode.
 	 */
 	r = vmx_setup_l1d_flush(vmentry_l1d_flush_param);
-	if (r) {
-		vmx_exit();
-		return r;
-	}
+	if (r)
+		goto err_l1d_flush;
 
 	vmx_setup_fb_clear_ctrl();
 
@@ -8587,5 +8590,11 @@ static int __init vmx_init(void)
 		allow_smaller_maxphyaddr = true;
 
 	return 0;
+
+err_l1d_flush:
+	vmx_exit();
+err_kvm_init:
+	kvm_x86_vendor_exit();
+	return r;
 }
 module_init(vmx_init);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 915d57c3b41d..b33932fca36e 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9278,7 +9278,16 @@ static inline void kvm_ops_update(struct kvm_x86_init_ops *ops)
 
 int kvm_arch_init(void *opaque)
 {
-	struct kvm_x86_init_ops *ops = opaque;
+	return 0;
+}
+
+void kvm_arch_exit(void)
+{
+
+}
+
+int kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
+{
 	u64 host_pat;
 	int r;
 
@@ -9410,8 +9419,9 @@ int kvm_arch_init(void *opaque)
 	kmem_cache_destroy(x86_emulator_cache);
 	return r;
 }
+EXPORT_SYMBOL_GPL(kvm_x86_vendor_init);
 
-void kvm_arch_exit(void)
+void kvm_x86_vendor_exit(void)
 {
 	kvm_unregister_perf_callbacks();
 
@@ -9440,6 +9450,7 @@ void kvm_arch_exit(void)
 	WARN_ON(static_branch_unlikely(&kvm_xen_enabled.key));
 #endif
 }
+EXPORT_SYMBOL_GPL(kvm_x86_vendor_exit);
 
 static int __kvm_emulate_halt(struct kvm_vcpu *vcpu, int state, int reason)
 {
-- 
2.38.1.584.g0f3c55d4c2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
