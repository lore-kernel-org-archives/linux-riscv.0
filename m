Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EF1CF58F5
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Sep 2024 09:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hKMkKSzJTuF+UHuMCS6oPBiDTJiix01A0rxWOdhCP6A=; b=t3Kp4C1tUwwJjJ
	nOnBKXbiPmBxxdsxiA7gPsK6rkC2ZlrZSJPWpNjge3HXauyHYCuCOxXaMoGPNQeTsQrpZB4NDc1x4
	uHiIwN5vjJlZTf8VdUkG/UUgKRc0oOZaGYnfwa2OkVGHx13u+ge7uoeb0UT9IYdCAPPv70c6657ia
	Cg6TNNyyabgakZALWtTp03BXr47drJKOP0HQ/qq016rucgTCHZTOatpZUcMOY21Q0ZwSFxbvyHqGJ
	q9qYX+c6xAVQOKMv114nzsPBO1HoSnjVinvevea07UqtEHf5GTwC8ceNb5WDZcsCfjQmv0RCcSp9h
	+Ue7Qoa+UMvxaj9ss9hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srZvN-0000000BvVD-0KRP;
	Fri, 20 Sep 2024 09:27:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srZvK-0000000BvUr-2v8X
	for linux-riscv@lists.infradead.org;
	Fri, 20 Sep 2024 09:27:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24B7E1007;
	Fri, 20 Sep 2024 02:28:03 -0700 (PDT)
Received: from [10.163.35.184] (unknown [10.163.35.184])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C21993F66E;
	Fri, 20 Sep 2024 02:27:27 -0700 (PDT)
Message-ID: <89806be0-c95d-4a85-a8da-a253aea68093@arm.com>
Date: Fri, 20 Sep 2024 14:57:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: Move set_pxd_safe() helpers from generic to platform
To: Dave Hansen <dave.hansen@intel.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@linutronix.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 x86@kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240920053017.2514920-1-anshuman.khandual@arm.com>
 <3309e9ca-458b-4b10-8409-9fe315b60ae2@intel.com>
 <925a26e2-bd53-4bf4-b22d-7a0e11581376@arm.com>
 <2924c274-2b01-4b33-87e7-5b66aceba3b0@intel.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <2924c274-2b01-4b33-87e7-5b66aceba3b0@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_022734_819433_D7E7DABC 
X-CRM114-Status: GOOD (  11.35  )
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



On 9/20/24 14:22, Dave Hansen wrote:
> On 9/19/24 23:42, Anshuman Khandual wrote:
>>> I just did a quick grep and don't see any difference between the _safe
>>> and normal variants.  A quick grep didn't turn up any actual users.
>>>
>>> Did anyone actually double check that these are still needed on x86 in
>>> the first place?
>> arch/x86/mm/init_64.c
> 
> Ahh, the #defines make them immune to grep. :)
> 
> Long-term, we should make sure these are still necessary.  Short term

Agreed, David H has also mentioned about that.

> (in this patch), please just put the #defines in init_64.c if it is the
> only site that needs them.

That is not the only site where they get used. set_pmd/pud/p4d/pgd_safe()
are also called from respective pmd/pud/p4d/pgd_populate_safe() helpers
in the header arch/x86/include/asm/pgalloc.h.

Besides also hit a road block in converting these macros as static inline
functions as suggested by David H earlier, because pmd/pud/p4d/pgd_same()
macros are defined in include/linux/pgtable.h, way after <asm/pgtable.h>
gets included.

I guess we will have just leave these macros is in arch/x86/include/asm/pgtable.h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
