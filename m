Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC6AD10BF7
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Oct 2024 12:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DD+DWr/glCrU9mz4sCX1+uHDFJCaNoPxC94D6ActScQ=; b=P8qV4WEqobAVD3
	I2wy2jKEWc5cU+cttLBbH4SQ+5Nw6BQQIM59c7+VqFLdTNDk8xl4K6f1+NjObd5JgmeYimZnWPDDi
	5tymGHGBZbeq1qnkQbi4muGjmY6Ew7bmu1gRMwMapvfxBXFa/5G0FNNQJqFCq7xvNr+jlevrzLJJ2
	KzKnfM1Hnx9uVeXNI9TwkgJeM7ii+U8bS4WrMjTDpiVZtuPN1u3IXhkEuoc7QAmqgs7ZDRFwHE83K
	0TCC8A1owHW3j2gmy46vKcYN0XMPMSvUAsToAyCLr3a12Pylfr3xc80kFM/PHSVZDL5XBSITVK0nr
	52febVXhe5E/S+VINQBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4fk7-00000006aXK-2KBg;
	Sat, 26 Oct 2024 12:18:07 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4fk5-00000006aW6-2euj
	for linux-riscv@lists.infradead.org;
	Sat, 26 Oct 2024 12:18:06 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e28fc60660dso4833480276.0
        for <linux-riscv@lists.infradead.org>; Sat, 26 Oct 2024 05:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729945084; x=1730549884; darn=lists.infradead.org;
        h=to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fBcJl01TtjB1sQ+coZ3yEQeNcjr8kffC1BqiKyM+Ja4=;
        b=fgAZMLdV8dwmOIi6xrBE2/dwTjlq0RNleI0XMJgIliJwmL1pK+HYwrx8gPpsfOB4mT
         SgvIKF1Q0UGfJLLCv2LlA/sBKYUvOhWLTAi8MlSHzmW7CiuiEFX1JH/c8rVjr31on+SS
         xXSsbqImqF31wIJ/g7VUJSjNrr7nEGWTz1sLpw6+5qchbq7e3LPRmLGiLOHw+CcNLQg+
         BUS5l8b73o8+4Qx2WHNHHgEiW12XdXSiNhWqwfWyJbf9D1rU+abH5BxJJ9oyeF/YQh3g
         SpbiPmjLEvUH5usob3RLNTuUqqV+gNTKdxosdzrhDDB7gfbbpGtfWjGLmgXBGOEeGaIF
         C+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729945084; x=1730549884;
        h=to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fBcJl01TtjB1sQ+coZ3yEQeNcjr8kffC1BqiKyM+Ja4=;
        b=QHhmVrZG5i2rVpAFczWmnqQuJOnG56NnL3TNDkxqp1NQpIBuM4NbhgTdUZ2gaaoaP3
         2KzG3Q+bJhkCupN1+uFVc3Nq7xdJzVKF9F3pu3PCxa2cxubGmzNwUYZ8PAUz5jb8RO25
         SbqPn8E6YurvAhl+SvXm7VAE5FuoQzzKo9YHltEFngy8JzGS/KDg7WIjl8qX7BzTG11b
         kzEAfRFCiMyxW8cTJN5jhoCxEoEyixIKmqDHPrKHJMZjXUkyWRMPloYOrPyB9xA65oQo
         oJ1Anq0D9f99Aoe4H3IWXHW42hP9HuhAagFJKXRKaRrIXPdZwUxAlxPemx6A0ZmpMOY2
         WgDA==
X-Forwarded-Encrypted: i=1; AJvYcCWWlNb2oiFNvZKG6sI+sfMT/VnGO+OUKepXdbQ0oLBPXInSRjw2i+Xd5I0JOV9G37KIlKjgMcBFZMa4Xg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4CIkuUwfmd7yGw2V13/zMKhk3cBeSalWPZIh62acPAe1/NlxA
	RIi0tmvnR1WRWKWDspo4yr4/sm9TtTYCyeS3nUVUcTPYEEINxjCBMxBVYsAY8/K8g6cvAxTm3Z1
	pUL7wxQ==
X-Google-Smtp-Source: AGHT+IE9zYMgTwSHLGYlj300YfFrmvke8frEqe5oUqwbyU39/+jljEJ0ran0v7PIwH2GumKW+rj4eS6UlTFR
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:4bc4:f7cc:83b4:dece])
 (user=irogers job=sendgmr) by 2002:a25:a207:0:b0:e25:6701:410b with SMTP id
 3f1490d57ef6-e3087b792abmr5358276.5.1729945083545; Sat, 26 Oct 2024 05:18:03
 -0700 (PDT)
Date: Sat, 26 Oct 2024 05:17:54 -0700
Message-Id: <20241026121758.143259-1-irogers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Subject: [PATCH v1 0/4] Prefer sysfs/JSON events also when no PMU is provided
From: Ian Rogers <irogers@google.com>
To: Atish Patra <atishp@rivosinc.com>, linux-riscv@lists.infradead.org, 
	beeman@rivosinc.com, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, James Clark <james.clark@linaro.org>, 
	Ze Gao <zegao2021@gmail.com>, Weilin Wang <weilin.wang@intel.com>, 
	Ben Gainey <ben.gainey@arm.com>, Dominique Martinet <asmadeus@codewreck.org>, 
	Junhao He <hejunhao3@huawei.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_051805_732487_CB0DEAD2 
X-CRM114-Status: GOOD (  16.28  )
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

At the RISC-V summit the topic of avoiding event data being in the
RISC-V PMU kernel driver came up. There is a preference for sysfs/JSON
events being the priority when no PMU is provided so that legacy
events maybe supported via json. Originally Mark Rutland also
expressed at LPC 2023 that doing this would resolve bugs on ARM Apple
M? processors, but James Clark more recently tested this and believes
the driver issues there may not have existed or have been resolved. In
any case, it is inconsistent that with a PMU event names avoid legacy
encodings, but when wildcarding PMUs (ie without a PMU with the event
name) the legacy encodings have priority.

The patch doing this work was reverted in a v6.10 release candidate
as, even though the patch was posted for weeks and had been on
linux-next for weeks without issue, Linus was in the habit of using
explicit legacy events with unsupported precision options on his
Neoverse-N1. This machine has SLC PMU events for bus and CPU cycles
where ARM decided to call the events bus_cycles and cycles, the latter
being also a legacy event name. ARM haven't renamed the cycles event
to a more consistent cpu_cycles and avoided the problem. With these
changes the problematic event will now be skipped, a large warning
produced, and perf record will continue for the other PMU events. This
solution was proposed by Arnaldo.

Two minor changes have been added to help with the error message and
to work around issues occurring with "perf stat metrics (shadow stat)
test".

The patches have only been tested on my x86 non-hybrid laptop.

Ian Rogers (4):
  perf evsel: Add pmu_name helper
  perf stat: Fix find_stat for mixed legacy/non-legacy events
  perf record: Skip don't fail for events that don't open
  perf parse-events: Reapply "Prefer sysfs/JSON hardware events over
    legacy"

 tools/perf/builtin-record.c    | 22 +++++++---
 tools/perf/util/evsel.c        | 10 +++++
 tools/perf/util/evsel.h        |  1 +
 tools/perf/util/parse-events.c | 26 +++++++++---
 tools/perf/util/parse-events.l | 76 +++++++++++++++++-----------------
 tools/perf/util/parse-events.y | 60 ++++++++++++++++++---------
 tools/perf/util/pmus.c         | 20 +++++++--
 tools/perf/util/stat-shadow.c  |  3 +-
 8 files changed, 145 insertions(+), 73 deletions(-)

-- 
2.47.0.163.g1226f6d8fa-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
