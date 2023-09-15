Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091AAEE644C
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 10:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+y5tG4VcVGn/SM9Gr0bBoMEtXeZxMoPHkosQPGZ4fB0=; b=Gar9VSVtYkOnAO
	Rd81izSETV0CjYR5GqdpskIQhf4Sd9qXBDXLjD0h3qSfjynfyHR8dJ6Qr/O8bIKZzKzVZ5yZj7NNh
	e5iFzuEtlTdq6DCbdz15cIrMvUmuPeiXbARUPaM0qMu83u3Zwz8lTD3fMH3KBkTIkUBk74ZJFKG6E
	u3p2NLp5AWoKWv6uSAP3Up1mOolTRYpyrqEHsrKY2nNy4UUAacs0CklU83V3uEwZFJWlaEWvBI8Tr
	X0azWmqJTNvXXZHT/wRkV0y/JQzsveAYCkNzbu0CHVynfIrPy15KtSkcHZjrvKWRyJHNXA6dlgYvw
	Suh+KWlVnH8jDBhIMogA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh5db-00ALmF-0M;
	Fri, 15 Sep 2023 10:01:23 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh5dX-00ALlS-2m
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 10:01:21 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-31fe3426a61so1285473f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 03:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694772077; x=1695376877; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9YXFI+WhfAISDbsXD1xioqZrn+hF0Uu9c9p7iUiwhwc=;
        b=jxguE/GFOgOysDFk+BNeOpUXLFOjWex8uqqgIE7XZk8EGbH3iVv3GTdOtQ9ZK4tTli
         FPk44yEMDxORabnA1RogU+1vQJGX27Ymqm3WBsEI2hI/Wk7tUFfJZGomSRZRNsa/YTuq
         1Sbq9/8vvZclZl32MFj3A+KU4NEnJ9XYbYHjOSWLyox0GsjD95GecEc8Jbf3b8kg+s1b
         fqXz+4W0gvY0SZxwnZe7Tlonm67rMSV40J87Yob0PtFSLEf2TR86qQs4isv6rZ+qDlm6
         HPwIdFO5Bf/ZTGitgwhndtcIXc4BS0YKCTWkNUau+ewS3hoPo6PbfoTSRCscvoU3pgs5
         FI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694772077; x=1695376877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9YXFI+WhfAISDbsXD1xioqZrn+hF0Uu9c9p7iUiwhwc=;
        b=B7KSt6N+G9CjGhg3B1KwIsDv/vlZLOz6gHREBYSlgMy8glQf+DORecARg3dbDr/YQz
         TpVMQxq9RAR/15rSjcbMjeugrv5//zrMD4z9mpoj7zuAC3BjriXTPJc/Z2Un5Jb1igp8
         kA15QsFvCA5Cu1GthRSYrM1qzWTGj/Qxt6Yes99kYPX4Ac7ZcYarCu99thVgqMDsqS3i
         FHHcLw9RLN8/hq/q3cwSso4IFHLqjIM3RbZK6DLEpLOXoeEqlSuJrQDSHOJBPUhFOtvA
         GeNuNCuiDbmwttalgQL81SE/zvEyfJ+N1lEjWTMjrSh/X/QLrj3u7cGcPLPGiEl5pbVs
         gyUQ==
X-Gm-Message-State: AOJu0Yy7F9q2CPiKqa5MHIEAeuPu3Vjs3bey7IgVotr+UCfNxMb/uHDk
	y5rkZireyNibLK27JXwdcr7JBg==
X-Google-Smtp-Source: AGHT+IFjJ+aht9zx/gPFks21b7hJ4FuUG1vcbtzV4LI5E5IEoy/v218pa5LbKYLuHYFo6Stc9Z5KtA==
X-Received: by 2002:adf:a303:0:b0:31f:f84e:f63e with SMTP id c3-20020adfa303000000b0031ff84ef63emr540429wrb.54.1694772076646;
        Fri, 15 Sep 2023 03:01:16 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id f4-20020adfdb44000000b00317f29ad113sm4057900wrj.32.2023.09.15.03.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 03:01:15 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Charlie Jenkins <charlie@rivosinc.com>,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH -fixes] riscv: kselftests: Fix mm build by removing testcases subdirectory
Date: Fri, 15 Sep 2023 12:01:13 +0200
Message-Id: <20230915100113.13131-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_030119_899967_EBF5780B 
X-CRM114-Status: UNSURE (   9.10  )
X-CRM114-Notice: Please train this message.
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

kselftests fails to build because the mm/testcases subdirectory is not
created and then the compiler fails to output the binary there.

So fix this by simply removing this subdirectory which is not very
useful.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 tools/testing/selftests/riscv/mm/Makefile                   | 6 +++---
 .../selftests/riscv/mm/{testcases => }/mmap_bottomup.c      | 2 +-
 .../selftests/riscv/mm/{testcases => }/mmap_default.c       | 2 +-
 .../testing/selftests/riscv/mm/{testcases => }/mmap_test.h  | 0
 .../testing/selftests/riscv/mm/{testcases => }/run_mmap.sh  | 0
 5 files changed, 5 insertions(+), 5 deletions(-)
 rename tools/testing/selftests/riscv/mm/{testcases => }/mmap_bottomup.c (97%)
 rename tools/testing/selftests/riscv/mm/{testcases => }/mmap_default.c (97%)
 rename tools/testing/selftests/riscv/mm/{testcases => }/mmap_test.h (100%)
 rename tools/testing/selftests/riscv/mm/{testcases => }/run_mmap.sh (100%)

diff --git a/tools/testing/selftests/riscv/mm/Makefile b/tools/testing/selftests/riscv/mm/Makefile
index 11e0f0568923..c333263f2b27 100644
--- a/tools/testing/selftests/riscv/mm/Makefile
+++ b/tools/testing/selftests/riscv/mm/Makefile
@@ -5,11 +5,11 @@
 # Additional include paths needed by kselftest.h and local headers
 CFLAGS += -D_GNU_SOURCE -std=gnu99 -I.
 
-TEST_GEN_FILES := testcases/mmap_default testcases/mmap_bottomup
+TEST_GEN_FILES := mmap_default mmap_bottomup
 
-TEST_PROGS := testcases/run_mmap.sh
+TEST_PROGS := run_mmap.sh
 
 include ../../lib.mk
 
-$(OUTPUT)/mm: testcases/mmap_default.c testcases/mmap_bottomup.c testcases/mmap_tests.h
+$(OUTPUT)/mm: mmap_default.c mmap_bottomup.c mmap_tests.h
 	$(CC) -o$@ $(CFLAGS) $(LDFLAGS) $^
diff --git a/tools/testing/selftests/riscv/mm/testcases/mmap_bottomup.c b/tools/testing/selftests/riscv/mm/mmap_bottomup.c
similarity index 97%
rename from tools/testing/selftests/riscv/mm/testcases/mmap_bottomup.c
rename to tools/testing/selftests/riscv/mm/mmap_bottomup.c
index b29379f7e478..1757d19ca89b 100644
--- a/tools/testing/selftests/riscv/mm/testcases/mmap_bottomup.c
+++ b/tools/testing/selftests/riscv/mm/mmap_bottomup.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include <sys/mman.h>
-#include <testcases/mmap_test.h>
+#include <mmap_test.h>
 
 #include "../../kselftest_harness.h"
 
diff --git a/tools/testing/selftests/riscv/mm/testcases/mmap_default.c b/tools/testing/selftests/riscv/mm/mmap_default.c
similarity index 97%
rename from tools/testing/selftests/riscv/mm/testcases/mmap_default.c
rename to tools/testing/selftests/riscv/mm/mmap_default.c
index d1accb91b726..c63c60b9397e 100644
--- a/tools/testing/selftests/riscv/mm/testcases/mmap_default.c
+++ b/tools/testing/selftests/riscv/mm/mmap_default.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include <sys/mman.h>
-#include <testcases/mmap_test.h>
+#include <mmap_test.h>
 
 #include "../../kselftest_harness.h"
 
diff --git a/tools/testing/selftests/riscv/mm/testcases/mmap_test.h b/tools/testing/selftests/riscv/mm/mmap_test.h
similarity index 100%
rename from tools/testing/selftests/riscv/mm/testcases/mmap_test.h
rename to tools/testing/selftests/riscv/mm/mmap_test.h
diff --git a/tools/testing/selftests/riscv/mm/testcases/run_mmap.sh b/tools/testing/selftests/riscv/mm/run_mmap.sh
similarity index 100%
rename from tools/testing/selftests/riscv/mm/testcases/run_mmap.sh
rename to tools/testing/selftests/riscv/mm/run_mmap.sh
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
