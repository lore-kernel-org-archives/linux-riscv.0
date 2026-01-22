Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BB1D6CFA8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 21:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ep1xbq3/FgjFPQhPgLN/NMKOURwuMBJa8rJxPnQ1Ic=; b=MyUGrjzL9VhBHW
	GJ6vmUvU5ChOvEVCLVz+n890fNL0T3Ud5l44ZzjEHDER1+VC7M8EcCeq1mnBhyXyboOk1ANWCe+WA
	lh8nNUhh4PFotgEs0Rk1i1EzohsuI6hxPSQSwT8pE/KpCa7PvT8u3gbVV/mDQDxfIQP/YodXjxxUg
	EcdWCAWv1J+UxUiXqrC5OBcrmlyKtrJlitkznj4wxJUBMs7wfn8ZozfRT6W9K7oRRDP1RFbDSZzRa
	V4M89288ZOdfAP4yhdL1g+uB3vuDVFvphEx41+iXvyZ9CurFrnlffCdbhLlFhWolr6VrMpkhZ2oX6
	wPRmIIjaARCsL//aJPmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj2L3-00000007mN8-2oQk;
	Thu, 22 Jan 2026 21:35:37 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj2Kw-00000007mIH-0NIT
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 21:35:31 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2b70c92f404so2062587eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jan 2026 13:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769117729; x=1769722529; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DnbHjkP7sr2MY8dvLIuI6wPgadGKGFiX6WTYohRo5Kw=;
        b=zhLTrDPBW0Nu+S9nGlP0IuRQVwaAvz6c3DyprSns/6FovEt/ZG9AQXMAtaZ/LdCovV
         gSlDb3ywBhaSyLPaJ3OQ6SFCx/buAwN4YSklfBJ79aiq/KSDcfwveG+3J3bePvcZTA9m
         5m05oHlafpuoZtz0hAv3Vpe1iqlbIPSaIdgBjVSpb0fU6v2ZfQiGlYKEn+rQgR9Vw2Na
         s60qdBOdpX5dI4Y3B/VNCbelU2dLpfOB3xNrWWHiactegBcbXo6kK9VO3hffv2abMtJ0
         AFdNe9nafHIuYwO2FWgmxPQ7c/L1iPS3BgNyKuS3MlOhInYPj2pae7uV7RfuQQdCqmRE
         6Ung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769117729; x=1769722529;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DnbHjkP7sr2MY8dvLIuI6wPgadGKGFiX6WTYohRo5Kw=;
        b=YHBv6RI3LuIRQ2Nu3T1q6BCnr1J27MTdCRFOJFsChEmPAjzlTLHaPYImxSxjwGU1Jl
         BRzoCU/+jsF6ZcKU6PonkXc0NmE5pJuhMvEVTC0ubXzXUHY68nBckvjYN/oROx/bnHUF
         m7OphNx+oWmsGofAoBOo9Eiv/rDhyMKqJQGdtT5AggnBXq0s1ylwnw/BiTON3l05/rUW
         NM8JIqk8+KvDB5x3yAwemcyKJzPweHcYOM6NB3JMfDu8Srrk6jmWfltWBvPCLP8Eo6S7
         adszH2ABnWMaFF+opNTw3G2BjIaPtJMh4+vz4UQrWJjgx4C16Kily05HCFdV8MBualrC
         szaw==
X-Forwarded-Encrypted: i=1; AJvYcCUxMGp1LLIXH6ZI7p6yTZR479fgxY2a1CM6RmxogreGe7MiMOHcn1eoZQQ/xEj6G42kc6uDclW8vYaYlA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJymwcIRcprdSBTGP1SzeHNb2T0cpwhFUr28n6rj5L7/cDTmFh
	vy3zKF7mHQJfl8DGKXdtaogB1TDx+63HMhDwYG9q+NJKFf7lzxMbj610/QAAs/0rsdXAbodKdTw
	0zfCjMq1Ffw==
X-Received: from dycok8.prod.google.com ([2002:a05:7301:db08:b0:2ac:32e7:3ccd])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:4084:b0:2b7:2263:3d3c
 with SMTP id 5a478bee46e88-2b739b6d29fmr262486eec.24.1769117728705; Thu, 22
 Jan 2026 13:35:28 -0800 (PST)
Date: Thu, 22 Jan 2026 13:35:07 -0800
In-Reply-To: <20260122213516.671089-1-irogers@google.com>
Mime-Version: 1.0
References: <20260122213516.671089-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260122213516.671089-4-irogers@google.com>
Subject: [PATCH v3 03/12] perf maps: Fix reference count leak in maps__find_ams
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
X-CRM114-CacheID: sfid-20260122_133530_124693_1EED03B5 
X-CRM114-Status: UNSURE (   9.49  )
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

ams and so ams->ms.map is an in argument, however, it is also
overwritten. As a map is reference counted, ensure a map__put is done
before overwriting it.

Signed-off-by: Ian Rogers <irogers@google.com>
Fixes: 42fd623b58db ("perf maps: Get map before returning in maps__find")
---
 tools/perf/util/maps.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/perf/util/maps.c b/tools/perf/util/maps.c
index 8ccc46d515b6..4092211cff62 100644
--- a/tools/perf/util/maps.c
+++ b/tools/perf/util/maps.c
@@ -708,6 +708,7 @@ int maps__find_ams(struct maps *maps, struct addr_map_symbol *ams)
 	if (ams->addr < map__start(ams->ms.map) || ams->addr >= map__end(ams->ms.map)) {
 		if (maps == NULL)
 			return -1;
+		map__put(ams->ms.map);
 		ams->ms.map = maps__find(maps, ams->addr);
 		if (ams->ms.map == NULL)
 			return -1;
-- 
2.52.0.457.g6b5491de43-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
