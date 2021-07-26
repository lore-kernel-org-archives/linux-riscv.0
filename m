Return-Path: <SRS0=HVPl=MS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC54C4338F
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jul 2021 05:44:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7790C60F47
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jul 2021 05:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7790C60F47
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dHpl+GdoiDdkOIF1POwxafKpl1PQQaXT6W1mfaGaekA=; b=qKW4xkfaozyUKW
	mIAs10MKeCLga+15/15bzQcaSNfyk5owz5CXmENR7Q8mJnwknyntguGk3yHJ6wZ7EvDjvU3bfMY74
	Yxs3VT7zUcxrJ9r4FFU6Sa2igfckIXGk9LtQzE6mhONf+Wj+nRbBgwboglVel9YcXBf/O6xyD8nlv
	4jmeh3vlOmdhPGigrmm2sfOVLGXAf/lKox+DWU2EuRO8IwJ0rNZ7SEYnQR1E0ry3iXHnhazP/gOWy
	y+lV8xJJ3TEVdONzzrLymDalHQYSiZW0QXSHPWDZjf56z/ZLAJelmVlE7MqqL7uZQwObbZ2ojpmmj
	oItmZT8GZaD0TUx1vieg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7tOq-009fWM-3y; Mon, 26 Jul 2021 05:43:36 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7tOL-009fV8-M2
 for linux-riscv@lists.infradead.org; Mon, 26 Jul 2021 05:43:11 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 35CB2240002;
 Mon, 26 Jul 2021 05:42:56 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH -fixes] riscv: Fix comment regarding kernel mapping
 overlapping with IS_ERR_VALUE
Date: Mon, 26 Jul 2021 07:42:54 +0200
Message-Id: <20210726054254.21801-1-alex@ghiti.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210725_224305_918632_FA22C281 
X-CRM114-Status: GOOD (  14.02  )
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

The current comment states that we check if the 64-bit kernel mapping
overlaps with the last 4K of the address space that is reserved to
error values in create_kernel_page_table, which is not the case since it
is done in setup_vm. But anyway, remove the reference to any function
and simply note that in 64-bit kernel, the check should be done as soon
as the kernel mapping base address is known.

Fixes: db6b84a368b4 ("riscv: Make sure the kernel mapping does not
overlap with IS_ERR_VALUE")
Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/riscv/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index a14bf3910eec..79a2e02924e4 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -191,7 +191,7 @@ static void __init setup_bootmem(void)
 	 * if end of dram is equal to maximum addressable memory.  For 64-bit
 	 * kernel, this problem can't happen here as the end of the virtual
 	 * address space is occupied by the kernel mapping then this check must
-	 * be done in create_kernel_page_table.
+	 * be done as soon as the kernel mapping base address is determined.
 	 */
 	max_mapped_addr = __pa(~(ulong)0);
 	if (max_mapped_addr == (dram_end - 1))
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
