Return-Path: <SRS0=hxxf=EC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D4FEC4363A
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2020 09:49:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 293462225C
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2020 09:49:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HlhDiAKf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="li/s39XF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 293462225C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pQESv38fdhLefXghkhg91+8kWyYpQfkGnI9ZFCaCeuM=; b=HlhDiAKf2STMg0PjO87xnVWS9
	f3D4vnvaEvAvwpEUcRRpLZTKoge/YHCJ36K+AdB2uPGdHbU86WEc3vPuo+SnIvMKI6Y/n2G/eKJHU
	vZ9VMOYCfPoof9PF3wfzS2TFJLcF/k7UJ1YT+3/6aORwLTdfZQ27Lssg4ehe0JXYe1OC/v18UF8kT
	5bU2kgrB7l047R0XesuSmolib9v5pWjMESESwPFj5NRTyzzyYetganCa2bZPmPqX/v9yF3qzuVjGU
	EXXoQnq/sv/xUnonASpAIKwTXRE8tBNXel8p5pNpu35D04fIGeOrAmiiVUrvuf1J2miIaiYRDAp2T
	HSQxjj3Aw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXLbJ-00069r-SG; Tue, 27 Oct 2020 09:49:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXLbB-00065s-IJ; Tue, 27 Oct 2020 09:49:04 +0000
Received: from kernel.org (unknown [87.70.96.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C7CAF20759;
 Tue, 27 Oct 2020 09:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603792140;
 bh=wcj6sqvr10YA2nIxp8QFswfSebjeDskPYpJl+9Hjv5I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=li/s39XFgB24jJSUCjqf8zNKcx6M9bh+uU6phnSX6LJCJRBegjZ0SOdTEugjflO1e
 WgquGhsCXXsZ3V2YD7JRAQc2nfgUEjBNCSoKoM6GZx5SGcpgMkSqE8zAapjDeCrodZ
 Fc2zbcZd41+mXwuTSqYXiceoEMKXjGqiG53f7j/s=
Date: Tue, 27 Oct 2020 11:48:45 +0200
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v7 3/7] set_memory: allow set_direct_map_*_noflush() for
 multiple pages
Message-ID: <20201027094845.GJ1154158@kernel.org>
References: <20201026083752.13267-1-rppt@kernel.org>
 <20201026083752.13267-4-rppt@kernel.org>
 <e754ae3873e02e398e58091d586fe57e105803db.camel@intel.com>
 <9202c4c1-9f1f-175f-0a85-fc8c30bc5e3b@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9202c4c1-9f1f-175f-0a85-fc8c30bc5e3b@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_054901_880693_3D4CF41A 
X-CRM114-Status: GOOD (  17.30  )
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "hpa@zytor.com" <hpa@zytor.com>, "cl@linux.com" <cl@linux.com>,
 "shuah@kernel.org" <shuah@kernel.org>, "Williams,
 Dan J" <dan.j.williams@intel.com>, "Reshetova,
 Elena" <elena.reshetova@intel.com>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "tycho@tycho.ws" <tycho@tycho.ws>,
 "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "will@kernel.org" <will@kernel.org>, "x86@kernel.org" <x86@kernel.org>,
 "willy@infradead.org" <willy@infradead.org>,
 "rppt@linux.ibm.com" <rppt@linux.ibm.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "mtk.manpages@gmail.com" <mtk.manpages@gmail.com>,
 "arnd@arndb.de" <arnd@arndb.de>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "bp@alien8.de" <bp@alien8.de>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "luto@kernel.org" <luto@kernel.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "kirill@shutemov.name" <kirill@shutemov.name>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "Edgecombe,
 Rick P" <rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Oct 27, 2020 at 09:12:23AM +0100, David Hildenbrand wrote:
> On 26.10.20 20:01, Edgecombe, Rick P wrote:
> > On Mon, 2020-10-26 at 10:37 +0200, Mike Rapoport wrote:
> >> +++ b/arch/x86/mm/pat/set_memory.c
> >> @@ -2184,14 +2184,14 @@ static int __set_pages_np(struct page *page,
> >> int numpages)
> >>         return __change_page_attr_set_clr(&cpa, 0);
> >>  }
> >>  
> >> -int set_direct_map_invalid_noflush(struct page *page)
> >> +int set_direct_map_invalid_noflush(struct page *page, int numpages)
> >>  {
> >> -       return __set_pages_np(page, 1);
> >> +       return __set_pages_np(page, numpages);
> >>  }
> >>  
> >> -int set_direct_map_default_noflush(struct page *page)
> >> +int set_direct_map_default_noflush(struct page *page, int numpages)
> >>  {
> >> -       return __set_pages_p(page, 1);
> >> +       return __set_pages_p(page, numpages);
> >>  }
> > 
> > Somewhat related to your other series, this could result in large NP
> > pages and trip up hibernate.
> > 
> 
> It feels somewhat desirable to disable hibernation once secretmem is
> enabled, right? Otherwise you'll be writing out your secrets to swap,
> where they will remain even after booting up again ...
> 
> Skipping secretmem pages when hibernating is the wrong approach I guess ...

Completely agree.
I'll look into preventing hibernation from touching secretmem.

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
