Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FCAE6FE24
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Dec 2025 16:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7IWCnPPtgjEDyFTcccAjFZZ/MqBVTzmg7ZdHM+GtXH4=; b=OQrfzvWltmr49A
	p3fyv15BG5A4On+mIwQUXfurBSLmwtgkqg2Z7rqLjhsUQ+hT7TLHyjCQWufU3N+XTF5Z0WkeSaxBm
	/CfeCwe5xqko/IkjR13IsaFy4Hf6mZUmknFmTy3AupwG2oNo6eAHBe1lCWmM8plHQw5lgX2h5iIvp
	ne5+ZOtjg19r07PVw/ZZ4XmNJgtHaZt18vnfjOSk1593jQzJcgLuOmrAEAR4nsdH8xzUeqQfFPxxv
	7bNf2lVdj9nYB9CsyGZJOxvkiYnr61soVI0Qoy4epE+/yvrQq0Au83hsK59ZjBBHj/HqmGJn1iL8x
	mU55YsHYm93FM2Btzzvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5ek-0000000FmU8-0kxA;
	Tue, 23 Dec 2025 16:54:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5eg-0000000FmTb-2NMX
	for linux-riscv@lists.infradead.org;
	Tue, 23 Dec 2025 16:54:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D345840A3D;
	Tue, 23 Dec 2025 16:54:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1558EC113D0;
	Tue, 23 Dec 2025 16:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1766508875;
	bh=YSvTCQaekcYuL9cT3nyDik7utEEmbDcrz5nvozNxXXU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=y2uhOtTyCjTw1tPpgTeL42HMR7NDR8YOrZMmVeoReXhmp5EKVThfwCgm9ZMq2H10F
	 oIzbBqYLLx4dJjMprtUcezIIPaEprCv7+Ivvq8DySDY/SkRr8lJUxxnEjv0nTy3DK7
	 vdoFrPcKrSwzR1BtpDgv8TYXz/1pAkkyi1dpscy0=
Date: Tue, 23 Dec 2025 08:54:34 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Sasha Levin <sashal@kernel.org>
Cc: SeongJae Park <sj@kernel.org>, "David Hildenbrand (Red Hat)"
 <david@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Sourabh
 Jain <sourabhjain@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Heiko Carstens
 <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Muchun Song
 <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, Thomas
 Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] mm/hugetlb: ignore hugepage kernel args if hugepages
 are unsupported
Message-Id: <20251223085434.a6d6ae08c3aedf420908f404@linux-foundation.org>
In-Reply-To: <aUqAcf2405H0pRW1@laps>
References: <20251221104907.032abf56c67f3e50c9c94e31@linux-foundation.org>
	<20251223013045.4579-1-sj@kernel.org>
	<20251222183055.88c3cc1f0705c1dc29c7f011@linux-foundation.org>
	<aUqAcf2405H0pRW1@laps>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_085438_698695_D0A86A94 
X-CRM114-Status: GOOD (  18.61  )
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

On Tue, 23 Dec 2025 06:43:45 -0500 Sasha Levin <sashal@kernel.org> wrote:

> >> > Yes, -stable maintainers have been asked to only backport patches where
> >> > the MM developers asked for that, with cc:stable.  There may be
> >> > slipups, but as far as I know this is working.
> >> >
> >> > I don't actually know how they determine which patches need this
> >> > special treatment.  Pathname?  Signed-off-by:akpm?
> >>
> >> I guess it is pathname, based on ignore_list file [1] of stable-queue repo.
> >>
> >> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/tree/ignore_list#n16
> >>
> >
> >Oh, that's a bit sad.
> >
> >- other trees sometimes mess with mm/ and they probably aren't aware
> >  that they need an explicit cc:stable.
> >
> >- misses drivers/block/zram and probably various other things that
> >  the MM team maintains.
> >
> >Oh well, I guess simple mm/* coverage is good enough.  But I do worry a
> >little that useful fixes coming into mm/ via other trees without
> >cc:stable will get missed.
> 
> How should we improve the filter? mm/ AND signed off by akpm?

I think just signed-off-by:akpm please.  That way, mm fixes which come
in via other trees without cc:stable get backported.

Obviously we'd prefer that such patches get appropriate consideration
by the MM developers but sometimes other-tree people aren't that
cooperative.  In this case it's better to backport the thing rather
than missing a fix?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
