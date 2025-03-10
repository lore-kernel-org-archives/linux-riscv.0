Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF77C282DE
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 19:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Mime-Version
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WtHzfBT4+JTKy1EPTq9IAtogA0dL+qkh/zFjQA2DInQ=; b=b67/dSME7cIW4u
	Thex85ZDSmj1tK0AJMdCdRau7KRFxUa25weJ0nB+SzzPojWZs0mAel95hF4aPVWFbeVTGnjhqaXFD
	Ax09PqOhAXd5x6JTvU0Ce7GWUxtzBkx96uazyRy931+zQW/8DOuc579WH17SUF3x1rlDMKBJ1PjfN
	MWtopGyN0g4f/Dra/R36QzX1GNAik7WVbsdmyRXrUZzQMO1cr1OV8Xnbx1Xy8IeZVJ6HpZbfQr2TG
	Jbsyw4fdAjCCiiMvJ4/H95xCQdMPOvYEUx0aclxjqi+UU+sQ8N1tVn7rjkg4C0DBuq/VmKt97ZGln
	q6Ir9AD3pX6j0ox0RryA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trjDj-00000003mA4-2hNw;
	Mon, 10 Mar 2025 19:55:27 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trjDh-00000003m9J-2mzA
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 19:55:27 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2242ade807fso98851335ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Mar 2025 12:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741636523; x=1742241323; darn=lists.infradead.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZPtTVgbo1Gc22cvvBNU7TODq9XtOwM1eBGa+Md6htLk=;
        b=XHagPBqU2Fk99V1dI0SYJ0M4RonmtY9LkZfsRbx2aJ+EHR0UHWbHTJZAup08HetYQO
         4lrD70KTZxZ4CBE9taBnEPKqyKKK+sySmBrwH3FRFEs3SpHLVVmxT1LRBsV9zlYrNQUl
         KwpC8jt8WJgWks1OBzj0QRpgU9XFmkNBDPyp0VrKqpWzBZ7/0QPpi5jz9KtExYm83k3W
         opl39rVAFnnLf/RP0It6JtT/JIFs2txvjtbvCOImgdZoX3fbRRWkh0yFwTopnqKHxxg/
         n3X/0Yyp+LOr2+4B9fnkaqqkVc4rljh7ZQ/C8TnWwuErqIeXTN/cu8orvaz9Ga772FcG
         xuQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741636523; x=1742241323;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZPtTVgbo1Gc22cvvBNU7TODq9XtOwM1eBGa+Md6htLk=;
        b=oybFlOj8l5r8l77yb/bxJSRbKJedx81kOEueV7Jqgt8nTICfOPtGUAUA9NrGUS4t2M
         AezEXvELoGxzy+dPT0mvDkGi7+NxHfqmWUJoYqBichVwYsjP941mt5f+Spaldratw+vE
         7bP3wlExfGjLw/uHSn7fMo7n/xYbKROaB79FHpnh8ahpK5E8kqr01jeAm5H8IFgelFM8
         A428k6zQCDIQE2X0HXG0XIsiuvOfGJ7mibbSS7Uv5DULFMS6WrDe+l3BWbYSyUVWWxvk
         4JjrHy9k8YLnxzYD/mOouXzp54vJzkLwCEBmflyqxW5D10XGhy6uMe+yb4/eO68dT/l6
         5xBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOKAOUnJ8P5o2bBNr5kcjKocYRAowWxAjUc8V7X8xH4EXLpsHETzmLbsIN9bONcG28hSygeeCP7p6lCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwAfbKP8Wy2NR18GC7O5L3xvuov71MFvvbxF1wCpp8gKJbisMvD
	f6L7/g+Rp7hXtg9BhUnXupJAiXBaaaKdbbfeDi/madGRvoVyIAGb/04YW27AGXOMsF2i5fa5OH/
	bG9RIUw==
X-Google-Smtp-Source: AGHT+IEJmSQJflyxaKBwX1PYSk5UMMFRR580oxmfwEtt0gz7FirWb1HSugRKiUxFzQFc5A8V/VvGjc2oIPkN
X-Received: from plbkf4.prod.google.com ([2002:a17:903:5c4:b0:223:3f96:a293])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1b63:b0:220:e5be:29c8
 with SMTP id d9443c01a7336-22428bdee3cmr252515855ad.32.1741636523539; Mon, 10
 Mar 2025 12:55:23 -0700 (PDT)
Date: Mon, 10 Mar 2025 12:55:16 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250310195518.2012571-1-irogers@google.com>
Subject: [PATCH v1 0/2] Consistently prioritize legacy events
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	James Clark <james.clark@linaro.org>, Dominique Martinet <asmadeus@codewreck.org>, 
	Yang Jihong <yangjihong@bytedance.com>, Yang Li <yang.lee@linux.alibaba.com>, 
	Weilin Wang <weilin.wang@intel.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Leo Yan <leo.yan@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_125525_703267_73E9EA5C 
X-CRM114-Status: GOOD (  13.14  )
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

Legacy events were historically the priority over sysfs/json
events. This behavior was changed in commit a24d9d9dc096 ("perf
parse-events: Make legacy events lower priority than sysfs/JSON") to
fix issues on ARM Apple-M CPUs. Sysfs/json being the priority makes
most sense, was preferred by RISC-V and gives abilities impossible
with legacy events. Making this encoding consistent is proving
impossible with endless bike shedding, people saying they see
something as a fix then when that fix is provided continuing to
object, etc. Given that in the RFC [1] legacy events are seen as being
preferrable let's just follow up on that and make their use
consistent.

If it isn't clear, I think this is the wrong decision and landing [2]
should be the priority. When I try to have this conversation it just
gets ignored and I want consistency more than my preferred
prioritization.

[1] https://lore.kernel.org/lkml/Z7Z5kv75BMML2A1q@google.com/
[2] https://lore.kernel.org/linux-perf-users/20250109222109.567031-1-irogers@google.com/

Ian Rogers (2):
  perf parse-events: Make legacy events always have priority over
    sysfs/json
  Revert "perf evsel: Add alternate_hw_config and use in evsel__match"

 tools/perf/builtin-diff.c       |  6 +--
 tools/perf/tests/parse-events.c | 13 ++----
 tools/perf/util/evsel.c         | 21 ---------
 tools/perf/util/evsel.h         | 19 +++++++-
 tools/perf/util/parse-events.c  | 81 ++++++++++++---------------------
 tools/perf/util/parse-events.h  |  8 +---
 tools/perf/util/parse-events.y  |  2 +-
 tools/perf/util/pmu.c           |  6 +--
 tools/perf/util/pmu.h           |  2 +-
 9 files changed, 57 insertions(+), 101 deletions(-)

-- 
2.49.0.rc0.332.g42c0ae87b1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
