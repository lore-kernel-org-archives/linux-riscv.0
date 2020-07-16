Return-Path: <SRS0=HL6o=A3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A825C433EC
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 06:15:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A47C20760
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 06:15:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TiPZqHng";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="luZVTy7U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A47C20760
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+hx6gbEiGj+cURVOJ/jZlFlc29f18ZZ3dpYslVekZ1E=; b=TiPZqHngP2LFd94/77kWyq4ti
	nr6qf1DccCmPWrB6ENjWptwRaCzGSLQdA2AGKv2R/t9MtZSSaEcMjly6hCCI5WOJBjZOPu4HhFE+b
	o9aVpZniGr4m/IEJqjPSbzTIqbCMqnl6PvLETVFmO1WBlQ3TX5U26v/4Gqna65XyuvwMu2HbVclMj
	rapL0RpOZi6VgCPMvWst0Ihf3FXMvN2H+Qd6DxRT57Ji19j3R5KY6O+iM6zpXI/AvhQwlmROaIOXy
	lYTHw/KvyZO8AvnvWZG9rH0q0yPPEyNaFeOOFBsGR7yACA5lQv+OezEdXOGOkpT1pzqzMG2uAVmHc
	ucX7GRaUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvxBF-0005xE-Tv; Thu, 16 Jul 2020 06:15:41 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvxBB-0005uM-3F
 for linux-riscv@lists.infradead.org; Thu, 16 Jul 2020 06:15:38 +0000
Received: by mail-pl1-x643.google.com with SMTP id 72so3423044ple.0
 for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2020 23:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BkeEqRQbglHLv2yxtofvkyD/OehHy6oNANtsGj9riwQ=;
 b=luZVTy7UjWQeqvJTyQGhjEn7z95XImQrZqU+iNnwWxokUMRDYtwSemTMD7y5bkSP3g
 9qIO3hSZgW++89aBuG0RY3pc6ulqiWbUnYXFn/+nYIKsEC2ymEA1dqC82Qd3K+MdV+wY
 oR9SvqfHkyb6483Y1zQ4d7BY/EA4MqueqUkUK+Qpncc4CrIK3w5YlNMCPWtSJGzH5UyT
 rKV0OEJ7FXiiFUFcJ8oG5P8LSQf6uUpUlPm68p5cbztEs+yXN2aM8L2kIJeumrxOj2ok
 nnklSfRT3W9z9K3qY1oAkZNVYLow16oMb0C05DStCNGV/bV2AJC5edYO7j4uYKiViol9
 AL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BkeEqRQbglHLv2yxtofvkyD/OehHy6oNANtsGj9riwQ=;
 b=cWb/s/+bccKmsu1VSb5ZW1A624WCosg9YFcQJTHSbM0DI30J49ES9SRdiYgv+Tb8vy
 +U0pBV3qbO5r3Yy1FA9mh/XO//xN/ocliNFFZKJxqQoPjD5wC1nDpFUpMaMFshwnR1VV
 Yk+hzyx2TCPH+y35B3r6qEzNty8NSo4BVnRKPK0C7l3vsmV6rLLrRJ85q+uJFc16BC2J
 sYaqafmnrHzUH3YsxfxUrUcjux1duSPift8ymgwJshQAYmPwHtq7wsMlxc4Flu+iXBhV
 meLXlFdOvVuYYR4x7QIUmFbXHEpDxkSwCMzAW1gA3OjqGKnPmDKaqsPAFOzsNhB9mzQU
 eR+A==
X-Gm-Message-State: AOAM532zUEUPB8vxLyHvqhKsJOesj2nZeds6UcG6tOps7syDhbKxnTDW
 QhEX9ZxOdiVR5ExMBjITq+oeOQ==
X-Google-Smtp-Source: ABdhPJyKpNHfOYu/JRAbP7dA11y+/AgGv5AEB0bowEr6EgODGQJV1nGoMa3mH6q5PKhBIgOBd7WSJA==
X-Received: by 2002:a17:90b:33cc:: with SMTP id
 lk12mr3446170pjb.194.1594880135171; 
 Wed, 15 Jul 2020 23:15:35 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id w20sm3669904pfn.44.2020.07.15.23.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 23:15:34 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] riscv: fix build warning of mm/pageattr
Date: Thu, 16 Jul 2020 14:15:27 +0800
Message-Id: <28365b581b04d0237e127363a63c1ad72dbea683.1594880014.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1594880014.git.zong.li@sifive.com>
References: <cover.1594880014.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_021537_169321_851DEE96 
X-CRM114-Status: GOOD (  10.52  )
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
Cc: Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add hearder for missing prototype. Also, static keyword should be at
beginning of declaration.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/mm/pageattr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index 289a9a5ea5b5..19fecb362d81 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -7,6 +7,7 @@
 #include <linux/pgtable.h>
 #include <asm/tlbflush.h>
 #include <asm/bitops.h>
+#include <asm/set_memory.h>
 
 struct pageattr_masks {
 	pgprot_t set_mask;
@@ -94,7 +95,7 @@ static int pageattr_pte_hole(unsigned long addr, unsigned long next,
 	return 0;
 }
 
-const static struct mm_walk_ops pageattr_ops = {
+static const struct mm_walk_ops pageattr_ops = {
 	.pgd_entry = pageattr_pgd_entry,
 	.p4d_entry = pageattr_p4d_entry,
 	.pud_entry = pageattr_pud_entry,
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
