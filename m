Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BE9CCA476
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Oct 2025 11:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VA/CMbyX9CbHOBnOq6rAHGw9lgdBKUk00ywT35DkLR8=; b=1ckIM4o6iouzEe
	OnEKmE//kxKWMT0rXEjecIUGdLB8ePJbZLVTXgeV8L+fdpQocZRrlMVsP7C64DQ39l5iHsXdziv53
	VHBkWAQKfvVAszqH2jJFdKzNywEVq4LoekrqNfNF8099eU7rqZ2kk4epycsYFAVYfVhLBz+fqEn6m
	apOnlOwd4nkDZoEzWhaNmWUSA0f0DtoSBqnDHqTy4oY6d7EclSmhloB3lmOBRcVhtBsEWhHRjvd+b
	2/Vo37BHB+C8TzZoA6KE+NwZEJWshxe5ar+t9DJuVLUVA/RgrW3V5cI1NNo5hmBkfSVGAFE1JX9TP
	dRVW0zhiwTzonovQx36A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v66LC-00000001w08-1Wd9;
	Tue, 07 Oct 2025 11:58:50 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v66LA-00000001vzA-0TEI
	for linux-riscv@lists.infradead.org;
	Tue, 07 Oct 2025 11:58:49 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-57992ba129eso7106854e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 07 Oct 2025 04:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759838326; x=1760443126; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hkQNqMVuVavuueLTx2UspShKdK9McUVzuMp7MeB9bE=;
        b=BKq2U+53mREr9BLPp2tlgD/LBApZErleAN1H/Wfs7FjD/aUe8/6DmvqrCuellu99ri
         5wM9HbSXKOPvzupnmX7miOYUsCFGHYJ3WBrbNoLgXQrnLI5aBZgioy995yTxcyPto6R0
         TOYfJYcW0wSlpXWUITVRLCR+ddQbT3rhNHKzYHsHwqhyclxLUlPfsI8NdRlKRggMgUws
         +s6SQY31tVmpABoXtEnGa3biRVumAwNRCdkAN7w5T4G6MS4tHTozvlKz/bpH8w8BvWdX
         GNVRIqNml1IQZMPRf2poTInqZEaA1DS5mr1XF9mcLO/dqyKK+OO8fhIMaGxgbmfrZRmW
         ql1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759838326; x=1760443126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1hkQNqMVuVavuueLTx2UspShKdK9McUVzuMp7MeB9bE=;
        b=g+2OgwbeW/MefkWAETS2SKnmSr0lEqp4+BO1J6wcgLXFj/SgQobbifjFWkezSlsHBn
         aLOG2+Xp2wLVFsqFDdb9w5j9OWHleq25HNIKBaYAKwn19LIi4yIoZJyowadGsl6qKMff
         4HzvS8JaXzdwfdL1gL82y9k0p1g0u5ku4a0IXwqNXcI73LqpA1YI1o5Daq6EAY7Msirg
         6a9tpkpXepKXVLwvZR4AQIVJJQCFeWi0Jguo4IJRyQ5uW2+QuPIJeMRJbFE8rwjAY55Q
         OlSjg2V/pCeLWJMBnyXcLzySgxlVGmAHNrKB6ge2AEiSuHWjRgCOMeY3RZIayEvm5h6P
         BKPw==
X-Gm-Message-State: AOJu0YwZu1qwjItN3jvlchdAmsAyLDTnioU+Gfh4yyJp2JYAzOLuz/dy
	eX1JQ1XFK4CJk08r8DuO5L/2Nhq7o222QSK/dujz5jOLaLnpb4Hx/NejdpX30AaX
X-Gm-Gg: ASbGncset/WmW9/4dY6If+20ZCHw5GpqFhq8rlXFSBuG5DLnIIPcG83wJq18r1eV+yz
	Uu3P4PIRgtYyCyrZ4nyk3tShAZep6oD/ZZ6np2QQYQKoXH/KtxFCUM9EHgs1hjWGHBF2d1LFGvN
	DMGeibgUSK1O6FVD1xGOg4rKt5wWSKgEJgws5VXlICfDs9JBEkzrgps6qiBkQ/3J4raBaol+KTC
	phbXGzJ9zfyMf5ZM5XsoEYX95plN8OdKbOQN+VedGWrnQ9GpXwxV5hklJnoiXzefqs01fXyny4L
	xjpaEzc5z5hSxjNogzwdFRi0iHYWUM4E4O1oHOMRFe7PwU5nfYtoPl/H9n9rI1RL0c+P903O+Vg
	ZvpGBTKiMxeMW1rUSbGVdXrpUaZZ4PoU1UXRgVw==
X-Google-Smtp-Source: AGHT+IG37rD+PkxghSu66eoS6ldRFOZQ/XHIZ2H3lGBdSNiBQTjR1sXUQKZr50hfMoazfvibAaCTuQ==
X-Received: by 2002:a05:6512:3e02:b0:58a:f865:d7a0 with SMTP id 2adb3069b0e04-58cbb62b934mr5386340e87.35.1759838325227;
        Tue, 07 Oct 2025 04:58:45 -0700 (PDT)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-58b011a8941sm6043339e87.114.2025.10.07.04.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:58:44 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thomas Huth <thuth@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Nam Cao <namcao@linutronix.de>,
	Joel Granados <joel.granados@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH v2 1/6] selftests: riscv: test ptrace vector interface
Date: Tue,  7 Oct 2025 14:58:17 +0300
Message-ID: <20251007115840.2320557-2-geomatsi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007115840.2320557-1-geomatsi@gmail.com>
References: <20251007115840.2320557-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_045848_180370_9BC6AE2F 
X-CRM114-Status: GOOD (  19.23  )
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
---
 .../testing/selftests/riscv/vector/.gitignore |  1 +
 tools/testing/selftests/riscv/vector/Makefile |  5 +-
 .../testing/selftests/riscv/vector/v_ptrace.c | 87 +++++++++++++++++++
 3 files changed, 92 insertions(+), 1 deletion(-)
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
index 000000000000..6a8d56a5c4f4
--- /dev/null
+++ b/tools/testing/selftests/riscv/vector/v_ptrace.c
@@ -0,0 +1,87 @@
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
+volatile unsigned long chld_lock;
+
+TEST(ptrace_rvv_not_enabled)
+{
+	pid_t pid;
+
+	if (!is_vector_supported())
+		SKIP(return, "Vector not supported");
+
+	chld_lock = 1;
+
+	pid = fork();
+
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
+		unsigned long vlenb;
+		size_t regset_size;
+		struct iovec iov;
+		int status;
+		int ret;
+
+		asm volatile("csrr %[vlenb], vlenb" : [vlenb] "=r"(vlenb));
+
+		ASSERT_GT(vlenb, 0)
+			TH_LOG("vlenb is not valid: %lu\n", vlenb);
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
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
