Return-Path: <SRS0=bvH1=PU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48DAFC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 12 Jan 2019 01:09:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15D3720870
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 12 Jan 2019 01:09:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BuCje6Dz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15D3720870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y6v8yn9mDPaTj9ea1EtJEm6aEL8AfdJBMeqaaXt+vck=; b=BuCje6Dz6N3FKbFaVd8nGgyre
	GW5uiE/CqYrwiAGHEv1U4nXI9Xa/WdEnqSr6fJfwd75e/vgchgdLBgubOM303azqFkxhzJuAKYDC+
	cPHl9iR7ps58ayV5Hq4NdyaP7C+Qk6l9SHY4aaw20ypQ+AU0RVmAaQOOUcwKi5rfy7RmcFg6yw/qQ
	3el8Q31puhPmy4npwT6dXkDwyUFNUyF9PyRCYO+SmmnRUquiLGkQpufgiCl6ipvtwMFGrhKdlASJz
	gnXozv3kX8DYgTAs5EUTFlJrf/KeT1C8atR1v/gPSDVeopdFzxhO5hMCAzOqi80Mmoo+Dkdz9+zmJ
	aDxY55HqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gi7nu-0004zd-00; Sat, 12 Jan 2019 01:09:38 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gi7nq-0004zD-Bv
 for linux-riscv@lists.infradead.org; Sat, 12 Jan 2019 01:09:36 +0000
X-Originating-IP: 79.86.19.127
Received: from [192.168.0.11] (127.19.86.79.rev.sfr.net [79.86.19.127])
 (Authenticated sender: alex@ghiti.fr)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 21AA2C0003;
 Sat, 12 Jan 2019 01:09:19 +0000 (UTC)
Subject: Re: [PATCH 0/3] Hugetlbfs support for riscv
To: Mike Kravetz <mike.kravetz@oracle.com>, Alexandre Ghiti
 <aghiti@upmem.com>, palmer@sifive.com
References: <20181210062146.24951-1-aghiti@upmem.com>
 <91664ec7-d148-1c0a-8d1a-82815c5c7f6a@oracle.com>
 <6c5bccf0-f185-4db4-96fc-5439bf8f6330@ghiti.fr>
 <6e20f18c-0313-168e-ff86-f0bf3b90a46f@oracle.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <bc2059d2-0409-df2b-4c93-9438efa3043b@ghiti.fr>
Date: Sat, 12 Jan 2019 01:09:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <6e20f18c-0313-168e-ff86-f0bf3b90a46f@oracle.com>
Content-Language: en-PH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190111_170934_714134_EB914E55 
X-CRM114-Status: GOOD (  20.73  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, catalin.marinas@arm.com, ndesaulniers@google.com,
 mingo@kernel.org, atish.patra@wdc.com, linux-riscv@lists.infradead.org,
 akpm@linux-foundation.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


On 1/10/19 6:28 PM, Mike Kravetz wrote:
> On 1/10/19 12:09 AM, Alex Ghiti wrote:
>> On 1/9/19 7:23 PM, Mike Kravetz wrote:
>>> On 12/9/18 10:21 PM, Alexandre Ghiti wrote:
>>>> However I don't see any strong dependency between free_contig_range
>>>> and those configs, maybe we could allow hugetlbfs users to free boot
>>>> reserved hugepages without those configs activated, I will propose
>>>> something if Mike Kravetz agrees.
>>> Yes, that should be modified.  I think it would be a simple matter of moving
>>> free_contig_range out of that ifdef block.  If you would like, I can submit
>>> a patch for that.
>>
>> I think there is more to do: free_gigantic_page is only defined with
>> ARCH_HAS_GIGANTIC_PAGE which in turn is only defined with
>> CMA || (MEMORY_ISOLATION && COMPACTION). Moreover, if
>> ARCH_HAS_GIGANTIC_PAGE is not defined, gigantic_page_supported
>> will return false and then function like update_and_free_page will
>> not reach the call to free_gigantic_page...etc. I will send you a patch
>> when I have fixed all of that :)
> Yes, I spoke too soon :)
>
>>> Somewhat related, I do not think your patches enable dynamic allocation of
>>> gigantic pages.  Not sure if that was an oversight or conscious decision.
>>> I am not sure this is a highly used feature, but if you can do it on riscv
>>> then why not?
>> I'm not sure to understand: do you mean picking an already allocated
>> gigantic page or really allocating it with alloc_gigantic_page ? Or
>> something else ?
> The term 'dynamic allocation' may not be accurate.  Sorry!
>
> Yes, I was talking about really allocating with alloc_gigantic_page.
> It is possible to do this as long as the hstate for the gigantic page
> size already exists.  If nothing is specified on the kernel boot command
> line, the arch independent code will only set up the hstate for the default
> huge page size.  x86 has this at the end of hugetlbpage.c to create the
> gigantic page hstate as along as all config options are specified.
>
> #if (defined(CONFIG_MEMORY_ISOLATION) && defined(CONFIG_COMPACTION)) ||
> defined(CONFIG_CMA)
> static __init int gigantic_pages_init(void)
> {
> 	/* With compaction or CMA we can allocate gigantic pages at runtime */
> 	if (boot_cpu_has(X86_FEATURE_GBPAGES) && !size_to_hstate(1UL << PUD_SHIFT))
> 		hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
> 	return 0;
> }
> arch_initcall(gigantic_pages_init);
> #endif
>
> I believe some other architectures do something similar to automatically
> set up hstates other huge pages sizes at boot time.  Totally optional,
> but you might want to do something like this for riscv.


Ok, I understand now, I agree that we should allow non default huge
page allocation even if not explicitly specified on kernel command line
paramter. I'll add an __init function to init hstate for gigantic page.

Thanks Mike,

Alex



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
