Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86490CA0FE1
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 23:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mxTE9jmZl6GGCUqDfj9ner3ODgFwInlu/VtQ7XSVxP4=; b=H7V4zUSv3u8ai0
	qij8BZGGNQ2KPHsCoyTAF7sZKfM9wO2PI3Q+vVNxzOf+sxMe+Z0uFMVgZKgpI7OCTuwbsYf460edj
	7MhTtaGxRa/TmxiQq2rUgs/Q0XC2Q7o+DdFSJW+n79bjysnUbcVyJnfLr24s5SwxgxyPT7hPiU76y
	xUdIjTqv39MglhdJu4rEmKYRUZTfQBw0lZWXWuH1hVtu4qHh5POy9h7e4gwYyiyS5KN1650z5gdAL
	4W2dHO1Hzk2E13Dbk5E1KQ435x+C7NMeNKOCzLIVgZ/4QXLzF69NXxdGDZeIyjsVbz2fS6sFiVBCB
	FAxOxsdlpz0fa1Ao6UMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upEWB-00000000ud2-0l3H;
	Thu, 21 Aug 2025 23:16:27 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up9Gj-000000005hJ-1seq
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 17:40:10 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-afcb72d51dcso171048466b.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 10:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755798007; x=1756402807; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t35JYWS631G2fD8UxKORvftL0Lp/EpL5F0Ec1OYScY0=;
        b=KHFnz3TJmRU3d68Kkg2xOAP6CYQn0rss8IRoMVaFzzx+ylS64SB/r2NZzYR1P8cD9v
         F2pJN37ofXrHOt+0UskYtKVzxUozIcdge64ZdrwMu+L/d03bDUfRgGvYQ0sKnr6OGXv7
         BKOR7yTdA4hM0Oa9pj9jpibBf9cQTFOkuz0Ad8qzqsiv77UQDt0shjL7BidIC6OTxckS
         4m4zrlppg5TQwA+bpYW4IKts8iG12T/AkwCznLJXwTfIyzkACTnTQO8CNtytRHyL55dN
         0RAzqN2nNTs15i9I2v4VnKb18U7ndiKRfqJKG6AT+Yv0pzF/GUypKX/o5bFDRjYKv6/M
         sOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755798007; x=1756402807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t35JYWS631G2fD8UxKORvftL0Lp/EpL5F0Ec1OYScY0=;
        b=hlaC+w5tncZH7w3EnUEcdRJ5MZMnGj9F/0inaS+h6IaFWV0KYkLLYRrWjEqfo1bepj
         9anFjtv1PjyBa3dF4muT0401+WSm9QftgCo4ShqWg6Yxk4jOeKpNoUmzbcJmbEECK4kj
         1q4kxqzdUKai1EXf09YqFH0uVKL/cYgsX4/3DWCu/HZjYUyOmZsCPAIEOnrxE8wnPmTF
         S0YpfUUI0hoHprHLPzHjqVa7tIZX4bhBo5n2DNqdxl6dznvq5PxOUXkHFRzMwx6FBNKg
         J1Jk0U0IxP+zgtCjBKNWIqE3d1YDwUQ5ztsh+qbn3ThlBFrinmQYVjI2UvauKIxy/F/m
         Kb9g==
X-Gm-Message-State: AOJu0YwJeO9bitm7MMhXf2qFRIPiyKqq69jyWz/JIZDE/1rhDleueb30
	gnZ13hIo3xOtHncwl0ah3liojjjoWsOUiPKpzzfUCrh0cBr3ZYhp8XNGMsqYyVIXp2I=
X-Gm-Gg: ASbGncvVyV6wHlnKfX9VV6DcRreiKiiMwyBleLQWrC0koKCvI4gofrBn8M3xA+daeYf
	VdWphLmuASbyApXlngFCFX+XnUEhFvvn9xOTUmS7Jz3CplDaOSc13FmsisDKO0pNbhAS6CwK9JL
	CkQiHg5ZGNkccL9c25agzdCFNgntA2Ps5+EEqEL5d4PtgeGmxdlmD7BhNmBs8ltupXtVigBGy9N
	WUXvCroQTCuQoM+S0jjquB36fOLTAc7qQGgEpzO1AsAQHX/dJVB2NhkhWXlu1kLzTEo75x7Q7/3
	MVEztgA2oYP/WAzG8ETSSu0+pIucyiAa9GuLXoNPuzK2V55u/xSrvUGB39x9GhJ/Q/Zr+AZ0ulT
	tbCUbOG8oxq5muCs=
X-Google-Smtp-Source: AGHT+IH595ELbW4syrWCRa0Ezghv9nt+E2W13XW9CQb5/1Ur/79kB7Ff/baL4WnCWIP49qxsQWryaA==
X-Received: by 2002:a17:907:7b85:b0:afd:ff8c:1307 with SMTP id a640c23a62f3a-afe28ec571fmr2142866b.11.1755798006963;
        Thu, 21 Aug 2025 10:40:06 -0700 (PDT)
Received: from curiosity ([80.211.22.60])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-afded4c9c12sm422705266b.82.2025.08.21.10.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 10:40:06 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Shuah Khan <shuah@kernel.org>,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH 1/2] selftests: riscv: vector: add early ptrace test
Date: Thu, 21 Aug 2025 20:39:49 +0300
Message-ID: <20250821173957.563472-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_104009_488070_CAFE0A41 
X-CRM114-Status: GOOD (  14.82  )
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

Add test that simulates early vector debug: attach to the process right
after enabling vector context and check csr_vlenb.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 .../testing/selftests/riscv/vector/.gitignore |  1 +
 tools/testing/selftests/riscv/vector/Makefile |  5 +-
 .../testing/selftests/riscv/vector/v_ptrace.c | 84 +++++++++++++++++++
 3 files changed, 89 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/riscv/vector/v_ptrace.c

diff --git a/tools/testing/selftests/riscv/vector/.gitignore b/tools/testing/selftests/riscv/vector/.gitignore
index 7d9c87cd0649..d21c03c3ee0e 100644
--- a/tools/testing/selftests/riscv/vector/.gitignore
+++ b/tools/testing/selftests/riscv/vector/.gitignore
@@ -2,3 +2,4 @@ vstate_exec_nolibc
 vstate_prctl
 v_initval
 v_exec_initval_nolibc
+v_ptrace
diff --git a/tools/testing/selftests/riscv/vector/Makefile b/tools/testing/selftests/riscv/vector/Makefile
index 6f7497f4e7b3..c14ad127e7fb 100644
--- a/tools/testing/selftests/riscv/vector/Makefile
+++ b/tools/testing/selftests/riscv/vector/Makefile
@@ -2,7 +2,7 @@
 # Copyright (C) 2021 ARM Limited
 # Originally tools/testing/arm64/abi/Makefile
 
-TEST_GEN_PROGS := v_initval vstate_prctl
+TEST_GEN_PROGS := v_initval vstate_prctl v_ptrace
 TEST_GEN_PROGS_EXTENDED := vstate_exec_nolibc v_exec_initval_nolibc
 
 include ../../lib.mk
@@ -26,3 +26,6 @@ $(OUTPUT)/v_initval: v_initval.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
 $(OUTPUT)/v_exec_initval_nolibc: v_exec_initval_nolibc.c
 	$(CC) -nostdlib -static -include ../../../../include/nolibc/nolibc.h \
 		-Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
+
+$(OUTPUT)/v_ptrace: v_ptrace.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
+	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
diff --git a/tools/testing/selftests/riscv/vector/v_ptrace.c b/tools/testing/selftests/riscv/vector/v_ptrace.c
new file mode 100644
index 000000000000..1ae1b6d44363
--- /dev/null
+++ b/tools/testing/selftests/riscv/vector/v_ptrace.c
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <sys/ptrace.h>
+#include <sys/types.h>
+#include <sys/wait.h>
+#include <sys/wait.h>
+#include <sys/uio.h>
+#include <unistd.h>
+#include <errno.h>
+
+#include <linux/ptrace.h>
+#include <linux/elf.h>
+
+#include "../../kselftest_harness.h"
+#include "v_helpers.h"
+
+volatile unsigned long data = 0;
+volatile unsigned long lock = 0;
+
+TEST(ptrace_vlenb)
+{
+	pid_t pid;
+
+	if (!is_vector_supported() && !is_xtheadvector_supported())
+		SKIP(return, "Vector not supported");
+
+	pid = fork();
+
+	ASSERT_LE(0, pid) {
+		TH_LOG("fork: %m");
+	}
+
+	if (pid == 0) {
+		while (lock == 0)
+			asm volatile("" : : "g"(lock) : "memory");
+
+		asm volatile("csrr %[data], vlenb" : [data] "=r"(data));
+		asm volatile ("ebreak" : : : );
+	} else {
+		struct __riscv_v_regset_state *regset_data;
+		size_t regset_size;
+		struct iovec iov;
+		unsigned long vlenb_csr;
+		int status;
+
+		/* attach */
+
+		ASSERT_EQ(0, ptrace(PTRACE_ATTACH, pid, NULL, NULL));
+		ASSERT_EQ(pid, waitpid(pid, &status, 0));
+		ASSERT_TRUE(WIFSTOPPED(status));
+
+		/* unlock */
+
+		ASSERT_EQ(0, ptrace(PTRACE_POKEDATA, pid, &lock, 1));
+
+		/* resume and wait ebreak */
+
+		ASSERT_EQ(0, ptrace(PTRACE_CONT, pid, NULL, NULL));
+		ASSERT_EQ(pid, waitpid(pid, &status, 0));
+		ASSERT_TRUE(WIFSTOPPED(status));
+
+		/* read tracee vlenb via ptrace peek */
+
+		errno = 0;
+		vlenb_csr = ptrace(PTRACE_PEEKDATA, pid, &data, NULL);
+		ASSERT_FALSE((errno != 0) && (vlenb_csr == -1));
+
+		/* read tracee vlenb via ptrace regs */
+
+		regset_size = sizeof(struct __riscv_v_regset_state) +
+			vlenb_csr * 8 * 32;
+		regset_data = calloc(1, regset_size);
+
+		iov.iov_base = regset_data;
+		iov.iov_len = regset_size;
+
+		ASSERT_EQ(0, ptrace(PTRACE_GETREGSET, pid, NT_RISCV_VECTOR, &iov));
+
+		/* compare */
+
+		EXPECT_EQ(vlenb_csr, regset_data->vlenb);
+	}
+}
+
+TEST_HARNESS_MAIN
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
