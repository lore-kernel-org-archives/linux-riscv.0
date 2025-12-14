Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B788FD5B16C
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Dec 2025 16:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fBM43TQ/nvzwTcrUzom/EZ5BsEKzWZGDqmUsydfVY+M=; b=oFgr0++tQmQ775
	oM6wys4SMZ7Zy95j9pfywS47WJOEb5PxlQIcESZxK+Wf6+zGA/q1dCumziw+/ForMmWgp9EhsbXyi
	gPpIFFVSXZ0SAlqvry3d1y8MLzi/M9kHBblCxGOvg6X/vDNHLcE9H/qU4DVEZeG9/02cb2pXdDDiM
	MuBJygvO44B/xO0LEYQF5goHCs7r5nBfO1seDWdcAqkIDzfd9Ffc9/WQidKw2otZ77vLFjTecrGeP
	DTapfe7+D9v+XWeefq1Oikripr4wIup5nHokQp7OtabzTLHwlEosa/ZCzEoPQkK8gLMXl8w0FQneA
	gwOFtOWNrLIPw613LaoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUp4k-00000002aHt-3pNQ;
	Sun, 14 Dec 2025 16:36:02 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUp4g-00000002aEq-05Ax
	for linux-riscv@lists.infradead.org;
	Sun, 14 Dec 2025 16:36:01 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-59583505988so3748586e87.1
        for <linux-riscv@lists.infradead.org>; Sun, 14 Dec 2025 08:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765730156; x=1766334956; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MzjkaycuriVDIslkX4nv+fXBvUrot6f7f5pS4rb9nTI=;
        b=KfX3vB1ZpUxoKt9X3RXgi5yyLrict1zzdpJMRq1m0jqNBpdW42rKydtXscBs1ZBqCh
         /agyATTqlW5BSVr1OZdwxZKwzF/5UlOfqL7NJV/Z+MMk4Gu2X7dWq/n+5dr6TsTGvPk7
         HrUK6dERi532dwk6pPab31RJGUvyQvzYsycWpJHV1O/Zq/hutyHfpUBXS3bOGIbe1Ikz
         Ggq62S5vEi7dVkGzm9j3Im/B6raAZ2JT/ktRthA3f74yoQ+Mi87pQvHTfPJtV33O8jBr
         o9iYC6F3MmtHOmHkAzvS+tKFH3suNO1DES6PTnbNyQyr9/NtssLMZhEQCVHKRILyArEW
         sPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765730156; x=1766334956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MzjkaycuriVDIslkX4nv+fXBvUrot6f7f5pS4rb9nTI=;
        b=EjvztfvNqt1WfapCdGryEPgKZ1okzCKVk89WnNnLgIFcxNP27kHlZNkSYQIgl96iE+
         EFR6bZ6xabK0XLQnw5wvuo+eK0s3YUlHp87/sGI4aDUPWTDJwclrHO+M0bTmbK/fy5wn
         J5vay6vjGeXl8cxDBYgrBSiIOBV02IOloHT8SmWiDlzX5MuL3Ix8XCJqgnfPVQV0H3lP
         IyjWT/gPc4YjmqVAWmxBZY6QcpglgitNkavMruNIC0uQMsa1Zt6UN9m3AxB0dkjp4k2Q
         KeYzVCDPMOK2T8J0YgdD45+7UB3ARADaRCH2ocwTgfqITLd9Wp+qiVPyJN1eJpmXxSTq
         r0qQ==
X-Gm-Message-State: AOJu0YwGM0GpohhYQj2/voirluUDv8k5ibJ1fpaNnaqSPKiwrdLPEGyR
	E21IEv0EOEL+rQ0C0HBTMaNcVqr+YIrXwJLJ61uyRqvcoj9KypSnv8epIVdtzB8T
X-Gm-Gg: AY/fxX4pQ7CM3LhxH/Jai6jvLNktuus6CnmkUyexBWhVPJIjupyFKN8IoA9joRkcPot
	qDU+cXIK2ZXO25ZdP/QUezKdzz7J+BmKfk7TW/PSB7/bjdbOBsjg3SG/acZ+s5ofLSUjLIWI0SC
	LJyRgCuV+Wt6TfZj6G85kBmYRJDwal0xdCOIrJtHI0dIRpb8fozsRAVptspCXW0rdGqWNuMzo4q
	Y27/mmRELf2fc4Ghk/F2mZQGAf1rxkLapcjE5S2EQ/2YYhQ/+zdfhaTVtdwxUsRXjEK7h35hPxY
	5H2Njt1FMfBGd2Ap71R4FwJDB46aFD154LFoni345/8WYCzWjpMaoferYuc91ooFFoXPzWioCvO
	OrJQgJW6xhQ5MmNf1Yy4xOaQHvdM/tGBRhR0N6ibUCDkTbNxwDxGPG4Hz/oVcxILOE3TRJPobY3
	doxg==
X-Google-Smtp-Source: AGHT+IFEo7YnyX/RrmJbiSGf+H84hqlpjB1NYRQJ0t5IGQa+lkiCRASkjTEgJgxSlpqyoasVp+264w==
X-Received: by 2002:a05:6512:3c8f:b0:596:9cf0:fb85 with SMTP id 2adb3069b0e04-598f3bb013emr3764095e87.4.1765730155530;
        Sun, 14 Dec 2025 08:35:55 -0800 (PST)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-598f7717b79sm3789618e87.60.2025.12.14.08.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 08:35:53 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Joel Granados <joel.granados@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH v5 5/9] selftests: riscv: test ptrace vector interface
Date: Sun, 14 Dec 2025 19:35:09 +0300
Message-ID: <20251214163537.1054292-6-geomatsi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251214163537.1054292-1-geomatsi@gmail.com>
References: <20251214163537.1054292-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_083559_877467_E667E94F 
X-CRM114-Status: GOOD (  19.45  )
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

Add a test case to check ptrace behavior in the case when vector
extension is supported by the system, but vector context is not
yet enabled for the traced process.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Reviewed-by: Andy Chiu <andybnac@gmail.com>
---
 .../testing/selftests/riscv/vector/.gitignore |  2 +
 tools/testing/selftests/riscv/vector/Makefile | 10 ++-
 .../selftests/riscv/vector/v_helpers.c        | 23 ++++++
 .../selftests/riscv/vector/v_helpers.h        |  2 +
 .../riscv/vector/validate_v_ptrace.c          | 80 +++++++++++++++++++
 5 files changed, 116 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/riscv/vector/validate_v_ptrace.c

diff --git a/tools/testing/selftests/riscv/vector/.gitignore b/tools/testing/selftests/riscv/vector/.gitignore
index 7d9c87cd0649..40a82baf364f 100644
--- a/tools/testing/selftests/riscv/vector/.gitignore
+++ b/tools/testing/selftests/riscv/vector/.gitignore
@@ -2,3 +2,5 @@ vstate_exec_nolibc
 vstate_prctl
 v_initval
 v_exec_initval_nolibc
+vstate_ptrace
+validate_v_ptrace
diff --git a/tools/testing/selftests/riscv/vector/Makefile b/tools/testing/selftests/riscv/vector/Makefile
index 2c2a33fc083e..326dafd739bf 100644
--- a/tools/testing/selftests/riscv/vector/Makefile
+++ b/tools/testing/selftests/riscv/vector/Makefile
@@ -2,11 +2,14 @@
 # Copyright (C) 2021 ARM Limited
 # Originally tools/testing/arm64/abi/Makefile
 
-TEST_GEN_PROGS := v_initval vstate_prctl vstate_ptrace
+TEST_GEN_PROGS := v_initval vstate_prctl vstate_ptrace validate_v_ptrace
 TEST_GEN_PROGS_EXTENDED := vstate_exec_nolibc v_exec_initval_nolibc
+TEST_GEN_LIBS := v_helpers.c sys_hwprobe.c
 
 include ../../lib.mk
 
+TEST_GEN_OBJ := $(patsubst %.c, $(OUTPUT)/%.o, $(TEST_GEN_LIBS))
+
 $(OUTPUT)/sys_hwprobe.o: ../hwprobe/sys_hwprobe.S
 	$(CC) -static -c -o$@ $(CFLAGS) $^
 
@@ -29,3 +32,8 @@ $(OUTPUT)/v_exec_initval_nolibc: v_exec_initval_nolibc.c
 
 $(OUTPUT)/vstate_ptrace: vstate_ptrace.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
 	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
+
+$(OUTPUT)/validate_v_ptrace: validate_v_ptrace.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
+	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
+
+EXTRA_CLEAN += $(TEST_GEN_OBJ)
diff --git a/tools/testing/selftests/riscv/vector/v_helpers.c b/tools/testing/selftests/riscv/vector/v_helpers.c
index 01a8799dcb78..de6da7c8d2f1 100644
--- a/tools/testing/selftests/riscv/vector/v_helpers.c
+++ b/tools/testing/selftests/riscv/vector/v_helpers.c
@@ -26,6 +26,29 @@ bool is_vector_supported(void)
 	return pair.value & RISCV_HWPROBE_EXT_ZVE32X;
 }
 
+unsigned long get_vr_len(void)
+{
+	unsigned long vlenb;
+
+	if (is_vector_supported()) {
+		asm volatile("csrr %[vlenb], vlenb" : [vlenb] "=r"(vlenb));
+		return vlenb;
+	}
+
+	if (is_xtheadvector_supported()) {
+		asm volatile (
+			// 0 | zimm[10:0] | rs1 | 1 1 1 | rd | 1010111 | vsetvli
+			// vsetvli	t4, x0, e8, m1, d1
+			".4byte		0b00000000000000000111111011010111\n\t"
+			"mv		%[vlenb], t4\n\t"
+			: [vlenb] "=r"(vlenb) : : "memory", "t4");
+		return vlenb;
+	}
+
+	printf("WARNING: vector not supported\n");
+	return 0;
+}
+
 int launch_test(char *next_program, int test_inherit, int xtheadvector)
 {
 	char *exec_argv[4], *exec_envp[1];
diff --git a/tools/testing/selftests/riscv/vector/v_helpers.h b/tools/testing/selftests/riscv/vector/v_helpers.h
index 763cddfe26da..c538077f1195 100644
--- a/tools/testing/selftests/riscv/vector/v_helpers.h
+++ b/tools/testing/selftests/riscv/vector/v_helpers.h
@@ -5,4 +5,6 @@ bool is_xtheadvector_supported(void);
 
 bool is_vector_supported(void);
 
+unsigned long get_vr_len(void);
+
 int launch_test(char *next_program, int test_inherit, int xtheadvector);
diff --git a/tools/testing/selftests/riscv/vector/validate_v_ptrace.c b/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
new file mode 100644
index 000000000000..b64986b42270
--- /dev/null
+++ b/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
@@ -0,0 +1,80 @@
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
+#include "kselftest_harness.h"
+#include "v_helpers.h"
+
+volatile unsigned long chld_lock;
+
+TEST(ptrace_v_not_enabled)
+{
+	pid_t pid;
+
+	if (!(is_vector_supported() || is_xtheadvector_supported()))
+		SKIP(return, "Vector not supported");
+
+	chld_lock = 1;
+	pid = fork();
+	ASSERT_LE(0, pid)
+		TH_LOG("fork: %m");
+
+	if (pid == 0) {
+		while (chld_lock == 1)
+			asm volatile("" : : "g"(chld_lock) : "memory");
+
+		asm volatile ("ebreak" : : : );
+	} else {
+		struct __riscv_v_regset_state *regset_data;
+		unsigned long vlenb = get_vr_len();
+		size_t regset_size;
+		struct iovec iov;
+		int status;
+		int ret;
+
+		/* attach */
+
+		ASSERT_EQ(0, ptrace(PTRACE_ATTACH, pid, NULL, NULL));
+		ASSERT_EQ(pid, waitpid(pid, &status, 0));
+		ASSERT_TRUE(WIFSTOPPED(status));
+
+		/* unlock */
+
+		ASSERT_EQ(0, ptrace(PTRACE_POKEDATA, pid, &chld_lock, 0));
+
+		/* resume and wait for ebreak */
+
+		ASSERT_EQ(0, ptrace(PTRACE_CONT, pid, NULL, NULL));
+		ASSERT_EQ(pid, waitpid(pid, &status, 0));
+		ASSERT_TRUE(WIFSTOPPED(status));
+
+		/* try to read vector registers from the tracee */
+
+		regset_size = sizeof(*regset_data) + vlenb * 32;
+		regset_data = calloc(1, regset_size);
+
+		iov.iov_base = regset_data;
+		iov.iov_len = regset_size;
+
+		/* V extension is available, but not yet enabled for the tracee */
+
+		errno = 0;
+		ret = ptrace(PTRACE_GETREGSET, pid, NT_RISCV_VECTOR, &iov);
+		ASSERT_EQ(ENODATA, errno);
+		ASSERT_EQ(-1, ret);
+
+		/* cleanup */
+
+		ASSERT_EQ(0, kill(pid, SIGKILL));
+	}
+}
+
+TEST_HARNESS_MAIN
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
