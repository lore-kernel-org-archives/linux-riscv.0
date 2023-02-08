Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD5CC05027
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Feb 2023 13:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SQPkAD5nVUK+fDz6Us93pDLVULl5Stj3c60H/rr9/Y4=; b=In3op+YVPc4l0Z
	Mgw/0jJF0TeCBKpvK8whe6ysCcZyZ8j9LrNZgMpKRg/loBLzW5G+mVXi5Sb9bhpf59Hqh+2sIsjvT
	7DUnge9ADS1pruPWJykAyjKrN01iuFQVEnbfIX0oSla5Zl5ukKB9M454/YZUb7HZjgrVSWq9Fl6er
	C744VaDcf5ioD1L04+eCJF0BG3gWm9hn80LxaXXCeel2ufvR46Csv7We1LvUNrs8b8VwCxHYnNc08
	POHEZiA9NIn+3oln/9Zm+P5asWIN3wZkzG9KeqJvwtSQFxLhFVtMvaxOGXAHhU59P0CKuyWK6Q5wi
	xQwfuz0aRkIEkn8St4Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPkbg-00FlcD-6K; Wed, 08 Feb 2023 13:35:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPkbV-00FlYa-MW; Wed, 08 Feb 2023 13:35:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PMp0gXsVfVTqwcUhaqwEjQxmo111+Dr+n4G2THRRgz4=; b=nv1U4Cs2toJAUKTbNLnEh3GkOY
	7TafoARROVHQSw9xJfz56g9qot5qCf4w6m4SWQjlNps1Oe5T2sHs3KDsj7DDyHZsEule4Fc1EDsFi
	1ot7N3tXnfTdb0UAUOhw7OBfMJkQv96CLrRBbzSzT9W9CzOllOmN6OP7nihODAjH1GrmhpTSrxXbw
	+FQ3rTbD5HBPPVYU6nfEd7rZEnlmQKhiACj6Chvr3AVC+hWz7Ee5CIY899SSczPizMsfNgyHKXZEr
	J+yG9hswiuu8WG3XCLcbAsJkbqGmrnhF93OGExxTKKUafWDJ+5Nvu8CB5rz+/ij9RclHTGYLDqeqN
	r07kkj+g==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPkbR-001F0R-Gf; Wed, 08 Feb 2023 13:35:13 +0000
Date: Wed, 8 Feb 2023 13:35:13 +0000
From: Matthew Wilcox <willy@infradead.org>
To: "Yin, Fengwei" <fengwei.yin@intel.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, linux-arch@vger.kernel.org,
	linux-mm@kvack.org, linux-alpha@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
	linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	openrisc@lists.librecores.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org
Subject: Re: API for setting multiple PTEs at once
Message-ID: <Y+OlEUqJotSN3tLV@casper.infradead.org>
References: <Y9wnr8SGfGGbi/bk@casper.infradead.org>
 <Y+K0O35jNNzxiXE6@casper.infradead.org>
 <ba99ed28-61e4-4acd-ce17-338f5a49ef26@ghiti.fr>
 <b44d5dc7-ee7a-80e0-5401-829bf5740de5@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b44d5dc7-ee7a-80e0-5401-829bf5740de5@intel.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 08, 2023 at 08:09:00PM +0800, Yin, Fengwei wrote:
> =

> =

> On 2/8/2023 7:23 PM, Alexandre Ghiti wrote:
> > Hi Matthew,
> > =

> > On 2/7/23 21:27, Matthew Wilcox wrote:
> >> On Thu, Feb 02, 2023 at 09:14:23PM +0000, Matthew Wilcox wrote:
> >>> For those of you not subscribed, linux-mm is currently discussing
> >>> how best to handle page faults on large folios.=A0 I simply made it w=
ork
> >>> when adding large folio support.=A0 Now Yin Fengwei is working on
> >>> making it fast.
> >> OK, here's an actual implementation:
> >>
> >> https://lore.kernel.org/linux-mm/20230207194937.122543-3-willy@infrade=
ad.org/
> >>
> >> It survives a run of xfstests.=A0 If your architecture doesn't store i=
ts
> >> PFNs at PAGE_SHIFT, you're going to want to implement your own set_pte=
s(),
> > =

> > =

> > riscv stores its pfn at PAGE_PFN_SHIFT instead of PAGE_SHIFT, se we nee=
d to reimplement set_ptes. But I have been playing with your patchset and w=
e never fall into the case where set_ptes is called with nr > 1, any idea w=
hy? I booted a large ubuntu defconfig and launched will_it_scale.page_fault=
4.
> Need to use xfs filesystem to get large folio for file mapping.
> Other filesystem may be also OK. But I just tried xfs. Thanks.

XFS is certainly the flagship filesystem to support large folios, but
others have added support, AFS and EROFS.  You can also get large folios
in tmpfs (which is slightly different as it focuses on THPs rather than
generic large folios).

You also have to have CONFIG_TRANSPARENT_HUGEPAGE selected, which riscv
can do.  That restriction will be lifted at some point, but for now
large folios depends on the THP infrastructure.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
