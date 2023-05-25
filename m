Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5336DC77B7E
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 07:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=24c6ayEhJq636eO2dOxZTQ9/ZJGZis3yHK3Mf2xCa4c=; b=1N1McFWM8fjymW
	7fdj5atrRAq4ntK4YImewxwCTzHFwu9RoX8i8jb/nDCN3I3hJJR3QLTZdSnxcFlD1Z0+Q/JSImBPM
	N4e8aKiTijtQCg+W7AzLwBOAA7m+lzf3HIpqhIDf7v9ujAWIlhoVNVydVMN7uGv2m8Rz+7zMMjCb3
	Ceow1MxekbDT5MruY8gUeSIrs64ihg2ABrDZO6/AcqNOhbcPU4tA9VmHD1uK3ABuZM0pQO6fxhr19
	sA0/Vi38auvI410RurqFEXhYbzGC1rb6r0GQU/DZfVrQ/hmYIc1jYMYozvSt5t8Vcy3Ml6JbIi93b
	GXNmlLj50KF/Dj5bs72g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q25VN-00FoiD-1I;
	Thu, 25 May 2023 07:35:25 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q25VC-00FoZv-3C;
	Thu, 25 May 2023 07:35:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685000114; x=1716536114;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f527YugtekorTYjnVJ/ClZh5W6FzG4rfed15FmLtlHo=;
  b=EhAZ6SImSvGxIbd1TDoTcP+d0MCtbHcCYeEtTwI5PR19VB+lHBosZsj1
   RCUhtahPLuChb5PPS3ExbROAGQ5SfhzqT57Ng4yGmKwd5Jk3PR1cPQUkz
   OmFlT55o95FbXOC0LXUicpiZFxBxvzNLgrOdlw840Oobv1vP55URG0Dz/
   FkPVPrIGdpDiHpBJSrXbSdiJxJVZBYTl7Bz1yPwP3QuQqO7mfFAayww7i
   Ha+VMM6QRinyydc9SLNGtwy2Hw5V4wzGhuRo3nKDUQd+f0XZ6US+nhDXs
   cy1dTeNyhzH2J5PjV5DLrjpmsJqtq9zWIIl4JtiUR2lqW1SZUj9l9W5JD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="417280891"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="417280891"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 00:32:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="769774695"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="769774695"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 00:32:46 -0700
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
Subject: [PATCH v2 01/11] KVM: arm64: selftests: Replace str_with_index with strdup_printf
Date: Thu, 25 May 2023 15:38:25 +0800
Message-Id: <ddec70e63111a2869028c356e177c4de4e1a4b8d.1684999824.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684999824.git.haibo1.xu@intel.com>
References: <cover.1684999824.git.haibo1.xu@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_003515_113057_D3F1418E 
X-CRM114-Status: GOOD (  10.52  )
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
