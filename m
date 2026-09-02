Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB626C61DFD
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 09:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3uGKR8L4cTMu1aXqrdGjwA2bGZ9Y1qtX4zuxAbBQZe8=; b=juVizHjjkjBWwz
	vOuxLRrqulpX02+rzjpgVcG6R1ByQs5dpcQw8mmw14TRizo00CcFsbsR1+s3fb0MN8MQs61TfNF87
	JvKL2eEtLdxdZx0aXjEy5ED3mv9ofrazbcKLuDqrTcIcq/QQQBCz1Rti92aXpa0DtFcHkaJu33nmn
	cbL8iDOxUyKyGcqVU4RPPLNosdntDp44FjdfXyxn1GAUmUnmYLMx92x/4XNBBqxvVZ6hblPsVqEfH
	46tM+PD9zYs3bre66WUjeQTOqEmTJQ79OoEkZd3IE+XyzvlyiCDQUOyNg02W4nuRrVRdd48bd8YBP
	tMgfReVcGvGIQE5JL0Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1hKM-0000000EEGB-1Yjq;
	Wed, 02 Sep 2026 09:32:18 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1hKJ-0000000EEFQ-119e
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 09:32:16 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so949524a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Sep 2026 02:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1788341534; x=1788946334; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xiOd++yN59iYM002z+jiLpYNo4lUzruGc+dFpShCWO4=;
        b=Z385Ge2ZjM6dU0ByoxbEH+0Afbl0XWVN4kphucUwpjcJ4AfkeNprgELSdCH2HxGdbk
         Po25HMmiRufJIMgaL3qtSuCQnGa7cw7rpioReo+ocXiM3Zyi2DujByJioZk98dOqHW4V
         GWuwBrt2+lyvcDjneEyKzmICNW9pR+hTlT5DFxTMPkpQEsbkTAF6v944FUbLD6Afuhtr
         Aj+YKFIHbmsQTVvaoEmQr2VwJigC5jQRHN9euu9AAwF9PWxbFEIb+J6s9mdjGow3HZWS
         o1BKHZd4WV+JDOqWVV0jBTtDu42hfxigJyFdtgVT7GNDQZQZ8D6GSY2/0pjpJENV5Wrs
         NwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788341534; x=1788946334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xiOd++yN59iYM002z+jiLpYNo4lUzruGc+dFpShCWO4=;
        b=jRjQFmtbEtw9qof4kqeqHB8V201Wyk+i9A/9Ffeag1iblJ2PHRRyhTd28Z7PZNWAem
         dsj6EYDhyhEzRnaBI0MIfn3giUeRRoPwHfEPXodw90yRW1t9SThYLFngsAGpYGpzYtIH
         DzFOu//FdGFbc5tUKEvZ4ndfMc0AqAdfgrtDF0L4bPUjKo5NJ5eBNtUoZtaGQ+ZtrGt0
         8lPINJFwmr4Ae8q4x7dovivqDTM+ZqrgXRY9bQH0yy8YxR2uLGBu7YD45fBTmuAWdIHC
         eGIhA+dzUhmySEFALhgC0zb2pTU/9nZS5qBXiRzv2JRa+Ydj6+/Yubx/s4pLbn03ROaY
         sUPg==
X-Forwarded-Encrypted: i=1; AKwUvBwWT8uWQqf4E5xPPTHM5B/0VUSLgS9pV6D7tS2fXRIYR14J5+2ex74asHNqZPUNO9YBRv5KKGF+h3rSyA==@lists.infradead.org
X-Gm-Message-State: AFuF++mXSQ0PPu3zGFJAfvj1aI4xirxEJvsUyAe+Nm1dQ4QpG/V6NWgm
	vAVNpqjDErbkixBQnboL1nbz1ms267QJxgcg3P6khJhjCVsAsWUiIR+Y4447a2dYT8E=
X-Gm-Gg: AYBFou1s2sSDwlCA3vWhZNX6E0/JNArxWlD21mqKGT8MXB0ScY19Mzdk50X0bE7KSHy
	P/2svO3NotH76+l7c1fVcmuM4GF3z99wg3m7lL2ahj01+9+9hITA/5PmYOD5YVBOTk+YnM4DuUM
	V8p+u5muk4BjBZz4yZBXEsGBNLaEAyBRi2S9lfTFn+smhD9NyVs05ymCC9i2bnLIn4X90WcK8Mf
	vOHsHAU68quWBygJPL+O3JfuqS2vBugUHn98spt/OWCeRyfXwJeRlV94c/5hBZp3TJ4nc4D6t5x
	aFEMkoMmrrTxPeiJivejejm5YG8++zgXsL4ZYkwHuXXOmtiFvev2j15KQ8qssfNyFjX6khhDuPl
	QE9JR+faQX8O1iwaQAMCavrNYQbSUd2ShgUFnLcs0YWPLytYf2MCjPcEjzyrcNfYMslzy0DOqFd
	u5NtQlYGdFLoBs5/1Qo4+qjaMX9PNHeDPbD0sBpElw6wRk8HPiaHUpZHN2grrMcdwZCaZmsZgXS
	SPp
X-Received: by 2002:a17:90b:1806:b0:398:9beb:a2bc with SMTP id 98e67ed59e1d1-39af650d689mr1807389a91.30.1788341534076;
        Wed, 02 Sep 2026 02:32:14 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07bdee2asm4525497eec.28.2026.09.02.02.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 02:32:13 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: Namhyung Kim <namhyung@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nylon Chen <nylon.chen@sifive.com>
Subject: [PATCH] perf bench futex: Define SYS_futex on 32-bit arches with 64-bit time_t
Date: Wed,  2 Sep 2026 02:32:10 -0700
Message-ID: <20260902093210.3571958-1-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.43.7
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_023215_329639_7492AC33 
X-CRM114-Status: GOOD (  15.20  )
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

The kernel does not provide sys_futex() on 32-bit architectures that lack
a 32-bit time representation, such as riscv32. Consequently glibc does not
define SYS_futex there, only SYS_futex_time64, and perf bench's futex
benchmarks fail to build:

  bench/futex.h: In function 'futex_syscall':
  bench/futex.h:77:18: error: 'SYS_futex' undeclared (first use in this function)

Define SYS_futex as SYS_futex_time64 when only the latter is available.
The guard and its comment are taken verbatim from
tools/testing/selftests/futex/include/futextest.h, where they were added by
commit 04850819c65c ("selftests/futex: Define SYS_futex on 32-bit
architectures with 64-bit time_t"), keeping the two futex userspace headers
in sync.

No timespec conversion helper is needed on top of this. glibc lays out
struct timespec on 32-bit architectures with 64-bit time_t as
{ int64 tv_sec; int32 tv_nsec; 32-bit pad }, which is compatible with
struct __kernel_timespec, and every futex_wait()/futex_lock_pi()/
futex_wait_requeue_pi() call site in perf bench passes a NULL timeout
anyway, so no timespec ever crosses the syscall boundary here.

Note that an earlier and more ambitious attempt at this was
commit c1ff12dac465 ("perf bench futex: Add support for 32-bit systems
with 64-bit time_t"), reverted by
commit ba4026b09d83 ("Revert "perf bench futex: Add support for 32-bit
systems with 64-bit time_t"") because it included linux/time_types.h,
which is unavailable on older distributions. This change deliberately
avoids that dependency and adds only the one guard needed to fix
compilation.

Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 tools/perf/bench/futex.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/perf/bench/futex.h b/tools/perf/bench/futex.h
index fcb72d682cf8..6df8837b365b 100644
--- a/tools/perf/bench/futex.h
+++ b/tools/perf/bench/futex.h
@@ -14,6 +14,17 @@
 #include <sys/types.h>
 #include <linux/futex.h>
 
+/*
+ * SYS_futex is expected from system C library, in glibc some 32-bit
+ * architectures (e.g. RV32) are using 64-bit time_t, therefore it doesn't have
+ * SYS_futex defined but just SYS_futex_time64. Define SYS_futex as
+ * SYS_futex_time64 in this situation to ensure the compilation and the
+ * compatibility.
+ */
+#if !defined(SYS_futex) && defined(SYS_futex_time64)
+#define SYS_futex SYS_futex_time64
+#endif
+
 struct bench_futex_parameters {
 	bool silent;
 	bool fshared;

base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91
-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
