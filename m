Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE378C0018A
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 16:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h8CH0VER7kNqvPhNT9t/Y0siKMk72RdjDBog3A5RkCY=; b=MX+QRFss/PGYxK
	7wVV0C3jshiQAlsZHG497VWe6BJLteqB+mLLwUSjfRN9Tvqg7wY9Bxgsk38bO6xiJ2c8lY4D2ftc9
	aaEs0Jtn6V+u8wh4poZeKXYD132r5qy49PwXCDQnbcBo8ZDXCBalDKaFnDvzkfIvnbbSlENa3rbvd
	n+ZKdPdYD8erQRTOgJOSJSkrWI3QVeW31ui2KXYse/noZnN6gWK1o0zyPnhBuWjL0LraVitT3kNlY
	SyemsFqgagi0VP5b/pCTx+vuEufRebf2fK/QdEYWmd5g7RS8pV4NcKhHthrJnKwXV6+S+OAjvJg5A
	0g6nuLr5dttsGOmQf57A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyadO-009s9N-0i;
	Thu, 02 Nov 2023 16:33:30 +0000
Received: from mgamail.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyadD-009ry7-1w;
	Thu, 02 Nov 2023 16:33:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698942799; x=1730478799;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Y/7/R0T7sdWEW0G4FlYJVCB4cGKVbltohN+8VyJwxuQ=;
  b=MMcgHzdxSt6yVqcGsd0JEROrJDHWpAaskyAYS8sZZFPxErQT+AAamyU2
   ypzRTcYM++CckJq3yFJM/ZoCYsOqNL0JQ43ZG+7I9glPo+tkNDBd4ILxp
   YkXADDUjXJOhupTkOz5La8jA1NuknhoELDIPMKavIi2FRPkR9lIk9VteA
   YgGBpgEAfbaYyvcwcWKP3UK6Ucoe/3EdNmb7CrWBAEXMF0eeJfYX2a6SM
   2e1ODx0poMuBy2asXN5KnXu4KOkgjPnJsohck0yYNGaUiLbFy2ugaS+yS
   9EVzcrkZrkl40sbs/5FAjjIzIKXzlVARpSk2Ichznzp//ACrnl89WZaL/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="388570928"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="388570928"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 09:33:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="9448464"
Received: from arthur-vostro-3668.sh.intel.com ([10.239.159.65])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 09:33:14 -0700
From: Zeng Guang <guang.zeng@intel.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	David Hildenbrand <david@redhat.com>
Cc: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Zeng Guang <guang.zeng@intel.com>
Subject: [RFC PATCH v1 3/8] KVM: selftests: Add virt_arch_ucall_prealloc() arch specific implementation
Date: Thu,  2 Nov 2023 23:51:06 +0800
Message-Id: <20231102155111.28821-4-guang.zeng@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231102155111.28821-1-guang.zeng@intel.com>
References: <20231102155111.28821-1-guang.zeng@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_093319_653156_5531792C 
X-CRM114-Status: GOOD (  13.09  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add virt_arch_ucall_prealloc() which allows to preprocess the memory
allocated to ucall_pool as per arch specific requirement.

For X86 platform, it needs to adjust the address to corresponding
address space based on the operation mode, i.e. user or supervisor
mode, at runtime.

There is no change for other platforms(aarch64/riscv/s390x).

Signed-off-by: Zeng Guang <guang.zeng@intel.com>
---
 .../selftests/kvm/include/kvm_util_base.h       | 17 +++++++++++++++++
 .../selftests/kvm/lib/aarch64/processor.c       |  5 +++++
 .../testing/selftests/kvm/lib/riscv/processor.c |  5 +++++
 .../testing/selftests/kvm/lib/s390x/processor.c |  5 +++++
 tools/testing/selftests/kvm/lib/ucall_common.c  |  2 ++
 .../selftests/kvm/lib/x86_64/processor.c        | 12 ++++++++++++
 6 files changed, 46 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index a18db6a7b3cf..dbaa2cf83c1c 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -917,6 +917,23 @@ static inline void virt_dump(FILE *stream, struct kvm_vm *vm, uint8_t indent)
 	virt_arch_dump(stream, vm, indent);
 }
 
+/*
+ * Virtual UCALL memory pre-processing
+ *
+ * Input Args:
+ *   ucall_gva - Guest virtual address point to memory of ucall pool
+ *
+ * Output Args: None
+ *
+ * Return:
+ *   Processed guest virtual address point to memory of ucall pool
+ */
+void *virt_arch_ucall_prealloc(uint64_t ucall_gva);
+
+static inline void *virt_ucall_prealloc(uint64_t ucall_gva)
+{
+	return virt_arch_ucall_prealloc(ucall_gva);
+}
 
 static inline int __vm_disable_nx_huge_pages(struct kvm_vm *vm)
 {
diff --git a/tools/testing/selftests/kvm/lib/aarch64/processor.c b/tools/testing/selftests/kvm/lib/aarch64/processor.c
index 3a0259e25335..3a1827cce615 100644
--- a/tools/testing/selftests/kvm/lib/aarch64/processor.c
+++ b/tools/testing/selftests/kvm/lib/aarch64/processor.c
@@ -238,6 +238,11 @@ void virt_arch_dump(FILE *stream, struct kvm_vm *vm, uint8_t indent)
 	}
 }
 
+void *virt_arch_ucall_prealloc(uint64_t ucall_gva)
+{
+	return (void *)ucall_gva;
+}
+
 void aarch64_vcpu_setup(struct kvm_vcpu *vcpu, struct kvm_vcpu_init *init)
 {
 	struct kvm_vcpu_init default_init = { .target = -1, };
diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index d146ca71e0c0..d3f7eed84195 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -180,6 +180,11 @@ void virt_arch_dump(FILE *stream, struct kvm_vm *vm, uint8_t indent)
 	}
 }
 
+void *virt_arch_ucall_prealloc(uint64_t ucall_gva)
+{
+	return (void *)ucall_gva;
+}
+
 void riscv_vcpu_mmu_setup(struct kvm_vcpu *vcpu)
 {
 	struct kvm_vm *vm = vcpu->vm;
diff --git a/tools/testing/selftests/kvm/lib/s390x/processor.c b/tools/testing/selftests/kvm/lib/s390x/processor.c
index 15945121daf1..b7c86649807d 100644
--- a/tools/testing/selftests/kvm/lib/s390x/processor.c
+++ b/tools/testing/selftests/kvm/lib/s390x/processor.c
@@ -155,6 +155,11 @@ void virt_arch_dump(FILE *stream, struct kvm_vm *vm, uint8_t indent)
 	virt_dump_region(stream, vm, indent, vm->pgd);
 }
 
+void *virt_arch_ucall_prealloc(uint64_t ucall_gva)
+{
+	return (void *)ucall_gva;
+}
+
 struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, uint32_t vcpu_id,
 				  void *guest_code)
 {
diff --git a/tools/testing/selftests/kvm/lib/ucall_common.c b/tools/testing/selftests/kvm/lib/ucall_common.c
index 816a3fa109bf..5afa32d77427 100644
--- a/tools/testing/selftests/kvm/lib/ucall_common.c
+++ b/tools/testing/selftests/kvm/lib/ucall_common.c
@@ -51,6 +51,8 @@ static struct ucall *ucall_alloc(void)
 	if (!ucall_pool)
 		goto ucall_failed;
 
+	ucall_pool = (struct ucall_header *)virt_ucall_prealloc((uint64_t)ucall_pool);
+
 	for (i = 0; i < KVM_MAX_VCPUS; ++i) {
 		if (!test_and_set_bit(i, ucall_pool->in_use)) {
 			uc = &ucall_pool->ucalls[i];
diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index 6f4295a13d00..525b714ee13c 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -388,6 +388,18 @@ void virt_arch_dump(FILE *stream, struct kvm_vm *vm, uint8_t indent)
 	}
 }
 
+void *virt_arch_ucall_prealloc(uint64_t ucall_gva)
+{
+	unsigned short desc_cs;
+
+	asm volatile ("mov %%cs,%0" :  "=r" (desc_cs));
+
+	if (desc_cs & 0x3)
+		return (void *)(ucall_gva & ~KERNEL_LNA_OFFSET);
+	else
+		return (void *)(ucall_gva | KERNEL_LNA_OFFSET);
+}
+
 /*
  * Set Unusable Segment
  *
-- 
2.21.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
