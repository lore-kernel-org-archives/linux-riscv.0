Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E65C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Feb 2022 03:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vdk0X5DbBzayEiSsgGh09cdPr4Ker1fvT4vWBNlHzBU=; b=QDMWSbG2k/Lcis
	sqTQt4K8Ul60OqwuOd0Uc7PeVbuLNNN1Z0lu+gRz2GEcoj1PRyU364HEbdcVvSf1ibJw3+Dq/LXVO
	zA3IEYk8orG4B/8+MnK0kM/FnaRG7kKgOOgfS2RwYe6cdezZAMMPIArgGZbNrePTkxBg49fxJGzwm
	h3/QW+CYwwaIGq3WRewXd67HriwiFB0TyFNAjhSvVo8OwGkQGK0zoMAAgNARDqtPgi6QImxI7Rovt
	du1/I3LSs8h4ZAP1gf/mQhhvOSvbiXxeUjy8BGOXCPN0mcbo/qJa/qxX0bO5/vyuGxu90YZcgbQp5
	k4HpqDXesuYHA+SNS3TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKAnZ-005Niw-Jn; Wed, 16 Feb 2022 03:16:09 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKAnW-005NhJ-78; Wed, 16 Feb 2022 03:16:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644981366; x=1676517366;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OL/CJpx3e1GRIpNB1pTJCWsC1hGcn+U6/rlTNg6FcmQ=;
 b=fBIFsSwKyFwawD3b5iWg1IeBMD0jzHGnB6alhf4i3NDVRkYdlTQFf8bu
 bKQozEUMKW69+eE/p+UyZIDh7+KLPos0ltV//bbC9pNoar2DDycbpUy4J
 2u15ht7gAPnz5RnDEexSOnQyt8SutaPYUOx5/Z7tLrP9ffLZ1rjq9d1Bz
 0rA/DqCv1wHheU0dHt2R30OFSRL7/Mo1Ot+Ynq3279zvgHKqy9mCmQgzu
 I/HQcivORmYJf4rCLssl8UJO6wQXp4YxVGUbbJu6EiqQdpYJ4kctJ55nJ
 8HaLmqGQEkQODmGWErOtGELIINVfoG5MUzmYNWtfYDUpis5MzXUsh7A/4 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="250456011"
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; d="scan'208";a="250456011"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 19:16:04 -0800
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; d="scan'208";a="773798219"
Received: from hyperv-sh4.sh.intel.com ([10.239.48.22])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 19:15:54 -0800
From: Chao Gao <chao.gao@intel.com>
To: seanjc@google.com, maz@kernel.org, kvm@vger.kernel.org,
 pbonzini@redhat.com, kevin.tian@intel.com, tglx@linutronix.de
Cc: Chao Gao <chao.gao@intel.com>, James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Bharata B Rao <bharata@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: [PATCH v4 2/6] Partially revert "KVM: Pass kvm_init()'s opaque param
 to additional arch funcs"
Date: Wed, 16 Feb 2022 11:15:17 +0800
Message-Id: <20220216031528.92558-3-chao.gao@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220216031528.92558-1-chao.gao@intel.com>
References: <20220216031528.92558-1-chao.gao@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_191606_324802_09586F38 
X-CRM114-Status: GOOD (  10.09  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This partially reverts commit b99040853738 ("KVM: Pass kvm_init()'s opaque
param to additional arch funcs") remove opaque from
kvm_arch_check_processor_compat because no one uses this opaque now.
Address conflicts for ARM (due to file movement) and manually handle RISC-V
which comes after the commit.

And changes about kvm_arch_hardware_setup() in original commit are still
needed so they are not reverted.

Signed-off-by: Chao Gao <chao.gao@intel.com>
Reviewed-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/arm.c       |  2 +-
 arch/mips/kvm/mips.c       |  2 +-
 arch/powerpc/kvm/powerpc.c |  2 +-
 arch/riscv/kvm/main.c      |  2 +-
 arch/s390/kvm/kvm-s390.c   |  2 +-
 arch/x86/kvm/x86.c         |  2 +-
 include/linux/kvm_host.h   |  2 +-
 virt/kvm/kvm_main.c        | 16 +++-------------
 8 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index ecc5958e27fe..0165cf3aac3a 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -73,7 +73,7 @@ int kvm_arch_hardware_setup(void *opaque)
 	return 0;
 }
 
-int kvm_arch_check_processor_compat(void *opaque)
+int kvm_arch_check_processor_compat(void)
 {
 	return 0;
 }
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index a25e0b73ee70..092d09fb6a7e 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -140,7 +140,7 @@ int kvm_arch_hardware_setup(void *opaque)
 	return 0;
 }
 
-int kvm_arch_check_processor_compat(void *opaque)
+int kvm_arch_check_processor_compat(void)
 {
 	return 0;
 }
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 2ad0ccd202d5..30c817f3fa0c 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -423,7 +423,7 @@ int kvm_arch_hardware_setup(void *opaque)
 	return 0;
 }
 
-int kvm_arch_check_processor_compat(void *opaque)
+int kvm_arch_check_processor_compat(void)
 {
 	return kvmppc_core_check_processor_compat();
 }
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 2e5ca43c8c49..992877e78393 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -20,7 +20,7 @@ long kvm_arch_dev_ioctl(struct file *filp,
 	return -EINVAL;
 }
 
-int kvm_arch_check_processor_compat(void *opaque)
+int kvm_arch_check_processor_compat(void)
 {
 	return 0;
 }
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 577f1ead6a51..0053b81c6b02 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -252,7 +252,7 @@ int kvm_arch_hardware_enable(void)
 	return 0;
 }
 
-int kvm_arch_check_processor_compat(void *opaque)
+int kvm_arch_check_processor_compat(void)
 {
 	return 0;
 }
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 9b484ed61f37..ffb88f0b7265 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -11509,7 +11509,7 @@ void kvm_arch_hardware_unsetup(void)
 	static_call(kvm_x86_hardware_unsetup)();
 }
 
-int kvm_arch_check_processor_compat(void *opaque)
+int kvm_arch_check_processor_compat(void)
 {
 	struct cpuinfo_x86 *c = &cpu_data(smp_processor_id());
 
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index f11039944c08..2ad78e729bf7 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1413,7 +1413,7 @@ int kvm_arch_hardware_enable(void);
 void kvm_arch_hardware_disable(void);
 int kvm_arch_hardware_setup(void *opaque);
 void kvm_arch_hardware_unsetup(void);
-int kvm_arch_check_processor_compat(void *opaque);
+int kvm_arch_check_processor_compat(void);
 int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu);
 bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu);
 int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 83c57bcc6eb6..ee47d33d69e1 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5643,22 +5643,14 @@ void kvm_unregister_perf_callbacks(void)
 }
 #endif
 
-struct kvm_cpu_compat_check {
-	void *opaque;
-	int *ret;
-};
-
-static void check_processor_compat(void *data)
+static void check_processor_compat(void *rtn)
 {
-	struct kvm_cpu_compat_check *c = data;
-
-	*c->ret = kvm_arch_check_processor_compat(c->opaque);
+	*(int *)rtn = kvm_arch_check_processor_compat();
 }
 
 int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
 		  struct module *module)
 {
-	struct kvm_cpu_compat_check c;
 	int r;
 	int cpu;
 
@@ -5686,10 +5678,8 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
 	if (r < 0)
 		goto out_free_1;
 
-	c.ret = &r;
-	c.opaque = opaque;
 	for_each_online_cpu(cpu) {
-		smp_call_function_single(cpu, check_processor_compat, &c, 1);
+		smp_call_function_single(cpu, check_processor_compat, &r, 1);
 		if (r < 0)
 			goto out_free_2;
 	}
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
