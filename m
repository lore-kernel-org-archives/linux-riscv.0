Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406E9C87FCA
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jul 2025 08:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I2CTNT3gbjysmWDn3S0KuVry2fZq7ZppoE4fvTnpDus=; b=OE6Nb8rCQ3cZyz
	fCegpy4Jti/qPVBM7Xa7d++WN8hlZfgpOBxksO/baIUmq2yIHCaqo+DHXptJ7WMquTYXjOspEHVpz
	oyqtroNLfaShQw27Lox6jUTuodl1tPQ27wFMi4xHssG/mPLDMjSAPv9wns8uTibS0Mp1nMylFTFoa
	A5oF3+k0FvfyoaDjhDCh7THGe/upTRNjuyprMNEIfhkojCMN9UeHXUwV6d0wvpCLwafdG6prcMc5H
	M60mGDCH7rnsphhpZJJ+no3QF8EvH3v6uuSmuVEByXVQ2DVXe8pubVPF2Q5AZsHa2pFPSJNvSi3Qr
	d22BAW/qBzSzG3Zui53g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugfSe-0000000GDdR-3dIA;
	Tue, 29 Jul 2025 08:13:24 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugfSb-0000000GDa7-1qf9
	for linux-riscv@lists.infradead.org;
	Tue, 29 Jul 2025 08:13:22 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-235e1d66fa6so56977275ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Jul 2025 01:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753776800; x=1754381600; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pppra4qoUIASFj11vi7hdy6H5kU0GOjurpfaQQiON1E=;
        b=qLojLNnSAag9evwjl2JbLLj+rJf4ywF8UT0V0+F/tN8Y+4sJGE+Spk5Z+9Cl4Tglu8
         AorAVDDacL+2T9U45ZswZrMnlCpqgV+P0sTU7xEat+NRHDVFv5dLrgPsbHPMJ9yAf5gT
         /X45eTTClTGUcSgajHNGL4uttc1D7UHPiB/gpmP6W3nkAANuvllEix+NlTBKYESukYmr
         c3o2rL2pVJQN3mWlAix5fxrFq9pX1xMdaz9YLAkNvYQSl/nUFb3dPdSBLL0tGUDtMwPW
         5p5azz/yVCOxbB7+aQXzXPibAHfoNX1gE6FzI0OijtCr3/wS4FcLiucOpP+0LV/SuQsH
         8seQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753776800; x=1754381600;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pppra4qoUIASFj11vi7hdy6H5kU0GOjurpfaQQiON1E=;
        b=roZdAznXNzdYjYq0xcnhEiin6tRC2dybxcRK9E/jfW9eEb5ByHL2DohXnrxK9wU9P2
         OtcQmRmT9khVuRiY0poXTpIeQkaMAVJuA5xUdZoRMiKUbbnt7ghSEQGGQopfIx9FSLOW
         s3UKALmmr7On0vdbj1nlSQ2bmVxsgKWmfSSgjscYg/iSr1xD5I3pQiwtt3BbbgO1jEgZ
         lKoQDTpcFraYxuA2PXGdmrS/+7NGMTlfJBJ5ukSjsAff5BSIKVQpuyJ7YlPp7P9Z71O7
         leGbD5G60wcIXveQcpNRzfMrrIlMWi3FRr/64tKG85wIg5nUJcltqeYBntvq6tSZBVS1
         6ojw==
X-Forwarded-Encrypted: i=1; AJvYcCXDvs1qlIDHbSp0htsP7c6QGcMZwR8x/qBiBGeCiEjJbsw5H7crG3SX4oP/4mGkTgnpXTqzRUmi5sMT2A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUv9bQPaivM+xzLvQOnUloebfjwxHjfDpi40Da+UTT05gcoufp
	+JUpZz5MJ2x+FHHW4YJCL/3pXtLy+Af+otab+PPyQs6ET+EYxI6pcZ8p6YM5vz0C8Z4GYHftFlp
	CQCDp8g==
X-Google-Smtp-Source: AGHT+IEfcbCRh+gitWFUzwBX0TsCAZa6VaftFKxPs2lYtcqrCg750iVws+VPQQvAfHwiipfHwgOZPPrL9vU=
X-Received: from pfbfh5.prod.google.com ([2002:a05:6a00:3905:b0:749:d28:4ca2])
 (user=yuzhuo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3d1a:b0:21f:4ecc:11ab
 with SMTP id adf61e73a8af0-23d6ffdc7bemr23243429637.9.1753776800054; Tue, 29
 Jul 2025 01:13:20 -0700 (PDT)
Date: Tue, 29 Jul 2025 01:12:56 -0700
In-Reply-To: <20250729081256.3433892-1-yuzhuo@google.com>
Mime-Version: 1.0
References: <20250729081256.3433892-1-yuzhuo@google.com>
X-Mailer: git-send-email 2.50.1.487.gc89ff58d15-goog
Message-ID: <20250729081256.3433892-4-yuzhuo@google.com>
Subject: [PATCH v1 3/3] perf bench: Add 'bench sync ticket' subcommand
From: Yuzhuo Jing <yuzhuo@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Liang Kan <kan.liang@linux.intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yuzhuo Jing <yzj@umich.edu>, Yuzhuo Jing <yuzhuo@google.com>, 
	Guo Ren <guoren@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Leonardo Bras <leobras@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_011321_490464_27BF3883 
X-CRM114-Status: GOOD (  13.39  )
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

Benchmark kernel ticket spinlock implementation in user space.

In resolution of arch_spin_* redefinition conflicts due to importing
qspinlock and ticket spinlock together, the sync.c defines
__no_arch_spinlock_redefine, following the usage in
arch/riscv/include/asm/spinlock.h.

Signed-off-by: Yuzhuo Jing <yuzhuo@google.com>
---
 tools/perf/bench/bench.h   |  1 +
 tools/perf/bench/sync.c    | 17 +++++++++++++++++
 tools/perf/builtin-bench.c |  1 +
 3 files changed, 19 insertions(+)

diff --git a/tools/perf/bench/bench.h b/tools/perf/bench/bench.h
index dd6c8b6126d3..42c0696b05fb 100644
--- a/tools/perf/bench/bench.h
+++ b/tools/perf/bench/bench.h
@@ -23,6 +23,7 @@ int bench_sched_messaging(int argc, const char **argv);
 int bench_sched_pipe(int argc, const char **argv);
 int bench_sched_seccomp_notify(int argc, const char **argv);
 int bench_sync_qspinlock(int argc, const char **argv);
+int bench_sync_ticket(int argc, const char **argv);
 int bench_syscall_basic(int argc, const char **argv);
 int bench_syscall_getpgid(int argc, const char **argv);
 int bench_syscall_fork(int argc, const char **argv);
diff --git a/tools/perf/bench/sync.c b/tools/perf/bench/sync.c
index c85e9853c72a..581835451e5f 100644
--- a/tools/perf/bench/sync.c
+++ b/tools/perf/bench/sync.c
@@ -17,7 +17,9 @@
 #include "bench.h"
 #include "../util/tsc.h"
 
+#define __no_arch_spinlock_redefine
 #include "include/qspinlock.h"
+#include "include/ticket_spinlock.h"
 
 #define NS 1000000000ull
 #define CACHELINE_SIZE 64
@@ -67,6 +69,7 @@ static const struct option options[] = {
 
 static const char *const bench_sync_usage[] = {
 	"perf bench sync qspinlock <options>",
+	"perf bench sync ticket <options>",
 	NULL
 };
 
@@ -106,6 +109,20 @@ int bench_sync_qspinlock(int argc, const char **argv)
 	return bench_sync_lock_generic(&ops, argc, argv);
 }
 
+/*
+ * Benchmark of linux kernel ticket spinlock in user land.
+ */
+int bench_sync_ticket(int argc, const char **argv)
+{
+	arch_spinlock_t lock = __ARCH_SPIN_LOCK_UNLOCKED;
+	struct lock_ops ops = {
+		.lock = (lock_fn)ticket_spin_lock,
+		.unlock = (lock_fn)ticket_spin_unlock,
+		.data = &lock,
+	};
+	return bench_sync_lock_generic(&ops, argc, argv);
+}
+
 /*
  * A busy loop to acquire and release the given lock N times.
  */
diff --git a/tools/perf/builtin-bench.c b/tools/perf/builtin-bench.c
index cfe6f6dc6ed4..8d945b846321 100644
--- a/tools/perf/builtin-bench.c
+++ b/tools/perf/builtin-bench.c
@@ -54,6 +54,7 @@ static struct bench sched_benchmarks[] = {
 
 static struct bench sync_benchmarks[] = {
 	{ "qspinlock",	"Benchmark for queued spinlock",		bench_sync_qspinlock	},
+	{ "ticket",	"Benchmark for ticket spinlock",		bench_sync_ticket	},
 	{ "all",	"Run all synchronization benchmarks",		NULL			},
 	{ NULL,		NULL,						NULL			}
 };
-- 
2.50.1.487.gc89ff58d15-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
