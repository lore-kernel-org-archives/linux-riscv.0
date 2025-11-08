Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EE2CCFA13
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Nov 2025 19:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P74iwoMYIlUWxVWcFJfIyBwIeNEITn343ifODtTib54=; b=pHWgxH1n6ccqxv
	SEPusd1AT8IZ2WYrV6yo0GkdU3MiOiqPLROCf/l0I+zsUqNJO/joZ3YsXf3Mt4xIX6oUOrihPk+sw
	B9HIzhzzzzrJaXPop6G51+L1sJCXpSQ7Q13yNIVKqJLZIjywbWl594b2GJkzUispekZnBTRyEZcHe
	vx0VnBkJVB0T6Z100ysx6w7REP9nSIG+0+L3Wccd5HorGbAEL6hMIP20xHtG0y+4hD/Dh/YyxXUlF
	g1gmT+xhA+3/9z18eUabeJgF0FtWRy7uAd931NwnjNebuNDdVcVJU3jRyLpDK821mqnLkUxfaVOeX
	R4QLDIBaPz5k5+86RWlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHopM-00000003Oqd-0Pmy;
	Sat, 08 Nov 2025 19:42:24 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHopJ-00000003Opz-1sGH
	for linux-riscv@lists.infradead.org;
	Sat, 08 Nov 2025 19:42:22 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-36295d53a10so14509531fa.0
        for <linux-riscv@lists.infradead.org>; Sat, 08 Nov 2025 11:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762630939; x=1763235739; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LHbmnK8ZAa3ArCtkCS3Paq/G1lnDqjyPBKtwjuhO/MQ=;
        b=gnpJn4iab4GnexlfONruApgAw6yfRrsGHamSg8uU+3x3kSrkX5rQ/Wlxxap0CirROB
         PtQGWNZpgj2E0fLtnmDbou0xVWK8aAprlcYz/XrIeaiLcXbKhUwMeTuduWYQenynEpzs
         xKgPifn2WkCGCBbO5ezYhFXxoZPcBaLNkYRPy1P3v9uSPYiLforK+jDTEs6noY8Fxb/n
         HY5gJgTRpFO9n5foYrdJxCXVbN55gMkECPHAM51Hc1sOMeXp76QhGuaIy2d12yiokA3k
         CI4RPSAM46yJBVSYTeiOzBd/CC3MkLBP6mIIvepJA7IUqyZgPnWM1BUUKJJETuA5I0HR
         2jHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762630939; x=1763235739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LHbmnK8ZAa3ArCtkCS3Paq/G1lnDqjyPBKtwjuhO/MQ=;
        b=ik2odd/5EwYXW7dYEuPhuqATHkUIA8T9JlDwT1F8XoEvaWhVmjgsLu5Tu/pcvtcxhu
         3RfraYC/MS919llqion5Rt4JII4Rxdds2k/xAHIqEpuVk93M8mT7nIv3eo41wOVoXmPn
         /6HqpwL99iu6IsY1Y2uRU/XAWzOO7lJS8rDmNe1zQqJktU4t5L5IozFz40aoLym+AOsn
         sh3hfqqrK9jnLql1tKu4+80MClOJdZb9bHm9EETe5MRsyB0NDIHhZ5glwcrLRcLSuNwD
         a8bal/0tLP+YpUHsgNNBbZMYCv0ZYItqpoMSTvfiZDXQyVDbh6YVVbXNjPfM36umNbXd
         xS9A==
X-Gm-Message-State: AOJu0YwN4uFuqhMHzqQyG3QnrbaHiZinlKKOw2nouH9o71XLcvwxwDdo
	d+UR3raU04gSDC2sJxRBEactrchhyb3Aj46nip8dcmI02XTTLzzBIDx1Xr4RycMuE4Q=
X-Gm-Gg: ASbGncuQNEdKJHe7KFS0UdyVZgL56kaxXjgQTz/dxXSvfdyruPg/iLSexdaSRktnL4V
	X7ISTN4IiXpj2ROhS57Pg0utQjYke19IvSY+T54xORck3l6j9mEa6kK/BHAvXhcbd57q3ukwMB8
	L8g0rVHRlpCU0AcTp9L9/AaK1HLYKg2f1XAkMuIC8CoCX03cDk7rifWk+/BeA3jceSxZXFwFY+m
	AMHCQpJPjibYFlt+Bgvs0Tn30Z4V4zGoV/OI84g10hyGw9JfMSB2YiFZu6lFh6ZQJgmDQaZgevj
	k2NStIAG+ykYnj+5lno+sd2xpAzi5MnLPn649vh/Z4J+i2h7D6shtY2dR5ix7UpFf37+zMqPwpa
	H2CMeb+8WoDE6TfEckv+CEKQ63isuxGwfwPg/sAjBWf1Z0KKqszXJ1mEOIQqwD/gieAc=
X-Google-Smtp-Source: AGHT+IF3y7EhnrI50/eOKBcDvbA1ZdP19crRLl5icMKNiFVT61otI/EZ1TlvdKRA1oAFy9eUXhK/mw==
X-Received: by 2002:a2e:8796:0:b0:37a:2dfa:c774 with SMTP id 38308e7fff4ca-37a7b1f475bmr6593681fa.31.1762630938599;
        Sat, 08 Nov 2025 11:42:18 -0800 (PST)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-37a5f0edac3sm22115421fa.38.2025.11.08.11.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 11:42:16 -0800 (PST)
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
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH v4 1/9] selftests: riscv: test ptrace vector interface
Date: Sat,  8 Nov 2025 22:41:40 +0300
Message-ID: <20251108194207.1257866-2-geomatsi@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108194207.1257866-1-geomatsi@gmail.com>
References: <20251108194207.1257866-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_114221_536129_7E650BF4 
X-CRM114-Status: GOOD (  18.70  )
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
