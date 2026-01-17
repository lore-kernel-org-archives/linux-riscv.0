Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3BDC9830E
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jan 2026 05:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tlqq9A3fOEmIlLVBh9mDl1n8n2NiIEcci2HfKwhFq8E=; b=CloE3HS+vvshr8
	9MTx7+/iNfn21xnX9lrJEy+aEGei8XKE2FJa4KAjruBh5Dn6PPJBp6Yh76W7jpl1yxiZpOKkdnCXn
	iaTCCnoz+lb/N+zu+znSTyHAfL7HfhFT4LLjplxsUFE8C5xiaTfhb0W1iOc/90cmjhK0QWKEkJR9M
	swe0zUB78zZtPgv7klMpXh9G3DFD+k0nQ/027jSvkVINB45/A8e428YUD5f0qGP8f5N9GHA55zIcG
	ks/4tmlpJ3L321JpvKML2Q36HT4lNg5xcWTeyzbieEan8YMfEPlgYyuUBPZ22dtUqm4OztHO/d3Y5
	7r02P2A9+61lGygO41Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgysG-0000000FEKI-0fH1;
	Sat, 17 Jan 2026 05:29:24 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgysE-0000000FEJF-0iCH
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jan 2026 05:29:23 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2b6ba50fc34so1156553eec.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 21:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768627761; x=1769232561; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7OS8+jcXChzbawXYGLy5k5VOyetH1gbj+eqgOcCR0OU=;
        b=KpChoqYlV6onsoyf9j0TSwu0t7o5l7G6b2dQweixIYo1a8BD1F2PBvslPR/CHpbQlA
         fKC3/xrgP+XnQaJDyLKjquJhkIThwACQyGFxS3Y7lmIPeFTJAt0daoDI3bhkiAbqu6vb
         L28UR0fhr/NaYZVPlal79ke5I4qp4E1+hhn77jVTK834ohuLvBYTzo+SK143Oj85odP6
         HU5X/eHMFVqA9X1gMgpIhvrjTgp7XM2sK/845tZrPZ4E7ZaISFKXaLcKaLZoaF2pcORA
         Ud2WN6W0CMlAlMhRa4yFanmENsFV2HJQKDnAO7XO7KPKAohEmo2R9tgzaz6bXZayVhpZ
         lm6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768627761; x=1769232561;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7OS8+jcXChzbawXYGLy5k5VOyetH1gbj+eqgOcCR0OU=;
        b=diu1/MUaF0xdIEGAxydhh7P+RJIAEC41CusnwE/UxZNjXqs9rKyFax0e1S2bzWjpjd
         Fv3WN6MecLmPJZvHAQoVTu+X5euf4WpI4IBe7rgVzjdBPFxk8+q6m6K39FyLFS/dxFve
         UO9t4GIEsd3KGp56OLE6cYiY6q5iGRJEyjjtj+qnAa0BxGHALD0fPRbEAUOeQBDzb0Tz
         YxyLP6MLMwXBWrUazdfV4VZsWiUMlWWDG3Jv1SLxQ7X5FaTYO1bDqk9ejx+WyIUe+09w
         OOwELRWicyj8ylWEU5/bJWPbe/WWEkFrIsxGV12A3pUyKQMmWPmBpg5to7HEApe2EfA9
         ul/g==
X-Forwarded-Encrypted: i=1; AJvYcCXBFWGlrMG37v31LkIv5eI0/0UR46Fv3s/+LD2vjwYyJXLfQ6L9psVmMXPLOzeD7ObYMMdyIl2ie2UCPw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yynppvjd4OzWI6DtRomwUjfSNd+4FE+tqEc7ei/S5w6k7rZZBeg
	hq/NIxHWKnomF7z1x9vfuZVdnn0c+BwWCQT8r3AsdtMwt2UoMKwhsXEnH2oZ2IdDzuCbcgBQtcY
	AaVOuMEFEXA==
X-Received: from dlbrh14.prod.google.com ([2002:a05:7022:f30e:b0:11a:44f1:daa3])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:dc04:b0:2ae:5b71:d226
 with SMTP id 5a478bee46e88-2b6b3ed9044mr3890490eec.3.1768627760880; Fri, 16
 Jan 2026 21:29:20 -0800 (PST)
Date: Fri, 16 Jan 2026 21:28:27 -0800
In-Reply-To: <20260117052849.2205545-1-irogers@google.com>
Mime-Version: 1.0
References: <20260117052849.2205545-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260117052849.2205545-2-irogers@google.com>
Subject: [PATCH v1 01/23] perf symbol-elf: Fix leak of ELF files with GNU debugdata
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
X-CRM114-CacheID: sfid-20260116_212922_206706_1567CE22 
X-CRM114-Status: GOOD (  10.93  )
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

The processing of DSO_BINARY_TYPE__GNU_DEBUGDATA in symsrc__init
happens with an open ELF file but the error path only closes the
associate fd. Fix the goto so that the ELF file is also ended and
memory released.

Fixes: b10f74308e13 ("perf symbol: Support .gnu_debugdata for symbols")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/symbol-elf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/symbol-elf.c b/tools/perf/util/symbol-elf.c
index b8fea12997a0..76912c62b6a0 100644
--- a/tools/perf/util/symbol-elf.c
+++ b/tools/perf/util/symbol-elf.c
@@ -1173,7 +1173,7 @@ int symsrc__init(struct symsrc *ss, struct dso *dso, const char *name,
 		Elf *embedded = read_gnu_debugdata(dso, elf, name, &new_fd);
 
 		if (!embedded)
-			goto out_close;
+			goto out_elf_end;
 
 		elf_end(elf);
 		close(fd);
-- 
2.52.0.457.g6b5491de43-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
