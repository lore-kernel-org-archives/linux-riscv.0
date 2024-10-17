Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D604FD2F7D8
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 00:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LQEy3pDUcTWvV1UWH+5RGklVwvcXTzxW3Ns0AkWT/ks=; b=hp0C+ND20dRS/B
	liyq+3PMBJkw4dD++Sq3iyc69AvtINOyihq9DYrGJ5wNmMMMGPeomhnvTdImMQ2sICqrlAXR2YN9U
	YWrbNHmTS6kvIRVUxlA9GZ7QF1zJtjSKTgEM1eDFh/4AdNFxb8UyF+zSui2mxwxwzkwwaV3d8rgYv
	VcutAwoAZkIat395v6InpUhO4Yg+7eNav9X69N08t2GJWHBj5nfU1MI+FF6io/K+TLQ+57zc64lvj
	ysWVJOUeRWmimnNzUHvYbCDL6ADwiXlUMoOjhmXhmtqYAMsYXx7yK7F6fAEXkIMHhMS//9mlij2wE
	XU2ekNklsYWhpAiwExWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1EbN-0000000DNWq-2x9g;
	Thu, 17 Oct 2024 00:42:53 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1E9q-0000000DIIJ-2ybT
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 00:14:28 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e035949cc4eso546581276.1
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 17:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729124065; x=1729728865; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GcB5GtP5PER7P0fAo7i/I4FfsUt0WnKPhI2an5P5bXU=;
        b=dDSVhjbv4smt8OXeyKMI/4C9EM6mHoKP/LYzl1IpkzZ9lL1HE1mjczSeFZDjz1wb/D
         362w2zz9OpvNohd8Srs9SvvujNWdi9wXhyG1Wq/7Ci7E0RAWkHpKG061PDMchz/drchu
         iANmE8fextlPoCou0sE3gXsxMsaQPtl+d+WZzwWnUUJAq+fc8iXtM4UZp4v2WcDhWseV
         XcOCyng1vZi5xz/6sdqxUoTS3kYQXT3SyUc9tkERN8xKOne4Kog7LqzL3Q5rt+ehIJB9
         UlIg2mA1RdsFxZ9kIYuCsavC0z9VWssEOvLl5XRZekeKYTw7ESUxpUO5MkPsJ86xPJ3m
         PK2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729124065; x=1729728865;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GcB5GtP5PER7P0fAo7i/I4FfsUt0WnKPhI2an5P5bXU=;
        b=Wvf/dPYY7VEu9GjX6I/FtfBX3MHrIkWtlvlzrLRDYYU0JAuxET+SWFiWTyBevBN+hF
         ZQQk8hEho6A+w1u5ljIaEG0o0wOqW001k9s9aFDsvNkz315abkM/ZEv2IGvCq2nxHCaX
         xsPdUUodjgYSSlF/SPQV4NkATj2IhPfl7QRmIcESSN2qJsXq163EXCYAJG9OmtQmm1pS
         z40a10Ri+GDnKMXjfAPsNbQa/rRRJrx0uyVVdxQvKbYBe5Sf8XUj3CRTZp0ocVXT55Rz
         uvPEu+ogXyYdQ3qjzg/lsolCLi/ZOy4apx11ViwlVSqWvvhyxrLsAzylWHZ0QecwbASp
         RLdQ==
X-Forwarded-Encrypted: i=1; AJvYcCW74xRCtUHKHGxE0WJ3wYCme8uSOnolmgZ1RACE/dw4XP32jc6uZaf4c2xvOlz0ENXJZFkCoH6/ORfPFw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxWvRlld76FTfS/mg4oNdUl/LE/qhyTL2e4vdblYhS/klJZUJBH
	plnMYrlXQb62lElnoFktmQz+lsjjyWC83MGOVJyeLwdW9RYLi/ZSn4/5EGWAzEV461TGxM9pRL3
	wvPmMcQ==
X-Google-Smtp-Source: AGHT+IF84de8wETp+H+TNwpiCe/Wmym3lkGW+5hnYBUFbVDRkLRMCr2aUEvU33rn4tBcd8ME/lSYibr0Ec+J
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:a00a:f237:9bc0:79c])
 (user=irogers job=sendgmr) by 2002:a25:b10e:0:b0:e0e:4841:3a7e with SMTP id
 3f1490d57ef6-e2978555793mr6672276.7.1729124064807; Wed, 16 Oct 2024 17:14:24
 -0700 (PDT)
Date: Wed, 16 Oct 2024 17:13:52 -0700
In-Reply-To: <20241017001354.56973-1-irogers@google.com>
Message-Id: <20241017001354.56973-10-irogers@google.com>
Mime-Version: 1.0
References: <20241017001354.56973-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Subject: [PATCH v3 09/11] perf libdw: Remove unnecessary defines
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
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Changbin Du <changbin.du@huawei.com>, 
	Guilherme Amadio <amadio@gentoo.org>, Yang Jihong <yangjihong@bytedance.com>, 
	Aditya Gupta <adityag@linux.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Kajol Jain <kjain@linux.ibm.com>, 
	Atish Patra <atishp@rivosinc.com>, Shenlin Liang <liangshenlin@eswincomputing.com>, 
	Anup Patel <anup@brainfault.org>, Oliver Upton <oliver.upton@linux.dev>, 
	"Steinar H. Gunderson" <sesse@google.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Chen Pei <cp0613@linux.alibaba.com>, Dima Kogan <dima@secretsauce.net>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_171426_766869_01B0F96D 
X-CRM114-Status: GOOD (  18.48  )
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

As HAVE_DWARF_GETLOCATIONS_SUPPORT and HAVE_DWARF_CFI_SUPPORT always
match HAVE_DWARF_SUPPORT remove the macros and use
HAVE_DWARF_SUPPORT. If building the file is guarded by CONFIG_DWARF
then remove all ifs.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Documentation/perf-check.txt |  2 +-
 tools/perf/Makefile.config              |  3 --
 tools/perf/builtin-annotate.c           |  2 +-
 tools/perf/builtin-check.c              |  2 +-
 tools/perf/builtin-report.c             |  2 +-
 tools/perf/util/dwarf-aux.c             |  6 ---
 tools/perf/util/dwarf-aux.h             | 54 -------------------------
 tools/perf/util/probe-finder.c          |  4 --
 8 files changed, 4 insertions(+), 71 deletions(-)

diff --git a/tools/perf/Documentation/perf-check.txt b/tools/perf/Documentation/perf-check.txt
index 10f69fb6850b..45101a8e4154 100644
--- a/tools/perf/Documentation/perf-check.txt
+++ b/tools/perf/Documentation/perf-check.txt
@@ -48,7 +48,7 @@ feature::
                 bpf_skeletons           /  HAVE_BPF_SKEL
                 debuginfod              /  HAVE_DEBUGINFOD_SUPPORT
                 dwarf                   /  HAVE_DWARF_SUPPORT
-                dwarf_getlocations      /  HAVE_DWARF_GETLOCATIONS_SUPPORT
+                dwarf_getlocations      /  HAVE_DWARF_SUPPORT
                 dwarf-unwind            /  HAVE_DWARF_UNWIND_SUPPORT
                 auxtrace                /  HAVE_AUXTRACE_SUPPORT
                 libaudit                /  HAVE_LIBAUDIT_SUPPORT
diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 6378811f2568..7dbcf8394f3d 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -466,9 +466,6 @@ else
         $(warning No libdw.h found or old libdw.h found or elfutils is older than 0.157, disables dwarf support. Please install new elfutils-devel/libdw-dev)
         NO_LIBDW := 1
       endif
-    else
-      CFLAGS += -DHAVE_DWARF_GETLOCATIONS_SUPPORT
-      CFLAGS += -DHAVE_DWARF_CFI_SUPPORT
     endif # Dwarf support
   endif # libelf support
 endif # NO_LIBELF
diff --git a/tools/perf/builtin-annotate.c b/tools/perf/builtin-annotate.c
index 3dc6197ef3fa..04af13eb4a4c 100644
--- a/tools/perf/builtin-annotate.c
+++ b/tools/perf/builtin-annotate.c
@@ -840,7 +840,7 @@ int cmd_annotate(int argc, const char **argv)
 	}
 #endif
 
-#ifndef HAVE_DWARF_GETLOCATIONS_SUPPORT
+#ifndef HAVE_DWARF_SUPPORT
 	if (annotate.data_type) {
 		pr_err("Error: Data type profiling is disabled due to missing DWARF support\n");
 		return -ENOTSUP;
diff --git a/tools/perf/builtin-check.c b/tools/perf/builtin-check.c
index 0b76b6e42b78..18c0a815243b 100644
--- a/tools/perf/builtin-check.c
+++ b/tools/perf/builtin-check.c
@@ -28,7 +28,7 @@ struct feature_status supported_features[] = {
 	FEATURE_STATUS("bpf_skeletons", HAVE_BPF_SKEL),
 	FEATURE_STATUS("debuginfod", HAVE_DEBUGINFOD_SUPPORT),
 	FEATURE_STATUS("dwarf", HAVE_DWARF_SUPPORT),
-	FEATURE_STATUS("dwarf_getlocations", HAVE_DWARF_GETLOCATIONS_SUPPORT),
+	FEATURE_STATUS("dwarf_getlocations", HAVE_DWARF_SUPPORT),
 	FEATURE_STATUS("dwarf-unwind", HAVE_DWARF_UNWIND_SUPPORT),
 	FEATURE_STATUS("auxtrace", HAVE_AUXTRACE_SUPPORT),
 	FEATURE_STATUS("libaudit", HAVE_LIBAUDIT_SUPPORT),
diff --git a/tools/perf/builtin-report.c b/tools/perf/builtin-report.c
index 36b344e39dd6..2251aa61ea53 100644
--- a/tools/perf/builtin-report.c
+++ b/tools/perf/builtin-report.c
@@ -1705,7 +1705,7 @@ int cmd_report(int argc, const char **argv)
 		report.data_type = true;
 		annotate_opts.annotate_src = false;
 
-#ifndef HAVE_DWARF_GETLOCATIONS_SUPPORT
+#ifndef HAVE_DWARF_SUPPORT
 		pr_err("Error: Data type profiling is disabled due to missing DWARF support\n");
 		goto error;
 #endif
diff --git a/tools/perf/util/dwarf-aux.c b/tools/perf/util/dwarf-aux.c
index 92eb9c8dc3e5..559c953ca172 100644
--- a/tools/perf/util/dwarf-aux.c
+++ b/tools/perf/util/dwarf-aux.c
@@ -1182,7 +1182,6 @@ int die_get_varname(Dwarf_Die *vr_die, struct strbuf *buf)
 	return ret < 0 ? ret : strbuf_addf(buf, "\t%s", dwarf_diename(vr_die));
 }
 
-#if defined(HAVE_DWARF_GETLOCATIONS_SUPPORT) || defined(HAVE_DWARF_CFI_SUPPORT)
 static int reg_from_dwarf_op(Dwarf_Op *op)
 {
 	switch (op->atom) {
@@ -1245,9 +1244,7 @@ static bool check_allowed_ops(Dwarf_Op *ops, size_t nops)
 	}
 	return true;
 }
-#endif /* HAVE_DWARF_GETLOCATIONS_SUPPORT || HAVE_DWARF_CFI_SUPPORT */
 
-#ifdef HAVE_DWARF_GETLOCATIONS_SUPPORT
 /**
  * die_get_var_innermost_scope - Get innermost scope range of given variable DIE
  * @sp_die: a subprogram DIE
@@ -1697,9 +1694,7 @@ void die_collect_global_vars(Dwarf_Die *cu_die, struct die_var_type **var_types)
 
 	die_find_child(cu_die, __die_collect_global_vars_cb, (void *)var_types, &die_mem);
 }
-#endif /* HAVE_DWARF_GETLOCATIONS_SUPPORT */
 
-#ifdef HAVE_DWARF_CFI_SUPPORT
 /**
  * die_get_cfa - Get frame base information
  * @dwarf: a Dwarf info
@@ -1732,7 +1727,6 @@ int die_get_cfa(Dwarf *dwarf, u64 pc, int *preg, int *poffset)
 	}
 	return -1;
 }
-#endif /* HAVE_DWARF_CFI_SUPPORT */
 
 /*
  * die_has_loclist - Check if DW_AT_location of @vr_die is a location list
diff --git a/tools/perf/util/dwarf-aux.h b/tools/perf/util/dwarf-aux.h
index bd7505812569..892c8c5c23fc 100644
--- a/tools/perf/util/dwarf-aux.h
+++ b/tools/perf/util/dwarf-aux.h
@@ -9,7 +9,6 @@
 #include <elfutils/libdw.h>
 #include <elfutils/libdwfl.h>
 #include <elfutils/version.h>
-#include <errno.h>
 
 struct strbuf;
 
@@ -157,8 +156,6 @@ Dwarf_Die *die_get_member_type(Dwarf_Die *type_die, int offset, Dwarf_Die *die_m
 /* Return type info where the pointer and offset point to */
 Dwarf_Die *die_deref_ptr_type(Dwarf_Die *ptr_die, int offset, Dwarf_Die *die_mem);
 
-#ifdef HAVE_DWARF_GETLOCATIONS_SUPPORT
-
 /* Get byte offset range of given variable DIE */
 int die_get_var_range(Dwarf_Die *sp_die, Dwarf_Die *vr_die, struct strbuf *buf);
 
@@ -177,58 +174,7 @@ void die_collect_vars(Dwarf_Die *sc_die, struct die_var_type **var_types);
 /* Save all global variables in this CU */
 void die_collect_global_vars(Dwarf_Die *cu_die, struct die_var_type **var_types);
 
-#else /*  HAVE_DWARF_GETLOCATIONS_SUPPORT */
-
-static inline int die_get_var_range(Dwarf_Die *sp_die __maybe_unused,
-				    Dwarf_Die *vr_die __maybe_unused,
-				    struct strbuf *buf __maybe_unused)
-{
-	return -ENOTSUP;
-}
-
-static inline Dwarf_Die *die_find_variable_by_reg(Dwarf_Die *sc_die __maybe_unused,
-						  Dwarf_Addr pc __maybe_unused,
-						  int reg __maybe_unused,
-						  int *poffset __maybe_unused,
-						  bool is_fbreg __maybe_unused,
-						  Dwarf_Die *die_mem __maybe_unused)
-{
-	return NULL;
-}
-
-static inline Dwarf_Die *die_find_variable_by_addr(Dwarf_Die *sc_die __maybe_unused,
-						   Dwarf_Addr addr __maybe_unused,
-						   Dwarf_Die *die_mem __maybe_unused,
-						   int *offset __maybe_unused)
-{
-	return NULL;
-}
-
-static inline void die_collect_vars(Dwarf_Die *sc_die __maybe_unused,
-				    struct die_var_type **var_types __maybe_unused)
-{
-}
-
-static inline void die_collect_global_vars(Dwarf_Die *cu_die __maybe_unused,
-					   struct die_var_type **var_types __maybe_unused)
-{
-}
-
-#endif /* HAVE_DWARF_GETLOCATIONS_SUPPORT */
-
-#ifdef HAVE_DWARF_CFI_SUPPORT
-
 /* Get the frame base information from CFA */
 int die_get_cfa(Dwarf *dwarf, u64 pc, int *preg, int *poffset);
 
-#else /* HAVE_DWARF_CFI_SUPPORT */
-
-static inline int die_get_cfa(Dwarf *dwarf __maybe_unused, u64 pc __maybe_unused,
-			      int *preg __maybe_unused, int *poffset __maybe_unused)
-{
-	return -1;
-}
-
-#endif /* HAVE_DWARF_CFI_SUPPORT */
-
 #endif /* _DWARF_AUX_H */
diff --git a/tools/perf/util/probe-finder.c b/tools/perf/util/probe-finder.c
index b6775d3bdeac..8ea15a2a4397 100644
--- a/tools/perf/util/probe-finder.c
+++ b/tools/perf/util/probe-finder.c
@@ -602,7 +602,6 @@ static int call_probe_finder(Dwarf_Die *sc_die, struct probe_finder *pf)
 	ret = dwarf_getlocation_addr(&fb_attr, pf->addr, &pf->fb_ops, &nops, 1);
 	if (ret <= 0 || nops == 0) {
 		pf->fb_ops = NULL;
-#ifdef HAVE_DWARF_CFI_SUPPORT
 	} else if (nops == 1 && pf->fb_ops[0].atom == DW_OP_call_frame_cfa &&
 		   (pf->cfi_eh != NULL || pf->cfi_dbg != NULL)) {
 		if ((dwarf_cfi_addrframe(pf->cfi_eh, pf->addr, &frame) != 0 &&
@@ -613,7 +612,6 @@ static int call_probe_finder(Dwarf_Die *sc_die, struct probe_finder *pf)
 			free(frame);
 			return -ENOENT;
 		}
-#endif /* HAVE_DWARF_CFI_SUPPORT */
 	}
 
 	/* Call finder's callback handler */
@@ -1138,7 +1136,6 @@ static int debuginfo__find_probes(struct debuginfo *dbg,
 
 	pf->machine = ehdr.e_machine;
 
-#ifdef HAVE_DWARF_CFI_SUPPORT
 	do {
 		GElf_Shdr shdr;
 
@@ -1148,7 +1145,6 @@ static int debuginfo__find_probes(struct debuginfo *dbg,
 
 		pf->cfi_dbg = dwarf_getcfi(dbg->dbg);
 	} while (0);
-#endif /* HAVE_DWARF_CFI_SUPPORT */
 
 	ret = debuginfo__find_probe_location(dbg, pf);
 	return ret;
-- 
2.47.0.105.g07ac214952-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
