Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0371CC021AA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 18:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JatDODgZPHGtrbTZ4Eo380R9/152bFnnFmwxm9w0l+c=; b=gRR0PNTI2/hxLM
	rEC3XJgkKupyEWvD18ILO0C+KqBTPE3NmDp6T7hn63jtjLdcG3JhBl+cP/tZ5CqJt/a3NnAPkKr9S
	ExWwyz8iNDL4HpO/WKPebXv5T2aBgBoEMG1UaqThOpZQC9TWKeqSJRJLYjzTsmyoRoqet7Qt17/4Z
	uVy1yDaJYdtQ+UdIcZr3udwyZCBDAWcb1tFjMGmESH2ihYhM199RjlqLZH3/vI+sCcOOaSdD0ELIi
	nh3sy7sR5LLkLSo5PF9fpStQeA1f2HdUC3uyQuIOhhnQM3IzkoQDgzdUeHcXxKPn7XmPYp/DBDwIi
	LkVty0wwHi9ACaciHdTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkpHR-0000000EUTV-0hEu;
	Wed, 19 Feb 2025 18:58:45 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkpFv-0000000ETt9-3nkl
	for linux-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 18:57:13 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e572df6db3eso223336276.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Feb 2025 10:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739991430; x=1740596230; darn=lists.infradead.org;
        h=to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EXw58HqPBaiRnglriOhbvm+UYcMbbold2y+H8kTZDlk=;
        b=uKzrYJckjJM9ZgFDYAVn4T3w5/CoPZgK4a04x4LOPh3bhOnoUg+slOPQxkoLW6L3Qi
         LqIpBn8qkgkejN+DukBq8XoCdJXfeEpf20lUPtPWyKDu49zsyQcIL4Tw7hl5JnmHYv1l
         TPhLcEJ9YErr9eYSuyeoLpAjcVqTz3bGonfH0YKJPVM4C8FbZKEFnCu5f18covqzEmgU
         ygs38vnLfnknbRXCZSAmp2Gbspnibb3i3yg6ZSHDIi7aqED5rNVkIt8Kqnzdb2a7QF+N
         4YMMESW2FqSPcivmZGTssa39EkyVSWjS9SoOnvBorpcMO9XKxuiHa9suVFjxJAzOq/oL
         aGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739991430; x=1740596230;
        h=to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EXw58HqPBaiRnglriOhbvm+UYcMbbold2y+H8kTZDlk=;
        b=LCNzUtFOmORS1Zb4pvcgXQX6RZ64W241feAtzKjm93xpVqrYPEFSsgnud2WTd3CMI2
         hUEtLDLmMw30yxIvaOx1/UO0/ga0vpVpw97AcZqxVc7yyi+yMsmTkO1GtbrLadRQtnYm
         WEGZvqal5wapQ/I2+HNcTH9zAixk5n8yLQo1+OmxC2H2iMtoaKrXAxBFF/T91fYIq86r
         cjKqpqLTT5zEKiWS7xhmSLkRdXtmGDIcHGmeCDZ3UC9jsjOSioTSHUDAlD3NYy+UHEGZ
         AO/1wPCUHHrzdOIon2nN6kIA8gTPo48R9rHIx6cxPHq0cOSVVnCjPIbCosMiqCQJsPTz
         EpGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuq9L+t/kWKxaMWvQx1WKSHWzNZAwQIoh/PscpQ00KSo36Ic4jjSk7GqViUhFxHNEVpUMYIZqkY7ygVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzbCZIHCp4j1uJusVj35SQ8WkZwLZ/x2WsO9dFMjyio7uZYYxKq
	POBxt+D6pqcWR44+n4u9gT+dx6hkreqW8Ux3ME8BhiF+U6lIT4QxXF59fPeqpSnxEKZWEWPCd1F
	i+S5f2g==
X-Google-Smtp-Source: AGHT+IGPMbTasl19lEsUyLjUBa94fVbMRWecTemZAnOiwhvnSubmTuBnVXcV7haTvztOLL4qQ5ayFxZCzw56
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:c57b:86f0:c166:3061])
 (user=irogers job=sendgmr) by 2002:a25:ab6f:0:b0:e5b:1238:a7c3 with SMTP id
 3f1490d57ef6-e5dc90398e5mr199232276.3.1739991430005; Wed, 19 Feb 2025
 10:57:10 -0800 (PST)
Date: Wed, 19 Feb 2025 10:56:49 -0800
Message-Id: <20250219185657.280286-1-irogers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Subject: [PATCH v3 0/8] perf: Support multiple system call tables in the build
From: Ian Rogers <irogers@google.com>
To: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, guoren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Charlie Jenkins <charlie@rivosinc.com>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	"=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=" <bjorn@rivosinc.com>, Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-riscv@lists.infradead.org, 
	linux-mips@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_105711_939156_3646AB73 
X-CRM114-Status: GOOD (  17.50  )
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

This work builds on the clean up of system call tables and removal of
libaudit by Charlie Jenkins <charlie@rivosinc.com>.

The system call table in perf trace is used to map system call numbers
to names and vice versa. Prior to these changes, a single table
matching the perf binary's build was present. The table would be
incorrect if tracing say a 32-bit binary from a 64-bit version of
perf, the names and numbers wouldn't match.

Change the build so that a single system call file is built and the
potentially multiple tables are identifiable from the ELF machine type
of the process being examined. To determine the ELF machine type, the
executable's header is read from /proc/pid/exe with fallbacks to using
the perf's binary type when unknown.

Remove some runtime types used by the system call tables and make
equivalents generated at build time.

v3: Add Charlie's reviewed-by tags. Incorporate feedback from Arnd
    Bergmann <arnd@arndb.de> on additional optional column and MIPS
    system call numbering. Rebase past Namhyung's global system call
    statistics and add comments that they don't yet support an
    e_machine other than EM_HOST.

v2: Change the 1 element cache for the last table as suggested by
    Howard Chu, add Howard's reviewed-by tags.
    Add a comment and apology to Charlie for not doing better in
    guiding:
    https://lore.kernel.org/all/20250114-perf_syscall_arch_runtime-v1-1-5b304e408e11@rivosinc.com/
    After discussion on v1 and he agreed this patch series would be
    the better direction.

Ian Rogers (8):
  perf syscalltble: Remove syscall_table.h
  perf trace: Reorganize syscalls
  perf syscalltbl: Remove struct syscalltbl
  perf thread: Add support for reading the e_machine type for a thread
  perf trace beauty: Add syscalltbl.sh generating all system call tables
  perf syscalltbl: Use lookup table containing multiple architectures
  perf build: Remove Makefile.syscalls
  perf syscalltbl: Mask off ABI type for MIPS system calls

 tools/perf/Makefile.perf                      |  10 +-
 tools/perf/arch/alpha/entry/syscalls/Kbuild   |   2 -
 .../alpha/entry/syscalls/Makefile.syscalls    |   5 -
 tools/perf/arch/alpha/include/syscall_table.h |   2 -
 tools/perf/arch/arc/entry/syscalls/Kbuild     |   2 -
 .../arch/arc/entry/syscalls/Makefile.syscalls |   3 -
 tools/perf/arch/arc/include/syscall_table.h   |   2 -
 tools/perf/arch/arm/entry/syscalls/Kbuild     |   4 -
 .../arch/arm/entry/syscalls/Makefile.syscalls |   2 -
 tools/perf/arch/arm/include/syscall_table.h   |   2 -
 tools/perf/arch/arm64/entry/syscalls/Kbuild   |   3 -
 .../arm64/entry/syscalls/Makefile.syscalls    |   6 -
 tools/perf/arch/arm64/include/syscall_table.h |   8 -
 tools/perf/arch/csky/entry/syscalls/Kbuild    |   2 -
 .../csky/entry/syscalls/Makefile.syscalls     |   3 -
 tools/perf/arch/csky/include/syscall_table.h  |   2 -
 .../perf/arch/loongarch/entry/syscalls/Kbuild |   2 -
 .../entry/syscalls/Makefile.syscalls          |   3 -
 .../arch/loongarch/include/syscall_table.h    |   2 -
 tools/perf/arch/mips/entry/syscalls/Kbuild    |   2 -
 .../mips/entry/syscalls/Makefile.syscalls     |   5 -
 tools/perf/arch/mips/include/syscall_table.h  |   2 -
 tools/perf/arch/parisc/entry/syscalls/Kbuild  |   3 -
 .../parisc/entry/syscalls/Makefile.syscalls   |   6 -
 .../perf/arch/parisc/include/syscall_table.h  |   8 -
 tools/perf/arch/powerpc/entry/syscalls/Kbuild |   3 -
 .../powerpc/entry/syscalls/Makefile.syscalls  |   6 -
 .../perf/arch/powerpc/include/syscall_table.h |   8 -
 tools/perf/arch/riscv/entry/syscalls/Kbuild   |   2 -
 .../riscv/entry/syscalls/Makefile.syscalls    |   4 -
 tools/perf/arch/riscv/include/syscall_table.h |   8 -
 tools/perf/arch/s390/entry/syscalls/Kbuild    |   2 -
 .../s390/entry/syscalls/Makefile.syscalls     |   5 -
 tools/perf/arch/s390/include/syscall_table.h  |   2 -
 tools/perf/arch/sh/entry/syscalls/Kbuild      |   2 -
 .../arch/sh/entry/syscalls/Makefile.syscalls  |   4 -
 tools/perf/arch/sh/include/syscall_table.h    |   2 -
 tools/perf/arch/sparc/entry/syscalls/Kbuild   |   3 -
 .../sparc/entry/syscalls/Makefile.syscalls    |   5 -
 tools/perf/arch/sparc/include/syscall_table.h |   8 -
 tools/perf/arch/x86/entry/syscalls/Kbuild     |   3 -
 .../arch/x86/entry/syscalls/Makefile.syscalls |   6 -
 tools/perf/arch/x86/include/syscall_table.h   |   8 -
 tools/perf/arch/xtensa/entry/syscalls/Kbuild  |   2 -
 .../xtensa/entry/syscalls/Makefile.syscalls   |   4 -
 .../perf/arch/xtensa/include/syscall_table.h  |   2 -
 tools/perf/builtin-trace.c                    | 290 +++++++++++-------
 tools/perf/scripts/Makefile.syscalls          |  61 ----
 tools/perf/scripts/syscalltbl.sh              |  86 ------
 tools/perf/trace/beauty/syscalltbl.sh         | 274 +++++++++++++++++
 tools/perf/util/syscalltbl.c                  | 148 ++++-----
 tools/perf/util/syscalltbl.h                  |  22 +-
 tools/perf/util/thread.c                      |  50 +++
 tools/perf/util/thread.h                      |  14 +-
 54 files changed, 616 insertions(+), 509 deletions(-)
 delete mode 100644 tools/perf/arch/alpha/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/alpha/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/alpha/include/syscall_table.h
 delete mode 100644 tools/perf/arch/arc/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/arc/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/arc/include/syscall_table.h
 delete mode 100644 tools/perf/arch/arm/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/arm/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/arm/include/syscall_table.h
 delete mode 100644 tools/perf/arch/arm64/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/arm64/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/arm64/include/syscall_table.h
 delete mode 100644 tools/perf/arch/csky/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/csky/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/csky/include/syscall_table.h
 delete mode 100644 tools/perf/arch/loongarch/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/loongarch/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/loongarch/include/syscall_table.h
 delete mode 100644 tools/perf/arch/mips/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/mips/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/mips/include/syscall_table.h
 delete mode 100644 tools/perf/arch/parisc/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/parisc/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/parisc/include/syscall_table.h
 delete mode 100644 tools/perf/arch/powerpc/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/powerpc/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/powerpc/include/syscall_table.h
 delete mode 100644 tools/perf/arch/riscv/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/riscv/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/riscv/include/syscall_table.h
 delete mode 100644 tools/perf/arch/s390/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/s390/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/s390/include/syscall_table.h
 delete mode 100644 tools/perf/arch/sh/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/sh/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/sh/include/syscall_table.h
 delete mode 100644 tools/perf/arch/sparc/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/sparc/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/sparc/include/syscall_table.h
 delete mode 100644 tools/perf/arch/x86/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/x86/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/x86/include/syscall_table.h
 delete mode 100644 tools/perf/arch/xtensa/entry/syscalls/Kbuild
 delete mode 100644 tools/perf/arch/xtensa/entry/syscalls/Makefile.syscalls
 delete mode 100644 tools/perf/arch/xtensa/include/syscall_table.h
 delete mode 100644 tools/perf/scripts/Makefile.syscalls
 delete mode 100755 tools/perf/scripts/syscalltbl.sh
 create mode 100755 tools/perf/trace/beauty/syscalltbl.sh

-- 
2.48.1.601.g30ceb7b040-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
