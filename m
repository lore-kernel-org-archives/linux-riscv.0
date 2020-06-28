Return-Path: <SRS0=ohv9=AJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E3FC433DF
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jun 2020 14:30:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20FA8206E9
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jun 2020 14:30:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g6PGNZKJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6Z9j4qy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20FA8206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+/nqGjVfRQbSKn273rVHI9KYpAHDhyH0Dh30cIbpfsg=; b=g6PGNZKJ7MCw5zxep8Q8U7qsU2
	Z8mJnNeCIua17x93bektFEcsTqSQ8RZfumdxZuNP2a+V5CfIkydpDokp4W8Emc+qobtlLw2yNEZQj
	ktkcLf05JX02yj5snQbiStlwS00gNKrxHB6GsU6uXbOMQhvha41y4dWXnKuFaeJAHGQm1ujNyMK3Y
	lsXhwmC1UgIVmGY0eU28NMhAXWiA3WwpPn+rILoyWGVKeGoNa51erwwSbeNoo6PWJCSpXb7HItKDq
	109JJTts3s98zPqSv8QSIFm3RtWVXN0s1GXB1/2MFI7KylV8do64cClxHfBDsqjVfKNhGbHP3YQjp
	G2ZE9GGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpYKC-0000gq-6B; Sun, 28 Jun 2020 14:30:28 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpYK9-0000gR-G8
 for linux-riscv@lists.infradead.org; Sun, 28 Jun 2020 14:30:26 +0000
Received: by mail-lj1-x243.google.com with SMTP id n23so15294526ljh.7
 for <linux-riscv@lists.infradead.org>; Sun, 28 Jun 2020 07:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9kc+Dze3KOm91Mv3SoVs4FLw9XUiGENF4Kpuo/SpTiU=;
 b=L6Z9j4qywrLVPXhRqdNv6RK8qaKPPgIrZqH1qDvj5XKOpS2Qq3Rwtfw7QrrxNRDnwu
 WNXZcT6evTJXvYOEolHUUHaQAkoHUyGVjkJAhpMfwW4ormu2CmmjTy5o5ArssPvzC4KX
 bkAcDBlcIuZzDhtVuTCz2JE93zGteLy95y69auzoEJUS5PwRO1Vri7pymYiHcW5AEjTG
 ub3UfUfBy0AVF3iL75wn3l4hESyXZG0Eln/ol0CZj0V/jzniCmuNoCZKIpXLmtrY193E
 4Z5NGnMnuJuyq0QDuonYJo7Y2Hn5Uuxt7RQQP7QiLrmoPC3pZHdxG5gI4zFpUZvS0X+L
 fB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=9kc+Dze3KOm91Mv3SoVs4FLw9XUiGENF4Kpuo/SpTiU=;
 b=Kx04MQbi08gONDhdKduz4bI1KiyuoaPcmk+4u7T7hdFIcmEAU0BkCovg0AsNvV+YXo
 bndt77mqrvEhozzSl3A3z+6c2rvjItFH4eZW8rk+j+qfdnf848plUe6FdyOx7b5wQ28A
 cjMdydNgKOrauw3NPmav7AO5d3BHKFLDJnnSuirumQuAm6r9QDu17F4flZHBE71QJPRT
 QFQf+l0baSlsC1yyYsnVdeCc32TRw3q9AMwUTHKwkti4FcLN8lDdJRBxOMyr1jVzaR+Q
 eBXdcbtGlNvLWKrSCQp/4CdoE6H/r20aIdrBoEAA6rldCPdBJCl+CvuVfVovNpZcLYEN
 jhfQ==
X-Gm-Message-State: AOAM531CmQ8qr+eRxxduQJvU+zH+pHGsyE1HhSb1+Oq0JMRvETbDRuYT
 lPRsAJpT3NK8cvwjRLHJ1Ghmr83F31A=
X-Google-Smtp-Source: ABdhPJzus2grovduFZ1+7CeK05VdcOPMa8VptzQjqnHfA/F8IWsNsYKDDfQN8bctJf6qmPtG0eN2qw==
X-Received: by 2002:a2e:920e:: with SMTP id k14mr6239392ljg.430.1593354622043; 
 Sun, 28 Jun 2020 07:30:22 -0700 (PDT)
Received: from localhost.localdomain ([2001:999:83:73bf:51e9:ed07:efac:8bd])
 by smtp.gmail.com with ESMTPSA id h16sm6838067lja.87.2020.06.28.07.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 07:30:21 -0700 (PDT)
From: Pekka Enberg <penberg@kernel.org>
To: linux-riscv@lists.infradead.org
Subject: [PATCH 1/2] riscv: Fix page fault accounting in do_page_fault()
Date: Sun, 28 Jun 2020 17:30:12 +0300
Message-Id: <20200628143013.1588-1-penberg@kernel.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Pekka Enberg <penberg@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The do_page_fault() function accounts for page faults only if
FAULT_FLAG_ALLOW_RETRY is set, which is incorrect. Fix up page fault
accounting by separating fault retry and accounting logic.

Signed-off-by: Pekka Enberg <penberg@kernel.org>
---
 arch/riscv/mm/fault.c | 41 ++++++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index ae7b7fe24658..26f51cf99542 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -32,7 +32,7 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 	unsigned long addr, cause;
 	unsigned int flags = FAULT_FLAG_DEFAULT;
 	int code = SEGV_MAPERR;
-	vm_fault_t fault;
+	vm_fault_t fault, major = 0;
 
 	cause = regs->cause;
 	addr = regs->badaddr;
@@ -111,6 +111,7 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 	 * the fault.
 	 */
 	fault = handle_mm_fault(vma, addr, flags);
+	major |= fault & VM_FAULT_MAJOR;
 
 	/*
 	 * If we need to retry but a fatal signal is pending, handle the
@@ -120,6 +121,18 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 	if (fault_signal_pending(fault, regs))
 		return;
 
+	if (unlikely((fault & VM_FAULT_RETRY) &&
+		      (flags & FAULT_FLAG_ALLOW_RETRY))) {
+		flags |= FAULT_FLAG_TRIED;
+
+		/*
+		 * No need to mmap_read_unlock(mm) as we would
+		 * have already released it in __lock_page_or_retry
+		 * in mm/filemap.c.
+		 */
+		goto retry;
+	}
+
 	if (unlikely(fault & VM_FAULT_ERROR)) {
 		if (fault & VM_FAULT_OOM)
 			goto out_of_memory;
@@ -133,26 +146,12 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 	 * initial attempt. If we go through a retry, it is extremely
 	 * likely that the page will be found in page cache at that point.
 	 */
-	if (flags & FAULT_FLAG_ALLOW_RETRY) {
-		if (fault & VM_FAULT_MAJOR) {
-			tsk->maj_flt++;
-			perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MAJ,
-				      1, regs, addr);
-		} else {
-			tsk->min_flt++;
-			perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MIN,
-				      1, regs, addr);
-		}
-		if (fault & VM_FAULT_RETRY) {
-			flags |= FAULT_FLAG_TRIED;
-
-			/*
-			 * No need to mmap_read_unlock(mm) as we would
-			 * have already released it in __lock_page_or_retry
-			 * in mm/filemap.c.
-			 */
-			goto retry;
-		}
+	if (major) {
+		tsk->maj_flt++;
+		perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MAJ, 1, regs, addr);
+	} else {
+		tsk->min_flt++;
+		perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MIN, 1, regs, addr);
 	}
 
 	mmap_read_unlock(mm);
-- 
2.25.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
