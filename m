Return-Path: <SRS0=tQi0=BA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5EF6C433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 05:20:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D1F62072E
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 05:20:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IMGpmzjy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D1F62072E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EJ0os+8yrTvKND1xdghSZkf0CB1rTUSzc6ReiOB7V7k=; b=IMGpmzjyA3CCwHorZCmPWiK81
	1kT5BWVkDhrRRk9uHlaQBA4Wh1rMdEh38WUmvQzsJO/7G1tjfUWWglbufD7uKlllX3P6dW/Pj8xRJ
	qP4VSbWrE7gEkmSt7RLiBiu0oZ3Pm4tat3QTfq+vlh+uryknh9IyRrFAQiodNMLJyqKzRru7c1suy
	fo27pGc2Sw9H1+5igxtm6YaVgPY8uGoV/vmacR4tc6jr4n3rfYUN9ou4V4Ur3xo4TS40+5gMGyw5t
	vkwTco1bmlLR30yZoKYimBzNW5dBd8WvfvKgXHG29FFYFhu31r9BGRBHOu9Ltb+xxojkXIJtcLzWf
	ENvhqGwyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxkhY-0002mO-5f; Tue, 21 Jul 2020 05:20:28 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxkhV-0002lv-BK
 for linux-riscv@lists.infradead.org; Tue, 21 Jul 2020 05:20:26 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 849376736F; Tue, 21 Jul 2020 07:20:22 +0200 (CEST)
Date: Tue, 21 Jul 2020 07:20:22 +0200
From: Christoph Hellwig <hch@lst.de>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/6] syscalls: use uaccess_kernel in addr_limit_user_check
Message-ID: <20200721052022.GA10011@lst.de>
References: <20200714105505.935079-1-hch@lst.de>
 <20200714105505.935079-2-hch@lst.de> <20200718013849.GA157764@roeck-us.net>
 <20200718094846.GA8593@lst.de> <20200720221046.GA86726@roeck-us.net>
 <20200721045834.GA9613@lst.de>
 <eb470677-b569-a6f0-e63b-60149b54863a@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eb470677-b569-a6f0-e63b-60149b54863a@roeck-us.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_012025_535929_FAC0EF80 
X-CRM114-Status: GOOD (  21.79  )
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

On Mon, Jul 20, 2020 at 10:15:37PM -0700, Guenter Roeck wrote:
> >> -       if (CHECK_DATA_CORRUPTION(uaccess_kernel(),
> >> +       if (CHECK_DATA_CORRUPTION(!uaccess_kernel(),
> >>
> >> How does this work anywhere ?
> > 
> > No, that is the wrong check - we want to make sure the address
> > space override doesn't leak to userspace.  The problem is that
> > armnommu (and m68knommu, but that doesn't call the offending
> > function) pretends to not have a kernel address space, which doesn't
> > really work.  Here is the fix I sent out yesterday, which I should
> > have Cc'ed you on, sorry:
> > 
> 
> The patch below makes sense, and it does work, but I still suspect
> that something with your original patch is wrong, or at least suspicious.
> Reason: My change above (Adding the "!") works for _all_ of my arm boot
> tests. Or, in other words, it doesn't make a difference if true
> or false is passed as first parameter of CHECK_DATA_CORRUPTION(), except
> for nommu systems. Also, unless I am really missing something, your
> original patch _does_ reverse the logic.

Well.  segment_eq is in current mainline used in two places:

 1) to implement uaccess_kernel
 2) in addr_limit_user_check to implement uaccess_kernel-like
    semantics using a strange reverse notation

I think the explanation for your observation is how addr_limit_user_check
is called on arm.  The addr_limit_check_failed wrapper for it is called
from assembly code, but only after already checking the addr_limit,
basically duplicating the segment_eq check.  So for mmu builds it won't
get called unless we leak the kernel address space override, which
is a pretty fatal error and won't show up in your boot tests.  The
only good way to test it is by explicit injecting it using the
lkdtm module.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
