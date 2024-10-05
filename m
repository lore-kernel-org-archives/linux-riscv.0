Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71433CFB42C
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Oct 2024 19:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J8WBQoc4ZufznCsvUqGshjAMM2HLXjbTOW2WW6UnbwI=; b=QcWw9QQjstpjDt
	QhzqUK9rNDGI6T29eGdRHFrlwS3OVsC8U2dg9W4U/vMqtmqReGGZwu7IVUpuYZNVz6Tw2djtGOssK
	uPmsJWi874QgH2b8xY6K4g1ODxymMJfDQMFYBl/sC7HNTUzEJJHSB67Hfs6fIp+3iC7EFoR1BkUUU
	p5ENsMHSriH0MFrGZjUB8ILjMbWD6lDjs9oi86Rm67Rkqa3cJbEq0rk+oLcn6wYLgvn8XwN3wz6ef
	NNhYTbLKBBqXpuSMpfVo7XV0FBSVIwVwTlOGCiX7qFfRKU/l2XSglZcpo6arHpMM/8pNOh5WCxgYi
	Ekj9HMthzE3/m7L7Ds5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxAuG-0000000FqYo-1Pkx;
	Sat, 05 Oct 2024 19:57:36 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxAsk-0000000Fpnv-3lVI
	for linux-riscv@lists.infradead.org;
	Sat, 05 Oct 2024 19:56:04 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e2605ce4276so5649812276.3
        for <linux-riscv@lists.infradead.org>; Sat, 05 Oct 2024 12:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728158161; x=1728762961; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=51NaLIW8tkOJtUxwqHcUszT78OCapOaZVU3wITST3Jk=;
        b=y0rewIA5q0gnwt3pQmeHm13MFOhbsdSnPyvkyWQ2ecyjeBWFHwISzxJ55Yc/a82SWY
         OhzY+sgFTIoFXywMK6dP6RzTEcIcxxIx2j/6AdDsVNnOA2CzaEH3o26bD9kkx/rVLAY7
         9FGQSafgv3Ehj5IFEK2YXjRSF4rV7togbw+HidiQujaueGCoZOpJn0feS2sXwt+opS+5
         rtqVJ7Mysg4HuOZtQXwWT48X2dU7qFpejLIFw67CcQXZNGllNk3x/11Iyy3phkzChEpf
         Meuw0G5zuCDNuqMSOBYyx9qPeSCX4D+tarB93zX8WPx222wPb677imgNdJaoRQBRZV/D
         cW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158161; x=1728762961;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=51NaLIW8tkOJtUxwqHcUszT78OCapOaZVU3wITST3Jk=;
        b=rgqXEy01slRqHZrGWIbTdj0f0D5kZ1EXjZRSdSeBZOl0Oe7XbChpgNPOo/wPhs6C4V
         DJddK6dd9eS2Uv0UcHRXU24F3v0RRRNNARGM0uZghLH/dew8CJfgBGjOiKqmazaLuNLU
         bdbk7NV8ohkthb2tGDm+k7biRypbfu3QpJQ1aI1jSzYrBQPPV62LRrrkXL8Vjt8SUoW1
         x7F6cMsYBIreQ1lyTLD/G3685Fji6/4YwZWdtBjFD3EJZaz/4TAse+QtEn47AR6QzuDH
         GxP3blGl4iOq5Ar5RGRuNu3xzZHoj1PqOshlRCz/29zffwy2gJ9F16yPXTZv56OWYurL
         +qCA==
X-Forwarded-Encrypted: i=1; AJvYcCXjbQIS3DodIk4VQuuTQcc0uyF3SM+1fDdXswHA8lpn/sNEKvRshaGrnE+qGYqgC/u7Mbtu+TK25zhAsw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxH0gwTKg8QsUD2/vaGqATPRo+HfQ2AcDFuUS7Mx8upEB6MHrLJ
	6jY1jRXWdwcvoD4wOFMySsj/6aHnTOBzxtojWLQ9KEbZ8rYX8xk/DZ1Gi6NsFXJCHNgO5e6huJr
	/kVuPlA==
X-Google-Smtp-Source: AGHT+IFpB52T3N6GTujE7GYOdQ2rq5N60dCtmqvE7W4eZxrgo/OkvusaceR/GdwO/vSP+j8IGglTUnlNtHZl
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:4c2:5b4d:8797:7249])
 (user=irogers job=sendgmr) by 2002:a25:ce0b:0:b0:e25:c8fc:b78c with SMTP id
 3f1490d57ef6-e289393997bmr4258276.9.1728158160211; Sat, 05 Oct 2024 12:56:00
 -0700 (PDT)
Date: Sat,  5 Oct 2024 12:55:11 -0700
In-Reply-To: <20241005195541.380070-1-irogers@google.com>
Message-Id: <20241005195541.380070-2-irogers@google.com>
Mime-Version: 1.0
References: <20241005195541.380070-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Subject: [PATCH v2 01/31] perf build: Fix !HAVE_DWARF_GETLOCATIONS_SUPPORT
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
X-CRM114-CacheID: sfid-20241005_125602_961680_950BD0E7 
X-CRM114-Status: GOOD (  10.55  )
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

Testing with a LIBDW_DIR showed some issues. In dwarf-aux.h if
HAVE_DWARF_GETLOCATIONS_SUPPORT isn't defined then the code uses an
undefined errno value, so add errno.h.
In Makefile.config the dwarf feature tests need the LIBDW_DIR setting
in the CFLAGS/LDFLAGS.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.config  | 6 ++++++
 tools/perf/util/dwarf-aux.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 4dcf7a0fd235..5e26d3a91b36 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -159,8 +159,14 @@ ifeq ($(findstring -static,${LDFLAGS}),-static)
     DWARFLIBS += -lebl
   endif
 endif
+FEATURE_CHECK_CFLAGS-dwarf := $(LIBDW_CFLAGS)
+FEATURE_CHECK_LDFLAGS-dwarf := $(LIBDW_LDFLAGS) $(DWARFLIBS)
 FEATURE_CHECK_CFLAGS-libdw-dwarf-unwind := $(LIBDW_CFLAGS)
 FEATURE_CHECK_LDFLAGS-libdw-dwarf-unwind := $(LIBDW_LDFLAGS) $(DWARFLIBS)
+FEATURE_CHECK_CFLAGS-dwarf_getlocations := $(LIBDW_CFLAGS)
+FEATURE_CHECK_LDFLAGS-dwarf_getlocations := $(LIBDW_LDFLAGS) $(DWARFLIBS)
+FEATURE_CHECK_CFLAGS-dwarf_getcfi := $(LIBDW_CFLAGS)
+FEATURE_CHECK_LDFLAGS-dwarf_getcfi := $(LIBDW_LDFLAGS) $(DWARFLIBS)
 
 # for linking with debug library, run like:
 # make DEBUG=1 LIBBABELTRACE_DIR=/opt/libbabeltrace/
diff --git a/tools/perf/util/dwarf-aux.h b/tools/perf/util/dwarf-aux.h
index 336a3a183a78..925a9bb9fb15 100644
--- a/tools/perf/util/dwarf-aux.h
+++ b/tools/perf/util/dwarf-aux.h
@@ -177,6 +177,7 @@ void die_collect_vars(Dwarf_Die *sc_die, struct die_var_type **var_types);
 void die_collect_global_vars(Dwarf_Die *cu_die, struct die_var_type **var_types);
 
 #else /*  HAVE_DWARF_GETLOCATIONS_SUPPORT */
+#include <errno.h>
 
 static inline int die_get_var_range(Dwarf_Die *sp_die __maybe_unused,
 				    Dwarf_Die *vr_die __maybe_unused,
-- 
2.47.0.rc0.187.ge670bccf7e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
