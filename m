Return-Path: <SRS0=kFy7=CD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A64C433E1
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 18:39:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2725F2071E
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 18:39:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="20NusO/J";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jVy1ddWI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2725F2071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aDTrhm0TAlo+MxevLbPcsaoaL2jKFqipr/RUKNF/8Fc=; b=20NusO/JLymMRQjC2zXUbXugF
	OjGLqdzOyu6FVO+Bkvz+x9E7MBc8RY/PXHn9nJJfHVFh4H+InXUyf4K5ULXI2rjzP5EC07Q2EcFia
	9qSBs3qx0jMLgsc7X8ZGotadSjgH/43LvRrXm+S/MqmXDb+2xkAza3EElVbfqKDT5KOc+FC20QXqb
	lpxbPLNZmq9sNqo24mHlcAiLZnL7KI+yVxTthTVySQa6zuwBtbHDyXWuT0Acc9K10TDdYVxljMbLd
	QdnXJ5B4VNlAjegdz4HRxXSinGJYSwuWLwOQGOKaPEiv5RSFPTtE0xJugSQKGpOm0y2+5PyFf/hfg
	cBdA37gHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAdr2-0000CZ-Vs; Tue, 25 Aug 2020 18:39:33 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAdqy-00009a-CF
 for linux-riscv@lists.infradead.org; Tue, 25 Aug 2020 18:39:29 +0000
Received: by mail-lj1-x241.google.com with SMTP id 185so15002928ljj.7
 for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2020 11:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZZklViG0QdUjeu913iokPHyx29mIFk2lZdtFQereSfQ=;
 b=jVy1ddWIfvtiUO7yZIwsyT4HMY3SMgN6/fUdLkt9STKFVFzq1lcBM7ri0+NKF1Sq6P
 n4ao4eyNzdFN0ukfJxORCWB4AFEhQg4/s3oDdz/XupsAV2qvBZvp42BQ/D9ZavC6msYW
 uj38ZGeKgOA+Rsk4I5E01jhFtYM7KcA+YTLn8BZHCOjiU2mAVNvGF7u4kCDYEPpVuRLM
 zW/8sS+HZ1ZvhSUwgwghV6wV+U89J+7HqLIoy/LWtoDDNJSvCp1tqfOCMV3d21/c5oBu
 F58POorIiakbkN2dEaJcRvR5YMroWaTE6uM7prN/bs8toFOMui4iK9MoVcbeQk+tD5um
 lh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZZklViG0QdUjeu913iokPHyx29mIFk2lZdtFQereSfQ=;
 b=KeJKJCkk/adpMNO6qPQ0DRLq7L798dC0fG4JvXv9QOihUGplhgIDHynb6eZfVQztm3
 oPzC6sVC72VvDi0jNKlkzCDRELsPt+XEFXSIuDWA1cwBQe6fW8SFWAM3GiTTnWdaSBUy
 RlFcKN9y2/7UReuB7izUP96TGPNXpYGfEjf5pEtp3ZMvhx+ZMkbyNuAYGnhqX9zyt789
 vuE9DrT0mLRSZnVQSvydPqDEM98U+rTjztWFJBWpk32wydRRXZhHr0cThLCmv9diYd3z
 o0K0askaJFoQ8OBaB4AZPoZ/rVSa1Twdlo+3QQ/Mx4KmKcehMn3JrX9xzZZ+TTgb3XSI
 7APg==
X-Gm-Message-State: AOAM5332aQiwqEWv0q0kzvGJDRXjSGSVNyjkSwxzih4ZFwDFH0B1D1u4
 xMSCLotFk5L77sCAMJtnkc8HDmM+KgBDVw==
X-Google-Smtp-Source: ABdhPJyNwbfhfqC2JMb1zQCmX8D8BdBVaE9uYrW3QLOev7G2xo2Jm+SPDmKch2W/I6mocyfofWBpTw==
X-Received: by 2002:a05:651c:1069:: with SMTP id
 y9mr5536597ljm.438.1598380767111; 
 Tue, 25 Aug 2020 11:39:27 -0700 (PDT)
Received: from nero.bb.dnainternet.fi
 (dyn9cmyyyyyyyyyyyyyft-3.rev.dnainternet.fi. [2001:14ba:2fa:2500::9])
 by smtp.gmail.com with ESMTPSA id e14sm3187120lfd.19.2020.08.25.11.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 11:39:26 -0700 (PDT)
From: Pekka Enberg <penberg@gmail.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH 6/8] riscv/mm/fault: Simplify mm_fault_error()
Date: Tue, 25 Aug 2020 21:39:05 +0300
Message-Id: <20200825183907.275950-7-penberg@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200825183907.275950-1-penberg@gmail.com>
References: <20200825183907.275950-1-penberg@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_143928_524678_E73FEDF1 
X-CRM114-Status: GOOD (  12.57  )
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

Simplify the mm_fault_error() handling function by eliminating the
unnecessary gotos.
---
 arch/riscv/mm/fault.c | 41 ++++++++++++++++++-----------------------
 1 file changed, 18 insertions(+), 23 deletions(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 49b190d0c088..3b430fb18de3 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -39,32 +39,27 @@ static inline void no_context(struct pt_regs *regs, unsigned long addr)
 
 static inline void mm_fault_error(struct pt_regs *regs, unsigned long addr, vm_fault_t fault)
 {
-	if (fault & VM_FAULT_OOM)
-		goto out_of_memory;
-	else if (fault & VM_FAULT_SIGBUS)
-		goto do_sigbus;
-	BUG();
-
-	/*
-	 * We ran out of memory, call the OOM killer, and return the userspace
-	 * (which will retry the fault, or kill us if we got oom-killed).
-	 */
-out_of_memory:
-	if (!user_mode(regs)) {
-		no_context(regs, addr);
+	if (fault & VM_FAULT_OOM) {
+		/*
+		 * We ran out of memory, call the OOM killer, and return the userspace
+		 * (which will retry the fault, or kill us if we got oom-killed).
+		 */
+		if (!user_mode(regs)) {
+			no_context(regs, addr);
+			return;
+		}
+		pagefault_out_of_memory();
 		return;
-	}
-	pagefault_out_of_memory();
-	return;
-
-do_sigbus:
-	/* Kernel mode? Handle exceptions or die */
-	if (!user_mode(regs)) {
-		no_context(regs, addr);
+	} else if (fault & VM_FAULT_SIGBUS) {
+		/* Kernel mode? Handle exceptions or die */
+		if (!user_mode(regs)) {
+			no_context(regs, addr);
+			return;
+		}
+		do_trap(regs, SIGBUS, BUS_ADRERR, addr);
 		return;
 	}
-	do_trap(regs, SIGBUS, BUS_ADRERR, addr);
-	return;
+	BUG();
 }
 
 static inline void bad_area(struct pt_regs *regs, struct mm_struct *mm, int code, unsigned long addr)
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
