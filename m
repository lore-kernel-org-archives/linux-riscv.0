Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB04C25B77
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 02:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zul8bR0yXXNIsZ52kgNkDC77NbygCsHTcyJikwxX0rs=; b=DEu8X58+Vbe48Z
	HgetZRrdxXJQfiVEhmnxEeyIo+J2c9o2vFeMuTOP0uzWrpD2dDv8Pcf6Jg7peNo29Au/Ba6tkAddO
	L9j8/obtUqUMQukV/q7g64efk15tYI/UlplvC75XBZrADHH+8A8vW62h5iZMs29d2rbLjvfzQRHyK
	V8w+jzw6QLTIkC94hyWMoBMReIgHvBSraDToadwS17w/bKgfPMw2rXwiWjAhdOo5hl6ebt1ZJyuL3
	uPmj3gRAScze9JfuZpS3SqSOW/8LlwcYfyJxm+dOldMdfvYyqDiB9iAHJ4gm//UE758RUfJYvGyBN
	lh123Wc8xjoS/F/BDHfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4tJu-000000003Kh-0UpK;
	Thu, 09 May 2024 02:15:42 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4tJq-000000003Hm-0bhQ
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 02:15:39 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1eeabda8590so2552415ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 19:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715220934; x=1715825734; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5/LxNtjaBbEya4wTYzu0ZSg1ZgQ6teLqCU1lCSZ0Jy4=;
        b=Xc2i1gd+VkHZxJ65WgPQUMCpMxRb7HM6Vgi4h3Fnoc/XagxRTa7tJThuw9ew0d+Odd
         78DBFm+0iCkmPRuGyEkxO4IPiAcMai7Mu6SB7HYhqiNyROdqq3AVrZKiCFFoNzDDWNla
         aqslqN81FazUcAcmEAUCusB1IZNjWlxGc1JCsVZL0EuqkHDZwSfdVdr1eKNlEyow8MHW
         is6c5qAEP2so7Y3/dOkDVs1aotZzV6QUFBE5Z9z37jBr3f9aMW3Ost96PC20BIaFyMDA
         9L++bomFngAx4ZXGgyoeJDZGjlwd1cDm9//8r7dey6PDhmvdqamBGfScLZKq23f4KApV
         2fCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715220934; x=1715825734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5/LxNtjaBbEya4wTYzu0ZSg1ZgQ6teLqCU1lCSZ0Jy4=;
        b=l2pF9DYd8E2eNOwdXUm3SH/eXX+6ZfXL9pdzawGtNjZtRYjgVGp+zsND8WU+qeZ6sx
         CIxrkoZSKv2tilkrz34ZtPwCfXbJn7pjEuh0uq5j46D8Ksjf64pCjQAI2n6Uxz+PkYAV
         kbdVLZRbbccN7McgYv30Ky0B4ch5aSTcIH+OL59fwZ8k3sINYrXAwZLEnNw49WAbhJnt
         RGLw7mMJuqqo6IEoQr6+jc22GzpnYjNJtuuyyhsa+0rkoNEWl7wdW9ruIzxRCXZH4tEf
         ISgEN+cAfN1KS50ixHkkrfjhXdn1ovwfxuKfnMdgwgXaxtCqG+0icdKtFUthYLx9XHMe
         AbcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA1gSCAKD9cW0fPgGtky/D5NxDtGAbZ47Lv80HDDdljcLpNYQP2+dFhFOCHlhEseBiRpP+e0cKuWgaWSqhkqF72sXt4XUGpFovRV+kBvgb
X-Gm-Message-State: AOJu0Ywf9Oy5HZsmnWNjMSsFFxu66f8NhBEA2KNcqz+FwRKW1QIz1SpK
	EAzRDEtD4FlZVF703jke4VqTvJET2rGtzA+3HdYpwirgSPelqVMtB6BPPpaVYCg=
X-Google-Smtp-Source: AGHT+IEUdYLF+SIrKnTybz5q+/qUgnD4Zn7N0xrM5xio8TfCy6F6RqUL0Lawo+zsRRgrUQlvnUoJwA==
X-Received: by 2002:a17:902:bb17:b0:1e7:8d21:7fd7 with SMTP id d9443c01a7336-1eeb0594cf3mr41828135ad.28.1715220934604;
        Wed, 08 May 2024 19:15:34 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0b9d176fsm2339115ad.58.2024.05.08.19.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 19:15:34 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Arnaldo Carvalho de Melo <acme@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Ian Rogers <irogers@google.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 1/7] perf vendor events riscv: Rename U74 to Bullet
Date: Wed,  8 May 2024 19:14:54 -0700
Message-ID: <20240509021531.680920-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240509021531.680920-1-samuel.holland@sifive.com>
References: <20240509021531.680920-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_191538_255021_C76154C3 
X-CRM114-Status: UNSURE (   9.69  )
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

This set of PMU event descriptions applies not only to the SiFive U74
core configuration, but also to other SiFive cores that implement the
Bullet microarchitecture (such as U64, P270, and X280). Rename the
directory to be more generic.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 tools/perf/pmu-events/arch/riscv/mapfile.csv                    | 2 +-
 .../pmu-events/arch/riscv/sifive/{u74 => bullet}/firmware.json  | 0
 .../sifive/{u74/instructions.json => bullet/instruction.json}   | 0
 .../pmu-events/arch/riscv/sifive/{u74 => bullet}/memory.json    | 0
 .../pmu-events/arch/riscv/sifive/{u74 => bullet}/microarch.json | 0
 5 files changed, 1 insertion(+), 1 deletion(-)
 rename tools/perf/pmu-events/arch/riscv/sifive/{u74 => bullet}/firmware.json (100%)
 rename tools/perf/pmu-events/arch/riscv/sifive/{u74/instructions.json => bullet/instruction.json} (100%)
 rename tools/perf/pmu-events/arch/riscv/sifive/{u74 => bullet}/memory.json (100%)
 rename tools/perf/pmu-events/arch/riscv/sifive/{u74 => bullet}/microarch.json (100%)

diff --git a/tools/perf/pmu-events/arch/riscv/mapfile.csv b/tools/perf/pmu-events/arch/riscv/mapfile.csv
index 3d3a809a5446..521f416b0006 100644
--- a/tools/perf/pmu-events/arch/riscv/mapfile.csv
+++ b/tools/perf/pmu-events/arch/riscv/mapfile.csv
@@ -14,7 +14,7 @@
 #
 #
 #MVENDORID-MARCHID-MIMPID,Version,Filename,EventType
-0x489-0x8000000000000007-0x[[:xdigit:]]+,v1,sifive/u74,core
+0x489-0x8000000000000007-0x[[:xdigit:]]+,v1,sifive/bullet,core
 0x5b7-0x0-0x0,v1,thead/c900-legacy,core
 0x67e-0x80000000db0000[89]0-0x[[:xdigit:]]+,v1,starfive/dubhe-80,core
 0x31e-0x8000000000008a45-0x[[:xdigit:]]+,v1,andes/ax45,core
diff --git a/tools/perf/pmu-events/arch/riscv/sifive/u74/firmware.json b/tools/perf/pmu-events/arch/riscv/sifive/bullet/firmware.json
similarity index 100%
rename from tools/perf/pmu-events/arch/riscv/sifive/u74/firmware.json
rename to tools/perf/pmu-events/arch/riscv/sifive/bullet/firmware.json
diff --git a/tools/perf/pmu-events/arch/riscv/sifive/u74/instructions.json b/tools/perf/pmu-events/arch/riscv/sifive/bullet/instruction.json
similarity index 100%
rename from tools/perf/pmu-events/arch/riscv/sifive/u74/instructions.json
rename to tools/perf/pmu-events/arch/riscv/sifive/bullet/instruction.json
diff --git a/tools/perf/pmu-events/arch/riscv/sifive/u74/memory.json b/tools/perf/pmu-events/arch/riscv/sifive/bullet/memory.json
similarity index 100%
rename from tools/perf/pmu-events/arch/riscv/sifive/u74/memory.json
rename to tools/perf/pmu-events/arch/riscv/sifive/bullet/memory.json
diff --git a/tools/perf/pmu-events/arch/riscv/sifive/u74/microarch.json b/tools/perf/pmu-events/arch/riscv/sifive/bullet/microarch.json
similarity index 100%
rename from tools/perf/pmu-events/arch/riscv/sifive/u74/microarch.json
rename to tools/perf/pmu-events/arch/riscv/sifive/bullet/microarch.json
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
