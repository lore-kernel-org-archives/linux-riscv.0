Return-Path: <SRS0=maVz=EB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3FAC4363A
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 09:31:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F271B22403
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 09:31:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="umLjlcDV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gay4USUB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F271B22403
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7kVeth4FnrjqhfV7Nuz4DiHOa+Ii+HR8o1T+eP6Ugzs=; b=umLjlcDVG0rPo+qcIiyTEWlyt
	H2HhdbSnHzQrT70JnJPFM0zEC/txA98WZdnPmN7w/9NM26cdBkpg9eYJtVD/HX8EHmuSmMW7pjF0v
	3LohGFuzbQM8I35n/JtY1ZE2HnemLoOGQZ17nIXO6LrgAFba/yssdZbUnMq4EwDKntfO0hEyicS+Q
	GG2gz5C1vGrBFr6UXjWl6fvumrHhlbjVb1RrScO4Mxk6MzIzljGfnBFShjrruOiQQSsADOuHnVB9V
	GJrMsjnE4mrUD9Gc2GgxXwIiYR8hpSOOUlyRlUB/Y/vS9mKgAyOn9PmbLc8v6+isQjkFIxB2LXmcu
	kn4vHpuiw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kWyql-0001BC-7G; Mon, 26 Oct 2020 09:31:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWyqf-000199-UY; Mon, 26 Oct 2020 09:31:31 +0000
Received: from kernel.org (unknown [87.70.96.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 04E07223EA;
 Mon, 26 Oct 2020 09:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603704688;
 bh=UPPnXviZXmutWijYpQ9tn9fnLcQibcRuGcgbK3gvCBw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gay4USUBBIxHqVxLVBTGdS6UR/Xrw069y1WeVP2Fs7F0gpT/fVrp1lv3pe8IbHpLe
 RoEp88v8LxwsuyzDFoKwK7DyX3p6WzNTV//0uHT1Jgfz1rDyGmOBg1EeMCMd5+X4tM
 uKwPfXMr4FM1bIOQXZSKgycAvE2mT9oKkX0LymH4=
Date: Mon, 26 Oct 2020 11:31:10 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH 4/4] arch, mm: make kernel_page_present() always available
Message-ID: <20201026093110.GC1154158@kernel.org>
References: <20201025101555.3057-1-rppt@kernel.org>
 <20201025101555.3057-5-rppt@kernel.org>
 <979889bf987fdc7268a973fe7398198bfad1644f.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <979889bf987fdc7268a973fe7398198bfad1644f.camel@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_053130_231404_F49E6138 
X-CRM114-Status: GOOD (  21.22  )
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
Cc: "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "david@redhat.com" <david@redhat.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "paulus@samba.org" <paulus@samba.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "cl@linux.com" <cl@linux.com>, "will@kernel.org" <will@kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>, "x86@kernel.org" <x86@kernel.org>,
 "rppt@linux.ibm.com" <rppt@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "rientjes@google.com" <rientjes@google.com>, "Brown,
 Len" <len.brown@intel.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "hca@linux.ibm.com" <hca@linux.ibm.com>, "bp@alien8.de" <bp@alien8.de>,
 "luto@kernel.org" <luto@kernel.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "kirill@shutemov.name" <kirill@shutemov.name>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "penberg@kernel.org" <penberg@kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "iamjoonsoo.kim@lge.com" <iamjoonsoo.kim@lge.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "davem@davemloft.net" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Oct 26, 2020 at 12:54:01AM +0000, Edgecombe, Rick P wrote:
> On Sun, 2020-10-25 at 12:15 +0200, Mike Rapoport wrote:
> > index 7f248fc45317..16f878c26667 100644
> > --- a/arch/x86/mm/pat/set_memory.c
> > +++ b/arch/x86/mm/pat/set_memory.c
> > @@ -2228,7 +2228,6 @@ void __kernel_map_pages(struct page *page, int
> > numpages, int enable)
> >  }
> >  #endif /* CONFIG_DEBUG_PAGEALLOC */
> >  
> > -#ifdef CONFIG_HIBERNATION
> >  bool kernel_page_present(struct page *page)
> >  {
> >         unsigned int level;
> > @@ -2240,7 +2239,6 @@ bool kernel_page_present(struct page *page)
> >         pte = lookup_address((unsigned long)page_address(page),
> > &level);
> >         return (pte_val(*pte) & _PAGE_PRESENT);
> >  }
> > -#endif /* CONFIG_HIBERNATION */
> 
> This is only used by hibernate today right? Makes sense that it should
> return a correct answer if someone starts to use it without looking too
> closely at the header. But could we just remove the default static
> inline return true implementation and let the linker fail if someone
> starts to use it outside hibernate? Then we could leave it compiled out
> until then.

Hmm, I'm not sure I follow you here.
We'd need some stub for architectures that have
ARCH_HIBERNATION_POSSIBLE and do not have
CONFIG_ARCH_HAS_SET_DIRECT_MAP.

I don't see how the kernel would compile for ppc or sparc with
hibernation enabled if I remove the default implementation.

> Also it looks like riscv does not have ARCH_HIBERNATION_POSSIBLE so the
> new function added here couldn't be used yet. You could also just let
> the linker catch it if riscv ever enables hibernate?

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
