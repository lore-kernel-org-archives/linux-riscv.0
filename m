Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9323BC77B7A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 18:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P3aIo2jCnYFjijGqanL18nvvaBrQhFJ7GdM7HBLD/Gs=; b=KQUQWKzizFbB4u
	pKC+gccgBxevNtFnG3F3BCN43vRFJVkHM2Vu7rAWXfhdn3eKp963LeP2a5XCRe7SXsqn0XVsURsYD
	BE/ElKQULyxJvfRJ788gWNoy9fXTmq3q4rgjhlLpOPSG/lE0Vq4cweTZtgun8namjT82Uq1Eb44tP
	HrYnUitoqt7zUEboFk8ELIZkHPawekXJb0pdgk0+hIzvyDxU8LoEFAM13wQ++k0dQMmJBl9ATkjyo
	eDregY20iK3/KBeNH4BUM2WQETrKoinMc/aA009TI69kcJ3OORW/xR+wqFCXVkXNBxvlsyKAssBvb
	hIR51Q6n/t5A+KAUGfOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4nBm-004ch0-0j;
	Thu, 01 Jun 2023 18:38:22 +0000
Received: from out-19.mta1.migadu.com ([95.215.58.19])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4nBi-004ccQ-28
	for linux-riscv@lists.infradead.org;
	Thu, 01 Jun 2023 18:38:20 +0000
Date: Thu, 1 Jun 2023 14:38:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1685644690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vE5M38dfe56E8s/vH4SQoCtLt0IZYGAsgOXKDjVTLRk=;
	b=WcebRBX9N7xDfAOhJQCDt0Brku79Lkj1MR87hiRp7qhEDbQiQDjnDqE0iVy5Kc4E8ADGNa
	mXKEmKqKwoHkFh7QINhK9dRhKouPQW/ELmG9UtD3LNTa1N16g/g9fLkjUa8jbnd9gCmrO/
	7957lwgmB5RqAKvocMdeApF9dZOlVqo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "tglx@linutronix.de" <tglx@linutronix.de>,
	"mcgrof@kernel.org" <mcgrof@kernel.org>,
	"deller@gmx.de" <deller@gmx.de>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"hca@linux.ibm.com" <hca@linux.ibm.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"chenhuacai@kernel.org" <chenhuacai@kernel.org>,
	"tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
	"rppt@kernel.org" <rppt@kernel.org>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	"will@kernel.org" <will@kernel.org>,
	"dinguyen@kernel.org" <dinguyen@kernel.org>,
	"naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>,
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
	"linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"song@kernel.org" <song@kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
Subject: Re: [PATCH 12/13] x86/jitalloc: prepare to allocate exectuatble
 memory as ROX
Message-ID: <ZHjljJfQjhVV/jNS@moria.home.lan>
References: <20230601101257.530867-1-rppt@kernel.org>
 <20230601101257.530867-13-rppt@kernel.org>
 <0f50ac52a5280d924beeb131e6e4717b6ad9fdf7.camel@intel.com>
 <ZHjcr26YskTm+0EF@moria.home.lan>
 <a51c041b61e2916d2b91c990349aabc6cb9836aa.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a51c041b61e2916d2b91c990349aabc6cb9836aa.camel@intel.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_113818_848045_287C460C 
X-CRM114-Status: GOOD (  15.36  )
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

On Thu, Jun 01, 2023 at 06:13:44PM +0000, Edgecombe, Rick P wrote:
> > text_poke() _does_ create a separate RW mapping.
> 
> Sorry, I meant a separate RW allocation.

Ah yes, that makes sense


> 
> > 
> > The thing that sucks about text_poke() is that it always does a full
> > TLB
> > flush, and AFAICT that's not remotely needed. What it really wants to
> > be
> > doing is conceptually just
> > 
> > kmap_local()
> > mempcy()
> > kunmap_loca()
> > flush_icache();
> > 
> > ...except that kmap_local() won't actually create a new mapping on
> > non-highmem architectures, so text_poke() open codes it.
> 
> Text poke creates only a local CPU RW mapping. It's more secure because
> other threads can't write to it.

*nod*, same as kmap_local

> It also only needs to flush the local core when it's done since it's
> not using a shared MM.
 
Ahh! Thanks for that; perhaps the comment in text_poke() about IPIs
could be a bit clearer.

What is it (if anything) you don't like about text_poke() then? It looks
like it's doing broadly similar things to kmap_local(), so should be
in the same ballpark from a performance POV?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
