Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C04DC282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 03:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L4fGZfMaL2jw8HkCspRHdkW/ak3jA2VutKxJWuUrvRg=; b=nE7cj9Et3PPYMI
	cMi4GIr1Y8niFtImggO1SKI+7r19/b2wvXjbioulf1x091t0MYQ5pVLlwdcwOFzlQ0GyjfZyMu6Tz
	4YHDtN3QyQJu3oVRG5WaTAIfIq/cqRZ3UHK0aok0ghX1w4dpRrPa85oKFBdDzCXAl1sMidFaukpAm
	ZILO1r3dIE6H823UElxCSsybZLO4atIITzwZ1M6z02HriubX+0ExSMD4Xg7qs+ux5AmRd1Z3rDxZd
	Qn3QcIAktKcyfL5RqihI1yGlXlgKKm9V3Mx3DvUwtZaDqnCFm7on14ls8EMrijME9Y1CQCuq8RfWY
	s6uMACJuwpmB2GmQZoMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuO4P-00000004aI1-1YlV;
	Tue, 18 Mar 2025 03:56:49 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuNgp-00000004WOJ-0THb
	for linux-riscv@lists.infradead.org;
	Tue, 18 Mar 2025 03:32:31 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e6372bafb96so7886911276.2
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 20:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742268746; x=1742873546; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DQo9te7ZzJhvscCqCJ9snuZUA/U+ZRpIQMTgL/AyPbA=;
        b=c/61Vk/mWNjFPW93RptXlN9vthitP2iwK+AQyi+y4tqaKrS6qnaoJB3CGkG2KNjgOx
         6GYKJVK0K8AEN18duRJ/2i4d6xaN4qam5Kb6aoTpcEl0uSj3DN8ANbzYCLNqIwd+/ffN
         lFvch2mfl8f2avyuJLvV7etgm24iUmglyBpxhdYXJBhhuNvgMQBII6M/YSlZgNdO/ooN
         WSnEyPENSgQhqmWzTSpp3K+kj6Vy/IpsmcKQqEvWjL5t6idaWnrt9Y7sBN2Da1NVgDl5
         RPzXd9Ht8R7HfPIVvFAGrwtpn1Os9nvOwFoAVx7OE4VAdEmif4SxJGc8xKtvnj5ljY3L
         Guew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742268746; x=1742873546;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DQo9te7ZzJhvscCqCJ9snuZUA/U+ZRpIQMTgL/AyPbA=;
        b=tMUJaJAAQ8YgyhJbKIPnSX/nF1B1xEvz8SaMSpsn3ztO8zOeU+ZhgPazK8aRizTq2N
         ri9dj20qlCVII8aKc6SxmbCPxcp6uOCQvU3QwtuePfAr8/dr3tUEqgO+mT1N2hOx+ek7
         Zbxm3jsXAMdpBtN9JhLtplIg1BP4KrsLSzebiQ9votlrVTiWbNk/cedKxnQaGb9pyn3C
         WLmziMBtDkRnm8pZUai3Ton7yP3DvnVumRPs9qz11qc0eIlLnPZrY5RAO2wAYyQhTSux
         w330StfwCFEEOl93yJwrCj8ytQtGnHGcIxLy9Hw2kaakM+TyJd8zhvaLRXahs5xE0JVS
         Ggpg==
X-Forwarded-Encrypted: i=1; AJvYcCX3U1JwusoJNlLxI5OsP4RI0LOF8IKwM4MxQPPgtmP2pCOXYYHytiqMI2KUVWjPC2ITXa11dkN7qABECg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwbclaVHRiuFXVoOEqSTW/T1CKrJ9Ul1ZorrZHF0vgMXTgamiYv
	PC4fr0v0QLhK7USzVZDFmYYU44wVsLoOePfCxp4fRCn72vATVtMvpz8H9jqT4dSnjn8SLSod1bg
	xh4sT5Q==
X-Google-Smtp-Source: AGHT+IGRlVl7Gw//953kKsnqnEm7y8Rwpz1NXG8HWXbHdCQFY9o6z5zJFDv6lHgSfJyidVHvfm/4CNW4I8zo
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:ef29:15ce:a42a:b69f])
 (user=irogers job=sendgmr) by 2002:a25:8209:0:b0:e5b:f74:f5a with SMTP id
 3f1490d57ef6-e63f65f1718mr7472276.8.1742268745758; Mon, 17 Mar 2025 20:32:25
 -0700 (PDT)
Date: Mon, 17 Mar 2025 20:31:50 -0700
In-Reply-To: <20250318033150.119174-1-irogers@google.com>
Message-Id: <20250318033150.119174-14-irogers@google.com>
Mime-Version: 1.0
References: <20250318033150.119174-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Subject: [PATCH v6 13/13] perf trace: Fix BTF memory leak
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
	Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_203227_148313_AAF521F9 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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

Add missing btf__free in trace__exit.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-trace.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/perf/builtin-trace.c b/tools/perf/builtin-trace.c
index a5f31472980b..d4bbb6a1e817 100644
--- a/tools/perf/builtin-trace.c
+++ b/tools/perf/builtin-trace.c
@@ -5339,6 +5339,12 @@ static void trace__exit(struct trace *trace)
 		zfree(&trace->syscalls.table);
 	}
 	zfree(&trace->perfconfig_events);
+#ifdef HAVE_LIBBPF_SUPPORT
+	if (trace->btf != NULL) {
+		btf__free(trace->btf);
+		trace->btf = NULL;
+	}
+#endif
 }
 
 #ifdef HAVE_BPF_SKEL
-- 
2.49.0.rc1.451.g8f38331e32-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
