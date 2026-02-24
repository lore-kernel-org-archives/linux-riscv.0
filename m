Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B4CF357AD
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 14:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2aylq5kQFAajiBMMIdnnD8XM3fx2nAL5TTq9yCiCiVc=; b=xvzRdcgs8h2Hiv
	0qb9oe/RMWxXyMhsVYa0Az7H5Q6R9TQCeHNqAxReXBW6JQ/LmR6HnaRhfNb/PNLH9jzRqdkeDBejY
	oLZMIaOPnms/VzY7dnyMIKpFExBP02nXYEW2n4zDnheKwkKZgjniHVAkFbwa3r/lhDHXSwJNktwiT
	igTdj1AXGZPp/jeLP5+t9Nn99SPRYK8/y3R6Zj9j3l9IhY0dalQO5dvAIFVNCMqVyVh/mdd5TsW4r
	6Y2WsZR/9KD7QrVg4wVUoIjFJ4Xf+vXdT19ed9QGYG6QS4dYYT6mrXejYAr6nHhA7XxVrayt4CVuN
	Qt2ygYsQK1NUiPoHp9RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vutQH-00000002Cs6-07DL;
	Tue, 24 Feb 2026 14:30:01 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vutQE-00000002Cp7-1ur8
	for linux-riscv@lists.infradead.org;
	Tue, 24 Feb 2026 14:29:59 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2baad797d0cso30877148eec.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Feb 2026 06:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771943397; x=1772548197; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SF/9HIjbc6rTAg6numLxHr5OltI8HDgFivsZ6NrsbUM=;
        b=pZhRiFyfz3KWOQ83IB0wt2rJ6999AuiKdBEKrQgp0blKFMVU2KVLaom9qsY4Iq1vJW
         sBiHymtEwnPLxAvFnYlGpUBRJm3PrTuCmClkYD58uRArajjEWk0aXr7ZCv2LYpVT0y1R
         ptKdclnZxnlgfUXZYHcTjHM4QFQqpnG+QZGUizD7GA0KCChys0G1qNJTOoySeElf01tW
         AKd4q8uQIwTzNlbUK1eo7lXD5qhsYmN4QSZDg2tEfJj4Ai5DvSUfa9bVsJ4Xu3ajxn7U
         RkeafKxXZc4f8ETyS2aFJHswq3jyBiudMnkntxupq30JiRm0cFmrfO+qu3MpNocUSKBr
         uGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943397; x=1772548197;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SF/9HIjbc6rTAg6numLxHr5OltI8HDgFivsZ6NrsbUM=;
        b=AnvnQA7Sr4fqbwthc1oiWBxD/uIqA84dmc1cvquqF06SYNNMq5+oM/PaeTbfCcUnnE
         NTbcjLr31Hy1szD5CX1mEr27rkP3GtvEMst4dDWECox0Z2emfj8vWVkJ32qH6txh9S8+
         izaseTWlLb8RM6xWMOyyqNAmV5aJKHle49uJXE7PpCk9S9NwlYFJnN6deqXYJl/oRS45
         weUdX7ywpSBQW4YqEUr8QGnoQ+ddWEnlJqcg1PXyLj1f8kIt5gl44BMekFXdwQOzqIlq
         JUfnr75izk/zUJPx7yDVy8k457ZdbuonZqtbn8su8NaO+Uqcs8JLSNChTHlTAWlv0RZh
         Eggg==
X-Forwarded-Encrypted: i=1; AJvYcCWA6uNE2f48Ooc958QqTb6Bf1d9N3y+yqClf2dGUwPS5oNmzFLlzIq56EBMg17mNcmbITI+sz1m5hi4cA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRwNvll0UcWgSHQhX/kCY+8aNcw85ahElCgXVuCElKQI8kd76s
	ynrAYFclSFMvrZJ18etqpQFv10wKfxX/bTKJ54FMrKgpE2si9sGR0PsvimsqeY4zdDHLWpvPMfr
	n0I1+p3ZGHw==
X-Received: from dybgx25.prod.google.com ([2002:a05:7301:2419:b0:2ba:7b4a:c331])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:6428:b0:2ba:6458:b325
 with SMTP id 5a478bee46e88-2bd7bd0974cmr5588226eec.23.1771943396789; Tue, 24
 Feb 2026 06:29:56 -0800 (PST)
Date: Tue, 24 Feb 2026 06:29:33 -0800
In-Reply-To: <20260224142938.26088-1-irogers@google.com>
Mime-Version: 1.0
References: <20260224142938.26088-1-irogers@google.com>
X-Mailer: git-send-email 2.53.0.371.g1d285c8824-goog
Message-ID: <20260224142938.26088-4-irogers@google.com>
Subject: [RFC PATCH v1 3/7] perf build loongarch: Remove reference to missing file
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Dmitrii Dolgov <9erthalion6@gmail.com>, 
	Blake Jones <blakejones@google.com>, Tomas Glozar <tglozar@redhat.com>, 
	Yuzhuo Jing <yuzhuo@google.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Shimin Guo <shimin.guo@skydio.com>, Athira Rajeev <atrajeev@linux.ibm.com>, 
	Chun-Tse Shao <ctshao@google.com>, Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Thomas Richter <tmricht@linux.ibm.com>, 
	libunwind-devel@nongnu.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_062958_491773_1F3372EF 
X-CRM114-Status: UNSURE (   9.88  )
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

The file was removed in commit e62fae9d9e85 ("perf unwind-libdw: Fix a
cross-arch unwinding bug") but the Build file not updated.

Fixes: commit e62fae9d9e85 ("perf unwind-libdw: Fix a cross-arch unwinding bug")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/loongarch/util/Build | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/perf/arch/loongarch/util/Build b/tools/perf/arch/loongarch/util/Build
index 3ad73d0289f3..8d91e78d31c9 100644
--- a/tools/perf/arch/loongarch/util/Build
+++ b/tools/perf/arch/loongarch/util/Build
@@ -1,4 +1,3 @@
 perf-util-y += header.o
 
 perf-util-$(CONFIG_LOCAL_LIBUNWIND) += unwind-libunwind.o
-perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
-- 
2.53.0.371.g1d285c8824-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
