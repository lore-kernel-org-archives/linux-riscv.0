Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7495E6FE24
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Dec 2025 17:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZMMNOzghl52xwc03cR/NITSzIDgh+N0tEUB71dP1Y0=; b=MqmANR2Krr1EZEdY1A92qCXQI4
	1jACqvgKncdWhWuYKb3Y9j5gKLS2Rdh6Jlo/xADlBJBqmna/BT6wRLhVVMOqj6q9l2v3OUCHUkcKN
	7C7lzUOKyAp4ppVqQV8ozDEJLA3q8h8/QCQ44L93OtUnFJUA/ewoZLnPamxdB3kzPiYGe0Dt7O7aP
	tHfaWVSTAnTBIXKYpQCljEBuNK0MwiblyH5/Yk3uelmJ5HL8IJLmPN1M8KeqRECHWJRfb2zhgb8wb
	+SEP+MLU3NODMlI9Xz5jraVyYX9W//b9jF3opjA2qzcfPGCiP5gPI7lwfEVOS3AFlEBU9UtGoGWyY
	INdiR+VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5vR-0000000FoQ5-0VTx;
	Tue, 23 Dec 2025 17:11:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5vN-0000000FoPc-2fTV
	for linux-riscv@lists.infradead.org;
	Tue, 23 Dec 2025 17:11:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B5E6C41E5B;
	Tue, 23 Dec 2025 17:11:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59005C113D0;
	Tue, 23 Dec 2025 17:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766509912;
	bh=3um8NkjnKfQWblw0ttBXC1gQUUqnZlPZFVjmKn1p7PE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fa+0UbgfGH0MW7oBnwI79BEfDFeL2kz26p3mGx0sCirQiG+ODvVSzIvze2Y4eZ39e
	 WIzrCovlU7u1ZaXeiidmAy+OfcAiEQyWBxBq8TEgBFblUeLzUl71pnP8IwQYxRxZtl
	 JU7DoafiH8mxnn2LoNc4c4dJAdE2oBfmG5UhDjQJJJ432y4bbFEKAVbwNtMFpz/VKJ
	 6AlMqdnjsTFz7IjJg58q5KShlRT8jwNW+ZHfTHRSECk5n7n3KNXCVAxif2wK9xXXXT
	 E+/IjLB2oCGTQ1JX1lHXV5bbVjgxm5fyavrfeDQFfoQJYkrnbzjVcvXusb6YT55ENG
	 LaGk5PAMnNqlg==
Date: Tue, 23 Dec 2025 12:11:51 -0500
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
Message-ID: <aUrNVyuSaQrQLGZP@laps>
References: <20251221104907.032abf56c67f3e50c9c94e31@linux-foundation.org>
 <20251223013045.4579-1-sj@kernel.org>
 <20251222183055.88c3cc1f0705c1dc29c7f011@linux-foundation.org>
 <aUqAcf2405H0pRW1@laps>
 <20251223085434.a6d6ae08c3aedf420908f404@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251223085434.a6d6ae08c3aedf420908f404@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_091153_713224_E07D60BE 
X-CRM114-Status: GOOD (  17.99  )
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

On Tue, Dec 23, 2025 at 08:54:34AM -0800, Andrew Morton wrote:
>On Tue, 23 Dec 2025 06:43:45 -0500 Sasha Levin <sashal@kernel.org> wrote:
>
>> >> > Yes, -stable maintainers have been asked to only backport patches where
>> >> > the MM developers asked for that, with cc:stable.  There may be
>> >> > slipups, but as far as I know this is working.
>> >> >
>> >> > I don't actually know how they determine which patches need this
>> >> > special treatment.  Pathname?  Signed-off-by:akpm?
>> >>
>> >> I guess it is pathname, based on ignore_list file [1] of stable-queue repo.
>> >>
>> >> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/tree/ignore_list#n16
>> >>
>> >
>> >Oh, that's a bit sad.
>> >
>> >- other trees sometimes mess with mm/ and they probably aren't aware
>> >  that they need an explicit cc:stable.
>> >
>> >- misses drivers/block/zram and probably various other things that
>> >  the MM team maintains.
>> >
>> >Oh well, I guess simple mm/* coverage is good enough.  But I do worry a
>> >little that useful fixes coming into mm/ via other trees without
>> >cc:stable will get missed.
>>
>> How should we improve the filter? mm/ AND signed off by akpm?
>
>I think just signed-off-by:akpm please.  That way, mm fixes which come
>in via other trees without cc:stable get backported.

Ack

>Obviously we'd prefer that such patches get appropriate consideration
>by the MM developers but sometimes other-tree people aren't that
>cooperative.  In this case it's better to backport the thing rather
>than missing a fix?

I tend to err on the side of taking one extra thing rather than missing
something :)

Would you be interested in trying out AUTOSEL for mm/ again? In the current
workflow I give about 2-3 weeks for review, and all it takes to have a patch
dropped is to just reply with a "no".

I can generate a series with mm/ patches from v6.18..v6.19-rc2 that don't have
a Fixes/stable tag but the LLM thinks that it should be backported as a way for
you and other mm/ folk to gauge the current state of AUTOSEL, if that helps?

-- 
Thanks,
Sasha

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
