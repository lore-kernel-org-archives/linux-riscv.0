Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216A3C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 19:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EIBi9a6JvGsCVuHslE/WQKTwPUXVifo6fcLRls1HspA=; b=ZdPkJQYTAXZIzs
	wJ2jM/BRJcgMWzrQPcEO6LJgL+3GItb6mppjkpVEO12TV/CXd3/pPQHxmYQtW1QaNl62H2qJICKHr
	wW4dKO3mi/UGwcoFrtgHnrNFjGRr3WWgdJQbOUi6WPsVRSJZKymlmh0ut35/++lNLdNCh7/DWy/2x
	MlMUSN69c631plGyMZl5pyq4W92KzeuQVtR2neriEVXJsex360zLKaut3s/aYqHiGIxzzUpaGNWCr
	vnGYY+A2xvCQsO8El2EC69mAuISu+v7f8ATRe6X9BPBU4DFPRzb1sRG5g6zwhp7+6Kh0hpDbBKiXB
	kIS4KgsoAg/AXArD1dqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb3dl-0000000H3jd-2toy;
	Mon, 05 Aug 2024 19:45:09 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb3dE-0000000H3VG-2YF0
	for linux-riscv@lists.infradead.org;
	Mon, 05 Aug 2024 19:44:38 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e0ba318b1b2so13928792276.0
        for <linux-riscv@lists.infradead.org>; Mon, 05 Aug 2024 12:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722887074; x=1723491874; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tA68ylO5jWmS/IidvWPiQaY17OcIuvwiHS8mFC423wA=;
        b=Ax3mW5+z9vgFsY1MBPEchumEXFByFwEwk/T8fI6asHPCVsGMHNWuJwEZRaPWAxrakb
         MUA/SuaODO/++6mBWBNRbgu+AaIV9lJwFEorwZjBoKlFpItOAiq3XSvw3mN32imAn7DO
         Gt1kvbHSfi3e0Yp+wVu3M1S9bZ+TQTT7uK+N+98e1KUNqDeHQd4HgMSI1sQEAE83H05m
         OTFcXbyLOoJm4mqa39XXA+/R0lHFZqVz2Lmaymoscv5DgaTAh1df54v4rTy5kZqjGCpg
         JUqj6Zv++/NaiXv4jBcGf9iMHpmH9dKV1vHsFg4gtxaiBlTNzC41bll1ITFWr18Wf1tx
         aCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722887074; x=1723491874;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tA68ylO5jWmS/IidvWPiQaY17OcIuvwiHS8mFC423wA=;
        b=b3p0ASKhBe+0UwuUj2rVHesNEuP50jgfC9HJySJ5wtLnaJAHqb28JHiCmMHIB/8RIV
         mzaXff+lk4NhfKpIskhUJu43DHMhH5VxvGVZacQTDttU72O9m6vL2vnXBMt++YQQV5Ae
         ajinNEDbM7YyPKZJfyv3Jmkt++cktyPFgUSQPk+immDOFANvAmPqxRtRhRPg0MW19ot/
         mKjW7nh4gFyb4v7pjZ0rAu9SN7iNdmsk18VLEuWpj3NOEI5tTXzSKxmeUG5h94dQXfH/
         WwCbd1Ld/8KlZSQ5E2IsZ4qv+3vNRBqfq4riOhngCiE9Fsgl6LPhL8Gofrs1xAA5mSek
         b76Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJScBXEC0eTENpTHd8TKeUSwC7Ok1QvFDLAgfqusYU/poNJwVGXw1+McUbIFvseLf57u3LFgKcrCIU1Rtq9tYXze/6e+cSVK1ANOWu/7J1
X-Gm-Message-State: AOJu0YyN9FnS78GKRXyR/tbuSyI0zqXR3wICetJ2yMNud5oS6Mb6F4iC
	JMl6vqHLdi8gUk+HwJHG9qSdUXLRbYIw34rrxj/be6FmphPPRpXssa1auSalJsYi0LuFREzZFS2
	mB+u2xQ==
X-Google-Smtp-Source: AGHT+IEe61oyAxRcyJbONskfgG+pxQhuzYOimimwYVvqO8/yvxoo+1a+/P+Oz8TdzIpat9CjNonli4Crb+al
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:1f65:8dc8:61d0:4b08])
 (user=irogers job=sendgmr) by 2002:a25:9008:0:b0:e0b:f46d:a2bb with SMTP id
 3f1490d57ef6-e0bf46db4edmr40122276.11.1722887074494; Mon, 05 Aug 2024
 12:44:34 -0700 (PDT)
Date: Mon,  5 Aug 2024 12:44:21 -0700
In-Reply-To: <20240805194424.597244-1-irogers@google.com>
Message-Id: <20240805194424.597244-2-irogers@google.com>
Mime-Version: 1.0
References: <20240805194424.597244-1-irogers@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Subject: [PATCH v1 2/5] perf pmu-events: Change dependencies for
 empty-pmu-events.c test
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
X-CRM114-CacheID: sfid-20240805_124436_668985_0CA1FB00 
X-CRM114-Status: GOOD (  13.05  )
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

Switch from $? (all the prerequisites that are newer than the target)
to $^ (all the prerequisites) as touching jevents.py will mean that
empty-pmu-events.c won't be passed to the diff command breaking the
build.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/pmu-events/Build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/pmu-events/Build b/tools/perf/pmu-events/Build
index c3fa43c49706..d941bc9d16e9 100644
--- a/tools/perf/pmu-events/Build
+++ b/tools/perf/pmu-events/Build
@@ -39,7 +39,7 @@ $(TEST_EMPTY_PMU_EVENTS_C): $(JSON) $(JSON_TEST) $(JEVENTS_PY) $(METRIC_PY) $(ME
 
 $(EMPTY_PMU_EVENTS_TEST_LOG): $(EMPTY_PMU_EVENTS_C) $(TEST_EMPTY_PMU_EVENTS_C)
 	$(call rule_mkdir)
-	$(Q)$(call echo-cmd,test)diff -u $? 2> $@ || (cat $@ && false)
+	$(Q)$(call echo-cmd,test)diff -u $^ 2> $@ || (cat $@ && false)
 
 $(PMU_EVENTS_C): $(JSON) $(JSON_TEST) $(JEVENTS_PY) $(METRIC_PY) $(METRIC_TEST_LOG) $(EMPTY_PMU_EVENTS_TEST_LOG)
 	$(call rule_mkdir)
-- 
2.46.0.rc2.264.g509ed76dc8-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
