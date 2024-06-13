Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7C1C27C6E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 18:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V/kpGWnzSj08M0eS2UZ+9iezKaMPSRzfgemhRYU3g18=; b=St8V/FC1t9+8Vv
	fHvNX4jBFjlXYeZLFvF+qwRM9KR8fqTe5ozLMHqoa5BvNA+8ratJMkXNZqJJB40Bm0Vxdv11+c5QB
	1Gc/pdfqkZJF1530RAGBIrbjnE7j8h5UqMoGM0DASQuMkcEC+pb2cqHB2E1xNfK5xUxtT3tfNKkLl
	9cx+P+JEqP1JgD4/MnhuOFHs93jp6St61GM0yNKWPoH2jiE7a5xAzQSnMJbgT/iwMaZHjgxuf3thx
	9jIxOZn1WHQVGhS4gKU5uj1N/Luv8FYPuqq12nNRAZuQTG3+4MUCwC2NySk6bf/43bdr71ta3B6X7
	1edAmZ/R4UQifU6q+8Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHpFe-00000000631-46KM;
	Thu, 13 Jun 2024 18:32:47 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHpFW-000000005vn-47rT
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 18:32:40 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-62fd1655e12so27174257b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jun 2024 11:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718303555; x=1718908355; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qbSOB/P6de3ygMIG7fdBTW+eS92Yyh1ZhXc/HewO9bA=;
        b=fpPg/e5uV2NKQP9CmCPdEMIxU11LQLCMYvl3RaxkrBf4NFLapcLcMYxrqNmxWqclqK
         bNtQiQFNWihdAZY3yI6m75GRJk3U1/BBLgXKNDygw94/XDHH5VGYjlNWkjVUyha3GFVo
         gE9du+erFBiYF93whZSHCLLMbbgfYequBZtvvECE8O5b5z5gvTBjgzQGhphlKXWXnwO+
         IJCaJJw4ViTjAbjs90qHq9+LlgEZ7sGlW/urtIsYS2qDxKr+uAb1jCgw6IXFbwCcKk/E
         C3IAkU1fg6u2DI7FQ/5u925YfdJKhe42uxpn2CSYNnUxSwv1NyNqeRyrPcoBNxkLZEwr
         PHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718303555; x=1718908355;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qbSOB/P6de3ygMIG7fdBTW+eS92Yyh1ZhXc/HewO9bA=;
        b=CahSs6xDHDcQLeupizJNH/o0GcbEMwenvwxAbkB1ujEdTyys/zDrR6iqxqXfqLvDyw
         NHbELPAtA70JF6HLbJPNeZVWekg2P+Rlh1+nuGumqcibIZpdHpZGWXPZEtYmLSJmxtsi
         MstuQMfMdgHEEyNHoN8D9uvmxU7bk71VrmqV2eCawqpBEwi9CVtmdoWMGI60vaPZ7NF8
         sMfwD0a7fQuboUFN0kbnhjV1KNnEd3RqGawjtS8ZhmWshrOCZ8M/qKhbMKdPcY5hXqlx
         cHQf/kBRxBp452xX+cQHIqRXeJyAIy+zrp5fHyd9SCQTYlr9/Ri5OlQbwF0jOxa0xJmi
         N4Mw==
X-Forwarded-Encrypted: i=1; AJvYcCUdRLruJcPmo4xZoYd8at+9vdfvps0SkPBfn+LjZ/qA9ecFjNL8EGP8WdzHCQsqSzMtjcWjEwPabf2Hnt9ny0UF4SKRfCXHKlFzlWfvurru
X-Gm-Message-State: AOJu0YzFSHPXM8g46OcqnqxRrehMrqF2Y3Xy5mhArVL7s7qDV8L7jkLq
	BDwEFAS9KyyhNIWuBGeX9Bcm29Gh9wSWpDZkc7F3u8Pn2IhAAGzWYYiHDvTL8zoXcCa52pW+v4+
	H/N/ByA==
X-Google-Smtp-Source: AGHT+IHR1scoIW55qliDELzglhq+h7GtaX1D0jX494oPWXs5CmbGdmJdYrWJGCRevzbvrgaTOluk5cR4Bd5S
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:96dd:26a6:1493:53c8])
 (user=irogers job=sendgmr) by 2002:a05:690c:6c8d:b0:62c:f6fd:5414 with SMTP
 id 00721157ae682-6322265d4e6mr673687b3.3.1718303554917; Thu, 13 Jun 2024
 11:32:34 -0700 (PDT)
Date: Thu, 13 Jun 2024 11:32:17 -0700
In-Reply-To: <20240613183224.3399628-1-irogers@google.com>
Message-Id: <20240613183224.3399628-2-irogers@google.com>
Mime-Version: 1.0
References: <20240613183224.3399628-1-irogers@google.com>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
Subject: [PATCH v2 1/8] perf build: Add '*.a' to clean targets
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
X-CRM114-CacheID: sfid-20240613_113239_063827_257C9677 
X-CRM114-Status: GOOD (  10.17  )
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

Fix some excessively long lines by deploying '\'.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.perf | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 5c35c0d89306..acc41a6717db 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -1201,12 +1201,19 @@ endif # CONFIG_PERF_BPF_SKEL
 bpf-skel-clean:
 	$(call QUIET_CLEAN, bpf-skel) $(RM) -r $(SKEL_TMP_OUT) $(SKELETONS) $(SKEL_OUT)/vmlinux.h
 
-clean:: $(LIBAPI)-clean $(LIBBPF)-clean $(LIBSUBCMD)-clean $(LIBSYMBOL)-clean $(LIBPERF)-clean arm64-sysreg-defs-clean fixdep-clean python-clean bpf-skel-clean tests-coresight-targets-clean
-	$(call QUIET_CLEAN, core-objs)  $(RM) $(LIBPERF_A) $(OUTPUT)perf-archive $(OUTPUT)perf-iostat $(LANG_BINDINGS)
-	$(Q)find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '\.*.cmd' -delete -o -name '\.*.d' -delete -o -name '*.shellcheck_log' -delete
+clean:: $(LIBAPI)-clean $(LIBBPF)-clean $(LIBSUBCMD)-clean $(LIBSYMBOL)-clean $(LIBPERF)-clean \
+		arm64-sysreg-defs-clean fixdep-clean python-clean bpf-skel-clean \
+		tests-coresight-targets-clean
+	$(call QUIET_CLEAN, core-objs)  $(RM) $(LIBPERF_A) $(OUTPUT)perf-archive \
+		$(OUTPUT)perf-iostat $(LANG_BINDINGS)
+	$(Q)find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '*.a' -delete -o \
+		-name '\.*.cmd' -delete -o -name '\.*.d' -delete -o -name '*.shellcheck_log' -delete
 	$(Q)$(RM) $(OUTPUT).config-detected
-	$(call QUIET_CLEAN, core-progs) $(RM) $(ALL_PROGRAMS) perf perf-read-vdso32 perf-read-vdsox32 $(OUTPUT)$(LIBJVMTI).so
-	$(call QUIET_CLEAN, core-gen)   $(RM)  *.spec *.pyc *.pyo */*.pyc */*.pyo $(OUTPUT)common-cmds.h TAGS tags cscope* $(OUTPUT)PERF-VERSION-FILE $(OUTPUT)FEATURE-DUMP $(OUTPUT)util/*-bison* $(OUTPUT)util/*-flex* \
+	$(call QUIET_CLEAN, core-progs) $(RM) $(ALL_PROGRAMS) perf perf-read-vdso32 \
+		perf-read-vdsox32 $(OUTPUT)$(LIBJVMTI).so
+	$(call QUIET_CLEAN, core-gen)   $(RM)  *.spec *.pyc *.pyo */*.pyc */*.pyo \
+		$(OUTPUT)common-cmds.h TAGS tags cscope* $(OUTPUT)PERF-VERSION-FILE \
+		$(OUTPUT)FEATURE-DUMP $(OUTPUT)util/*-bison* $(OUTPUT)util/*-flex* \
 		$(OUTPUT)util/intel-pt-decoder/inat-tables.c \
 		$(OUTPUT)tests/llvm-src-{base,kbuild,prologue,relocation}.c \
 		$(OUTPUT)pmu-events/pmu-events.c \
-- 
2.45.2.627.g7a2c4fd464-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
