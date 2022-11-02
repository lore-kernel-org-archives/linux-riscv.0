Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C3BC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Nov 2022 23:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rrNJit5WLXEWtPz50aqGVtXgz1cgHVyX4KhJgeL553E=; b=I5CIgXyuNL+mBW
	xyv6fYHogADTD705uxg0NiI8O+ybPAKFb/XLDllck7EUAT7nkQob4sxBFZ1Uld8q0zLx8J+34zkk3
	vvpvl3oeBy3nDj3xc3uWDN3UUjRQW0LGCZFO3SmreigrTG3UHMBRBqnzGerMoNUHCrPoDnQqZa9Hu
	SaZboWNp2Rn3qq4FihGlT7BZKE/KtMBHp/Y/KgDaH8XbukeBVdMK3CftlR42rRYVTJI1cRRnKeLz5
	w1Km9PKqogyMssS23a1oELobqSGaf/SMmzT2lnKwHa4mWDw/R9j+Y3HaXaTZY73P9m4oFwVXsR1CS
	m7y7gjDOig4UJ5C3ixEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqNLh-00F4nj-Ea; Wed, 02 Nov 2022 23:40:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqNGR-00F1m3-Ds
	for linux-riscv@bombadil.infradead.org; Wed, 02 Nov 2022 23:35:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eBGnpAB5YEmL+9R2z3ic0MP89PNczg3hngnKElf7iFc=; b=u91c6qtPstOgfeSm3IZPMexIma
	TORNHUGSRtUUW+FjeMtdTnSMwS5OuqQ+Ab+lcYhGTz5XFZOJWhWK2v0gp2LLkVp+7UNdJV4bDoZET
	/h1LJ+WNaFTHw8woZPH9tgoeg8i9UyJPIsgD/+6UmZzbU1c4/OeKqkHdXTNnZIT79dnq5/rFvoXjl
	PfXtQhbkpL8Xiw2J9VZI8VqvN815cGxktsqHF+p6IpOVdmq/fTodDrCh9YrjcXgkVRs+d+dF9BMnw
	6bH1kexoo/4WHYf9CmobvNE328qgWkU2p5mxXCq00ABxw2sG6A4YtXI0bQXKOJBPseSsvGmYCMuLA
	DhOgTr3g==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN29-005vwj-1o
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 23:20:35 +0000
Received: by mail-pl1-x649.google.com with SMTP id o7-20020a170902d4c700b001868cdac9adso221461plg.13
        for <linux-riscv@lists.infradead.org>; Wed, 02 Nov 2022 16:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=eBGnpAB5YEmL+9R2z3ic0MP89PNczg3hngnKElf7iFc=;
        b=ojul5zX3wpuJJe7cqIIhk1dAIJjsIWSoVFD34OlEtsaEsfSCNKjjiF+HwG5lmnrY2I
         KreCXy41v7/9TFioIC3+xGBWkD7fmUCdz1gMvsLxqHHsu6RBAiMKgNs/d2SdW+bbhMRg
         NBqdiN1JSTgrtFjDcdWlEa2/xdW6ehlPIuAUy2mR2+Yl/4TziBYRxDfQKdxIrFQqWvPp
         0/D2KuiVfrvvfUsbgj/0BRs0z+I4snaV4Q8GQFYIGo/sG1wBZ4xUsO/CGVPbjBOgOZYg
         fVops+u1SYWw0XvvKmWhiG2a3pG2wZukc8aY+SxBVuiKXvQTkpr9CwptXPVgpDgkq3Oo
         0d2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eBGnpAB5YEmL+9R2z3ic0MP89PNczg3hngnKElf7iFc=;
        b=HXWqkt7opp0bwciVzSo1ZELTMRHYHWnqPz3tP0KMsyWuk2f5P9aC6BOFoloDCMbH/4
         LK5FSYUgVOtV1hdy9oBkWsPH4zK/cNa5h9deaKvz0xCNyb9QwYEQTmBIoud1Ru735icY
         BXX8UtNwRMu6NEk7iOUOUVaKd44b8v05Hr9o3346mmJfoF7JVZRPM5C2Gv8gvN0Dd5ld
         z2VvifYPt+cEsJpLlTY0UThBgg90JB5HD5XZ/e9v7iXQin4nr/8hKHjPXMZM98L9FpAh
         hiduBzGuPu3gBxOev3dhEOj7PX8CtenrTj3AqojFsO8ISoldbJ3S+0voiTQMeBxYfff7
         Yi6Q==
X-Gm-Message-State: ACrzQf3tT++2KK7nl5OHAMueFAeL8BUnxTdVzCSa827EpZ/HN5puIQIE
	aChsJXRhrYcYDt3hn4/gU0KhQmphzjU=
X-Google-Smtp-Source: AMsMyM6vXnUWEsRLX9fWIPNNelljS9Dalpkeg6q32F9Z4GJq3yxe6Bn6qth+fDauwaH6t2Cx5e1igxhHCN8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:7348:b0:213:2708:8dc3 with SMTP id
 j8-20020a17090a734800b0021327088dc3mr248527pjs.2.1667431226181; Wed, 02 Nov
 2022 16:20:26 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:19:09 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-43-seanjc@google.com>
Subject: [PATCH 42/44] KVM: Make hardware_enable_failed a local variable in
 the "enable all" path
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
X-CRM114-CacheID: sfid-20221102_232033_126560_2CA20DE6 
X-CRM114-Status: GOOD (  13.70  )
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
 virt/kvm/kvm_main.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 31949a89fe25..a18296ee731b 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -104,7 +104,6 @@ LIST_HEAD(vm_list);
 
 static DEFINE_PER_CPU(bool, hardware_enabled);
 static int kvm_usage_count;
-static atomic_t hardware_enable_failed;
 
 static struct kmem_cache *kvm_vcpu_cache;
 
@@ -5006,19 +5005,25 @@ static struct miscdevice kvm_dev = {
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
@@ -5033,16 +5038,9 @@ static int kvm_online_cpu(unsigned int cpu)
 	 * errors when scheduled to this CPU.
 	 */
 	if (kvm_usage_count) {
-		WARN_ON_ONCE(atomic_read(&hardware_enable_failed));
-
 		local_irq_save(flags);
-		hardware_enable_nolock(NULL);
+		ret = __hardware_enable_nolock();
 		local_irq_restore(flags);
-
-		if (atomic_read(&hardware_enable_failed)) {
-			atomic_set(&hardware_enable_failed, 0);
-			ret = -EIO;
-		}
 	}
 	mutex_unlock(&kvm_lock);
 	return ret;
@@ -5094,6 +5092,7 @@ static void hardware_disable_all(void)
 
 static int hardware_enable_all(void)
 {
+	atomic_t failed = ATOMIC_INIT(0);
 	int r = 0;
 
 	/*
@@ -5109,10 +5108,9 @@ static int hardware_enable_all(void)
 
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
@@ -5744,7 +5742,7 @@ static void kvm_resume(void)
 	lockdep_assert_irqs_disabled();
 
 	if (kvm_usage_count)
-		hardware_enable_nolock(NULL);
+		WARN_ON_ONCE(__hardware_enable_nolock());
 }
 
 static struct syscore_ops kvm_syscore_ops = {
-- 
2.38.1.431.g37b22c650d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
