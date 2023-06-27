Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA49DEB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 01:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cumMfRm2FPB1sA71Qpm1U11Ey0rnFK8899YNy8N8NYY=; b=dgL3UlyBrpge16
	WsmGBCLjq3IFutMifmnvPGIIwzaKzP2t9X7roIbeYFxq4ap/G8QgW8EIB0EtVJFSUFw25FMS4bYjJ
	tYbRgVuJOxZC/+r8mrD2Cqg2B2wnNeXbd01WbUiy4xa3jYadQ0FtPO/WZ2blWJRuXbMPPpFBiH3kZ
	RUmOC5tUHKN2bpt7XZQItsLSTIcyLxLFsApThbQ/HkK8AziTBWRoI5Svm7vvwwccfZc9w6PLtLkkx
	rLc6+4yOPAAlRrvHTLfZB8+jvO4/p+vhwhtVNpVj5eXvb0qL6iVkM+Vt/ccnX220rK/9AGdiIw9OC
	CgRWqHdGeEknwzbml0vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDxwH-00BPFP-1t;
	Tue, 27 Jun 2023 01:56:17 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDxwE-00BPEz-2x
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 01:56:16 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6687446eaccso3681690b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jun 2023 18:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1687830973; x=1690422973;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M13pNI+jfyNY1PvtRSOXuFPOaeSy8/lZRSanlskEp6c=;
        b=MZ/BmLloX2LGuYloe3ByZcKIMI//PFiCl7ruP/NhTG+gO1hPmMb6/940ZQjZwHLhIp
         A8RvfcFlfjJu5oJrsZxmXocdqel0T8qcjboWjYuvqS2NMaP3Fve0w5Tqm6tXoTTwansE
         n/12pRuR156CsaqIeb9xad5BAefxWDQA+u93+YB3mYuLOEwqj0RQcf6bgc2KoVrRdCJv
         7oEeztnC0fppdHkeiWxQMdizbUXHtRQDnXMqaufFzPN0WIwe2Tlp3ViwQQaHipRqiUbX
         sHCp2/KamZMtOH3Vu+2T29ZQLRjeEF1IAB1Sa7UzRIuef3X/hcAovEesN0HMy0fqhthW
         jbmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687830973; x=1690422973;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M13pNI+jfyNY1PvtRSOXuFPOaeSy8/lZRSanlskEp6c=;
        b=dMwga667XkfpB4JA7dDSTAEFGCyo3oVpzRLiREuviO3cqAH0xlcQllWPX+tMS45/q9
         l5MPI5/v3aPJI398g544fXbtSfgauLZzmtpV34IlkgYvTaD+OQFTBijjSnHDnSS+dQ4u
         dznukXEaiuyAzNpZxlB9hEJcQxvJirRr1FmW/+I9hWVxT0JDU2TLIjmgZMRBnE4HmjYa
         19blXy19jUyv10lzo4AmM46hDhg6kpLzL/Aa/xnuz1kGzxDxvGNgrZA4+IJBrOaScPTV
         i9My4Y7XTTvIT1p2fmCaPfY4bMGGv+ptGh6bcwfiwO2P9AX6YzVPuV/uzJ1Cr8yvkTn0
         jWew==
X-Gm-Message-State: AC+VfDxDqoJm2SP6OYYmRZ5WNIVf1oIjFz5fSF3cOJvHqjrHB6fm2TGe
	7wviU7S3X0zRieKVqvn6AHWL3r+eykKXk6hfHdVHkeaw8YdHnf8EDN8VIBZnGkEmDB1zll1FqeZ
	fZIik2DD3pBh7IPw/FNFHDaPdy+OPxANhjE5k4bfptEHD36375xJoTJpg4ernYnZ1JenJbFXiOd
	rQjw+PZM9h0jKd
X-Google-Smtp-Source: ACHHUZ4Ud6xxKhNlsxZSES1yZu0/JaF1uMBngLu+PQmN1w/XnuFX6EHQ+Sp5YJxjBjmTrjipOekQJQ==
X-Received: by 2002:a05:6a20:7d8c:b0:11f:6d3c:5418 with SMTP id v12-20020a056a207d8c00b0011f6d3c5418mr36893794pzj.22.1687830972945;
        Mon, 26 Jun 2023 18:56:12 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id iw4-20020a170903044400b001b80104446fsm2643375plb.20.2023.06.26.18.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 18:56:12 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	bjorn@rivosinc.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Shuah Khan <shuah@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [v1, 2/2] selftests: Test RISC-V Vector's first-use handler
Date: Tue, 27 Jun 2023 01:55:55 +0000
Message-Id: <20230627015556.12329-3-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230627015556.12329-1-andy.chiu@sifive.com>
References: <20230627015556.12329-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_185614_955257_5C480226 
X-CRM114-Status: GOOD (  17.54  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This add a test to check if the kernel zero-initializes all V registers
after the first-use trap handler returns.

If V registers are not zero-initialized, then the test should fail one
out of several runs:

```
 root@sifive-fpga:~# ./v_initval_nolibc
 # vl = 256
 not ok 1 detect stale values on v-regesters
 0 0 0 0 0 0 0 0   0 0 0 0 0 0 0 0
 0 4c 41 4e 47 3d 43 0   50 41 54 48 3d 2f 75 73
 72 2f 6c 6f 63 61 6c 2f   73 62 69 6e 3a 2f 75 73
 72 2f 6c 6f 63 61 6c 2f   62 69 6e 3a 2f 75 73 72
 ff ff 81 0 0 0 0 0   0 0 0 0 0 0 0 0
```

Otherwise, the test passes without errors each run.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 .../testing/selftests/riscv/vector/.gitignore |  1 +
 tools/testing/selftests/riscv/vector/Makefile |  6 +-
 .../selftests/riscv/vector/v_initval_nolibc.c | 68 +++++++++++++++++++
 3 files changed, 74 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/riscv/vector/v_initval_nolibc.c

diff --git a/tools/testing/selftests/riscv/vector/.gitignore b/tools/testing/selftests/riscv/vector/.gitignore
index 4f2b4e8a3b08..9ae7964491d5 100644
--- a/tools/testing/selftests/riscv/vector/.gitignore
+++ b/tools/testing/selftests/riscv/vector/.gitignore
@@ -1,2 +1,3 @@
 vstate_exec_nolibc
 vstate_prctl
+v_initval_nolibc
diff --git a/tools/testing/selftests/riscv/vector/Makefile b/tools/testing/selftests/riscv/vector/Makefile
index cd6e80bf995d..bfff0ff4f3be 100644
--- a/tools/testing/selftests/riscv/vector/Makefile
+++ b/tools/testing/selftests/riscv/vector/Makefile
@@ -2,7 +2,7 @@
 # Copyright (C) 2021 ARM Limited
 # Originally tools/testing/arm64/abi/Makefile
 
-TEST_GEN_PROGS := vstate_prctl
+TEST_GEN_PROGS := vstate_prctl v_initval_nolibc
 TEST_GEN_PROGS_EXTENDED := vstate_exec_nolibc
 
 include ../../lib.mk
@@ -13,3 +13,7 @@ $(OUTPUT)/vstate_prctl: vstate_prctl.c ../hwprobe/sys_hwprobe.S
 $(OUTPUT)/vstate_exec_nolibc: vstate_exec_nolibc.c
 	$(CC) -nostdlib -static -include ../../../../include/nolibc/nolibc.h \
 		-Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
+
+$(OUTPUT)/v_initval_nolibc: v_initval_nolibc.c
+	$(CC) -nostdlib -static -include ../../../../include/nolibc/nolibc.h \
+		-Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
diff --git a/tools/testing/selftests/riscv/vector/v_initval_nolibc.c b/tools/testing/selftests/riscv/vector/v_initval_nolibc.c
new file mode 100644
index 000000000000..66764edb0d52
--- /dev/null
+++ b/tools/testing/selftests/riscv/vector/v_initval_nolibc.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include "../../kselftest.h"
+#define MAX_VSIZE	(8192 * 32)
+
+void dump(char *ptr, int size)
+{
+	int i = 0;
+
+	for (i = 0; i < size; i++) {
+		if (i != 0) {
+			if (i % 16 == 0)
+				printf("\n");
+			else if (i % 8 == 0)
+				printf("  ");
+		}
+		printf("%02x ", ptr[i]);
+	}
+	printf("\n");
+}
+
+int main(void)
+{
+	int i;
+	unsigned long vl;
+	char *datap, *tmp;
+
+	datap = malloc(MAX_VSIZE);
+	if (!datap) {
+		ksft_test_result_fail("fail to allocate memory for size = %lu\n", MAX_VSIZE);
+		exit(-1);
+	}
+
+	tmp = datap;
+	asm volatile (
+		".option push\n\t"
+		".option arch, +v\n\t"
+		"vsetvli	%0, x0, e8, m8, ta, ma\n\t"
+		"vse8.v		v0, (%2)\n\t"
+		"add		%1, %2, %0\n\t"
+		"vse8.v		v8, (%1)\n\t"
+		"add		%1, %1, %0\n\t"
+		"vse8.v		v16, (%1)\n\t"
+		"add		%1, %1, %0\n\t"
+		"vse8.v		v24, (%1)\n\t"
+		".option pop\n\t"
+		: "=&r" (vl), "=r" (tmp) : "r" (datap) : "memory");
+
+	ksft_print_msg("vl = %lu\n", vl);
+
+	if (datap[0] != 0x00 && datap[0] != 0xff) {
+		ksft_test_result_fail("v-regesters are not properly initialized\n");
+		dump(datap, vl * 4);
+		exit(-1);
+	}
+
+	for (i = 1; i < vl * 4; i++) {
+		if (datap[i] != datap[0]) {
+			ksft_test_result_fail("detect stale values on v-regesters\n");
+			dump(datap, vl * 4);
+			exit(-2);
+		}
+	}
+
+	free(datap);
+	ksft_exit_pass();
+	return 0;
+}
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
