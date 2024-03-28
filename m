Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24EDCD11DF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 19:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=48va13amGeWEoxHeEb0L3rYpvWGazs1QAf0ElqNvLPA=; b=ND3y5rsAyXIflU
	bSJMsgiTQhAGj8YaU9FefdHhyhPVB6FpALoRLJwLgGYm8MEc4oRqIuJkC/jJOsAuM4Z8KNZ7+mH1+
	Dn2Nbj2P84VnQYzC+pcWToTQ1qxhsY8Vys565mYrt7Z/NSJaGZxlwOPcWUhVY0Ofcu8o4UtobGP8q
	gPEaf+P2WMhwQPX85YIZtwShbno146i6UhxvwSaPi4Iscxm9QPKoiMyBlEi7w22LgmZXVV4sAGjcw
	+rOgXDI6SwVLK0WfDN6aLbDsbEtLALwxqt66AhuWH5+htaxwh3FKquwTs8zyV0ZHCdO5LbYgLwlbr
	6vjow3GgpNDEaCDGKQLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpv0W-0000000FIIA-1cRi;
	Thu, 28 Mar 2024 19:01:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpv0S-0000000FIGo-2qa0;
	Thu, 28 Mar 2024 19:01:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F050A61851;
	Thu, 28 Mar 2024 19:01:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2F78C433F1;
	Thu, 28 Mar 2024 19:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1711652503;
	bh=75zJQi6/t8Bugee7Y/WvYhL+nXJNnuKScwY0EXrSoes=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EuRHhQSuhT6UhLje68IlwmCQqCGilcULpK7LoI7ffKimNB38kuwasGAwdmey5M3bK
	 w76Dbmfxu5cMJPhJmPKXGTUSaluFio9ZuNxZZjD9m62mGWpZNm0O1s3PHo4jeQl/xU
	 PchmtkI3nAt7scT0o5FtyP+3XAlYHJwqdV8wlpBc=
Date: Thu, 28 Mar 2024 12:01:42 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: David Hildenbrand <david@redhat.com>
Cc: peterx@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Yang Shi <shy828301@gmail.com>, "Kirill A . Shutemov"
 <kirill@shutemov.name>, Mike Kravetz <mike.kravetz@oracle.com>, John
 Hubbard <jhubbard@nvidia.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Jones <andrew.jones@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Christoph Hellwig <hch@infradead.org>,
 Lorenzo Stoakes <lstoakes@gmail.com>, Matthew Wilcox <willy@infradead.org>,
 Rik van Riel <riel@surriel.com>, linux-arm-kernel@lists.infradead.org,
 Andrea Arcangeli <aarcange@redhat.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, James Houghton
 <jthoughton@google.com>, Jason Gunthorpe <jgg@nvidia.com>, Mike Rapoport
 <rppt@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>
Subject: Re: [PATCH v4 06/13] mm/gup: Drop folio_fast_pin_allowed() in
 hugepd processing
Message-Id: <20240328120142.32c6676dc7fbf1af82da5e58@linux-foundation.org>
In-Reply-To: <372a9331-6d95-4083-9a8f-a4f714868bea@redhat.com>
References: <20240327152332.950956-1-peterx@redhat.com>
	<20240327152332.950956-7-peterx@redhat.com>
	<372a9331-6d95-4083-9a8f-a4f714868bea@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_120144_796568_41D13681 
X-CRM114-Status: GOOD (  10.20  )
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

On Thu, 28 Mar 2024 11:10:59 +0100 David Hildenbrand <david@redhat.com> wrote:

> @Andrew, you properly adjusted the code to remove the 
> gup_fast_folio_allowed() call instead of the folio_fast_pin_allowed() 
> call, but
> 
> (1) the commit subject
> (2) comment for gup_huge_pd()
> 
> Still mention folio_fast_pin_allowed().
> 
> The patch "mm/gup: handle hugepd for follow_page()" then moves that 
> (outdated) comment.

OK, thanks, I fixed all that up.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
