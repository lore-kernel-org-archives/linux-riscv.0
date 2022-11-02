Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14E0C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 00:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NzXheKhjrTsNrHhMcQcuk776JuXXIccrMa84fpL4Md8=; b=uiESuU2QKo6Xme
	+143yHHkwFNa2gcxta0w+vj1lpPAkQUeQLCN1CxMZx+3hp4MVIegF4+xy4pOwnkCogjbF1RScD1DU
	bKMrOKqCDvMwSIFdQ9z4MKylyrEJaN2PNLFQizXyMMKIzV0uywRdpllS2imSBZXEWfhF9twnaU4NK
	9gflnwzIYwqMFBnCvCAakRaDJXU/15qmBXANOde/RLhefN9Jq25AmDCLrNgMFjMkzgCMttSVI/62D
	mVvGTKQWiWez0PmcqpyDKzWvyrlTtRHp96JNBGzJAUtRRcKSBnu6PS2hX/Prg6Gycz1VlmS3P9/zp
	DLqoHgq9l2P8vmE0Sx4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqOCM-00FMHc-Hl; Thu, 03 Nov 2022 00:35:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqO62-00FJ6v-Pm
	for linux-riscv@bombadil.infradead.org; Thu, 03 Nov 2022 00:28:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hS5bVpzKUqQDTwIOc5biqhWk5bOmOk+1edZQlwf3ubM=; b=m8ZQvyhHmIwVEE/6lC9bqiqwwn
	Kg+Gl0xPb+Yk0iwtuiPJCIhkAIr4K2Lk+TF6UdwNMyss4O9HWlfnRIflsdqv2F+fASWOqKzfGlTJ1
	OmUSsMaCGpiR/CsVbwiAF7GXBfirdsZ9lYiXaTNkRZSppkE9JZemz9UOrtTxUdU3aqRDS78ROfFXj
	nHmCFZaaDIz/Jdgj5YjfoZFIgeYoEBhG/6novghrSpq7HoktwB1t93qenavAUYK86LeIZRurkw5OE
	HeBRGegvcpv5KoItA8AzJ1lJdKpg6CEjmMnzVczsYbKJTC9A4+9jWDRYAMX8B7mKGvGgPuLboc3dE
	5GSlNC7Q==;
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN1E-008WwK-LI
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 23:19:38 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id e8-20020a5b0cc8000000b006bca0fa3ab6so436976ybr.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Nov 2022 16:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=hS5bVpzKUqQDTwIOc5biqhWk5bOmOk+1edZQlwf3ubM=;
        b=szPHLkhFGnRo6kaiXnFdGUAqKFDyeLG3Vql25w1uL10gFIqtapkpUXMYdCQdli+eqs
         cbcj9hSkNeNK0P7+t1BZFEIlTNuiaIp2mlW4xEBL0WtOOQIpQ9D+xxA8r7FTE3/hx8Ou
         8DfXEw5LuqLAgTGoPS8P3pICN4y6IJD/Snp87sY45+PuVlEkpSraOhTndfuv/3GEK8T+
         hn9gmRaXJDkisGpZk2f61kkZWmIpTFHWF2nSKiSU6rb6VwxKCNie2hpdgPJEzJyQa//E
         mMEwJkz2TFE7q1HlBlgTUEk3XIDzTUi+TWq+4KEAGQJ1QDIj47GdP3s/hYuMvyLPXFzC
         fAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hS5bVpzKUqQDTwIOc5biqhWk5bOmOk+1edZQlwf3ubM=;
        b=3gNEIzW/9ryn1B2S9lRRt9P6+1j2THG22nWBWRL/PEjloRMDEC077g7cXY6O5xFl0d
         /tVrqbdXmk4ilPFxe9SnZ5KqIHWCDkLT0XjXhHtsqd7aj3UMblk2QqlIv58frgA0v080
         y1yjpoE0ve5GdlWotHVa7TH+CuIHr2WcG56cPmVjN5L3+2jtr8QUSSep1bAUQ+MVqYGi
         ZKNB/bP9cXdyGKQot+m7NW+8H15fZOXF1jxeOsXhPtRqNeNqd1O+KaLl+iuZjpQvvN3s
         SqiaDHk2RKMBdkNCgh0JY6lSeBw1pPdRlEwRgY9+es0Se84rdFbDYqfqS9UO2TP8TB/J
         IFUQ==
X-Gm-Message-State: ACrzQf3/BALAlVGCoZX71APp2eJ6WgWa589BRxVkc72hvp0nP0+P+sBp
	Fv8Bu16fG5elTVmnT5zsOv3GPkLjjwk=
X-Google-Smtp-Source: AMsMyM6MvFlyMTvm+NnPM3j23SDoVaNqu/thK/yXLmfsQfDpd3rV6P8bhnZdIFBO5cOKecs1QOCuujh9sYY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:705:b0:6ca:a3b0:e7f with SMTP id
 k5-20020a056902070500b006caa3b00e7fmr26597392ybt.373.1667431174399; Wed, 02
 Nov 2022 16:19:34 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:18:39 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-13-seanjc@google.com>
Subject: [PATCH 12/44] KVM: VMX: Do _all_ initialization before exposing
 /dev/kvm to userspace
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
X-CRM114-CacheID: sfid-20221102_231936_882244_B94F3A3F 
X-CRM114-Status: GOOD (  13.89  )
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
 arch/x86/kvm/vmx/vmx.c | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 118d9b29b339..6adb60485839 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -8493,21 +8493,25 @@ static void vmx_cleanup_l1d_flush(void)
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
-	hv_cleanup_evmcs();
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
+
+	hv_cleanup_evmcs();
 }
 module_exit(vmx_exit);
 
@@ -8521,11 +8525,6 @@ static int __init vmx_init(void)
 	if (r)
 		goto err_x86_init;
 
-	r = kvm_init(&vmx_init_ops, sizeof(struct vcpu_vmx),
-		     __alignof__(struct vcpu_vmx), THIS_MODULE);
-	if (r)
-		goto err_kvm_init;
-
 	/*
 	 * Must be called after common x86 init so enable_ept is properly set
 	 * up. Hand the parameter mitigation value in which was stored in
@@ -8559,11 +8558,20 @@ static int __init vmx_init(void)
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
 err_x86_init:
 	hv_cleanup_evmcs();
-- 
2.38.1.431.g37b22c650d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
