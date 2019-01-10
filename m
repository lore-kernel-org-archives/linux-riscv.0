Return-Path: <SRS0=4zRh=PS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85835C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 10 Jan 2019 08:11:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56449206B7
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 10 Jan 2019 08:11:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Munx/6Be"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56449206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=owP9wC4iO0dUBGWvKaT99bujSIfyKrQyquDKGRpmCnM=; b=Munx/6BeAflsOE6v42ZU9HsCS
	1lCXcz6pFs70BJTbDtGxFJvvss+R/yFuVlzZ4UoVXguBuF0OmcUgB6kKzKQnoLTyo37uuSgRRkJNC
	wZfVW/bQWrYnR0BAj8ZY3RAroj/+cbh6YI4lSdSSj/brEQoUuJmO8+f9dCYbKTyKR95a8UcgRKgDa
	JAOJyySMNIi12zoTAzQzOYFXY1cLOiC/LOQfc4bM2uiSBRn+3w/u1xGx027Qh+U+X79B7jRpOIVav
	D7/yxbuEhygj3zhNkgIWfWEsg1KEYhnhzU5wCWHQjiTBIdI98py7x/hLHab6MMev7JwsqZWoJV1T1
	7I6TpF16Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghVQv-0004DJ-DH; Thu, 10 Jan 2019 08:11:21 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghVQr-0004Cg-T8
 for linux-riscv@lists.infradead.org; Thu, 10 Jan 2019 08:11:20 +0000
X-Originating-IP: 81.250.144.103
Received: from [10.30.1.20] (lneuilly-657-1-5-103.w81-250.abo.wanadoo.fr
 [81.250.144.103]) (Authenticated sender: alex@ghiti.fr)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id A76C7240003;
 Thu, 10 Jan 2019 08:11:05 +0000 (UTC)
From: Alex Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH 0/3] Hugetlbfs support for riscv
To: Mike Kravetz <mike.kravetz@oracle.com>, Alexandre Ghiti
 <aghiti@upmem.com>, palmer@sifive.com
References: <20181210062146.24951-1-aghiti@upmem.com>
 <91664ec7-d148-1c0a-8d1a-82815c5c7f6a@oracle.com>
Message-ID: <6c5bccf0-f185-4db4-96fc-5439bf8f6330@ghiti.fr>
Date: Thu, 10 Jan 2019 09:09:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <91664ec7-d148-1c0a-8d1a-82815c5c7f6a@oracle.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190110_001118_207927_62E33C14 
X-CRM114-Status: GOOD (  24.35  )
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


On 1/9/19 7:23 PM, Mike Kravetz wrote:
> On 12/9/18 10:21 PM, Alexandre Ghiti wrote:
>> This series introduces hugetlbfs support for both riscv 32/64. Riscv32
>> is architecturally limited to huge pages of size 4MB whereas riscv64 has
>> 2MB/1G huge pages support. Transparent huge page support is not
>> implemented here, I will submit another series later.
> Thanks for doing this.
>
> Since patches only touch riscv specific code, I did not look too closely
> and do not feel qualified to offer an opinion as to whether they are correct
> for the architecture.
>
> With that said, the patches do look reasonable with a few comments below.
>
>> CMA or (MEMORY_ISOLATION && COMPACTION) must be enabled so that boot
>> reserved gigantic pages can be freed: indeed, one can reduce the number
>> of huge pages by calling free_gigantic_pages which in turn calls
>> free_contig_range, defined only with those configs defined.
>> However I don't see any strong dependency between free_contig_range
>> and those configs, maybe we could allow hugetlbfs users to free boot
>> reserved hugepages without those configs activated, I will propose
>> something if Mike Kravetz agrees.
> Yes, that should be modified.  I think it would be a simple matter of moving
> free_contig_range out of that ifdef block.  If you would like, I can submit
> a patch for that.


I think there is more to do: free_gigantic_page is only defined with
ARCH_HAS_GIGANTIC_PAGE which in turn is only defined with
CMA || (MEMORY_ISOLATION && COMPACTION). Moreover, if
ARCH_HAS_GIGANTIC_PAGE is not defined, gigantic_page_supported
will return false and then function like update_and_free_page will
not reach the call to free_gigantic_page...etc. I will send you a patch
when I have fixed all of that :)


> Somewhat related, I do not think your patches enable dynamic allocation of
> gigantic pages.  Not sure if that was an oversight or conscious decision.
> I am not sure this is a highly used feature, but if you can do it on riscv
> then why not?

I'm not sure to understand: do you mean picking an already allocated
gigantic page or really allocating it with alloc_gigantic_page ? Or
something else ?


> Another 'missing feature' in your patches is PMD sharing.  This feature if
> only of value for BIG shared hugetlbfs mappings.  DB folks like it.  As
> mentioned above, I do not know much about riscv so I do not know if this
> might be of use to potential users.


Thanks for that, I was unaware of that feature, I will take a look.


>> - libhugetlbfs testsuite on riscv64/1G:
>>    - brk_near_huge triggers an assert in malloc.c, does not on x86.
>>    - mmap-gettest, mmap-cow: testsuite passes the number of default free
>>      pages as parameters and then fails for 1G which is not the default.
>>      Otherwise succeeds when given the right number of pages.
>>    - map_high_truncate_2 fails on x86 too: 0x60000000 is not 1G aligned
>>      and fails at line 694 of fs/hugetlbfs/inode.c.
>>    - heapshrink on 1G fails on x86 too, not investigated.
>>    - counters.sh on 1G fails on x86 too: alloc_surplus_huge_page returns
>>      NULL in case of gigantic pages.
>>    - icache-hygiene succeeds after patch #3 of this series which lowers
>>      the base address of mmap.
>>    - fallocate_stress.sh on 1G never ends, on x86 too, not investigated.
> In general, libhugetlbfs tests seem to have issues with anything besides
> default huge page size.  You encountered that and noted that tests break
> for 1G pages on x86 as well.  Cleaning all that up has been on my todo list
> for years, but there always seems to be something of higher priority. :(
>
>

No problem, running the testsuite on x86 was quite simple anyway :)

Thanks Mike for your feedback,

Alex



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
