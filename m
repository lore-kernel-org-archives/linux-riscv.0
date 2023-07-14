Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7CFC001DE
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 16:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zz2Js0tkfnGQ4LjPy/0pjCvuNq8/ru9pXMHi1ufuvCY=; b=XvKp2OyWYgo7Z7
	z347b/AnduTjHZ3hic515kx3SxiKbj1zYNl9hg89OsNRiovwPuRZVALdTVKgfPqDSUX1mjPHTHHVi
	CRczilykSyvNS+AXy1LUe26Tieq/e6WMHQ+CaHzlmu8vJwiyRO2YM0PmM6JXqcyVYk68cMpnSy8DX
	Tq7nMg4kejFZCKG5bR4dxkbbDF/dOzIesSK56lGqzI4R2kXpEPe6f903fzDZ5dDtAqUYvzdvNCBWT
	8yPLv/fX4eKk3gHE5FLL/OdUCEO3DGgRbMLnwTjql31OGp6VQs1GbF1jWa/QjMnkpXVs83wGfwK8g
	rVrrJ+oPKmt+HxeLjiuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKM5R-006hd3-2f;
	Fri, 14 Jul 2023 16:56:09 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKM5K-006hTQ-3D
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 16:56:06 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1b89e10d356so13568555ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jul 2023 09:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689353758; x=1689958558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFZ0EGHA/E167mwLb87wWH3iE0UjDp5JHbGLXoRkRqA=;
        b=zn1whIzFksbFhXTqO34vKblrmsHff/17GQr3bYOcezH28cQyvPFNhQUxXa2sAPmMS1
         1WI0ByZzMGBTJbHi/dO8HxLEz8TgAL8vMPlN/S9Zlsd9+L0JcfDsc/ikDWbR3lPJjq17
         adM7DlbZeACS2bGGGK5LbhAjLUMSTXTi7aBNuf6MnFpcIurtWpRgYjYi7jf1WGpkUtp2
         zscz6fUP32Fhq928O1gU6GgR6VfLSBJ1gX7eP4OWmx7it+jF6Ll0l5TqyoxCdBmQtFi1
         C+Hb6hQIy3kY2fVb4xvTy0IgnX2o2sglJ+bfpV+gz1AiXbrLwVBWPm4t4lez/7lvKMfS
         EcJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689353758; x=1689958558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fFZ0EGHA/E167mwLb87wWH3iE0UjDp5JHbGLXoRkRqA=;
        b=hToEaK18wabpEU7dtsXrHW7299iYacSR4xe4H/1Qn4ikBYlIn0FP3XgNwo4sxSFaNo
         Q2y/0N84tsRCZq7QmzZbiLOhpO3SkKWu2Mn304VWWpVH6npbcfoA66VELmBIkbXWtJMY
         4Ys8B4EImDPQWRHF8P0eJKsAvYAgjDNj2C1YsFQdIEjqqP93nol65qy19h6z7SUVRh+s
         5QEnt7zHEIjyUwxkJ2oqQ3zi/Id0m1oxFvwOqB2tcri/qHIzNyegxfgRpmsGHhdVNL/I
         WteCbpJAO2TTFmeQ+tG1UV+5aErC7aJ02mzdxKRmmPyzZKQAzo16wqp7qD18rLrrT6o/
         rvwA==
X-Gm-Message-State: ABy/qLZHmpy8OegVvHyiCiePMvGb/2rdQyP4jd0Afmmb2G0hg75IY1vQ
	fDuPZKMuHmKjtKJA/1zusMQ2roBSYDb8oxXjA14=
X-Google-Smtp-Source: APBJJlHqhS0uCuOyMfhOId30Fk2bIt7sCu1bJXWOcbA6EcvHwaFt3gMEbaHPbnOB7iiOK1Fg3tgsWA==
X-Received: by 2002:a17:902:bd94:b0:1b8:1e05:ed09 with SMTP id q20-20020a170902bd9400b001b81e05ed09mr3727099pls.36.1689353758143;
        Fri, 14 Jul 2023 09:55:58 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id s8-20020a170902b18800b001b694140d96sm8008081plr.170.2023.07.14.09.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 09:55:57 -0700 (PDT)
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
	rdunlap@infradead.org,
	alexghiti@rivosinc.com
Subject: [PATCH v6 2/4] RISC-V: mm: Add tests for RISC-V mm
Date: Fri, 14 Jul 2023 09:54:50 -0700
Message-ID: <20230714165508.94561-3-charlie@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714165508.94561-1-charlie@rivosinc.com>
References: <20230714165508.94561-1-charlie@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_095603_059332_A80EFF5A 
X-CRM114-Status: GOOD (  16.57  )
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
