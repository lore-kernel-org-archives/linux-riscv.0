Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A7CC55184
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 11:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=79nCa3JjDi+Y8t4F6QkfMMWQh6Xrphj0j8hkOPi+7TM=; b=1g0ngEnsFC1q30
	Ho+YVJEXVbWFulrrk+3t0EaPotPTJTma6bf6f/03R9YBG11T/jEbtjkgOnkFgpehBZhQIWcPuYe0Q
	0zZWsaMUliX3g6jbqRKKgYQiflgdxyFSh/gKsqceguw829qZY1OUm81/KwR0QBI0lN7YQeE/UKy2K
	ZcRoxSXFGmXeiL1ZuKUAftEOJ54YIdt0/Ze7AEgZADfORwoGPvwfAQNmT7vyTQmyFcjJecBKumdH6
	fGNHaxvZL0zchEfH/Vj90oVceyGXmVrDsvt5r4l/ZdG3yHmKEAw2W8ygw5R/IywAZQLat9HoR7L0V
	NnGqVNmTgfexVeqXaGSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqqVb-0000000Gulw-04wg;
	Mon, 03 Aug 2026 11:07:03 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqqVY-0000000GulO-1jAP
	for linux-riscv@lists.infradead.org;
	Mon, 03 Aug 2026 11:07:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=81qwzNTYWMH57csnsJHDHsY+d3QIwovJXwJEW52W2EY=; b=vOthG177CP1M/oT1M6SJZjIpzy
	g0Y6kG7i9eIzJVHzoV+I/pdo9uGUQiMTu3YTCAFDea1lbOUkBQrzfcKWEfQdex5mH0BuKqlcwG9X3
	2KhPAvcAkFcZWpu5iQXaOa5dC2J+VbwxWtKUHYtNJN2OjUSdsH+x7RmsYwbveHj/TGJXXBaAzJX7i
	mDIoIJsde1UJmtLbG/OU7Uuez512H3sE44q8JC72i75AzEe0iNLui9lkP73ahxJIi9Cp3GDiuih8a
	pEgVO8L6hzGDR9qYafwlxXPL7iuVermx7D4nCTJVqujOvJgwO5OWmsl0Mg0/oU5So1WXMqfpcHu6c
	+8IKoh6Q==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wqqV7-00CJcO-15;
	Mon, 03 Aug 2026 11:06:33 +0000
Date: Mon, 3 Aug 2026 04:06:28 -0700
From: Breno Leitao <leitao@debian.org>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, david@kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	kernel-team@meta.com
Subject: Re: [PATCH] tools/mm: add hwpoison-panic tool
Message-ID: <anB0-xHoQpQzp_dK@gmail.com>
References: <20260731-memory_failure_rewrite_test-v1-1-6aa8c6435693@debian.org>
 <20260801005822.85110-1-sj@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260801005822.85110-1-sj@kernel.org>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_040700_459412_2C8CAA5C 
X-CRM114-Status: GOOD (  23.91  )
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

On Fri, Jul 31, 2026 at 05:58:22PM -0700, SJ Park wrote:
> > This lives in tools/mm rather than selftests/mm because every successful
> > run crashes the machine, which is not something to run from CI.
> 
> If the purpose of the new program is testing, would it make more sense to put
> it under tools/testing/ ?

Sorry, this was discussed here:

https://lore.kernel.org/all/f83d5b26-b369-489b-a305-1eb5ec6fccfb@kernel.org/

> Also, does this test really need to be end-to-end test that cause panic?  How
> about doing unit test of core functions, using tools like kunit?  Or,
> live-patching panic() to only print messages and return before running the
> test?

What I want covered is the wiring, not the individual functions:
get_any_page() classifying a kernel-owned page as -ENOTRECOVERABLE,
action_result() reaching panic_on_unrecoverable_mf(), and the box
actually going down. 

Under kunit I would have to fabricate the page and stub panic(), so the
parts that break would be the parts replaced by the harness.

Unit tests for the classification helpers would be worth having on their
own. They would not replace this one.
> >  BUILD_TARGETS=page-types slabinfo page_owner_sort page_owner_filter thp_swap_allocator_test
> > +BUILD_TARGETS+=memory-failure/hwpoison-panic
> 
> I was initially thought why not underscore but dash on the name?  But, I
> realize it is obviously too persoanl taste.

Dash matches page-types.c in the same directory, I am happy using
userscore if that is the rigth approach.
> >
> > diff --git a/tools/mm/memory-failure/hwpoison-panic.c b/tools/mm/memory-failure/hwpoison-panic.c
> > new file mode 100644
> > index 0000000000000..b8076d86da15b
> > --- /dev/null
> > +++ b/tools/mm/memory-failure/hwpoison-panic.c
> > @@ -0,0 +1,353 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * hwpoison-panic: verify vm.panic_on_unrecoverable_memory_failure by
> > + * injecting a hwpoison error on a kernel-owned page and confirming the
> > + * kernel panics.
> 
> While reading the above explanation, I was expecting this program will directly
> say me if the kernel panic-ed or not.  But this only says if it was not
> panic-ed iiuc?  How about saying, like, "Trigger intentional kernel panic by
> ..." ?

You read it correctly, the program can only ever report the absence of
a panic. I will reword the header along your suggestion for v2.

> > +	kind = parse_args(argc, argv, &force);
> > +	page_size = getpagesize();
> > +	check_prereqs(force);
> 
> Maybe check_prereqs() can be called before getpagesize()?

Yes, nothing in check_prereqs() needs page_size. Moving it up in v2.

Thanks for the review,
--breno


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
