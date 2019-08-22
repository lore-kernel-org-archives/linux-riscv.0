Return-Path: <SRS0=8Mks=WS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8745EC3A59D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2019 06:56:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59FD3233FE
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2019 06:56:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PPSYD/iX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59FD3233FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F8zosLt3glZ52Njwljko77U0FaX0oFoNR5RuDfGTCgM=; b=PPSYD/iXokCPFy
	kHLiZCCRW7r0weyp7xGbCGGIWM/D3iDSKlIttSOCF4xuRJmHZlNOeXldltbr3FqCfQOFezGqlkiSv
	q6/RxM6t08n/wT+aXhRGqwr7OWrePBtJoG8UahWrhpbAADtKhq+UTl9QVRqOlzEWz+9WN4h8A1Nw9
	m4e9T7Hy63DZdIKNDSwIWWlsxV1R+f4cZkr5zGTDfcag1H1RO8rUcV25fEr+UnHvZeMwpaHIyA+xD
	G2mTJFrvZBB0zSS92zMTQlaukHySGa6seUQ7q1e9SN3+p4nSMhy0/cIJYPF7MwUNCDRUlFnopRq71
	oPEbNnW8AhlNGBQbuFnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0h1L-0008S0-0f; Thu, 22 Aug 2019 06:56:31 +0000
Received: from rap-us.hgst.com ([199.255.44.250] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i0h1E-0008Kj-Cq; Thu, 22 Aug 2019 06:56:24 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH 4/8] riscv: remove the active_mm check in
 sys_riscv_flush_icache
Date: Thu, 22 Aug 2019 15:56:08 +0900
Message-Id: <20190822065612.28634-5-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190822065612.28634-1-hch@lst.de>
References: <20190822065612.28634-1-hch@lst.de>
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
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

current->active_mm is always the same as current->mm for user processes
(see Documentation/vm/active_mm.rst for details), and given that we are
directly in a syscall handler this is obviously the case here.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/mm/cacheflush.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 4f78d6552476..eed715de4795 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -38,7 +38,7 @@ static void flush_icache_mm(bool local)
 	 */
 	cpumask_andnot(&others, mm_cpumask(current->mm), cpumask_of(cpu));
 	local |= cpumask_empty(&others);
-	if (current->mm != current->active_mm || !local) {
+	if (!local) {
 		riscv_cpuid_to_hartid_mask(&others, &hmask);
 		sbi_remote_fence_i(hmask.bits);
 	} else {
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
