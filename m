Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679FCE6B26E
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Dec 2025 02:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vQJbfFEGW4q/6TG2wnZv5nJFOgX9dCtoASLpwGx3KNc=; b=eBOMZ5DQq943oA
	PW6E4wpkS/J2yzyQjxtSeR1fLUnFCtZzAlCWJGTWXcB/iqW80m3KWddBXFzyMqDJPX/uLEFNAHMUU
	YG+njOieDLsYtZ3asjFk3SYn8SjX3znU8wqW/FlbDg2QHjYXtesSb7cjTNLMRhJXdUifNqkd+bkRW
	n4NwdWKvw0jTz0rD4LtlLvpcgMpMouFuoj1jFZcJhWVi9lbX/iUFg6gwGsv2Mj3D9fTLfOoDB6YPf
	MSG7UFeCggatze5Ff/DTvUKKNaIdRj7ZMf3dDz3tu9SKpt8567qw7QFQoV+uTiMjIZS8tsgXj8d9T
	l6Qn611qaIWxjbrfLApA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXsAu-0000000ER2A-2MNc;
	Tue, 23 Dec 2025 02:31:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXsAs-0000000ER1j-0dSc
	for linux-riscv@lists.infradead.org;
	Tue, 23 Dec 2025 02:30:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 72C3940711;
	Tue, 23 Dec 2025 02:30:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B23ABC4CEF1;
	Tue, 23 Dec 2025 02:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1766457056;
	bh=EGu5F46cvREoMWotC8TtqKlUedKHHiCD44Ca991/ZQg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=1QL8f41Rcexjp5HR46WOg9kxNLNocZNvvEbYU/Auokx8zqa8xA3O5RiDLBnxGF9E4
	 y/C4Lqpm2r02rxa6co5a+BWXUIOB+8WAgimhq2VUTMXekY8F7nwfHvPj/swOESZT8s
	 NHNWrvdZfY2vDa1FW8ZegBx08PWoBohUIHQY3dNI=
Date: Mon, 22 Dec 2025 18:30:55 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: SeongJae Park <sj@kernel.org>
Cc: "David Hildenbrand (Red Hat)" <david@kernel.org>, "Ritesh Harjani (IBM)"
 <ritesh.list@gmail.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Borislav
 Petkov <bp@alien8.de>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador
 <osalvador@suse.de>, Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik
 <gor@linux.ibm.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Sasha Levin
 <sashal@kernel.org>
Subject: Re: [PATCH v6] mm/hugetlb: ignore hugepage kernel args if hugepages
 are unsupported
Message-Id: <20251222183055.88c3cc1f0705c1dc29c7f011@linux-foundation.org>
In-Reply-To: <20251223013045.4579-1-sj@kernel.org>
References: <20251221104907.032abf56c67f3e50c9c94e31@linux-foundation.org>
	<20251223013045.4579-1-sj@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_183058_583545_0BC8F588 
X-CRM114-Status: GOOD (  18.51  )
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

On Mon, 22 Dec 2025 17:30:44 -0800 SeongJae Park <sj@kernel.org> wrote:

> On Sun, 21 Dec 2025 10:49:07 -0800 Andrew Morton <akpm@linux-foundation.org> wrote:
> 
> > On Sun, 21 Dec 2025 10:22:44 +0100 "David Hildenbrand (Red Hat)" <david@kernel.org> wrote:
> > 
> > > > 
> > > > My main concern was -
> > > > A fixes tag means it might get auto backported to stable kernels too,
> > > 
> > > Not in the MM world -- IIRC. I think there is the agreement, that we 
> > > decide what should go into stable and what not.
> > > 
> > > Andrew can correct me if my memory is wrong.
> > 
> > Yes, -stable maintainers have been asked to only backport patches where
> > the MM developers asked for that, with cc:stable.  There may be
> > slipups, but as far as I know this is working.
> > 
> > I don't actually know how they determine which patches need this
> > special treatment.  Pathname?  Signed-off-by:akpm?
> 
> I guess it is pathname, based on ignore_list file [1] of stable-queue repo.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/tree/ignore_list#n16
> 

Oh, that's a bit sad.

- other trees sometimes mess with mm/ and they probably aren't aware
  that they need an explicit cc:stable.

- misses drivers/block/zram and probably various other things that
  the MM team maintains.

Oh well, I guess simple mm/* coverage is good enough.  But I do worry a
little that useful fixes coming into mm/ via other trees without
cc:stable will get missed.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
