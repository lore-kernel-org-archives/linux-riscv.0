Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A710CD37AC
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 03:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s6BOXQGv+4mrQ0tNs81Mv00ISXc6KA5QLBJrwnLHIxU=; b=BKWvZHlSK9UJWV
	ZusVwwnXd0kdZWrImhD3SxAnVWb4eCISBzgpv2ZIciKrNH+Ucxm0ZbtvIKZ/vpQbIM0qiA+l3tK0v
	pgjGl+D3S8nfFm2W5LLkc3GuyKuUMwm7N+7Wr5EDRnOHA67VSGcJJKegPPNXsJdREHTDMRtZix9Qv
	2h8QdCs+F41fujlNPuyA+MNzSVOZM10PAmWWnnVkYZyHR8+aXtIicFQSDrosOzQ/6AwoW2OeloZl+
	NCVezQTdbo1QhQnt3cmzTSoqnAuHMhon7+HZ3Uz5bBxfE5q2UBeafYwUB1u/Anq3mFVLzhGXP/Qt6
	bVikGmxjPJR80W8bOJVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMHKf-0000000CAqB-0rL2;
	Mon, 11 May 2026 03:29:25 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMHKb-0000000CApb-3FdO
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 03:29:23 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso3900498eec.1
        for <linux-riscv@lists.infradead.org>; Sun, 10 May 2026 20:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1778470160; x=1779074960; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/0AIvK8BCcj8XqdwEdcIT92Ta29adSchEewMFBK5y0=;
        b=I787YpjFeN0tasBt+G9SVSh0rV81ikNmhcHh+gWtFU4X47Y/ibseVYf7Qa/ODfFPHI
         4pkoIh6TGhdQg6h85MxpBzvGBd5rtmwXLUYVMNJCOOaXrjbOSxYw5Jf6rGgl1SNYTgqo
         ZDrg29reX7oeP9AMB+7219X+Ds0pWhmnggpvIxzMq4JwOwQBzKZjis7q8j53hzz4HW9k
         g4i4Sv2QceONCbrq2ci0oxoU4TeZXo6PK6Rti26EQoaLCEWilSXUtBLXVyGA+XXDN/Fz
         eingm+4OTUTup0x4BjZKkXBkSEB/caGrNumdHuqKRjkLBNe6+HZV+W9tCxPi1biF7qTb
         YrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778470160; x=1779074960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/0AIvK8BCcj8XqdwEdcIT92Ta29adSchEewMFBK5y0=;
        b=aNp4U/H28yk+Nr+IjXS9Dp7dXdiujMVc1vHZeV42rurX5aP6/by9fplGxMk5cWVKAg
         zbEi0hN2scOmA8kkbodOiCKC3onoNGS/yWmPZJaDV9/SUotU4ssfy1CaVCEcT5MtzkPy
         HcM2T9TAWmt8IKzRdKWJy6MBsrTMm+puIAY7Gshn079AhtX/QItNuEmUUMH6VSoSSiKi
         fn04J9h1xPRSF5Z5TuP/vIwuseyel3/DH7GrtB4O8CzpA8GNdTa+B+DcSckTdIcMVAl/
         6S7xWLMnIveeOyMsJoIp9wSb8jk7H9I6kOT29AUz7ZmlfJvod3K5/e5NXvyjpSywWNe7
         iKhg==
X-Forwarded-Encrypted: i=1; AFNElJ/Je6TnNfcUMAWQ3vWRG42NImXz/Q/QSbckhZ3YsFc2RD2NTl2uEsmAgxqrf4SN3TAXILgSSbRHr3DPBg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx28SWOZ0v8HksjHfdO/NCynE4pfOc7BSQJiStx+/QSGXCscqCZ
	vQoUdzUHhgdcMrn2UExQ6E+AWcOWBlgDzvQc7Lo1niluNrpvpylF9h23H3aQXVHOSjE=
X-Gm-Gg: Acq92OFAbBijauXaHuRL1onvBiieRQw3nU3oVi2PjXMlCJc3A8TCeMlWGq0YfpEWy0e
	l1NL4nxeJFmihcuBwU8bwIUIqjjQfPDtLz/2F8MxcUb0ffppBqilRjSdMXIb+92wD7B2a7ZOCnZ
	Y+aH9L9a1FQRgNPSXa7rtaexwcRqoULRQap5Tf+3PmCf8x6kkTe8o7xrzUCNuINDpojqgcfBAeP
	e/fQF/WGPBteu3hF6U5yQ0l4FdGdbLzLcbPI0dNdSkgAQw+EZcu1sNc/lA9p5/FOMdABf6fx1Mb
	9zW5Z2S+NIsLkgh48gl96s/kjvFcW/S5DaMHPONGFCxWsaSJYrA4PYqsGY3GXBRainuA2Op7JIO
	2uhlHr/Q1HrJ1VcdhQM4E/D0GbnHGyWnJRdrXdWz17uiun5DbCm6q9mHJ7HIlUsBS51a0aSio4g
	N7jb3og4AEG4+DK+TQOmu0BsoqlxW20zd9+YA=
X-Received: by 2002:a05:7301:128b:b0:2d3:f3fc:bb6b with SMTP id 5a478bee46e88-2f5482664b0mr11091502eec.1.1778470160415;
        Sun, 10 May 2026 20:29:20 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8859eafc2sm15049827eec.4.2026.05.10.20.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 20:29:19 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH] selftests/riscv: fix compiler output flag spacing in all Makefiles
Date: Sun, 10 May 2026 20:29:17 -0700
Message-ID: <20260511032917.3542802-1-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_202921_817295_9BD3D3AC 
X-CRM114-Status: UNSURE (   8.48  )
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

Standardize the compiler output flag format across all RISC-V
selftests by adding a space between '-o' and '$@'.

Although '-o$@' is perfectly valid for GCC/Clang to parse, But
changing it to '-o $@' with a space could align with the GNU
official documentation conventions, improves readability by
visually separating the flag from the target variable, and
ensures consistency with other architectures

Currently, RISC-V selftests use '-o$@' (without space) in 13
instances across 6 Makefiles, while all other architectures
consistently use '-o $@' (with space). This inconsistency makes
RISC-V an outlier in the kernel's selftest infrastructure.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 tools/testing/selftests/riscv/abi/Makefile       |  2 +-
 tools/testing/selftests/riscv/cfi/Makefile       |  2 +-
 tools/testing/selftests/riscv/hwprobe/Makefile   |  6 +++---
 tools/testing/selftests/riscv/mm/Makefile        |  2 +-
 tools/testing/selftests/riscv/sigreturn/Makefile |  2 +-
 tools/testing/selftests/riscv/vector/Makefile    | 12 ++++++------
 6 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/riscv/abi/Makefile b/tools/testing/selftests/riscv/abi/Makefile
index ed82ff9c664e..041114675ad5 100644
--- a/tools/testing/selftests/riscv/abi/Makefile
+++ b/tools/testing/selftests/riscv/abi/Makefile
@@ -7,4 +7,4 @@ TEST_GEN_PROGS := pointer_masking
 include ../../lib.mk
 
 $(OUTPUT)/pointer_masking: pointer_masking.c
-	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
+	$(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
diff --git a/tools/testing/selftests/riscv/cfi/Makefile b/tools/testing/selftests/riscv/cfi/Makefile
index 93b4738c0e2e..418b4b5325a5 100644
--- a/tools/testing/selftests/riscv/cfi/Makefile
+++ b/tools/testing/selftests/riscv/cfi/Makefile
@@ -16,7 +16,7 @@ ifeq ($(shell $(CC) $(CFLAGS) -nostdlib -xc /dev/null -o /dev/null > /dev/null 2
 TEST_GEN_PROGS := cfitests
 
 $(OUTPUT)/cfitests: cfitests.c shadowstack.c
-	$(CC) -o$@ $(CFLAGS) $(LDFLAGS) $^
+	$(CC) -o $@ $(CFLAGS) $(LDFLAGS) $^
 else
 
 $(shell echo "Toolchain doesn't support CFI, skipping CFI kselftest." >&2)
diff --git a/tools/testing/selftests/riscv/hwprobe/Makefile b/tools/testing/selftests/riscv/hwprobe/Makefile
index cec81610a5f2..71e3f26c541b 100644
--- a/tools/testing/selftests/riscv/hwprobe/Makefile
+++ b/tools/testing/selftests/riscv/hwprobe/Makefile
@@ -9,10 +9,10 @@ TEST_GEN_PROGS := hwprobe cbo which-cpus
 include ../../lib.mk
 
 $(OUTPUT)/hwprobe: hwprobe.c sys_hwprobe.S
-	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
+	$(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
 
 $(OUTPUT)/cbo: cbo.c sys_hwprobe.S
-	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
+	$(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
 
 $(OUTPUT)/which-cpus: which-cpus.c sys_hwprobe.S
-	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
+	$(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
diff --git a/tools/testing/selftests/riscv/mm/Makefile b/tools/testing/selftests/riscv/mm/Makefile
index 4664ed79e20b..24122453e3d0 100644
--- a/tools/testing/selftests/riscv/mm/Makefile
+++ b/tools/testing/selftests/riscv/mm/Makefile
@@ -12,4 +12,4 @@ TEST_PROGS := run_mmap.sh
 include ../../lib.mk
 
 $(OUTPUT)/mm: mmap_default.c mmap_bottomup.c mmap_tests.h
-	$(CC) -o$@ $(CFLAGS) $(LDFLAGS) $^
+	$(CC) -o $@ $(CFLAGS) $(LDFLAGS) $^
diff --git a/tools/testing/selftests/riscv/sigreturn/Makefile b/tools/testing/selftests/riscv/sigreturn/Makefile
index eb8bac9279a8..8c77508641f3 100644
--- a/tools/testing/selftests/riscv/sigreturn/Makefile
+++ b/tools/testing/selftests/riscv/sigreturn/Makefile
@@ -9,4 +9,4 @@ TEST_GEN_PROGS := sigreturn
 include ../../lib.mk
 
 $(OUTPUT)/sigreturn: sigreturn.c
-	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
+	$(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
diff --git a/tools/testing/selftests/riscv/vector/Makefile b/tools/testing/selftests/riscv/vector/Makefile
index 326dafd739bf..7e0017b3fb8b 100644
--- a/tools/testing/selftests/riscv/vector/Makefile
+++ b/tools/testing/selftests/riscv/vector/Makefile
@@ -11,29 +11,29 @@ include ../../lib.mk
 TEST_GEN_OBJ := $(patsubst %.c, $(OUTPUT)/%.o, $(TEST_GEN_LIBS))
 
 $(OUTPUT)/sys_hwprobe.o: ../hwprobe/sys_hwprobe.S
-	$(CC) -static -c -o$@ $(CFLAGS) $^
+	$(CC) -static -c -o $@ $(CFLAGS) $^
 
 $(OUTPUT)/v_helpers.o: v_helpers.c
-	$(CC) -static -c -o$@ $(CFLAGS) $^
+	$(CC) -static -c -o $@ $(CFLAGS) $^
 
 $(OUTPUT)/vstate_prctl: vstate_prctl.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
-	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
+	$(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
 
 $(OUTPUT)/vstate_exec_nolibc: vstate_exec_nolibc.c
 	$(CC) -nostdlib -static -include ../../../../include/nolibc/nolibc.h \
 		-Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
 
 $(OUTPUT)/v_initval: v_initval.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
-	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
+	$(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
 
 $(OUTPUT)/v_exec_initval_nolibc: v_exec_initval_nolibc.c
 	$(CC) -nostdlib -static -include ../../../../include/nolibc/nolibc.h \
 		-Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
 
 $(OUTPUT)/vstate_ptrace: vstate_ptrace.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
-	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
+	$(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
 
 $(OUTPUT)/validate_v_ptrace: validate_v_ptrace.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
-	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
+	$(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
 
 EXTRA_CLEAN += $(TEST_GEN_OBJ)
-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
