Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA1ECCFA00
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 20:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uL/rszYmJnJk6Ff7V7vNEDKT5eoNqFjroO9CRo84JLg=; b=lgeMGAC8XGmJ0r
	HBtBGL2aGm2J/qUMo/Eb0m+F2uotqe/Yjy5IuOMGwTkvmA01Sik9XQcv/bX6KQmzhdys2Ayz6zjuo
	54Y03JQ2ux1ldfq8zA4QCGwYyX7or8dpJWBPUP7P6pcDm401km25861MRkFX99CZkxLh2Y6cHrO5F
	ca8ZJV1O4F0sRRIyWlRV5lRf6A+hCzcfs3VoB0wj2IewMpqxw5XY3Mg7rkr7sXqaf4/N7T3uPn+Qh
	caF49IFq2ktWjc95a+D9QSVVjU4tDYaciMVkNFGYs38UA7kIjR4ymbofC/f2qQ8437Dad63cFfqm8
	MiaAq78RUjkCgX9W4LiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYyH-00000004jL4-3hUx;
	Thu, 30 Oct 2025 20:10:09 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYyD-00000004jGN-0hq1
	for linux-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 20:10:06 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-294fb21b0e9so9800845ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 30 Oct 2025 13:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855004; x=1762459804; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=2OA09S1/1skw+FuU1BhzWw9OqqsMWSUfhu0LCFCqROs=;
        b=cLRsiEBPXrccy2xOkh+p4Fc5P9R5lEGp6vDQAju8mia2pfDuCQsLWJlCF3OEtwlznp
         gvGUlYbnxqO6xI57l446ZDc/szEeq4p+OlQf/eTGU+l+uQ2Ca7RvS4emX55glRQGennL
         zU2wfxZaWeBntEPAz1tQ0NgPBkyTSMAxvaL6+/h6nDmx+dRzf8RPja6WpuGAXqs764OV
         3JiFtvS18HZfUrPoSzYLbnPdeF4v5PCxTRosiamo7XfQrhkUvKk2+Pymoj+HD2DdI3gA
         jfWXNPLf9/Kv9KjLzuLnyI0QBzmmtA1sJQeFBYj+w/Dl1trxjl9qIwvJgourap5dwGmD
         mY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855004; x=1762459804;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2OA09S1/1skw+FuU1BhzWw9OqqsMWSUfhu0LCFCqROs=;
        b=uqvsze6pg3BzRQXruTy5k4nDDA7XXZm6bWtHf6TGz+OvAFRq6Gr3V/PTktKvbeeAf+
         An3X8WZsF3i60Fl6yQ1Ku1LfxqeTQ3FTUFPtyhwfhLi+2MgCjFLw1UwNyCiaLQ7gQpM1
         JrXaNB7cLLQu/B/J2t9s/niBUOwmuQxuPCZQ+zdiWS30plYF+OWNNz5rrU9uyFPLN2W8
         TpKPDCNjkCdqcT818+DCx7PK+hq0DslDPlBfve/KjlA5tn3X+oX3HRCd66ip9qLrRe8m
         FfGg5soICw7biugwCa9Bkp7NP+hNBziJyBb66SaDd0fmeOzJNKe5NFku+hq/4ZWEE9p8
         qn0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVbHjkcEs6h6KYFxA67WwIdeZl/E/DIy5Bo4unh7h3+ALCyU/bjPvd1Er46Ihzw/qPqEqs2H4no5oOleg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3uarTwevcj5lxQ1GR7wzXbAEoKiErrWbBsN03eL2wUHWPoecJ
	mOql27zNcVLWEqozmK8yr3ASmQqiHFfR3Y7Inj5C9B6n8z+HF33vMLsoPqrk6Ghbr06ypysinGj
	vjkqXLw==
X-Google-Smtp-Source: AGHT+IFyokACO79MDowezF6ant8GOHayKAjiYuTdimtA+5sS6fpyhP+P+t8J4m0XKxQ1DNOfqANuKqsRbyM=
X-Received: from pljc8.prod.google.com ([2002:a17:903:3b88:b0:269:a7b6:c668])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2bce:b0:270:e595:a440
 with SMTP id d9443c01a7336-2951a3b61efmr15533075ad.25.1761855004041; Thu, 30
 Oct 2025 13:10:04 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:09:25 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-3-seanjc@google.com>
Subject: [PATCH v4 02/28] KVM: Rename kvm_arch_vcpu_async_ioctl() to kvm_arch_vcpu_unlocked_ioctl()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_131005_237959_9C57FA87 
X-CRM114-Status: GOOD (  13.10  )
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

Rename the "async" ioctl API to "unlocked" so that upcoming usage in x86's
TDX code doesn't result in a massive misnomer.  To avoid having to retry
SEAMCALLs, TDX needs to acquire kvm->lock *and* all vcpu->mutex locks, and
acquiring all of those locks after/inside the current vCPU's mutex is a
non-starter.  However, TDX also needs to acquire the vCPU's mutex and load
the vCPU, i.e. the handling is very much not async to the vCPU.

No functional change intended.

Acked-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/arm.c       | 4 ++--
 arch/loongarch/kvm/vcpu.c  | 4 ++--
 arch/mips/kvm/mips.c       | 4 ++--
 arch/powerpc/kvm/powerpc.c | 4 ++--
 arch/riscv/kvm/vcpu.c      | 4 ++--
 arch/s390/kvm/kvm-s390.c   | 4 ++--
 arch/x86/kvm/x86.c         | 4 ++--
 include/linux/kvm_host.h   | 4 ++--
 virt/kvm/kvm_main.c        | 6 +++---
 9 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index ef5bf57f79b7..cf23f6b07ec7 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1835,8 +1835,8 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
 	return r;
 }
 
-long kvm_arch_vcpu_async_ioctl(struct file *filp, unsigned int ioctl,
-			       unsigned long arg)
+long kvm_arch_vcpu_unlocked_ioctl(struct file *filp, unsigned int ioctl,
+				  unsigned long arg)
 {
 	return -ENOIOCTLCMD;
 }
diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index 30e3b089a596..9a5844e85fd3 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -1471,8 +1471,8 @@ int kvm_vcpu_ioctl_interrupt(struct kvm_vcpu *vcpu, struct kvm_interrupt *irq)
 	return 0;
 }
 
-long kvm_arch_vcpu_async_ioctl(struct file *filp,
-			       unsigned int ioctl, unsigned long arg)
+long kvm_arch_vcpu_unlocked_ioctl(struct file *filp, unsigned int ioctl,
+				  unsigned long arg)
 {
 	void __user *argp = (void __user *)arg;
 	struct kvm_vcpu *vcpu = filp->private_data;
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index a75587018f44..b0fb92fda4d4 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -895,8 +895,8 @@ static int kvm_vcpu_ioctl_enable_cap(struct kvm_vcpu *vcpu,
 	return r;
 }
 
-long kvm_arch_vcpu_async_ioctl(struct file *filp, unsigned int ioctl,
-			       unsigned long arg)
+long kvm_arch_vcpu_unlocked_ioctl(struct file *filp, unsigned int ioctl,
+				  unsigned long arg)
 {
 	struct kvm_vcpu *vcpu = filp->private_data;
 	void __user *argp = (void __user *)arg;
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 2ba057171ebe..9a89a6d98f97 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -2028,8 +2028,8 @@ int kvm_arch_vcpu_ioctl_set_mpstate(struct kvm_vcpu *vcpu,
 	return -EINVAL;
 }
 
-long kvm_arch_vcpu_async_ioctl(struct file *filp,
-			       unsigned int ioctl, unsigned long arg)
+long kvm_arch_vcpu_unlocked_ioctl(struct file *filp, unsigned int ioctl,
+				  unsigned long arg)
 {
 	struct kvm_vcpu *vcpu = filp->private_data;
 	void __user *argp = (void __user *)arg;
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index bccb919ca615..a4bd6077eecc 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -238,8 +238,8 @@ vm_fault_t kvm_arch_vcpu_fault(struct kvm_vcpu *vcpu, struct vm_fault *vmf)
 	return VM_FAULT_SIGBUS;
 }
 
-long kvm_arch_vcpu_async_ioctl(struct file *filp,
-			       unsigned int ioctl, unsigned long arg)
+long kvm_arch_vcpu_unlocked_ioctl(struct file *filp, unsigned int ioctl,
+				  unsigned long arg)
 {
 	struct kvm_vcpu *vcpu = filp->private_data;
 	void __user *argp = (void __user *)arg;
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 16ba04062854..8c4caa5f2fcd 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -5730,8 +5730,8 @@ static long kvm_s390_vcpu_memsida_op(struct kvm_vcpu *vcpu,
 	return r;
 }
 
-long kvm_arch_vcpu_async_ioctl(struct file *filp,
-			       unsigned int ioctl, unsigned long arg)
+long kvm_arch_vcpu_unlocked_ioctl(struct file *filp, unsigned int ioctl,
+				  unsigned long arg)
 {
 	struct kvm_vcpu *vcpu = filp->private_data;
 	void __user *argp = (void __user *)arg;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index ca5ba2caf314..b85cb213a336 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -7240,8 +7240,8 @@ static int kvm_vm_ioctl_set_clock(struct kvm *kvm, void __user *argp)
 	return 0;
 }
 
-long kvm_arch_vcpu_async_ioctl(struct file *filp, unsigned int ioctl,
-			       unsigned long arg)
+long kvm_arch_vcpu_unlocked_ioctl(struct file *filp, unsigned int ioctl,
+				  unsigned long arg)
 {
 	return -ENOIOCTLCMD;
 }
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 7186b2ae4b57..d93f75b05ae2 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1557,6 +1557,8 @@ long kvm_arch_dev_ioctl(struct file *filp,
 			unsigned int ioctl, unsigned long arg);
 long kvm_arch_vcpu_ioctl(struct file *filp,
 			 unsigned int ioctl, unsigned long arg);
+long kvm_arch_vcpu_unlocked_ioctl(struct file *filp,
+				  unsigned int ioctl, unsigned long arg);
 vm_fault_t kvm_arch_vcpu_fault(struct kvm_vcpu *vcpu, struct vm_fault *vmf);
 
 int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext);
@@ -2437,8 +2439,6 @@ static inline bool kvm_arch_no_poll(struct kvm_vcpu *vcpu)
 }
 #endif /* CONFIG_HAVE_KVM_NO_POLL */
 
-long kvm_arch_vcpu_async_ioctl(struct file *filp,
-			       unsigned int ioctl, unsigned long arg);
 void kvm_arch_guest_memory_reclaimed(struct kvm *kvm);
 
 #ifdef CONFIG_HAVE_KVM_VCPU_RUN_PID_CHANGE
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 4845e5739436..9eca084bdcbe 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4434,10 +4434,10 @@ static long kvm_vcpu_ioctl(struct file *filp,
 		return r;
 
 	/*
-	 * Some architectures have vcpu ioctls that are asynchronous to vcpu
-	 * execution; mutex_lock() would break them.
+	 * Let arch code handle select vCPU ioctls without holding vcpu->mutex,
+	 * e.g. to support ioctls that can run asynchronous to vCPU execution.
 	 */
-	r = kvm_arch_vcpu_async_ioctl(filp, ioctl, arg);
+	r = kvm_arch_vcpu_unlocked_ioctl(filp, ioctl, arg);
 	if (r != -ENOIOCTLCMD)
 		return r;
 
-- 
2.51.1.930.gacf6e81ea2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
