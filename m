Return-Path: <SRS0=MbfZ=KN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D9BAC433B4
	for <linux-riscv@archiver.kernel.org>; Tue, 18 May 2021 10:14:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F14D060BD3
	for <linux-riscv@archiver.kernel.org>; Tue, 18 May 2021 10:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F14D060BD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dSCC/Ykclv1ilC9taFHravFqV2WeKlyKxrLOTMMr4OE=; b=nbMBnKN1xaJaSE/BkGn/v74bE
	HGsqlqiLFdJ1TB0AE/JZSez057nAGRUOm/Uq3nTMgF9SO5pipnzlmpygBGp3V9K6GJ6dTJUMyomNp
	CqsLmVnhUmXzk0yBj1xFxZi07emx3/SwQFOc+IMcT0l7sHniVLnIGIHIYiy9BqfXBmuTq09IETH8h
	foyTwRAscRNk2c62jHTct/68rdlttCOQZrAPE8b71rY07V+Sk5qjRtmYBChKKtQZFubiCGgTTI6uJ
	Xa6CYqVtXmin9xkz0nvq+yDAsF+ZEgQMHs76Tif9X7C53/N5zzHmln+9w9Rbguai6ac0aWoKRA9EZ
	yDvp3Jxfg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liwjx-000JQh-OO; Tue, 18 May 2021 10:14:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liwVM-000G58-SI; Tue, 18 May 2021 09:59:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=b8xv7F9R3YDRWAMnBTpPRwnYRLd13u+yXERM3M4MUTs=; b=LgeJ0Mc/RE2CHnIYQQ3RXiq6qi
 a6Xs65IVIXcgpr9V5BMGeepXtR2aX2Wl/UCfQgEaC6/pzf6JWxxBQuzJh493Lbgb88kqhX5z3Ojtn
 o5rIR4b6JaptDiOcwHfRK+2zwFne98VT4aUG1l2NbHIjF+NQsMFCNNdv5khv+5TMVNCJVIIejY09l
 IQEPnANyWydoMb9JR8cxdlm9Z6AIsAEk491ngN5/VdQZd+sadzT+XerC2bJqEgKrh1K5TeQ9yerQO
 PD5C7gen2UwYxEi/8OgU8So8zX+0KZ46wSeJH5rhnETOlChglPFC5q3TdA59xtvPTXNo74rO61GHC
 ZtTlG/Rg==;
Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liwVK-00EXFp-19; Tue, 18 May 2021 09:59:11 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1621331946; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b8xv7F9R3YDRWAMnBTpPRwnYRLd13u+yXERM3M4MUTs=;
 b=JS/jDkcP1gH5mTt25RX5I6j86/cz/ZDydaWWHW2hqY8nQAAzE3DLIomRP5iqBIJVDfMfru
 o/w0GyCy15FdVoUInzSjJEpAT5R+5767DWCkHYFbUgNcLAIQDa3PDa25+ejFAKMWeiZdjA
 Bt7ymH4NrrKr2c/O8dhrS2VhugnQsAg=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BEF56AEAC;
 Tue, 18 May 2021 09:59:05 +0000 (UTC)
Date: Tue, 18 May 2021 11:59:03 +0200
From: Michal Hocko <mhocko@suse.com>
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
 "H. Peter Anvin" <hpa@zytor.com>,
 Hagen Paul Pfeifer <hagen@jauu.net>, Ingo Molnar <mingo@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Kees Cook <keescook@chromium.org>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Matthew Wilcox <willy@infradead.org>,
 Matthew Garrett <mjg59@srcf.ucam.org>, Mark Rutland <mark.rutland@arm.com>,
 Mike Rapoport <rppt@linux.ibm.com>,
 Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
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
 linux-nvdimm@lists.01.org, linux-riscv@lists.infradead.org, x86@kernel.org
Subject: Re: [PATCH v19 5/8] mm: introduce memfd_secret system call to create
 "secret" memory areas
Message-ID: <YKOP5x8PPbqzcsdK@dhcp22.suse.cz>
References: <20210513184734.29317-1-rppt@kernel.org>
 <20210513184734.29317-6-rppt@kernel.org>
 <b625c5d7-bfcc-9e95-1f79-fc8b61498049@redhat.com>
 <YKDJ1L7XpJRQgSch@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YKDJ1L7XpJRQgSch@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_025910_228157_BAA6B4C0 
X-CRM114-Status: GOOD (  18.61  )
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

On Sun 16-05-21 10:29:24, Mike Rapoport wrote:
> On Fri, May 14, 2021 at 11:25:43AM +0200, David Hildenbrand wrote:
[...]
> > > +		if (!page)
> > > +			return VM_FAULT_OOM;
> > > +
> > > +		err = set_direct_map_invalid_noflush(page, 1);
> > > +		if (err) {
> > > +			put_page(page);
> > > +			return vmf_error(err);
> > 
> > Would we want to translate that to a proper VM_FAULT_..., which would most
> > probably be VM_FAULT_OOM when we fail to allocate a pagetable?
> 
> That's what vmf_error does, it translates -ESOMETHING to VM_FAULT_XYZ.

I haven't read through the rest but this has just caught my attention.
Is it really reasonable to trigger the oom killer when you cannot
invalidate the direct mapping. From a quick look at the code it is quite
unlikely to se ENOMEM from that path (it allocates small pages) but this
can become quite sublte over time. Shouldn't this simply SIGBUS if it
cannot manipulate the direct mapping regardless of the underlying reason
for that?
-- 
Michal Hocko
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
