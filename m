Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06195D6CFA4
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 21:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ysjf97+1ljy3V+a/lYD6GKjReLTpUUqZfvbu2WsNlAY=; b=c1NWgyRrsk+oqf
	w8PopPDb2J3MQg4UggW9S0Rcv8LHPbS2Gjhk9t7b4HP5EE5AUd6rsBdy9SidwigGBETe+/TBFcceF
	bIqvlwGTSRF1uOWJHWAsbCXAj9pI4faZtJPv4v9yW5/m63QT+2BG3exRk0mDiCprhWh1KFJmsBWVo
	vb+4yPMxLR7CXRmvB5ZD1++MGKDA1H5pD4Q6TQWPR3x3q3NFaES73Vb8Df0L5Uh55r8+r+uSKKy0U
	a1wYh44GHzVJCXuIwHBu6vvuPjD+VdjoNZkhXcAEtt+iBJb1+1dB2iA+rIqhPmYcVFvYZkzbD8kMy
	syzPcxCMvgmZFgKJT7PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj2Kx-00000007mJq-3lT4;
	Thu, 22 Jan 2026 21:35:31 +0000
Received: from mail-dl1-x1249.google.com ([2607:f8b0:4864:20::1249])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj2Ks-00000007mGJ-3A2o
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 21:35:27 +0000
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-12338749ea9so2028346c88.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jan 2026 13:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769117725; x=1769722525; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zalmwLrK8cPj7cYoTUj/KkGE6/xfnap/Tev3VqTduZw=;
        b=h4d4Tge1AVP91zfHYdXLCf5b5qgEDVWMnN9IvdrL8bby+9LVvTi+aGYk2IaE2Ny4pa
         MEI0wvVfBb0PXp0lFqiFfG/pS7Xw/vwsGjNGB4C6IeGVzTBD2fM9Oh++3mjL5k7KPzbW
         /hfp2HnyBn/Nu2GAF6l0II7dk9L9WA2v7Cy7PEPMZA8JjoYh89VuDRMqq3qGW1k/9jJH
         oUkpBTVytQlZyrr08okq1SsXwnT1H+5svJDMxNZ2F6CqnkAsAInXmd0PrdBDRjxH3wIL
         C/wbjLx1FygHAuUuBA5p9E/ThdJRxRZQGRTyb7u360lDMqvnz9O/AhA1U3xF5d4TkFS5
         8tAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769117725; x=1769722525;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zalmwLrK8cPj7cYoTUj/KkGE6/xfnap/Tev3VqTduZw=;
        b=mmJeg2H3MEYz3VYw/krKh5Aj4eoKg+D0/P4Ow0mcKjBLUYbS6D/7QEiolkutKcJbW+
         hvjn2jcfVDAP+x+WqzjJxMTscnUSAGf9tBdspsQjDsJV4iLRZvzbMUQV16NYuvMMtxwy
         z9G6KyJrfM2vkqmux3Ix32LZrwx01/y2sttM9k0y4PBTzWVe1ykweZvoPUg6/rVkacFd
         QcJg7hSEb4nyjtFPlbBRIi4gYYhN4UBtOjmLTNqFI336ctxGLRd/vFYA78VOonXKV6e5
         wsSkRObiaFSQ1iUkwntYj/Rhq7QDcExDojT/dqcY5Ea6XQ/GNBOKJ3kSY6brO+u5JzGs
         ShQw==
X-Forwarded-Encrypted: i=1; AJvYcCVluGUU+5aUMsYNy+BFxECv0PkMUlZhd4nlCCE1tMGRcxJrHFR2g0W/n7NL9INoIeZurix3myN9kCjmWg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRJNwzLEKrjCcLxk5i6PupKMscuhrNO+rTPn8ZR/gfx329KmIC
	eDH2Ibs4KjBF2Z3Hc7ZsLb8iqszdF0eysFJm0qHspjq45BsRdsvwIRVfMJ4KyEdL7OBzfLkG339
	R3Yl3O/i8qA==
X-Received: from dlii17.prod.google.com ([2002:a05:7022:4191:b0:11d:cd2a:4c1b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:2397:b0:119:e56b:91ea
 with SMTP id a92af1059eb24-1247dbf80ecmr276440c88.27.1769117724953; Thu, 22
 Jan 2026 13:35:24 -0800 (PST)
Date: Thu, 22 Jan 2026 13:35:05 -0800
In-Reply-To: <20260122213516.671089-1-irogers@google.com>
Mime-Version: 1.0
References: <20260122213516.671089-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260122213516.671089-2-irogers@google.com>
Subject: [PATCH v3 01/12] perf header: Fix memory leaks in process_cpu_domain_info
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Zecheng Li <zecheng@google.com>, 
	Tianyou Li <tianyou.li@intel.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Julia Lawall <Julia.Lawall@inria.fr>, Suchit Karunakaran <suchitkarunakaran@gmail.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>, 
	Howard Chu <howardchu95@gmail.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Shimin Guo <shimin.guo@skydio.com>, 
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_133526_788094_4A492179 
X-CRM114-Status: GOOD (  10.52  )
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

do_read_string returns a string in allocated memory, for some reason
there was unused memory allocations and unnecessary strdups. Remove
these and make the "perf annotate basic tests" leak sanitizer clean.

Signed-off-by: Ian Rogers <irogers@google.com>
Fixes: d40c68a49f69 ("perf header: Support CPU DOMAIN relation info")
---
 tools/perf/util/header.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/tools/perf/util/header.c b/tools/perf/util/header.c
index 9a15dd4b7640..eefd1cd73b6a 100644
--- a/tools/perf/util/header.c
+++ b/tools/perf/util/header.c
@@ -3634,6 +3634,7 @@ static int process_cpu_domain_info(struct feat_fd *ff, void *data __maybe_unused
 			if (!d_info)
 				return -1;
 
+			assert(cd_map[cpu]->domains[domain] == NULL);
 			cd_map[cpu]->domains[domain] = d_info;
 			d_info->domain = domain;
 
@@ -3642,30 +3643,20 @@ static int process_cpu_domain_info(struct feat_fd *ff, void *data __maybe_unused
 				if (!dname)
 					return -1;
 
-				d_info->dname = zalloc(strlen(dname) + 1);
-				if (!d_info->dname)
-					return -1;
-
-				d_info->dname = strdup(dname);
+				d_info->dname = dname;
 			}
 
 			cpumask = do_read_string(ff);
 			if (!cpumask)
 				return -1;
 
-			d_info->cpumask = zalloc(strlen(cpumask) + 1);
-			if (!d_info->cpumask)
-				return -1;
-			d_info->cpumask = strdup(cpumask);
+			d_info->cpumask = cpumask;
 
 			cpulist = do_read_string(ff);
 			if (!cpulist)
 				return -1;
 
-			d_info->cpulist = zalloc(strlen(cpulist) + 1);
-			if (!d_info->cpulist)
-				return -1;
-			d_info->cpulist = strdup(cpulist);
+			d_info->cpulist = cpulist;
 		}
 	}
 
-- 
2.52.0.457.g6b5491de43-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
