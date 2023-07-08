Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE39C001B0
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Jul 2023 01:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zz2Js0tkfnGQ4LjPy/0pjCvuNq8/ru9pXMHi1ufuvCY=; b=Kgr17+7vFKSNKE
	X0TI2oDiBY4rISjiHpk9I4gEh6yRMzXMnDAck+BWNfuSuQjaH5HJ9ZHHMQUiBVAz73Cv8VZNswGJp
	uDowc2JjPJV12jW75AG9vLI+JXXukQSEoIPIFX70/GlAGmccdW5s+yYAhR/JoqfPZmLUczLN/UkIT
	TKrQmv9kPWbVPlQPOJ/JenEYaFtF17M7ts2ZrU7f1I4vyZ5MSOtlhhU5VHVuAv9d1l5ELuHPHiDqB
	tujzfDdbr8clVRm2Pf1eYPLAIheBODSLZyCI2QdpFSeM+d0F0rhutE48F5mZSIyK6klfBqg660cM9
	5+iHuSl6UBvx0x8XakVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHwUr-006Dmk-22;
	Sat, 08 Jul 2023 01:12:25 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHwUm-006DfQ-1C
	for linux-riscv@lists.infradead.org;
	Sat, 08 Jul 2023 01:12:23 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-56344354e2cso1883832eaf.1
        for <linux-riscv@lists.infradead.org>; Fri, 07 Jul 2023 18:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688778737; x=1691370737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFZ0EGHA/E167mwLb87wWH3iE0UjDp5JHbGLXoRkRqA=;
        b=HDgqAprxKYm8kUAilt9ykmDFPdqSL5jzWa9ZQIg86N24hikrK7bFrh8lq9sOZNwcPJ
         GBQg/fc1ly4OcubeE4NEsYMV+rwcoEbtoO4YkEArdhelBYw40CmWE9tT0YBWLSZLRbZM
         gD5cyaZQ0gIgEIDaE0ITuDdSsIIq0Ee2cthIO0/netNj0Z7HlXRR6YyK2iGgI7N2H431
         +ol/lZUst/dsO+/YYsrxFeJcj0Oq2FtOA4KrjdCgQs4R+RbL1D4MdTXNhdB8Airt2xTu
         3hbyfC3E+ioskekFf0KRq4JRnYlVpHJVFc/tcZlogM0HGJuNlsfqFWcB4erEtn7CaCbA
         oRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688778737; x=1691370737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fFZ0EGHA/E167mwLb87wWH3iE0UjDp5JHbGLXoRkRqA=;
        b=gknYT/C0c8ExnqStPV7HmXDR9m446G1NXvMibd8H0Bszy6ZcqvLiWJzax6hIdhhILU
         mDGDHCTg5IaExfKjxhn+oIxKf67r7K8dIwCa2GgsVWJ2f3QgJSlg073K2z1VYmYe8k4l
         Go0Ems8oEt0ZuRdcEpS4ndtOS4Yu9Y4D7kjv49seWmfdr40q4+cCZ9/FLP6GAOmMc6cE
         2v3Y+3xWSsQz/eQUSCd1b01O8IGfI/n/uh7/B3zJyj+a3ZxH/49TbonVFhKR5GkCpYt1
         kQeMd1DArsUDEQbz3icxTBjIaws+IgDnJPE67CnUpk62u8sRKIrDTN1Ue0ABgpJZmr6V
         Aigg==
X-Gm-Message-State: ABy/qLaDS3nOo7bmIBLCKi+ASNOSNdJ3CH1a09h4YUN6zJB53RNMGtgP
	Jo/45yh53Yai6Aa149EjHR8xgRR95yzI8JjAd9w=
X-Google-Smtp-Source: APBJJlEFdNEztRYAagPRAz9QaNM7HMXGie5hZWVWxVe2fWa+vBsugeNU+m5ep6BeVbUuhpVIZAjDVw==
X-Received: by 2002:a05:6358:2905:b0:134:ec26:b53 with SMTP id y5-20020a056358290500b00134ec260b53mr8012421rwb.16.1688778736790;
        Fri, 07 Jul 2023 18:12:16 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id x24-20020a170902b41800b001b87d3e845bsm3830654plr.149.2023.07.07.18.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 18:12:16 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
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
	rdunlap@infradead.org
Subject: [PATCH v4 2/4] RISC-V: mm: Add tests for RISC-V mm
Date: Fri,  7 Jul 2023 18:11:33 -0700
Message-ID: <20230708011156.2697409-3-charlie@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230708011156.2697409-1-charlie@rivosinc.com>
References: <20230708011156.2697409-1-charlie@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_181220_439322_94921ED8 
X-CRM114-Status: GOOD (  16.88  )
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
index 9dd629cc86aa..1b79da90396e 100644
--- a/tools/testing/selftests/riscv/Makefile
+++ b/tools/testing/selftests/riscv/Makefile
@@ -5,7 +5,7 @@
 ARCH ?= $(shell uname -m 2>/dev/null || echo not)
 
 ifneq (,$(filter $(ARCH),riscv))
-RISCV_SUBTARGETS ?= hwprobe vector
+RISCV_SUBTARGETS ?= hwprobe vector mm
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
