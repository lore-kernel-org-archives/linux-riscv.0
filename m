Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73A3C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 16:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m/M35//Pw9XAKv32sJNT2DgvXaCd7TwxAN9OUBGwyAo=; b=B6GF9fvtNOtoA1
	2y1rMC3j56uVWupQZEbsC5oxgXtOEE0buyPPE397EB3cE4h5gi1oS4XnyZQvpwmummlmkfilSc+/+
	kb7gvfWmtaQK+uVRju/CdE3DRj9E2BmAmoWqQB3yz1bvtx4HKBquH677lKJCt1SKWoXVnkrQ5+ycm
	Rx0Eq4W/MbnlyVQ2PF59L0DyRuQBDk0dsDbHqQwopn35qRbbkzqqy5FT6v5NkPybPIALcybKQlqUQ
	tSaCKuExLhNoNzElg+HwAflwTi0zLGrfiamqfqBVCuWDpz49/2CisMT3a0bNyszc9Vtc9GO95NUbJ
	NAlMSG3/Nm6Obv+Qy34w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj1Bi-00CRHV-1j; Thu, 13 Oct 2022 16:36:02 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj1Bd-00CREe-Le
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 16:35:59 +0000
Received: by mail-pg1-x52c.google.com with SMTP id q1so1985536pgl.11
        for <linux-riscv@lists.infradead.org>; Thu, 13 Oct 2022 09:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYvvR+EGc7hRhymSGk3W1jbW4CNHmh2p5LJY2Cqdzxw=;
        b=iMu97C+sqbC4TQCePb7HDid1aK/Lg2bRXD1izjdalexjmSJq2RBgNRMiN1s8wf3n8V
         9EZ8vwqGrOPJ/2n8HXVEgGFDLi859wENBc2da2jNI+V815ErXOmnXDCbwiUHKmd+YAEN
         lIHGFoEH0X/iaCXGGAHolgRydrMC2GWhbrI7z++ConNhylACqBykuVeTvzF+h2MK1pyl
         7uGhanVVfvnV+7nhzjr5cPYnBypUPMNQqbdpqCBMlGN0VhU2ieABxS1atW1dB5AOSQX2
         8KiytoXH4tqZzLhZE6HQXW25uCAP1Ihp87LEZu8C2X03wo+gOpsJXANHzz61OtoYqljz
         +OVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eYvvR+EGc7hRhymSGk3W1jbW4CNHmh2p5LJY2Cqdzxw=;
        b=nTGtUQ9/uyg15paJrg3yUM87q4fJsHeaKX3BMvKCqUugMMrBUqivkBic8nK9ughDZI
         kMcMolqkSiuufWGRLzY4XWAH1l5PO9Ima5aztbZcRaxQi9OlM9oG2qsC9IWmQeSgL5Yc
         Wi08dpUbE+xtjMw6MlUP4g4CIZn+o4reFP5Pf+BElEpnKFS2Ngwl67I39EkkFIy0V9EA
         yQnzlPwTj8MFPgdOXLWnWyjjmClyNvGAAlPOayjjZvclflSWGztaEL7Axf13hChRPsdD
         U9w2DKD7u+c6h7lHdA2L5TEr9cBh2ozWDqck2uCu/8XnNJRF1cbIm2vOKuC5keuqSuUB
         Xbjw==
X-Gm-Message-State: ACrzQf0Aos6iri21I3sdRY3znkxwmFmaaNALpAk5R8dZ5Un4vPfXTA6C
	mdA8ZZ6Xg8If1l12q67hGGA+qLF8J9TIww==
X-Google-Smtp-Source: AMsMyM6iKX0gk4Pl9R48lk+rmCMvHP1ZLOuzJzOYs7HM7fiwCe9Pjvm7fjhjrfbYZe9du7mdU4p+vw==
X-Received: by 2002:a63:1145:0:b0:46a:e00c:579c with SMTP id 5-20020a631145000000b0046ae00c579cmr620556pgr.279.1665678954705;
        Thu, 13 Oct 2022 09:35:54 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id r19-20020a170902e3d300b0017849a2b56asm96736ple.46.2022.10.13.09.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 09:35:54 -0700 (PDT)
Subject: [PATCH v1 5/5] selftests: Test the new RISC-V hwprobe interface
Date: Thu, 13 Oct 2022 09:35:51 -0700
Message-Id: <20221013163551.6775-6-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221013163551.6775-1-palmer@rivosinc.com>
References: <20221013163551.6775-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_093557_730717_6CF6EA1E 
X-CRM114-Status: GOOD (  27.88  )
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

This adds a test for the recently added RISC-V interface for probing
hardware capabilities.  It happens to be the first selftest we have for
RISC-V, so I've added some infrastructure for those as well.  The build
stuff looks pretty straight-forward, but there's also  a tiny C library
to avoid coupling this to any userspace implementation.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
I'm not actually sure this tiny C library is a good idea, but the
toolchain I have locally doesn't have a functioning C library.
---
 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/riscv/Makefile        |  58 ++++++++++++++++++
 .../testing/selftests/riscv/hwprobe/Makefile  |  10 +++
 tools/testing/selftests/riscv/hwprobe/hwprobe | Bin 0 -> 75072 bytes
 .../testing/selftests/riscv/hwprobe/hwprobe.c |  49 +++++++++++++++
 .../selftests/riscv/hwprobe/sys_hwprobe.S     |  12 ++++
 tools/testing/selftests/riscv/libc.S          |  46 ++++++++++++++
 7 files changed, 176 insertions(+)
 create mode 100644 tools/testing/selftests/riscv/Makefile
 create mode 100644 tools/testing/selftests/riscv/hwprobe/Makefile
 create mode 100755 tools/testing/selftests/riscv/hwprobe/hwprobe
 create mode 100644 tools/testing/selftests/riscv/hwprobe/hwprobe.c
 create mode 100644 tools/testing/selftests/riscv/hwprobe/sys_hwprobe.S
 create mode 100644 tools/testing/selftests/riscv/libc.S

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 10b34bb03bc1..9ff28a629f5b 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -56,6 +56,7 @@ TARGETS += pstore
 TARGETS += ptrace
 TARGETS += openat2
 TARGETS += resctrl
+TARGETS += riscv
 TARGETS += rlimits
 TARGETS += rseq
 TARGETS += rtc
diff --git a/tools/testing/selftests/riscv/Makefile b/tools/testing/selftests/riscv/Makefile
new file mode 100644
index 000000000000..32a72902d045
--- /dev/null
+++ b/tools/testing/selftests/riscv/Makefile
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: GPL-2.0
+# Originally tools/testing/arm64/Makefile
+
+# When ARCH not overridden for crosscompiling, lookup machine
+ARCH ?= $(shell uname -m 2>/dev/null || echo not)
+
+ifneq (,$(filter $(ARCH),riscv))
+RISCV_SUBTARGETS ?= hwprobe
+else
+RISCV_SUBTARGETS :=
+endif
+
+CFLAGS := -Wall -O2 -g
+
+# A proper top_srcdir is needed by KSFT(lib.mk)
+top_srcdir = $(realpath ../../../../)
+
+# Additional include paths needed by kselftest.h and local headers
+CFLAGS += -I$(top_srcdir)/tools/testing/selftests/
+
+CFLAGS += $(KHDR_INCLUDES)
+
+export CFLAGS
+export top_srcdir
+
+all:
+	@for DIR in $(RISCV_SUBTARGETS); do				\
+		BUILD_TARGET=$(OUTPUT)/$$DIR;			\
+		mkdir -p $$BUILD_TARGET;			\
+		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$DIR $@;		\
+	done
+
+install: all
+	@for DIR in $(RISCV_SUBTARGETS); do				\
+		BUILD_TARGET=$(OUTPUT)/$$DIR;			\
+		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$DIR $@;		\
+	done
+
+run_tests: all
+	@for DIR in $(RISCV_SUBTARGETS); do				\
+		BUILD_TARGET=$(OUTPUT)/$$DIR;			\
+		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$DIR $@;		\
+	done
+
+# Avoid any output on non riscv on emit_tests
+emit_tests: all
+	@for DIR in $(RISCV_SUBTARGETS); do				\
+		BUILD_TARGET=$(OUTPUT)/$$DIR;			\
+		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$DIR $@;		\
+	done
+
+clean:
+	@for DIR in $(RISCV_SUBTARGETS); do				\
+		BUILD_TARGET=$(OUTPUT)/$$DIR;			\
+		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$DIR $@;		\
+	done
+
+.PHONY: all clean install run_tests emit_tests
diff --git a/tools/testing/selftests/riscv/hwprobe/Makefile b/tools/testing/selftests/riscv/hwprobe/Makefile
new file mode 100644
index 000000000000..614501584803
--- /dev/null
+++ b/tools/testing/selftests/riscv/hwprobe/Makefile
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (C) 2021 ARM Limited
+# Originally tools/testing/arm64/abi/Makefile
+
+TEST_GEN_PROGS := hwprobe
+
+include ../../lib.mk
+
+$(OUTPUT)/hwprobe: hwprobe.c ../libc.S sys_hwprobe.S
+	$(CC) -o$@ $(CFLAGS) $(LDFLAGS) -nostdlib $^
diff --git a/tools/testing/selftests/riscv/hwprobe/hwprobe b/tools/testing/selftests/riscv/hwprobe/hwprobe
new file mode 100755
index 0000000000000000000000000000000000000000..6c37d3be12a9880d36a9d8fe9339be9e64c15efc
GIT binary patch
literal 75072
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

literal 0
HcmV?d00001

diff --git a/tools/testing/selftests/riscv/hwprobe/hwprobe.c b/tools/testing/selftests/riscv/hwprobe/hwprobe.c
new file mode 100644
index 000000000000..c2824a806975
--- /dev/null
+++ b/tools/testing/selftests/riscv/hwprobe/hwprobe.c
@@ -0,0 +1,49 @@
+#include <asm/hwprobe.h>
+
+/*
+ * Rather than relying on having a new enough libc to define this, just do it
+ * ourselves.  This way we don't need to be coupled to a new-enough libc to
+ * contain the call.
+ */
+long riscv_hwprobe(struct riscv_hwprobe *pairs, long pair_count,
+		   long key_offset, long cpu_count, unsigned long *cpus,
+		   unsigned long flags);
+
+int main(int argc, char **argv)
+{
+	struct riscv_hwprobe pairs[8];
+	unsigned long cpus;
+	long out;
+
+	/* Fake the CPU_SET ops. */
+	cpus = -1;
+
+	/*
+	 * Just run a basic test: pass enough pairs to get up to the base
+	 * behavior, and then check to make sure it's sane.
+	 */
+	out = riscv_hwprobe(pairs, 8, 0, 1, &cpus, 0);
+	if (out != 4)
+	  return -1;
+	for (long i = 0; i < out; ++i) {
+	  if (pairs[i].key != RISCV_HWPROBE_KEY_BASE_BEHAVIOR)
+	    continue;
+
+	  if (pairs[i].val & RISCV_HWPROBE_BASE_BEHAVIOR_IMA)
+	    continue;
+
+	  return -2;
+	}
+
+	/*
+	 * Check that offsets work by providing one that we know exists, and
+	 * checking to make sure the resultig pair is what we asked for.
+	 */
+	out = riscv_hwprobe(pairs, 1, RISCV_HWPROBE_KEY_BASE_BEHAVIOR, 1, &cpus, 0);
+	if (out != 1)
+	  return -3;
+	if (pairs[0].key != RISCV_HWPROBE_KEY_BASE_BEHAVIOR)
+	  return -4;
+
+	return 0;
+}
diff --git a/tools/testing/selftests/riscv/hwprobe/sys_hwprobe.S b/tools/testing/selftests/riscv/hwprobe/sys_hwprobe.S
new file mode 100644
index 000000000000..42f93dad3a67
--- /dev/null
+++ b/tools/testing/selftests/riscv/hwprobe/sys_hwprobe.S
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (C) 2022 Rivos, Inc
+
+.text
+.global riscv_hwprobe
+riscv_hwprobe:
+	# Put __NR_riscv_hwprobe in the syscall number register, then just shim
+	# back the kernel's return.  This doesn't do any sort of errno
+	# handling, the caller can deal with it.
+	li a7, 258
+	ecall
+	ret
diff --git a/tools/testing/selftests/riscv/libc.S b/tools/testing/selftests/riscv/libc.S
new file mode 100644
index 000000000000..b548f73c596d
--- /dev/null
+++ b/tools/testing/selftests/riscv/libc.S
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (C) 2022 Rivos, Inc
+# A C library
+
+#if __riscv_xlen == 64
+# define REG_S sd
+#else
+# define REG_S sw
+#endif
+
+.text
+.global _start
+_start:
+.option push
+.option norelax
+	la gp, __global_pointer$
+.option pop
+
+	la sp, stack
+
+	la t0, heap
+	la t1, brk
+	REG_S t0, 0(t1)
+
+	li a0, 0
+	li a1, 0
+
+	call main
+	
+	li a7, 93
+	ecall
+
+1:
+	j 1b
+
+.data
+brk:
+	.long 0
+
+.global heap
+heap:
+.rep 65536
+.byte 0
+.endr
+.global stack
+stack:
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
