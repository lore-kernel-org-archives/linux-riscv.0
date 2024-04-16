Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83811C04FF6
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 06:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8bjLFRDJ85oiY33eV8aZaHWfAUPTHQNsHYoBbwRWwKM=; b=g8mcngGNps2wLX
	2SHpnFnCfSjd73V/oGbSXryxu7uBvV7qmCTBqMSEWVzOVswdvPGzQ/OHu2kcJHF9jFX6L7FG4DlZ4
	o2ZsWRpJbJ9uaRQE3ZK8myu7SneuBfo8OchZmdO9MVttk2tpe2PFXbplghgPiQbi65HksUo44YFjO
	NpYbxqte+5aoxNKVuL2a1YTPWi4Ht/RmFwnOGcrrbc7moA8K44UMpPq+wTqVM4lZDkTWCo3EgRaQg
	fH3saCRmXdrCCe7nhqCEAgV4p9+F6jLAVTpPphQypX4rOLpjBbJkeiAj4kbUuYxgc89voP+M/NEav
	RhLC6HhfRKTkmwxouuGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwc6f-0000000B24o-30Jx;
	Tue, 16 Apr 2024 06:15:49 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwc6d-0000000B23e-0hqn
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 06:15:48 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-610b96c8ca2so67231357b3.2
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 23:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713248144; x=1713852944; darn=lists.infradead.org;
        h=to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1L5nQxmaIBseTv3eUkvLYgl4v+fhf+bdZ7bLGNPrKqs=;
        b=mwdiy8mN0AIPZU0EWGJOBTgseYd1Mmj43MCvlSnMkEHKfBNwFUMtkFeWrJ1RZd+Ouj
         AMZtDv9cDAnKcxGdB14KdH52hrumibyIP8M2qb5+Ebmk8pNdWMJYenRDh8j87vIm5XHz
         YgAsn+ZtT08W88G6+Okqmi1lhTLo1v/lqi/UcTzYkpqhEyOTB0xt0nGsFE4LHnErIPkO
         GgvYldnDOah28OBO5YsCNO1dDS0Wxy/6F8OIHDVLxkZcJ8zoP1UazQSL72nDs74vCtx7
         FJg7oaUKswLA86Q94k7EiSVbKurr+Xe5fq+Qrrmrn3qSHVo/Y0WU22hO7C3m3Ip4TVE2
         kL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713248144; x=1713852944;
        h=to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1L5nQxmaIBseTv3eUkvLYgl4v+fhf+bdZ7bLGNPrKqs=;
        b=Dk6/M6kj6Rd7aGREypnh0hee2cj5GAXKN65a13b31hKGWjPAUaspUI2J4PQ9Oxes5Z
         kuLdbSkcyga4ILbUd6oeloXn/dNvvzteq9L+4dDDf4TWroh8tTz6lh1GDShMjQGddDZa
         Fz7zHKwXi4/6sD/KUxIgISaZpvD7OpVKv/ene8hU3XrhffuDmaFfUAjmf8ZwsUG4Lsw7
         lDzjy5b6fuG4RY8+tv7WPnNTvuymcLIshYTzTHMPBLsOJDogQKoIm2RhyQK1luSkOl3E
         PqnZcQKFvYZWo/G/cnxQPi3ClQhZI4caRPLkAsrwl5640X6d2Y6XuzjzYguaytePZEAU
         VRrA==
X-Forwarded-Encrypted: i=1; AJvYcCWqUpevPkLqr8YEsAUYV2aDf+eClDDbPSMzdP8ViKeC88NpOiPTjjNXYHo/KaFBSWD3knpoE2g24xRfwv4cswwJPnmuAPKiqnYU6NwCCoMi
X-Gm-Message-State: AOJu0YwPmrRXsEH06G95lyLvaZVLan4tgfSD4brCRkMWPc/AtsAYUS+V
	f4PiLWPBqTz32dlugViG+SUXix2W5EcAoznTbgV17T2iGJ5fRyO4mB2JJH3MQDdI0Rez7rcs652
	XS0zR/A==
X-Google-Smtp-Source: AGHT+IEA3B55PHeFnorQTRTaPmQGXFGj867ryFo0kz7N/R3DDO6sXqkF9UwTo2cE7HmZ5sd27AE/abgmLPXz
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:30c8:f541:acad:b4f7])
 (user=irogers job=sendgmr) by 2002:a0d:d74e:0:b0:611:747a:daac with SMTP id
 z75-20020a0dd74e000000b00611747adaacmr3417811ywd.0.1713248144106; Mon, 15 Apr
 2024 23:15:44 -0700 (PDT)
Date: Mon, 15 Apr 2024 23:15:16 -0700
Message-Id: <20240416061533.921723-1-irogers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Subject: [PATCH v2 00/16] Consistently prefer sysfs/json events
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, James Clark <james.clark@arm.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, linux-riscv@lists.infradead.org, 
	Beeman Strong <beeman@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_231547_342827_0BB6CA31 
X-CRM114-Status: GOOD (  10.17  )
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

As discussed in:
https://lore.kernel.org/lkml/20240217005738.3744121-1-atishp@rivosinc.com/
preferring sysfs/json events consistently (with or without a given
PMU) will enable RISC-V's hope to customize legacy events in the perf
tool.

Some minor clean-up is performed on the way.

v2. Additional cleanup particularly adding better error messages. Fix
    some line length issues on the earlier patches.

Ian Rogers (16):
  perf parse-events: Factor out '<event_or_pmu>/.../' parsing
  perf parse-events: Directly pass PMU to parse_events_add_pmu
  perf parse-events: Avoid copying an empty list
  perf pmu: Refactor perf_pmu__match
  perf tests parse-events: Use branches rather than cache-references
  perf parse-events: Legacy cache names on all PMUs and lower priority
  perf parse-events: Handle PE_TERM_HW in name_or_raw
  perf parse-events: Constify parse_events_add_numeric
  perf parse-events: Prefer sysfs/json hardware events over legacy
  perf parse-events: Inline parse_events_update_lists
  perf parse-events: Improve error message for bad numbers
  perf parse-events: Inline parse_events_evlist_error
  perf parse-events: Improvements to modifier parsing
  perf parse-event: Constify event_symbol arrays
  perf parse-events: Minor grouping tidy up
  perf parse-events: Tidy the setting of the default event name

 tools/perf/tests/parse-events.c |   6 +-
 tools/perf/util/parse-events.c  | 482 ++++++++++++++++----------------
 tools/perf/util/parse-events.h  |  49 ++--
 tools/perf/util/parse-events.l  | 196 +++++++++----
 tools/perf/util/parse-events.y  | 261 +++++++----------
 tools/perf/util/pmu.c           |  27 +-
 tools/perf/util/pmu.h           |   2 +-
 7 files changed, 540 insertions(+), 483 deletions(-)

-- 
2.44.0.683.g7961c838ac-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
