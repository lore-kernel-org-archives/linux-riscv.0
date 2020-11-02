Return-Path: <SRS0=qpiA=EI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B331C00A89
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2020 15:15:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F14221556
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2020 15:15:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NBFgIXJj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="tYvaG/9d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F14221556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rVsOL8bnJVDWhS1p0Q2D1Y5BJRoVt3jD1aEZWZ/AQns=; b=NBFgIXJj7oiEOhZOMBXHHiASM
	rsWkbr5X/ejKhz0Ef93E6vhW/42878oo1HDAs+N8Y4Sijms69jC8+XgRolbuYqln2TildfSGODDRA
	sLaDyb001ed7FyfQYeBV57TaMRLdkRSu27zYullqSEpriopRHkfB82xlgYu4yzb5w+lP6cwLcHkI1
	zdeg70K5C/Ys5AddLqdcIhAENkcDHodxUNRtJK61Ft2QedH2HtLTFmtjZrD4fJ9d/f7+WSlQ4p7DL
	dLXOs0FW++5rKeHehuYlhmOHz7dX2sxx+JS1N+Lw3bozOHLNuNFMkpC8qwAR5RP+2lMfhZKgqp+mA
	2n3aPOe1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZbYc-0008As-S6; Mon, 02 Nov 2020 15:15:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZbYY-00088t-7o; Mon, 02 Nov 2020 15:15:39 +0000
Received: from kernel.org (unknown [87.71.17.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 30D5B21556;
 Mon,  2 Nov 2020 15:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604330137;
 bh=HUTlle6eGdFGRRBi2JxylJ6R01dvNLPTF9EEu8JnDzk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tYvaG/9dInW01K1TdO7aN/JE/ddj5YkjOdNNg69Vx3IMO/KyPHo+L3t750XHeB7cy
 9nHtZ/YgWXPmU7Jf3+rHocYXndpyDvstMLn2JsE5CdJ3oN4Ef/dmiDi3mtetYWFv3p
 XYQkck9tVbbZ/n1Alyl03sGboOgOce0/AdowI7CE=
Date: Mon, 2 Nov 2020 17:15:24 +0200
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 3/4] arch, mm: restore dependency of
 __kernel_map_pages() of DEBUG_PAGEALLOC
Message-ID: <20201102151524.GB4879@kernel.org>
References: <20201101170815.9795-1-rppt@kernel.org>
 <20201101170815.9795-4-rppt@kernel.org>
 <8eac2aa4-114e-f981-c8f8-ad8523175cf8@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8eac2aa4-114e-f981-c8f8-ad8523175cf8@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_101538_428115_717C8A86 
X-CRM114-Status: GOOD (  19.87  )
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Len Brown <len.brown@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-pm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 David Rientjes <rientjes@google.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 linux-arm-kernel@lists.infradead.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, Pekka Enberg <penberg@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 02, 2020 at 10:23:20AM +0100, David Hildenbrand wrote:
> 
> >   int __init kernel_map_pages_in_pgd(pgd_t *pgd, u64 pfn, unsigned long address,
> >   				   unsigned numpages, unsigned long page_flags)
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index 14e397f3752c..ab0ef6bd351d 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -2924,7 +2924,11 @@ static inline bool debug_pagealloc_enabled_static(void)
> >   	return static_branch_unlikely(&_debug_pagealloc_enabled);
> >   }
> > -#if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_ARCH_HAS_SET_DIRECT_MAP)
> > +#ifdef CONFIG_DEBUG_PAGEALLOC
> > +/*
> > + * To support DEBUG_PAGEALLOC architecture must ensure that
> > + * __kernel_map_pages() never fails
> 
> Maybe add here, that this implies mapping everything via PTEs during boot.

This is more of an implementation detail, while assumption that
__kernel_map_pages() does not fail is somewhat a requirement :)

> Acked-by: David Hildenbrand <david@redhat.com>

Thanks!

> -- 
> Thanks,
> 
> David / dhildenb
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
