Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3EDFC7EE29
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 02:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jUfkBkllqM0o9SVXWAd9EDxGsjLny/eS7a/4ZyXnCSw=; b=uZfQBQyY14Wrjg
	4l+qDeBYOfEYvOKF4o+d3DUS2gPnwhtKHX5ivTXkkkyNVcU7xrsTgVIHYX2RZvVhsx92F+HHOb8t1
	nxyM0TFG1Wx1mJkBWrpt1qYZjmw0D2U3RleDTj6jv7YrWU5gu+sLcwQghe8MvKl621rqz0Qus1Tf3
	oYxlxS5tynfYzqERWebALg88WWqN8I4+T4L7+tcWBsZnnEu6qXm4U2yZ3nZZCBqnBtWHnbtC/0RtJ
	zg/Re8ijdo2jX4WoFWijvOcLkRanI4Bnml8d/KAMzJ262SLCj3kSTvLnn9P2N3vuaspTSIYDju+Xh
	4qdX0MRDLltH4tSsC48A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7RWM-00BGPR-2v;
	Fri, 09 Jun 2023 02:06:34 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7RWJ-00BGNi-0K;
	Fri, 09 Jun 2023 02:06:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686276391; x=1717812391;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iQC6kb1rTOKXEDlru5Ov1HPB6vcRfk5Mp5vR5TxV2Iw=;
  b=Lpi2YD/ZJsSDtvhYXvk9V3SVbLqzG5adhXok1xJT9iHJBln0SNM2a6gS
   k9VSW4TVw7MnKfcsLmdjHaTfXHY5rfSTi7mMPXBlAyqaWr1q1QVbKM5Ue
   8ZRfBWbOsj7ECKRW434YooOWLLBqU7z2tf6PQ7lBxRRSspSzyLK1TQKdy
   EPcE/6zMUN288N8ZA6RhUxwkybNRwFbQDHadGOqt2G+Y8Gvg71b0RBI4D
   li4t3AFKbVsnL2GbcG0cXzIzRXnOi4ceLabXErX0mTEDifN9HmIkJq83k
   GPVZeTgb+yGp3pag1bw1oRu4it7TlIFqnnwkg8+mL8A0rEe+jmrZhUXQT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="359975180"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="359975180"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 19:06:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="713334419"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="713334419"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 19:06:19 -0700
From: Haibo Xu <haibo1.xu@intel.com>
To: 
Cc: xiaobo55x@gmail.com,
	haibo1.xu@intel.com,
	ajones@ventanamicro.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	seanjc@google.com,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	David Matlack <dmatlack@google.com>,
	Ben Gardon <bgardon@google.com>,
	Vipin Sharma <vipinsh@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [PATCH v3 01/10] KVM: arm64: selftests: Replace str_with_index with strdup_printf
Date: Fri,  9 Jun 2023 10:12:09 +0800
Message-Id: <92c0956955e94572d9da4bde3a9ce797d12e08aa.1686275310.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686275310.git.haibo1.xu@intel.com>
References: <cover.1686275310.git.haibo1.xu@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_190631_188874_77F9B3C8 
X-CRM114-Status: GOOD (  10.72  )
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

From: Andrew Jones <ajones@ventanamicro.com>

The original author of aarch64/get-reg-list.c (me) was wearing
tunnel vision goggles when implementing str_with_index(). There's
no reason to have such a special case string function. Instead,
take inspiration from glib and implement strdup_printf. The
implementation builds on vasprintf() which requires _GNU_SOURCE,
but we require _GNU_SOURCE in most files already.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
---
 .../selftests/kvm/aarch64/get-reg-list.c      | 23 ++++---------------
 .../testing/selftests/kvm/include/test_util.h |  2 ++
 tools/testing/selftests/kvm/lib/test_util.c   | 15 ++++++++++++
 3 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/tools/testing/selftests/kvm/aarch64/get-reg-list.c b/tools/testing/selftests/kvm/aarch64/get-reg-list.c
index d4e1f4af29d6..c152523a5ed4 100644
--- a/tools/testing/selftests/kvm/aarch64/get-reg-list.c
+++ b/tools/testing/selftests/kvm/aarch64/get-reg-list.c
@@ -132,19 +132,6 @@ static bool find_reg(__u64 regs[], __u64 nr_regs, __u64 reg)
 	return false;
 }
 
-static const char *str_with_index(const char *template, __u64 index)
-{
-	char *str, *p;
-	int n;
-
-	str = strdup(template);
-	p = strstr(str, "##");
-	n = sprintf(p, "%lld", index);
-	strcat(p + n, strstr(template, "##") + 2);
-
-	return (const char *)str;
-}
-
 #define REG_MASK (KVM_REG_ARCH_MASK | KVM_REG_SIZE_MASK | KVM_REG_ARM_COPROC_MASK)
 
 #define CORE_REGS_XX_NR_WORDS	2
@@ -163,7 +150,7 @@ static const char *core_id_to_str(struct vcpu_config *c, __u64 id)
 	     KVM_REG_ARM_CORE_REG(regs.regs[30]):
 		idx = (core_off - KVM_REG_ARM_CORE_REG(regs.regs[0])) / CORE_REGS_XX_NR_WORDS;
 		TEST_ASSERT(idx < 31, "%s: Unexpected regs.regs index: %lld", config_name(c), idx);
-		return str_with_index("KVM_REG_ARM_CORE_REG(regs.regs[##])", idx);
+		return strdup_printf("KVM_REG_ARM_CORE_REG(regs.regs[%lld])", idx);
 	case KVM_REG_ARM_CORE_REG(regs.sp):
 		return "KVM_REG_ARM_CORE_REG(regs.sp)";
 	case KVM_REG_ARM_CORE_REG(regs.pc):
@@ -178,12 +165,12 @@ static const char *core_id_to_str(struct vcpu_config *c, __u64 id)
 	     KVM_REG_ARM_CORE_REG(spsr[KVM_NR_SPSR - 1]):
 		idx = (core_off - KVM_REG_ARM_CORE_REG(spsr[0])) / CORE_SPSR_XX_NR_WORDS;
 		TEST_ASSERT(idx < KVM_NR_SPSR, "%s: Unexpected spsr index: %lld", config_name(c), idx);
-		return str_with_index("KVM_REG_ARM_CORE_REG(spsr[##])", idx);
+		return strdup_printf("KVM_REG_ARM_CORE_REG(spsr[%lld])", idx);
 	case KVM_REG_ARM_CORE_REG(fp_regs.vregs[0]) ...
 	     KVM_REG_ARM_CORE_REG(fp_regs.vregs[31]):
 		idx = (core_off - KVM_REG_ARM_CORE_REG(fp_regs.vregs[0])) / CORE_FPREGS_XX_NR_WORDS;
 		TEST_ASSERT(idx < 32, "%s: Unexpected fp_regs.vregs index: %lld", config_name(c), idx);
-		return str_with_index("KVM_REG_ARM_CORE_REG(fp_regs.vregs[##])", idx);
+		return strdup_printf("KVM_REG_ARM_CORE_REG(fp_regs.vregs[%lld])", idx);
 	case KVM_REG_ARM_CORE_REG(fp_regs.fpsr):
 		return "KVM_REG_ARM_CORE_REG(fp_regs.fpsr)";
 	case KVM_REG_ARM_CORE_REG(fp_regs.fpcr):
@@ -212,13 +199,13 @@ static const char *sve_id_to_str(struct vcpu_config *c, __u64 id)
 		n = (id >> 5) & (KVM_ARM64_SVE_NUM_ZREGS - 1);
 		TEST_ASSERT(id == KVM_REG_ARM64_SVE_ZREG(n, 0),
 			    "%s: Unexpected bits set in SVE ZREG id: 0x%llx", config_name(c), id);
-		return str_with_index("KVM_REG_ARM64_SVE_ZREG(##, 0)", n);
+		return strdup_printf("KVM_REG_ARM64_SVE_ZREG(%lld, 0)", n);
 	case KVM_REG_ARM64_SVE_PREG_BASE ...
 	     KVM_REG_ARM64_SVE_PREG_BASE + (1ULL << 5) * KVM_ARM64_SVE_NUM_PREGS - 1:
 		n = (id >> 5) & (KVM_ARM64_SVE_NUM_PREGS - 1);
 		TEST_ASSERT(id == KVM_REG_ARM64_SVE_PREG(n, 0),
 			    "%s: Unexpected bits set in SVE PREG id: 0x%llx", config_name(c), id);
-		return str_with_index("KVM_REG_ARM64_SVE_PREG(##, 0)", n);
+		return strdup_printf("KVM_REG_ARM64_SVE_PREG(%lld, 0)", n);
 	case KVM_REG_ARM64_SVE_FFR_BASE:
 		TEST_ASSERT(id == KVM_REG_ARM64_SVE_FFR(0),
 			    "%s: Unexpected bits set in SVE FFR id: 0x%llx", config_name(c), id);
diff --git a/tools/testing/selftests/kvm/include/test_util.h b/tools/testing/selftests/kvm/include/test_util.h
index a6e9f215ce70..7e0182f837b5 100644
--- a/tools/testing/selftests/kvm/include/test_util.h
+++ b/tools/testing/selftests/kvm/include/test_util.h
@@ -186,4 +186,6 @@ static inline uint32_t atoi_non_negative(const char *name, const char *num_str)
 	return num;
 }
 
+char *strdup_printf(const char *fmt, ...) __attribute__((format(printf, 1, 2), nonnull(1)));
+
 #endif /* SELFTEST_KVM_TEST_UTIL_H */
diff --git a/tools/testing/selftests/kvm/lib/test_util.c b/tools/testing/selftests/kvm/lib/test_util.c
index b772193f6c18..3e36019eeb4a 100644
--- a/tools/testing/selftests/kvm/lib/test_util.c
+++ b/tools/testing/selftests/kvm/lib/test_util.c
@@ -5,6 +5,9 @@
  * Copyright (C) 2020, Google LLC.
  */
 
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <stdarg.h>
 #include <assert.h>
 #include <ctype.h>
 #include <limits.h>
@@ -377,3 +380,15 @@ int atoi_paranoid(const char *num_str)
 
 	return num;
 }
+
+char *strdup_printf(const char *fmt, ...)
+{
+	va_list ap;
+	char *str;
+
+	va_start(ap, fmt);
+	vasprintf(&str, fmt, ap);
+	va_end(ap);
+
+	return str;
+}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
