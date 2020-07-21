Return-Path: <SRS0=tQi0=BA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A24BEC433E2
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 04:58:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C1E52176B
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 04:58:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PTO+Fpbe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C1E52176B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yjw+bDLu6VAS3n+ApRDfs/cLALeEKUJcXfQfhBaRgNc=; b=PTO+FpbeZBcRV5cfb5qz/e/1R
	I4w3BMd78Joh0I+FcPMUojvf8UM6A0b5UHJvPgW17m9MATaai19QE8Ue/1vzwfDcMmD6x4oohDaOR
	iu5uVNufZMctz/bK0QiiJRncHSTfJi/0lXkggumrGvPh7d9TlU0AyCsyQ3vRwaWyxMDMoZZJiXqix
	TYsKZ3SY2ROIOHJDE1IlrKHqyP+iow3GgYugmNQJA6K0DDaWKRt+MLJ99HiGog/aSF+vTw8xkmIpI
	RdjpaT8i41JtzvcqJhwssAdYxxIo+R0NRLTKkQxFwdDFCX7NaTP1KyUTq4F7cKnP1oGvP8dhRWOs+
	FNftKDmfQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxkMS-0001fE-No; Tue, 21 Jul 2020 04:58:40 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxkMQ-0001er-FZ
 for linux-riscv@lists.infradead.org; Tue, 21 Jul 2020 04:58:39 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id E950E68AFE; Tue, 21 Jul 2020 06:58:34 +0200 (CEST)
Date: Tue, 21 Jul 2020 06:58:34 +0200
From: Christoph Hellwig <hch@lst.de>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/6] syscalls: use uaccess_kernel in addr_limit_user_check
Message-ID: <20200721045834.GA9613@lst.de>
References: <20200714105505.935079-1-hch@lst.de>
 <20200714105505.935079-2-hch@lst.de> <20200718013849.GA157764@roeck-us.net>
 <20200718094846.GA8593@lst.de> <20200720221046.GA86726@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720221046.GA86726@roeck-us.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_005838_657183_35D6A046 
X-CRM114-Status: GOOD (  20.17  )
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
Cc: linux-arch@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vincent Chen <deanbo422@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jul 20, 2020 at 03:10:46PM -0700, Guenter Roeck wrote:
> I had another look into the code. Right after this patch, I see
> 
> #define uaccess_kernel() segment_eq(get_fs(), KERNEL_DS)
> 
> Yet, this patch is:
> 
> -       if (CHECK_DATA_CORRUPTION(!segment_eq(get_fs(), USER_DS),
> +       if (CHECK_DATA_CORRUPTION(uaccess_kernel(),
> 
> So there is a negation in the condition. Indeed, the following change
> on top of next-20200720 fixes the problem for mps2-an385.
> 
> -       if (CHECK_DATA_CORRUPTION(uaccess_kernel(),
> +       if (CHECK_DATA_CORRUPTION(!uaccess_kernel(),
> 
> How does this work anywhere ?

No, that is the wrong check - we want to make sure the address
space override doesn't leak to userspace.  The problem is that
armnommu (and m68knommu, but that doesn't call the offending
function) pretends to not have a kernel address space, which doesn't
really work.  Here is the fix I sent out yesterday, which I should
have Cc'ed you on, sorry:

---
From 2bb889b2d99a2d978e90640ade8fe02359287092 Mon Sep 17 00:00:00 2001
From: Christoph Hellwig <hch@lst.de>
Date: Mon, 20 Jul 2020 17:46:50 +0200
Subject: arm: don't call addr_limit_user_check for nommu

On arm nommu kernel use the same constant for USER_DS and KERNEL_DS,
and seqment_eq always returns false.  With the current check in
addr_limit_user_check that works by accident, but when replacing
seqment_eq with uaccess_kerne it will fail.  Just remove the not
needed check entirely.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reported-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/arm/kernel/signal.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/kernel/signal.c b/arch/arm/kernel/signal.c
index ab2568996ddb0c..c9dc912b83f012 100644
--- a/arch/arm/kernel/signal.c
+++ b/arch/arm/kernel/signal.c
@@ -713,7 +713,9 @@ struct page *get_signal_page(void)
 /* Defer to generic check */
 asmlinkage void addr_limit_check_failed(void)
 {
+#ifdef CONFIG_MMU
 	addr_limit_user_check();
+#endif
 }
 
 #ifdef CONFIG_DEBUG_RSEQ
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
