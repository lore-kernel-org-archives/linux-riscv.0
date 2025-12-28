Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5002EE784BE
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Dec 2025 22:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b/qVutIELS7L+SwNuNnuAxOK3CUuv+imyL3JQU8honU=; b=em+/IlO4UP37lq
	ejyGewDubjmkHeEozsHkFvrMg5u9EEwHWYVRW0Q3BjtP7uQG4R2KTVw4T0uaasxqwvAu6f7kEXHdY
	rzRYURb9K/6v7HepbfQ7RkmZolsamS8ChoDeEha4wKFnvlORDByXsKl/XCr6QpX9haoKtJLcCqZCo
	cx3icF4wTg488YYC4UcIScq3HKMUObF61ggRNXLRlrp+sAaYTEmJgV8t4/3LjH7N3E2bPJkGBGw59
	iKKhcGf6SwRmPeOW4ZerAE6DFC0cswt/P7+0/lSZeJoPF///5G1M2zuaxreRaO/tbAp1PP7LAZcnU
	8rUNKP3ROHIz8cIZcmzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZzMQ-000000034DG-3H9b;
	Sun, 28 Dec 2025 22:35:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZzMO-000000034Cn-3RtO
	for linux-riscv@lists.infradead.org;
	Sun, 28 Dec 2025 22:35:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1CA2643B59;
	Sun, 28 Dec 2025 22:35:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A93BC4CEFB;
	Sun, 28 Dec 2025 22:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1766961335;
	bh=CCaq+l+K6wsYD/FHpHvOEK+EvLHkFgdijLHqm1YV+20=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nOPuJZfl2av023bRQoktGLNCM+COk5pIMCL3h5ynU6rPF27c4c3qUu5AOfYvG7vuD
	 XUd0EqFI/LwVzvFi4U2RqsdgzyWfl4udZmt5/fIM8f5wWAzzZTy33cyo/WkHWrmA3m
	 dygVpmyLfSYEdyA81KLsG4iO0eh6iw9YBanxpO3E=
Date: Sun, 28 Dec 2025 14:35:33 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Heiko Carstens <hca@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>, Thomas Gleixner <tglx@linutronix.de>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, "David Hildenbrand (Red Hat)"
 <david@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: Re: [PATCH v7] mm/hugetlb: ignore hugepage kernel args if hugepages
 are unsupported
Message-Id: <20251228143533.33e2be2d6282d036f55e12cb@linux-foundation.org>
In-Reply-To: <20251224115524.1272010-1-sourabhjain@linux.ibm.com>
References: <20251224115524.1272010-1-sourabhjain@linux.ibm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_143537_264960_81F3DD87 
X-CRM114-Status: GOOD (  12.15  )
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

On Wed, 24 Dec 2025 17:25:24 +0530 Sourabh Jain <sourabhjain@linux.ibm.com> wrote:

> Note for backporting: This fix is a partial retrieval of the commit
> mentioned in the Fixes tag. It is only valid once the change referenced
> by the Depends-on tag is present. When backporting this patch, the
> commit mentioned in the Depends-on tag must be included first.
> 
> Link: https://lore.kernel.org/all/20250121150419.1342794-1-sourabhjain@linux.ibm.com/ [1]
> Link: https://lore.kernel.org/all/20250128043358.163372-1-sourabhjain@linux.ibm.com/ [2]
> Fixes: c2833a5bf75b ("hugetlbfs: fix changes to command line processing")
> Depends-on: 2354ad252b66 ("powerpc/mm: Update default hugetlb size early")

This will be the first "Depends-on:" in history.  Which is a hint that
we're doing something wrong.  This innovation will surely fool any
downstream automation.  Let's use existing tools if possible.

What if we just said "Fixes: 2354ad252b66"?  That would tell people
that 2354ad252b66 is required for use of this patch.

Is there any kernel which has 2354ad252b66 but which doesn't have
c2833a5bf75b?  Probably there is, as neither had cc:stable.

2354ad252b66 is from 2020 and c2833a5bf75b is from 2022.  I'm thinking
the reliable thing to do here is to simply use Fixes:c2833a5bf75b. 
This will tell the world "please add this patch to any kernel which
contains c2833a5bf75b", which I suspect will be good enough?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
