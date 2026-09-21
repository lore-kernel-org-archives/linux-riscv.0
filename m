Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06858C982ED
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 11:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3TrOUR0Y3KZ/jGKhZ48XCbddD6cLJv1hhD+Y5XSnwmw=; b=yxNfJUNv0vrg7a
	xxTzdlgoJ2n8iKgueYkixZS+HDX9xJRtevMmstMFvMy67zD4VhU7j3ukbJ/SLGOfPBmfQNyxi8fV0
	RpUoPWDgXBGyJR0r03t00J0Mt6DogtXGs5XPwaxkdaBXnbaVufZDqZL669RKD8gHpIkb71Z0ThM1W
	wH6bzlym5dFeURUYl2D/cBIlbop5y2PQa8x772gVd9KLub9xAzqM4VuRCnC/grJ4lJK+jUR/2jy1P
	agC/fenEZdQ47UfpnueHN3I+aCCxHoeFBz9u8FA1KwdFJVUrcXzM49Yizj4uZ0fiBEatBigjqXpCz
	jOfjnfLwBev+DAg0PQsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8c1n-00000001rri-1gnB;
	Mon, 21 Sep 2026 11:17:43 +0000
Received: from mail-pj2-x18.google.com ([2607:f8b0:4864:39::18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8c1l-00000001rng-1tY4
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 11:17:42 +0000
Received: by mail-pj2-x18.google.com with SMTP id d9443c01a7336-2d747ed9866so25993175ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 21 Sep 2026 04:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789989458; x=1790594258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s0eHZBxWOds1UYdEnuOhccIJeDRWzv84kT8tp0myDIA=;
        b=O2i7bRS6WETbjB0i5ibwEaTMdCNFzHQ/fN5Lsthmtdv3wo5wObWbK/AjZDDaebKBuX
         PTuGdnR1RErY30sz75YcbzcEhnXgToirUKyD+m52Qm3ycnRfEW3Y3lEwqoOPZNagmDjP
         Ci9nWtUG9vK++MjZ9pSpVk1JPU/LR0Ve9ylCUmbfcfOQWWrH8DKfUHHODXSlR/PXkqWB
         Y4vvVMPNH4b1U5eBFm/US8oW6RXsdy/jTKuQp6yT8AVqspEjM4l7q+3GX9q5xeGbTckP
         rdIOeWHjwhlGavwpF67fkQbOEDn2Vh8iFxvdlD8DknLr3+Zkf7HnoYah42lGedvR8cyV
         JcIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989458; x=1790594258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s0eHZBxWOds1UYdEnuOhccIJeDRWzv84kT8tp0myDIA=;
        b=NZzhfSw/QQXPsbKd6IlcAGY9vYj1SXPog6C4nTKUt1hCxQQxvLNwMfAOC4/tkMHavr
         VE07RxuKqv/cIvLEB+Ogqv1UYnu6BOlr6bHW3if6doONKaHUP1Yb1F3nUSGX53e0XQEM
         znnfKnvySs7szFfiF8cWJmWS5vw4CQIaNigI9PPM14qOS9tOhfRdmy1N9VaU3uuzdKoB
         qLAKYhaiPj2kqPTYB3w7XZyaNCOHTpLsJXLOCiI+tD7F1/p4yrzYU/weu5Bf8+iid56q
         +CDX+IljUgM3OWNden462BiNzwS+QJOCZ3ca5WEtmd4mdzuoi4dGOYukh3MOsINoUZGD
         ZlhA==
X-Forwarded-Encrypted: i=1; AKwUvBwEbHzL6rG89b7S4mcvCYUPFi5AbgEyaSdjL17CW9L33CFlTMCLSA6bkXi8+1OTaa0DzXozYF0lWSns1w==@lists.infradead.org
X-Gm-Message-State: AFuF++lALgNRvSk9UV3kYfktPDsDN76nO7i6ByoB98s7k1fEpqDUWCPR
	SmaUCmN0yK3vTCFOn5ZHT+Wh7fSuz6xQIT7rYlMezqFVGKZgn/U+395G8yXGiN2zjV0=
X-Gm-Gg: AYBFou3XUFvlqp3N9fwUGBxyUU5LWAYwKUj8YZwT0skCKXSWgN91/2u0KwrlC9afd+w
	9QBF5grkep2B3CNBrW1RD/lesjCEVShqZjcveuMQ4/hvmr0sCdWfpI34Wh+3aUiCfMgKUx/hR74
	LOmsPHl6r+GLwUi5YRE6xhNZV1siMGzzT82tqYcq9wngLt0LkcMmwynwc950CAi6LNn51ygOpc0
	+9W9LWKmST+Wn23mCNWGCcTGCe/popASZQqttVBUj7CAZXo2AHOLWlvA8+IrX+H22KgWPS9V5Qa
	QUgvaYUWqEtw5AbOwxcgOkDbMuEbqbU4YUlhR0ixc52KtBbymZ0uqYO35m+AAdcTgeZPkM4tGmP
	5N4VmkAxwGPqJ5mv1inL4+cTxx6aWDzSFsNA1n/DSJ9axBKgqoUgi+jUqcqbeDwxNGZccAnfS7+
	/hz4S3eYzY1aveSx37JgrU6Z70q4Guxl1EIqCY1QSDR+JryocUikfyWRkjn4XlCCpd5c2mx1Ogo
	tFDfNo0Urhe18J4sPajMHUyQalDHQ/gQ2YZ
X-Received: by 2002:a17:903:2349:b0:2dd:c100:a5de with SMTP id d9443c01a7336-2ddc100a706mr90374885ad.50.1789989457717;
        Mon, 21 Sep 2026 04:17:37 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([240e:694:e20:401::8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17ba651sm31831125ad.53.2026.09.21.04.17.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 21 Sep 2026 04:17:37 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
	Conor Dooley <conor@kernel.org>,
	Anup Patel <anup@brainfault.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Atish Patra <atish.patra@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Yuanzhu <yuanzhu@bytedance.com>,
	Yicong Yang <yang.yicong@picoheart.com>,
	Susheng Yang <yang.susheng@zte.com.cn>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH v10 RESEND 5/9] riscv: mm: avoid enabling interrupts for nofault page faults
Date: Mon, 21 Sep 2026 19:15:02 +0800
Message-ID: <4bc18f96053a7859a3ff33747479b05a9e42a706.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
References: <cover.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_041741_492278_658B002E 
X-CRM114-Status: GOOD (  13.23  )
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

RISC-V enables interrupts in handle_page_fault() before checking whether
the fault occurred with fault handling disabled. A nofault access from an
atomic context can therefore run tracepoints and open an interrupt window
before reaching the exception-table fixup.

Handle an exception-table entry before entering the generic fault path when
fault handling is disabled. Also keep interrupts disabled until such a
fault has been resolved.

This makes RISC-V consistent with the expectation that an in-atomic
nofault access does not enter the normal fault-handling path. It also
removes one source of re-entry when perf sampling is delivered through an
SBI Supervisor Software Event (SSE).

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 arch/riscv/mm/fault.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 04ed6f8acae4..520495420462 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -294,6 +294,13 @@ void handle_page_fault(struct pt_regs *regs)
 	if (kprobe_page_fault(regs, cause))
 		return;
 
+	/*
+	 * Nofault accesses must be resolved through the exception table before
+	 * entering the generic fault path or enabling interrupts.
+	 */
+	if (unlikely(faulthandler_disabled()) && fixup_exception(regs))
+		return;
+
 	if (user_mode(regs))
 		trace_page_fault_user(addr, regs, cause);
 	else
@@ -314,8 +321,8 @@ void handle_page_fault(struct pt_regs *regs)
 		return;
 	}
 
-	/* Enable interrupts if they were enabled in the parent context. */
-	if (!regs_irqs_disabled(regs))
+	/* Do not open an interrupt window before a nofault fixup completes. */
+	if (!regs_irqs_disabled(regs) && !faulthandler_disabled())
 		local_irq_enable();
 
 	/*
-- 
2.50.1 (Apple Git-155)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
