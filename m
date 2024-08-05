Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF90C3DA7F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 19:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cFy/Zp16I1tcosf74XeEe88TwsVgmDDnCDPBDzJGQqE=; b=2kSFsGjWHba/1r
	sdi8dFiV4Z7c3JN5mZXjt7UTW6JBHKkxEGfQtR/DaabQxgqj+ePUTgQxRzXTujxgJWG6ox/P3qXPU
	ZY8R2XnQuWZWQ0yN4n7xFjUgXkzr/ZQmyiwq4QGvBazoOWaP20Hc+fzDvSLxsmHpqKWWLiGFlJn76
	7Zb6T1NkY0cZpL2v9PGEvyYgSkUkpglDg5c7L3eWKRiVrItql6l9/15AtqX3VoiIZMN8nLu/JUGBj
	pbVP97CDUJH5yg1uYRzCmVRIA77rkD1pGvCYNwP0CCgGsCTyafBXcQCz7n/YaLRrb4rsNotiZ9kgx
	d+fehD4QEx6ONHHO5H2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb3eK-0000000H3z5-3lhI;
	Mon, 05 Aug 2024 19:45:44 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb3dG-0000000H3WM-2JmR
	for linux-riscv@lists.infradead.org;
	Mon, 05 Aug 2024 19:44:40 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e0353b731b8so17669520276.2
        for <linux-riscv@lists.infradead.org>; Mon, 05 Aug 2024 12:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722887077; x=1723491877; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z6LamGx0sdNwDED1VdCLCVyXTKgGz4JF2HbccvXV2xg=;
        b=OLCuVsi53TVWaJyKfwtXtxoY8S0qOZ26kP6BH7CQ7WJNXfkbcGWlUREHXuNilQv0yS
         yf29WDoHhyDEgqPn0sHAms3m8lPbQ6tIq13ALIPA4/W+JZuQSsNYe5FmZYq1Dx8iJt/2
         3eTtdX170cQUdoSPA591RcOgMgsnYYUT2ObsBYimVfmSytDEYkD7FdoiSdLSWsyWMwDb
         yi9Ex18ShEtG5JP3S8aaJOgalMMleqrCnVnfNF+5Qq345lpTAEX8KmoA5ymVATr+Udgd
         VtRAtYgyrek8AYEeIVF1u36PQCkTNpEiwMHaiE6FHEck3+BcNdheEEfmAkW771v7j3Kw
         DYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722887077; x=1723491877;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6LamGx0sdNwDED1VdCLCVyXTKgGz4JF2HbccvXV2xg=;
        b=GFdrEfA1kMdFl6YvbVpAbvu1FStQsuTETdypkSNKxrQign8AN+0T2sJQ01x3boVLfy
         KfZ9b2xx/38KbCrSkJcO5k7pFhs1xM9cIHEuvia4fb0z/ZTLFWUHxUg+z9eVNh1B+bCT
         +UPQ+TY1usF5tttjAHAZGdAesztqRAxp8Ukb8NkWxcLoKPWEdvwm/UO2MaU2o6Kv4fFP
         qhnSEBALrcxEnGEkY5lRJbPSnuLhabUMmt7AigZ/ytG/2ubOW96kIueqOVhVB/729R4h
         ho6AKZqF38n5bhRmoc/XbRO36WdnYIadx+TvHD3BxkiH8R5u8LAqXxjSPgMGIT3hQDlq
         Okiw==
X-Forwarded-Encrypted: i=1; AJvYcCXg7zpA7bQBZO4RYD6rD1CpmRmBUwwN4LS0km0+yNOXrDiT7OjtmARCnLwpBjBxeCQ+Uf3XYfTk7MxlnYtA8XxzjCl2r5yACcMJotvwVRCr
X-Gm-Message-State: AOJu0YzRSMnN9xoadmwiLyh0NLqne79u8sR/meZERSjAff9G2d6uIeD/
	l4UHYo2kJQzD8fOz+PzT/cIWY792NUSMRjODhWbUgBldbM1zZ7Zoyd/JyKrfeU0ngi/SgMUHLs+
	oHmeUPQ==
X-Google-Smtp-Source: AGHT+IFdv3oV3aqOKUmsPGI61CM1Ai9LluPAyOkHwx2uTCKWXxhzLAfMUs0X+MdhGbjcuYrJiIZPaJSwZtB4
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:1f65:8dc8:61d0:4b08])
 (user=irogers job=sendgmr) by 2002:a05:6902:1148:b0:e0b:fe07:1e19 with SMTP
 id 3f1490d57ef6-e0bfe072223mr13804276.0.1722887076925; Mon, 05 Aug 2024
 12:44:36 -0700 (PDT)
Date: Mon,  5 Aug 2024 12:44:22 -0700
In-Reply-To: <20240805194424.597244-1-irogers@google.com>
Message-Id: <20240805194424.597244-3-irogers@google.com>
Mime-Version: 1.0
References: <20240805194424.597244-1-irogers@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Subject: [PATCH v1 3/5] perf pmu-events: Remove duplicated ampereone event
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel.holland@sifive.com>, 
	Charles Ci-Jyun Wu <dminus@andestech.com>, Locus Wei-Han Chen <locus84@andestech.com>, 
	Atish Patra <atishp@rivosinc.com>, Ji Sheng Teoh <jisheng.teoh@starfivetech.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Jing Zhang <renyu.zj@linux.alibaba.com>, 
	Xu Yang <xu.yang_2@nxp.com>, Sandipan Das <sandipan.das@amd.com>, 
	Guilherme Amadio <amadio@gentoo.org>, Changbin Du <changbin.du@huawei.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	vincent.chen@sifive.com, greentime.hu@sifive.com, 
	Eric Lin <eric.lin@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_124438_623233_2FF6EC86 
X-CRM114-Status: UNSURE (   9.66  )
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

OP_SPEC is repeated twice in the file which will break invariants in
perf list as discussed in this thread:
https://lore.kernel.org/linux-perf-users/20240719081651.24853-1-eric.lin@sifive.com/

Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../pmu-events/arch/arm64/ampere/ampereone/instruction.json    | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tools/perf/pmu-events/arch/arm64/ampere/ampereone/instruction.json b/tools/perf/pmu-events/arch/arm64/ampere/ampereone/instruction.json
index 18d1f2f76a23..9fe697d12fe0 100644
--- a/tools/perf/pmu-events/arch/arm64/ampere/ampereone/instruction.json
+++ b/tools/perf/pmu-events/arch/arm64/ampere/ampereone/instruction.json
@@ -77,9 +77,6 @@
     {
         "ArchStdEvent": "OP_RETIRED"
     },
-    {
-        "ArchStdEvent": "OP_SPEC"
-    },
     {
         "PublicDescription": "Operation speculatively executed, NOP",
         "EventCode": "0x100",
-- 
2.46.0.rc2.264.g509ed76dc8-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
