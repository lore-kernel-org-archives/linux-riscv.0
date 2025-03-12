Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D1AC28B28
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Mar 2025 21:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Mime-Version
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F+kPJJ2eqhBrOTbf7XTQilaMiqkrDS1QsZLFBczbAqw=; b=HqWxcaWSgcdzKl
	bTSHO3hUhtK2f87BmHHLo7YPKBOkJvogM1r7uExfPxe/dspx5/dnNNNU4dVORW6Ym/7MobJ7kwGfU
	koYN68PvJjqGJ6ZCKMqQnUuzp8kgE1xFHIAGBT6Gx1fMWMBzd1ZO+FX5TZDEUqcgv2iLBoXX/VPo4
	29OiavVtnZbbtIEfuOPJhIZxq9PindYTDD1h+Ea5VOOaspCZMddV/rnWP3h3aJYorSkWOk1EcA9dY
	HqHbIX70Nv9hpfEDxEba8tCTb9HJp/YKbZi4TPXKcwRthrtn14rnS6pevs81aZ7CxKw68BWJDW3Ck
	WaPmXYwOsbGMAzwdwjCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsTRI-00000009WPy-2e1R;
	Wed, 12 Mar 2025 21:16:32 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsTRF-00000009WOu-3bb2
	for linux-riscv@lists.infradead.org;
	Wed, 12 Mar 2025 21:16:31 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-22403329f9eso3922195ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 12 Mar 2025 14:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741814188; x=1742418988; darn=lists.infradead.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1R2FkT2tfJZh41ZsJKKpXajtCJc0zCkOgHYDY3bqItE=;
        b=NnqM0RLhK2HUvm8BaQ7WgBR474oiyGchvEfoydekyhzsl6jSjsP52X6t4LItTTSwdd
         8O5kFBCW42KbOJ9/saZK601nWxYGY5b9y68qWxdSUb6PwNGjoW/j7cAjcfH9+MDfz54r
         qckjxka1TyJyU4rUuGyAUXJavTBBMhDr9AESei9fa3LXGHW104azQw9ElOLQjLoZdMqx
         z8tlXANruvF66KzAzvDQTOscK3naZmyKGmHhUyFYphfQtODylWB/9ufISUTpj99ubQij
         yH3RHG8RXsH2XNP7SxVaefe1nfjaKCcS2s3Xs3oRFBIusVXSW0XecLLv/7nGOuF00oGF
         9N5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741814188; x=1742418988;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1R2FkT2tfJZh41ZsJKKpXajtCJc0zCkOgHYDY3bqItE=;
        b=YMdDFVRM6fjyK+pKi/PH8VLCY/Hx11T194e9y2I57bxGS7f6UFJjV6VOpeEFvKv2E+
         ObgepkRB6/mMiNcQCxaCakj8aXyWZeHqr/MJ5blYDdhj1yCFe5DQ6mTFi+js9NuIAWHx
         CzX326x5eSB3T/huXDOEkAsQSdSDh4gcho5AOn94j0auf3eb76r9Jbcz0w5d9UP5z/jG
         1wVmTVJOAe1WvGgYh061yARLqHNhj5MdIILjDlt+4BKzwvgsuz2nrMPNYycCGhhAuPWv
         lJH8bVrglRqyG3QOBRdeur8rtBWULnX5f0nUzHCHLcvUx/KNxVA0WnuJq5RdkVGkE5BE
         +i3w==
X-Forwarded-Encrypted: i=1; AJvYcCVCrfhgqYikE6Oz3Ks8J+u64kK3aWG8NNTG7WL2LAy7d+Ti596hAHF58skZSmd49LdFfDN8LZUluou2QQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwbGg0UYY+AaImQ2ArZsCk0691a0Y+bFUauYab0gzyuF0vICdLe
	f4rGkQ7ANM3KzPUpGGORZkfq4IyL3v8heaPwCLyYTeVzHIBlOM+Eab7wj/iWB4u8b7VH8bOEzQp
	Hiwwszw==
X-Google-Smtp-Source: AGHT+IG2WLS74cPcK7E5Wvi8f2Oxevqu5AVQwTAFnu05lz4gonixU5828tmhcN0VzTUeoq4/BGCQ/0DZgSSp
X-Received: from pfbho5.prod.google.com ([2002:a05:6a00:8805:b0:736:4ad6:1803])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4b4a:b0:736:6ac4:d1ff
 with SMTP id d2e1a72fcca58-736aa9e7154mr37167458b3a.3.1741814188109; Wed, 12
 Mar 2025 14:16:28 -0700 (PDT)
Date: Wed, 12 Mar 2025 14:16:21 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250312211623.2495798-1-irogers@google.com>
Subject: [PATCH v2 0/2] Consistently prioritize legacy events
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
X-CRM114-CacheID: sfid-20250312_141629_896975_ADC97C97 
X-CRM114-Status: GOOD (  12.71  )
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

v2: Missed revert of stat-display logic for json event prioritization.

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
 tools/perf/util/stat-display.c  |  6 ---
 10 files changed, 57 insertions(+), 107 deletions(-)

-- 
2.49.0.rc0.332.g42c0ae87b1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
