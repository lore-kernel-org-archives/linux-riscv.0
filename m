Return-Path: <SRS0=YGcN=JQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1428DC433ED
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 11:44:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF28E61166
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 11:44:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF28E61166
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JOZlbwOcrUENGGecOphTDF70BYXq9RiPW5kQi4sdNXw=; b=FAR33hTJJ2IKMTZKp8lcgVAk8
	l1csYKtVv6SR/cuYSHjW3yuTQI357QpJQBCvKsM54DiFSkUHNqucrFT3F9ZFwRwNWKNdpHKn0cGen
	WxuO3yfywNfNaAc9wed3troIF6nb4CS9BP1Qbpu84OJ4Lk43/VEA+lXJ6VELt1DDmUiCfNW0LJzCI
	DATSh/+ivKZ3Y1udV9BepsSjyPnch+jpYEbeMmi1C/YLg7SEil8pCnxo+VkL0nym2+QHEOHio5/4O
	eg1BWVnm33/OdnlM1HeAoDvDgGShDl/Nc35tgBPR5i/WMJXxVXsmSxCuzWnFMWGofmBctubhQWM9O
	sPrGmk1fA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYSJz-009no8-MT; Mon, 19 Apr 2021 11:44:07 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYSJp-009nnq-9C; Mon, 19 Apr 2021 11:43:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=bwPuhmLV9iDdbBtA80aP2NeOoPck37vPl2v0l8S8dJw=; b=ZKgd+wiWxB4OjJM0AIDMQSKXxR
 mK2R/z3oqKh1PUQkJXhvcIcCeNtKgp8OXUyGgAszjnbvM4jRpHJ8CjWbc7hBN1U6HbdDGK+UorYOc
 MFcMKMdSOPfBZbD7GWLjHFe+LP+3z+b1cJWnPckDm478VhnIuObWzbqtK9sHaZ8jwmo1+eWrdBGQa
 v1kBE40Vi4xvSvLhZ0bnDkcLGvuPRT/cK5/47tFYec+ZGcwN2cVCQO61pGGxpuB3lYinJPup2TnB4
 GZ/ajfYkgk2Tj5Ry8+D2ggrOGM4MLh5XgrDlBR0M9Vx/aMmMy+8h8RgjgqInD8p/8jeX+er7cc13j
 MOHIVxrw==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lYSJB-00Dg11-HM; Mon, 19 Apr 2021 11:43:29 +0000
Date: Mon, 19 Apr 2021 12:43:17 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christopher Lameter <cl@linux.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
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
Message-ID: <20210419114317.GY2531743@casper.infradead.org>
References: <20210419084218.7466-1-rppt@kernel.org>
 <3b30ac54-8a92-5f54-28f0-f110a40700c7@redhat.com>
 <YH1PE4oWeicpJT9g@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YH1PE4oWeicpJT9g@kernel.org>
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

On Mon, Apr 19, 2021 at 12:36:19PM +0300, Mike Rapoport wrote:
> Well, most if the -4.2% of the performance regression kbuild reported were
> due to repeated compount_head(page) in page_mapping(). So the whole point
> of this patch is to avoid calling page_mapping().

It's quite ludicrous how many times we call compound_head() in
page_mapping() today:

 page = compound_head(page);
 if (__builtin_expect(!!(PageSlab(page)), 0))
 if (__builtin_expect(!!(PageSwapCache(page)), 0)) {

TESTPAGEFLAG(Slab, slab, PF_NO_TAIL) expands to:

static __always_inline int PageSlab(struct page *page)
{
	PF_POISONED_CHECK(compound_head(page));
	return test_bit(PG_slab, &compound_head(page));
}

static __always_inline int PageSwapCache(struct page *page)
{
        page = compound_head(page);
        return PageSwapBacked(page) && test_bit(PG_swapcache, &page->flags);
}

but then!

TESTPAGEFLAG(SwapBacked, swapbacked, PF_NO_TAIL) also expands like Slab does.

So that's six calls to compound_head(), depending what Kconfig options
you have enabled.

And folio_mapping() is one of the functions I add in the first batch of
patches, so review, etc will be helpful.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
