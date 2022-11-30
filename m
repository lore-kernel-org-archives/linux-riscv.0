Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6E8C4321E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 00:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aa++72vOk0wVDsFXrORiUJzLuZQMFVY9TXQ/WHEIdvA=; b=Ytdrsdt5ukacDN
	iHSRuE99OvzrB/D9NBVjDjMvlXwHXmxydM1uf/x+Fcs1wyU/uqf4ZHULOpUcL76Wpvm8hiuaGFocd
	cQ6lfa4ZDJD6wUFimTU0FXFs1KRLyYC5zjpcLUNasc87xmt18Hh5Wik+bQON7rhDlJT8Raq5teCov
	NbsDIQOqIyhc2i/OgyTW+tFA2Vnl+QSwrWqXuv7IQfj5xkaJNQ3rq7YTNJ5mDsp2n0brgQpsXFNIY
	raF6Ogq/aUJ714uyh1WM2gPd9RzhlB0ozsUMfFWI4G+vGOMiyqXVU8X/BJm3MKHIAbIcSmhK9V+3A
	ZWt2xeDT1SLl1mA8dHfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0X3u-003TUq-2b; Thu, 01 Dec 2022 00:04:22 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Wbc-003Gqn-Pf
	for linux-riscv@bombadil.infradead.org; Wed, 30 Nov 2022 23:35:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=di4GPfaF6WKRfgW0XqJub+upfuRM26VzAsGaqEV4LGw=; b=r2SIMA2m53o+vJkei63OJwfGTJ
	GW4yFPoVBJjaBNgeeoQ7Ko3IbDbaiefy2HCUcShGa0gTbi6K3BdR5tVVX1yS4ttqtlfnOCdFHrbrJ
	EWvMUnx2/W9C6rgFRcKs5Tzq5NBM4tKNFh+ahibOYjjqQc7bt0ZA/D+5UyvCt172vm1B9rVrMyE9C
	oP0AP9GBbuSh2rI4ee+2vJMF0k/jlzvGxzphffpN8Szbsvgc6Lr5JntgpWepVkM0o7eR4FIO5jm7L
	AW62rSDifsX8DI3qZAovfjgsQ+w6A6ALfLBEYGWFM5CjrNmdOe30xWc9uZ5KIlFVPxElcSZrYeJzU
	qyP95nIg==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WDS-00FPr8-Rr
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 23:10:13 +0000
Received: by mail-pj1-x104a.google.com with SMTP id mh8-20020a17090b4ac800b0021348e084a0so3774959pjb.8
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 15:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=di4GPfaF6WKRfgW0XqJub+upfuRM26VzAsGaqEV4LGw=;
        b=Zp0X+tvqlodbVDmXJAlHsgiG3eKVrrt9FqJ/G91Ka+FyaPGocW43mHdutS/PZpQE36
         Iieu9/BWXmUBsCNeoXw2w6AGd8PrG42NkgB6lU08wcdcc8UwAyPwoD57C6YJX6W8d8L6
         zT+J1YBLZIf8EiLqUI0I1OI8MzvM21Wx5gQBxNbTBtyOAXzto+GobOper+U00pyFgXJf
         UdMZA+TjdcslZ9rB8fGS/EHatJp3upDo3FA+0llGAcT+1sttGOmsewFGvBZuTST5TDKg
         atyPT5DCNi18z7jSv+tnMdXu5HV1aXplTTP+Szmkxtce4LN+raVvUsuQA85wOwn+8uqH
         psnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=di4GPfaF6WKRfgW0XqJub+upfuRM26VzAsGaqEV4LGw=;
        b=PlHLC142haKa9+QDYfDiUuW1D5PuS4gfEmZAUH7sAycQw0LL9JPleyupWfjRc8BIAa
         4PqxeOZhvwj1qJ1k4AfkOiNu1PVMx0uWbMx8DR7qxzvn8p1mMuvJjUtAvFXPzCSBgql+
         l/k6qlMuGcZHNsrbxFjtx0MKFpFTl5dn/agBCULhSJu5aLFkIsAcOHHeo2gPGVzi9jUr
         WbvSFXLEzuD3LcJOOaQE5lZSeNl1J6RIOblv6Wgd88yVMkjodUyY4BCEaBlq+l1EAfJp
         oEOixC9cd9uypzySKXQJsuZ/kmozYu1j1w6MNT7Gf5rsnW555niq66vdWMhMx+EzzQ46
         Kd1Q==
X-Gm-Message-State: ANoB5plenTXMKntTnsiwMctOSYJQQ4YyFOkuWDuDE4f99WHAxGmSAh70
	OKzhBnVvmIkWPt3rhR0lLU/EPpYoE8g=
X-Google-Smtp-Source: AA0mqf4OklfcBkfFMEfVjeAO6z8Tg9xRFY+PEerZY3OMpeOrjrDiJtxtxuLC1x65bjbuGkZn4Pd66WRIuco=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:1409:b0:56b:e1d8:e7a1 with SMTP id
 l9-20020a056a00140900b0056be1d8e7a1mr44197245pfu.28.1669849801157; Wed, 30
 Nov 2022 15:10:01 -0800 (PST)
Date: Wed, 30 Nov 2022 23:08:58 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-15-seanjc@google.com>
Subject: [PATCH v2 14/50] KVM: VMX: Do _all_ initialization before exposing
 /dev/kvm to userspace
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
X-CRM114-CacheID: sfid-20221130_231011_038128_6997DA48 
X-CRM114-Status: GOOD (  14.44  )
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

Call kvm_init() only after _all_ setup is complete, as kvm_init() exposes
/dev/kvm to userspace and thus allows userspace to create VMs (and call
other ioctls).  E.g. KVM will encounter a NULL pointer when attempting to
add a vCPU to the per-CPU loaded_vmcss_on_cpu list if userspace is able to
create a VM before vmx_init() configures said list.

 BUG: kernel NULL pointer dereference, address: 0000000000000008
 #PF: supervisor write access in kernel mode
 #PF: error_code(0x0002) - not-present page
 PGD 0 P4D 0
 Oops: 0002 [#1] SMP
 CPU: 6 PID: 1143 Comm: stable Not tainted 6.0.0-rc7+ #988
 Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 0.0.0 02/06/2015
 RIP: 0010:vmx_vcpu_load_vmcs+0x68/0x230 [kvm_intel]
  <TASK>
  vmx_vcpu_load+0x16/0x60 [kvm_intel]
  kvm_arch_vcpu_load+0x32/0x1f0 [kvm]
  vcpu_load+0x2f/0x40 [kvm]
  kvm_arch_vcpu_create+0x231/0x310 [kvm]
  kvm_vm_ioctl+0x79f/0xe10 [kvm]
  ? handle_mm_fault+0xb1/0x220
  __x64_sys_ioctl+0x80/0xb0
  do_syscall_64+0x2b/0x50
  entry_SYSCALL_64_after_hwframe+0x46/0xb0
 RIP: 0033:0x7f5a6b05743b
  </TASK>
 Modules linked in: vhost_net vhost vhost_iotlb tap kvm_intel(+) kvm irqbypass

Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 8e81cd94407d..76185a7a7ded 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -8521,19 +8521,23 @@ static void vmx_cleanup_l1d_flush(void)
 	l1tf_vmx_mitigation = VMENTER_L1D_FLUSH_AUTO;
 }
 
-static void vmx_exit(void)
+static void __vmx_exit(void)
 {
+	allow_smaller_maxphyaddr = false;
+
 #ifdef CONFIG_KEXEC_CORE
 	RCU_INIT_POINTER(crash_vmclear_loaded_vmcss, NULL);
 	synchronize_rcu();
 #endif
-
-	kvm_exit();
-	kvm_x86_vendor_exit();
-
 	vmx_cleanup_l1d_flush();
+}
 
-	allow_smaller_maxphyaddr = false;
+static void vmx_exit(void)
+{
+	kvm_exit();
+	kvm_x86_vendor_exit();
+
+	__vmx_exit();
 }
 module_exit(vmx_exit);
 
@@ -8551,11 +8555,6 @@ static int __init vmx_init(void)
 	if (r)
 		return r;
 
-	r = kvm_init(&vmx_init_ops, sizeof(struct vcpu_vmx),
-		     __alignof__(struct vcpu_vmx), THIS_MODULE);
-	if (r)
-		goto err_kvm_init;
-
 	/*
 	 * Must be called after common x86 init so enable_ept is properly set
 	 * up. Hand the parameter mitigation value in which was stored in
@@ -8589,11 +8588,20 @@ static int __init vmx_init(void)
 	if (!enable_ept)
 		allow_smaller_maxphyaddr = true;
 
+	/*
+	 * Common KVM initialization _must_ come last, after this, /dev/kvm is
+	 * exposed to userspace!
+	 */
+	r = kvm_init(&vmx_init_ops, sizeof(struct vcpu_vmx),
+		     __alignof__(struct vcpu_vmx), THIS_MODULE);
+	if (r)
+		goto err_kvm_init;
+
 	return 0;
 
-err_l1d_flush:
-	vmx_exit();
 err_kvm_init:
+	__vmx_exit();
+err_l1d_flush:
 	kvm_x86_vendor_exit();
 	return r;
 }
-- 
2.38.1.584.g0f3c55d4c2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
