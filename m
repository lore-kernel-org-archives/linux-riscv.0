Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FD2C433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Dec 2021 05:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V9puU65Ok444ZRmCIJ9mVXTQ2pYR3N/uy8BuAZZ6AVE=; b=4cogiOE3rnQrHu
	SctCF0zo8LZRM464LgN7XLvmbz+XHw+D24zjNN+abERL78+m7gPMc6EJlzabbFE4LR98+c19nTUAP
	mz0H/gwyiNZfwkW4+Dpsrn0tqpLOwgaBvjIU8BgF05yvi/8v66+3g8m1XbEBF/+LdBrhpS8C663ze
	UL4V/jAtrzzOd8T8sovjzbTQGJdq4u13gq5kRjKt9aRYYYfgc5dbMxWoVfcwNwQLi8kPJ+rKFkah2
	Mhekykh7DpPCo49Wp3uArZD+eu7QBRgcvRWuBnCzIeE1AKihPx3C5OsNPU848ihCazrSVaDa6eCfe
	480K4eQ5ojpCjgCc8zqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt0qD-00EKXa-5c; Fri, 03 Dec 2021 05:10:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt0q9-00EKW6-Ov
 for linux-riscv@lists.infradead.org; Fri, 03 Dec 2021 05:10:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5995562945;
 Fri,  3 Dec 2021 05:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26A01C53FAD;
 Fri,  3 Dec 2021 05:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638508231;
 bh=wLyXrGyMh/xyPpvoTxp6H3MxZHIYwAnCnaLXA4jnF9o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uqNMSnrDTGrcmtr8IHC95HsIFwNSqly0CyFS545X9YL2brKGOTnngM9u3Q/HxQScv
 5FarSpg1+rmVsvh6UZ0J91dgpPUUFnx0VCs5/ewvCENGtTVJcDEtjUwWoQJVfjPCa9
 lyYyakwky+J626KhimtR6qj02rHA7U3MMPW1/LExRft7obRuZocuwz1Ak6wiN0s/Xc
 pESAx4fDdmRKO0aDnyLCvyBlSz+CdWteYMHqV/oks63CE4ioh7eelzPfRxia/bnG5a
 I6RZOcD4T84bMYogORfOuNU9YVAimRsazktgurHOdvipiZOS+ohVBJXFvvW3tBeo+I
 hClQGX/iQW1SQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] riscv: mm: init: remove unnecessary "#ifdef
 CONFIG_CRASH_DUMP"
Date: Fri,  3 Dec 2021 13:03:13 +0800
Message-Id: <20211203050317.2102-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211203050317.2102-1-jszhang@kernel.org>
References: <20211203050317.2102-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_211033_870416_38376779 
X-CRM114-Status: GOOD (  10.17  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The is_kdump_kernel() returns false for !CRASH_DUMP case, so we don't
need the #ifdef CONFIG_CRASH_DUMP for is_kdump_kernel() checking.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/mm/init.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 3c0649dba4ff..745f26a3b02e 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -790,12 +790,10 @@ static void __init reserve_crashkernel(void)
 	 * since it doesn't make much sense and we have limited memory
 	 * resources.
 	 */
-#ifdef CONFIG_CRASH_DUMP
 	if (is_kdump_kernel()) {
 		pr_info("crashkernel: ignoring reservation request\n");
 		return;
 	}
-#endif
 
 	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
 				&crash_size, &crash_base);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
