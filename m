Return-Path: <SRS0=t5Vp=H3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4057C433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Feb 2021 14:30:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77F5264F16
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Feb 2021 14:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77F5264F16
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LKPjY8a4BofA4ob1Gk8onWctyqwGkBbfII9pnw5BdZg=; b=FVwTe1dJ6iP2DGxeh3wwE1xb+
	7q7rrYMFbI7+5PEfV/dFpsIGLgBZc7LFUxl2Z++Kb6ArbqjA2ToS4P7f9NpyMwohC6w0YfupeRGyd
	tipP6OfLVK9fx6LUhQfwIfIwCmbUiOxd9QOIFQgqzXH1kSk5ATfUM+QUawdvWoAUaud/YYN5IKH3p
	yW0OtMaNYS2Kqw2Ajo4FDQm8B6a1sKyb5g4Oyaa2CHRKhmNNr815xEjpx88I/boD8oswIerd3+ZwY
	PSnAyn5gYvB9gq+YuG4AHRwamPwtjq6NRuuZ5HkDzKPI5xJQwygStDm1VE4kubiLk5CSib2+F4//j
	RCgdLQq+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFHeL-0000yR-HQ; Thu, 25 Feb 2021 14:29:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFHeI-0000y1-2F
 for linux-riscv@lists.infradead.org; Thu, 25 Feb 2021 14:29:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A2FFC64F06;
 Thu, 25 Feb 2021 14:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614263387;
 bh=cIxhzvN8PywR4RHAE+M5NP6GAu7Selrt0/BDMrXfmRE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FYRpv1m+UNrN54OEsaFbJb1DyEukMZ+nB+JiCJlBNJdsbTIwiZ2w4HfV8glCovyEd
 xn4C8Ft9grxy9O0e8bgeedp8mB8sGlAlSW677X8TAv25YFDxSQaKBm6S1mJ2MSKMZl
 F/oKIrfGMu8vcW3OBiZzCveju8I2LXeSaSg7r1406pif+kIGz1KPBy1MVW66rjMum6
 EqH9ID0nIlgqDU8xVTydUNqZWHbTxCnscysf6OiugjdEF1ImBjipH4VAH4FFwCdhSS
 VgulJwN4l4UAtoN5uxv3Tp8qq5rjD5aa9njmmc+lI289yVtEUFhXkN5j9AzjBo5Ix5
 Ia2eAcb+Dj2iw==
From: Arnd Bergmann <arnd@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 2/2] Documentation: features: refresh feature list
Date: Thu, 25 Feb 2021 15:27:18 +0100
Message-Id: <20210225142841.3385428-2-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210225142841.3385428-1-arnd@kernel.org>
References: <20210225142841.3385428-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_092950_399718_82D2DC13 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Pekka Enberg <penberg@kernel.org>,
 =?UTF-8?q?Patrick=20St=C3=A4hlin?= <me@packi.ch>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-csky@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, David Daney <david.daney@cavium.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, Xingxing Su <suxingxing@loongson.cn>,
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Archer Yan <ayan@wavecomp.com>,
 Youling Tang <tangyouling@loongson.cn>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>

Run the update script to document the recent feature additions
on riscv, mips and csky.

Fixes: c109f42450ec ("csky: Add kmemleak support")
Fixes: 8b3165e54566 ("MIPS: Enable GCOV")
Fixes: 1ddc96bd42da ("MIPS: kernel: Support extracting off-line stack traces from user-space with perf")
Fixes: 74784081aac8 ("riscv: Add uprobes supported")
Fixes: 829adda597fe ("riscv: Add KPROBES_ON_FTRACE supported")
Fixes: c22b0bcb1dd0 ("riscv: Add kprobes supported")
Fixes: dcdc7a53a890 ("RISC-V: Implement ptrace regs and stack API")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 Documentation/features/debug/gcov-profile-all/arch-support.txt  | 2 +-
 Documentation/features/debug/kmemleak/arch-support.txt          | 2 +-
 Documentation/features/debug/kprobes-on-ftrace/arch-support.txt | 2 +-
 Documentation/features/debug/kprobes/arch-support.txt           | 2 +-
 Documentation/features/debug/kretprobes/arch-support.txt        | 2 +-
 Documentation/features/debug/uprobes/arch-support.txt           | 2 +-
 Documentation/features/perf/kprobes-event/arch-support.txt      | 2 +-
 Documentation/features/perf/perf-regs/arch-support.txt          | 2 +-
 Documentation/features/perf/perf-stackdump/arch-support.txt     | 2 +-
 Documentation/features/sched/numa-balancing/arch-support.txt    | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/features/debug/gcov-profile-all/arch-support.txt b/Documentation/features/debug/gcov-profile-all/arch-support.txt
index 416c70345946..b39c1a5de3f3 100644
--- a/Documentation/features/debug/gcov-profile-all/arch-support.txt
+++ b/Documentation/features/debug/gcov-profile-all/arch-support.txt
@@ -16,7 +16,7 @@
     |        ia64: | TODO |
     |        m68k: | TODO |
     |  microblaze: |  ok  |
-    |        mips: | TODO |
+    |        mips: |  ok  |
     |       nds32: | TODO |
     |       nios2: | TODO |
     |    openrisc: | TODO |
diff --git a/Documentation/features/debug/kmemleak/arch-support.txt b/Documentation/features/debug/kmemleak/arch-support.txt
index 915185634611..e9ac415f8aec 100644
--- a/Documentation/features/debug/kmemleak/arch-support.txt
+++ b/Documentation/features/debug/kmemleak/arch-support.txt
@@ -10,7 +10,7 @@
     |         arc: |  ok  |
     |         arm: |  ok  |
     |       arm64: |  ok  |
-    |        csky: | TODO |
+    |        csky: |  ok  |
     |       h8300: | TODO |
     |     hexagon: | TODO |
     |        ia64: | TODO |
diff --git a/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt b/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
index aade7816cb87..96156e8802a7 100644
--- a/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
+++ b/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
@@ -22,7 +22,7 @@
     |    openrisc: | TODO |
     |      parisc: |  ok  |
     |     powerpc: |  ok  |
-    |       riscv: | TODO |
+    |       riscv: |  ok  |
     |        s390: |  ok  |
     |          sh: | TODO |
     |       sparc: | TODO |
diff --git a/Documentation/features/debug/kprobes/arch-support.txt b/Documentation/features/debug/kprobes/arch-support.txt
index 4b663c124d1c..ee95ed61909a 100644
--- a/Documentation/features/debug/kprobes/arch-support.txt
+++ b/Documentation/features/debug/kprobes/arch-support.txt
@@ -22,7 +22,7 @@
     |    openrisc: | TODO |
     |      parisc: |  ok  |
     |     powerpc: |  ok  |
-    |       riscv: | TODO |
+    |       riscv: |  ok  |
     |        s390: |  ok  |
     |          sh: |  ok  |
     |       sparc: |  ok  |
diff --git a/Documentation/features/debug/kretprobes/arch-support.txt b/Documentation/features/debug/kretprobes/arch-support.txt
index 5449bb808442..612cb97d47b8 100644
--- a/Documentation/features/debug/kretprobes/arch-support.txt
+++ b/Documentation/features/debug/kretprobes/arch-support.txt
@@ -22,7 +22,7 @@
     |    openrisc: | TODO |
     |      parisc: |  ok  |
     |     powerpc: |  ok  |
-    |       riscv: | TODO |
+    |       riscv: |  ok  |
     |        s390: |  ok  |
     |          sh: |  ok  |
     |       sparc: |  ok  |
diff --git a/Documentation/features/debug/uprobes/arch-support.txt b/Documentation/features/debug/uprobes/arch-support.txt
index 2820177787e1..8bd5548a4485 100644
--- a/Documentation/features/debug/uprobes/arch-support.txt
+++ b/Documentation/features/debug/uprobes/arch-support.txt
@@ -22,7 +22,7 @@
     |    openrisc: | TODO |
     |      parisc: | TODO |
     |     powerpc: |  ok  |
-    |       riscv: | TODO |
+    |       riscv: |  ok  |
     |        s390: |  ok  |
     |          sh: | TODO |
     |       sparc: |  ok  |
diff --git a/Documentation/features/perf/kprobes-event/arch-support.txt b/Documentation/features/perf/kprobes-event/arch-support.txt
index 75739a0007e0..78f3fe080f0e 100644
--- a/Documentation/features/perf/kprobes-event/arch-support.txt
+++ b/Documentation/features/perf/kprobes-event/arch-support.txt
@@ -22,7 +22,7 @@
     |    openrisc: | TODO |
     |      parisc: |  ok  |
     |     powerpc: |  ok  |
-    |       riscv: | TODO |
+    |       riscv: |  ok  |
     |        s390: |  ok  |
     |          sh: |  ok  |
     |       sparc: |  ok  |
diff --git a/Documentation/features/perf/perf-regs/arch-support.txt b/Documentation/features/perf/perf-regs/arch-support.txt
index ea8b6d96633a..5bf3b1854a1f 100644
--- a/Documentation/features/perf/perf-regs/arch-support.txt
+++ b/Documentation/features/perf/perf-regs/arch-support.txt
@@ -16,7 +16,7 @@
     |        ia64: | TODO |
     |        m68k: | TODO |
     |  microblaze: | TODO |
-    |        mips: | TODO |
+    |        mips: |  ok  |
     |       nds32: | TODO |
     |       nios2: | TODO |
     |    openrisc: | TODO |
diff --git a/Documentation/features/perf/perf-stackdump/arch-support.txt b/Documentation/features/perf/perf-stackdump/arch-support.txt
index 87165861037e..d88659bb4fc1 100644
--- a/Documentation/features/perf/perf-stackdump/arch-support.txt
+++ b/Documentation/features/perf/perf-stackdump/arch-support.txt
@@ -16,7 +16,7 @@
     |        ia64: | TODO |
     |        m68k: | TODO |
     |  microblaze: | TODO |
-    |        mips: | TODO |
+    |        mips: |  ok  |
     |       nds32: | TODO |
     |       nios2: | TODO |
     |    openrisc: | TODO |
diff --git a/Documentation/features/sched/numa-balancing/arch-support.txt b/Documentation/features/sched/numa-balancing/arch-support.txt
index bfcfaff67a1b..9affb7c2c500 100644
--- a/Documentation/features/sched/numa-balancing/arch-support.txt
+++ b/Documentation/features/sched/numa-balancing/arch-support.txt
@@ -22,7 +22,7 @@
     |    openrisc: |  ..  |
     |      parisc: |  ..  |
     |     powerpc: |  ok  |
-    |       riscv: | TODO |
+    |       riscv: |  ok  |
     |        s390: |  ok  |
     |          sh: |  ..  |
     |       sparc: | TODO |
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
