Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF50C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 06:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fZel06VHI/OuR3r9/XSp40gaVpjLjnuXJu6HlSgVDfM=; b=u1IuiDHmQRC25c
	iw2w/D1q8IMTtKsPBYPO+C45112FipNPRiX8zpcp8QHOiOGJffrGG0ZRkV4Sp19f2eJb9cAJHJwQ3
	YkSX3o02AcLv4Oml5b+Osol+IfFt5fZe+sTbVnKlFHe1zsN43bLoiAI3MqoEZKvh5Qi225PdiUsu1
	UcEA/PtrpNldFYiYemKJ7XbsA0Gr+MyD6VkPXdOaU9A5uZxD+B+LrAJz7U8ukXEsJ8pjg35jzdkvd
	amvc1g/83OaCe1ZegW+aEFwv5ZAfI5bgKCPQiTy9qdSEr9QPYDNZdBRY0UX1C9AuNhdfJJAp8qeFu
	nokn99mdPFmakNigYosw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwFxC-00000007Avv-3vrA;
	Mon, 15 Apr 2024 06:36:34 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwFxA-00000007Av7-1fMH
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 06:36:33 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-617bd0cf61fso54691087b3.3
        for <linux-riscv@lists.infradead.org>; Sun, 14 Apr 2024 23:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713162990; x=1713767790; darn=lists.infradead.org;
        h=to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wB0mFKuGZHW/z83jZ9UZ1kMmy9iw6kq5zXLeGG3r0jQ=;
        b=VDk55tI9y+Cdb8Kb6KSWXrq4nzepPBjk7ujeggGWNbyKC6R0Nj37OoqqT88s48g2mf
         5Hn3PlTXhnMof5tSKfDlmUmqF+WGuGjcbGaYIhIWH7kbpqmVB4q+9odn7L4Lr89u5002
         iST4yYM5Eye4WVp+vEhHX34V8Za7bTen5cwVun8MN/s1if29MJ+fn9rDCwOsdhf3/K9t
         FH7Py0qsKhHWCOnwSFhvpeQG2Z5+ZSwfikhwNaU7pn3cYMLnXPjAuqJriDEkt+ErWy+8
         p1Z9a6Q3+bx1FW0ZHeyvY/5vmgnoMEc08SpSdj06IbhXO+raxAR3I+KF3iJS4wgbyGlB
         aguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713162990; x=1713767790;
        h=to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wB0mFKuGZHW/z83jZ9UZ1kMmy9iw6kq5zXLeGG3r0jQ=;
        b=KXFCSdaByMFEzWmFvdc8wmHXw5r/rkejTzckBulVUFIV527MRjq7//IA2enk2FddPy
         bhGUBoX599ANgsRTCeG0UnNToHzzesCaiPMkuiVrkVz9p6iYl5jKkeV+sJrmiWuCe4vY
         0dUhVvvxx0+MKZoLB6VsFKqwRYF509BLsKBThZ7duPlHRKVNhoa6D6FV0ePavJp8wd7N
         u4cLrGlPIQhS1XVnKiQFAYBE/8Gdoj487V6rQJ5+amH6NL9RPWxg345d0N+tQDbmTjZA
         fY11ZnFnlAT6TkWvrE7qG2CmEW4L42ouiYrDC45t0mQmDfb52XQfPVKXz6xFfvsK52uL
         npIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBCa32Bf8hvq9UMCmYt8ePClMH6zlOGQzBiMekwjma9IS7f6fu+YkrFO9U5CZkhlUKbtpN8lh/sJVzh3PbssEZnoArUuqKwPLN4AIT2Q0l
X-Gm-Message-State: AOJu0YyBz6MuVPXlArhm2fQTLlyIgKTpA0ztqL0mZE17Ajza8SlXBEPr
	tgqgFEMjjez+6qKo42+oOPipjioDQC/cD+oswD8uo6h3ePaxdAt/xxl2Kqqy1rqXS5O8PhQ6oYX
	dQakI8A==
X-Google-Smtp-Source: AGHT+IFla4MrX294yqIP+FWtWzJmxqGcQ32XqueDUfsH1OcnJlS4SzKTAazV/kcLnzG+SAXlo39sSpcyIttX
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:f304:d776:d707:4b57])
 (user=irogers job=sendgmr) by 2002:a05:690c:a:b0:618:9588:e9db with SMTP id
 bc10-20020a05690c000a00b006189588e9dbmr1908547ywb.2.1713162989579; Sun, 14
 Apr 2024 23:36:29 -0700 (PDT)
Date: Sun, 14 Apr 2024 23:36:17 -0700
Message-Id: <20240415063626.453987-1-irogers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Subject: [PATCH v1 0/9] Consistently prefer sysfs/json events
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
X-CRM114-CacheID: sfid-20240414_233632_461504_D803759E 
X-CRM114-Status: UNSURE (   9.10  )
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

As discussed in:
https://lore.kernel.org/lkml/20240217005738.3744121-1-atishp@rivosinc.com/
preferring sysfs/json events consistently (with or without a given
PMU) will enable RISC-V's hope to customize legacy events in the perf
tool.

Some minor clean-up is performed on the way.

Ian Rogers (9):
  perf parse-events: Factor out '<event_or_pmu>/.../' parsing
  perf parse-events: Directly pass PMU to parse_events_add_pmu
  perf parse-events: Avoid copying an empty list
  perf pmu: Refactor perf_pmu__match
  perf tests parse-events: Use branches rather than cache-references
  perf parse-events: Legacy cache names on all PMUs and lower priority
  perf parse-events: Handle PE_TERM_HW in name_or_raw
  perf parse-events: Constify parse_events_add_numeric
  perf parse-events: Prefer sysfs/json hardware events over legacy

 tools/perf/tests/parse-events.c |   6 +-
 tools/perf/util/parse-events.c  | 201 ++++++++++++++++++++++----------
 tools/perf/util/parse-events.h  |  16 +--
 tools/perf/util/parse-events.l  |  76 ++++++------
 tools/perf/util/parse-events.y  | 166 +++++++++-----------------
 tools/perf/util/pmu.c           |  27 +++--
 tools/perf/util/pmu.h           |   2 +-
 7 files changed, 262 insertions(+), 232 deletions(-)

-- 
2.44.0.683.g7961c838ac-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
