Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99F9C4321E
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 23:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8wHJWornUtdvlWnEV1HpFfs9AtKQFfelY8V2yr2+B8w=; b=qmT0IPAQlmmOq3
	ZYemiJ+QgOmM/PbDSvcvTyS/SssjfCV822PBe4EDLsuQW0I+ddBEk/sff2DnUxaPSu/WRQIsE/XyF
	rrt058cj0r1tPNUkOMpuP64UsuR0PwwcOVmVxn9RJ8qL3/QOq3GdXmxpKqnjmAmi+krj8CKqF2qmn
	QDx/LQOrFPWk8cq+qbq6FQaz903bf1JbhCnAjnG10A/CkDhF4yp42qoGH7HhnI/U2F0WdxuCfBCWV
	O9LhblWc45irbCal7SgkBgsght2h/JLbglAse/RHQrjYHdrjpD3IGT1ppUfSo+bbkssY/ukENWC3A
	3XDwUWvCiM8T3Id7+vzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WwX-003QD5-RQ; Wed, 30 Nov 2022 23:56:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WbT-003Gqn-Lf
	for linux-riscv@bombadil.infradead.org; Wed, 30 Nov 2022 23:34:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WLPEY1JyVUKovgrvfyqFU2AVSMCiclyJ+2DT9qhmJc8=; b=O6LReCmKKlpgKmvMe3I0aEDE5w
	EdvaHj/oyXSX3w8iC3fiUdGK61gk+rlViDmYZkRxKN2xM2Ij7mc8M3/WfAjxiVhEPdSd2Sgoi9lE/
	iVe27I6HHVLrMqkbJxCr7aCELVX0UWUifdjL6QORjhvjBdVBMEHkk4WEVSzLxMvfFuiAGLfkN/Ulr
	+N4C0hd3DHHBYQ8+vNzSzUkEIrewoRmG0s91YjCotZZLdif98GXJIAIttioVBxTvOYuztIkjOswnv
	A6H8H66CxjD0dlo+x7XgRgteGplUy6OR2ZkRoR8QbLaIkf/+6LuoInyWLrQY7tuwJoj9c61DZKU/d
	/bqEov/g==;
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WEN-00FPyD-A7
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 23:11:09 +0000
Received: by mail-pf1-x44a.google.com with SMTP id f19-20020a056a001ad300b0056dd07cebfcso206227pfv.3
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 15:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=WLPEY1JyVUKovgrvfyqFU2AVSMCiclyJ+2DT9qhmJc8=;
        b=D8YRDQ8ziUXauvBx+ARbm7TFIG8K7whjxR1q1N+cb/wQeXeKfhINWzhaARQHkNtQ4Q
         /IkiRc+iCBcbWjdykCUjCkjfmBOkEmyXXZuqZ+gft9hkrhkkdMqanjtrg4ALTxlHbAys
         XyZFW4WpGejE/dbUyxR5jHE+duvddzg3otAhdocqYEFE0BojJYcMyB6GyJtaNLxkOiTS
         6/HoCl1WQ1OC+nYzecGGIZN2fe3pbBkzvUu82a2MomMsooPz9zdPN9UTgK+KQHWv7U8y
         6le7VvNBnrJaTj35gdwc23Q+wETCAHgYr/YFnbP1YFNzrxVi7lomowBDPcjY/WZjR0nW
         ur1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WLPEY1JyVUKovgrvfyqFU2AVSMCiclyJ+2DT9qhmJc8=;
        b=YWWgwIFmWOdWKmviliwoFx3MnLFRmO5HZSdKD/fDcRGk+dYxu701+5fROm7vPfH8ve
         uqF+sIUGOJhlRvqBjqjNEoQsyzyoGYRBlaxXGl9SVp4Hx6CFgkcEhXFNyHgCey7c64ME
         ISAuHGiOGv8BKYCXcZsmd78eSlQG6IgOaFV+6TEqhOTLu357/7kxF7wuZlU2LQLTICp5
         tiHDB8LTcCOuoiPYpNV0CgVLHJEEjQW2wO3ekJJxIOGcLEn+qoVqRdGzSsK1M39EHxSU
         dM1OgLKl52huvNLWPbNMumw3qnQVOD9TmLhvmdrs2txzGa93CJtguFZ3m4E1Fm2x5sDo
         la/w==
X-Gm-Message-State: ANoB5plHNYqWg17VK11dsHu3150QDu/dwZpZGiwjN9WYbEEIQjAgJuj0
	5EAlkWJdS22YRIgJKtJBqfwtS+/twbk=
X-Google-Smtp-Source: AA0mqf72C+cKZiLjk1SNO5cIqAlPKX7LUztOwBw+loP6Ps/JXv2MDFezzzhDDa6QyIWvD5qfSqI35S2Rp2o=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:aa7:9ec2:0:b0:574:8995:eb7f with SMTP id
 r2-20020aa79ec2000000b005748995eb7fmr33643125pfq.85.1669849859262; Wed, 30
 Nov 2022 15:10:59 -0800 (PST)
Date: Wed, 30 Nov 2022 23:09:31 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-48-seanjc@google.com>
Subject: [PATCH v2 47/50] KVM: Make hardware_enable_failed a local variable in
 the "enable all" path
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
X-CRM114-CacheID: sfid-20221130_231107_468460_48E68673 
X-CRM114-Status: GOOD (  14.25  )
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

From: Isaku Yamahata <isaku.yamahata@intel.com>

Rework detecting hardware enabling errors to use a local variable in the
"enable all" path to track whether or not enabling was successful across
all CPUs.  Using a global variable complicates paths that enable hardware
only on the current CPU, e.g. kvm_resume() and kvm_online_cpu().

Opportunistically add a WARN if hardware enabling fails during
kvm_resume(), KVM is all kinds of hosed if CPU0 fails to enable hardware.
The WARN is largely futile in the current code, as KVM BUG()s on spurious
faults on VMX instructions, e.g. attempting to run a vCPU on CPU if
hardware enabling fails will explode.

  ------------[ cut here ]------------
  kernel BUG at arch/x86/kvm/x86.c:508!
  invalid opcode: 0000 [#1] SMP
  CPU: 3 PID: 1009 Comm: CPU 4/KVM Not tainted 6.1.0-rc1+ #11
  Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 0.0.0 02/06/2015
  RIP: 0010:kvm_spurious_fault+0xa/0x10
  Call Trace:
   vmx_vcpu_load_vmcs+0x192/0x230 [kvm_intel]
   vmx_vcpu_load+0x16/0x60 [kvm_intel]
   kvm_arch_vcpu_load+0x32/0x1f0
   vcpu_load+0x2f/0x40
   kvm_arch_vcpu_ioctl_run+0x19/0x9d0
   kvm_vcpu_ioctl+0x271/0x660
   __x64_sys_ioctl+0x80/0xb0
   do_syscall_64+0x2b/0x50
   entry_SYSCALL_64_after_hwframe+0x46/0xb0

But, the WARN may provide a breadcrumb to understand what went awry, and
someday KVM may fix one or both of those bugs, e.g. by finding a way to
eat spurious faults no matter the context (easier said than done due to
side effects of certain operations, e.g. Intel's VMCLEAR).

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
[sean: rebase, WARN on failure in kvm_resume()]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index c1e48c18e2d9..674a9dab5411 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -104,7 +104,6 @@ LIST_HEAD(vm_list);
 
 static DEFINE_PER_CPU(bool, hardware_enabled);
 static int kvm_usage_count;
-static atomic_t hardware_enable_failed;
 
 static struct kmem_cache *kvm_vcpu_cache;
 
@@ -5025,19 +5024,25 @@ static struct miscdevice kvm_dev = {
 	&kvm_chardev_ops,
 };
 
-static void hardware_enable_nolock(void *junk)
+static int __hardware_enable_nolock(void)
 {
 	if (__this_cpu_read(hardware_enabled))
-		return;
+		return 0;
 
 	if (kvm_arch_hardware_enable()) {
-		atomic_inc(&hardware_enable_failed);
 		pr_info("kvm: enabling virtualization on CPU%d failed\n",
 			raw_smp_processor_id());
-		return;
+		return -EIO;
 	}
 
 	__this_cpu_write(hardware_enabled, true);
+	return 0;
+}
+
+static void hardware_enable_nolock(void *failed)
+{
+	if (__hardware_enable_nolock())
+		atomic_inc(failed);
 }
 
 static int kvm_online_cpu(unsigned int cpu)
@@ -5050,16 +5055,8 @@ static int kvm_online_cpu(unsigned int cpu)
 	 * errors when scheduled to this CPU.
 	 */
 	mutex_lock(&kvm_lock);
-	if (kvm_usage_count) {
-		WARN_ON_ONCE(atomic_read(&hardware_enable_failed));
-
-		hardware_enable_nolock(NULL);
-
-		if (atomic_read(&hardware_enable_failed)) {
-			atomic_set(&hardware_enable_failed, 0);
-			ret = -EIO;
-		}
-	}
+	if (kvm_usage_count)
+		ret = __hardware_enable_nolock();
 	mutex_unlock(&kvm_lock);
 	return ret;
 }
@@ -5107,6 +5104,7 @@ static void hardware_disable_all(void)
 
 static int hardware_enable_all(void)
 {
+	atomic_t failed = ATOMIC_INIT(0);
 	int r = 0;
 
 	/*
@@ -5122,10 +5120,9 @@ static int hardware_enable_all(void)
 
 	kvm_usage_count++;
 	if (kvm_usage_count == 1) {
-		atomic_set(&hardware_enable_failed, 0);
-		on_each_cpu(hardware_enable_nolock, NULL, 1);
+		on_each_cpu(hardware_enable_nolock, &failed, 1);
 
-		if (atomic_read(&hardware_enable_failed)) {
+		if (atomic_read(&failed)) {
 			hardware_disable_all_nolock();
 			r = -EBUSY;
 		}
@@ -5759,7 +5756,7 @@ static void kvm_resume(void)
 	lockdep_assert_irqs_disabled();
 
 	if (kvm_usage_count)
-		hardware_enable_nolock(NULL);
+		WARN_ON_ONCE(__hardware_enable_nolock());
 }
 
 static struct syscore_ops kvm_syscore_ops = {
-- 
2.38.1.584.g0f3c55d4c2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
