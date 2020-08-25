Return-Path: <SRS0=kFy7=CD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CDC4C433E3
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 18:39:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EA9F2074D
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 18:39:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gej+S0Af";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/Ee8t65"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EA9F2074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4zxnPvxEAeLf+PAR1oabZ+CfKroccAXygskJqE86yUc=; b=Gej+S0AfJ4TtMPhVaEGtGzFtx
	aeA3CbpjPOwRApvDowA7vwAQakTZRZeUyU/5Ou/0eDyunoT04xuHdI5WcliaYgi3wAj/A4lnHVhlD
	RGERO2GMw0urDB4Zkl0jJ+jqFoAGrhDWMqhLkkl4ifYo52mq4yqiuIqu/ZzNg5uOQKHPpcQsCWK9L
	H81s4yblj7MV82e52w8NHzBVYNPpamXqJQrarrVSoGhqD78K7aTIOIX+961siHF8zbbH6Bz1csd+e
	vHTAygIybLB8zlHRE5SjRlNDI1dLz2snX4GTClMgqbwfUHRVFBxDEusXrD6umzpvL9E4U/+r1dCO9
	NI7A+1Lpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAdr1-0000Bh-Eg; Tue, 25 Aug 2020 18:39:31 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAdqw-00008e-Of
 for linux-riscv@lists.infradead.org; Tue, 25 Aug 2020 18:39:27 +0000
Received: by mail-lf1-x142.google.com with SMTP id k10so4013969lfm.5
 for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2020 11:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=441dYTgkLkwPNWfO4XR+ARdwXwC1+Whr6EzYQZXtht4=;
 b=E/Ee8t65cYHjf5gz8noZj88HWvN9Lvvx69Vf/MAMtGfEFA+r4prV+J7xs2A8+v/ZBC
 9RcPejEjd+xmZBSo43bzys/+ZZrY29uIqT5xRZk3GLQ6m9Qt7RMOkqINc6jZTuY37Vij
 WWD7ybuzGogj0DUWAW5v7chN5G3wrihae1TM7A8ZpQ12fpJf3uIRa09evAzojhSRj3UE
 VFEWleP+VYRD8BONoMmAXLq+qADZ2vNA3CqTjMwom/nTNOYQrqr/LawAMrdqZHUwxu0b
 w3l3o66vynh8DcCM5AVfP/14IjJOdjgXzivbZox5tMehcDvv+LGjS+awCxmslGLl3q4g
 GYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=441dYTgkLkwPNWfO4XR+ARdwXwC1+Whr6EzYQZXtht4=;
 b=Bm/Pu7t93gIbhUN8vgFBozuy9Ph+7DnfUrTb88cjy60LGKP/gYUHnq6FZBhpEseTMW
 xw/af6Ne0CbuU7H0187czGO5+8eg4Hi1/QZm0ZN55Bd2u6BpKuk7X9gkY7u9WYFyE0oj
 45DIJU/PT/kXYoT8ZaG5YeUjBIIaJ+W7zuaCwp8rwzK9MxqKWUdDXabyjMhOH9e6yuah
 C84+rgE5OQ52NMZgRvMxdb2pgvtvsF8s0OtZUoYRaYVThSPMNfthoiWNHmxYQJCyNG0F
 eTW5ZBzuVwfkAkGFs9SJDsc+zqX1WZXC0DHYYYNWdFHJub/EKrXwT22v//WdWQjMa+5P
 eXeg==
X-Gm-Message-State: AOAM531gQ1SkmNoWO/E+loXnP7Up24aQ9o8rI/8BnMGIjUOI9Q4/6kCl
 8mt8GywXCEk1cyu82/XPqLEIzEClS7i0TQ==
X-Google-Smtp-Source: ABdhPJwhENmHBUMIKx2uKdhu2PATJLxm6sylQuSQIKiNHHO/SuSYtrkKfzcZHXpOiNj9H2jQigzSpg==
X-Received: by 2002:a05:6512:3af:: with SMTP id
 v15mr5428650lfp.79.1598380765468; 
 Tue, 25 Aug 2020 11:39:25 -0700 (PDT)
Received: from nero.bb.dnainternet.fi
 (dyn9cmyyyyyyyyyyyyyft-3.rev.dnainternet.fi. [2001:14ba:2fa:2500::9])
 by smtp.gmail.com with ESMTPSA id e14sm3187120lfd.19.2020.08.25.11.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 11:39:24 -0700 (PDT)
From: Pekka Enberg <penberg@gmail.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH 4/8] riscv/mm/fault: Simplify fault error handling
Date: Tue, 25 Aug 2020 21:39:03 +0300
Message-Id: <20200825183907.275950-5-penberg@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200825183907.275950-1-penberg@gmail.com>
References: <20200825183907.275950-1-penberg@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_143926_874599_24B689DD 
X-CRM114-Status: GOOD (  11.12  )
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

Move fault error handling after retry logic. This simplifies the code
flow and makes it easier to move fault error handling to its own
function.
---
 arch/riscv/mm/fault.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 460ea1d6c24e..bfb40927cb7a 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -247,14 +247,6 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 	if (fault_signal_pending(fault, regs))
 		return;
 
-	if (unlikely(fault & VM_FAULT_ERROR)) {
-		if (fault & VM_FAULT_OOM)
-			goto out_of_memory;
-		else if (fault & VM_FAULT_SIGBUS)
-			goto do_sigbus;
-		BUG();
-	}
-
 	if (unlikely((fault & VM_FAULT_RETRY) && (flags & FAULT_FLAG_ALLOW_RETRY))) {
 		flags |= FAULT_FLAG_TRIED;
 
@@ -267,6 +259,14 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 	}
 
 	mmap_read_unlock(mm);
+
+	if (unlikely(fault & VM_FAULT_ERROR)) {
+		if (fault & VM_FAULT_OOM)
+			goto out_of_memory;
+		else if (fault & VM_FAULT_SIGBUS)
+			goto do_sigbus;
+		BUG();
+	}
 	return;
 
 	/*
@@ -274,7 +274,6 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 	 * (which will retry the fault, or kill us if we got oom-killed).
 	 */
 out_of_memory:
-	mmap_read_unlock(mm);
 	if (!user_mode(regs)) {
 		no_context(regs, addr);
 		return;
@@ -283,7 +282,6 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 	return;
 
 do_sigbus:
-	mmap_read_unlock(mm);
 	/* Kernel mode? Handle exceptions or die */
 	if (!user_mode(regs)) {
 		no_context(regs, addr);
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
