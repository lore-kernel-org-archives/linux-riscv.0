Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACA9D4A5F5
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jan 2026 05:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=taGK9vtWxEUbCvxXsajQIB7Hjeq6C13ymb6jZRpAKdg=; b=ZVUeuB3aYTLCas
	400jEt0T4RS4PBVhUf6qsoj39QqG0cg5R12YkjKzMAWFBzsZjF+VWkj9Gqu+heDvNMwDyikxaWFI3
	RcKQBhba9DF32niYG8t5SGBAIui2bzxflV2sKeOs0h/1x54i+Ol7c2Ff60TNgNuwdmoDvCaCMmJJS
	XUio+eygOyufNYodxunDGQGlhj+WQmlC7U9u/37jBm/8/ikx5yAl47DzyL2yi03a92d5FgEvXn4jx
	c3+SCcgC8JrxWdAj/K8O7iw8PeaYatszOXUy9ak3NX1HhIhZVw6Ox8tSB1gY+FUwQZuh10qBniQ6R
	cXUIi9WWMqbyGm7XdIhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgytu-0000000FGG7-1lVd;
	Sat, 17 Jan 2026 05:31:06 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgysw-0000000FF48-0Sgw
	for linux-riscv@bombadil.infradead.org;
	Sat, 17 Jan 2026 05:30:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=w/cI6wzc88dPba4Z3EWyEhx9YKJRNqyLJPumk+e8HfU=; b=SIu4r9EcRkrVpdUI4BpUS+OQr0
	/A7d8cCH9lVH+g1M/C+mWdTYmRegeQ8ZQbOCUDpqlEE/fOxxlO169toRrXYdCkuaJsE1SXWJuiQ69
	JBCOny4d73JiX74qB3m6V7wucwsZABx5BfjaOnLHmbNGrrnlGMN4tw5Mf/bDJSuzNf4tqbyIM+oSe
	5QK+gS4Sci5GzVLgcxn8uqvQ2hK/vsGFzbHiRU4/Ojes+CvsVrm+BN43tpJhK5k1I/+qUdVTXJAEN
	ThDl6Vs3dIzX4yzpSlNCp6OY3YF3LK+reRQLLk5mHJKgU3TLGHPHSRSxW7gcDDPNpGLHN+15R/gSI
	Hcwtb24A==;
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgyss-0000000ALc6-1ay0
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jan 2026 05:30:04 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2b6a8afb513so3064657eec.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 21:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768627799; x=1769232599; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w/cI6wzc88dPba4Z3EWyEhx9YKJRNqyLJPumk+e8HfU=;
        b=kFfcMLa4xETPIU7FwTNusi/PFYhaXvixvszeOb45mwzdsWEtDzyZy1pPJmkh7IRdgj
         +KvT0pI25E5jhPj5+5lugnUdAX/HOHbKgRwYBXMrvw4kGZb85RdJHJs3MSxGOzuX/wJN
         0v+Lv8mNNxNIRRURRhFP+MX1H4Sa8TA49vJb47EMHQLruPYYkpmGGXQlFt441mgYHSkI
         pSbhso5tAvaR2L3VvB1V0pDqbRsNzWFuab5in/X53Si5rUD0rANVUPCDUCjDakiuPCeo
         gUEGbigZZL6kPdyQzmMKrQL3jCjiAajo40Q2rfRMI+vfbt5vDeM4YzK+P7WW8a5LjK9A
         OUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768627799; x=1769232599;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w/cI6wzc88dPba4Z3EWyEhx9YKJRNqyLJPumk+e8HfU=;
        b=bPntpGxWO7XiroWsxPmuxXogksM7DdMlmPozyuxIPkqEmc17HogFcgSK6uZqDmb3Ex
         GiJd+xcVOPgHcLRrBlA5KCV8GIU2JBuYpXw7IkMcl8LUKr4P4Qv8uOgiSLqTdS1ui6/0
         Ig2K4Q+znhj9ArsuRxkiVuMwjSduOzSCNmQqBbpwahQ3hf2xsidIOcWqot3exqjPYalY
         cvX+c7HcksV0w+91Re5yfLZtVe34kV4iu6s+y9oVu06BsR7/no/1LRy+TUVmkdZe11vE
         DF2udK16PdYhZoBeYRyb2Gtf8jpqSU6jK63VIjWwCrhr69J1GgZWTlIisp2yS8J0VbLn
         fiYg==
X-Forwarded-Encrypted: i=1; AJvYcCWJqDA0kk9uz9WN00v2l9Tmg/4DKfKo7O6EhUWIW9Xn6zTLkhLekGNCDrURHYvvb0TCqJKQp8/l+FeKpQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXv6OQ7/p8PeGjP5v7TAcTpdAwh0WxVL1t8swq0sB+gwFtrmFH
	NbnHdE8XrM8lNUHhG8mKu+JSrqED6Q741Gn7lA4oxAeLO1ji53Yp8SbIBscRspENARQC/Uvg3EA
	EC0+d8d/ivg==
X-Received: from dybmj1.prod.google.com ([2002:a05:7301:e01:b0:2ac:3545:743c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:6d1f:b0:2b0:4e86:8157
 with SMTP id 5a478bee46e88-2b6b46eb100mr4487390eec.17.1768627798660; Fri, 16
 Jan 2026 21:29:58 -0800 (PST)
Date: Fri, 16 Jan 2026 21:28:47 -0800
In-Reply-To: <20260117052849.2205545-1-irogers@google.com>
Mime-Version: 1.0
References: <20260117052849.2205545-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260117052849.2205545-22-irogers@google.com>
Subject: [PATCH v1 21/23] perf build: Remove NO_LIBDW_DWARF_UNWIND option
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
X-CRM114-CacheID: sfid-20260117_053002_443305_AFFE9475 
X-CRM114-Status: GOOD (  10.69  )
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

Libdw unwinding support is present for every architecture that has a
perf_regs.h - perf registers are needed for the initial frame to
unwind. Elfutils also supports sparc, arc and m68k but there is no
support in the Linux kernel for perf registers on these
architectures. As the perf supported dwarf unwinding architectures are
a subset of the elfutils ones, remove NO_LIBDW_DWARF_UNWIND as there
isn't a case of elfutils lacking the support need for perf.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.config | 19 +------------------
 tools/perf/tests/make      |  3 +--
 tools/perf/util/Build      |  3 +--
 3 files changed, 3 insertions(+), 22 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 6f2c7bd36e74..5e4ae775987f 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -118,14 +118,6 @@ ifeq ($(ARCH),mips)
   endif
 endif
 
-# So far there's only x86 and arm libdw unwind support merged in perf.
-# Disable it on all other architectures in case libdw unwind
-# support is detected in system. Add supported architectures
-# to the check.
-ifneq ($(SRCARCH),$(filter $(SRCARCH),x86 arm arm64 powerpc s390 csky riscv loongarch))
-  NO_LIBDW_DWARF_UNWIND := 1
-endif
-
 ifneq ($(LIBUNWIND),1)
   NO_LIBUNWIND := 1
 endif
@@ -456,7 +448,6 @@ endif
 ifdef NO_LIBELF
   NO_LIBDW := 1
   NO_LIBUNWIND := 1
-  NO_LIBDW_DWARF_UNWIND := 1
   NO_LIBBPF := 1
   NO_JVMTI := 1
 else
@@ -504,10 +495,6 @@ ifeq ($(feature-libaio), 1)
   endif
 endif
 
-ifdef NO_LIBDW
-  NO_LIBDW_DWARF_UNWIND := 1
-endif
-
 ifeq ($(feature-scandirat), 1)
   # Ignore having scandirat with memory sanitizer that lacks an interceptor.
   ifeq ($(filter s% -fsanitize=memory%,$(EXTRA_CFLAGS),),)
@@ -757,7 +744,7 @@ dwarf-post-unwind-text := BUG
 
 # setup DWARF post unwinder
 ifdef NO_LIBUNWIND
-  ifdef NO_LIBDW_DWARF_UNWIND
+  ifdef NO_LIBDW
     $(warning Disabling post unwind, no support found.)
     dwarf-post-unwind := 0
   else
@@ -767,10 +754,6 @@ ifdef NO_LIBUNWIND
 else
   dwarf-post-unwind-text := libunwind
   $(call detected,CONFIG_LIBUNWIND)
-  # Enable libunwind support by default.
-  ifndef NO_LIBDW_DWARF_UNWIND
-    NO_LIBDW_DWARF_UNWIND := 1
-  endif
 endif
 
 ifeq ($(dwarf-post-unwind),1)
diff --git a/tools/perf/tests/make b/tools/perf/tests/make
index 36411b4b6d2b..767ad9e147a8 100644
--- a/tools/perf/tests/make
+++ b/tools/perf/tests/make
@@ -83,7 +83,6 @@ make_no_demangle    := NO_DEMANGLE=1
 make_no_libelf      := NO_LIBELF=1
 make_no_libdw       := NO_LIBDW=1
 make_libunwind      := LIBUNWIND=1
-make_no_libdw_dwarf_unwind := NO_LIBDW_DWARF_UNWIND=1
 make_no_backtrace   := NO_BACKTRACE=1
 make_no_libcapstone := NO_CAPSTONE=1
 make_no_libnuma     := NO_LIBNUMA=1
@@ -120,7 +119,7 @@ make_static         := LDFLAGS=-static NO_PERF_READ_VDSO32=1 NO_PERF_READ_VDSOX3
 make_minimal        := NO_LIBPYTHON=1 NO_GTK2=1
 make_minimal        += NO_DEMANGLE=1 NO_LIBELF=1 NO_BACKTRACE=1
 make_minimal        += NO_LIBNUMA=1 NO_LIBBIONIC=1 NO_LIBDW=1
-make_minimal        += NO_LIBDW_DWARF_UNWIND=1 NO_LIBBPF=1
+make_minimal        += NO_LIBBPF=1
 make_minimal        += NO_SDT=1 NO_JVMTI=1 NO_LIBZSTD=1
 make_minimal        += NO_LIBCAP=1 NO_CAPSTONE=1
 
diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index 3cb1edd263cf..c30ff257f8b4 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -223,9 +223,8 @@ perf-util-$(CONFIG_LIBDW) += dwarf-regs-arch/
 perf-util-$(CONFIG_LIBDW) += debuginfo.o
 perf-util-$(CONFIG_LIBDW) += annotate-data.o
 perf-util-$(CONFIG_LIBDW) += libdw.o
+perf-util-$(CONFIG_LIBDW) += unwind-libdw.o
 
-perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
-perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw-arch/
 perf-util-$(CONFIG_LOCAL_LIBUNWIND)    += unwind-libunwind-local.o
 perf-util-$(CONFIG_LIBUNWIND)          += unwind-libunwind.o
 perf-util-$(CONFIG_LIBUNWIND_X86)      += libunwind/x86_32.o
-- 
2.52.0.457.g6b5491de43-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
