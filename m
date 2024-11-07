Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF234D4337D
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Nov 2024 16:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TMIO9D5Z1c9DFKLoobmYvmoXPbt9A6oEX2FD18o7lj4=; b=xlOeKAsLFr4nPW
	5Eq9TIVhxxjLA7ZhvmqOnpoxZGFPFOln3MOJxtlVC4FRFm+xGxPIDN5hSmqnaNy7jwhuPGFlw2vm+
	RXVu0J1s2Kgd2gR4nj6arELWcCjeUHrEW1T+a+n6Wa4FBKhUQWO6nQmwRkYD83s5blV6Ka2v6KsUB
	wdq7xmr4OkJDWwCx4weuUv9dwPhOHzPOP/HiT3f4bOosz7YL8GcXXMDoz9/gxNAuhefK/QRSCYCH0
	bv02e/CCVnsJsSwo9J/rQYY9rSputsvwHDSlKvE8sbDrerwbUd/z1+QzIcIzhbZZzRF+XOU8XJijQ
	O9mT7aD1u4cnCTRaWhew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t95iD-00000007hmw-2KCv;
	Thu, 07 Nov 2024 16:50:25 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t95Fd-00000007bf5-1Qgu
	for linux-riscv@lists.infradead.org;
	Thu, 07 Nov 2024 16:20:54 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6ea258fe4b6so21406887b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 07 Nov 2024 08:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730996451; x=1731601251; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0JtSX1ivElzP67Gy896L9Ack6oYznxDX7izzc96bZIU=;
        b=SxznLeEbdNu8DHvs6tuCcrvdzAzd80IL9PJgcu55aY+Uazdbdo9oemEizKYoKjRqMM
         zD81tDOnHbH+KB2YAP0aYPotXW6eUGVjmzl0R0zPfWVcZZzXnw48AiaFK/eMeV2JEaWi
         bB1JkAta3l9+1xPMG2B0n5dn6JFqezYSMM7caldDUFHmU+p/l/kB5zA3I7fe0VZdrEHp
         7dX2jLYKuACRz7Y/E+7N4p5uuANNLjQbt6DyWkeMUuA4tnSm6C+8aPEyeLVy+z3ooX1x
         TtkkX2l7keJ62hh4W2yldPH46cZAOcGrhkD33fgo8NRR75XB1JQOteN1LYhKyh6BCfC0
         7gsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730996451; x=1731601251;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0JtSX1ivElzP67Gy896L9Ack6oYznxDX7izzc96bZIU=;
        b=TyJSI36ztx0IoV4YdkTtZsOkzTzCVf5eDOByWc/EQnbGIH4ephK8iPTwpxwtGrza8x
         vqvnEFJd+2eSfjSnLkr2O/l4mJIxN1MmqqS1bD8TqU87WB4jO+9fTveSYX1jVdq+jJoi
         ijv/lpwMf7CJuylL3gILMcaiZA/Fy+YGMghpZa7pbvgX3I9k9uIlavqLLKl5gQeO9EjA
         4DXjzLIVGud0mmlABoo2Vo7s3y0Xn2rKBHB3pBqkDtJFkGvT0DqNkHXlhsECLGYj9Plq
         jwsGVNwxHNhaex5LeOHaEk6JRV6e2/mNseeL3b70324nf3xF64sDm1NBF3bFoIEsXbxB
         kMVw==
X-Forwarded-Encrypted: i=1; AJvYcCV4GKZwjjdO3w3Pe1UdIqBnI2Y3abtPb/66V9qj4babhUiryMlhJK4+HWNcMDvRWIKtY8IQBzK0Sc7R7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmSL/jBpOesYNT0t66IxMLHViM3BXgr0KU8ZVHR457BuJ+B2Vi
	g/wG9KKcPF2vYLfRLaOsh7uPrBzqOfAIFGlu8ioEX4BlJLEvvB+6bRAkK6Ai8nzzZsZNdPdInUq
	pN70x6A==
X-Google-Smtp-Source: AGHT+IE0rx0KSxGHx6soYbCIVed3oUzDZtt0AEkgb4Fc4ntlPFe4VEdCSprC19W+Uf9rSJ3fRj2/Oar0I4CM
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:acc7:bda:7167:18d8])
 (user=irogers job=sendgmr) by 2002:a81:a788:0:b0:6e3:14c3:379a with SMTP id
 00721157ae682-6eadbe8b9c4mr2657b3.0.1730996451467; Thu, 07 Nov 2024 08:20:51
 -0800 (PST)
Date: Thu,  7 Nov 2024 08:20:32 -0800
In-Reply-To: <20241107162035.52206-1-irogers@google.com>
Message-Id: <20241107162035.52206-6-irogers@google.com>
Mime-Version: 1.0
References: <20241107162035.52206-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Subject: [PATCH v2 5/8] perf header: Avoid transitive PMU includes
From: Ian Rogers <irogers@google.com>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Huacai Chen <chenhuacai@kernel.org>, Bibo Mao <maobibo@loongson.cn>, 
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Ben Zong-You Xie <ben717@andestech.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Sandipan Das <sandipan.das@amd.com>, 
	Benjamin Gray <bgray@linux.ibm.com>, Xu Yang <xu.yang_2@nxp.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, 
	"=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?=" <clement.legoffic@foss.st.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Dima Kogan <dima@secretsauce.net>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_082053_406248_F9F3BBB5 
X-CRM114-Status: UNSURE (   9.49  )
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

Currently satisfied via header.h. Note, pmu.h includes parse-events.h.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/expr.c       | 2 ++
 tools/perf/util/env.c         | 1 +
 tools/perf/util/probe-event.c | 1 +
 3 files changed, 4 insertions(+)

diff --git a/tools/perf/tests/expr.c b/tools/perf/tests/expr.c
index e3aa9d4fcf3a..d60f1ac1d720 100644
--- a/tools/perf/tests/expr.c
+++ b/tools/perf/tests/expr.c
@@ -4,6 +4,8 @@
 #include "util/expr.h"
 #include "util/hashmap.h"
 #include "util/header.h"
+#include "util/pmu.h"
+#include "util/pmus.h"
 #include "util/smt.h"
 #include "tests.h"
 #include <math.h>
diff --git a/tools/perf/util/env.c b/tools/perf/util/env.c
index 93cabdd7ff43..e2843ca2edd9 100644
--- a/tools/perf/util/env.c
+++ b/tools/perf/util/env.c
@@ -12,6 +12,7 @@
 #include <sys/utsname.h>
 #include <stdlib.h>
 #include <string.h>
+#include "pmu.h"
 #include "pmus.h"
 #include "strbuf.h"
 #include "trace/beauty/beauty.h"
diff --git a/tools/perf/util/probe-event.c b/tools/perf/util/probe-event.c
index a580aa2cd512..d399c7e03341 100644
--- a/tools/perf/util/probe-event.c
+++ b/tools/perf/util/probe-event.c
@@ -40,6 +40,7 @@
 #include "session.h"
 #include "string2.h"
 #include "strbuf.h"
+#include "parse-events.h"
 
 #include <subcmd/pager.h>
 #include <linux/ctype.h>
-- 
2.47.0.199.ga7371fff76-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
