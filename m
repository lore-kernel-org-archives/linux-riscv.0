Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF9DC35FF3
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 03:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zwd3XGiRGsiWwHLY4vLluvQnYjmLJoswNjr20ycCIUc=; b=gzIhM8eUZdRUBDTHpWaJSzTfgf
	co9ia3glFHQsMOEbL9NZZehJ9Co4EAnvH5nYQCaw3wioPNSp7bVszfWtPD+2JJfXwwtxAKwHc738U
	8S1PzAkbFp5adt+YwevCsoHtbgpOxpf2pSh2HCdtCoVJPgo80onlLDVqA1UFgIFJbAEsYbgZg6BtZ
	yqmGfZzHRWrBKRrYMZo2xf3wrY62j0u9ED7WJreeRQcxCEkulBuTTbiHauGPfJ753kUhUE9l8B0+2
	raTvFXAJbkOi93ZQaVEaGde8Ylpq+ka9RxK4/zoHaJko0MVflzPGmo1t1A7okJyi+vPCoDk5JpJGU
	3bxzSp6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuNta-00000004YJg-0jv3;
	Tue, 18 Mar 2025 03:45:38 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuNgN-00000004W6W-2v8d
	for linux-riscv@lists.infradead.org;
	Tue, 18 Mar 2025 03:32:01 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e63533f0a65so6373268276.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 20:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742268718; x=1742873518; darn=lists.infradead.org;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jHN6hEmKYf/vVKEYrUtFE+mgr5gUEvxeDu0SIFOEKqg=;
        b=JhTFhhcOLD+YCTqpeb4qHR9qfCyxuQHjA35anYP6OL2cBj0jYt6J+ZrNbKLfvqmwAo
         3+q2eFE3U7FB64Zx3Np4F65F1AR5QLSD3zS6+QHME4Wx+FOM57DkXvr0LVB3QqIiZhwn
         YFGRih0QaHUaiG2F4n0cvzJt8LHzoQj/kuZOStMqEnI3qWJm3TjfHDwkYK0JgJswsMb1
         E7TPJaz2fkBXFS02ArOaPSNSg57iSLan1qu8d0Vvm8fcYH4i8IxjmU0OrItvTMn6j9DP
         nriwIz0NU+allZ2ZyAH/fxNuiYMiAGDZac7JpcYhb19BPRGPAqosFpxzYfr5XRBVW943
         y3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742268718; x=1742873518;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jHN6hEmKYf/vVKEYrUtFE+mgr5gUEvxeDu0SIFOEKqg=;
        b=sIA2zYEI5rjp7dTiNDLMg9Cyf80SSK2UZSRqrgiQ5wpY9dFdhIewIDeT8AWSqTeWEp
         89K3u+BebnGCtEhtLsPNRqNL8kIqg5YXjY2egk/yXu6+OIzlzOk77z0e7csfZwxP0x7o
         4l684kv6ntFm2geOjHBXvaVQGTrl5YGyfW2m+Q3QKlbAvjx1mcOCklvwCfwNXPmoVGTh
         YoASd22SkVxOHw64Tr5sMtr2i9xX0adQEG2OW9sIP/bDvAp7Mgs/1A1z8co/Wcm4xj9y
         9PfFY8GdjE5IFmVBpDMXnYP/94GlD0q5CBQppDsPMGtIyJbDn506qTj1JbypENau1AT5
         exUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMm5xIpnLYI0/lIGS6676RDGLf1N/4CfR6MHwv0MxF3nT0fz2i0tUQQ95vESny9sGMGbHPK95Qim6FgA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQLDvQoxwevTjbj+Nf5tlYYq/z2mJJK+v8gwit51sLL6DoTNR+
	3+9d5fYPi8JR2UWrJ5IRmuvfAyvA2HKlkP7LxjUnzh2eo9xxN9bns0WI3AyYNrpJB+z0+x3V+pT
	Vs6ckvg==
X-Google-Smtp-Source: AGHT+IEPuBvIcSfk3bbRhT/J8hpoCiqCQuC68IEKcGtvvMui3F+mkYkW6NsNtcusm463jvYm7WncQRBYK9L1
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:ef29:15ce:a42a:b69f])
 (user=irogers job=sendgmr) by 2002:a25:9006:0:b0:e64:3d36:bec1 with SMTP id
 3f1490d57ef6-e65118d8296mr1167276.1.1742268717723; Mon, 17 Mar 2025 20:31:57
 -0700 (PDT)
Date: Mon, 17 Mar 2025 20:31:38 -0700
In-Reply-To: <20250318033150.119174-1-irogers@google.com>
Message-Id: <20250318033150.119174-2-irogers@google.com>
Mime-Version: 1.0
References: <20250318033150.119174-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Subject: [PATCH v6 01/13] perf dso: Move libunwind dso_data variables into ifdef
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
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_203159_729513_BAB14DA1 
X-CRM114-Status: GOOD (  10.14  )
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

The variables elf_base_addr, debug_frame_offset, eh_frame_hdr_addr and
eh_frame_hdr_offset are only accessed in unwind-libunwind-local.c
which is conditionally built on having libunwind support. Make the
variables conditional on libunwind support too.

Reviewed-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dso.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
index 84d5aac666aa..14e4ac21a1d3 100644
--- a/tools/perf/util/dso.h
+++ b/tools/perf/util/dso.h
@@ -155,10 +155,12 @@ struct dso_data {
 	int		 status;
 	u32		 status_seen;
 	u64		 file_size;
+#ifdef HAVE_LIBUNWIND_SUPPORT
 	u64		 elf_base_addr;
 	u64		 debug_frame_offset;
 	u64		 eh_frame_hdr_addr;
 	u64		 eh_frame_hdr_offset;
+#endif
 };
 
 struct dso_bpf_prog {
-- 
2.49.0.rc1.451.g8f38331e32-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
