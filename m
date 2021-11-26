Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AE7C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 22:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qB475sVfjA7j1NUM8qp2PLvua7eAlEysY6j7aV3GvNM=; b=eqzeI1t4FhLxjn
	BQiOQUwRAuQEo6L72klHeE1K6ZbrQkY688ojOOaqGU5TNqjq0JTgY3TOpGLIAsnuAatPQzij6XQOf
	3gwJ7gj8l/QN0uV6iPhBfEcKm2tWHM/e4Y5wENbM7hAjRC6eBuBZjrZZVqWjLP2nMn43iASjfDa+3
	tz3+VgeeUisBWUhH4zs1sYfZZ1WNldZ5ctezvxNjHIzEm/bJmLUE64EqGqpDN1uNVJhBODX7OFqMi
	BBfGU8OimJq+tIJbo4sdXaMqncyWMPQ4LjQoHeamSGtM+/U8NjNHxx2JYJpo4D0YEpgydVT0Yjm62
	rXqGKKADohcdXGvNRvMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqjkf-00BuCp-7Q; Fri, 26 Nov 2021 22:31:29 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqjkc-00BuCK-Id
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 22:31:27 +0000
Received: by mail-wr1-x42b.google.com with SMTP id u1so21435500wru.13
 for <linux-riscv@lists.infradead.org>; Fri, 26 Nov 2021 14:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vzycsHuQSReBj1bUpfhIwziDiaIARC7YgVu13ZE149E=;
 b=o4OMEDcGL6/mJDWKAAnXfWf3+FumNwYF/Mz+F8k9Jlbk9rBawRIMRlwE8roTEwiUua
 5PCvCiaU0/Z8mQ1+Bx99n0ETdB7ZOheFh9w6g47+7USuc2DhibxVv+2PeOS3JnKmG+76
 w+Vhj2FOqOwDs9ojaydbVbHac6FL9b/eLajx6Vk0RV5VT0/9klfD+t/6kJR57cqz8pAD
 kulrlUbLJ11DAp6R4Jo8UDJyCmwr4cvaaeSeaj9s+F/D7mqv5qioT9PFRMnm7Kw38nOD
 tHXYCfTJ6AKkaDQ57Os68xYmfW6zP9OYwTuyxp6vB/FzSmaLK/ipY4pMPk1T9sISpBrO
 ru6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vzycsHuQSReBj1bUpfhIwziDiaIARC7YgVu13ZE149E=;
 b=mcLd+q87UYDQ2vhU/WopSVPd0Sp6IS6FKshTjWPx6vvx7GGOPC4jxeTwkNfsW2v/qe
 t8Uijj4sNoi/d8UUEWvuVU5adxCpuq5egu9rvuFZZuHFFPOoGBtxS9yzpJ5UjHngXFGl
 X4M6/57s6R8xK1ZHx0sL0fVjLNDCXFn5vqQt++haCAJEtTZ/3eSRSh6ufOeA0pP4ybbe
 ow6rHsmWtw73jpGIv7DUDYU+EKYFcA+1eJY/2dzNxRvSbuYvrVi+wqrUUrtjjfbq5E+r
 mgDRJJpDuutlvdAAAvOBHxvRY2+PW8Wtaj5pPFcjwMGjtADMeMCiCUS9Tfbzp1ESrtlX
 ijWQ==
X-Gm-Message-State: AOAM532eVVsDLqE4+cMj4UOq9zsGsrNJdK8OJcQ66z50fZ9GIowehwAo
 LCDnvQmrNXf2JA==
X-Google-Smtp-Source: ABdhPJyo/IITKp614mlK65Ll6L5bsQWurHOd2/rQpQSYeyJCW6LbTL0lSFK5lvUF1wwiy51mEm2CRQ==
X-Received: by 2002:adf:8296:: with SMTP id 22mr16446971wrc.581.1637965884784; 
 Fri, 26 Nov 2021 14:31:24 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
 by smtp.gmail.com with ESMTPSA id w4sm7070745wrs.88.2021.11.26.14.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 14:31:24 -0800 (PST)
From: Colin Ian King <colin.i.king@googlemail.com>
X-Google-Original-From: Colin Ian King <colin.i.king@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: perf_event: Remove redundant initialization of
 variable ret
Date: Fri, 26 Nov 2021 22:31:23 +0000
Message-Id: <20211126223123.1125916-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_143126_660952_14F6DBD3 
X-CRM114-Status: GOOD (  13.07  )
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

The variable ret is being initialized with a value that is never
read, it is being updated later on. The assignment is redundant and
can be removed. Clean up the incorrectly indented following
declaration of variable code and move to the same line as the
declaration of variable ret.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 arch/riscv/kernel/perf_event.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/perf_event.c b/arch/riscv/kernel/perf_event.c
index c835f0362d94..cf3e2ac9bbb2 100644
--- a/arch/riscv/kernel/perf_event.c
+++ b/arch/riscv/kernel/perf_event.c
@@ -156,8 +156,7 @@ static int riscv_map_cache_decode(u64 config, unsigned int *type,
 static int riscv_map_cache_event(u64 config)
 {
 	unsigned int type, op, result;
-	int err = -ENOENT;
-		int code;
+	int err, code;
 
 	err = riscv_map_cache_decode(config, &type, &op, &result);
 	if (!riscv_pmu->cache_events || err)
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
