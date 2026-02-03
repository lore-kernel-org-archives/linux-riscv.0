Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA31FE87852
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 18:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ms1EoBizmz7/PfqWcNIX7qh3FlKOJwb07r3dnn2X71w=; b=xIz3ZWG/51MePWMnnABgi7DazU
	/zDoYupDWL0sKDL+Aq7QHiultjRFcbWLEL0u8w9+1imUk0MtDZaVoG46buiOQWirmzbZA6sARP590
	hsS5Wyf2DB0N8DBz49aRp2gFqKdWl2RXHvDWp+ctA1SbVPR/l59i6SI+bbbm+BaVZnv4qZ9QjE57E
	V9HxD5/AMwG7WjO0z+O+tvIWJ/JJLqMJInFuuLNNTBdTth+aus5j1sLnof2bB06FaefroxV0ySrih
	SYe8+0Nr4CTHPiyyTAKxdvbH9t6Aj/7zkXoeMam3h9XggOjIQDvW+ljprpf9oZ/kjQGvCTE/vTHb+
	h9Djn/Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnL7E-000000078MJ-1y9k;
	Tue, 03 Feb 2026 18:27:08 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnL7B-000000078Lc-44ND
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 18:27:07 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2b715b26fc3so7973191eec.1
        for <linux-riscv@lists.infradead.org>; Tue, 03 Feb 2026 10:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770143224; x=1770748024; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6nfD0iDGQlTrmds7D8QgMt8w2CmNdX8gcS8Au5Qqnqw=;
        b=NQkIf51asvwYVDWPuAzQzELKs5yjtZYd36ZAFHYI+qef5kywRBoYr2IK+6i0iW2JMg
         v6dUwgESHvhh6GGvnWMCnMpQFjdInTwo+55u90t6AorrVg70CqwD7hmEV39Rl0keFw+x
         OaiDoiuivlFVNxB1KX+YAGFtHQJ/yNvC2twx9/ut7gdpxYO27WJyCqXK2+Whdd8e13Eg
         bSi1FxIfKIzQ9kmTFSN9cJs/ZDN27H+uL2rl1B9gtAJNbOe7VMBYO3Vpp7g7qrEc0jfX
         c3IANEf1F1rlme/SX+dfBQvrjvddViye8dgghTe6TKJUyCc2J2d/lb55lqgZ7dXcbT5s
         aWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770143224; x=1770748024;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6nfD0iDGQlTrmds7D8QgMt8w2CmNdX8gcS8Au5Qqnqw=;
        b=q6FJSqR35WtMZGJCwDj1ht7wEOzpNRZ+H6opMRF64d9i2Ve0v9u/h3aAiHk0ZZIwAq
         TlhBZIlSkBx5ahtacyB//cwcwY/wPzJJWS3Ax01pqkzqI/5RglV1aTPqaD5z3c1eGc0s
         sTADLz2u0TpMQcmFIFVH9PRE2f+gKdopEE3MvlH5uHvP0z6FLYz8sQqG/105XQonNVxL
         FXzgKI5+e7AeNrJAQ4HpQFJXr6Jd7trmJzEUzHfeLeZZUiD9nCn/zfHoQhxVVGGGuDbh
         INJO9ooF541huHJvfeoD0x2TnxMOa5bmojIkxYBc4G+HlCkW5iyz/cXPpvkBeMI7hBYp
         iW1A==
X-Forwarded-Encrypted: i=1; AJvYcCVkb6ntj6T99YHZ/85wMKW8ZJNKj1Zk72oNc7BgqGIvgpB326Zgd8QDK4D5xDyrmajrRWXbhySIHoEGfg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwsIr0xyDPx+kTC+YvayR1NM1iF4TjlIyLQXRGwDTghfbITyo4L
	8aFQgSahLrWkaUu3JnXfcBckAQZvUEN99PjLA1HmYa3HytX6wIVZEDdjoRNTriw8J9hSfYsiMX1
	abzx1fWt9JA==
X-Received: from dlak15.prod.google.com ([2002:a05:701b:290f:b0:123:2800:6acb])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6713:b0:119:e56b:98ba
 with SMTP id a92af1059eb24-126f47db898mr153926c88.33.1770143223895; Tue, 03
 Feb 2026 10:27:03 -0800 (PST)
Date: Tue,  3 Feb 2026 10:26:35 -0800
In-Reply-To: <aYIOMWb2sijXzSDm@x1>
Mime-Version: 1.0
References: <aYIOMWb2sijXzSDm@x1>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260203182640.3911987-1-irogers@google.com>
Subject: [PATCH v3 0/5] perf Cross platform KVM support
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org
Cc: aditya.b1@linux.ibm.com, adrian.hunter@intel.com, ajones@ventanamicro.com, 
	ak@linux.intel.com, alex@ghiti.fr, alexander.shishkin@linux.intel.com, 
	anup@brainfault.org, aou@eecs.berkeley.edu, ashelat@redhat.com, 
	atrajeev@linux.ibm.com, blakejones@google.com, ctshao@google.com, 
	dapeng1.mi@linux.intel.com, dvyukov@google.com, howardchu95@gmail.com, 
	irogers@google.com, james.clark@linaro.org, john.g.garry@oracle.com, 
	jolsa@kernel.org, leo.yan@linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-riscv@lists.infradead.org, mingo@redhat.com, namhyung@kernel.org, 
	palmer@dabbelt.com, peterz@infradead.org, pjw@kernel.org, 
	shimin.guo@skydio.com, swapnil.sapkal@amd.com, thomas.falcon@intel.com, 
	will@kernel.org, ysk@kzalloc.com, zhouquan@iscas.ac.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_102706_003488_A3BE70AD 
X-CRM114-Status: GOOD (  14.00  )
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

The existing perf kvm code is using the arch directory, which means a
data file can only be processed on the same machine type that it was
recorded. Switch to using the ELF machine of the session at runtime to
set up the KVM support, making it cross-architectural. So that the ELF
machine number is available early in initialization add it to the perf
data file header.

v3: Fix NO_LIBTRACEEVENT=1 build, kvm-stat-loongarch.c for old elf.h
    files and 32-bit build of kvm-stat-s390.c as reported by
    Arnaldo. Drop the first kvm stat live test patch that Arnaldo
    reported as merged.

v2: Wire up the perf data header to have the e_machine and allow early
    initialization of the KVM operations based upon it.
    https://lore.kernel.org/lkml/20260131200224.1296136-1-irogers@google.com/#t

v1: https://lore.kernel.org/lkml/20260128074106.788156-1-irogers@google.com/

Ian Rogers (5):
  perf kvm stat: Remove use of the arch directory
  perf kvm: Wire up e_machine
  perf session: Add e_flags to the e_machine helper
  perf header: Add e_machine/e_flags to the header
  perf thread: Don't require machine to compute the e_machine

 tools/perf/Makefile.config                    |   4 -
 tools/perf/arch/arm64/Makefile                |   1 -
 tools/perf/arch/arm64/util/Build              |   1 -
 tools/perf/arch/loongarch/Makefile            |   1 -
 tools/perf/arch/loongarch/util/Build          |   1 -
 tools/perf/arch/powerpc/Makefile              |   1 -
 tools/perf/arch/powerpc/util/Build            |   1 -
 tools/perf/arch/riscv/Makefile                |   1 -
 tools/perf/arch/riscv/util/Build              |   2 -
 tools/perf/arch/s390/Makefile                 |   1 -
 tools/perf/arch/s390/util/Build               |   1 -
 tools/perf/arch/x86/Makefile                  |   1 -
 tools/perf/arch/x86/util/Build                |   1 -
 tools/perf/builtin-kvm.c                      |  73 +++---
 tools/perf/builtin-report.c                   |   4 +-
 tools/perf/builtin-script.c                   |   6 +-
 tools/perf/util/Build                         |   3 +-
 tools/perf/util/env.h                         |   3 +
 tools/perf/util/evsel.c                       |   6 +-
 tools/perf/util/evsel.h                       |   1 +
 tools/perf/util/header.c                      |  33 +++
 tools/perf/util/header.h                      |   1 +
 tools/perf/util/kvm-stat-arch/Build           |   6 +
 .../kvm-stat-arch}/arm64_exception_types.h    |   0
 .../kvm-stat-arch}/book3s_hcalls.h            |   0
 .../kvm-stat-arch}/book3s_hv_exits.h          |   0
 .../kvm-stat-arch/kvm-stat-arm64.c}           |  43 ++--
 .../kvm-stat-arch/kvm-stat-loongarch.c}       |  49 ++--
 .../kvm-stat-arch/kvm-stat-powerpc.c}         |  61 ++---
 .../kvm-stat-arch/kvm-stat-riscv.c}           |  42 ++--
 .../kvm-stat-arch/kvm-stat-s390.c}            |  40 ++--
 .../kvm-stat-arch/kvm-stat-x86.c}             |  44 ++--
 .../kvm-stat-arch}/riscv_trap_types.h         |   2 +-
 tools/perf/util/kvm-stat.c                    | 215 +++++++++++++++++-
 tools/perf/util/kvm-stat.h                    |  79 +++++--
 .../scripting-engines/trace-event-python.c    |   8 +-
 tools/perf/util/session.c                     |  62 ++++-
 tools/perf/util/session.h                     |   2 +-
 tools/perf/util/thread.c                      |   5 +
 39 files changed, 590 insertions(+), 215 deletions(-)
 create mode 100644 tools/perf/util/kvm-stat-arch/Build
 rename tools/perf/{arch/arm64/util => util/kvm-stat-arch}/arm64_exception_types.h (100%)
 rename tools/perf/{arch/powerpc/util => util/kvm-stat-arch}/book3s_hcalls.h (100%)
 rename tools/perf/{arch/powerpc/util => util/kvm-stat-arch}/book3s_hv_exits.h (100%)
 rename tools/perf/{arch/arm64/util/kvm-stat.c => util/kvm-stat-arch/kvm-stat-arm64.c} (62%)
 rename tools/perf/{arch/loongarch/util/kvm-stat.c => util/kvm-stat-arch/kvm-stat-loongarch.c} (77%)
 rename tools/perf/{arch/powerpc/util/kvm-stat.c => util/kvm-stat-arch/kvm-stat-powerpc.c} (78%)
 rename tools/perf/{arch/riscv/util/kvm-stat.c => util/kvm-stat-arch/kvm-stat-riscv.c} (57%)
 rename tools/perf/{arch/s390/util/kvm-stat.c => util/kvm-stat-arch/kvm-stat-s390.c} (77%)
 rename tools/perf/{arch/x86/util/kvm-stat.c => util/kvm-stat-arch/kvm-stat-x86.c} (88%)
 rename tools/perf/{arch/riscv/util => util/kvm-stat-arch}/riscv_trap_types.h (96%)

-- 
2.53.0.rc2.204.g2597b5adb4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
