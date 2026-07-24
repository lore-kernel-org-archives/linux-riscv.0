Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1AAC531C9
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 18:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DRAvgtoeRxrisay9NBIoPDikgq0CXrmzM58PzOoYOg0=; b=HmrnWQg/gHdKt3
	vGLMjZaAixVJE3Y0EoueVUdzNZbkE03xQg56v05wophHJtuV+J2pcK5EDu0OI8GzKt2KmuzQFgz3L
	3jsU74d8IiieBsgZvWF0HFwu/M4btZmke2KVdsgXsfpTzePw22oObjw+kTXkgRenFlfYMNTC4e5VY
	EIW5Cs8XMkjHMoy24LySGl3R3pkPpsUqDMZHgRZ4izQH7becj2BZgny9jMLa6S39FpLWrbVPhqwLQ
	+xdkd1pHgL7fCL2R0gtHu3T2glyufgR/PDnL/PBvA6CSrYc/cBrcee9d1s1Vl8s41Pvx8OTg9IGgb
	hZRO6/DrivlYQrRaAWtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnKlk-0000000H4qW-3sAm;
	Fri, 24 Jul 2026 18:37:12 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnKlh-0000000H4pu-1U95
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 18:37:11 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-6aaec3ef8b2so392705eaf.2
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 11:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784918228; x=1785523028; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pk4XAwmL2BJHmhVYsZYXxgDptRoYP8bPdBv4gVu4WSA=;
        b=OWeL8szrhQvwPPLFv+xXFAvmvX0tSa47FR6mo8nCHrC9rGfbeEjmz4vYwSVU3aR4mz
         7mzdhrBs11iHj1HELXU5IbRbwCx+e8XaZFlNL4XmUq1xx58MQrcPkWdBuTgJfqQwJR3s
         d9tlEN2PHqqufFaKdAh/KrNSvp1TyNKbzxAjgn56D58y44aBS/n+CkU3EFqsu88MFX0C
         K7qLg+fqHN62E5lhl85JgPrhkd7Na94MDQ6zEO+5Tr5TmD1YzGfTruFotyZNSJEKSfQs
         VZOF5hi/aj8z/0Vm8pciASOYm9C5bvUNnnYI9Lm51rhaJWMLBhQQtqXWWEmJtum83D3J
         Wjig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784918228; x=1785523028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pk4XAwmL2BJHmhVYsZYXxgDptRoYP8bPdBv4gVu4WSA=;
        b=DJu0pPAeETM/r0pkBaQMN1rVD6wuTf/e8n1LXBEmnSfS1SuSVWbCJFbuAgaYzzLGsG
         b/DkQ5hwJ9QnHyjmHEVobFezdggU3HUZnYBWa5x8OmSjupq2FcqCziy4GamC1g+wmxgD
         bBbz/hh8NsCXVopMhP1E0WfGFxSU64jDKrOQnXni3Oii9BFKC0vkrxiCUDewytE2kYU7
         1vtoQwqp6v6EetfCFAgafMQScRdEJ9+zTriLOZXU2y7CgTEDMcwf9SVZlG2q7lyjE7f/
         +AEtbaACv7zhE3V9oO0QaRFg//gcngp4QVa3aZ63sovBSAN1+4EqotUanJSHb9HRZJ8h
         5t8w==
X-Forwarded-Encrypted: i=1; AHgh+RqP3q6M8IevN26hLEGS/2g8W+ycw9ziTWZI8menhDAwy2gs+wzRsyXVW59gLBSBpfzBhoB6btHWo9efyA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwshSjXigjFJt1NQ/5n4jHMUYsCk73K2ttxez0YRPlRuIGAAmA+
	ViQrBb5Rl0pSHnwArcC5ooVo8dG63Fg82qbtdpXQX1GsDcL8WEfk3MkY9XlJ54DRtZGD2PzmmNX
	299ROhQvxbw==
X-Gm-Gg: AR+sD10EYB+XdQfrdc3ClfW025MJx3gP6EBY00VjnWeUmUM8cKCMLOla9ABwei8q72S
	jO34FQZyh5yMyDXiB8ONHMvqbb2OWN0Ai83+k8bzKNakMap7CihLFkweIArduLejShmQSe+m6n5
	9pb5+4moFANVCVfR0gvPC142Q7UoYFYDmz7maULl3fIV1bsRLxj1d2JLr3KYNURrthv/Kd6Yxy+
	KIC+92+hiTfJjnaLXtPImAyaGzcHysBUBRIO5eT57sFtq7735FZJe+zLjWVRSzMj/bJM5TAAkhH
	bKWPKykGbQDOrxgwwIEbRvWCNe0h7mRk81pmTsQNLgWWMfcPcfnQvxngZ/ZsYmGqsYSnVbUBFA0
	RxbdezOeR1+HZKm5TvPZAOFdAqCrumZsrwTOMdwW61f2/rsvZHM9g/+VWoRVUTZzyZc5qz8RiT0
	3ZOXTG7R6poUOTkobD7ycw7MZBEV0WwR8kJp8PeW/7mpWGkw==
X-Received: by 2002:a05:6820:4c07:b0:6aa:9be1:484a with SMTP id 006d021491bc7-6aad3f72511mr5021068eaf.7.1784918228224;
        Fri, 24 Jul 2026 11:37:08 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45767488299sm8221863fac.16.2026.07.24.11.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:37:07 -0700 (PDT)
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
Subject: [PATCH v2 2/2]  selftests: riscv: hwprobe: test the RISCV_HWPROBE_KEY_EXT_ENABLED modifier
Date: Fri, 24 Jul 2026 13:36:28 -0500
Message-ID: <20260724183646.2363114-3-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724183646.2363114-1-tchiu@tenstorrent.com>
References: <20260724183646.2363114-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_113709_416310_9435E4C2 
X-CRM114-Status: GOOD (  25.92  )
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
