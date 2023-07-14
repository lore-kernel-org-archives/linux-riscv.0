Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E79DC001DF
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 00:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kbb1xk9L8U6/R6Mi03C/pxvI/zLui6fvpTzZ3nt9NM0=; b=i30jZmBXxKdGYf
	grqNqJCnxEhfhmxvaT1Fx5anB+Y0fIAdjjz1wo+59PrYONgN5/YpznqoS8oibt3fYRiYC/vXGRu6z
	odHCetjHcoIKc4VUH8U3ngzZEoE9krYTp6vVvw7YoCol03UYG/L5ie6CY83RTJATvhTb4jmmaG0mX
	vg/+PyQTBWk6ElHDHRZf0DH3hpAYC8TP8V25K10ikuTPVKbz04yS1ckSC1vMuI4BfQPJ1Jc7OQzNW
	6JVvfm3Fc3xfCcY/eNdl3+rbXNZKY6UrgNAagKemsXpnjVYtZqKab/4aEVNGMYt9RQjcN/QAcldMc
	J5EGMUbLp++WESynsh1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qK6Sc-004cUZ-0L;
	Fri, 14 Jul 2023 00:15:02 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qK6SY-004cRK-0J
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 00:14:59 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-666eb03457cso937720b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 17:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689293697; x=1689898497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+0r7ylMNQwjmn0OPkYDCq51XOFGJFq+TLUQNF3+/r/M=;
        b=haAaWBwoChBxuD8Pfd0jAkJcxdJC/ed1uAjbiUoi8wxkZqPtdGIqgTjzZDWEVHfm6l
         51cEMf6gM8C228ZG9wuUj6Ivc7tJZw7r0io2/ZPsqcgxBdqiLweiZCxWUsEngg2ecRtE
         GdBQfbZVKOt60zzCFPWEmKotw0jdgng6Qx/y4iuGm/c8FyNYyzvwro/ej/o8MrP66pVo
         AaPyvF5/o9oO5Z+Xy390UDeaPuXxxrG4RrL9h6v2D1lOKHKTsgTLmmiZzMi8pzjuvV3p
         +yscdkzgS0W2beD1gigIVK8DdAuNL41aOf8gFXxon6B6Ney5K6npBCUq592PqPNl4fIe
         fRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689293697; x=1689898497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+0r7ylMNQwjmn0OPkYDCq51XOFGJFq+TLUQNF3+/r/M=;
        b=AMlkc5tm0d59xyqldOoN7MjEXwCNHc9nSJr2HSHgzGxjzzvVX682kh1I09ftT+je6m
         TmdyUwDnNIIYpDEDxx/0Lr1Ic82KxDAGb9g/J6iELRoRRqYvxYmDdISL1D0BNZlyPaww
         MuqKACSrQO7N1Nu98NONfKhwHC7bDgYY6uEnjClvYB0YbB0U+KCjMX7/22zMY1eO4kYq
         UsTGs8Ji9doQCqsLV+vN6yUd0A90l7uf4IMcXnEwrHmgYyfKVw96VjfzrnH5qUKb8atw
         uq01UbrqiJUK3/l/meQStT9E9Hjuv8uaSAl/vXaScVmDCnfCQGNoGh82d3Sle7mRd+uT
         Ao4w==
X-Gm-Message-State: ABy/qLZarE0oARr4tWoHAPqlYyRb2gPN8lN4hauc1TWxRLRaERdUVzHb
	u/gPTkZ1zQLd+Un5Xpo3LpYrTQ==
X-Google-Smtp-Source: APBJJlHthF/xOQY29h/SyVgVkdQb7LnbuS2bmKCUB6lATpARVerASAF4xQ0wVKCbGUja7e5kDLb32A==
X-Received: by 2002:a05:6a20:3953:b0:12d:5b6:7b32 with SMTP id r19-20020a056a20395300b0012d05b67b32mr2817577pzg.3.1689293697603;
        Thu, 13 Jul 2023 17:14:57 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id x25-20020aa793b9000000b00673e652985esm5938107pff.44.2023.07.13.17.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 17:14:57 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: charlie@rivosinc.com,
	conor@kernel.org,
	paul.walmsley@sifive.com,
	palmer@rivosinc.com,
	aou@eecs.berkeley.edu,
	anup@brainfault.org,
	konstantin@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	mick@ics.forth.gr,
	jrtc27@jrtc27.com,
	rdunlap@infradead.org,
	alexghiti@rivosinc.com
Subject: [PATCH v5 2/4] RISC-V: mm: Add tests for RISC-V mm
Date: Thu, 13 Jul 2023 17:14:01 -0700
Message-ID: <20230714001430.75798-3-charlie@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714001430.75798-1-charlie@rivosinc.com>
References: <20230714001430.75798-1-charlie@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_171458_137306_81D060DD 
X-CRM114-Status: GOOD (  16.42  )
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

Add tests that enforce mmap hint address behavior. mmap should default
to sv48. mmap will provide an address at the highest address space that
can fit into the hint address, unless the hint address is less than sv39
and not 0, then it will return a sv39 address. In addition, ensure that
rlimit changes do not cause mmap to fail.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 tools/testing/selftests/riscv/Makefile        |   2 +-
 tools/testing/selftests/riscv/mm/.gitignore   |   1 +
 tools/testing/selftests/riscv/mm/Makefile     |  21 +++
 .../selftests/riscv/mm/testcases/mmap.c       | 133 ++++++++++++++++++
 4 files changed, 156 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/riscv/mm/.gitignore
 create mode 100644 tools/testing/selftests/riscv/mm/Makefile
 create mode 100644 tools/testing/selftests/riscv/mm/testcases/mmap.c

diff --git a/tools/testing/selftests/riscv/Makefile b/tools/testing/selftests/riscv/Makefile
index 32a72902d045..0fee58f990ae 100644
--- a/tools/testing/selftests/riscv/Makefile
+++ b/tools/testing/selftests/riscv/Makefile
@@ -5,7 +5,7 @@
 ARCH ?= $(shell uname -m 2>/dev/null || echo not)
 
 ifneq (,$(filter $(ARCH),riscv))
-RISCV_SUBTARGETS ?= hwprobe
+RISCV_SUBTARGETS ?= hwprobe mm
 else
 RISCV_SUBTARGETS :=
 endif
diff --git a/tools/testing/selftests/riscv/mm/.gitignore b/tools/testing/selftests/riscv/mm/.gitignore
new file mode 100644
index 000000000000..9a6f303edcd3
--- /dev/null
+++ b/tools/testing/selftests/riscv/mm/.gitignore
@@ -0,0 +1 @@
+mmap
diff --git a/tools/testing/selftests/riscv/mm/Makefile b/tools/testing/selftests/riscv/mm/Makefile
new file mode 100644
index 000000000000..cf68e63e7495
--- /dev/null
+++ b/tools/testing/selftests/riscv/mm/Makefile
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: GPL-2.0
+# Originally tools/testing/selftests/arm64/signal
+
+# Additional include paths needed by kselftest.h and local headers
+CFLAGS += -D_GNU_SOURCE -std=gnu99 -I.
+
+SRCS := $(filter-out testcases/testcases.c,$(wildcard testcases/*.c))
+PROGS := $(patsubst %.c,%,$(SRCS))
+
+# Generated binaries to be installed by top KSFT script
+TEST_GEN_PROGS := $(notdir $(PROGS))
+
+# Get Kernel headers installed and use them.
+
+# Including KSFT lib.mk here will also mangle the TEST_GEN_PROGS list
+# to account for any OUTPUT target-dirs optionally provided by
+# the toplevel makefile
+include ../../lib.mk
+
+$(TEST_GEN_PROGS): $(PROGS)
+	cp $(PROGS) $(OUTPUT)/
diff --git a/tools/testing/selftests/riscv/mm/testcases/mmap.c b/tools/testing/selftests/riscv/mm/testcases/mmap.c
new file mode 100644
index 000000000000..d8e751f7b8c9
--- /dev/null
+++ b/tools/testing/selftests/riscv/mm/testcases/mmap.c
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <sys/mman.h>
+#include <sys/resource.h>
+#include <sys/time.h>
+
+#include "../../kselftest_harness.h"
+struct addresses {
+	int *no_hint;
+	int *on_37_addr;
+	int *on_38_addr;
+	int *on_46_addr;
+	int *on_47_addr;
+	int *on_55_addr;
+	int *on_56_addr;
+};
+
+void do_mmaps(struct addresses *mmap_addresses)
+{
+	// Place all of the hint addresses on the boundaries of mmap
+	// sv39, sv48, sv57
+	// User addresses end at 1<<38, 1<<47, 1<<56 respectively
+	void *on_37_bits = (void *)(1UL << 37);
+	void *on_38_bits = (void *)(1UL << 38);
+	void *on_46_bits = (void *)(1UL << 46);
+	void *on_47_bits = (void *)(1UL << 47);
+	void *on_55_bits = (void *)(1UL << 55);
+	void *on_56_bits = (void *)(1UL << 56);
+
+	int prot = PROT_READ | PROT_WRITE;
+	int flags = MAP_PRIVATE | MAP_ANONYMOUS;
+
+	mmap_addresses->no_hint =
+		mmap(NULL, 5 * sizeof(int), prot, flags, 0, 0);
+	mmap_addresses->on_37_addr =
+		mmap(on_37_bits, 5 * sizeof(int), prot, flags, 0, 0);
+	mmap_addresses->on_38_addr =
+		mmap(on_38_bits, 5 * sizeof(int), prot, flags, 0, 0);
+	mmap_addresses->on_46_addr =
+		mmap(on_46_bits, 5 * sizeof(int), prot, flags, 0, 0);
+	mmap_addresses->on_47_addr =
+		mmap(on_47_bits, 5 * sizeof(int), prot, flags, 0, 0);
+	mmap_addresses->on_55_addr =
+		mmap(on_55_bits, 5 * sizeof(int), prot, flags, 0, 0);
+	mmap_addresses->on_56_addr =
+		mmap(on_56_bits, 5 * sizeof(int), prot, flags, 0, 0);
+}
+
+TEST(default_rlimit)
+{
+// Only works on 64 bit
+#if __riscv_xlen == 64
+	struct addresses mmap_addresses;
+
+	do_mmaps(&mmap_addresses);
+
+	EXPECT_NE(mmap_addresses.no_hint, MAP_FAILED);
+	EXPECT_NE(mmap_addresses.on_37_addr, MAP_FAILED);
+	EXPECT_NE(mmap_addresses.on_38_addr, MAP_FAILED);
+	EXPECT_NE(mmap_addresses.on_46_addr, MAP_FAILED);
+	EXPECT_NE(mmap_addresses.on_47_addr, MAP_FAILED);
+	EXPECT_NE(mmap_addresses.on_55_addr, MAP_FAILED);
+	EXPECT_NE(mmap_addresses.on_56_addr, MAP_FAILED);
+
+	EXPECT_LT((unsigned long)mmap_addresses.no_hint, 1UL << 47);
+	EXPECT_LT((unsigned long)mmap_addresses.on_37_addr, 1UL << 38);
+	EXPECT_LT((unsigned long)mmap_addresses.on_38_addr, 1UL << 38);
+	EXPECT_LT((unsigned long)mmap_addresses.on_46_addr, 1UL << 38);
+	EXPECT_LT((unsigned long)mmap_addresses.on_47_addr, 1UL << 47);
+	EXPECT_LT((unsigned long)mmap_addresses.on_55_addr, 1UL << 47);
+	EXPECT_LT((unsigned long)mmap_addresses.on_56_addr, 1UL << 56);
+#endif
+}
+
+TEST(zero_rlimit)
+{
+// Only works on 64 bit
+#if __riscv_xlen == 64
+	struct addresses mmap_addresses;
+	struct rlimit rlim_new = { .rlim_cur = 0, .rlim_max = RLIM_INFINITY };
+
+	setrlimit(RLIMIT_STACK, &rlim_new);
+
+	do_mmaps(&mmap_addresses);
+
+	EXPECT_NE(mmap_addresses.no_hint, MAP_FAILED);
+	EXPECT_NE(mmap_addresses.on_37_addr, MAP_FAILED);
+	EXPECT_NE(mmap_addresses.on_38_addr, MAP_FAILED);
+	EXPECT_NE(mmap_addresses.on_46_addr, MAP_FAILED);
+	EXPECT_NE(mmap_addresses.on_47_addr, MAP_FAILED);
+	EXPECT_NE(mmap_addresses.on_55_addr, MAP_FAILED);
+	EXPECT_NE(mmap_addresses.on_56_addr, MAP_FAILED);
+
+	EXPECT_LT((unsigned long)mmap_addresses.no_hint, 1UL << 47);
+	EXPECT_LT((unsigned long)mmap_addresses.on_37_addr, 1UL << 38);
+	EXPECT_LT((unsigned long)mmap_addresses.on_38_addr, 1UL << 38);
+	EXPECT_LT((unsigned long)mmap_addresses.on_46_addr, 1UL << 38);
+	EXPECT_LT((unsigned long)mmap_addresses.on_47_addr, 1UL << 47);
+	EXPECT_LT((unsigned long)mmap_addresses.on_55_addr, 1UL << 47);
+	EXPECT_LT((unsigned long)mmap_addresses.on_56_addr, 1UL << 56);
+#endif
+}
+
+TEST(infinite_rlimit)
+{
+// Only works on 64 bit
+#if __riscv_xlen == 64
+	struct addresses mmap_addresses;
+	struct rlimit rlim_new = { .rlim_cur = RLIM_INFINITY,
+				   .rlim_max = RLIM_INFINITY };
+
+	setrlimit(RLIMIT_STACK, &rlim_new);
+
+	do_mmaps(&mmap_addresses);
+
+	EXPECT_NE(mmap_addresses.no_hint, MAP_FAILED);
+	EXPECT_NE(mmap_addresses.on_37_addr, MAP_FAILED);
+	EXPECT_NE(mmap_addresses.on_38_addr, MAP_FAILED);
+	EXPECT_NE(mmap_addresses.on_46_addr, MAP_FAILED);
+	EXPECT_NE(mmap_addresses.on_47_addr, MAP_FAILED);
+	EXPECT_NE(mmap_addresses.on_55_addr, MAP_FAILED);
+	EXPECT_NE(mmap_addresses.on_56_addr, MAP_FAILED);
+
+	EXPECT_LT((unsigned long)mmap_addresses.no_hint, 1UL << 47);
+	EXPECT_LT((unsigned long)mmap_addresses.on_37_addr, 1UL << 38);
+	EXPECT_LT((unsigned long)mmap_addresses.on_38_addr, 1UL << 38);
+	EXPECT_LT((unsigned long)mmap_addresses.on_46_addr, 1UL << 38);
+	EXPECT_LT((unsigned long)mmap_addresses.on_47_addr, 1UL << 47);
+	EXPECT_LT((unsigned long)mmap_addresses.on_55_addr, 1UL << 47);
+	EXPECT_LT((unsigned long)mmap_addresses.on_56_addr, 1UL << 56);
+#endif
+}
+
+TEST_HARNESS_MAIN
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
