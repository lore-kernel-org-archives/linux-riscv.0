Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F230CFB440
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Oct 2024 21:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FINL7zL8J0xZRK5K2mlJ+39sbtHGtvXGx+UwYpOyeiE=; b=bYCvnpsTQsqz/c
	6fE65mzO67EII4GTVKnYPubpid7IBE6S21VFZjoXhZFJU+VWMYo4dzSTZRJKx2MlN0L2C0SfYDdUY
	Qann4OVJwYv3yxAcSwMLYlVuWPssvfnQDOEsFdBxLnxGD7NI1F05wgcwdoQ3KYo4pL13sodg3HNrj
	NWjOJRY2V5+Fp8a5EnSfYS6fPDASmkaqpIeLVcDel2AKFUc/ghpX9/ngoehRDTBMG4VLwZWsU8T4Y
	N9GBMnKsOGjOynQaJbG2xOBCLiFBiyJvENaXElG113JxhoRF4CGbW+SO03nJz1MitvuFLAl1JOQDv
	tUc7RSpQb07Xg5M2mHRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxC9L-0000000Fxqd-2UsR;
	Sat, 05 Oct 2024 21:17:15 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxAt6-0000000Fq3M-31CS
	for linux-riscv@lists.infradead.org;
	Sat, 05 Oct 2024 19:56:26 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e284982a31so55682887b3.3
        for <linux-riscv@lists.infradead.org>; Sat, 05 Oct 2024 12:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728158183; x=1728762983; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eN4YqIaHUMZV32L2QJLPoP9jsFkxRa+mNTAtqb8Hsas=;
        b=1J33hZDfk0WopVok0POK74bIF/0EQJYVoN5Pz5nrL3dnWPG2Lgz9UIpIPRtzBd2btz
         eLxwmqbM7Q+sN5zApWN7J3gRLpFAXNaAafi67L478v92NHA0KmDC00Sm14U7pxmfV2Y9
         u2U7UwRC+3kH7PLuG//9xgoqD9uwvbz7RwlCxvLj3opKODs9iLCVt8EI96YK3nftDvKd
         xbwqvenbsAXZeTCnBVg+9rclhaB6CQSnpu/HZGxAxwUmFpdJCHlmd3tUlyoszD4FqjPP
         Fpj1VA3gYEs47pn350Xx7r7dNzCk8I9oxM/Gi7slhSTT8xk53YMn9K+bdN4PG9bs6bZh
         qjDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158183; x=1728762983;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eN4YqIaHUMZV32L2QJLPoP9jsFkxRa+mNTAtqb8Hsas=;
        b=wvBHZ3Vehy3QqdIeY8VopZkVPEwkbCr357FyeIB2VbkScRrRUdmoPQ3i6J++tckNm/
         nSugoSVlItVJzGE5PVErI2sx8ixfd3sJAuyexGD/8KjLwD7EciLhsnnT/JezAVGQVKny
         l5jaivZldS9s/SBEUOE5v1qAqbGR62op8iV0Ey1/sTSVPL/W7/guU15lFg4Q1In2j+pM
         qdVmMQKjhVwIbfzzNu03wBurvpWXRrts2LJpwJxpDSNk4AEJGTeMkoegiNp8IdFzdgUK
         L1o93ESJkTu3Kkhg4IKhhiZFppJ4/1AoWVC4YujA069cySp+onLU1ARWzL0phxLuWmmn
         9rDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVs+w+dacvwmUrXuPKM+59BHHoHayG0wELGy8uUsjkK/WpkB5E9i7RkLQrWl7lAYCtlFKLuEOznilEXHw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0d+2FWkl92RMAhXUOsLF4BeoGfYReUPgmx5YEvdgUOQxOMR95
	Hg7n8j8iqyPptCIgrrwNeEEhkLXgotroLe0FDTzc576O8ewk8VpP8atCYjSQVxsu6L/3jX5JHaL
	9YZMh1A==
X-Google-Smtp-Source: AGHT+IE37lPO5ROCWh/CimkZxetVnVk7klOqRJ1yUjeH0eyV1XGJ+pwkxL/0BElgh1N3dpXWOd2oLe3lR4T2
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:4c2:5b4d:8797:7249])
 (user=irogers job=sendgmr) by 2002:a05:690c:4502:b0:68d:52a1:bf4 with SMTP id
 00721157ae682-6e2c6fdd0afmr975947b3.2.1728158183073; Sat, 05 Oct 2024
 12:56:23 -0700 (PDT)
Date: Sat,  5 Oct 2024 12:55:21 -0700
In-Reply-To: <20241005195541.380070-1-irogers@google.com>
Message-Id: <20241005195541.380070-12-irogers@google.com>
Mime-Version: 1.0
References: <20241005195541.380070-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Subject: [PATCH v2 11/31] perf build: Rename CONFIG_DWARF to CONFIG_LIBDW
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nick Terrell <terrelln@fb.com>, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, 
	Guilherme Amadio <amadio@gentoo.org>, Changbin Du <changbin.du@huawei.com>, 
	Daniel Bristot de Oliveira <bristot@kernel.org>, Daniel Wagner <dwagner@suse.de>, 
	Aditya Gupta <adityag@linux.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kajol Jain <kjain@linux.ibm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Bibo Mao <maobibo@loongson.cn>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, 
	Shenlin Liang <liangshenlin@eswincomputing.com>, Oliver Upton <oliver.upton@linux.dev>, 
	"Steinar H. Gunderson" <sesse@google.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Chen Pei <cp0613@linux.alibaba.com>, Dima Kogan <dima@secretsauce.net>, 
	Yury Norov <yury.norov@gmail.com>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241005_125624_802447_1134493F 
X-CRM114-Status: GOOD (  11.74  )
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

In Makefile.config for unwinding the name dwarf implies either
libunwind or libdw. Make it clearer that CONFIG_DWARF is really just
defined when libdw is present by renaming to CONFIG_LIBDW.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.config           |  2 +-
 tools/perf/arch/arm/util/Build       |  2 +-
 tools/perf/arch/arm64/util/Build     |  2 +-
 tools/perf/arch/csky/util/Build      |  2 +-
 tools/perf/arch/loongarch/util/Build |  2 +-
 tools/perf/arch/mips/util/Build      |  2 +-
 tools/perf/arch/powerpc/util/Build   |  4 ++--
 tools/perf/arch/riscv/util/Build     |  2 +-
 tools/perf/arch/s390/util/Build      |  2 +-
 tools/perf/arch/sh/util/Build        |  2 +-
 tools/perf/arch/sparc/util/Build     |  2 +-
 tools/perf/arch/x86/util/Build       |  2 +-
 tools/perf/arch/xtensa/util/Build    |  2 +-
 tools/perf/util/Build                | 12 ++++++------
 14 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 9ed0909db170..b14430ab2898 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -559,7 +559,7 @@ ifndef NO_LIBELF
       CFLAGS += -DHAVE_LIBDW_SUPPORT $(LIBDW_CFLAGS)
       LDFLAGS += $(LIBDW_LDFLAGS)
       EXTLIBS += ${DWARFLIBS}
-      $(call detected,CONFIG_DWARF)
+      $(call detected,CONFIG_LIBDW)
     endif # PERF_HAVE_DWARF_REGS
   endif # NO_LIBDW
 
diff --git a/tools/perf/arch/arm/util/Build b/tools/perf/arch/arm/util/Build
index e6dd7cd79ebd..e06fea1ea8ff 100644
--- a/tools/perf/arch/arm/util/Build
+++ b/tools/perf/arch/arm/util/Build
@@ -1,6 +1,6 @@
 perf-util-y += perf_regs.o
 
-perf-util-$(CONFIG_DWARF) += dwarf-regs.o
+perf-util-$(CONFIG_LIBDW) += dwarf-regs.o
 
 perf-util-$(CONFIG_LOCAL_LIBUNWIND)    += unwind-libunwind.o
 perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
diff --git a/tools/perf/arch/arm64/util/Build b/tools/perf/arch/arm64/util/Build
index 343ef7589a77..4387a6d6a6c3 100644
--- a/tools/perf/arch/arm64/util/Build
+++ b/tools/perf/arch/arm64/util/Build
@@ -4,7 +4,7 @@ perf-util-y += perf_regs.o
 perf-util-y += tsc.o
 perf-util-y += pmu.o
 perf-util-$(CONFIG_LIBTRACEEVENT) += kvm-stat.o
-perf-util-$(CONFIG_DWARF)     += dwarf-regs.o
+perf-util-$(CONFIG_LIBDW)     += dwarf-regs.o
 perf-util-$(CONFIG_LOCAL_LIBUNWIND) += unwind-libunwind.o
 perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
 
diff --git a/tools/perf/arch/csky/util/Build b/tools/perf/arch/csky/util/Build
index 99d83f41bf43..1325310cab6a 100644
--- a/tools/perf/arch/csky/util/Build
+++ b/tools/perf/arch/csky/util/Build
@@ -1,4 +1,4 @@
 perf-util-y += perf_regs.o
 
-perf-util-$(CONFIG_DWARF) += dwarf-regs.o
+perf-util-$(CONFIG_LIBDW) += dwarf-regs.o
 perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
diff --git a/tools/perf/arch/loongarch/util/Build b/tools/perf/arch/loongarch/util/Build
index b6b97de48233..06ff95394921 100644
--- a/tools/perf/arch/loongarch/util/Build
+++ b/tools/perf/arch/loongarch/util/Build
@@ -1,7 +1,7 @@
 perf-util-y += header.o
 perf-util-y += perf_regs.o
 
-perf-util-$(CONFIG_DWARF)     += dwarf-regs.o
+perf-util-$(CONFIG_LIBDW)     += dwarf-regs.o
 perf-util-$(CONFIG_LOCAL_LIBUNWIND) += unwind-libunwind.o
 perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
 perf-util-$(CONFIG_LIBTRACEEVENT) += kvm-stat.o
diff --git a/tools/perf/arch/mips/util/Build b/tools/perf/arch/mips/util/Build
index e4644f1e68a0..b328109fc16c 100644
--- a/tools/perf/arch/mips/util/Build
+++ b/tools/perf/arch/mips/util/Build
@@ -1,3 +1,3 @@
 perf-util-y += perf_regs.o
-perf-util-$(CONFIG_DWARF) += dwarf-regs.o
+perf-util-$(CONFIG_LIBDW) += dwarf-regs.o
 perf-util-$(CONFIG_LOCAL_LIBUNWIND) += unwind-libunwind.o
diff --git a/tools/perf/arch/powerpc/util/Build b/tools/perf/arch/powerpc/util/Build
index 6c588ecdf3bd..3d979480a188 100644
--- a/tools/perf/arch/powerpc/util/Build
+++ b/tools/perf/arch/powerpc/util/Build
@@ -7,8 +7,8 @@ perf-util-y += sym-handling.o
 perf-util-y += evsel.o
 perf-util-y += event.o
 
-perf-util-$(CONFIG_DWARF) += dwarf-regs.o
-perf-util-$(CONFIG_DWARF) += skip-callchain-idx.o
+perf-util-$(CONFIG_LIBDW) += dwarf-regs.o
+perf-util-$(CONFIG_LIBDW) += skip-callchain-idx.o
 
 perf-util-$(CONFIG_LIBUNWIND) += unwind-libunwind.o
 perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
diff --git a/tools/perf/arch/riscv/util/Build b/tools/perf/arch/riscv/util/Build
index f865cb0489ec..8f93091b8345 100644
--- a/tools/perf/arch/riscv/util/Build
+++ b/tools/perf/arch/riscv/util/Build
@@ -2,5 +2,5 @@ perf-util-y += perf_regs.o
 perf-util-y += header.o
 
 perf-util-$(CONFIG_LIBTRACEEVENT) += kvm-stat.o
-perf-util-$(CONFIG_DWARF) += dwarf-regs.o
+perf-util-$(CONFIG_LIBDW) += dwarf-regs.o
 perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
diff --git a/tools/perf/arch/s390/util/Build b/tools/perf/arch/s390/util/Build
index 1ac830030ff3..787410f99bb3 100644
--- a/tools/perf/arch/s390/util/Build
+++ b/tools/perf/arch/s390/util/Build
@@ -2,7 +2,7 @@ perf-util-y += header.o
 perf-util-$(CONFIG_LIBTRACEEVENT) += kvm-stat.o
 perf-util-y += perf_regs.o
 
-perf-util-$(CONFIG_DWARF) += dwarf-regs.o
+perf-util-$(CONFIG_LIBDW) += dwarf-regs.o
 perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
 
 perf-util-y += machine.o
diff --git a/tools/perf/arch/sh/util/Build b/tools/perf/arch/sh/util/Build
index 32f44fc4ab98..2337a0b710a2 100644
--- a/tools/perf/arch/sh/util/Build
+++ b/tools/perf/arch/sh/util/Build
@@ -1 +1 @@
-perf-util-$(CONFIG_DWARF) += dwarf-regs.o
+perf-util-$(CONFIG_LIBDW) += dwarf-regs.o
diff --git a/tools/perf/arch/sparc/util/Build b/tools/perf/arch/sparc/util/Build
index 32f44fc4ab98..2337a0b710a2 100644
--- a/tools/perf/arch/sparc/util/Build
+++ b/tools/perf/arch/sparc/util/Build
@@ -1 +1 @@
-perf-util-$(CONFIG_DWARF) += dwarf-regs.o
+perf-util-$(CONFIG_LIBDW) += dwarf-regs.o
diff --git a/tools/perf/arch/x86/util/Build b/tools/perf/arch/x86/util/Build
index 2607ed5c4296..9705cda4f240 100644
--- a/tools/perf/arch/x86/util/Build
+++ b/tools/perf/arch/x86/util/Build
@@ -12,7 +12,7 @@ perf-util-y += evsel.o
 perf-util-y += iostat.o
 perf-util-y += env.o
 
-perf-util-$(CONFIG_DWARF) += dwarf-regs.o
+perf-util-$(CONFIG_LIBDW) += dwarf-regs.o
 perf-util-$(CONFIG_BPF_PROLOGUE) += dwarf-regs.o
 
 perf-util-$(CONFIG_LOCAL_LIBUNWIND)    += unwind-libunwind.o
diff --git a/tools/perf/arch/xtensa/util/Build b/tools/perf/arch/xtensa/util/Build
index e813e618954b..2d1a48696ad9 100644
--- a/tools/perf/arch/xtensa/util/Build
+++ b/tools/perf/arch/xtensa/util/Build
@@ -1 +1 @@
-perf-$(CONFIG_DWARF) += dwarf-regs.o
+perf-$(CONFIG_LIBDW) += dwarf-regs.o
diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index dc616292b2dd..1d08608b7e1b 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -199,11 +199,11 @@ ifndef CONFIG_SETNS
 perf-util-y += setns.o
 endif
 
-perf-util-$(CONFIG_DWARF) += probe-finder.o
-perf-util-$(CONFIG_DWARF) += dwarf-aux.o
-perf-util-$(CONFIG_DWARF) += dwarf-regs.o
-perf-util-$(CONFIG_DWARF) += debuginfo.o
-perf-util-$(CONFIG_DWARF) += annotate-data.o
+perf-util-$(CONFIG_LIBDW) += probe-finder.o
+perf-util-$(CONFIG_LIBDW) += dwarf-aux.o
+perf-util-$(CONFIG_LIBDW) += dwarf-regs.o
+perf-util-$(CONFIG_LIBDW) += debuginfo.o
+perf-util-$(CONFIG_LIBDW) += annotate-data.o
 
 perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
 perf-util-$(CONFIG_LOCAL_LIBUNWIND)    += unwind-libunwind-local.o
@@ -234,7 +234,7 @@ perf-util-$(CONFIG_LIBLLVM) += llvm-c-helpers.o
 ifdef CONFIG_JITDUMP
 perf-util-$(CONFIG_LIBELF) += jitdump.o
 perf-util-$(CONFIG_LIBELF) += genelf.o
-perf-util-$(CONFIG_DWARF) += genelf_debug.o
+perf-util-$(CONFIG_LIBDW) += genelf_debug.o
 endif
 
 perf-util-y += perf-hooks.o
-- 
2.47.0.rc0.187.ge670bccf7e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
