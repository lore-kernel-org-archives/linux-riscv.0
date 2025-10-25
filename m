Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EB2CCF9E5
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Oct 2025 21:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P74iwoMYIlUWxVWcFJfIyBwIeNEITn343ifODtTib54=; b=TJUfNUjdl7xtpp
	pNTCiwiME2E2i0ff6nDEAUt94XIZ4BrRQKPk0x//dt/OLQ5DQ7ejtKa6hPMDwyOCrA80qGAZcsXNz
	vqFALoXRtp81Rb+qYh37ld9X138OY1YzNrmVsQV5yZ3qYAn0Yaddz5+paskgmc0GX/KoonNqAQE6j
	L97YCAKm0/sCTNxCNDYWLJHiCt17ZIn3qqjU/3dovI7UKgqcj0zFM+Ue2THXH87JCqEj75EHxdX1y
	0AsR4Bc2L9eMfLRJO9J+SzW54VU6ZXaipF0PKpUm7InJkyOnPchfSUtkQsooEK1H5DM72CoHC+Z2D
	e9yU7DZS/X36kxnBBDWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vClTl-0000000Bl6n-0hTH;
	Sat, 25 Oct 2025 21:07:13 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vClTi-0000000Bl5q-2lou
	for linux-riscv@lists.infradead.org;
	Sat, 25 Oct 2025 21:07:11 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-57e8e67aa3eso6521187e87.1
        for <linux-riscv@lists.infradead.org>; Sat, 25 Oct 2025 14:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761426428; x=1762031228; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LHbmnK8ZAa3ArCtkCS3Paq/G1lnDqjyPBKtwjuhO/MQ=;
        b=lwe+i9cvJSznRk875imWmT70Hw7U+Y2wVUD0p6BLRcorNzjVHNTWrGk44yW6rDG8ZK
         SAd2J02Gu4+em64uI+3VN3P6eAa8GBGjfPT6uvMaVYDuwWiOTR9Knvk/U8Eky7avnsPR
         NjRdVgEn/hB7Q3snCKzPcmxJz/cascAonZ9KiGxxcGG3GxQLUaeNa5mANG99op4PTrsT
         XWZIEh2TvkYSihr08lW+6NeDVJiPmdTozr2J47W/F7Jl8yjTPwn9Zv0i8XzAb8ktQ2tW
         5iFisUaBBUFIDI1utebnoJwSfeuwGSLUZZ8usvzL2I35h9CfOWk8ueTx9/aQO4lVCeTu
         nB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761426428; x=1762031228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LHbmnK8ZAa3ArCtkCS3Paq/G1lnDqjyPBKtwjuhO/MQ=;
        b=t9hszJhN0cgFkdURYgvF4N80+PKzUtbgpf8zEdU33m/s+M0uT9I6srJRE6HBod/all
         CpGB6x3Uwu8fXXhWYsQXJDjLb2HXrwTct2OCjUN9uC283XGomlfWrsMtH8ij4rtFvYEI
         Q4JInzamTP9cSIyeGjJC1r+hcJK1TgnVgt+6xYPGNA349AGJsUE8aeso+T+cqmpKzjTn
         WhnJHBF1P2vfysTq36w4AG9OR257E+J64Iw7GuVOpPMmV7a9tDHuhVayTSXUAZ8ctKCJ
         eRbbMadZp8RKNxj+Z4JFpMBvbaYkESXSpX9zQra0CHDuzfWyyNvK23QQ/+YLwEsQtFhp
         fSTA==
X-Gm-Message-State: AOJu0YwecqngjoyrbQ7Sz7Koc0CyFOrHIqnSbiVtXfH9m5QUVGml+b0M
	uIX8+E+yPk73A7NwTmONlw7rJ7+DGAAgb6AcZzqe+mqnb6MDIhvSjZkZuKMYBcyWfw8=
X-Gm-Gg: ASbGncsjtGnhEe/7zSr2JOcJpY4KpmKje3wWiPxbjnpoO8Th5HAxvoFH3DS+PRqZcuX
	gzgjehQCWcrDdC1ofPAIz1n6vfvVRXxjngKQ92/1KRAJlTAN+deKjdxvB0xCaw1br/9RQeMxVQi
	ySE/trRzNp1TC79Sw4DEFx6CigMqGsAJmNoJ92NE8P4HPbQs0k8NU57LVpcrAxYc0z1nSwZbrgV
	auVP8XOJDsZ2YQ8MraL4K6ZPjdJoMSBXisGK8x0G5N2UPApRPebZY9J+mKpD50+TdZjZA01XWJo
	TFv8DZJXIdQlvNBtNWAabGrq8+RB9aMomyKwRnymMZ82eqFB29WScLLL2z9HqMvmtNbPgV/73Bs
	OMms2mQV/7VUXA1kTJuLLShF29PgoQi+VFWG13KaVVu5KgFDqQub0TX9fnnLQKj+4t3dHlQnkxo
	XCaA==
X-Google-Smtp-Source: AGHT+IEDTnYlHsHbxYTMbvTclp6aBf8KAfq0acQrqiIvksnO+SXu5n9y6cipJAxh49NWH/q/DLQsKw==
X-Received: by 2002:a05:6512:ad0:b0:592:fab3:9b1a with SMTP id 2adb3069b0e04-592fc11e15dmr2357987e87.14.1761426427877;
        Sat, 25 Oct 2025 14:07:07 -0700 (PDT)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-59301f840dfsm953644e87.104.2025.10.25.14.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 14:07:07 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
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
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH v3 1/9] selftests: riscv: test ptrace vector interface
Date: Sun, 26 Oct 2025 00:06:34 +0300
Message-ID: <20251025210655.43099-2-geomatsi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025210655.43099-1-geomatsi@gmail.com>
References: <20251025210655.43099-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_140710_729998_3B604FB3 
X-CRM114-Status: GOOD (  18.42  )
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
 .../testing/selftests/riscv/vector/v_ptrace.c | 85 +++++++++++++++++++
 3 files changed, 90 insertions(+), 1 deletion(-)
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
index 000000000000..6a4b5a2ab4a2
--- /dev/null
+++ b/tools/testing/selftests/riscv/vector/v_ptrace.c
@@ -0,0 +1,85 @@
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
+TEST(ptrace_v_not_enabled)
+{
+	pid_t pid;
+
+	if (!is_vector_supported())
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
