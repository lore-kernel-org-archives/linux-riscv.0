Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7380BC021A6
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 22:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AQSULCY3WV78+DF6RslfY3lDaTfapBeKzAYjr1S4dPs=; b=mKg4JyUhxOLmdT
	Po4r4AmXY8dyTnvLkvh7X1T2mEAp/YYtCLJ3aq1W3Th9TNH6NOvJ+Viq1rM7EmfzekUfGidU3cJW9
	xqKvnlMs7YK1/RbRUhUq6MzX7stxtab15jrp0COyMUCoZln2ypLfdLhG7W8F6yXrZ+FMnGqk3H97a
	BzUpaqbIZbzwpxJbs0bgN4T4+B8vHkuv2ygrZwz5phdKd35McqlrZ2Pi8SMfSCwbwDAotJZJcFsJu
	nrGr/38dqWEs3tn+xPYp+iAaFaVGEUfXTjnVcUQKq5grEtqsULuON+WjOZXR6d3yqelGxSmCZIOpQ
	dL47x0hcwco1JnL1x/nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tihJE-0000000ClT6-40FR;
	Thu, 13 Feb 2025 22:03:48 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tihJC-0000000ClRE-1MyM
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 22:03:47 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2f9b91dff71so2070235a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 13 Feb 2025 14:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1739484225; x=1740089025; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sn7Sf/VJa7o2kQnvv17430q5LGkiKAmnPlLEbt0xnSg=;
        b=QqL5s4CDQWaQ4ZwSrLiCE5Rs1gLa2V+3/sOC9VJZEg5drahQGSm43szsb0wWW60HYU
         WW/1eIfVD6NLoChHfH915kedpAFNH/URWhLnfKDWlABoxNLNZYvCra+nMBoKPPb6sAf/
         py6CW8ChJKdY33xiAWl7ZR0xT5TJApvT275Jh1TIu+jfCOR1qwMco3gCv2sZfsiI3Lhb
         gm6VFEKL6wkpEqdqoHVN3jlEMMhQyqgk6NnFie8FZEfbAt/kiJ7N7eoDBx3DwFfRt+KM
         xbe9TInqq+IQ7l4Ed76IgeCjwY36voXt5yDVudPvny2P6dRuv+Zev75pOMV0Qdv95k4I
         45jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739484225; x=1740089025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sn7Sf/VJa7o2kQnvv17430q5LGkiKAmnPlLEbt0xnSg=;
        b=eD+lQt6HN4Bf/rKj4Mtry0XIJosBBuuFlW1GNMQTO+1W2FUaUlYJ1n0C0vZlrYQBv7
         vIxRdNAIWjV9izicBzBNw1PobiRSWFt0vfL4CrRaS96HqDxTuSbFe3rc4afQEd0dutV/
         tHkjY6MacPuP9QPb9zZDqwvAc9w8IpQ2fbn4qsW8R7eZJQRZSuEKy2dUOpJ2/a40SHBq
         9KOYJ29o7ZckYEE7yE3Wc5kOik0cIZfyRHpkggVz1WyL+a/kdV5taioa0a6Y+TaMs0Jk
         A0N8JEVLe198PPWTXQ8Pztyiq0yj1eXOVj2LaE5yxIDrTx+jNbNU8cRe0BFOZAmwveFL
         0oUA==
X-Forwarded-Encrypted: i=1; AJvYcCXeoc2uDkJ2iQHjlX85Z5Rj1pBvTQgG0HxlE2S+5wkPjdW0mdoxwZZOuTYdoGEo+IWS9y0obEuPac3tFw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNxv+/6ZEsnMI7QzBEKXJ2q6tvbyn/fxPbSwL0YXjrGUhX1fbB
	1YKCrC6fTDhwT1CHftknCgBsdbOotNg46KD2PIrNppQTyl9oQev4AvY8Jc8UnkM=
X-Gm-Gg: ASbGncsTBR1ACEhvKFhHmknwDlJQKOvFVc4q2rDLeEgpAZkDnsAJ0zxDwz3LFn3DlSF
	eD/f2EBCfATQia/vCryJhLWgEacOnTdHif/ctAI00tggb457G2R2R8AiwNBaYjeRYma+dmzWCc9
	GWyqiOFB2UJQiSnPnEjbSV2RMMZHoCmj9386oHsI0SIsd64o9JUax+OrHjNSmi3kbaauSdT3STE
	o+5yhXXtL9LXl5fs83CEHAjuFRB/ekg64cVvXyllZrE/Eij/4OCaXhNe2md3JtLR0OG9jCAH/Bk
	vmweviy0BWWYnNQmnuhkIaxbruBXMFABDd8yXg==
X-Google-Smtp-Source: AGHT+IHkFJ+qjdPn6uu0QPcmGwTebP9L3ITV/fNakdUXm6n9V5utSpWvIQRkdMaseOUVz3BmpGbQ1g==
X-Received: by 2002:a05:6a00:2ea3:b0:730:9204:f0c6 with SMTP id d2e1a72fcca58-7322c4310b4mr11699224b3a.16.1739484225285;
        Thu, 13 Feb 2025 14:03:45 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324273e438sm1847491b3a.94.2025.02.13.14.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 14:03:45 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Arnaldo Carvalho de Melo <acme@redhat.com>,
	Ian Rogers <irogers@google.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Jiri Olsa <jolsa@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [RESEND PATCH 1/7] perf vendor events riscv: Rename U74 to Bullet
Date: Wed, 12 Feb 2025 17:21:34 -0800
Message-ID: <20250213220341.3215660-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250213220341.3215660-1-samuel.holland@sifive.com>
References: <20250213220341.3215660-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_140346_370572_9E8B825B 
X-CRM114-Status: UNSURE (   8.45  )
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
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
