Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA410CAC5BB
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 11:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AnSE8kvOgpayYjgEWm7+QtJW3FU7F89F6yrsuQ7NE+0=; b=2K6ZyeC0aidZRx
	rLEHNBQQ87iLfW48wsIaozQWyrVFtEfHqYtXI25ptKQmtR4hdM8HC5aBt26XpCKtYrsML1vEIk7lQ
	g6Cugx5fbYt/GF7SXPFjVarEVAM/uHLVc/OXvnat+1uofb9+qqibi2mnUkwkae2IPl3lz6iIl9ocf
	yIrEl9oWvk68VRpSraFDmjHgixUt9LXz8AbBl0hDEEO4Quo6o6aG0hbOQUYjhI9qeHpdXcWoeU5JV
	gxiVfuypgeBLMVhg+ZX1PruKZKoA7Em1oXrk4DjicGefobjx+hRfoFAj0ri9Rk49/NCnQKkvReury
	kZvQNozKUIzqIJQGmGew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3unu-00000007MFK-1aBc;
	Wed, 01 Oct 2025 11:15:26 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3uns-00000007MDg-0FGV
	for linux-riscv@lists.infradead.org;
	Wed, 01 Oct 2025 11:15:25 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b608df6d2a0so359883a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 Oct 2025 04:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1759317323; x=1759922123; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nE/uK3RiLFxkAahbU4hR2pbuKpR75t2ugKvqzT3OzwM=;
        b=dGSqNriWfbvtmyNSfQR17ajsCZb4J+A/1TdVvkTrMJ8aMKwWU+KKXRuZSXKUhFB3rA
         KL6Zd6Lj05bW9C39HhjHZeNbfzNHtFkCvYEbWG1KKcjHB1IqhW8K28L0EqTgbt9SkY2I
         BiWr8rTjQylxsNRFlez7wc0Zs1usqnBb7H9+b5FuEqomMQ6K5rAFWtgXfHvWtuJC1+jD
         wr7wYlCpyuwkUzgI9k4WCHZ6QpoHc0GsWzM32+1SXSergZkjWfa029RsePDo1fWcA4Am
         Wy1E6e9yQD1hkMfmPZaGoS/z4S7SpxYwNGuZokFGm+6/jrTLlquWqITjEPrXSdETJJgD
         k/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759317323; x=1759922123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nE/uK3RiLFxkAahbU4hR2pbuKpR75t2ugKvqzT3OzwM=;
        b=Iw6M2mH6GtCltfOAkpEvfRS5koaS7RHu0ccP1PDWuAiBZcKranteM4ff4IA4VOXvuk
         UYhQhfthq8UmhLOQh6Nsyz/o8T0YnNb5D37f+qenbITk7YVQ5weSnJVSDALIrOu1MWds
         tOk1Y2fPevgZqnNCE5RjBM2TX0NsXTinkkY+yqVesh/LtbprrA7lF8tMcpaJ8zrPviR+
         w6hM6fKCnCINyAvO6vOnqyYa5GXOXJP6hP7zZ6tMv4L27Sp3Bd1XoSQBq9wGfSPhb3dc
         MfZS7dtrVPix73K9eKqO4NQqFRqkDhGwMq0rJ3/bi8IfcCRVcAzaQPKKxHjX46VRrH90
         k7/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVcbPQASXEkaaXtF+87R8BjpmElwsXhbCe5+T43TJp8tFLdGLCYPPdzUwaf502zsN5x3mje2zeI2UGftg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQNR0jv4h8P7xSAIgh4cJwNNo757NPatuU32itfycPrCUaC2ER
	QpZde+82Fmfzc+zVyzQpi18cqgZeZxo9wWfQFSvXFs7EAbM2K7FBfz6XpbqKOsrkdc0=
X-Gm-Gg: ASbGnctR8opGCh+XfD1pGnsa0sTExaNnAZXdAES8i/PuvBXCFo4HSJMDzzFDKYO+rCq
	RAIKSAEuBJWf/u2w1jy33S+zNcwtejyQrYAkiYUXhU7aYdtQWVVtVvgTv5YHjmzSKYJ2lwOyg0G
	94xgavqdI6J/4WlAdNcapjYp/nh9V8i/fR0yFFXNJxv6jzSfdoLp5Ry3wWVzumBEGvoPMlqAnGE
	V0rdqdVvoElxvuVZCfznh3mP05+/rw2q4/ugVAGzyJu6uD1YUknIHTGqCw0iTpvHF374z49K93G
	/qAVgw/74gvKZiTIcuzBQWtpJp9vOr2Z2CPBBND7TtCpsvJeZ2WeGtqMKhPmVA13U5q2y9VVITK
	VgFbsl+wr0eDJtvB5W8Yz97J/U16I07yjWZsW1mnF7OtSPGyCpBXqykt67mhtvGQEVWdSrfH01I
	EN
X-Google-Smtp-Source: AGHT+IHaQVYCBGhi6YuZz9AVv9ozF42lBeCotDfbCK65/uvxRiVeZgynF5pIWS0sP/qUcqQD0l0vdQ==
X-Received: by 2002:a17:903:2352:b0:25b:a5fc:8664 with SMTP id d9443c01a7336-28e7f442c10mr34026095ad.51.1759317323243;
        Wed, 01 Oct 2025 04:15:23 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27eeb9a8ebfsm155163455ad.67.2025.10.01.04.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 04:15:22 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	andybnac@gmail.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Charlie Jenkins <charlie@rivosinc.com>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v 2/2] selftests: riscv: Add test for the Vector ptrace interface
Date: Wed,  1 Oct 2025 19:14:27 +0800
Message-ID: <20251001111451.299163-3-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251001111451.299163-1-yongxuan.wang@sifive.com>
References: <20251001111451.299163-1-yongxuan.wang@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_041524_101100_2BEAA42F 
X-CRM114-Status: GOOD (  19.26  )
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

Add a test case that does some basic verification of the Vector ptrace
interface. This forks a child process then using ptrace to inspect and
manipulate the v31 register of the child.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 tools/testing/selftests/riscv/vector/Makefile |   5 +-
 .../selftests/riscv/vector/vstate_ptrace.c    | 132 ++++++++++++++++++
 2 files changed, 136 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/riscv/vector/vstate_ptrace.c

diff --git a/tools/testing/selftests/riscv/vector/Makefile b/tools/testing/selftests/riscv/vector/Makefile
index 6f7497f4e7b3..45f25e9dd264 100644
--- a/tools/testing/selftests/riscv/vector/Makefile
+++ b/tools/testing/selftests/riscv/vector/Makefile
@@ -2,7 +2,7 @@
 # Copyright (C) 2021 ARM Limited
 # Originally tools/testing/arm64/abi/Makefile
 
-TEST_GEN_PROGS := v_initval vstate_prctl
+TEST_GEN_PROGS := v_initval vstate_prctl vsate_ptrace
 TEST_GEN_PROGS_EXTENDED := vstate_exec_nolibc v_exec_initval_nolibc
 
 include ../../lib.mk
@@ -26,3 +26,6 @@ $(OUTPUT)/v_initval: v_initval.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
 $(OUTPUT)/v_exec_initval_nolibc: v_exec_initval_nolibc.c
 	$(CC) -nostdlib -static -include ../../../../include/nolibc/nolibc.h \
 		-Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
+
+$(OUTPUT)/vstate_ptrace: vstate_ptrace.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
+	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
diff --git a/tools/testing/selftests/riscv/vector/vstate_ptrace.c b/tools/testing/selftests/riscv/vector/vstate_ptrace.c
new file mode 100644
index 000000000000..8a7bcf318e59
--- /dev/null
+++ b/tools/testing/selftests/riscv/vector/vstate_ptrace.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <stdio.h>
+#include <stdlib.h>
+#include <asm/ptrace.h>
+#include <linux/elf.h>
+#include <sys/ptrace.h>
+#include <sys/uio.h>
+#include <sys/wait.h>
+#include "../../kselftest.h"
+#include "v_helpers.h"
+
+int parent_set_val, child_set_val;
+
+static long do_ptrace(enum __ptrace_request op, pid_t pid, long type, size_t size, void *data)
+{
+	struct iovec v_iovec = {
+		.iov_len = size,
+		.iov_base = data
+	};
+
+	return ptrace(op, pid, type, &v_iovec);
+}
+
+static int do_child(void)
+{
+	int out;
+
+	if (ptrace(PTRACE_TRACEME, -1, NULL, NULL)) {
+		ksft_perror("PTRACE_TRACEME failed\n");
+		return EXIT_FAILURE;
+	}
+
+	asm volatile (".option push\n\t"
+		".option	arch, +v\n\t"
+		"vsetivli	x0, 1, e32, m1, ta, ma\n\t"
+		"vmv.s.x	v31, %[in]\n\t"
+		"ebreak\n\t"
+		"vmv.x.s	%[out], v31\n\t"
+		".option pop\n\t"
+		: [out] "=r" (out)
+		: [in] "r" (child_set_val));
+
+	if (out != parent_set_val)
+		return EXIT_FAILURE;
+
+	return EXIT_SUCCESS;
+}
+
+static void do_parent(pid_t child)
+{
+	int status;
+	void *data = NULL;
+
+	/* Attach to the child */
+	while (waitpid(child, &status, 0)) {
+		if (WIFEXITED(status)) {
+			ksft_test_result(WEXITSTATUS(status) == 0, "SETREGSET vector\n");
+			goto out;
+		} else if (WIFSTOPPED(status) && (WSTOPSIG(status) == SIGTRAP)) {
+			size_t size, t;
+			void *data, *v31;
+			struct __riscv_v_regset_state *v_regset_hdr;
+			struct user_regs_struct *gpreg;
+
+			size = sizeof(*v_regset_hdr);
+			data = malloc(size);
+			if (!data)
+				goto out;
+			v_regset_hdr = (struct __riscv_v_regset_state *)data;
+
+			if (do_ptrace(PTRACE_GETREGSET, child, NT_RISCV_VECTOR, size, data))
+				goto out;
+
+			ksft_print_msg("vlenb %ld\n", v_regset_hdr->vlenb);
+			data = realloc(data, size + v_regset_hdr->vlenb * 32);
+			if (!data)
+				goto out;
+			v31 = (void *)(data + size + v_regset_hdr->vlenb * 31);
+			size += v_regset_hdr->vlenb * 32;
+
+			if (do_ptrace(PTRACE_GETREGSET, child, NT_RISCV_VECTOR, size, data))
+				goto out;
+
+			ksft_test_result(*(int *)v31 == child_set_val, "GETREGSET vector\n");
+
+			*(int *)v31 = parent_set_val;
+			if (do_ptrace(PTRACE_SETREGSET, child, NT_RISCV_VECTOR, size, data))
+				goto out;
+
+			/* move the pc forward */
+			size = sizeof(*gpreg);
+			data = realloc(data, size);
+			gpreg = (struct user_regs_struct *)data;
+
+			if (do_ptrace(PTRACE_GETREGSET, child, NT_PRSTATUS, size, data))
+				goto out;
+
+			gpreg->pc += 2;
+			if (do_ptrace(PTRACE_SETREGSET, child, NT_PRSTATUS, size, data))
+				goto out;
+		}
+
+		ptrace(PTRACE_CONT, child, NULL, NULL);
+	}
+
+out:
+	free(data);
+}
+
+int main(void)
+{
+	pid_t child;
+
+	ksft_set_plan(2);
+	if (!is_vector_supported() && !is_xtheadvector_supported())
+		ksft_exit_skip("Vector not supported\n");
+
+	srandom(getpid());
+	parent_set_val = rand();
+	child_set_val = rand();
+
+	child = fork();
+	if (child < 0)
+		ksft_exit_fail_msg("Fork failed %d\n", child);
+
+	if (!child)
+		return do_child();
+
+	do_parent(child);
+
+	ksft_finished();
+}
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
