Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7ABEE6B274
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Dec 2025 11:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kr9mHZPMgaDH33t+Wjim3WkXSikuEBcVm6fPUB777ks=; b=SllEP0Ws4cOFH6U0fdgS5ig6Gs
	fwyPnkWyaCDVeEqY408v173NFy5CqzP2W8b8jMlZVyheTo/MNPpej/kH3nS1hnH7ZNMIa3oByd2Tz
	fkcxy9iYhce1lqY3T3Zx7CStjfCduNc+ISffrwxt9inc4VL/IZYGZ23Hh3blUjWbiNvXyrR7RTDCc
	WR4AUQN2Z3WJoh3Kv7aPPZQoV57ugKQwQQ8ZTL1UqzM6N42dHExeozMKAf8/fDt7rOaQWWKlG2zwN
	xqPs4e18fYwr5RNXP80U/fzTob/K9C2txB75akmKDiFC87N0LZdhkshulkHTwm/KBwr/9UOnPIMh1
	+O2D4DMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY0nu-0000000Ey18-2xqJ;
	Tue, 23 Dec 2025 11:43:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY0ns-0000000Ey0w-3KL2
	for linux-riscv@lists.infradead.org;
	Tue, 23 Dec 2025 11:43:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ACDD8600CB;
	Tue, 23 Dec 2025 11:43:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37179C113D0;
	Tue, 23 Dec 2025 11:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766490227;
	bh=Y356nykrWSoOLSfh5YSTuQ7KEeAa3+p4YJplI7gtpt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bp7+0Uj5Z6VN2PwEXcmIQc2WbkxYG8kryhsefYIJmIYPnYY8o90w6UX2JAubtYhjj
	 fBSUj5KqEJpYw8kJ81qOZlCpQls5B1SHKmUG+cp9QRjlRtPS/GxilpnVO0oeJsFhh0
	 zpt35Rfs7wEpcjroz4hRRUAfPWdl4TmZ8biix0Eni2qLTjfyXRIbVKoacsc20ADOyt
	 KtOUj3Lc0LkCMZcWCBPQjQWIkBMyhkyl0Q2SI8TqIeWkTTBxIxFgeEXzoQqUMzJ0C7
	 lSF3JsFbuzMqS9nWP3rV8QXPHDJtLQFnf0UWcxlqVQ2wqbWDUNFSH78aHXUtTl1QZZ
	 KKfmU+sjJ/a9Q==
Date: Tue, 23 Dec 2025 06:43:45 -0500
From: Sasha Levin <sashal@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SeongJae Park <sj@kernel.org>,
	"David Hildenbrand (Red Hat)" <david@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Borislav Petkov <bp@alien8.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	x86@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] mm/hugetlb: ignore hugepage kernel args if hugepages
 are unsupported
Message-ID: <aUqAcf2405H0pRW1@laps>
References: <20251221104907.032abf56c67f3e50c9c94e31@linux-foundation.org>
 <20251223013045.4579-1-sj@kernel.org>
 <20251222183055.88c3cc1f0705c1dc29c7f011@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251222183055.88c3cc1f0705c1dc29c7f011@linux-foundation.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Dec 22, 2025 at 06:30:55PM -0800, Andrew Morton wrote:
>On Mon, 22 Dec 2025 17:30:44 -0800 SeongJae Park <sj@kernel.org> wrote:
>
>> On Sun, 21 Dec 2025 10:49:07 -0800 Andrew Morton <akpm@linux-foundation.org> wrote:
>>
>> > On Sun, 21 Dec 2025 10:22:44 +0100 "David Hildenbrand (Red Hat)" <david@kernel.org> wrote:
>> >
>> > > >
>> > > > My main concern was -
>> > > > A fixes tag means it might get auto backported to stable kernels too,
>> > >
>> > > Not in the MM world -- IIRC. I think there is the agreement, that we
>> > > decide what should go into stable and what not.
>> > >
>> > > Andrew can correct me if my memory is wrong.
>> >
>> > Yes, -stable maintainers have been asked to only backport patches where
>> > the MM developers asked for that, with cc:stable.  There may be
>> > slipups, but as far as I know this is working.
>> >
>> > I don't actually know how they determine which patches need this
>> > special treatment.  Pathname?  Signed-off-by:akpm?
>>
>> I guess it is pathname, based on ignore_list file [1] of stable-queue repo.
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/tree/ignore_list#n16
>>
>
>Oh, that's a bit sad.
>
>- other trees sometimes mess with mm/ and they probably aren't aware
>  that they need an explicit cc:stable.
>
>- misses drivers/block/zram and probably various other things that
>  the MM team maintains.
>
>Oh well, I guess simple mm/* coverage is good enough.  But I do worry a
>little that useful fixes coming into mm/ via other trees without
>cc:stable will get missed.

How should we improve the filter? mm/ AND signed off by akpm?

-- 
Thanks,
Sasha

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
