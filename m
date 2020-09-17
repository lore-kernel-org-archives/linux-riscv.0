Return-Path: <SRS0=KFrn=C2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF71C35257
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 06:02:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F78C208E4
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 06:02:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hzqem17Q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vux4kkpH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F78C208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n8oyuF0L1aUeagCKR1Ip1Ktgu0gHyRnSVK4N9vzn3e8=; b=hzqem17QnetjrFeurhzbhkqLq
	/eP+boou4MI8oIfFb7keTXFHQ6hlZUXMkopXYUeMdPLzrcmOw3g4P9uM/6miERtlzobnqvI/0CX26
	h3+UuocTQo1z+DCQfBRrKPyn896CMTUE34fBr10r5Pk4TeBEtnyIa/sxH678xgkaR6IBMBVnUdK33
	tsgTbhdnfUTHts+KGvj0zgUyJk9vVoD6PUWnb1SBakxxFJrhn9rHZedzk6VpjcKBr5OppQrQeGmCo
	7THDIap7Kv2fWc9rUNOIZhkeW7PRn8j7r//AyC0nHQnfDono/Pt+s8zX+oNdSflHOy1jIq3BUlQ22
	u+Lv7h7gQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kImzx-0001vf-EP; Thu, 17 Sep 2020 06:02:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kImzp-0001sm-Qn; Thu, 17 Sep 2020 06:02:18 +0000
Received: from kernel.org (unknown [87.71.73.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A0884208A9;
 Thu, 17 Sep 2020 06:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600322537;
 bh=CIn6WbP0PnrQ3swBmqoXOV/7IIFuke5wts27Oqfqgg0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vux4kkpHuXcUr7JNEHn4Ta2uTVvfxtbJ9itAdl2PBkK6QyIeLEPF/IgXqabss0x27
 PzEi/Ljvi7tKISYtA19lM11TCsz3Xb6kP/FhycSx/lQzYL5iW0K3kS8LlY4wG3QD8o
 sB0DVP4rSIY6tB2sseLZOZLHziJ/3k7brwfFikrY=
Date: Thu, 17 Sep 2020 09:02:04 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH v5 0/5] mm: introduce memfd_secret system call to create
 "secret" memory areas
Message-ID: <20200917060204.GO2142832@kernel.org>
References: <20200916073539.3552-1-rppt@kernel.org>
 <20200916162020.0d68c2bd6711024cfcaa8bd7@linux-foundation.org>
 <CAKgNAkiSRDoZWKkBLB03X_knOeoeKVTy2oLmMopZ5vK8UZSAPg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKgNAkiSRDoZWKkBLB03X_knOeoeKVTy2oLmMopZ5vK8UZSAPg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_020217_954828_408FD794 
X-CRM114-Status: GOOD (  21.63  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Linux-MM <linux-mm@kvack.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Christopher Lameter <cl@linux.com>,
 Idan Yaniv <idan.yaniv@ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>,
 linux-arch <linux-arch@vger.kernel.org>, Tycho Andersen <tycho@tycho.ws>,
 linux-nvdimm@lists.01.org, Will Deacon <will@kernel.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 James Bottomley <jejb@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 Linux API <linux-api@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Sep 17, 2020 at 07:46:12AM +0200, Michael Kerrisk (man-pages) wrote:
> On Thu, 17 Sep 2020 at 01:20, Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > On Wed, 16 Sep 2020 10:35:34 +0300 Mike Rapoport <rppt@kernel.org> wrote:
> >
> > > This is an implementation of "secret" mappings backed by a file descriptor.
> > > I've dropped the boot time reservation patch for now as it is not strictly
> > > required for the basic usage and can be easily added later either with or
> > > without CMA.
> >
> > It seems early days for this, especially as regards reviewer buyin.
> > But I'll toss it in there to get it some additional testing.
> >
> > A test suite in tools/testging/selftests/ would be helpful, especially
> > for arch maintainers.
> >
> > I assume that user-facing manpage alterations are planned?

> I was just about to write a mail into this thread when I saw this :-).
> 
> So far, I don't think I saw a manual page patch. Mike, how about it?

It is planned :)

I have a draft, but I'm waiting for consensus about the uncached
mappings before sending it out.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
