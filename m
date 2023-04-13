Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76470C77B6E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Apr 2023 16:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rSqYUWPmni54J6PPwrDNyRKRAC1v6nBuSSZJttuSYrI=; b=O7sL7L3snH5XU2
	uF+0ytssVxSHyQHj/F2fwj33nOLATBIluwAaJ1uzZldHSzlpmC0nBVlCo7udQTn9HMEPHG1ZUyLcP
	ZZENc7To1+lwe0GTOufY7Y7lBCSZGDW9OxwvnQJH2B5fu5LcrGGW0m4z4iyhY+BKhNfu1fsn6xQVK
	X0rjW8UNUYExCmU5Ku9jKLDR10SjiaCr7QsQ4ONsuxauJmGPv1ItFNBPqJgm6MsZnVsXL132vuXID
	+mLs1VQxvo/0Oe0Pc+yBwze5rhRGVpHGwuboMRkV1WL+SYFKPf7eMsLBUf/IhUGrn+KCN2sLHyq+5
	b6ASkMdHqOCQTi9TKJcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmzfe-006eAb-0F;
	Thu, 13 Apr 2023 16:19:38 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmzfa-006e7t-2n
	for linux-riscv@lists.infradead.org;
	Thu, 13 Apr 2023 16:19:37 +0000
Received: by mail-wm1-x32b.google.com with SMTP id v14-20020a05600c470e00b003f06520825fso13983395wmo.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Apr 2023 09:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681402772; x=1683994772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7K1lqgu2UMJSXGJkQ/CNFe9i2Bxz4FKmXNvI/1jCqDo=;
        b=15siB7iyaLI7ctUMscCZfFX7080U7A2snA5d/ylfDn2u0Pb2PAujpho+y2aaI8sDES
         L9dYvDnEKV28S0BEUMUYMff3pHCziTgOwLvMBYdNsHgsE8onnhngFHIWkp5qQQO5NnA6
         HDYnzLU3zZPRt1RMj1UYXdjtAX/E5HB9ziYTRiqybX3T5i4kqboxQTZPLFIprCtCV73A
         9GV4d8UEvAJ1foOmAeHQQEhFUH6dhZ9W9TJRDXGt9YiynihCT59rnmSu6FrNGrgf2+BQ
         gu/1A9UIhojnFwn5Bjj/eN+sgmpT8UeQR4Nt78j6/1Qvs0RG4TE2rOrliYct6yfHNMxO
         y5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681402772; x=1683994772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7K1lqgu2UMJSXGJkQ/CNFe9i2Bxz4FKmXNvI/1jCqDo=;
        b=C4kj1XrkS8q45P/jTLsEne+FJ/CVT8tg4hKBy3ohlisXnGg24ymxwLipZDCqok8NGP
         PaE/1oxdLQ6NvRl72QMiWgOPzq9bkO36LXNtCEI2ikfMshDPiVGQ/piv6b7q3faEUX15
         0mHEjk9NT3kqAFDiYDoQJT8pYOQz/u6Y28f5xEw9esNOw556OsQdp0BHk3Ax8aB32Zdk
         xePdTHCB9cWpgiwjdCTKlRRfMg5Hw5Q4sI7QL677fGSFtF4eGASFjl1jpCyaZkBRwOjg
         7VBacz6nAKB076kGySCfcsM08ESRukTQZ3tKDD+hnxlVXYE9y2tLEwQJul4dqWgKacdH
         9v3Q==
X-Gm-Message-State: AAQBX9fk1DnztCoqiCLkck/RbYDeUD2buTAOPsppjhqYMARw18deT/ET
	aqr7sNyGljRRlk3cc7Y5g+2naA==
X-Google-Smtp-Source: AKy350bbu+EgoDrMFvfMpZKlXMYBBCuVXkA66tWJ2iTh3msfJsJnFkge5XkpmCS78VFL7H6Vq98hpQ==
X-Received: by 2002:a05:600c:201:b0:3ef:76dc:4b80 with SMTP id 1-20020a05600c020100b003ef76dc4b80mr1984394wmi.9.1681402772524;
        Thu, 13 Apr 2023 09:19:32 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id bl18-20020adfe252000000b002d7a75a2c20sm1573011wrb.80.2023.04.13.09.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 09:19:32 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 2/4] include: riscv: Fix wrong include guard in riscv_pmu.h
Date: Thu, 13 Apr 2023 18:17:23 +0200
Message-Id: <20230413161725.195417-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230413161725.195417-1-alexghiti@rivosinc.com>
References: <20230413161725.195417-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_091934_907531_E71186C4 
X-CRM114-Status: GOOD (  11.64  )
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

The current include guard prevents the inclusion of asm/perf_event.h
which uses the same include guard: fix the one in riscv_pmu.h so that it
matches the file name.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 include/linux/perf/riscv_pmu.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index 43fc892aa7d9..9f70d94942e0 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -6,8 +6,8 @@
  *
  */
 
-#ifndef _ASM_RISCV_PERF_EVENT_H
-#define _ASM_RISCV_PERF_EVENT_H
+#ifndef _RISCV_PMU_H
+#define _RISCV_PMU_H
 
 #include <linux/perf_event.h>
 #include <linux/ptrace.h>
@@ -81,4 +81,4 @@ int riscv_pmu_get_hpm_info(u32 *hw_ctr_width, u32 *num_hw_ctr);
 
 #endif /* CONFIG_RISCV_PMU */
 
-#endif /* _ASM_RISCV_PERF_EVENT_H */
+#endif /* _RISCV_PMU_H */
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
