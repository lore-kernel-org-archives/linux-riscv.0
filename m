Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F34606A33A
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 12:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ukYjBRFd;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=FaUvzOF6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aI0Yw7Hvvsy2d0Idx2vhV1FOyDnsrqNm7gzzDnc/5ts=; b=ukYjBRFdU6YwxthRdQkkDI1dJe
	2B+UnOTQSfrhbl4LTdfuXYOMA6bEIU/37qLS8eHkeZLbvsVQEfMutYHTqi4wGEQKPeNfsDj3QeGF2
	0KrOJgLmb2olA6Rl5+PfjO2dm4i39imSQ93FDnj+PsjYgf2FkYnyfkG6VUw+Ylgb/lv0uaV/8AdO8
	4dH9wx5daumbtUVeah6ltjzNXmb8tMCi83+ft7vnAWkQYi0TxP2Brsfgf/0mbdUVaHgaD9V5kZ3sn
	UHgJFlJ1pDWqyRqqAZbMvLloKNkT4ifJ1ijCnw0b9p0MPF/5wqgUnU7SfbQJev2n7qXTvp1NhUZM5
	DyHUOHMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0xS-0000000Bn47-290X;
	Thu, 19 Nov 2026 12:09:42 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0xQ-0000000Bn28-01fJ
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 12:09:41 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-38431138772so1026623eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 19 Nov 2026 04:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795090179; x=1795694979; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IMQKgMzK5koXpzwpAGfuvI2X9uFekTM0Brh0o9wzQHI=;
        b=FaUvzOF6X5Nj+FqppPmuC/KC1vNBhglLVsVqINWq1hIlrmwOlj/5iL7fcWF154mwSl
         uTf2swiORAiuUFvf6DL2UctYaNmzao7eZpjFA6b6deN/La0MQ8gYmwJTTq+igGYlatgP
         7IYWbISpSDOlaSuo7ptp6JgtJZpT8BBm6qGokX8DkoV8ZgjjVERdpkLtx/9gC7QSfWoo
         DlIUQ9DzHU/mJRYtaFB4k2aao8NJQCE/Om2JkUkG7sIWEkCPR6886bUt5RAksX44nZF9
         aMOqYCvahb2ayh8zJy7T5DsuJHZWQ7FYtbbFmRwMXk8PkBa6HT8Cy9z6OVLpoErLrFAn
         lRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795090179; x=1795694979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IMQKgMzK5koXpzwpAGfuvI2X9uFekTM0Brh0o9wzQHI=;
        b=nuBKMyudJmKO+XDRi3H5ij4BFvAMdJsb3JbDUhd5TFJoGBK7XcOLfSDg7yELGjOSKX
         mavElXKiZnhInKELBB7CGpdN3gSKtjQtVKFY+RIf2NsiGV+TbCoWEArXk4uZ7j4RaGUS
         OZxWY/d+aePadqKE8zYrtoYqG9yCEDVMH5EnaHkRFFfJ6RxQEAVInR7mcpPqEDHk/npZ
         3nM649PxE0ZqDu9Nlq8Y10CBT9QSWKrm1vXCc+1eTxghShh22ADO0xQ6PXybjD1v7AMM
         dWjn0K84f5f6X96On9+cQCm0SpvPDqL3rhqa/Y3sA8Ms4AfkFzct/d54HJk8ctg7bXxi
         Pq7g==
X-Forwarded-Encrypted: i=1; AL+hErEarV80TVPTSgvdvQrpe7jV9QrJL82kZVuhWg6FTy6JaxVIN9lwvpmQ94emPRVguM/JVGtpfr3uWhztTw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/UBARGZxmVzYAgQPoOUSPMj5Ad2ApyZpR2UYTdB8y7n3wGNqYh
	EdX6ubv5tJxAgs0blPSXsDq10KUS1P3lsdkNOPzyhTSZ7WLnv111avxaKCwS8AcK6mM=
X-Gm-Gg: AZFdTZfBPmQRnNzu2f30q1cCnFlINq9CyXsSdXhL2eULAlspczC/rPp5/pueg10/BaS
	MVTmaAOK0nuP9Su9yyf/er64KNNITGPr2NmjuaaTgJQY+3Uw+z9XknYiDP74nx2yZ8b4ttMOc/k
	DghA04QeN90zUWuyXCaSVNhQSBI+pWDiZNXJFWokxlyvvlvbXDEj560MFbab6YDqBiAgiGeIc8R
	BXRScV5mH7D5uJ4P2VgLMyJOKgXNgiOeXFNpu8VOW3NR4e+Q+4JOSNy/zA3PhgJPVvr+uZz7sCN
	80qMlaiubMrtnSAc5wmbyEXgTAkx+HQfdLd07VgBKspkoPlrfumu5yTgyUQATGlJHPI9eB7l3bM
	MMOlgopzCsJaFXQ7+YB0AX9OwtDwB+YtMBByKWBMDV8uk5BA4cxOLQJ5u+T5yZl0gLf+loBM5FL
	LKlYvaL7wq7C0zE/IjFqymCQze8Os1VMSNTKNrJR3sWm6W7ABUF8BXCt6T7L7p+Xdbc2DIHfvJb
	/Y1UdYm8ymhZ+sfAViF12gplg2d7DvsWK2GVBRQBbwfSClJI674t+qFFts/n3j/qYxC6MfbCVNa
	ItGCikIJeawo1SXHu2tUY9W5I7V4DyXIMtFpfToigGf6CNgh6i7+GRJrdCZp/tewUjW/XhuWq1t
	8JfU4iG8=
X-Received: by 2002:a05:7300:b594:b0:381:5fe2:8008 with SMTP id 5a478bee46e88-38281eebbb1mr6614536eec.39.1795090179031;
        Thu, 19 Nov 2026 04:09:39 -0800 (PST)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7bc05cfsm17604650eec.26.2026.11.19.04.09.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 04:09:38 -0800 (PST)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	himanshu.chauhan@oss.qualcomm.com,
	conor@kernel.org,
	anup.patel@oss.qualcomm.com
Cc: clement.leger@linux.dev,
	cuiyunhui@bytedance.com,
	atish.patra@linux.dev,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	will@kernel.org,
	tglx@kernel.org,
	corbet@lwn.net,
	rdunlap@infradead.org,
	shuah@kernel.org,
	yuanzhu@bytedance.com,
	yang.susheng@zte.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangzhanpeng.jasper@bytedance.com
Subject: [PATCH v13 05/11] riscv: mm: avoid enabling interrupts for nofault page faults
Date: Thu, 19 Nov 2026 20:08:29 +0800
Message-ID: <20261119120824.13969-18-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261119120824.13969-13-zhangzhanpeng.jasper@bytedance.com>
References: <20261119120824.13969-13-zhangzhanpeng.jasper@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_040940_050212_58F14E45 
X-CRM114-Status: GOOD (  15.95  )
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
index 04ed6f8acae4..3934248f7a27 100644
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
