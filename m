Return-Path: <SRS0=GJuv=FZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 856A2C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Dec 2020 22:52:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1401922573
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Dec 2020 22:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1401922573
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nQJ+5JHEIUJLzMMoTgY6T1S6KBWKdlwLRrcCHF9DXow=; b=VfAtj1/3rKSFWV2TqxqzGYnDXH
	+A0k4Ta+x7Kfy6vJ/HpcV0WgJfV6RsNVyMSPNu74doKOqP7FEoclFUyaX7QriJdIygSHXbGEzI0gB
	L3pXtbv1B9A/hpq/6o172NjQdnz097+E3dlHuTb6i5vLaqbMzNU9Q2IwTX1C4vtXYda5dueuZqsnE
	QefbfKdv8ATD7z65TenQOaS+sM+hnNP6D57u6hVT6IQ8Hw+v+8SGQ9fqBsQvCQtp7OgV084wpnMhE
	2CYDqTDlFiBsb90ehx65L92JgU/W1CeoTta0v/vAWXY3RnZaqOIir1i+W1iRDm/dH4dgci08wtk0L
	7kAi3tsA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krU2B-0001q8-PL; Mon, 21 Dec 2020 22:52:07 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krU28-0001ph-SL
 for linux-riscv@lists.infradead.org; Mon, 21 Dec 2020 22:52:05 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5B586AC63;
 Mon, 21 Dec 2020 22:52:01 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: return -ENOSYS for syscall -1
X-Yow: How do I get HOME?
Date: Mon, 21 Dec 2020 23:52:00 +0100
Message-ID: <mvma6u6vkkv.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_175205_035034_56228826 
X-CRM114-Status: GOOD (  13.78  )
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
Cc: David Abdurachmanov <david.abdurachmanov@sifive.com>,
 Tycho Andersen <tycho@tycho.pizza>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Properly return -ENOSYS for syscall -1 instead of leaving the return value
uninitialized.  This fixes the strace teststuite.

Fixes: 5340627e3fe0 ("riscv: add support for SECCOMP and SECCOMP_FILTER")
Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 arch/riscv/kernel/entry.S | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 524d918f3601..d07763001eb0 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -186,14 +186,7 @@ check_syscall_nr:
 	 * Syscall number held in a7.
 	 * If syscall number is above allowed value, redirect to ni_syscall.
 	 */
-	bge a7, t0, 1f
-	/*
-	 * Check if syscall is rejected by tracer, i.e., a7 == -1.
-	 * If yes, we pretend it was executed.
-	 */
-	li t1, -1
-	beq a7, t1, ret_from_syscall_rejected
-	blt a7, t1, 1f
+	bgeu a7, t0, 1f
 	/* Call syscall */
 	la s0, sys_call_table
 	slli t0, a7, RISCV_LGPTR
-- 
2.29.0


-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
