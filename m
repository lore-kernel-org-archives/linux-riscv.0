Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F96FC531CC
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2026 22:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DRAvgtoeRxrisay9NBIoPDikgq0CXrmzM58PzOoYOg0=; b=tM31nF+QugV6YQ
	PlKoNvF4uJoF4zyZzHkFU7MfFLCb2x15CU7iIlSxjUQy2XNUpKfus1GGPhMTEa78aYQ6gVKQAb15+
	P8zp49hEBoauWyo4nNwA1miouI4HSLj4GbfrfHOPS1uVcOYwDjmgOz6WZa5rarq0hWCuVBbEiE/Mx
	UT6vl7zB22JEjDdPSjDsxVxYSg19L6vbYLLiQPPo5a0TMQWBBfsp52NBfDdE6a+7KZetLyHxpyg1e
	M31ivUj7NaoyaSV+izCF5z6uqXxPwzMXJyTwsrM913i2OCDM056QUcoSZ0tFfKxxaSNaEmAJ7zfmj
	6DeAjUF/SGnIZ1wqxIJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn1nZ-0000000FCPv-1GSM;
	Thu, 23 Jul 2026 22:21:49 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn1nW-0000000FCOu-48pi
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jul 2026 22:21:48 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-6aac8a94a2bso684693eaf.1
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jul 2026 15:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784845304; x=1785450104; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pk4XAwmL2BJHmhVYsZYXxgDptRoYP8bPdBv4gVu4WSA=;
        b=aTHALNudOk+8NvY6IDt2zEnQ2oq+dzF+16C/WpN32O1DuNgfudGVrB06DMfwPGW7d+
         /rMNdDcHVpVw4bK4suvY1m5zvzKGQ4crG3FVZwbRpGCpVKWWXoYfHKF4773qtSpPpgEB
         FY6JCrhKGeWzICcJzXDRBsXXZhjsnt77RquAQayrKsCGcjYrY7k/VYz6+D8Wm92B58f0
         xqTfLS9Om9LpBso9SAMQ7ZQEtIg5FcXMJ3XsHO1mVh62l6iCgFsso7RRzmHk3B6cgL6T
         l2LYD6ORifTVfUo17Ntp8AwDP2S8ulDKiFOHAKMmul4Rx0nKtyqP/QcE+4xc7CxgfeRx
         iZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784845304; x=1785450104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pk4XAwmL2BJHmhVYsZYXxgDptRoYP8bPdBv4gVu4WSA=;
        b=DzdlXpch59Zvx6AvVwjhMcg93h/elx5jNm3rx8wgehEhit8NZRXqbGaVEkCVC95d4T
         1t9HGwqqMITedCB6X3+9RMtIK/xEe48vQz3llAN425/s9wGJulYCUc2MLMwaFo0y47b0
         XK7OxuKtkgFa6RZY+gQRV/bzYwGPbaWU5sCU/9XCFhYCTB/t//mXjYQgGuSBuUqeOcjL
         fZFd5ijypSYhrw88MorBhX190A1huc+BdXiMw/0IUy+0bKY/BkMD68KBqLlZUfJZ1Mtw
         7qGdMRcT+Ra/JQy/Tt5Dg5CpEzOP5jcZ96FIfNvTWmXoWLaAGnnnmxDLV3XaXAWTP928
         uQ3A==
X-Forwarded-Encrypted: i=1; AHgh+RpBUbkhPNROt2F9AblTgbv/yd/sK+PX+NmQVS22bBzdlZ62qc/+B4IJs9QTS/4RHl+9d5RIuP19/kEfCA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzcDieeaxQ0AgMhoi6yya+b+Yg9Np5/oZVZ8YJUiIPNw+qh5HtG
	eU643/WEFQlqO7ZDKL4qRN4OYUv2Yz/UYEHPa8GdHaWlZD7kjf9KUaBcfvqIFdsAROU=
X-Gm-Gg: AR+sD10jf1i2RTBv9rN8+vvJhJ3SqVrtV49MjLbQtwP1+9eGARNpmWSyOYUC305XPcm
	Pn2+rjfCg6O9qAETzA3IcU6ftRv32WPU6N8matjshuXRWZfVF8jBfC5Xsn7uXAtcK1Uj9Vd4QJ4
	AdIHFf4p0VN5BS0VpUnsyhlkB/XGfj3lcPg03h1aICVMgq9Rx7hbtqQqyPbPd7UQLCXXR/dO/ch
	qCBfj0P58nxl9CeRUg+XK43GnXAG6sZw8PScyq8wlqhspekIvS31APGtWwdwcZNfFqTMaAX+VDK
	AoTJ3ZmSn3xA2BUaPSmCdGVK3iDgUQmMxsBqWa9U4QnQlLRp8zdatj4zoPz2h1pfXEtZ7JwJDK2
	Ag81ifCjlkO3hZEM/gS++tQ5hdLQASlW9WOTw/bs7fyojUJo3kOxr8jU8M6T6CsVG1lKoP3DEq8
	EfeGeZGiXhNsTbrHIbwCZYfr/bUhWoGXhUykw=
X-Received: by 2002:a05:6820:1a0b:b0:6a1:5ca0:d52d with SMTP id 006d021491bc7-6aad401d342mr2269576eaf.17.1784845304358;
        Thu, 23 Jul 2026 15:21:44 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aaddc93c54sm1316877eaf.11.2026.07.23.15.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 15:21:44 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: bergner@tenstorrent.com,
	kito.cheng@sifive.com,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	Zong Li <zong.li@sifive.com>
Subject: [PATCH 2/2]  selftests: riscv: hwprobe: test the RISCV_HWPROBE_KEY_EXT_ENABLED modifier
Date: Thu, 23 Jul 2026 17:20:57 -0500
Message-ID: <20260723222109.2229089-3-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723222109.2229089-1-tchiu@tenstorrent.com>
References: <20260723222109.2229089-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_152147_055825_1E0EDDB9 
X-CRM114-Status: GOOD (  25.96  )
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

Add a selftest for the RISCV_HWPROBE_KEY_EXT_ENABLED modifier key, which
reports the extensions that are not only present in hardware but also
enabled for the calling process.

The modifier is positional within a single hwprobe request: keys placed
before it report what is present in hardware, keys placed after it report
what is present and enabled. A single query therefore returns both views:

      [ {IMA_EXT_0}, {EXT_ENABLED}, {IMA_EXT_0} ]
          present       modifier       enabled

The test uses this to check that Vector is masked out of the enabled view
once V is disabled for the process, while remaining in the present view.

The disabled-V check depends on user space being allowed to run vector
instructions by default (/proc/sys/abi/riscv_v_default_allow == 1). The
checks that require the modifier or V in hardware are skipped when either
is unavailable.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
 .../selftests/riscv/hwprobe/.gitignore        |   2 +
 .../testing/selftests/riscv/hwprobe/Makefile  |  14 ++-
 .../selftests/riscv/hwprobe/ext-enabled.c     | 111 ++++++++++++++++++
 .../riscv/hwprobe/ext-enabled_nolibc.c        |  58 +++++++++
 4 files changed, 181 insertions(+), 4 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/hwprobe/ext-enabled.c
 create mode 100644 tools/testing/selftests/riscv/hwprobe/ext-enabled_nolibc.c

diff --git a/tools/testing/selftests/riscv/hwprobe/.gitignore b/tools/testing/selftests/riscv/hwprobe/.gitignore
index 6e384e80ea1a..ceb4bf86340c 100644
--- a/tools/testing/selftests/riscv/hwprobe/.gitignore
+++ b/tools/testing/selftests/riscv/hwprobe/.gitignore
@@ -1,3 +1,5 @@
 hwprobe
 cbo
 which-cpus
+ext-enabled
+ext-enabled_nolibc
diff --git a/tools/testing/selftests/riscv/hwprobe/Makefile b/tools/testing/selftests/riscv/hwprobe/Makefile
index 71e3f26c541b..55be82758830 100644
--- a/tools/testing/selftests/riscv/hwprobe/Makefile
+++ b/tools/testing/selftests/riscv/hwprobe/Makefile
@@ -2,9 +2,8 @@
 # Copyright (C) 2021 ARM Limited
 # Originally tools/testing/arm64/abi/Makefile
 
-CFLAGS += -I$(top_srcdir)/tools/include
-
-TEST_GEN_PROGS := hwprobe cbo which-cpus
+TEST_GEN_PROGS := hwprobe cbo which-cpus ext-enabled
+TEST_GEN_PROGS_EXTENDED := ext-enabled_nolibc
 
 include ../../lib.mk
 
@@ -12,7 +11,14 @@ $(OUTPUT)/hwprobe: hwprobe.c sys_hwprobe.S
 	$(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
 
 $(OUTPUT)/cbo: cbo.c sys_hwprobe.S
-	$(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
+	$(CC) -static -o $@ $(CFLAGS) -I$(top_srcdir)/tools/include $(LDFLAGS) $^
 
 $(OUTPUT)/which-cpus: which-cpus.c sys_hwprobe.S
 	$(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
+
+$(OUTPUT)/ext-enabled: ext-enabled.c sys_hwprobe.S
+	$(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
+
+$(OUTPUT)/ext-enabled_nolibc: ext-enabled_nolibc.c
+	$(CC) -nostdlib -static -include ../../../../include/nolibc/nolibc.h \
+		-Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
diff --git a/tools/testing/selftests/riscv/hwprobe/ext-enabled.c b/tools/testing/selftests/riscv/hwprobe/ext-enabled.c
new file mode 100644
index 000000000000..887820911629
--- /dev/null
+++ b/tools/testing/selftests/riscv/hwprobe/ext-enabled.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Test the RISCV_HWPROBE_KEY_EXT_ENABLED positional modifier.
+ *
+ * The modifier is a one-way switch within a single hwprobe request: keys
+ * before it report what is present in hardware, keys after it report what is
+ * also enabled for the calling process. A single query returns both views:
+ *
+ *	[ {IMA_EXT_0}, {EXT_ENABLED}, {IMA_EXT_0} ]
+ *	    present       modifier       enabled
+ *
+ * When V is disabled for the process it must drop out of the enabled view but
+ * stay in the present view. V cannot be turned off for a thread that already
+ * has it on (prctl returns -EPERM); the NEXT control only takes effect across
+ * execve(). So the disabled-V case runs in a forked child that sets NEXT=off
+ * and execs a nolibc worker (built without libc so no vector-optimized libc
+ * routine can SIGILL while V is off). The worker reports back via exit code.
+ */
+#include <unistd.h>
+#include <sys/prctl.h>
+#include <sys/wait.h>
+#include "hwprobe.h"
+#include "kselftest.h"
+
+#ifndef PR_RISCV_V_SET_CONTROL
+#define PR_RISCV_V_SET_CONTROL		69
+#define PR_RISCV_V_VSTATE_CTRL_OFF	1
+#endif
+#define VSTATE_CTRL_NEXT_SHIFT		2
+
+#define WORKER "./ext-enabled_nolibc"
+
+/* Verdicts returned by the worker. */
+#define VOFF_OK		0	/* present keeps V, enabled masks it */
+#define VOFF_BUG	1	/* enabled view still reported V */
+#define VOFF_SETUP	2	/* could not disable V / probe failed */
+
+/* Run the canonical present/enabled query; returns the raw syscall result. */
+static long query(__u64 *present, __u64 *enabled, __s64 *mod_key)
+{
+	struct riscv_hwprobe pairs[3] = {
+		{ .key = RISCV_HWPROBE_KEY_IMA_EXT_0, },
+		{ .key = RISCV_HWPROBE_KEY_EXT_ENABLED, },
+		{ .key = RISCV_HWPROBE_KEY_IMA_EXT_0, },
+	};
+	long ret = riscv_hwprobe(pairs, 3, 0, NULL, 0);
+
+	*present = pairs[0].value;
+	*mod_key = pairs[1].key;
+	*enabled = pairs[2].value;
+	return ret;
+}
+
+/* Fork a child that disables V across execve, and return the worker verdict. */
+static int probe_with_v_disabled(void)
+{
+	char * const argv[] = { WORKER, NULL };
+	char * const envp[] = { NULL };
+	int status;
+	pid_t pid = fork();
+
+	if (pid < 0)
+		return VOFF_SETUP;
+	if (pid == 0) {
+		/* Disable V for the next execve of this child. */
+		prctl(PR_RISCV_V_SET_CONTROL,
+		      PR_RISCV_V_VSTATE_CTRL_OFF << VSTATE_CTRL_NEXT_SHIFT);
+		execve(WORKER, argv, envp);
+		_exit(VOFF_SETUP);		/* execve failed */
+	}
+	if (waitpid(pid, &status, 0) < 0 || !WIFEXITED(status))
+		return VOFF_SETUP;
+	return WEXITSTATUS(status);
+}
+
+/*
+ * This test assumes the user space allow executing vector instruction as a
+ * default behavior. Namely, /proc/sys/abi/riscv_v_default_allow is 1
+ */
+int main(void)
+{
+	__u64 present = 0, enabled = 0;
+	__s64 mod_key = 0;
+	int verdict;
+
+	ksft_print_header();
+	ksft_set_plan(2);
+
+	if (query(&present, &enabled, &mod_key))
+		ksft_exit_fail_msg("hwprobe() failed\n");
+
+	ksft_test_result(mod_key == RISCV_HWPROBE_KEY_EXT_ENABLED,
+			 "RISCV_HWPROBE_KEY_EXT_ENABLED is recognized\n");
+
+	/* The remaining checks need both the modifier and V in hardware. */
+	if (mod_key != RISCV_HWPROBE_KEY_EXT_ENABLED ||
+	    !(enabled & RISCV_HWPROBE_IMA_V)) {
+		ksft_test_result_skip("V off: present keeps V, enabled masks it\n");
+		ksft_finished();
+	}
+
+	/* V off (only reachable across execve): enabled view masks it. */
+	verdict = probe_with_v_disabled();
+	if (verdict == VOFF_SETUP)
+		ksft_test_result_skip("V off: present keeps V, but could not disable V\n");
+	else
+		ksft_test_result(verdict == VOFF_OK,
+				 "V off: present keeps V, enabled masks it\n");
+
+	ksft_finished();
+}
diff --git a/tools/testing/selftests/riscv/hwprobe/ext-enabled_nolibc.c b/tools/testing/selftests/riscv/hwprobe/ext-enabled_nolibc.c
new file mode 100644
index 000000000000..d7f0a3c8314d
--- /dev/null
+++ b/tools/testing/selftests/riscv/hwprobe/ext-enabled_nolibc.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * nolibc worker for the RISCV_HWPROBE_KEY_EXT_ENABLED test.
+ *
+ * ext-enabled execs this program with V disabled for the process. It is built
+ * with nolibc on purpose: there is no libc here, so no vector-optimized libc
+ * routine can run and take a SIGILL while V is off. It probes the canonical
+ * [present, modifier, enabled] request and reports a verdict via exit code:
+ *
+ *	0  present keeps V, enabled masks it  (correct)
+ *	1  enabled view still reports V        (bug)
+ *	2  setup problem (V not off, or hwprobe failed)
+ */
+
+#ifndef __NR_riscv_hwprobe
+#define __NR_riscv_hwprobe		258
+#endif
+
+#ifndef PR_RISCV_V_GET_CONTROL
+#define PR_RISCV_V_GET_CONTROL		70
+#define PR_RISCV_V_VSTATE_CTRL_OFF	1
+#define PR_RISCV_V_VSTATE_CTRL_CUR_MASK	0x3
+#endif
+
+#define RISCV_HWPROBE_KEY_IMA_EXT_0	4
+#define RISCV_HWPROBE_KEY_EXT_ENABLED	17
+#define RISCV_HWPROBE_IMA_V		(1 << 2)
+
+struct riscv_hwprobe {
+	long long key;
+	unsigned long long value;
+};
+
+int main(void)
+{
+	struct riscv_hwprobe pairs[3] = {
+		{ .key = RISCV_HWPROBE_KEY_IMA_EXT_0 },
+		{ .key = RISCV_HWPROBE_KEY_EXT_ENABLED },
+		{ .key = RISCV_HWPROBE_KEY_IMA_EXT_0 },
+	};
+	long ctrl;
+
+	/* We must really be running with V turned off. */
+	ctrl = prctl(PR_RISCV_V_GET_CONTROL, 0, 0, 0, 0);
+	if (ctrl < 0 ||
+	    (ctrl & PR_RISCV_V_VSTATE_CTRL_CUR_MASK) != PR_RISCV_V_VSTATE_CTRL_OFF)
+		return 2;
+
+	if (syscall(__NR_riscv_hwprobe, pairs, 3, 0, 0, 0))
+		return 2;
+
+	/* Present view must still carry V (it is in hardware). */
+	if (!(pairs[0].value & RISCV_HWPROBE_IMA_V))
+		return 2;
+
+	/* Enabled view must have masked V out. */
+	return (pairs[2].value & RISCV_HWPROBE_IMA_V) ? 1 : 0;
+}
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
