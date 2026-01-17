Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C738C9830E
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jan 2026 05:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j7qnFLEg40uDM2yV/7dAdjrWUpaT0GGriwKTF0nVavI=; b=lwTDpQcVo7Pf6T
	8+FbrgF5ZzBxMxb195a2Ne90PAkcnEiJIfIJCymUPLY3Umnbeq9WpvtK++oTfZ4GPrYYscQ5SFEjv
	O9XrJcp1F2WlhchRkw7ZTph324CiA8YcwY7cb1sqUCPFJ9KrORJp+UZ1ADczGoR0W8NUeObSquAtJ
	gRwGDf1Z8hKFCizTFxeLZSd15mN9iVRCqcLjr9OAogeUk0H2VY0V5oO971nL1NTA6L1/4lLg5OZ/P
	VhKT+ZAhNT1YAIjfqtY6xIdhXpzudoyXeyFO37ZbMqcZzDA1UIuvUoy5D80cRMX71G+sfYGFZsC2q
	l8O/PtVRlly5sJlVlBYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgyuA-0000000FGh2-0TNZ;
	Sat, 17 Jan 2026 05:31:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgyt1-0000000FFBG-43uw
	for linux-riscv@bombadil.infradead.org;
	Sat, 17 Jan 2026 05:30:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=E3ySt36B4ISR8ZRmDcInO2UVT50pnmB1ju9RDICGsEs=; b=BEzWWnnEr3+nPM3vaGIWGjkCCJ
	DwSwcYmY/AkERnYB+ZtpcUWeRL5ENQcEDzCuJ0Az2h27czSeMjk6Vs8E5L76m7LuzpxyWPWsCQW4b
	sud3E3AyewT0VtPc++m25X1ao4yijOLPRQBLo65j+lsH0Y9acjyJWmJHXA9+JbBHT/mGACG3ZqNm1
	hq1d5jHgxfkfl7+HslYvUBBbYDkAIArct3G3BKu+5XnOF9Vdk/vwVZTsHmkO5JnDxoS9lcslkOxEs
	t9qG+y3ke8rxUkGp0GEFafdTdDLSGZCP1d6XJy59m6j9FLXZX2OLbvEdbXAoaxOeNJjZPDoKxid7A
	OiBzr1xA==;
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgyss-00000009sgk-1MyQ
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jan 2026 05:30:09 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2b6af3eb78dso8726401eec.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 21:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768627796; x=1769232596; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E3ySt36B4ISR8ZRmDcInO2UVT50pnmB1ju9RDICGsEs=;
        b=tlUUG5G29bpTCcwVf2UqlXrzk2A2cOM6NGxFEfVvzRAcKG9B9cRDTq+BoagibiCire
         FII1n90oLzjCEcMm4sO3rRDw8iRaIUEhhVs09qFrDgZ1WdJQ6JFtyM0NYDd5vOsmWppG
         rCr5XClx2GcR5EmqXEgahFJqjC9+P8HTY3uvNGqOGEgA3QVXFtPzS0dWzWqG2B33pedp
         1r22xeSg9+LGubTIGIM7KLzaF9veKfFYdFNxkD6HwqFFg3zyRmhx5gPuDS3oTEzZPIl7
         tlitcr54JvNZKvYmB9VrJrCau5FDqdv/Tg2aO8HAD9/TzebaYVbrlcZSl2azGHOeFXwj
         OuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768627796; x=1769232596;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E3ySt36B4ISR8ZRmDcInO2UVT50pnmB1ju9RDICGsEs=;
        b=vAz1p49SFcsFfOUcrcAbAHuIlnovjgSYBl74UNs0OLqQvrv9yTU1jcH2o3DsQNyZo/
         ooeO9Y+8qqbAGHNW3fmsjBAsXsMF0IsETPYVA6wMCJJdpJ+Q3wIvEWYpgzSSwWnL0uEK
         /VCtmzgSkzFiyR9iMmJbzgzpH1HKjODMw1bFrcGiv1qb2CcAUn/DYtVStzEJ1nV/HV88
         6mX97nBzkwDktQ4p0od7mzf2XcppOPiDxJPzhYpXZXdPS745ZJBqZx5B2WCdM2SagDO+
         4qLo8LAgb5UOA31HuHpKYrYjCG4y/GD2V3b680wZlHIe5V7Ukin1L9AczZl8J+lod87b
         9jLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeeYhJcp7E+kl3LR+sYj3M5Tp4nns/CgN8zetL5gm0dGqdxwbbK5K9+6iP5EskMqUhiZnNqNTIbtqFmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzS5n2962vTZsOGt1Cw7XD7uqFzlYsOePxp9ZknS0Xe/FPNNrmP
	MXEJrqHLIjZVAAiHCECqC2AqleVF85wsQDMGgEQXmQ8V8XYTlNitsmIyQddqK9LkA/BCrfoxLkw
	afIkA0Qni1w==
X-Received: from dycnp4.prod.google.com ([2002:a05:7301:1484:b0:2af:dc89:507f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:e8a2:b0:2ae:5d5b:4ed0
 with SMTP id 5a478bee46e88-2b6b40d9dadmr4094787eec.21.1768627796102; Fri, 16
 Jan 2026 21:29:56 -0800 (PST)
Date: Fri, 16 Jan 2026 21:28:46 -0800
In-Reply-To: <20260117052849.2205545-1-irogers@google.com>
Mime-Version: 1.0
References: <20260117052849.2205545-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260117052849.2205545-21-irogers@google.com>
Subject: [PATCH v1 20/23] perf dwarf-regs: Add MIPS perf to dwarf register
 number mapping functions
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Shimin Guo <shimin.guo@skydio.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Howard Chu <howardchu95@gmail.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Andi Kleen <ak@linux.intel.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Dmitry Vyukov <dvyukov@google.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, Chun-Tse Shao <ctshao@google.com>, 
	Aditya Bodkhe <aditya.b1@linux.ibm.com>, Haibo Xu <haibo1.xu@intel.com>, 
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Wielaard <mark@klomp.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_053007_785741_117B776C 
X-CRM114-Status: GOOD (  16.94  )
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

Despite an unused function declaration, there was no unwind-libdw for
MIPS but there is a perf_regs.h and a libdw implementation. Fill in
the pieces so hopefully MIPS unwinding with libdw works.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dwarf-regs-arch/Build             |  1 +
 tools/perf/util/dwarf-regs-arch/dwarf-regs-mips.c | 14 ++++++++++++++
 tools/perf/util/dwarf-regs.c                      |  5 +++++
 tools/perf/util/include/dwarf-regs.h              |  1 +
 tools/perf/util/unwind-libdw.h                    |  2 --
 5 files changed, 21 insertions(+), 2 deletions(-)
 create mode 100644 tools/perf/util/dwarf-regs-arch/dwarf-regs-mips.c

diff --git a/tools/perf/util/dwarf-regs-arch/Build b/tools/perf/util/dwarf-regs-arch/Build
index 10c2af3d933a..ceb68ae86fd8 100644
--- a/tools/perf/util/dwarf-regs-arch/Build
+++ b/tools/perf/util/dwarf-regs-arch/Build
@@ -2,6 +2,7 @@ perf-util-$(CONFIG_LIBDW) += dwarf-regs-arm64.o
 perf-util-$(CONFIG_LIBDW) += dwarf-regs-arm.o
 perf-util-$(CONFIG_LIBDW) += dwarf-regs-csky.o
 perf-util-$(CONFIG_LIBDW) += dwarf-regs-loongarch.o
+perf-util-$(CONFIG_LIBDW) += dwarf-regs-mips.o
 perf-util-$(CONFIG_LIBDW) += dwarf-regs-powerpc.o
 perf-util-$(CONFIG_LIBDW) += dwarf-regs-riscv.o
 perf-util-$(CONFIG_LIBDW) += dwarf-regs-s390.o
diff --git a/tools/perf/util/dwarf-regs-arch/dwarf-regs-mips.c b/tools/perf/util/dwarf-regs-arch/dwarf-regs-mips.c
new file mode 100644
index 000000000000..3bb916b45c66
--- /dev/null
+++ b/tools/perf/util/dwarf-regs-arch/dwarf-regs-mips.c
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <errno.h>
+#include <dwarf-regs.h>
+#include "../../../arch/mips/include/uapi/asm/perf_regs.h"
+
+int __get_dwarf_regnum_for_perf_regnum_mips(int perf_regnum)
+{
+	if (perf_regnum == PERF_REG_MIPS_PC)
+		return 37;
+	if (perf_regnum < 0 || perf_regnum >= PERF_REG_MIPS_MAX)
+		return -ENOENT;
+
+	return perf_regnum;
+}
diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
index f86f76547592..797f455eba0d 100644
--- a/tools/perf/util/dwarf-regs.c
+++ b/tools/perf/util/dwarf-regs.c
@@ -179,6 +179,8 @@ static int get_libdw_frame_nregs(unsigned int machine, unsigned int flags __mayb
 		return 103;
 	case EM_LOONGARCH:
 		return 74;
+	case EM_MIPS:
+		return 71;
 	default:
 		return 0;
 	}
@@ -218,6 +220,9 @@ int get_dwarf_regnum_for_perf_regnum(int perf_regnum, unsigned int machine,
 	case EM_LOONGARCH:
 		reg = __get_dwarf_regnum_for_perf_regnum_loongarch(perf_regnum);
 		break;
+	case EM_MIPS:
+		reg = __get_dwarf_regnum_for_perf_regnum_mips(perf_regnum);
+		break;
 	default:
 		pr_err("ELF MACHINE %x is not supported.\n", machine);
 		return -ENOENT;
diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
index b95cf2d7b5b3..46a764cf322f 100644
--- a/tools/perf/util/include/dwarf-regs.h
+++ b/tools/perf/util/include/dwarf-regs.h
@@ -113,6 +113,7 @@ int __get_dwarf_regnum_for_perf_regnum_loongarch(int perf_regnum);
 int __get_dwarf_regnum_for_perf_regnum_powerpc(int perf_regnum);
 int __get_dwarf_regnum_for_perf_regnum_riscv(int perf_regnum);
 int __get_dwarf_regnum_for_perf_regnum_s390(int perf_regnum);
+int __get_dwarf_regnum_for_perf_regnum_mips(int perf_regnum);
 
 /*
  * get_dwarf_regnum - Returns DWARF regnum from register name
diff --git a/tools/perf/util/unwind-libdw.h b/tools/perf/util/unwind-libdw.h
index 20d63d881dff..9c5b5fcaaae8 100644
--- a/tools/perf/util/unwind-libdw.h
+++ b/tools/perf/util/unwind-libdw.h
@@ -9,8 +9,6 @@ struct machine;
 struct perf_sample;
 struct thread;
 
-bool libdw_set_initial_registers_mips(Dwfl_Thread *thread, void *arg);
-
 struct unwind_info {
 	Dwfl			*dwfl;
 	struct perf_sample      *sample;
-- 
2.52.0.457.g6b5491de43-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
