Return-Path: <SRS0=YGcN=JQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B516AC433B4
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 12:23:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7054561284
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 12:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7054561284
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eCAGcOjmoHZz/1zObrtRltoNzXVkasM3vamwx5zJNQU=; b=o+mIXdckCRTCYGc2UsB0vOIGp
	KLGQH3qhE7b96DRJV6Y01gA0YBuIag3CrK7IyB8833lcwPzLAz4j7C7BfjVK89Hv9CkwSirSipvy5
	OPkGAQxsz9ARwBXEjy1QLRgWEzgevMKJWjQBxNMuTdS4euZqw/hRtxlRyhOSr3FThLQhpqu0LeOpq
	99u4uSQOhKfKabRG5betv42nSNX1roxsxTh0580CrS4Sj5Tmknzx/u7PPe4LUlf+cj+gPeQjk3vYc
	JC6roJk/gb9t8hPIyDjiVLeCkSyzvFaaMKPV0/oE0Z04YCzTfCCDrjFa6qsi5WjqiFBVE+jJQMYxA
	SmkLBOtYA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYSvP-009qgm-9K; Mon, 19 Apr 2021 12:22:47 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYSvB-009qfQ-BT; Mon, 19 Apr 2021 12:22:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=CpUXgyXNu2L6aDoABWkfEW3c8xEi9KV0vjBOP+ZePLk=; b=iQPnFaPBrCivR61heeMKYPHCvt
 pCkxUp9NhouUvSBFQbKd7Fhrz1AZsx3Q2HZw+IDT8EHnokduaSFYutUpfRsDIS9zau7bYybxvA1ff
 pFuhFl2IUQxSd7XRlYtlj+FFgppBw6LQsud2DK1DXCxjC27lUaR1zxXyZRCerN1ljbP11kgtjJLqD
 N3p32/8yEAIzdAsbm2eTCBPbMAghI+Qr4ApaAjdCTvfikAf7G0xc6BI0IOM72rhvFT7X+pD+yabkm
 HNtjrKvSh/m2oRc0ljDrhGv2UnUnfK5uxuGIjbM8MIST4BHLYve7TzvctYq/QernMV8JatSft25WL
 KBRcr6Lg==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lYSua-00Diet-6d; Mon, 19 Apr 2021 12:22:16 +0000
Date: Mon, 19 Apr 2021 13:21:56 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christopher Lameter <cl@linux.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Matthew Garrett <mjg59@srcf.ucam.org>,
 Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@linux.ibm.com>,
 Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Roman Gushchin <guro@fb.com>, Shakeel Butt <shakeelb@google.com>,
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Tycho Andersen <tycho@tycho.ws>, Will Deacon <will@kernel.org>,
 Yury Norov <yury.norov@gmail.com>, linux-api@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-riscv@lists.infradead.org,
 x86@kernel.org, kernel test robot <oliver.sang@intel.com>
Subject: Re: [PATCH] secretmem: optimize page_is_secretmem()
Message-ID: <20210419122156.GZ2531743@casper.infradead.org>
References: <20210419084218.7466-1-rppt@kernel.org>
 <20210419112302.GX2531743@casper.infradead.org>
 <YH1v4XVzfXC1dYND@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YH1v4XVzfXC1dYND@kernel.org>
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

On Mon, Apr 19, 2021 at 02:56:17PM +0300, Mike Rapoport wrote:
> On Mon, Apr 19, 2021 at 12:23:02PM +0100, Matthew Wilcox wrote:
> > So you're calling page_is_secretmem() on a struct page without having
> > a refcount on it.  That is definitely not allowed.  secretmem seems to
> > be full of these kinds of races; I know this isn't the first one I've
> > seen in it.  I don't think this patchset is ready for this merge window.
> 
> There were races in the older version that did caching of large pages and
> those were fixed then, but this is anyway irrelevant because all that code
> was dropped in the latest respins.
> 
> I don't think that the fix of the race in gup_pte_range is that significant
> to wait 3 more months because of it.

I have no particular interest in secretmem, but it seems that every time
I come across it while looking at something else, I see these kinds of
major mistakes in it.  That says to me it's not ready and hasn't seen
enough review.

> > With that fixed, you'll have a head page that you can use for testing,
> > which means you don't need to test PageCompound() (because you know the
> > page isn't PageTail), you can just test PageHead().
> 
> I can't say I follow you here. page_is_secretmem() is intended to be a
> generic test, so I don't see how it will get PageHead() if it is called
> from other places.

static inline bool head_is_secretmem(struct page *head)
{
	if (PageHead(head))
		return false;
	...
}

static inline bool page_is_secretmem(struct page *page)
{
	if (PageTail(page))
		return false;
	return head_is_secretmem(page);
}

(yes, calling it head is a misnomer, because it's not necessarily a head,
it might be a base page, but until we have a name for pages which might
be a head page or a base page, it'll have to do ...)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
