Return-Path: <SRS0=YGcN=JQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD8C2C433B4
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 09:37:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F4E960FF3
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 09:37:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F4E960FF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Dxl9f9KpO9bmZ69HqvR8P0ohsC/4jASDAW2iAWb97Wc=; b=WCmNXZqpu8sIIDo5fLXSiSsdq
	iol/znK1mh2gwLfJmrqB9iR/zRjqh1AUzvgZ6BgjtPqnMtWLhLwubQgVdbR8W7/PSLeJ62nkBHZ+D
	hMNunJQy76ByetYqBn4xQTSBxoj9TZsjtv5weQikAfj89iDlhihLylnOgrY3zRPOigKVOOO+Dmuze
	1mak6VWJMMReBZzFzN3nCiwoWTT7r3N+fqGHoVJjM39JeHth+6HTXty9/PWj+ek5LYrR94om5zhiS
	4tMBw88122QP6BcwKH8uPBayd19mM3WZ+JHjqrgGfTTbaebsCeODhJevn4runEXnRfVWVF94RbR4r
	kyHG9Cz0A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYQL0-009ZQc-5z; Mon, 19 Apr 2021 09:37:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYQKh-009ZNO-Uk; Mon, 19 Apr 2021 09:36:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=BZZ+kLZ/qrxvZpFu23nIOUHTr+yIAL0SA1ZJPxME3HM=; b=Cb6TIrVzTW1Kd9aO30WrTw7XUR
 3FVw5WO7SrLADwjeQGIYrX9o49/jD5et6Zf8rxPtIEl9HBsBd572Jsvtkp3hyX5VmF0aP4Pc7NstP
 Cn15mP5ScFcmqfNXhPORZ9PdAsej4te4x58MIDK5Gha0xlqZ/2XMvvZ0bNtZwTl3iBD1+SWxwDvKd
 6U9IL7m24JZ0sWmD/tF2rABCYmWqr1XLwc4cpODfUL4fXmSvqihxueFkn+omcZnWGYUDzKU8Ltvao
 wZT+eRDOK8pqHg8jkXrgQdXBRWXDmnNCO1wulBcfwTKMuN1qw190dDfB8eTGsy8C4j2ZNEtiibq/N
 n+ki0kVQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYQKc-00BEcp-5h; Mon, 19 Apr 2021 09:36:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CE5486101D;
 Mon, 19 Apr 2021 09:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618824997;
 bh=gKvvGKT7gwRRGsoZvfcNRGcz0Uq+afSf3EpowR/OLNc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P3lkwvjW/R0feyjsaGtC46WUvSA5fINd83XuQt+ZESQgLmLjszsOUu+LDUHEcKzFK
 sigplCcojQ4mBEu6rER8dXQGEZqUGKDoigx7QfRx9QLVtR+aRgfcwkGniPnNZcwK1Y
 esYRQZkAPosCP1G+VuLB3y59ckxByt6ogqqNClQC0M2eiZ92c2ENWNcdwDNmkJaobH
 Q6eesP5D30kBeyc+SuhpDLAJuFI3pxzWfEnJtG1/zLkGk9o8TBN3uAS9cvmcCI24LT
 EfVn9mOhYvqkGR2hQgso12puyTHP9lzT9F9imFG/PQhcsS3AMAg4DeKSgo5cUC9n88
 820gRflNkMWuw==
Date: Mon, 19 Apr 2021 12:36:19 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
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
 Matthew Wilcox <willy@infradead.org>,
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
Message-ID: <YH1PE4oWeicpJT9g@kernel.org>
References: <20210419084218.7466-1-rppt@kernel.org>
 <3b30ac54-8a92-5f54-28f0-f110a40700c7@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3b30ac54-8a92-5f54-28f0-f110a40700c7@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_023638_276873_270F84E8 
X-CRM114-Status: GOOD (  33.61  )
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

On Mon, Apr 19, 2021 at 11:15:02AM +0200, David Hildenbrand wrote:
> On 19.04.21 10:42, Mike Rapoport wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > =

> > Kernel test robot reported -4.2% regression of will-it-scale.per_thread=
_ops
> > due to commit "mm: introduce memfd_secret system call to create "secret"
> > memory areas".
> > =

> > The perf profile of the test indicated that the regression is caused by
> > page_is_secretmem() called from gup_pte_range() (inlined by gup_pgd_ran=
ge):
> > =

> >   27.76  +2.5  30.23       perf-profile.children.cycles-pp.gup_pgd_range
> >    0.00  +3.2   3.19 =B1 2%  perf-profile.children.cycles-pp.page_mappi=
ng
> >    0.00  +3.7   3.66 =B1 2%  perf-profile.children.cycles-pp.page_is_se=
cretmem
> > =

> > Further analysis showed that the slow down happens because neither
> > page_is_secretmem() nor page_mapping() are not inline and moreover,
> > multiple page flags checks in page_mapping() involve calling
> > compound_head() several times for the same page.
> > =

> > Make page_is_secretmem() inline and replace page_mapping() with page fl=
ag
> > checks that do not imply page-to-head conversion.
> > =

> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > ---
> > =

> > @Andrew,
> > The patch is vs v5.12-rc7-mmots-2021-04-15-16-28, I'd appreciate if it =
would
> > be added as a fixup to the memfd_secret series.
> > =

> >   include/linux/secretmem.h | 26 +++++++++++++++++++++++++-
> >   mm/secretmem.c            | 12 +-----------
> >   2 files changed, 26 insertions(+), 12 deletions(-)
> > =

> > diff --git a/include/linux/secretmem.h b/include/linux/secretmem.h
> > index 907a6734059c..b842b38cbeb1 100644
> > --- a/include/linux/secretmem.h
> > +++ b/include/linux/secretmem.h
> > @@ -4,8 +4,32 @@
> >   #ifdef CONFIG_SECRETMEM
> > +extern const struct address_space_operations secretmem_aops;
> > +
> > +static inline bool page_is_secretmem(struct page *page)
> > +{
> > +	struct address_space *mapping;
> > +
> > +	/*
> > +	 * Using page_mapping() is quite slow because of the actual call
> > +	 * instruction and repeated compound_head(page) inside the
> > +	 * page_mapping() function.
> > +	 * We know that secretmem pages are not compound and LRU so we can
> > +	 * save a couple of cycles here.
> > +	 */
> > +	if (PageCompound(page) || !PageLRU(page))
> > +		return false;
> =

> I'd assume secretmem pages are rare in basically every setup out there. So
> maybe throwing in a couple of likely()/unlikely() might make sense.

I'd say we could do unlikely(page_is_secretmem()) at call sites. Here I can
hardly estimate which pages are going to be checked.
 =

> > +
> > +	mapping =3D (struct address_space *)
> > +		((unsigned long)page->mapping & ~PAGE_MAPPING_FLAGS);
> > +
> =

> Not sure if open-coding page_mapping is really a good idea here -- or even
> necessary after the fast path above is in place. Anyhow, just my 2 cents.

Well, most if the -4.2% of the performance regression kbuild reported were
due to repeated compount_head(page) in page_mapping(). So the whole point
of this patch is to avoid calling page_mapping().

> The idea of the patch makes sense to me.

-- =

Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
