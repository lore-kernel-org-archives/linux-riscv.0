Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F75CD128A
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Apr 2024 08:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MUHqhl7HYGNL+GYUb5qV0cQ96pWdzJen3c7Bwc6mANA=; b=qhl6rNIm8FUpi+
	XfBcPZLZQ9/kkE02Bd7rQ9OPcpEYQGOn7EtKZ4kjz8zZ1nUranhQtU3OLGPjpg2Z7ybhl7o/zhYXY
	moc+5S19gheCfk9w5NDZYMGrdLVD2IOiPPZPIVQ51Wii46IS7IJGAtSapCvY/CkIRms41gnlAtj4f
	wZPVI47PpmZHb6ewdKpVl6CGt73rWBy9PbJ1A+Ke6ZYdCLDQs8zg1aF9s9Lnr1yJauemASZmrTzgs
	OkY4Q0HszESJMbZ2WQUksqReqBVBc0dlTkqynHRGHGsvkL9JO61DbjKG1/UJ9eRyFzmS00OCyEMCy
	CoHIpqBmgKZWQPoIYSGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrCgq-00000007Brd-1svC;
	Mon, 01 Apr 2024 08:06:48 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrCgl-00000007BqC-2Pa1;
	Mon, 01 Apr 2024 08:06:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711958804; x=1743494804;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HXl89clGCBmFMUQwsMNffueQqIafNclJQm4lGSgRHks=;
  b=NuZOYH0X0xCOXt6oydHwolf+8XXMPAC8HgT2JaCkDju+ofza4db7KDgj
   eWShJWStHD1546V1AxAzIyjZAREl/ce0D73sNAOOHn8a2X0jndcw1FI4J
   D0zcLQXkcG3XSZ2ICXNYOvypJHhYMlPpRYHu9kxVZDck3y6ciaN+8irCu
   wLSYL3H7lxsxfDW1csZ/pS3HDDzJ/NVO/+WkNsIT/ovcNjYRrBPej55+O
   Hq1E9MkXZaC6jo6ySuSAQDohVB/xqWLFmZ+vMAqhhKBscFPou94MkJdWg
   MJfo9UN6AfEdxa9n1U5hKj/E3zxlbZDRuFGxFqupHXUOaEad2aq2RxALW
   Q==;
X-CSE-ConnectionGUID: RmLsvi++TQyWWBYe0/nDZg==
X-CSE-MsgGUID: /wkzCMwKSEGpzZUqbIQbLQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="29553378"
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="29553378"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 01:06:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="22386789"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by orviesa004.jf.intel.com with ESMTP; 01 Apr 2024 01:06:37 -0700
From: Haibo Xu <haibo1.xu@intel.com>
To: ajones@ventanamicro.com
Cc: xiaobo55x@gmail.com,
	Haibo Xu <haibo1.xu@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] KVM: riscv: selftests: Add SBI base extension test
Date: Mon,  1 Apr 2024 16:20:18 +0800
Message-Id: <20240401082019.2318193-1-haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_010643_957287_C1065499 
X-CRM114-Status: GOOD (  16.19  )
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

This is the first patch to enable the base extension selftest
for the SBI implementation in KVM. Test for other extensions
will be added later.

Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
---
 tools/testing/selftests/kvm/Makefile          |  1 +
 .../selftests/kvm/include/riscv/processor.h   |  8 +-
 tools/testing/selftests/kvm/riscv/sbi_test.c  | 95 +++++++++++++++++++
 3 files changed, 103 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/kvm/riscv/sbi_test.c

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 741c7dc16afc..a6acbbcad757 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -189,6 +189,7 @@ TEST_GEN_PROGS_s390x += rseq_test
 TEST_GEN_PROGS_s390x += set_memory_region_test
 TEST_GEN_PROGS_s390x += kvm_binary_stats_test
 
+TEST_GEN_PROGS_riscv += riscv/sbi_test
 TEST_GEN_PROGS_riscv += arch_timer
 TEST_GEN_PROGS_riscv += demand_paging_test
 TEST_GEN_PROGS_riscv += dirty_log_test
diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
index ce473fe251dd..df530ac751c4 100644
--- a/tools/testing/selftests/kvm/include/riscv/processor.h
+++ b/tools/testing/selftests/kvm/include/riscv/processor.h
@@ -178,7 +178,13 @@ enum sbi_ext_id {
 };
 
 enum sbi_ext_base_fid {
-	SBI_EXT_BASE_PROBE_EXT = 3,
+	SBI_EXT_BASE_GET_SPEC_VERSION = 0,
+	SBI_EXT_BASE_GET_IMP_ID,
+	SBI_EXT_BASE_GET_IMP_VERSION,
+	SBI_EXT_BASE_PROBE_EXT,
+	SBI_EXT_BASE_GET_MVENDORID,
+	SBI_EXT_BASE_GET_MARCHID,
+	SBI_EXT_BASE_GET_MIMPID,
 };
 
 struct sbiret {
diff --git a/tools/testing/selftests/kvm/riscv/sbi_test.c b/tools/testing/selftests/kvm/riscv/sbi_test.c
new file mode 100644
index 000000000000..b9378546e3b6
--- /dev/null
+++ b/tools/testing/selftests/kvm/riscv/sbi_test.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * sbi_test - SBI API test for KVM's SBI implementation.
+ *
+ * Copyright (c) 2024 Intel Corporation
+ *
+ * Test cover the following SBI extentions:
+ *  - Base: All functions in this extension should be supported
+ */
+
+#include "kvm_util.h"
+#include "processor.h"
+#include "test_util.h"
+
+/*
+ * Test that all functions in the base extension must be supported
+ */
+static void base_ext_guest_code(void)
+{
+	struct sbiret ret;
+
+	/*
+	 * Since the base extension was introduced in SBI Spec v0.2,
+	 * assert if the implemented SBI version is below 0.2.
+	 */
+	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_SPEC_VERSION, 0,
+			0, 0, 0, 0, 0);
+	__GUEST_ASSERT(!ret.error && ret.value >= 2, "Get Spec Version Error: ret.error=%ld, "
+			"ret.value=%ld\n", ret.error, ret.value);
+
+	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_IMP_ID, 0,
+			0, 0, 0, 0, 0);
+	__GUEST_ASSERT(!ret.error && ret.value == 3, "Get Imp ID Error: ret.error=%ld, "
+			"ret.value=%ld\n",
+			ret.error, ret.value);
+
+	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_IMP_VERSION, 0,
+			0, 0, 0, 0, 0);
+	__GUEST_ASSERT(!ret.error, "Get Imp Version Error: ret.error=%ld\n", ret.error);
+
+	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT, SBI_EXT_BASE,
+			0, 0, 0, 0, 0);
+	__GUEST_ASSERT(!ret.error && ret.value == 1, "Probe ext Error: ret.error=%ld, "
+			"ret.value=%ld\n",
+			ret.error, ret.value);
+
+	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_MVENDORID, 0,
+			0, 0, 0, 0, 0);
+	__GUEST_ASSERT(!ret.error, "Get Machine Vendor ID Error: ret.error=%ld\n", ret.error);
+
+	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_MARCHID, 0,
+			0, 0, 0, 0, 0);
+	__GUEST_ASSERT(!ret.error, "Get Machine Arch ID Error: ret.error=%ld\n", ret.error);
+
+	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_MIMPID, 0,
+			0, 0, 0, 0, 0);
+	__GUEST_ASSERT(!ret.error, "Get Machine Imp ID Error: ret.error=%ld\n", ret.error);
+
+	GUEST_DONE();
+}
+
+static void sbi_base_ext_test(void)
+{
+	struct kvm_vm *vm;
+	struct kvm_vcpu *vcpu;
+	struct ucall uc;
+
+	vm = vm_create_with_one_vcpu(&vcpu, base_ext_guest_code);
+	while (1) {
+		vcpu_run(vcpu);
+		TEST_ASSERT(vcpu->run->exit_reason == UCALL_EXIT_REASON,
+			    "Unexpected exit reason: %u (%s),",
+			    vcpu->run->exit_reason, exit_reason_str(vcpu->run->exit_reason));
+
+		switch (get_ucall(vcpu, &uc)) {
+		case UCALL_DONE:
+			goto done;
+		case UCALL_ABORT:
+			fprintf(stderr, "Guest assert failed!\n");
+			REPORT_GUEST_ASSERT(uc);
+		default:
+			TEST_FAIL("Unexpected ucall %lu", uc.cmd);
+		}
+	}
+
+done:
+	kvm_vm_free(vm);
+}
+
+int main(void)
+{
+	sbi_base_ext_test();
+
+	return 0;
+}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
