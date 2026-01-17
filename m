Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61ECFC9830D
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jan 2026 05:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Otw4EQB4h7B49DaeUGFDaOuy9OU14mTw6Nkkpf49kKM=; b=c1KsAoAbqEQMYh
	bIQA2xBtqOArEsV+hLv0gEIcgqmPDVwdNZolRdmQv6FrggilL4QIbruTnNorEwTFPdDXq10odbqc+
	ww0QXNotOwa48YdzOEAEFmpmd8fPH1UjoUciPqXroLzGNL7RsAbwlhqYM33bxfsEGyPcKi3JzwfKh
	A9UPQJ2t6DsAA9X98MQCUobQMCwBncB7R0r8N7owsnBi7QEHPi0Fb8bFDBLFd0RHMzfIH2xZbkehb
	CuaooNKzt3fBRKE0ROyGAHDZrJrXY2HOFhxNZkdSG8VHLioaBWVMe+77PneRb9vTWsXhYzx26USNy
	hfYa7dUORqFZeIpzW3oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgysW-0000000FEYR-0eid;
	Sat, 17 Jan 2026 05:29:40 +0000
Received: from mail-dl1-x1249.google.com ([2607:f8b0:4864:20::1249])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgysL-0000000FEO4-2LRQ
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jan 2026 05:29:30 +0000
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-11b94abc09dso5088511c88.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 21:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768627768; x=1769232568; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QanJEL0okHblW7w6/vRkxVN/qYTBTTJdOuW3T6wN39U=;
        b=APDGs4pTHO6RZ/IgNmZBxbdfZIHDguwcST7gpQV9Kndrz3It23uiVuSGRchHvZsTFZ
         oOuj5zBre/s9xQY/9njbo+EFdguhJpq7tkt3dTN7Dv/cLER0YOnihUHlZE6dI9UF4mHt
         h2nDGYFzwdvfHG+XRVbZMbntb24tJ0OaXsX12kXekcz9yIex4wrdGtXKIEJHj6puOni+
         3WHU9MVOXvOKpFQofhUFqAe6Z9a8EHK7AMirSh61+R3y/QOD9RcK6piKS9stfiqACXIe
         J9v8RWXbOxSWnGVnKQL80r5RRLIgUvFWlKg/2ec2+pVZ9i6IBqcreize9kDXh9LJzFTB
         aiLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768627768; x=1769232568;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QanJEL0okHblW7w6/vRkxVN/qYTBTTJdOuW3T6wN39U=;
        b=I+oWS78P7GiKw6N5CbmZW5lGlf4gKF/TYF9ZmMv7mbKx1Ba5nNh83WCxFQPntV4Kat
         H5X+mLqikb8mYPY1TRHVStLsw5kyCu2OomBnYgK2TMqP2Px1ZjJ9YBhfLibofK3rImZF
         4sSxFepHmes5SIm4O8WBVHZRBYaJDoqjFCiNbddcChQDobGYxX8W0/TDdiJ2Sm+zLvhr
         IQ8BUOQltCq0M1q5m+fgfsNr0X/YPR6dS2BaWNLLmfZRefvSw0apbiYj7mewMJ8pChl6
         MTMplzD8VCwa+dTGFVS6ZqnXiQFBOC0u4whfd1mZ1BjLbDom/QoY9sZS7NQ86bEkL2gh
         bCzw==
X-Forwarded-Encrypted: i=1; AJvYcCVciV//P/1KXMkARcvaVZ0LWr1Zorjhbey4L5EXTpIcMaH2oT+UBA9Z97hJlUPo8Ol50DfmGrcfxSEzhw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx13guZJnotigWfw7O/YzRfIETQqbAPLf+s5p2dSKLrF2QLPPgq
	dg5cw9imMG2bxb61wnnXgKnAL0YPeTKDExzg0h4GJ7GnN9aoew9p/cpvTfaW8YruhhqS982e5ak
	m/dQkAneepw==
X-Received: from dlbcq13.prod.google.com ([2002:a05:7022:248d:b0:11d:cf4c:62ab])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:2487:b0:119:e56c:18a8
 with SMTP id a92af1059eb24-1244a7257e1mr4331178c88.16.1768627767987; Fri, 16
 Jan 2026 21:29:27 -0800 (PST)
Date: Fri, 16 Jan 2026 21:28:31 -0800
In-Reply-To: <20260117052849.2205545-1-irogers@google.com>
Mime-Version: 1.0
References: <20260117052849.2205545-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260117052849.2205545-6-irogers@google.com>
Subject: [PATCH v1 05/23] perf libdw_addr2line: Fixes to srcline memory allocation
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
X-CRM114-CacheID: sfid-20260116_212929_593258_03A50980 
X-CRM114-Status: GOOD (  12.42  )
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

Some irregular stack traces are causing double frees and memory
leaks. Make the code robust by proactively freeing and being more
careful with the memory management of the leaf_srcline.

Fixes: 88c51002d06f ("perf addr2line: Add a libdw implementation")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/libdw.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/libdw.c b/tools/perf/util/libdw.c
index e4bfd52bd172..b96c4e0d728f 100644
--- a/tools/perf/util/libdw.c
+++ b/tools/perf/util/libdw.c
@@ -42,16 +42,24 @@ static int libdw_a2l_cb(Dwarf_Die *die, void *_args)
 		call_srcline = srcline_from_fileline(call_fname, die_get_call_lineno(die));
 
 	list_for_each_entry(ilist, &args->node->val, list) {
+		if (args->leaf_srcline == ilist->srcline)
+			args->leaf_srcline_used = false;
+		else if (ilist->srcline != srcline__unknown)
+			free(ilist->srcline);
 		ilist->srcline =  call_srcline;
 		call_srcline = NULL;
 		break;
 	}
-	if (call_srcline && call_fname)
+	if (call_srcline && call_srcline != srcline__unknown)
 		free(call_srcline);
 
 	/* Add this symbol to the chain as the leaf. */
-	inline_list__append_tail(inline_sym, args->leaf_srcline, args->node);
-	args->leaf_srcline_used = true;
+	if (!args->leaf_srcline_used) {
+		inline_list__append_tail(inline_sym, args->leaf_srcline, args->node);
+		args->leaf_srcline_used = true;
+	} else {
+		inline_list__append_tail(inline_sym, strdup(args->leaf_srcline), args->node);
+	}
 	return 0;
 }
 
-- 
2.52.0.457.g6b5491de43-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
