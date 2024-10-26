Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CCDD10BF6
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Oct 2024 12:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6XkptU3jp3Srk2CCPIV9q0Jm4z7Z29tSMQTfhfrkyj4=; b=IKO+Ze3Clz1t4+
	h4UlSWyr410rcTJokeodSUtRJxREgIDhVO5Yw6wSFl2uBnk1vbpf1ejqM3nGQKwggz7NUKoFtj8Mz
	c06deew08myuN1wyz2qUFch9fkPi7/P1mjzfjmZR4Ud/8al/wRo2UNlI9jN3Sgj+kqfPLZR/zfZEL
	2MPYiWF1l51R0miZuGoHQCvRd8RNYbhSNkuTi9vf6zNpbG9rfkGb3v0wAfQjMzFaLnhfISoFh1k8/
	ATGE0ohnHM3AUlErMocJ2TRMcc5pLa/riLlQL33o+IupEXbw6AS3sGlExpkw4rmNU6N2sA3CGR9+o
	p8OUeuoGuBQ/nAGNP1Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4fkB-00000006aZf-1aO5;
	Sat, 26 Oct 2024 12:18:11 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4fk8-00000006aWo-10y5
	for linux-riscv@lists.infradead.org;
	Sat, 26 Oct 2024 12:18:09 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e376aa4586so53961977b3.1
        for <linux-riscv@lists.infradead.org>; Sat, 26 Oct 2024 05:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729945086; x=1730549886; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WdNDvzlbuJZcRwH/3AdtbsrZFMtP+MFgk5KWwVeQrN0=;
        b=RT23i2p9TnZtXBbKC/7vYUJxsw3QvRAxc20w0ojQNDH2Pq2m+bi+wMeGmA4hVAiss3
         6fsMv+DuXzSHPat8tZf8m3agwyxxomfxemPy79Z8/uin0MPdGFgoqgVRodq/qWkzuI5v
         79AuxqtuvDY7+2+pGjwkbSiPGsNLFjhZgKBn26zGK1dcZ5It9+utFvecBkRSQdMxVsiA
         yW7DhxTnT50XV3ZlotubkFtsyXmSco1mycH3sN1tijF3F6xT/0JtazPeSAlo3yYVKyN7
         yBjhafPaDSMIS7/by2q7zbrGSUfSn64j1uKNNJg4JLV+XTjQNi4paVJCq3aEjWKeCmr1
         e6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729945086; x=1730549886;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WdNDvzlbuJZcRwH/3AdtbsrZFMtP+MFgk5KWwVeQrN0=;
        b=PK/pg6FMvMkqbopbI2a4Jk2BlygH2slyVpTJFcEZUIEZp1HSduYLhnHDmoI3JAqXt2
         ZjBqpHTrPPVvmRsfnosVAQd0lzCFljQCU2cs/9DEaMjui4UmJYGvbJEwqWT3Z6+8n0ai
         ZdYJKfPnLyAI3wuUsNFDJ/LqVlYYEKI3yETsdr/eOlah1DaOZQKlLFTusG6A6D0D3Ekk
         Y2jobaj40+ESYfLIIRl5Z6ivfT2p0zVF3U2Ybt7G2wQME9gJVVk9Dk+cPqMcwE//twHH
         h88X01snEgJJODvOKuXkektgJI79KHBD4ZODK8YqVDW1nwUsLdt1Kk2ZlYlARxNI8uY6
         vqSA==
X-Forwarded-Encrypted: i=1; AJvYcCX1Nn79GgbWUwHou0POI7O285HzmaKawJs/gsqBvGId1d1mbAtljG0F/XPLpjlflQmu78Zy2/d6A6SvGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YynZ3wgCnQNav2HW+hcttsfHxrtcHZN2w+PVJ6OEEcOlTDNKp3p
	dtSa8Nm86/6SvwbgQ1lFRW+sqRF05Z4pJINCI4idUgn66LozDxomdwOghEcjrBjmI+IA+WvGslN
	7k0YavA==
X-Google-Smtp-Source: AGHT+IFOl40mvdVs5SQR71bN1+vwfDx/yPB8F4Q/dtZHVs4/wMyo+J/RvfVAtx7pjhDNaEO8viHyeAKpEpqm
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:4bc4:f7cc:83b4:dece])
 (user=irogers job=sendgmr) by 2002:a05:690c:6ac6:b0:6e3:2f0b:b595 with SMTP
 id 00721157ae682-6e9d8b171afmr600867b3.5.1729945086125; Sat, 26 Oct 2024
 05:18:06 -0700 (PDT)
Date: Sat, 26 Oct 2024 05:17:55 -0700
In-Reply-To: <20241026121758.143259-1-irogers@google.com>
Message-Id: <20241026121758.143259-2-irogers@google.com>
Mime-Version: 1.0
References: <20241026121758.143259-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Subject: [PATCH v1 1/4] perf evsel: Add pmu_name helper
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
X-CRM114-CacheID: sfid-20241026_051808_618988_37E2441B 
X-CRM114-Status: GOOD (  11.15  )
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

Add helper to get the name of the evsel's PMU. This handles the case
where there's no sysfs PMU via parse_events event_type helper.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/evsel.c | 10 ++++++++++
 tools/perf/util/evsel.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index f780e30aa259..87ed417df133 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -236,6 +236,16 @@ int evsel__object_config(size_t object_size, int (*init)(struct evsel *evsel),
 	return 0;
 }
 
+const char *evsel__pmu_name(const struct evsel *evsel)
+{
+	struct perf_pmu *pmu = evsel__find_pmu(evsel);
+
+	if (pmu)
+		return pmu->name;
+
+	return event_type(evsel->core.attr.type);
+}
+
 #define FD(e, x, y) (*(int *)xyarray__entry(e->core.fd, x, y))
 
 int __evsel__sample_size(u64 sample_type)
diff --git a/tools/perf/util/evsel.h b/tools/perf/util/evsel.h
index 04934a7af174..5774a9d4d725 100644
--- a/tools/perf/util/evsel.h
+++ b/tools/perf/util/evsel.h
@@ -232,6 +232,7 @@ int evsel__object_config(size_t object_size,
 			 void (*fini)(struct evsel *evsel));
 
 struct perf_pmu *evsel__find_pmu(const struct evsel *evsel);
+const char *evsel__pmu_name(const struct evsel *evsel);
 bool evsel__is_aux_event(const struct evsel *evsel);
 
 struct evsel *evsel__new_idx(struct perf_event_attr *attr, int idx);
-- 
2.47.0.163.g1226f6d8fa-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
