Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61812D2F7D7
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 00:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BxduVvJyI0SYz+YMOrMrp3rUx4OYDXFxwJCUbv9ZGUc=; b=Pdh2FymtrrfNxm
	1V1ffsS1eNZqVUUfbkzgmcwnmItusopOeAl1BWyj7wbEJQ82FKWonJvGSpnivOm0bBpZmciCpzGum
	ofTnYP/KFZ37aKUVLDtbGzlKKpzFQhncGzj+iB6f50tOChUywKyR2QmjiF97+y9LYaQkbBuUfBvTO
	Vi/rfhRlJd3FZv/jL6m7knbjBXLDYuwL1CmCndCPkGwf8kMln1dtVPzqrQCXOFva0SZKfobuN1f8d
	UGGLrmg1hVDgddgIs/nX4bYIKgDPyo6jnLEjO8iJ78zQA6UUuKSHWUOTu0rVPf1ytnbPKIlxk8HGC
	X5k1vS40LWSJz04WOp4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1EbO-0000000DNXP-1eaB;
	Thu, 17 Oct 2024 00:42:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1E9t-0000000DIK0-2RtO
	for linux-riscv@bombadil.infradead.org;
	Thu, 17 Oct 2024 00:14:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:To:From:Subject:
	References:Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VU9D23fFMOa9LXkPnFVSmMuH/zksDMncppJ/JVZzd4k=; b=UhMHnIpFIiXvPFDn7D69KRInYW
	otXF6KMgcIBZx4Sudk9Ufnm82w78R1tF8DkLP+sclqy+Mr4bHVymF9aQkAjTMmGU8ULqzMcKyhbCk
	NllotFXAdFDpjJ0+FjA9fpRtkQjegerFR6xWltz+PlLBXhijXEyhYJ1n/jWokDp27SI4/gbjZdN0t
	79dS8AO+WmMYdNzEy4FUfwwN5TKNYuqhDbTByjj7xz/a8rGIYsI/88oTT+teJUrazvp7EsVwKJcU5
	LBBU3CAaniPoERpq/rEAPt7oYYHeUYxuZJIiWQ5Rd6KvDJ0IZE6FmoxF9WxSw01P7DcbBlzmmscL6
	1YJKHwHw==;
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1E9o-00000006yBE-0tKY
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 00:14:27 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e1159159528so2299361276.1
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 17:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729124062; x=1729728862; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VU9D23fFMOa9LXkPnFVSmMuH/zksDMncppJ/JVZzd4k=;
        b=PPzEaX/GWzmKByzueoTIx8xNgVB8ueYhTL5Xn+0UBKqXvs6DTV3AK0df49xKDI6H9J
         7VWbZrE/4vARXytmF2OBjJES5UWEyf/zKsrsn9np+/dBj0+ZOWQ64tZkx7CTLmOU96pF
         UqQUlwCHByFqyfOe5acdj+YaV6P/9q7a6sO9CWhHSlCYVzB8sEw+eCjQGz4MDqSUGI/4
         y+6a2cHKsfx2qgMQsj72JykcZiMCX248ZpUISE56oizuSQajM+BWYyadJ0PchybNTxW/
         7QX2K75cgHTn1cJTRuB/OggS9ZekGrf+jl4k3rSd1EC6LLoY6Rl3vcv3UbcccZT4cDk0
         cVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729124062; x=1729728862;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VU9D23fFMOa9LXkPnFVSmMuH/zksDMncppJ/JVZzd4k=;
        b=FVseAkMUt/OgXR8opn/xLzdBWMXt6IogpfWWhQr/ewxQCIiDUfTM6u3+MvT8seXrGV
         rh8EdMETj5IEnThhEUq7GYQeM2ocKb5GlzTKXHxx/2ByaB0wPRCUxC23KOPw1T9goSOL
         4TLyJquTI8yIdiQwZHOoOhLsWDoa8aRoXAkiid5gKW7NYR3t2lVwaWafVuYJesuueX6G
         KcjPnNFX2Yow+MBuAy92iUZ+ck5ga1DrC5suB1Cx7n++0LstJCh0Fyni2qxpcsyXY2pp
         lmwQAVO7MVPyrcQQI7J216I5KnJXih72EZSKV9b4mk0E7gujRMDafyR+Zi8sUr1Ut+Xr
         VU7g==
X-Forwarded-Encrypted: i=1; AJvYcCXW09r5fVZMqfIOYb41Zw4SIs0elpvzAFC8Aj+EJPWEAPvKdBMjCo4ztpHvfxhStFLBBH5nS7iUMF+t/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/ofhOKEqFwhgpi+0j1fvCz5gi6kpgGB3STq7yhSnc+b+CsAsS
	P5yy7V88ynt/vVu8CWSgGjhrkTw3dEqamZrkwrNkErCF66H1A24+a5k/mr8lhvXDLoGLzU3LD5X
	ZUrQ+4g==
X-Google-Smtp-Source: AGHT+IFAHdFpfyYHAxh33deC15C0o4iPWMQpiNWeQk6y+OhOBawQMGHjEN4HBQ/OuO3SGFQn1AE+qnHXoGYY
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:a00a:f237:9bc0:79c])
 (user=irogers job=sendgmr) by 2002:a05:6902:d47:b0:e29:7587:66d6 with SMTP id
 3f1490d57ef6-e2b9ce7583cmr2127276.4.1729124062376; Wed, 16 Oct 2024 17:14:22
 -0700 (PDT)
Date: Wed, 16 Oct 2024 17:13:51 -0700
In-Reply-To: <20241017001354.56973-1-irogers@google.com>
Message-Id: <20241017001354.56973-9-irogers@google.com>
Mime-Version: 1.0
References: <20241017001354.56973-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Subject: [PATCH v3 08/11] perf probe: Move elfutils support check to libdw check
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
X-CRM114-CacheID: sfid-20241017_011425_650319_88084425 
X-CRM114-Status: GOOD (  16.57  )
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

The test _ELFUTILS_PREREQ(0, 142) is false for elfutils before
2009-06-13, but that is 15 years ago and very unlikely. Add a test to
test-libdw.c and assume the libdw version is at least 0.142 to
simplify the build logic.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/build/feature/test-libdw.c | 10 +++++++++-
 tools/perf/util/probe-finder.c   |  2 --
 tools/perf/util/probe-finder.h   |  2 --
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/tools/build/feature/test-libdw.c b/tools/build/feature/test-libdw.c
index 71c6f8e3b0ee..2fb59479ab77 100644
--- a/tools/build/feature/test-libdw.c
+++ b/tools/build/feature/test-libdw.c
@@ -41,8 +41,16 @@ int test_libdw_getcfi(void)
 	return dwarf_getcfi(dwarf) == NULL;
 }
 
+int test_elfutils(void)
+{
+	Dwarf_CFI *cfi = NULL;
+
+	dwarf_cfi_end(cfi);
+	return 0;
+}
+
 int main(void)
 {
 	return test_libdw() + test_libdw_unwind() + test_libdw_getlocations() +
-	       test_libdw_getcfi();
+	       test_libdw_getcfi() + test_elfutils();
 }
diff --git a/tools/perf/util/probe-finder.c b/tools/perf/util/probe-finder.c
index d6b902899940..b6775d3bdeac 100644
--- a/tools/perf/util/probe-finder.c
+++ b/tools/perf/util/probe-finder.c
@@ -1379,9 +1379,7 @@ int debuginfo__find_trace_events(struct debuginfo *dbg,
 	if (ret >= 0 && tf.pf.skip_empty_arg)
 		ret = fill_empty_trace_arg(pev, tf.tevs, tf.ntevs);
 
-#if _ELFUTILS_PREREQ(0, 142)
 	dwarf_cfi_end(tf.pf.cfi_eh);
-#endif
 
 	if (ret < 0 || tf.ntevs == 0) {
 		for (i = 0; i < tf.ntevs; i++)
diff --git a/tools/perf/util/probe-finder.h b/tools/perf/util/probe-finder.h
index 724db829b49e..5ced3b058fd8 100644
--- a/tools/perf/util/probe-finder.h
+++ b/tools/perf/util/probe-finder.h
@@ -63,12 +63,10 @@ struct probe_finder {
 	struct intlist		*lcache;	/* Line cache for lazy match */
 
 	/* For variable searching */
-#if _ELFUTILS_PREREQ(0, 142)
 	/* Call Frame Information from .eh_frame. Owned by this struct. */
 	Dwarf_CFI		*cfi_eh;
 	/* Call Frame Information from .debug_frame. Not owned. */
 	Dwarf_CFI		*cfi_dbg;
-#endif
 	Dwarf_Op		*fb_ops;	/* Frame base attribute */
 	unsigned int		machine;	/* Target machine arch */
 	struct perf_probe_arg	*pvar;		/* Current target variable */
-- 
2.47.0.105.g07ac214952-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
