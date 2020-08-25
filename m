Return-Path: <SRS0=kFy7=CD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A32DEC433DF
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 18:39:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CC9B2071E
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 18:39:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fbAMNLiD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CRBntHHo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CC9B2071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lW702OozGD07UdkKpsr4KrT1FvlWHkcFejvotwgyhxE=; b=fbAMNLiD35Kmf2hqi82dEPeLf
	h1tRe4QaVARqPNM+bTIyInDbJCMTyffBIXpOjCvciiFo/pxnBuAnszVc6fnK/zIxVqR1H6FXnzxL1
	2nELhEPLDbH4mj/ZqpqPJ3tIJQRTDNSS7siG9S0+hmyf0BDiu4fUAa3+tcxVhSBZyK/fnOiyuVD6l
	LZUJtfk26XkpDyX/bJiNGOTr70nEERVAy3vOVMvhO4iv8rKtFDOLGxfN3eZH8f+UpYrdpmD1O7KbP
	votFNieI/xC3qQcYKdK6rMwTG9zOgNa89olU1uMb9B29JPE2ntZA/q4shfdEbNkGwY7iAm1IPv33N
	O71Mgv4+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAdr2-0000CH-1F; Tue, 25 Aug 2020 18:39:32 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAdqx-00009I-Jo
 for linux-riscv@lists.infradead.org; Tue, 25 Aug 2020 18:39:28 +0000
Received: by mail-lj1-x242.google.com with SMTP id w14so15005250ljj.4
 for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2020 11:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=etIIgbMDO2febHpxkGdQvxswY90f4Vuw17XGu7x/9yc=;
 b=CRBntHHotQi09myPxXsp7IhOEpJcPhh2U6wWvzk/MbXyB6UCTzDqgw+LFzkKrcWHHW
 gf7U6tMQvnZLPY5XCkASRLsCxWcCo6D5UpmY/u09eIIbQB3PBbBbGBi0jvMaacf3sP8B
 4L/ZBPtTrDcd87ZFF97EvgilsrGunqz8rVakKG2HKYsQZWYuYZh4fXN2uRBORGjRAQdf
 Afs2TjGAZTuoVirIZzNE1mJivWtwL2i8jtNVbfLn9B5q0hscN7etUYrm6XD/WIv1XB+P
 gB/LdSwpf+D/o0b6vYvk6U5PlK4agoymqe9L+zEjAolScmHRdARuWSXBvfeiCHxehRi2
 LVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=etIIgbMDO2febHpxkGdQvxswY90f4Vuw17XGu7x/9yc=;
 b=dFSRTWGDHcthu+BwWkYRGPQSZJLB0dv995Wjj05rc0YndDT761ulAneaF8cmFjWLj/
 J9u2sMcVgucskeHeS4SoyNHlTlrU8kai95g81GH2D1Nl+xBuI8Jr2KjfTCtc4vIVP4Wa
 huJuyCaiJCX5XwBevh/oe57deivrZcGWZIsVcdtiKmXjkyUXAX1DuCWtjKnYx3xxuK6Z
 +917MNbDIsC7qlyAqCp9w6IPX+uwpzaYeZkOILjmoM2DdcApyrU9lpn8JEWhsZXzX4BP
 LDpcxfIexyAVspjSvOgV2yekrbkrPDdeQz0/lJWxNvkaJ6SLgsmsin5LSkrBxhbbugcO
 tBCA==
X-Gm-Message-State: AOAM531SjmSsjw6q7++c1tW8wUsXE6oMHXUOmv7L23J4Kfa2+aKWSrSY
 Gxije4OSpsFyH9KJC/7IajZ0uarsBZoekg==
X-Google-Smtp-Source: ABdhPJyfLUVExi5HiUHaQZ47GwvVViqeFTypS/gt+MMBkasqYQB6UaKd/24JlPFs6E4xEsOS6nGV8Q==
X-Received: by 2002:a2e:1417:: with SMTP id u23mr5774130ljd.44.1598380766380; 
 Tue, 25 Aug 2020 11:39:26 -0700 (PDT)
Received: from nero.bb.dnainternet.fi
 (dyn9cmyyyyyyyyyyyyyft-3.rev.dnainternet.fi. [2001:14ba:2fa:2500::9])
 by smtp.gmail.com with ESMTPSA id e14sm3187120lfd.19.2020.08.25.11.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 11:39:25 -0700 (PDT)
From: Pekka Enberg <penberg@gmail.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH 5/8] riscv/mm/fault: Move fault error handling to
 mm_fault_error()
Date: Tue, 25 Aug 2020 21:39:04 +0300
Message-Id: <20200825183907.275950-6-penberg@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200825183907.275950-1-penberg@gmail.com>
References: <20200825183907.275950-1-penberg@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_143927_698915_BC093079 
X-CRM114-Status: GOOD (  14.35  )
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
Cc: Pekka Enberg <penberg@kernel.org>, palmer@dabbelt.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Pekka Enberg <penberg@kernel.org>

This patch moves the fault error handling to mm_fault_error() function
and converts gotos to calls to the new function.
---
 arch/riscv/mm/fault.c | 56 ++++++++++++++++++++++++-------------------
 1 file changed, 31 insertions(+), 25 deletions(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index bfb40927cb7a..49b190d0c088 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -37,6 +37,36 @@ static inline void no_context(struct pt_regs *regs, unsigned long addr)
 	do_exit(SIGKILL);
 }
 
+static inline void mm_fault_error(struct pt_regs *regs, unsigned long addr, vm_fault_t fault)
+{
+	if (fault & VM_FAULT_OOM)
+		goto out_of_memory;
+	else if (fault & VM_FAULT_SIGBUS)
+		goto do_sigbus;
+	BUG();
+
+	/*
+	 * We ran out of memory, call the OOM killer, and return the userspace
+	 * (which will retry the fault, or kill us if we got oom-killed).
+	 */
+out_of_memory:
+	if (!user_mode(regs)) {
+		no_context(regs, addr);
+		return;
+	}
+	pagefault_out_of_memory();
+	return;
+
+do_sigbus:
+	/* Kernel mode? Handle exceptions or die */
+	if (!user_mode(regs)) {
+		no_context(regs, addr);
+		return;
+	}
+	do_trap(regs, SIGBUS, BUS_ADRERR, addr);
+	return;
+}
+
 static inline void bad_area(struct pt_regs *regs, struct mm_struct *mm, int code, unsigned long addr)
 {
 	/*
@@ -261,32 +291,8 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 	mmap_read_unlock(mm);
 
 	if (unlikely(fault & VM_FAULT_ERROR)) {
-		if (fault & VM_FAULT_OOM)
-			goto out_of_memory;
-		else if (fault & VM_FAULT_SIGBUS)
-			goto do_sigbus;
-		BUG();
-	}
-	return;
-
-	/*
-	 * We ran out of memory, call the OOM killer, and return the userspace
-	 * (which will retry the fault, or kill us if we got oom-killed).
-	 */
-out_of_memory:
-	if (!user_mode(regs)) {
-		no_context(regs, addr);
+		mm_fault_error(regs, addr, fault);
 		return;
 	}
-	pagefault_out_of_memory();
-	return;
-
-do_sigbus:
-	/* Kernel mode? Handle exceptions or die */
-	if (!user_mode(regs)) {
-		no_context(regs, addr);
-		return;
-	}
-	do_trap(regs, SIGBUS, BUS_ADRERR, addr);
 	return;
 }
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
