Return-Path: <SRS0=H9LG=EE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B5BC55179
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2020 07:55:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B84220782
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2020 07:55:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i7nH9xLJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="smkJOo6e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B84220782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bnfdN/enTTY3DdYAKgEBEDzg/hDxGYLAPa/V7crPZ3E=; b=i7nH9xLJ3hLKvhjdZHxxQZicM
	OMfPXSRo5xnAJX21ePyEetDse+ZYozBVXjZg6eK+Y2lWMJnTiNB56fC+KRuHX3QrPg4qQuLtPqREE
	vyQ4k/o7Rfsu646KVTJv1vjN33Mi7SJjcRznc0JF4x1ftqOfxYMplCkHcrYw4KIXT1Gaa3Y5KNW9y
	JISXO//kU9uyle/HwPzWvwv5iOcZt9eL1IshpB8Z5QXSP8KfzLKLbOICMie0LQwuiO7Fer1BhrjCY
	I1IFFBlJCjvIsvV5o0mQ9RPUbkxqVWl66oqoc+hbXBR2KKTY7oouswEkyNTUReI78ZhYVKXEIAnmS
	Ui8BwdJ5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kY2lm-0002ik-Kc; Thu, 29 Oct 2020 07:54:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kY2lT-0002ae-S4; Thu, 29 Oct 2020 07:54:33 +0000
Received: from kernel.org (unknown [87.70.96.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E3F1620EDD;
 Thu, 29 Oct 2020 07:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603958070;
 bh=5V9raRTAO8xn/TWxASurP3gs711BOhAaxxP12fBIpug=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=smkJOo6ejvJldTmaaqqEFjGX6LWRb76WicHCvCBcrN9qOMMNByoTCZCyPYd8JouA6
 FsHRDDeFim9xIzvbeq0FyT0w7eXPAkBTo6qZkKSqULTgH8mtDPy6sKAI1NlM6RXbk0
 gkAxCVUoVSgKd/P/vRphpHr37cKvq2I6Usohfbtc=
Date: Thu, 29 Oct 2020 09:54:16 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH 2/4] PM: hibernate: improve robustness of mapping pages
 in the direct map
Message-ID: <20201029075416.GJ1428094@kernel.org>
References: <20201025101555.3057-1-rppt@kernel.org>
 <20201025101555.3057-3-rppt@kernel.org>
 <3b4b2b3559bd3dc68adcddf99415bae57152cb6b.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3b4b2b3559bd3dc68adcddf99415bae57152cb6b.camel@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_035432_244094_8E75DA5A 
X-CRM114-Status: GOOD (  18.14  )
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

On Wed, Oct 28, 2020 at 09:15:38PM +0000, Edgecombe, Rick P wrote:
> On Sun, 2020-10-25 at 12:15 +0200, Mike Rapoport wrote:
> > +       if (IS_ENABLED(CONFIG_ARCH_HAS_SET_DIRECT_MAP)) {
> > +               unsigned long addr = (unsigned
> > long)page_address(page);
> > +               int ret;
> > +
> > +               if (enable)
> > +                       ret = set_direct_map_default_noflush(page);
> > +               else
> > +                       ret = set_direct_map_invalid_noflush(page);
> > +
> > +               if (WARN_ON(ret))
> > +                       return;
> > +
> > +               flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> > +       } else {
> > +               debug_pagealloc_map_pages(page, 1, enable);
> > +       }
> 
> Looking at the arm side again, I think this might actually introduce a
> regression for the arm/hibernate/DEBUG_PAGEALLOC combo.
> 
> Unlike __kernel_map_pages(), it looks like arm's cpa will always bail
> in the set_direct_map_() functions if rodata_full is false.
>
> So if rodata_full was disabled but debug page alloc is on, then this
> would now skip remapping the pages. I guess the significance depends
> on whether hibernate could actually try to save any DEBUG_PAGEALLOC
> unmapped pages. Looks like it to me though.
 
__kernel_map_pages() on arm64 will also bail out if rodata_full is
false:

void __kernel_map_pages(struct page *page, int numpages, int enable)
{
	if (!debug_pagealloc_enabled() && !rodata_full)
		return;

	set_memory_valid((unsigned long)page_address(page), numpages, enable);
}

So using set_direct_map() to map back pages removed from the direct map
with __kernel_map_pages() seems safe to me.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
