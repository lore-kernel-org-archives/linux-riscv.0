Return-Path: <SRS0=qmG6=6Z=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB93C54E4A
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 May 2020 03:15:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D54DF20644
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 May 2020 03:15:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s3oVurZV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D54DF20644
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fyOtN5C2IXpJ2CLyBmquWLoacj4ipvLOhzs7tV7M5ec=; b=s3oVurZVNLEEQc
	UXrBnGh7aPCg8DKcpRhdYmLp6vjxD6BxTAHwwgSuG1kt5PlX7egjeuapr7NxThnIJsTrmtOHZRhKA
	mIUDMUsGu2I/C7LQaw7DJAR/ke8z1mXF6lD2c/QMbmoL/jb3QUywVAinC4HiwSAZ6QTRAcxAO5fPJ
	2CTsCIOrl8cHGu9NeRdz0GzTQECvbmY6myY8jeg6mbIDcdU4DfCDl69tiMohEW1kypM6rFyNhyaV7
	xzaFO1Z5MNRDlaIAq/bhnnlq+h8JF3n1jEyLYiE5eejWS8KxsHKJj3SJb1dqmWJiuTDsea6JHOdp1
	4sCdXu/rYYW/gXr+dTLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXyuh-0003US-5W; Mon, 11 May 2020 03:15:31 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXyuY-0003NB-In; Mon, 11 May 2020 03:15:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B3601FB;
 Sun, 10 May 2020 20:15:20 -0700 (PDT)
Received: from [10.163.72.179] (unknown [10.163.72.179])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F18C63F305;
 Sun, 10 May 2020 20:15:09 -0700 (PDT)
Subject: Re: [PATCH V3 2/3] mm/hugetlb: Define a generic fallback for
 is_hugepage_only_range()
To: Mike Kravetz <mike.kravetz@oracle.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <1588907271-11920-1-git-send-email-anshuman.khandual@arm.com>
 <1588907271-11920-3-git-send-email-anshuman.khandual@arm.com>
 <9fc622e1-45ff-b79f-ebe0-35614837456c@oracle.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <c21ab871-da06-baf6-ba31-80b13402b8c9@arm.com>
Date: Mon, 11 May 2020 08:44:39 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <9fc622e1-45ff-b79f-ebe0-35614837456c@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200510_201522_731996_C236D91D 
X-CRM114-Status: GOOD (  16.54  )
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Fenghua Yu <fenghua.yu@intel.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On 05/09/2020 03:52 AM, Mike Kravetz wrote:
> On 5/7/20 8:07 PM, Anshuman Khandual wrote:
>> There are multiple similar definitions for is_hugepage_only_range() on
>> various platforms. Lets just add it's generic fallback definition for
>> platforms that do not override. This help reduce code duplication.
>>
>> Cc: Russell King <linux@armlinux.org.uk>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Tony Luck <tony.luck@intel.com>
>> Cc: Fenghua Yu <fenghua.yu@intel.com>
>> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
>> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
>> Cc: Helge Deller <deller@gmx.de>
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> Cc: Paul Mackerras <paulus@samba.org>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Paul Walmsley <paul.walmsley@sifive.com>
>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
>> Cc: Vasily Gorbik <gor@linux.ibm.com>
>> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
>> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
>> Cc: Rich Felker <dalias@libc.org>
>> Cc: "David S. Miller" <davem@davemloft.net>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Ingo Molnar <mingo@redhat.com>
>> Cc: Borislav Petkov <bp@alien8.de>
>> Cc: "H. Peter Anvin" <hpa@zytor.com>
>> Cc: Mike Kravetz <mike.kravetz@oracle.com>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: x86@kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-ia64@vger.kernel.org
>> Cc: linux-mips@vger.kernel.org
>> Cc: linux-parisc@vger.kernel.org
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: linux-riscv@lists.infradead.org
>> Cc: linux-s390@vger.kernel.org
>> Cc: linux-sh@vger.kernel.org
>> Cc: sparclinux@vger.kernel.org
>> Cc: linux-mm@kvack.org
>> Cc: linux-arch@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>  arch/arm/include/asm/hugetlb.h     | 6 ------
>>  arch/arm64/include/asm/hugetlb.h   | 6 ------
>>  arch/ia64/include/asm/hugetlb.h    | 1 +
>>  arch/mips/include/asm/hugetlb.h    | 7 -------
>>  arch/parisc/include/asm/hugetlb.h  | 6 ------
>>  arch/powerpc/include/asm/hugetlb.h | 1 +
>>  arch/riscv/include/asm/hugetlb.h   | 6 ------
>>  arch/s390/include/asm/hugetlb.h    | 7 -------
>>  arch/sh/include/asm/hugetlb.h      | 6 ------
>>  arch/sparc/include/asm/hugetlb.h   | 6 ------
>>  arch/x86/include/asm/hugetlb.h     | 6 ------
>>  include/linux/hugetlb.h            | 9 +++++++++
>>  12 files changed, 11 insertions(+), 56 deletions(-)
>>
> <snip>
>> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
>> index 43a1cef8f0f1..c01c0c6f7fd4 100644
>> --- a/include/linux/hugetlb.h
>> +++ b/include/linux/hugetlb.h
>> @@ -591,6 +591,15 @@ static inline unsigned int blocks_per_huge_page(struct hstate *h)
>>  
>>  #include <asm/hugetlb.h>
>>  
>> +#ifndef is_hugepage_only_range
>> +static inline int is_hugepage_only_range(struct mm_struct *mm,
>> +					unsigned long addr, unsigned long len)
>> +{
>> +	return 0;
>> +}
>> +#define is_hugepage_only_range is_hugepage_only_range
>> +#endif
>> +
>>  #ifndef arch_make_huge_pte
>>  static inline pte_t arch_make_huge_pte(pte_t entry, struct vm_area_struct *vma,
>>  				       struct page *page, int writable)
>>
> 
> Did you try building without CONFIG_HUGETLB_PAGE defined?  I'm guessing

Yes I did for multiple platforms (s390, arm64, ia64, x86, powerpc etc).

> that you need a stub for is_hugepage_only_range().  Or, perhaps add this
> to asm-generic/hugetlb.h?
> 
There is already a stub (include/linux/hugetlb.h) when !CONFIG_HUGETLB_PAGE.

