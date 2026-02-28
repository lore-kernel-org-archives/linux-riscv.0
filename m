Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9CBFD0040
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Feb 2026 23:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MYiTltduuLJGrAN3cTMCZoe8IBieDpBAmAhldfMMJR4=; b=m8eCOBeZSr/tTJ
	SiwEWI6mI7MnLxUSD9N6eD1auqBIkGNSN5aHg83iMQel17JGc311clsUm0F2kvG1Oh2mnpuKkFIeK
	yFYAYBo1MCrHdyOJYCCEhmAMCqz5kxkifK1ckaBWxVDIK8upKoiP3m2GeeJ8TFvvPmqj/SKyFjyrY
	KdX+RaQLtl4mCX+MxO8i9XgNphwNNa6UtBzysniw5P/7KRKDElWmn5XYQGzrReeF1U3U9DDXHqvDC
	Ei+6PIYeRCfjCF01wi0uwulPlODzHlJ+AGMjaJZz6/GqR4Vn+zqhFUQh4pAV+YDy6/26RxoWpG7oc
	FUV9k+sfmeUOot41/ZCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwTJa-0000000AM48-2h2Y;
	Sat, 28 Feb 2026 23:01:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwTJX-0000000AM3k-3tmH
	for linux-riscv@lists.infradead.org;
	Sat, 28 Feb 2026 23:01:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A3E0A44252;
	Sat, 28 Feb 2026 23:01:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3AF2C116D0;
	Sat, 28 Feb 2026 23:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1772319694;
	bh=O9uOBnZ/lKOtmWpG8ozM2E0DAaC9mNV1xzrSoLZmrkY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Y9QqY/Umx9XtOjZ16O164ix2TSzEP3hGmrykgRAgox/0ibPBIvA9ydXrC9Yy2qv4z
	 fKFd8R6RWFSRWyHuDm3dSHPW9dpgJWbVvCl1frTIjiVjTxSPr+Bzy1R5C17i0zZJOw
	 iv1lhi9GBCZuxsNYUaFFulSdDc+61t9gjdWA+NuA=
Date: Sat, 28 Feb 2026 15:01:33 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>, Gladyshev Ilya
 <gladyshev.ilya1@h-partners.com>
Cc: Muchun Song <muchun.song@linux.dev>, David Hildenbrand
 <david@kernel.org>, Matthew Wilcox <willy@infradead.org>, Usama Arif
 <usamaarif642@gmail.com>, Frank van der Linden <fvdl@google.com>, Oscar
 Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>, Vlastimil
 Babka <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi
 Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>, Michal Hocko
 <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet
 <corbet@lwn.net>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
 <kernel@xen0n.name>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, kernel-team@meta.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCHv7 RESEND 00/17] mm: Eliminate fake head pages from
 vmemmap optimization
Message-Id: <20260228150133.67fd58ef1ae9e50ea3f32476@linux-foundation.org>
In-Reply-To: <20260227194302.274384-1-kas@kernel.org>
References: <20260227194302.274384-1-kas@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_150136_021883_1584B690 
X-CRM114-Status: UNSURE (   8.14  )
X-CRM114-Notice: Please train this message.
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

On Fri, 27 Feb 2026 19:42:38 +0000 "Kiryl Shutsemau (Meta)" <kas@kernel.org> wrote:

> This series removes "fake head pages" from the HugeTLB vmemmap
> optimization (HVO) by changing how tail pages encode their relationship
> to the head page.
> 
> It simplifies compound_head() and page_ref_add_unless(). Both are in the
> hot path.

This series is unaware of (and incompatible with) Gladyshev's "mm: make
ref_unless functions unless_zero only" cleanup
(https://lkml.kernel.org/r/20260206133328.426921-1-gladyshev.ilya1@h-partners.com).

Gladyshev, I'll drop that patch.  If you believe that similar changes
after Kiryl's series are desirable, please send them along, thanks.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
