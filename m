Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FEEDD3EE95
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 16:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vny9jEyhcHHBdvFrt7nJfuBPWozeXwOoZbBnwUk2jSQ=; b=byDCkanGyyM+Hh
	6Y97TiD2WRLpYYl1a1cIHELM5pA4dsaitk63j9nhqO2RQrIxehsMhC1gnnlBVbfaCxd/8a4TqCPKG
	sfvYGDSHPkWX87ovG9U05ZBWTNCJcWcZ2d0vFxoEoOxZCuCVK2KGSBNHG2YOoBNrQ0y0Yy5Eizlx9
	GmhHY7hUXkYPzyfWNzc9+NxBQDYIeVHc3ynjl0GcgJzdQ05C+aqda1ZEu9H+BF2w6wYGm3mQbngW8
	cuP0OIF4iulvyAvr3PdOtBpNdsGxZr7KtM1BY1pKSHZXHImNi4Rst4/4auxHPl/UquIxD0+C2ubV/
	i2G9XdcEYUCVm4krgm/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixxI-00000007U3q-496R;
	Thu, 22 Jan 2026 16:54:48 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixx9-00000007Tqy-04wt
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 16:54:40 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2b70bd4a2ccso5366128eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jan 2026 08:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769100877; x=1769705677; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6zuXMW9ePaQZdk+//RX5ln7bDZ0bQbPZ3cyiYbZ9aMU=;
        b=zicpTwFjGkwg88JtcNkmkYY5l5aSiOqCw0aZkoJAayB4RE5GV1PLLi11coEaJ4hN8+
         LbwVzwx2uL9V/sDkUEaoD2hcJDvljHP+gpqvIpM0hsDrBF/nnoRsYhnCtCLbjXRE3nOJ
         qNuXTHEDTRFWGcU7mbezDq51hUni87CzlJjBiTqhUtJkSQ/nCrDlOwP+TJ4XCVp0LqoY
         lqV7cHAaODVaht2+E2fJhUJeZKmdSLS/6Bo+eIrXHGcxK1gSz/aPaKLA9/nUyZkLH/CD
         8PAqYUm+vxRgnhCIAlUUYctPjLxRCUQSztMcCK7CGOIkt8a3qbk9i504JY4cV435PtXL
         Np/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769100877; x=1769705677;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6zuXMW9ePaQZdk+//RX5ln7bDZ0bQbPZ3cyiYbZ9aMU=;
        b=GgWQKKWBds9ASnntsbEAw34faPW7+HII54PJe9GYcKyuyxf1NCP7y2DE2lrBHOMWOk
         4vsLzNQj7fgySd9PFK5SFblKlVBL66I1LuwywelfvBjI3zGOeO4yKZ38MgW9qCayxUik
         fvNiuZeeep7BqZKYzRBhvl0LVWNhcjv0bF6u9tiZ5yhxFIlpnM/HQPXNHx+Z6aX054dv
         LM9UxmPwcc15P9342EiB8RP2bE9EYyWOwGy1F7hl+Oz4Gm07guHJcgRkj3BlsBes8V2y
         O8wJ4fEOsdL7+1eDJEF2tJypGtb6otIs6w/vU5NSIGQeUZi9wPK6Jjjbdmu60ciFAOcJ
         Y6oQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAIGxLw1bTgjF1Z79dgPC77D7hTSms/bLgAYerA9Z+7DYicWqF7S80qh/hGWvBeyXas2MZKXlvIWlpjQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzrVk4UqGPx2oyyL5whUEnx7qfJa5i5tg8/cVIEhPi2p12QJRSD
	x4bvPfEwN4JWTCQOqBwBOlzgQg6jWFqGVgBOXdFavIBeqDDmZEg3vmX2pmPFBVkS927hlAgTG0Z
	EZuLkg9QPlg==
X-Received: from dlbph24.prod.google.com ([2002:a05:7022:3718:b0:121:766b:11e4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:b94:b0:11b:8f02:a876
 with SMTP id a92af1059eb24-1244a75eb07mr15601672c88.23.1769100877336; Thu, 22
 Jan 2026 08:54:37 -0800 (PST)
Date: Thu, 22 Jan 2026 08:54:07 -0800
In-Reply-To: <20260122165407.561888-1-irogers@google.com>
Mime-Version: 1.0
References: <20260122165407.561888-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260122165407.561888-13-irogers@google.com>
Subject: [PATCH v2 12/12] perf disasm: Minor layout tweaks for struct arch
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Zecheng Li <zecheng@google.com>, 
	Tianyou Li <tianyou.li@intel.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Julia Lawall <Julia.Lawall@inria.fr>, Suchit Karunakaran <suchitkarunakaran@gmail.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>, 
	Howard Chu <howardchu95@gmail.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Shimin Guo <shimin.guo@skydio.com>, 
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_085439_060211_60306D02 
X-CRM114-Status: GOOD (  11.36  )
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

Pack some holes to bring down the overall struct size from 96 to 88
bytes.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/disasm.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/perf/util/disasm.h b/tools/perf/util/disasm.h
index 2793d48aa04e..6a1905f9d4fc 100644
--- a/tools/perf/util/disasm.h
+++ b/tools/perf/util/disasm.h
@@ -18,22 +18,22 @@ struct type_state;
 struct disasm_line;
 
 struct e_machine_and_e_flags {
-	uint16_t e_machine;
 	uint32_t e_flags;
+	uint16_t e_machine;
 };
 
 struct arch {
-	/** @id: ELF machine and flags associated with arch. */
-	struct e_machine_and_e_flags id;
 	/** @name: name such as "x86" or "powerpc". */
 	const char		*name;
 	const struct ins	*instructions;
 	size_t			nr_instructions;
 	size_t			nr_instructions_allocated;
-	bool			sorted_instructions;
 	const char		*insn_suffix;
 	unsigned int		model;
 	unsigned int		family;
+	/** @id: ELF machine and flags associated with arch. */
+	struct e_machine_and_e_flags id;
+	bool			sorted_instructions;
 	struct		{
 		char comment_char;
 		char skip_functions_char;
-- 
2.52.0.457.g6b5491de43-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
