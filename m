Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BF2C27C75
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 23:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BQy5VDNXlLpjBr4Gc+vyQzI694SaYCfURTayO4WRujk=; b=BHgljR2khRhyzZ
	OwUFq0EDXf6l9+xgT/T9CtgDweN9HbfTYoO57xPNyO0Dk0dNnCjgWr2LvhT0I4i9GY6eOJIbKJkwc
	6CHvt0Sk1iGGcR9hlL4VXxlqIJnw5AaYY5SVnBqftypo4FBfPlRQDMfh00oXvvrJ1IDVHT/oBqJDc
	h7hssonlg4Bt50JHXsxh98xunqPAsmIwgAMeWYPDWWmTd4yiD3da3/B7FF+1/PZtHdEevballwOG+
	oJzbyhBN50NSlFZx/T12XngcfPREdk69OTj4M2biopJWxZcNa3MV0JXZ5Cm2kKgIy3eBWEfDErFUX
	qqGt9UbyG/biqds1MMWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHtvh-00000000m3w-0z11;
	Thu, 13 Jun 2024 23:32:29 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHtv6-00000000ld9-2IyO
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 23:31:56 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-632588b1bdeso2227317b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jun 2024 16:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718321509; x=1718926309; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tZz9GimlctQ26ar42jVbROZvfuJkuQBTvjgjDoz9ZEU=;
        b=GNIrui3jAQFGUYfZYzp1KQYO97Z7pWi8jYSgNIjreK2j95JXKqbSimhMCMX5909oHc
         WwqCLq/AqlaYCMQh/eY81HeL0YOc0X4kZA2cTT6zsWmANbZHZD5+T4b8St3yNEIDGaOT
         DRBsVaSYq3umxxFe+iNh3kKOisAwMus9yZeHeBAtGnrXKmBFxxmbw2G02nEDYruKaOxB
         klm5UVGAQBLouUfGTMXZZCOdFp4Qpi4xGH/3Iss7HaNpBG0RSaX6yw8MGLbUZSy/H+EZ
         +HQX+quVUknR7Vj5D4vXNv16WiS4xu8v5wrCAaRzP3mqNnkoNQEz9UiK0rjmZnjPLEZH
         F16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718321509; x=1718926309;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tZz9GimlctQ26ar42jVbROZvfuJkuQBTvjgjDoz9ZEU=;
        b=KhkzcTznWHm3E4chJ2kXDJahuIFRdnc+oCLNLhJxjO9KiI8CrjcX5Y2OOpDgTg+Fib
         5jvqdOD9rTAhl4ncmtk1YmOXebA+lLCH0RD8dEmo3BaW/c9DjLBwIGONdeGp8o90A5ew
         87LcwOJBF5rPM5I6e0VenKtZzcQFq6ASOVU7lLMyJNgPQWBQO/YbtwuiQQxv9Lr7sx7/
         C7wkVrryNNx7dRDEmqs9xrdGdfdOtXgoapAKzAVv19r86Y53lN0AvtAkBpmTZP7yir6x
         fROPKbBAuZYHLSlQyC03v34vZOEqoXCaKB/q4CybXLs507Qgh82N5qXDlpHcn0QoJmWI
         cfCg==
X-Forwarded-Encrypted: i=1; AJvYcCWOONWIY8pbTU1qWSK9P+uv7Q442Pw905yyDm9Af14Lc4pLna6IG7YNm1655hlNDwWBWzxjDWARah6EuUZPZ1HE01+zSYCqLks4aHhiAo32
X-Gm-Message-State: AOJu0YyumJ4/LYNI8q4R6XJ/5lJFeX+9EqjBoxU/rMnVtEPYcay83KcA
	Awi+82sr+FUHKs8u+CdfRberDQqrMsBLdvwOATRAy78zqb0Qf1bOCbYq1SoJ0ocPz4F0akwb86g
	7Q7Xsrg==
X-Google-Smtp-Source: AGHT+IGm9OwPtvxK4Uf1mJoxJKk5ylmoXsTWxJwnyTKcDiq1xkFmLpebIRBJ+MmJxZh1CeiVTDFdMwDx3iee
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:96dd:26a6:1493:53c8])
 (user=irogers job=sendgmr) by 2002:a05:690c:6d06:b0:631:d4ea:3748 with SMTP
 id 00721157ae682-63224df69aemr2044937b3.7.1718321508538; Thu, 13 Jun 2024
 16:31:48 -0700 (PDT)
Date: Thu, 13 Jun 2024 16:31:18 -0700
In-Reply-To: <20240613233122.3564730-1-irogers@google.com>
Message-Id: <20240613233122.3564730-5-irogers@google.com>
Mime-Version: 1.0
References: <20240613233122.3564730-1-irogers@google.com>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
Subject: [PATCH v3 4/8] perf test: Make tests its own library
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	Nick Terrell <terrelln@fb.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Kees Cook <keescook@chromium.org>, Andrei Vagin <avagin@google.com>, 
	Athira Jajeev <atrajeev@linux.vnet.ibm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Ze Gao <zegao2021@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org, 
	coresight@lists.linaro.org, rust-for-linux@vger.kernel.org, 
	bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_163152_646668_444BBD4D 
X-CRM114-Status: GOOD (  13.44  )
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

Make the tests code its own library. This is done to avoid compiling
code twice, once for the perf tool and once for the perf python
module.

Signed-off-by: Ian Rogers <irogers@google.com>
Reviewed-by: James Clark <james.clark@arm.com>
---
 tools/perf/Build                    |   3 +-
 tools/perf/Makefile.perf            |  11 ++-
 tools/perf/arch/Build               |   1 +
 tools/perf/arch/arm/Build           |   2 +-
 tools/perf/arch/arm/tests/Build     |   8 +-
 tools/perf/arch/arm64/Build         |   2 +-
 tools/perf/arch/arm64/tests/Build   |   8 +-
 tools/perf/arch/powerpc/Build       |   2 +-
 tools/perf/arch/powerpc/tests/Build |   6 +-
 tools/perf/arch/x86/Build           |   4 +-
 tools/perf/arch/x86/tests/Build     |  20 ++--
 tools/perf/tests/Build              | 140 ++++++++++++++--------------
 tools/perf/tests/workloads/Build    |  12 +--
 13 files changed, 115 insertions(+), 104 deletions(-)

diff --git a/tools/perf/Build b/tools/perf/Build
index 16ed1357202b..fddd45ab35b4 100644
--- a/tools/perf/Build
+++ b/tools/perf/Build
@@ -36,7 +36,7 @@ endif
 perf-$(CONFIG_LIBELF) += builtin-probe.o
 
 perf-y += bench/
-perf-y += tests/
+perf-test-y += tests/
 
 perf-y += perf.o
 
@@ -55,6 +55,7 @@ CFLAGS_builtin-report.o	   += -DDOCDIR="BUILD_STR($(srcdir_SQ)/Documentation)"
 
 perf-y += util/
 perf-y += arch/
+perf-test-y += arch/
 perf-ui-y += ui/
 perf-y += scripts/
 
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 9640c6ae1837..9fa69dd0b472 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -425,6 +425,9 @@ endif
 
 export PERL_PATH
 
+LIBPERF_TEST_IN := $(OUTPUT)perf-test-in.o
+LIBPERF_TEST := $(OUTPUT)libperf-test.a
+
 LIBPERF_UI_IN := $(OUTPUT)perf-ui-in.o
 LIBPERF_UI := $(OUTPUT)libperf-ui.a
 
@@ -435,7 +438,7 @@ PERFLIBS = $(LIBAPI) $(LIBPERF) $(LIBSUBCMD) $(LIBSYMBOL)
 ifdef LIBBPF_STATIC
   PERFLIBS += $(LIBBPF)
 endif
-PERFLIBS += $(LIBPERF_UI) $(LIBPMU_EVENTS)
+PERFLIBS += $(LIBPERF_TEST) $(LIBPERF_UI) $(LIBPMU_EVENTS)
 
 # We choose to avoid "if .. else if .. else .. endif endif"
 # because maintaining the nesting to match is a pain.  If
@@ -737,6 +740,12 @@ $(LIBPMU_EVENTS_IN): FORCE prepare
 $(LIBPMU_EVENTS): $(LIBPMU_EVENTS_IN)
 	$(QUIET_AR)$(RM) $@ && $(AR) rcs $@ $<
 
+$(LIBPERF_TEST_IN): FORCE prepare
+	$(Q)$(MAKE) $(build)=perf-test
+
+$(LIBPERF_TEST): $(LIBPERF_TEST_IN)
+	$(QUIET_AR)$(RM) $@ && $(AR) rcs $@ $<
+
 $(LIBPERF_UI_IN): FORCE prepare
 	$(Q)$(MAKE) $(build)=perf-ui
 
diff --git a/tools/perf/arch/Build b/tools/perf/arch/Build
index 688818844c11..6dd68c17924c 100644
--- a/tools/perf/arch/Build
+++ b/tools/perf/arch/Build
@@ -1,2 +1,3 @@
 perf-y += common.o
 perf-y += $(SRCARCH)/
+perf-test-y += $(SRCARCH)/
diff --git a/tools/perf/arch/arm/Build b/tools/perf/arch/arm/Build
index 36222e64bbf7..6b4fdec52122 100644
--- a/tools/perf/arch/arm/Build
+++ b/tools/perf/arch/arm/Build
@@ -1,2 +1,2 @@
 perf-y += util/
-perf-$(CONFIG_DWARF_UNWIND) += tests/
+perf-test-$(CONFIG_DWARF_UNWIND) += tests/
diff --git a/tools/perf/arch/arm/tests/Build b/tools/perf/arch/arm/tests/Build
index bc8e97380c82..599efa545727 100644
--- a/tools/perf/arch/arm/tests/Build
+++ b/tools/perf/arch/arm/tests/Build
@@ -1,5 +1,5 @@
-perf-y += regs_load.o
-perf-y += dwarf-unwind.o
-perf-y += vectors-page.o
+perf-test-y += regs_load.o
+perf-test-y += dwarf-unwind.o
+perf-test-y += vectors-page.o
 
-perf-y += arch-tests.o
+perf-test-y += arch-tests.o
diff --git a/tools/perf/arch/arm64/Build b/tools/perf/arch/arm64/Build
index a7dd46a5b678..58b2d965ed86 100644
--- a/tools/perf/arch/arm64/Build
+++ b/tools/perf/arch/arm64/Build
@@ -1,2 +1,2 @@
 perf-y += util/
-perf-y += tests/
+perf-test-y += tests/
diff --git a/tools/perf/arch/arm64/tests/Build b/tools/perf/arch/arm64/tests/Build
index e337c09e7f56..d44c9de92d42 100644
--- a/tools/perf/arch/arm64/tests/Build
+++ b/tools/perf/arch/arm64/tests/Build
@@ -1,5 +1,5 @@
-perf-y += regs_load.o
-perf-$(CONFIG_DWARF_UNWIND) += dwarf-unwind.o
+perf-test-y += regs_load.o
+perf-test-$(CONFIG_DWARF_UNWIND) += dwarf-unwind.o
 
-perf-y += arch-tests.o
-perf-y += cpuid-match.o
+perf-test-y += arch-tests.o
+perf-test-y += cpuid-match.o
diff --git a/tools/perf/arch/powerpc/Build b/tools/perf/arch/powerpc/Build
index a7dd46a5b678..58b2d965ed86 100644
--- a/tools/perf/arch/powerpc/Build
+++ b/tools/perf/arch/powerpc/Build
@@ -1,2 +1,2 @@
 perf-y += util/
-perf-y += tests/
+perf-test-y += tests/
diff --git a/tools/perf/arch/powerpc/tests/Build b/tools/perf/arch/powerpc/tests/Build
index 3526ab0af9f9..275026950645 100644
--- a/tools/perf/arch/powerpc/tests/Build
+++ b/tools/perf/arch/powerpc/tests/Build
@@ -1,4 +1,4 @@
-perf-$(CONFIG_DWARF_UNWIND) += regs_load.o
-perf-$(CONFIG_DWARF_UNWIND) += dwarf-unwind.o
+perf-test-$(CONFIG_DWARF_UNWIND) += regs_load.o
+perf-test-$(CONFIG_DWARF_UNWIND) += dwarf-unwind.o
 
-perf-y += arch-tests.o
+perf-test-y += arch-tests.o
diff --git a/tools/perf/arch/x86/Build b/tools/perf/arch/x86/Build
index ed37013b4289..132cf8beaca2 100644
--- a/tools/perf/arch/x86/Build
+++ b/tools/perf/arch/x86/Build
@@ -1,5 +1,5 @@
 perf-y += util/
-perf-y += tests/
+perf-test-y += tests/
 
 ifdef SHELLCHECK
   SHELL_TESTS := entry/syscalls/syscalltbl.sh
@@ -13,4 +13,4 @@ $(OUTPUT)%.shellcheck_log: %
 	$(call rule_mkdir)
 	$(Q)$(call echo-cmd,test)shellcheck -a -S warning "$<" > $@ || (cat $@ && rm $@ && false)
 
-perf-y += $(TEST_LOGS)
+perf-test-y += $(TEST_LOGS)
diff --git a/tools/perf/arch/x86/tests/Build b/tools/perf/arch/x86/tests/Build
index c1e3b7d39554..3227053f3355 100644
--- a/tools/perf/arch/x86/tests/Build
+++ b/tools/perf/arch/x86/tests/Build
@@ -1,15 +1,15 @@
-perf-$(CONFIG_DWARF_UNWIND) += regs_load.o
-perf-$(CONFIG_DWARF_UNWIND) += dwarf-unwind.o
+perf-test-$(CONFIG_DWARF_UNWIND) += regs_load.o
+perf-test-$(CONFIG_DWARF_UNWIND) += dwarf-unwind.o
 
-perf-y += arch-tests.o
-perf-y += sample-parsing.o
-perf-y += hybrid.o
-perf-$(CONFIG_AUXTRACE) += intel-pt-test.o
+perf-test-y += arch-tests.o
+perf-test-y += sample-parsing.o
+perf-test-y += hybrid.o
+perf-test-$(CONFIG_AUXTRACE) += intel-pt-test.o
 ifeq ($(CONFIG_EXTRA_TESTS),y)
-perf-$(CONFIG_AUXTRACE) += insn-x86.o
+perf-test-$(CONFIG_AUXTRACE) += insn-x86.o
 endif
-perf-$(CONFIG_X86_64) += bp-modify.o
-perf-y += amd-ibs-via-core-pmu.o
+perf-test-$(CONFIG_X86_64) += bp-modify.o
+perf-test-y += amd-ibs-via-core-pmu.o
 
 ifdef SHELLCHECK
   SHELL_TESTS := gen-insn-x86-dat.sh
@@ -23,4 +23,4 @@ $(OUTPUT)%.shellcheck_log: %
 	$(call rule_mkdir)
 	$(Q)$(call echo-cmd,test)shellcheck -a -S warning "$<" > $@ || (cat $@ && rm $@ && false)
 
-perf-y += $(TEST_LOGS)
+perf-test-y += $(TEST_LOGS)
diff --git a/tools/perf/tests/Build b/tools/perf/tests/Build
index c7f9d9676095..5671ee530019 100644
--- a/tools/perf/tests/Build
+++ b/tools/perf/tests/Build
@@ -1,82 +1,82 @@
 # SPDX-License-Identifier: GPL-2.0
 
-perf-y += builtin-test.o
-perf-y += tests-scripts.o
-perf-y += parse-events.o
-perf-y += dso-data.o
-perf-y += attr.o
-perf-y += vmlinux-kallsyms.o
-perf-$(CONFIG_LIBTRACEEVENT) += openat-syscall.o
-perf-$(CONFIG_LIBTRACEEVENT) += openat-syscall-all-cpus.o
-perf-$(CONFIG_LIBTRACEEVENT) += openat-syscall-tp-fields.o
-perf-$(CONFIG_LIBTRACEEVENT) += mmap-basic.o
-perf-y += perf-record.o
-perf-y += evsel-roundtrip-name.o
-perf-$(CONFIG_LIBTRACEEVENT) += evsel-tp-sched.o
-perf-y += fdarray.o
-perf-y += pmu.o
-perf-y += pmu-events.o
-perf-y += hists_common.o
-perf-y += hists_link.o
-perf-y += hists_filter.o
-perf-y += hists_output.o
-perf-y += hists_cumulate.o
-perf-y += python-use.o
-perf-y += bp_signal.o
-perf-y += bp_signal_overflow.o
-perf-y += bp_account.o
-perf-y += wp.o
-perf-y += task-exit.o
-perf-y += sw-clock.o
-perf-y += mmap-thread-lookup.o
-perf-y += thread-maps-share.o
-perf-$(CONFIG_LIBTRACEEVENT) += switch-tracking.o
-perf-y += keep-tracking.o
-perf-y += code-reading.o
-perf-y += sample-parsing.o
-perf-y += parse-no-sample-id-all.o
-perf-y += kmod-path.o
-perf-y += thread-map.o
-perf-y += topology.o
-perf-y += mem.o
-perf-y += cpumap.o
-perf-y += stat.o
-perf-y += event_update.o
-perf-y += event-times.o
-perf-y += expr.o
-perf-y += backward-ring-buffer.o
-perf-y += sdt.o
-perf-y += is_printable_array.o
-perf-y += bitmap.o
-perf-y += perf-hooks.o
-perf-y += unit_number__scnprintf.o
-perf-y += mem2node.o
-perf-y += maps.o
-perf-y += time-utils-test.o
-perf-y += genelf.o
-perf-y += api-io.o
-perf-y += demangle-java-test.o
-perf-y += demangle-ocaml-test.o
-perf-y += pfm.o
-perf-y += parse-metric.o
-perf-y += pe-file-parsing.o
-perf-y += expand-cgroup.o
-perf-y += perf-time-to-tsc.o
-perf-y += dlfilter-test.o
-perf-y += sigtrap.o
-perf-y += event_groups.o
-perf-y += symbols.o
-perf-y += util.o
+perf-test-y += builtin-test.o
+perf-test-y += tests-scripts.o
+perf-test-y += parse-events.o
+perf-test-y += dso-data.o
+perf-test-y += attr.o
+perf-test-y += vmlinux-kallsyms.o
+perf-test-$(CONFIG_LIBTRACEEVENT) += openat-syscall.o
+perf-test-$(CONFIG_LIBTRACEEVENT) += openat-syscall-all-cpus.o
+perf-test-$(CONFIG_LIBTRACEEVENT) += openat-syscall-tp-fields.o
+perf-test-$(CONFIG_LIBTRACEEVENT) += mmap-basic.o
+perf-test-y += perf-record.o
+perf-test-y += evsel-roundtrip-name.o
+perf-test-$(CONFIG_LIBTRACEEVENT) += evsel-tp-sched.o
+perf-test-y += fdarray.o
+perf-test-y += pmu.o
+perf-test-y += pmu-events.o
+perf-test-y += hists_common.o
+perf-test-y += hists_link.o
+perf-test-y += hists_filter.o
+perf-test-y += hists_output.o
+perf-test-y += hists_cumulate.o
+perf-test-y += python-use.o
+perf-test-y += bp_signal.o
+perf-test-y += bp_signal_overflow.o
+perf-test-y += bp_account.o
+perf-test-y += wp.o
+perf-test-y += task-exit.o
+perf-test-y += sw-clock.o
+perf-test-y += mmap-thread-lookup.o
+perf-test-y += thread-maps-share.o
+perf-test-$(CONFIG_LIBTRACEEVENT) += switch-tracking.o
+perf-test-y += keep-tracking.o
+perf-test-y += code-reading.o
+perf-test-y += sample-parsing.o
+perf-test-y += parse-no-sample-id-all.o
+perf-test-y += kmod-path.o
+perf-test-y += thread-map.o
+perf-test-y += topology.o
+perf-test-y += mem.o
+perf-test-y += cpumap.o
+perf-test-y += stat.o
+perf-test-y += event_update.o
+perf-test-y += event-times.o
+perf-test-y += expr.o
+perf-test-y += backward-ring-buffer.o
+perf-test-y += sdt.o
+perf-test-y += is_printable_array.o
+perf-test-y += bitmap.o
+perf-test-y += perf-hooks.o
+perf-test-y += unit_number__scnprintf.o
+perf-test-y += mem2node.o
+perf-test-y += maps.o
+perf-test-y += time-utils-test.o
+perf-test-y += genelf.o
+perf-test-y += api-io.o
+perf-test-y += demangle-java-test.o
+perf-test-y += demangle-ocaml-test.o
+perf-test-y += pfm.o
+perf-test-y += parse-metric.o
+perf-test-y += pe-file-parsing.o
+perf-test-y += expand-cgroup.o
+perf-test-y += perf-time-to-tsc.o
+perf-test-y += dlfilter-test.o
+perf-test-y += sigtrap.o
+perf-test-y += event_groups.o
+perf-test-y += symbols.o
+perf-test-y += util.o
 
 ifeq ($(SRCARCH),$(filter $(SRCARCH),x86 arm arm64 powerpc))
-perf-$(CONFIG_DWARF_UNWIND) += dwarf-unwind.o
+perf-test-$(CONFIG_DWARF_UNWIND) += dwarf-unwind.o
 endif
 
 CFLAGS_attr.o         += -DBINDIR="BUILD_STR($(bindir_SQ))" -DPYTHON="BUILD_STR($(PYTHON_WORD))"
 CFLAGS_python-use.o   += -DPYTHONPATH="BUILD_STR($(OUTPUT)python)" -DPYTHON="BUILD_STR($(PYTHON_WORD))"
 CFLAGS_dwarf-unwind.o += -fno-optimize-sibling-calls
 
-perf-y += workloads/
+perf-test-y += workloads/
 
 ifdef SHELLCHECK
   SHELL_TESTS := $(shell find tests/shell -executable -type f -name '*.sh')
@@ -90,4 +90,4 @@ $(OUTPUT)%.shellcheck_log: %
 	$(call rule_mkdir)
 	$(Q)$(call echo-cmd,test)shellcheck -a -S warning "$<" > $@ || (cat $@ && rm $@ && false)
 
-perf-y += $(TEST_LOGS)
+perf-test-y += $(TEST_LOGS)
diff --git a/tools/perf/tests/workloads/Build b/tools/perf/tests/workloads/Build
index a1f34d5861e3..48bf0d3b0f3d 100644
--- a/tools/perf/tests/workloads/Build
+++ b/tools/perf/tests/workloads/Build
@@ -1,11 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0
 
-perf-y += noploop.o
-perf-y += thloop.o
-perf-y += leafloop.o
-perf-y += sqrtloop.o
-perf-y += brstack.o
-perf-y += datasym.o
+perf-test-y += noploop.o
+perf-test-y += thloop.o
+perf-test-y += leafloop.o
+perf-test-y += sqrtloop.o
+perf-test-y += brstack.o
+perf-test-y += datasym.o
 
 CFLAGS_sqrtloop.o         = -g -O0 -fno-inline -U_FORTIFY_SOURCE
 CFLAGS_leafloop.o         = -g -O0 -fno-inline -fno-omit-frame-pointer -U_FORTIFY_SOURCE
-- 
2.45.2.627.g7a2c4fd464-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
