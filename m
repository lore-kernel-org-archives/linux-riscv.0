Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CC8606A326
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 07:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CFAwbuUK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Sh73ft+X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AeagQBuJY7WZx620JjgK2AU1pQq7plwAwKfiijyGFVY=; b=CFAwbuUKX4eWExesen3Hxc5+PO
	xrNiiysKEiuJREr64ZpXXeh1ztq6uf2sHMH15PBINt0WVLgLKpR6qnzo16v8k6gg4dLhhyMWt54Qj
	bVRmQhNu6K7iXb5b+qyzNwgmyAx0e8FakaN5jrvxkchxq3P6HvuAlRNx85PuMEoNwF4XuK5xhbOk0
	ejLMvIKqQjnEx85LTcO45KIjNeR4DZOaV4EHs+TJN5G3t4zPgi0Co+PvY0T9rGElsatkTxGBqY45f
	V7c3pTh4rnZKi7SB3ADpEbiGmNEW9/WQhnmXw9Sq85nP7hELa5oUN96u0l02v5Kpnl570tWRMdu5f
	uHQhVquw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMKu1-00000008aEy-2hYJ;
	Thu, 29 Oct 2026 07:50:28 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMKtu-00000008aAn-1iA7
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 07:50:22 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2e95bd1c14cso14855665ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 00:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793260217; x=1793865017; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7fLWyH+TvbQZVa2PMkKwnEQ/dwg0CGfLoj0eX15fQZI=;
        b=Sh73ft+Xc7NLhPFOKKdCLk5O9V4hTVIgnqOvECtIUyWnfmEuqXRYLFwVM/fC7D+9UV
         l25RZak5COb9aMpvkSvYkSXz7Nac9X5nxpf0COj0ke2kv7Rl+f9JBn3L0wyIKeGyS7y1
         ld0Al/qOiPRzKabL+glBFOq1Y/oxv6P/U/QnBr3kOkdvJodBVWWsojCVoYI2K8/jM90L
         6L7i2hj0Ie37AtJuuTHAr2FsiljghzFl+wXOXN0SEE98lGXZ5sc455kTo18K9P4SL0Nt
         Y4tK3uZZTuOVCYq/QWDuGWb4Exit3TSgIYLI9F9AUilhghP/jNxW3kfDRGB+QD2AJsd1
         Sc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260217; x=1793865017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7fLWyH+TvbQZVa2PMkKwnEQ/dwg0CGfLoj0eX15fQZI=;
        b=EUbw4aGgs3XiEjDdZo4WD7JHNz9vm0eL1AZTRhMzoVkAWTHqXcDyp5w7N+Udok3Z4g
         I4ekuJRWF2EB3gDZDzmW44lb68KyMkSiiidQxmKlR01ArnyX0OXIQJP6F9+BdFAe4n99
         PYhNOEtjspDP4zD/GTlmaezZ4o3xC50XRR6SzzgL5v/jvQzmyq82kKYld7T0kOi3TJOd
         tYciXIbSlM1bNV8N12biq1U0NS5UGIBxRB7MHYbf18iJgiRPd1F0SHKFVVQ+Dfkv2Ahv
         11f3uPL6dKJqJ6dulGVal/G1xA4o13YkEm+6QETkBYdyddC6gHe6gLzrudezYjNBk8pL
         8fqg==
X-Forwarded-Encrypted: i=1; AKwUvBwQXWCX6JXWc7Rt5BHLZfUqk8B8kUx9YlRSvF1MTf1Nkj7mANqWJSIfmmYv5O/NYGCq5vc9F4C0YGOL6A==@lists.infradead.org
X-Gm-Message-State: AFq9FYLfhPYGPA0hVlYO7Bb2rlZt9T99OaKbgSU3/wTtwVjiQ3g2sNVP
	xhR+V7AolceMeuvPYV//Ig466tag4E1Ez5mL3uNbthLIEzEcbiGpRz3olZwzecw056I=
X-Gm-Gg: AYBFou3zZhdl78ZJQp2oce9StZcDhc+gSYpy+4V68xQEjnUEzhHnrQ7WY+1wDl+ukM/
	klqw+Jk9GAKA+UOUu1xCrYDRejX/GlsKRq5Vso4xvPMZ1ktLpOl02Z6ELpkGAemBlfOXbWEyjRE
	dR7lyztVTq97pHC/LIZ4P+AuEcgK1XqM50nhkRvUnhPIBMUnXpIbnB+WtHrivAcLlkO0cCfvtUp
	OTa1mPfuXjiXXdx8vB/hZi3968CDyc0mEDMjH5nmx97I6e+f5fWB5ktVpy6SjFXb5HbzezNccdk
	8mfRyVJAURAuo3ms//OPbPZa+w6MG824AOwVR+8EUJmeJcE0+bSy0o3UIYZgGeWZklzyaZxkRdg
	/Qf58upFtGyW3a7rMWLYnmsvU01IB3Rm+urtK6bT1WrXPIrqwnLis6UIxqVIDRus1y1r2QG83dS
	QAiBtiZfSTvbCaolBzzoOfvHakx9aH6KuE+8kdLTH+YKZEksErAfCHf+82KmY84cO81JjLk1ITc
	Qy7jFsFfDyrXfgWHwAo+xbFrn6gOZsBjUF4Y2X0g7oKfr4tspBSutb3BqSuRpQmWKDp201b9XcP
	ezbeUEy0nNvylkyJpoBu4jFwtYMURY58bdV8ZR3Oib3cYeUfj6thtPs+f8bHQ/3eNXl5tO7RL9f
	kYYse9j0=
X-Received: by 2002:a17:902:e949:b0:2e6:dcce:8222 with SMTP id d9443c01a7336-2eb005fd704mr43443105ad.57.1793260216775;
        Thu, 29 Oct 2026 00:50:16 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bd60desm30598915ad.29.2026.10.29.00.50.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 00:50:16 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
	Conor Dooley <conor@kernel.org>,
	Anup Patel <anup.patel@oss.qualcomm.com>
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
	Shuah Khan <shuah@kernel.org>,
	yuanzhu@bytedance.com,
	yang.yicong@picoheart.com,
	yang.susheng@zte.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH v12 05/11] riscv: mm: avoid enabling interrupts for nofault page faults
Date: Thu, 29 Oct 2026 15:48:47 +0800
Message-ID: <20261029074853.35467-6-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
References: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_005018_648304_E2BC9CDD 
X-CRM114-Status: GOOD (  18.12  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RISC-V enables interrupts in handle_page_fault() before checking whether
the fault occurred with fault handling disabled. A nofault access from an
atomic context can therefore run tracepoints and open an interrupt window
before reaching the exception-table fixup.

Handle an exception-table entry before entering the generic fault path when
fault handling is disabled. Also keep interrupts disabled until such a
fault has been resolved.

On 32-bit RISC-V the vmalloc mapping must still be synchronised into the
current page table before that fixup runs: otherwise a nofault access to a
not-yet-synced vmalloc address would take the exception-table fixup and
fail spuriously instead of being resolved. Order the vmalloc
synchronisation ahead of the nofault fixup. That synchronisation only
copies an already-established kernel mapping, takes no locks and waits for
no I/O, so it is safe in the nofault path; if the mapping does not exist it
falls through to the existing no_context() error handling. This early
return skips the page-fault tracepoints, as before.

This makes RISC-V consistent with the expectation that an in-atomic
nofault access does not enter the normal fault-handling path. It also
removes one source of re-entry when perf sampling is delivered through an
SBI Supervisor Software Event (SSE).

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 arch/riscv/mm/fault.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 04ed6f8acae..3934248f7a2 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -294,19 +294,23 @@ void handle_page_fault(struct pt_regs *regs)
 	if (kprobe_page_fault(regs, cause))
 		return;
 
-	if (user_mode(regs))
-		trace_page_fault_user(addr, regs, cause);
-	else
-		trace_page_fault_kernel(addr, regs, cause);
-
 	/*
 	 * Fault-in kernel-space virtual memory on-demand.
 	 * The 'reference' page table is init_mm.pgd.
 	 *
+	 * This only synchronises an already-established kernel vmalloc mapping
+	 * into the current page table; it neither allocates memory nor waits for
+	 * I/O, so it is safe in the nofault path. It must run before the
+	 * exception-table fixup below: otherwise a nofault access to a
+	 * not-yet-synced vmalloc address would take the fixup and fail
+	 * spuriously instead of being resolved. If the mapping does not exist,
+	 * vmalloc_fault() falls through to no_context() error handling.
+	 *
 	 * NOTE! We MUST NOT take any locks for this case. We may
 	 * be in an interrupt or a critical region, and should
 	 * only copy the information from the master page table,
-	 * nothing more.
+	 * nothing more. This path returns early and therefore skips the
+	 * trace_page_fault_*() tracepoints below.
 	 */
 	if ((!IS_ENABLED(CONFIG_MMU) || !IS_ENABLED(CONFIG_64BIT)) &&
 	    unlikely(addr >= VMALLOC_START && addr < VMALLOC_END)) {
@@ -314,8 +318,20 @@ void handle_page_fault(struct pt_regs *regs)
 		return;
 	}
 
-	/* Enable interrupts if they were enabled in the parent context. */
-	if (!regs_irqs_disabled(regs))
+	/*
+	 * Nofault accesses must be resolved through the exception table before
+	 * entering the generic fault path or enabling interrupts.
+	 */
+	if (unlikely(faulthandler_disabled()) && fixup_exception(regs))
+		return;
+
+	if (user_mode(regs))
+		trace_page_fault_user(addr, regs, cause);
+	else
+		trace_page_fault_kernel(addr, regs, cause);
+
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
