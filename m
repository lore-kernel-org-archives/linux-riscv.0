Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB493C35FF1
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 05:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3OkdMxehK0wwcXxosVowBjzO2kExsPFhfGMgptx/6IQ=; b=gu0NN2CZba9S2H
	UAoQShwygQ8QWThFH29NAp5RIKHhzKdFn7sOEC3CA4rdZ/Wdd+C+iWThBsY5Aug0siB/xCHSiSMji
	EbpkAZJoBfruKc54mBcODAtHD2IrcUOP2kwHKy8bQ2cgL3kWn/Er5YnXXfYnOeujPpfE00UlavzNB
	nbQQm8UW1LeJpCKaB6pAC44dhUx2UHrQwTaa99RhmcxdoldeqV5oFtqXkTwQ0Sm01kivQS8CEGuOK
	x1N08iEvhWqO8IgzyMp6xHRvK7VVVmDK1dDjgwbn1KU7RUSACk2lUZcxrps93HjwG+JtX1Kynucoj
	NGfglsjnw+KU8Zq+hHCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tulyt-000000083eB-1Uqs;
	Wed, 19 Mar 2025 05:28:43 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tulf7-000000080wc-2M2g
	for linux-riscv@lists.infradead.org;
	Wed, 19 Mar 2025 05:08:18 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6fecf913cb1so81780477b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 18 Mar 2025 22:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742360896; x=1742965696; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y38GESo485gGDIFJ1xMbGn6kWCzBk3/syJLY+zfYrVg=;
        b=gdBZlwNclm8VAz4e7emfYXJP0//w/3ljjjxO6fMcJKHMuULjq6/FMBs7fGzWJh074G
         KN9cadDtet4QHXW4xbY0WiUmbn0uEQMIZbJjz3SVpfx6+T0uY5JE8LE12+Hk38Ja1ULc
         shjg4K32SZWuPvRpi1MO5b9GbOUzKZU8zr2uTlKbm7KQuC4ZGr7BYrTmoIqsRQ+6Jw6h
         omIjHHayUqGfuyKD8RSRcwgzjA4JbkCI/dUhv864ate8jJJHTfWq1BoHznWhNTsVgFHE
         2hDAMtGHr8zhzs2oPbTEO6ACAF30qn6dKznUt/pGeSSDl2tdoYpX3A7XdI3icfDCPDYU
         s4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742360896; x=1742965696;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y38GESo485gGDIFJ1xMbGn6kWCzBk3/syJLY+zfYrVg=;
        b=My1Y6Kd7rfZgLYbboQvQ2oFtSOC/+bqLStjaMN4Lm0I/PZu7/3URKV1RKyf0hZ496n
         u1aWhqiZCKDS1sAK8DepeRzDZ+G+uNWLy8LvKy60Zm39Sm4VYdunadCiMISuVwV+Hc/G
         LFOGbDNWNZvja//KphSm8wDH3y/uwwb4LI52OGC36vyF1NCMrs5p5FqMp70WIWyUIPHb
         ojKiAqaA+shYBkS7iSDVy7yOx+DuZE+XG1U1RA9M8mDs4m8Lng1M3ibv8Dj2LuFQQjMm
         YZdVHf7uVwXhr/ja7nJnN8YqP9CqkEmp7uPiTorZXMj9FdxKVi/hL8jArmQkAR6fNcBP
         5ygA==
X-Forwarded-Encrypted: i=1; AJvYcCWIHDPCApDalaHX40YESkyQP3tSYtfT4VcWscvEKcCGrCKjM3BG8CqU2Qlfdutk9CxuknxqbR0KbvazFg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBSGzhiCQ7D0Z/UM496aMeJd8nj4IfoOMaJ2H0gexP+t9ByplG
	URhvQwjuUFUhmoUKJeY9L5dNjg90gHAlJMyESa0Jkd8QFB/uSw0nAJAZo5/lYM1G5C/uOo71ah4
	HwO/s5Q==
X-Google-Smtp-Source: AGHT+IFPFakwCyr0uM1/sz8X8s9dtQflbQjZm9fJ42RkwL6er5xIYEKy4XS6bbEhodJ8Ew/JRCn4+wa1XjLm
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:8a11:10b5:af90:6031])
 (user=irogers job=sendgmr) by 2002:a05:690c:d8e:b0:6fe:e77c:7741 with SMTP id
 00721157ae682-7009c211810mr6127b3.8.1742360896116; Tue, 18 Mar 2025 22:08:16
 -0700 (PDT)
Date: Tue, 18 Mar 2025 22:07:40 -0700
In-Reply-To: <20250319050741.269828-1-irogers@google.com>
Message-Id: <20250319050741.269828-14-irogers@google.com>
Mime-Version: 1.0
References: <20250319050741.269828-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Subject: [PATCH v7 13/14] perf trace: Fix BTF memory leak
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
X-CRM114-CacheID: sfid-20250318_220817_591112_3A26EAF4 
X-CRM114-Status: UNSURE (   9.96  )
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
 tools/perf/builtin-trace.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/perf/builtin-trace.c b/tools/perf/builtin-trace.c
index a5f31472980b..1d4ad5d19b10 100644
--- a/tools/perf/builtin-trace.c
+++ b/tools/perf/builtin-trace.c
@@ -5339,6 +5339,10 @@ static void trace__exit(struct trace *trace)
 		zfree(&trace->syscalls.table);
 	}
 	zfree(&trace->perfconfig_events);
+#ifdef HAVE_LIBBPF_SUPPORT
+	btf__free(trace->btf);
+	trace->btf = NULL;
+#endif
 }
 
 #ifdef HAVE_BPF_SKEL
-- 
2.49.0.rc1.451.g8f38331e32-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
