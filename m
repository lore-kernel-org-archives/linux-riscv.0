Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE09C282DE
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Mar 2025 00:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=t/t7NHeTi0pqPStAfeY+tuGRP+NDnI6UCcbvBTa71Zs=; b=2FZyWScOo5VsDOGT6CWFeOnPzg
	a8dwUEIVjHgczBb+s7F6pDVqqFWbYEnyH5HxNyvwSzAIa7f/WYYTvhYukjaK7g1XbCyAe5xb5+l5K
	3nu6r2tmm1KhNVmGkU/kWkBktYa0vNMpUb9GNRPxknRyljKm1i7537rFh8+2eIVBcMGOvMNBrkZyP
	wgEwuNSjvVIoXyr4Cxim3gUagHG6pTKo/V4XJOGPT3vfPaX1TrPrUPPs023gVWA/gC/ReV6SvV8HH
	OWy5kd4FBxMqz8yh7TghABlwV3Z2dqBZXr5mKETaM2/VYn72wIFoulrSFDBzrwFhb2wQzMPoG3Kk1
	hC07djYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqi8b-0000000Fuh8-02Vi;
	Sat, 08 Mar 2025 00:33:57 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqi6y-0000000FuBp-0TIM
	for linux-riscv@lists.infradead.org;
	Sat, 08 Mar 2025 00:32:17 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6fd737992a3so38499127b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Mar 2025 16:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741393935; x=1741998735; darn=lists.infradead.org;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ivnbhuhI/ixgKyNuqtV9wf0AaXG2gqT9U4XDml1DXZU=;
        b=1BpmE79w4/bcB4wtfAwSp3iymDXzzOYYIf3yO4Hdh/928CfAD0SGvjGIIkB3o7fdmt
         W+dX6YPVhiC1JQ63f51A3TF9bvBILPnvWteqvz23T/xPYXHeW8cLIsWc/lewMS2jpE55
         8+/M0272e5PkKzvzAdRflrdWXyBb3eZUzXVQhIvVzZS9QoypHbhEt7EkwpTQlZN51+NR
         iCmQnVk7Cd3vcVaD2TMIJVsghVcPpvdw5XuTvu2O4rK63ZH8lnd0vvfFGYCGhYHLGye8
         PypnR8P5Ixw6SiZVB/x3cH7svuOmXTCB9gapGPv+3I0xuj6TBjctFpjbYbrcJnN7Bb++
         zo9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741393935; x=1741998735;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ivnbhuhI/ixgKyNuqtV9wf0AaXG2gqT9U4XDml1DXZU=;
        b=efs2GweeoFJTy0tw3gqFQnDwOche1UzOXOsoSzpuGH2HpSu+sFio/Xinp79CETyZwu
         g54mJhghYbHzEjhZFfiW7s5s3Pv0isF86+BHA1piXS952JPTMDyA8KZDYCt5DQYjHVT1
         nzPIZhSx+50CqgVRa8XleTAlpqwO0qk6wUWXWuynAM6hBACdhkCm3SQ/3laCiV2fHPl2
         vHNRcwcj2kHsr2PnYsC3FbxrwQFKzdEQhNlgtMZw6IS/sId6bYyz15xrF1nxn2zyt4Fx
         03zwsmvRdXKHodxLwxUttqFi4xcimYE8jAT7x2rIpqzUSLqrDnR/fn4yfofH+3degOCO
         51ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCViM7x9o0ByTAEEjLvSudnMwqyrQIALRoEWVWxV67YTHIuAo88DrNCpvGZ+fFojSNBnlDnjzXMu9rIy/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXo2eEFQqMvw6cLMibRtrc8LLyHZHrlZ8KV9tZwoptiVQFmzti
	xzcdWRq6V+bMzlMFsmJzBfTXw8xvqi4KyY1oYYU4P9P5iZl1Imf0JBsRdmt3mElg1PALhrCkIm+
	rf8k9hw==
X-Google-Smtp-Source: AGHT+IG6YNEzBmSnRkSpppexP7sY3bjIUwdOpxoYGty73UlROUhquWw1r9gEA9sFFMJohI1jVlJGdzxY77PY
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:1541:e490:aa80:5766])
 (user=irogers job=sendgmr) by 2002:a25:728a:0:b0:e60:96b9:bee8 with SMTP id
 3f1490d57ef6-e635c1ecad7mr49692276.7.1741393934929; Fri, 07 Mar 2025 16:32:14
 -0800 (PST)
Date: Fri,  7 Mar 2025 16:31:59 -0800
In-Reply-To: <20250308003209.234114-1-irogers@google.com>
Message-Id: <20250308003209.234114-2-irogers@google.com>
Mime-Version: 1.0
References: <20250308003209.234114-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Subject: [PATCH v5 01/11] perf dso: Move libunwind dso_data variables into ifdef
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
X-CRM114-CacheID: sfid-20250307_163216_149486_EE9067C7 
X-CRM114-Status: GOOD (  10.30  )
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
index bb8e8f444054..dfd763a0bd9d 100644
--- a/tools/perf/util/dso.h
+++ b/tools/perf/util/dso.h
@@ -154,10 +154,12 @@ struct dso_data {
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
2.49.0.rc0.332.g42c0ae87b1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
