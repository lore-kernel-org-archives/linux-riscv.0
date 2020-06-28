Return-Path: <SRS0=ohv9=AJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3180BC433E0
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jun 2020 14:30:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F369020674
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jun 2020 14:30:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jTrnvmCO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBtXJLKz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F369020674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uscqypjVEP8T6TQST3kC0QKVEjEX/jYkV3Z5J6EiED4=; b=jTrnvmCOZU9u5dgiSe6XcQvVl
	U2hmxRCCjtkwLtyV4JsswVsdjZ/GKJzxhGV1U22d8WcKrRwyNU1aZARCWbRk4PTToPX10OjakpffF
	LkVRV5MW9cNGngDzhoV8XBZ5DO2TVhHqBk4XpbyaqFw8wMTnNbqdtXUY5PkPa97bDyAh9AN/aAD2g
	YBGyh1WPG462FmHPwEOX7lgWXaxHahnNcNmwHrze15YKWvjFryWbGwgpssaKocGOzNEJoIl1bYkji
	yc5K64keZT6wUVTEqutvBKl29ZwZOL4g0mpem8oWs+DmEpde3vzfNnsxouSf5UhCh2W1w8OBJ4Wb3
	vNFhDbxyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpYKC-0000gz-H1; Sun, 28 Jun 2020 14:30:28 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpYKA-0000gY-HX
 for linux-riscv@lists.infradead.org; Sun, 28 Jun 2020 14:30:27 +0000
Received: by mail-lf1-x143.google.com with SMTP id k15so7673845lfc.4
 for <linux-riscv@lists.infradead.org>; Sun, 28 Jun 2020 07:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=79XCOCXiGtHq3deN+Ftlym+DFbv/zWVjbIEQGd4FgtM=;
 b=GBtXJLKzQfLRnst2w1gjxDSmbuoG0JWX6pgZ4+gUxyqD+Ds3HIogegBlpWZ7nNm1Mr
 nHUyjmbB6E+PZpC0MkVWNCntEfUsE2claHGqYYdx9vHvGwOaiVpxKp+5AZqCoPzlxW7e
 tRr7uzDXvtk9oy10BO7V8JZhYWWXEwfF2je0b9P0P+OSJW0b/UNjh2kcdoDsVTURLuD6
 oPooMRYtJpyTVMOAIQGqF67uHrr+yAMK4H6Xt708exUiyt8fpwVLP3xu0Ie84asnvXnP
 hnSKQscIM1V2g9fqugUMZXXRjmpJMgN9CC+R2+b87Htr8VrAdjuJhJEg5cTx8cx2kGlo
 XDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=79XCOCXiGtHq3deN+Ftlym+DFbv/zWVjbIEQGd4FgtM=;
 b=jbt65O9aKXqc4vh7QDcnSKcg4vzlY4UCaGlKGE2UbWfBMX8YBvjOBbJ6q5aBx58EcV
 m8pWIVDz6XQ1OMiy+ByKh0BR2bjsWuhIHHuxQiMckBe8qcI3yUGcwXap8VIwqBBMpjRQ
 b8g01cC4DK5W+RnUHpHXtd4FYxFiZzSCRt63vNjWeDR8b0T1rMsuLkjRDtaHj2VnIZi0
 3/bVPnRttng65rEA9iyOdjJ2JGQAcdCI+ipXimKh8LtOsZ2UNcBFWQ4yqx0nzE+CwCJP
 VPkGuqSFfbchFYe6pyDZ7uNOJy5/JPidMxDSA8J79CFsVwq0s+T6+dB+n3Lg9cL0LtOx
 vNzw==
X-Gm-Message-State: AOAM533NDjX924A4zzBA4bnk1NcYeSJ8QWuqwimqnflZIBb87VHOYsP8
 Lk2stIRU4z3CgjMDrvH5UNEFt9yOBls=
X-Google-Smtp-Source: ABdhPJxLw3yoT9Y4SRLuB4Jx0IWqvlf7GpltIjVx5m0+jk+sI0EmRIzEhmNVQn5NSazeOeT3kmo1Vg==
X-Received: by 2002:ac2:5a01:: with SMTP id q1mr7077712lfn.182.1593354623470; 
 Sun, 28 Jun 2020 07:30:23 -0700 (PDT)
Received: from localhost.localdomain ([2001:999:83:73bf:51e9:ed07:efac:8bd])
 by smtp.gmail.com with ESMTPSA id h16sm6838067lja.87.2020.06.28.07.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 07:30:22 -0700 (PDT)
From: Pekka Enberg <penberg@kernel.org>
To: linux-riscv@lists.infradead.org
Subject: [PATCH 2/2] riscv: Drop mmap lock for page fault accounting
Date: Sun, 28 Jun 2020 17:30:13 +0300
Message-Id: <20200628143013.1588-2-penberg@kernel.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200628143013.1588-1-penberg@kernel.org>
References: <20200628143013.1588-1-penberg@kernel.org>
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

There's no need to hold on to the mmap lock while doing page fault
accounting in do_page_fault().

Signed-off-by: Pekka Enberg <penberg@kernel.org>
---
 arch/riscv/mm/fault.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 26f51cf99542..6256f25027af 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -133,6 +133,8 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 		goto retry;
 	}
 
+	mmap_read_unlock(mm);
+
 	if (unlikely(fault & VM_FAULT_ERROR)) {
 		if (fault & VM_FAULT_OOM)
 			goto out_of_memory;
@@ -154,7 +156,6 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 		perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MIN, 1, regs, addr);
 	}
 
-	mmap_read_unlock(mm);
 	return;
 
 	/*
@@ -190,14 +191,12 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 	 * (which will retry the fault, or kill us if we got oom-killed).
 	 */
 out_of_memory:
-	mmap_read_unlock(mm);
 	if (!user_mode(regs))
 		goto no_context;
 	pagefault_out_of_memory();
 	return;
 
 do_sigbus:
-	mmap_read_unlock(mm);
 	/* Kernel mode? Handle exceptions or die */
 	if (!user_mode(regs))
 		goto no_context;
-- 
2.25.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
