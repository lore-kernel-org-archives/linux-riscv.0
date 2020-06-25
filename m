Return-Path: <SRS0=bAcz=AH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82FE1C433DF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 10:52:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B4FF206DD
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 10:52:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qmKfgiCg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="WwEZpo6I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B4FF206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wplUJRk8K/QnZH1aCLQf3GKU01MkUQm83Z9BfZFN7DA=; b=qmKfgiCgGvzlRFM6UtlSwrwJZ
	MxHT8R1relDB3Xaj2FhMDKka/iwDBJ/JB1NX51WAuMOu7p20JBowIHzO1/wXJa3FhH5iR+T/co0tB
	5hQJb3kIaa80V6YzzPFUj+PX0/7d8FTxjHcRqMJAu8cyxlIbvYykFdcjp+ESLLOBxPmWndlW1gOlf
	pzXhWtdwaFrOAydIUwEmpXaeDXY7UuC/2wJ1a08sgwMELcIh/caMa+Tmx2C14BUBlu8BIbeAnYtqj
	5ECSmduUp2ThHhQcazNwDYQyibvrfb/JBMNGWRyYSMwhv+nj29FH2XEEia4jtT6ufiPTkxWvbwP2Y
	JPb0GK8uQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1joly7-0006R6-6A; Fri, 26 Jun 2020 10:52:27 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jojlj-0002Se-4o; Fri, 26 Jun 2020 08:31:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1593160319; x=1624696319;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M20HiMQD9oL/II9j9nUHwk6euEXhFNaJrLjuGryzaCg=;
 b=WwEZpo6IDDbEK0ba9AnBys9H2hWvlDjiRbarTG56Ypcc12dEUtQKc7At
 St5KBsuVnTueyYZL4D2fLddG+Jf3OHyHHiaj5/Y01TYG/nucc6cDNJP6D
 d21syZGOzvbyDmdf3OnC5z5slHqR4TuskVsA3rSdsnQhqknVTsqDUMh6E
 l4sty+VF8PQ7cp1mb4tD7N8SuI/SA8wX5oNcAKKsmChUR2mfTNAYDjN4O
 gJT1Sqx3AJRnVagOygZSO8R4pSgGZiZ87Y7b0WTUyag0YADjo9DpN/zc9
 HfXBVwONfeRqxZLKm0HYowuTaH5iUFBfjhNUOrnTwaVC6MP+fB/dqtmQL g==;
IronPort-SDR: ldnnOUVhv5g0HxhnaG3UIc7mrEfL4fKoiIPj0ggyownvXEQ8wIyEyJJDU3fxMSKfc1DCs/+pH6
 LbTS1kuqXt9UVxuCJN76s+7nmL/fKl6XBR4vEMJGO5IwZls8gU76+0NpvLhuybykOH6wtgcNP7
 IbnmOEPBDwtIS8eOiC+e57V6wEtaul807spELn/H5LydTcLKDA17xP/076pT6YywD+m3/BU/5Q
 pykpeF5tYMYkHTjsDFK0iOHO1qPM3XP90PzCw7BB7di1CPWFDny6pNzm+4lALK34eHXGU1m9Op
 rfs=
X-IronPort-AV: E=Sophos;i="5.75,280,1589212800"; d="scan'208";a="243966114"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Jun 2020 07:45:56 +0800
IronPort-SDR: 4ASP1j9ICIDbfEG7WxflWKzcygyCIyqSDviyPXzpY2q45ge6Xk+JRohiOT7swSI5drGc6tl7yR
 CNfYYGB7Sdh8kELlzZWvTy6id+9hCbHBE=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 16:34:25 -0700
IronPort-SDR: khYCqebgabkJ7OmHX9caktKOD4V4TcpsYIxqNzM9dj5nEB94M2b+iarGnwOnVnuCSjRcLYVinX
 PHvoAzKFAmkw==
WDCIronportException: Internal
Received: from 2349pbt5e4f.ad.shared (HELO jedi-01.hgst.com) ([10.86.58.78])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 Jun 2020 16:45:24 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH 03/11] RISC-V: Setup exception vector early
Date: Thu, 25 Jun 2020 16:45:08 -0700
Message-Id: <20200625234516.31406-4-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200625234516.31406-1-atish.patra@wdc.com>
References: <20200625234516.31406-1-atish.patra@wdc.com>
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
Cc: linux-efi@vger.kernel.org, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The trap vector is set only in trap_init which may be too late in some
cases. Early ioremap/efi spits many warning messages which may be useful.

Setup the trap vector early so that any warning/bug can be handled before
generic code invokes trap_init.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/head.S    | 10 ++++++++--
 arch/riscv/kernel/smpboot.c |  1 -
 arch/riscv/kernel/traps.c   |  8 +-------
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index c5b529234ad8..eb123eda3663 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -77,10 +77,16 @@ relocate:
 	csrw CSR_SATP, a0
 .align 2
 1:
-	/* Set trap vector to spin forever to help debug */
-	la a0, .Lsecondary_park
+	/* Set trap vector to exception handler */
+	la a0, handle_exception
 	csrw CSR_TVEC, a0
 
+	/*
+	 * Set sup0 scratch register to 0, indicating to exception vector that
+	 * we are presently executing in kernel.
+	 */
+	csrw CSR_SCRATCH, zero
+
 	/* Reload the global pointer */
 .option push
 .option norelax
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 4e9922790f6e..5a9c127a380e 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -154,7 +154,6 @@ asmlinkage __visible void smp_callin(void)
 	mmgrab(mm);
 	current->active_mm = mm;
 
-	trap_init();
 	notify_cpu_starting(smp_processor_id());
 	update_siblings_masks(smp_processor_id());
 	set_cpu_online(smp_processor_id(), 1);
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index ecec1778e3a4..fbedf6c018a3 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -174,13 +174,7 @@ int is_valid_bugaddr(unsigned long pc)
 }
 #endif /* CONFIG_GENERIC_BUG */
 
+/* stvec & scratch is already set from head.S */
 void trap_init(void)
 {
-	/*
-	 * Set sup0 scratch register to 0, indicating to exception vector
-	 * that we are presently executing in the kernel
-	 */
-	csr_write(CSR_SCRATCH, 0);
-	/* Set the exception vector address */
-	csr_write(CSR_TVEC, &handle_exception);
 }
-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
