Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1761EC761A6
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 16:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G+zNLXHc/KQpqqlSOJHmiUr1MzxgzZ5LPAB3H2WpTZM=; b=ThLaE/wumFUmN+
	ki7yG2WXccrKUh0IUEtDuRwe8Hm2A1QCwXsxjRxizgJGAaNcCTSQdw7N956GSkcpi5R/BjhuRpCKM
	Es/ioS8YxmevrgSNEDfrW3j02h9C9q0TB30+JjAuCmwjf0sOfNx7gEaEhFkY7dF8cXvzqYRJeRFKp
	3pRoVCgjA8v68D619NSkLazYP6zOIaJZRHRSHfnb2tj1p72O4UEfq0ALx0KvWqAKhg8nothEz/Sz3
	XtLMzRWOOB/ODpVLsJjcoLLCQufvozjZBl71ikmn/y831gAnJSey2yoBGNGmJ0k4y967PNf+vjeKH
	UDSL+6TZFvT0ZaybyL6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgplt-00BiZt-0N;
	Mon, 27 Mar 2023 16:32:37 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgplp-00BiYH-2R
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 16:32:35 +0000
Received: by mail-pl1-x631.google.com with SMTP id f22so4837831plr.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 09:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1679934753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DJuimmJGryaqmVk2gRhZESX91XeD6Hiy7uW8n6je1Y=;
        b=3WeYyW7NcHrhkdD4pjOnzXCUfZGee9+dobPfCYR6y93VtuZFjGUmJFNaGV7vthkeLQ
         4ZfUch7yfAHdjkiJxzvdR8hHsHKUMRfU1aMgH7YiwXkZN6/w7aAMGskkx8//mF/WGmYH
         n0M+ESg+VKV3zBrY0rNN2/egCn71gqJSiDzHECZ5yi3VQ1qCnnANV4YlzUuDH7iHvaBH
         rNqc9pXS6/yTCL7urS58K32O0U8+fRlXiQrLGCFCUe92cnSHifWzKqVXxbIlUk34BgDZ
         JPQA3pGIshX0SuPN9Yh708PHDPRFCsSAdi6ocBLuna9a351rJyw6BT9fYrUocbAzrhsS
         J2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679934753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8DJuimmJGryaqmVk2gRhZESX91XeD6Hiy7uW8n6je1Y=;
        b=68O8aXaANpJGaiOHlM5OPZW8yfv0pxCkLxVzyRpajz0vWBXDe8bSOk219A4uzOaE5z
         AAKE940OXBRzBPPq6DFS5fHBbj3GiwTbj2wPtncdS2ia34C2UarZanSHNyqJSBy4is5m
         l5QVCFSjdlx7RbcDNFNPbbpBZ26BKblz6RobEc1WfnHEF+thkOWKJU7MMCYONB5Pyr5W
         1VETzxuEGHJtXQkUGLtbcIFghwFdFZr3BQsU4QK/Bqoaop/GafP0eL+nQzst7urDLNDB
         eCTszXb/R+2QzXPhzLTl7fB9NXXmvg9hByvVNOCmdVcD+mF1w4KuxdVHs9buhlhVxtAb
         spgA==
X-Gm-Message-State: AAQBX9cUpQqhnUK/YSGueDvh+LXKqcxE+PLO4FIjgngeoPyDAnARkRX+
	huLY1oQqStfUJzXo8g7KVA5cJg==
X-Google-Smtp-Source: AKy350Zgyvu4q5ze9frvypjtqGTdlLR13RXUBkmzAhNBOJmfeFSQcGZJxMijDyBsBk70sd9HA6AynQ==
X-Received: by 2002:a17:90b:38cf:b0:23d:3878:781e with SMTP id nn15-20020a17090b38cf00b0023d3878781emr11536608pjb.21.1679934753235;
        Mon, 27 Mar 2023 09:32:33 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id io20-20020a17090312d400b001a1faeac240sm8963524plb.186.2023.03.27.09.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 09:32:32 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: slewis@rivosinc.com,
	vineetg@rivosinc.com,
	heiko@sntech.de,
	Conor Dooley <conor@kernel.org>,
	Evan Green <evan@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 5/6] selftests: Test the new RISC-V hwprobe interface
Date: Mon, 27 Mar 2023 09:32:02 -0700
Message-Id: <20230327163203.2918455-6-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230327163203.2918455-1-evan@rivosinc.com>
References: <20230327163203.2918455-1-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_093233_793302_F67C568C 
X-CRM114-Status: GOOD (  27.64  )
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
RISC-V, so I've added some infrastructure for those as well.

Co-developed-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Evan Green <evan@rivosinc.com>

---

(no changes since v4)

Changes in v4:
 - Fixed selftests commit description, no more tiny libc (Mark Brown)
 - Fixed selftest syscall prototype types to match v4.

Changes in v2:
 - Updated the selftests to the new API and added some more.
 - Fixed indentation, comments in .S, and general checkpatch complaints.


---
 tools/testing/selftests/Makefile              |  1 +
 tools/testing/selftests/riscv/Makefile        | 58 ++++++++++++
 .../testing/selftests/riscv/hwprobe/Makefile  | 10 +++
 .../testing/selftests/riscv/hwprobe/hwprobe.c | 90 +++++++++++++++++++
 .../selftests/riscv/hwprobe/sys_hwprobe.S     | 12 +++
 5 files changed, 171 insertions(+)
 create mode 100644 tools/testing/selftests/riscv/Makefile
 create mode 100644 tools/testing/selftests/riscv/hwprobe/Makefile
 create mode 100644 tools/testing/selftests/riscv/hwprobe/hwprobe.c
 create mode 100644 tools/testing/selftests/riscv/hwprobe/sys_hwprobe.S

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 13a6837a0c6b..4bea26109450 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -63,6 +63,7 @@ TARGETS += pstore
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
index 000000000000..ebdbb3c22e54
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
+$(OUTPUT)/hwprobe: hwprobe.c sys_hwprobe.S
+	$(CC) -o$@ $(CFLAGS) $(LDFLAGS) $^
diff --git a/tools/testing/selftests/riscv/hwprobe/hwprobe.c b/tools/testing/selftests/riscv/hwprobe/hwprobe.c
new file mode 100644
index 000000000000..09f290a67420
--- /dev/null
+++ b/tools/testing/selftests/riscv/hwprobe/hwprobe.c
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <stddef.h>
+#include <asm/hwprobe.h>
+
+/*
+ * Rather than relying on having a new enough libc to define this, just do it
+ * ourselves.  This way we don't need to be coupled to a new-enough libc to
+ * contain the call.
+ */
+long riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
+		   size_t cpu_count, unsigned long *cpus, unsigned int flags);
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
+	for (long i = 0; i < 8; i++)
+		pairs[i].key = i;
+	out = riscv_hwprobe(pairs, 8, 1, &cpus, 0);
+	if (out != 0)
+		return -1;
+	for (long i = 0; i < 4; ++i) {
+		/* Fail if the kernel claims not to recognize a base key. */
+		if ((i < 4) && (pairs[i].key != i))
+			return -2;
+
+		if (pairs[i].key != RISCV_HWPROBE_KEY_BASE_BEHAVIOR)
+			continue;
+
+		if (pairs[i].value & RISCV_HWPROBE_BASE_BEHAVIOR_IMA)
+			continue;
+
+		return -3;
+	}
+
+	/*
+	 * This should also work with a NULL CPU set, but should not work
+	 * with an improperly supplied CPU set.
+	 */
+	out = riscv_hwprobe(pairs, 8, 0, 0, 0);
+	if (out != 0)
+		return -4;
+
+	out = riscv_hwprobe(pairs, 8, 0, &cpus, 0);
+	if (out == 0)
+		return -5;
+
+	out = riscv_hwprobe(pairs, 8, 1, 0, 0);
+	if (out == 0)
+		return -6;
+
+	/*
+	 * Check that keys work by providing one that we know exists, and
+	 * checking to make sure the resultig pair is what we asked for.
+	 */
+	pairs[0].key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR;
+	out = riscv_hwprobe(pairs, 1, 1, &cpus, 0);
+	if (out != 0)
+		return -7;
+	if (pairs[0].key != RISCV_HWPROBE_KEY_BASE_BEHAVIOR)
+		return -8;
+
+	/*
+	 * Check that an unknown key gets overwritten with -1,
+	 * but doesn't block elements after it.
+	 */
+	pairs[0].key = 0x5555;
+	pairs[1].key = 1;
+	pairs[1].value = 0xAAAA;
+	out = riscv_hwprobe(pairs, 2, 0, 0, 0);
+	if (out != 0)
+		return -9;
+
+	if (pairs[0].key != -1)
+		return -10;
+
+	if ((pairs[1].key != 1) || (pairs[1].value == 0xAAAA))
+		return -11;
+
+	return 0;
+}
diff --git a/tools/testing/selftests/riscv/hwprobe/sys_hwprobe.S b/tools/testing/selftests/riscv/hwprobe/sys_hwprobe.S
new file mode 100644
index 000000000000..ed8d28863b27
--- /dev/null
+++ b/tools/testing/selftests/riscv/hwprobe/sys_hwprobe.S
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2022 Rivos, Inc */
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
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
