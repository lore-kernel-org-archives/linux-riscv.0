Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D7BCCD183
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 09:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P4yM6CUG5vjBQhGBIvlDZl3RKziz4a6m8tp3FOWJ4Sg=; b=X37Pat/rnrm14Q
	IkbRdXrv/YAqUzgZ3kNc8/wUsWtZxWUtE/tclKSYTBZIRtqOO4dG/WsRWCoWGwEiQrahRX2IuB0GD
	hBqu7jCj2uT1NFKviUJ1qlsxxebMJGZ/7pqgxhNPCa55xaDupDHq7X9IXdqh8TMBIa7n2sikbvUGi
	k+MTgfracDUYUh6qy0xQmPKJvSXf19IDxjd+Hvq2BGWJ8ADXURK1At4rTor4SFg9Jw9zIDoKRKTe9
	VMRqswz4Xtj8biCda+pZPkYaN2RTjLTksunbESw0xXWBQi4mEws/Ys12utDJ+egpslT7suSbXpRmq
	UzOzS7BYi8RO7zANvA1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Ech-0000000ChPY-20Bx;
	Mon, 13 Oct 2025 09:13:43 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Ece-0000000ChOV-3ODK
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 09:13:41 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-339d7c4039aso3609178a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 02:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1760346820; x=1760951620; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QFj9xLi3LnEMGw6G3Wf4UB2AVyo9o54zpzf1a0v6M+U=;
        b=mKnbp+Frsr2RCVgdPoxha+5nQbsi/Dhoiy/8Ji3VLGyMmpJllzjmOpBd1Iotj2A8BO
         DCcqdkawIn6PQcsOJhKLNdi6Y503WfMZKHM8zLo4sG6+7y9mHhXoZ1eR4vU+SBFcEOLt
         P3PigxAHxNou1e7tqU8Jh+JlIw/yk9KPuUGbcXT3pJyVQYq01CQbE9mEj1zCqvYbYudk
         JUjHUA1WnWaXWCkGAihbghVo1WUdfp+axTyO5rD+k0hL1A9s4jgaxmbM3PGEYYflHKQ+
         wxDTN7wmZv3NVgB6v4CGuNoi9X7ieiu5GANqNOo1ttywhGTaDNfEgbzMpw1TWvi7UiRI
         LFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760346820; x=1760951620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QFj9xLi3LnEMGw6G3Wf4UB2AVyo9o54zpzf1a0v6M+U=;
        b=ILriOn1PWLi7WHXuAFYq9NaN98p21rXBTcHtGQhm1mnpys50QW2FAXgp55Y6tLAVYw
         nBYha3DjyA6J477Jue5wp7uHPXOoeGsezw9C1rwvyNGpGQ9vV5ujh9YTdRITsgCmdrS6
         N8VBZtFmMlp835gx6lAKp47+MU5YiEIrg8jK7Hm6B//Z/gbdHPMxsRYZOtj4mKraL930
         SaL3EtrmE2HzZ/rw7oITHY9xra3U/OBErf+AgzOKLdnqpw03zi/SiYoJ7sBznKDoNWWz
         pCoI7X9pYFjMqXZhOEUIY9PPAYGBRdIbRDwOjzb0ct0yZUzAqvWNL6ZoD1SH1sw7KJ/H
         JwFA==
X-Forwarded-Encrypted: i=1; AJvYcCVGy0hx+5Apxm+NQiCJB5Ff3SAVJxELkhq0/RkD9YMY2g/pP+m3v3Z/jZuL+VSXQ3neXKIzFsadk2dPmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxnn+JSWYaqyGRLcTOUKI/1lTSZKV7kohwFnJbuANc9YDBYVTXK
	UmFSDzOQkhKFgsIuKzc6k5uG05b+r9WBId9wYZM80ZP6TWfBUthPtYozVI72h8zV43s=
X-Gm-Gg: ASbGncssAlcFmYMsW3DfAcaEjbWuui81j5CGun/lHWA0pTEtbtt4k7ETm1ykYh7cEaE
	KuKWaSkIdP6Ov1ZZeLkmN0H9oR/o3PYE9hduJ6ebZ4WtNxx3bo+BhBCWTBu/6rmFMxg/HUfvuJ+
	Y2psdHHZG6OfgJfLiqMKPPgpkaxx1gULkOt2QicXyitx/ZX8EPpkzLk891d876wkK9cEbfTii8i
	vrknXQBjJU8vqD86mLI2ps83oi8R9tkWn/yfSpDzIqOMSfs/KheZaSDUwH0eSm/Tn5A+gyjP4Fh
	oMhmooMXkoIkKHSXlt8Zi+7NAVKm0ewNFu+frm4OMFzEPLqcqAI6PCUKLoPEFAGyy22smkCR/2n
	aZHYeDM6qMzRUxoMYOXzyL0ftqNQhCEhmxECxKIJ/fFQZXzvy40MRT7CoVGHLKZZnguC9ESRjj7
	EZ+x45mQ==
X-Google-Smtp-Source: AGHT+IGGBerV5gmEz5nYLELIKBvPRrxwSj1xMSUUrx0dWROhh+mbZDQA2qGI9XfUfIzxPBi0TqZxcA==
X-Received: by 2002:a17:90b:3843:b0:334:18f9:8008 with SMTP id 98e67ed59e1d1-33b511174e6mr29432495a91.8.1760346820010;
        Mon, 13 Oct 2025 02:13:40 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61a3cc0dsm11727220a91.9.2025.10.13.02.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 02:13:39 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	andybnac@gmail.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v2 2/2] selftests: riscv: Add test for the Vector ptrace interface
Date: Mon, 13 Oct 2025 17:12:32 +0800
Message-ID: <20251013091318.467864-3-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251013091318.467864-1-yongxuan.wang@sifive.com>
References: <20251013091318.467864-1-yongxuan.wang@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_021340_852422_37AA7316 
X-CRM114-Status: GOOD (  18.56  )
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
Reviewed-by: Andy Chiu <andybnac@gmail.com>
---
 tools/testing/selftests/riscv/vector/Makefile |   5 +-
 .../selftests/riscv/vector/vstate_ptrace.c    | 134 ++++++++++++++++++
 2 files changed, 138 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/riscv/vector/vstate_ptrace.c

diff --git a/tools/testing/selftests/riscv/vector/Makefile b/tools/testing/selftests/riscv/vector/Makefile
index 6f7497f4e7b3..2c2a33fc083e 100644
--- a/tools/testing/selftests/riscv/vector/Makefile
+++ b/tools/testing/selftests/riscv/vector/Makefile
@@ -2,7 +2,7 @@
 # Copyright (C) 2021 ARM Limited
 # Originally tools/testing/arm64/abi/Makefile
 
-TEST_GEN_PROGS := v_initval vstate_prctl
+TEST_GEN_PROGS := v_initval vstate_prctl vstate_ptrace
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
index 000000000000..1479abc0c9cb
--- /dev/null
+++ b/tools/testing/selftests/riscv/vector/vstate_ptrace.c
@@ -0,0 +1,134 @@
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
+		".option	norvc\n\t"
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
+			size_t size;
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
+			v_regset_hdr = (struct __riscv_v_regset_state *)data;
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
+			gpreg->pc += 4;
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
