Return-Path: <SRS0=1JZA=NQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF93C4338F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Aug 2021 07:21:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F86361056
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Aug 2021 07:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F86361056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zkNW8lQ7MYM0BUP1/0wHtvbfzNm77qd06SUtRVVh0kc=; b=gWFilc+yh7fDrx
	r951vk+Q7cT7kP94QLTE9mQeFy0NaSRssiXwk5eVQWIfiC+zNvjGI+hXaSahh7Zx8a3B/9qYA9vqL
	7aR5Bb5YysorrNpBagpshelcoTTYDguGqBPNUaXMblvWC7A4BaFV0+gKDIj7mZ64MSSr7VmPyyiER
	/zvhmEvxlodq+cS0M0zStklkDtXoQWi8PPkv19dyju3v5oOUO9hn9LahwE1h3vLForb5q+NNvDFjx
	vhqzMbPmsKFL/6E60Yr33xA+G6Qhin8Dn3don9ljGqbCb/RYFfwnuwuHTJ3LlWnnDGkOPPOBPihXt
	AXA63Vh/OSXpRt3IE9SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mInDI-005n4Z-Ei; Wed, 25 Aug 2021 07:20:44 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mInDE-005n3g-Qv
 for linux-riscv@lists.infradead.org; Wed, 25 Aug 2021 07:20:42 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id E46C267357; Wed, 25 Aug 2021 09:20:36 +0200 (CEST)
Date: Wed, 25 Aug 2021 09:20:36 +0200
From: Christoph Hellwig <hch@lst.de>
To: akpm@linux-foundation.org
Cc: mm-commits@vger.kernel.org, peterz@infradead.org, npiggin@gmail.com,
 linux-riscv@lists.infradead.org
Subject: Re: + mm-move-ioremap_page_range-to-vmallocc.patch added to -mm tree
Message-ID: <20210825072036.GA29161@lst.de>
References: <20210824204433.qwSJf%akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210824204433.qwSJf%akpm@linux-foundation.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_002041_059429_CCB6202C 
X-CRM114-Status: GOOD (  15.68  )
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

To fix the riscv-nommu build this patch should be queued up before
th move:

---
From f454cd71930eff395f8be8674bef0ccd53bd1b62 Mon Sep 17 00:00:00 2001
From: Christoph Hellwig <hch@lst.de>
Date: Wed, 25 Aug 2021 09:18:21 +0200
Subject: riscv: only select GENERIC_IOREMAP if MMU support is enabled

nommu ioremap is an inline stub in asm-generic/io.h.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4f7b70ae7c31..8598e3d103a3 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -48,7 +48,7 @@ config RISCV
 	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
 	select GENERIC_EARLY_IOREMAP
 	select GENERIC_GETTIMEOFDAY if HAVE_GENERIC_VDSO
-	select GENERIC_IOREMAP
+	select GENERIC_IOREMAP if MMU
 	select GENERIC_IRQ_MULTI_HANDLER
 	select GENERIC_IRQ_SHOW
 	select GENERIC_LIB_DEVMEM_IS_ALLOWED
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
