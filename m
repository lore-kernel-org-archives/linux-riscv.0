Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87630D10BF8
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Oct 2024 12:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yp+LB4avb12DhmJLPaW18bd86wvZx07NQQ1g2jGUxAo=; b=ckZMCeqnBOmheR
	a2uJghvcrQmKmXapHdGQ+6voYeOeWPKQWmjdSE0MhFRsByUGo+rbqIQeKNok/v0MF6XrYa3u+Aa/q
	2LS0ipUh9wPDuyaeF5HNu2EYcC8c2SY83e6I3Ww4W3YxHSrvFjv2YI9yFH8ONJjWhs26G7NioNPp/
	Awc2C56MVJBqPo2MJuxI0x/m++kdxPAocfGr5IISztjjaIcN2tYbcAH7VO3VJEQvnlyh7wfgJMke1
	l+WyP8kd49QNav+3HYlrV+dXncZ13B8DzMD/eiWF3ene06KT+jkCnLtHtpdGQpL7IIABDRLDVRAeY
	arXq4ipNSlBnpFpTypNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4flz-00000006bAz-0WC5;
	Sat, 26 Oct 2024 12:20:03 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4fkC-00000006aaM-3oie
	for linux-riscv@lists.infradead.org;
	Sat, 26 Oct 2024 12:18:14 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e28fdb4f35fso4777620276.0
        for <linux-riscv@lists.infradead.org>; Sat, 26 Oct 2024 05:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729945092; x=1730549892; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u2vjrGB7qYjjtCMVzRupcGHYUQ0/euLShZj24B3CAVY=;
        b=KvPfMlMW6QdzqTzgi+9ga5Hbj7hhDjSPWUU753NPvyQTWrLn5M+MNWVMEVoLc2lM9g
         uOpnZa8sp/1ALoTf3QDNRVQopZrVClfnUxjeP7DhVSMmDvHC3S4eXUfma9K6uLxpwDwC
         0iWt21hfiYgFrwLt0bwfcdyNFQWRWvLrGLrfnSExEHkwNj4OKPcTm7xFGJUKFHs/okU0
         EvEL1fYmbkbcw9iR2+860gGHOUprYJmX5M2GbLNFpPu1Ce0gMdUEDkSg3bkGHDfnQRkM
         8cBxE9kjwmVSrkBhTLEe0bFyTeMtoeMA2FB/UuTwIy0GSFAummNT44iZMLI2ixpHX1Ud
         6qqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729945092; x=1730549892;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u2vjrGB7qYjjtCMVzRupcGHYUQ0/euLShZj24B3CAVY=;
        b=eTo2xyFqr1aUKqaD4uZ0gCbawe4DrWvVd4XDDzx4O0hc1JH3bryjXRZqp9BhoDJzzt
         UD2mW3vBdq3ryRjE/tkf7fjbC/qS9VDPoh/LG5LFkwGB5vj4FlZNwUDG0K8sIMzkOTsE
         4GZqRLW+sj1XsmqGkOVbtLJC9Gel4k7hoGNHDE+W4ihlDElN1PHXmR7KX9Wx0nOcFQGA
         SCm0esKS3Yf8BkTjxXBeK77h+C9vhfQr+7Z5tut001gpQyuUThJ1kZtUARH3W+n7Fbzi
         /SaFfioxpxt/eI1joWb8LUMA/Gt4T3JG8aVShrtOmbVX+ltSJ9RTQCeDLECvV3DMSiil
         P+SQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyL2tJ2ipEIrFrVicw+MfUuEiV15nJElcy0+F9lVrjvhUJ1n4VIbCSPRkICzkK9r+Lrv/gOxeLFAV11w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHnim7CGODOlETjckwu4EwXj4xesNxtjdZIVTHjaBoIIzGuxlP
	dgk3BFieBlXm/ZjzS52bwodfkqGJ3CEWeeYzR1Vkd1pYOzt4FkhhfgHSYSktDpTs9U+AXbR9W8X
	CwTpXqA==
X-Google-Smtp-Source: AGHT+IEsM/AxBcDGQflFJCepomQhbOJ8k6jWS/Dg9HzPpOvx9YedrkWoKAs2MTNM86jX3dIc4CLHW5uZhQ5E
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:4bc4:f7cc:83b4:dece])
 (user=irogers job=sendgmr) by 2002:a25:aa04:0:b0:e28:8f62:e735 with SMTP id
 3f1490d57ef6-e3087854604mr1606276.1.1729945091637; Sat, 26 Oct 2024 05:18:11
 -0700 (PDT)
Date: Sat, 26 Oct 2024 05:17:57 -0700
In-Reply-To: <20241026121758.143259-1-irogers@google.com>
Message-Id: <20241026121758.143259-4-irogers@google.com>
Mime-Version: 1.0
References: <20241026121758.143259-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Subject: [PATCH v1 3/4] perf record: Skip don't fail for events that don't open
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
X-CRM114-CacheID: sfid-20241026_051813_044508_77804131 
X-CRM114-Status: GOOD (  24.88  )
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

Whilst for many tools it is an expected behavior that failure to open
a perf event is a failure, ARM decided to name PMU events the same as
legacy events and then failed to rename such events on a server uncore
SLC PMU. As perf's default behavior when no PMU is specified is to
open the event on all PMUs that advertise/"have" the event, this
yielded failures when trying to make the priority of legacy and
sysfs/json events uniform - something requested by RISC-V and ARM. A
legacy event user on ARM hardware may find their event opened on an
uncore PMU which for perf record will fail. Arnaldo suggested skipping
such events which this patch implements. Rather than have the skipping
conditional on running on ARM, the skipping is done on all
architectures as such a fundamental behavioral difference could lead
to problems with tools built/depending on perf.

An example of perf record failing to open events on x86 is:
```
$ perf record -e data_read,cycles,LLC-prefetch-read -a sleep 0.1
Error:
Failure to open event 'data_read' on PMU 'uncore_imc_free_running_0' which will be removed.
The sys_perf_event_open() syscall returned with 22 (Invalid argument) for event (data_read).
"dmesg | grep -i perf" may provide additional information.

Error:
Failure to open event 'data_read' on PMU 'uncore_imc_free_running_1' which will be removed.
The sys_perf_event_open() syscall returned with 22 (Invalid argument) for event (data_read).
"dmesg | grep -i perf" may provide additional information.

Error:
Failure to open event 'LLC-prefetch-read' on PMU 'cpu' which will be removed.
The LLC-prefetch-read event is not supported.
[ perf record: Woken up 1 times to write data ]
[ perf record: Captured and wrote 2.188 MB perf.data (87 samples) ]

$ perf report --stats
Aggregated stats:
               TOTAL events:      17255
                MMAP events:        284  ( 1.6%)
                COMM events:       1961  (11.4%)
                EXIT events:          1  ( 0.0%)
                FORK events:       1960  (11.4%)
              SAMPLE events:         87  ( 0.5%)
               MMAP2 events:      12836  (74.4%)
             KSYMBOL events:         83  ( 0.5%)
           BPF_EVENT events:         36  ( 0.2%)
      FINISHED_ROUND events:          2  ( 0.0%)
            ID_INDEX events:          1  ( 0.0%)
          THREAD_MAP events:          1  ( 0.0%)
             CPU_MAP events:          1  ( 0.0%)
           TIME_CONV events:          1  ( 0.0%)
       FINISHED_INIT events:          1  ( 0.0%)
cycles stats:
              SAMPLE events:         87
```

Note, if all events fail to open then the data file will contain no
samples. This is deliberate as at the point the events are opened
there are other events, such as the dummy event for sideband data, and
these events will succeed in opening even if the user specified ones
don't. Having a mix of open and broken events leads to a problem of
identifying different sources of events.

The issue with legacy events is that on RISC-V they want the driver to
not have mappings from legacy to non-legacy config encodings for each
vendor/model due to size, complexity and difficulty to update. It was
reported that on ARM Apple-M? CPUs the legacy mapping in the driver
was broken and the sysfs/json events should always take precedent,
however, it isn't clear this is still the case. It is the case that
without working around this issue a legacy event like cycles without a
PMU can encode differently than when specified with a PMU - the
non-PMU version favoring legacy encodings, the PMU one avoiding legacy
encodings.

The patch removes events and then adjusts the idx value for each
evsel. This is done so that the dense xyarrays used for file
descriptors, etc. don't contain broken entries. As event opening
happens relatively late in the record process, use of the idx value
before the open will have become corrupted, so it is expected there
are latent bugs hidden behind this change - the change is best
effort. As the only vendor that has broken event names is ARM, this
will principally effect ARM users. They will also experience warning
messages like those above because of the uncore PMU advertising legacy
event names.

Suggested-by: Arnaldo Carvalho de Melo <acme@kernel.org>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-record.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/tools/perf/builtin-record.c b/tools/perf/builtin-record.c
index f83252472921..7e99743f7e42 100644
--- a/tools/perf/builtin-record.c
+++ b/tools/perf/builtin-record.c
@@ -1364,6 +1364,7 @@ static int record__open(struct record *rec)
 	struct perf_session *session = rec->session;
 	struct record_opts *opts = &rec->opts;
 	int rc = 0;
+	bool skipped = false;
 
 	evlist__for_each_entry(evlist, pos) {
 try_again:
@@ -1379,15 +1380,26 @@ static int record__open(struct record *rec)
 			        pos = evlist__reset_weak_group(evlist, pos, true);
 				goto try_again;
 			}
-			rc = -errno;
 			evsel__open_strerror(pos, &opts->target, errno, msg, sizeof(msg));
-			ui__error("%s\n", msg);
-			goto out;
+			ui__error("Failure to open event '%s' on PMU '%s' which will be removed.\n%s\n",
+				  evsel__name(pos), evsel__pmu_name(pos), msg);
+			pos->skippable = true;
+			skipped = true;
+		} else {
+			pos->supported = true;
 		}
-
-		pos->supported = true;
 	}
 
+	if (skipped) {
+		struct evsel *tmp;
+		int idx = 0;
+
+		evlist__for_each_entry_safe(evlist, tmp, pos) {
+			if (pos->skippable)
+				evlist__remove(evlist, pos);
+			pos->core.idx = idx++;
+		}
+	}
 	if (symbol_conf.kptr_restrict && !evlist__exclude_kernel(evlist)) {
 		pr_warning(
 "WARNING: Kernel address maps (/proc/{kallsyms,modules}) are restricted,\n"
-- 
2.47.0.163.g1226f6d8fa-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
