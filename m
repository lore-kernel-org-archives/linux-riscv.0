Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8365BC0018A
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 16:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SIKkEtQdKSVv5VJ9NBsXxb0Xo6lHPa8Pzle4B1EM/kk=; b=RvPXot0mTEsx7m
	gy9pApgoFLDeQRAawP0XIwGg2u/jfi5iCVhn3X9UApl7KUfy601ZcRv44BH0BlW9ECf+pYrqE8ALk
	sUPpmaPpvcl1xeB7Y6Gv5qUBI9zOvOV56QV7Z/uNmDPFM8NzOZWHMN+igwe4s3LU4N6eEgnn99zwR
	jIJx+bAyj3CRGabM77aKLYTKKkWpsfhSVfmGSXKYZtZFklUx+iLuGTaxdcAIqYBVjFPWqawIXgWLK
	di4dh1uhUOBMuJFCaQ9HjAUAs8D31Gq1XFa/V+NVah0HXZBdy00kdBkdnW8dt+NwW+yeuXPs4x1/R
	ND+1a5sTJU9Qg1Yn60DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyadQ-009sCL-2V;
	Thu, 02 Nov 2023 16:33:32 +0000
Received: from mgamail.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyadH-009s2l-0l;
	Thu, 02 Nov 2023 16:33:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698942803; x=1730478803;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=8/hRJyUBNjvleQKE+JOCe0b2zCgJ7MkC7xPhxYSrynY=;
  b=WhL8CXQKbYppnwN6dlgSBJTRe56iJM19HinxDuAV9PF+g7O0lMoEkFU+
   sEuw/tDk38OHGeqVHMWV9RrgVKsIbGYX8dOIayqoDecnsQt6qafmhZZRn
   ZhXmf8fpnH9qpSFy7HowjfBz3W1h1w99IZbmPfJnzpwykbkxn6ec7yXLF
   6DLgIsoa1BtPm5MVqPbl4sHZSG1QjsO+UWNXduk4IksWFGk29Yh3vBjWJ
   J09WSVoIKGkmu3Va+b+i/HE32WwxytIlqS4IGvhTTehh2DJZsHItfBFDe
   JIsl9jbggoCtl+gEAEdNC4tIwrUM4vZ6EHlxmmunYXi+uA4ObacDCUfb1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="388570963"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="388570963"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 09:33:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="9448494"
Received: from arthur-vostro-3668.sh.intel.com ([10.239.159.65])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 09:33:18 -0700
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
Subject: [RFC PATCH v1 4/8] KVM : selftests : Adapt selftest cases to kernel canonical linear address
Date: Thu,  2 Nov 2023 23:51:07 +0800
Message-Id: <20231102155111.28821-5-guang.zeng@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231102155111.28821-1-guang.zeng@intel.com>
References: <20231102155111.28821-1-guang.zeng@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_093323_290410_66AE6EBE 
X-CRM114-Status: GOOD (  12.23  )
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

Adapt RIP to kernel canonical linear address in test cases
set_memory_region_test/debug_regs/userspace_msr_exit_test.

No functional change intended.

Signed-off-by: Zeng Guang <guang.zeng@intel.com>
---
 .../testing/selftests/kvm/set_memory_region_test.c  | 13 ++++++++++---
 tools/testing/selftests/kvm/x86_64/debug_regs.c     |  2 +-
 .../selftests/kvm/x86_64/userspace_msr_exit_test.c  |  9 +++++----
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
index b32960189f5f..8ab897bae3e0 100644
--- a/tools/testing/selftests/kvm/set_memory_region_test.c
+++ b/tools/testing/selftests/kvm/set_memory_region_test.c
@@ -31,6 +31,12 @@
 #define MEM_REGION_GPA		0xc0000000
 #define MEM_REGION_SLOT		10
 
+/*
+ * Offset to execute code at kernel address space
+ */
+#define KERNEL_LNA_OFFSET	0xffff800000000000
+#define CAST_TO_KERN(x)		(x | KERNEL_LNA_OFFSET)
+
 static const uint64_t MMIO_VAL = 0xbeefull;
 
 extern const uint64_t final_rip_start;
@@ -300,10 +306,11 @@ static void test_delete_memory_region(void)
 	 * so the instruction pointer would point to the reset vector.
 	 */
 	if (run->exit_reason == KVM_EXIT_INTERNAL_ERROR)
-		TEST_ASSERT(regs.rip >= final_rip_start &&
-			    regs.rip < final_rip_end,
+		TEST_ASSERT(regs.rip >= CAST_TO_KERN(final_rip_start) &&
+			    regs.rip < CAST_TO_KERN(final_rip_end),
 			    "Bad rip, expected 0x%lx - 0x%lx, got 0x%llx\n",
-			    final_rip_start, final_rip_end, regs.rip);
+			    CAST_TO_KERN(final_rip_start), CAST_TO_KERN(final_rip_end),
+			    regs.rip);
 
 	kvm_vm_free(vm);
 }
diff --git a/tools/testing/selftests/kvm/x86_64/debug_regs.c b/tools/testing/selftests/kvm/x86_64/debug_regs.c
index f6b295e0b2d2..73ce373e3299 100644
--- a/tools/testing/selftests/kvm/x86_64/debug_regs.c
+++ b/tools/testing/selftests/kvm/x86_64/debug_regs.c
@@ -64,7 +64,7 @@ static void guest_code(void)
 	GUEST_DONE();
 }
 
-#define  CAST_TO_RIP(v)  ((unsigned long long)&(v))
+#define  CAST_TO_RIP(v)  ((unsigned long long)&(v) | KERNEL_LNA_OFFSET)
 
 static void vcpu_skip_insn(struct kvm_vcpu *vcpu, int insn_len)
 {
diff --git a/tools/testing/selftests/kvm/x86_64/userspace_msr_exit_test.c b/tools/testing/selftests/kvm/x86_64/userspace_msr_exit_test.c
index 3533dc2fbfee..ab6b3f88352f 100644
--- a/tools/testing/selftests/kvm/x86_64/userspace_msr_exit_test.c
+++ b/tools/testing/selftests/kvm/x86_64/userspace_msr_exit_test.c
@@ -18,6 +18,7 @@
 static int fep_available = 1;
 
 #define MSR_NON_EXISTENT 0x474f4f00
+#define CAST_TO_KERN(x)  (x | KERNEL_LNA_OFFSET)
 
 static u64 deny_bits = 0;
 struct kvm_msr_filter filter_allow = {
@@ -363,12 +364,12 @@ static void __guest_gp_handler(struct ex_regs *regs,
 			       char *r_start, char *r_end,
 			       char *w_start, char *w_end)
 {
-	if (regs->rip == (uintptr_t)r_start) {
-		regs->rip = (uintptr_t)r_end;
+	if (regs->rip == CAST_TO_KERN((uintptr_t)r_start)) {
+		regs->rip = CAST_TO_KERN((uintptr_t)r_end);
 		regs->rax = 0;
 		regs->rdx = 0;
-	} else if (regs->rip == (uintptr_t)w_start) {
-		regs->rip = (uintptr_t)w_end;
+	} else if (regs->rip == CAST_TO_KERN((uintptr_t)w_start)) {
+		regs->rip = CAST_TO_KERN((uintptr_t)w_end);
 	} else {
 		GUEST_ASSERT(!"RIP is at an unknown location!");
 	}
-- 
2.21.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
