Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0BBCCFA04
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 19:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mb2M+hBzyU0ruZ2NhAMeqIpFJ1zuynIY0UZPS6FdlJE=; b=BRITxKqCXgYc35
	Sf4uibDSUZrycS4e3z1XdF2L+8BZXrTfpDsB+4y1pLXUHb6bOWNe7kmJeG04ZZqUN/FaokzLnrBpI
	Z2+PIL9f1TNwWondvKIcw9NmqgfN/T/6wS+yfKgCpWXE5QTGMu8lYZfon0yggEnXj3l4BA36uWrcf
	tY4ngQ6/wFmOq0Jo6KMa0y+W6UUgfmR8Va3y/yb3NYyBMZHwRD5UoBEemQEQNTqC0oxZMlyTxx/CV
	ruBu0xP8JUOIaINLC5+mPrGXra8A5DUIab19kk/NtXNsy8F9Upw5Og0aRZ8A4YBsigAEwcCtD4lNA
	ynfnEBUu8euYxfgswNvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGMZ3-0000000CTrF-2vsl;
	Tue, 04 Nov 2025 19:19:33 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGMZ0-0000000CTqz-3WRt;
	Tue, 04 Nov 2025 19:19:30 +0000
Message-ID: <eb1411af-ed57-4e18-95c1-33ed70a5d488@infradead.org>
Date: Tue, 4 Nov 2025 11:19:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/15] iommupt: Add read_and_clear_dirty op
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
 Justin Stitt <justinstitt@google.com>, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
 llvm@lists.linux.dev, Bill Wendling <morbo@google.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <pjw@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Shuah Khan <shuah@kernel.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Will Deacon <will@kernel.org>, Alexey Kardashevskiy <aik@amd.com>,
 Alejandro Jimenez <alejandro.j.jimenez@oracle.com>,
 James Gowans <jgowans@amazon.com>, Kevin Tian <kevin.tian@intel.com>,
 Michael Roth <michael.roth@amd.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
 Samiullah Khawaja <skhawaja@google.com>, Vasant Hegde <vasant.hegde@amd.com>
References: <8-v8-d50aeee4481d+55efb-iommu_pt_jgg@nvidia.com>
 <5c0e6abd-f217-4361-b5bd-99f31c9094a7@infradead.org>
 <20251104191723.GB1678406@nvidia.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251104191723.GB1678406@nvidia.com>
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



On 11/4/25 11:17 AM, Jason Gunthorpe wrote:
> On Tue, Nov 04, 2025 at 11:13:06AM -0800, Randy Dunlap wrote:
>>
>>
>> On 11/4/25 10:30 AM, Jason Gunthorpe wrote:
>>> +/**
>>> + * read_and_clear_dirty() - Manipulate the HW set write dirty state
>>> + * @domain: Domain to manipulate
>>> + * @iova: IO virtual address to start
>>> + * @size: Length of the IOVA
>>> + * @flags: A bitmap of IOMMU_DIRTY_NO_CLEAR
>>> + * @dirty: Place to store the dirty bits
>>> + *
>>> + * Iterate over all the entries in the mapped range and record their write dirty
>>> + * status in iommu_dirty_bitmap. If IOMMU_DIRTY_NO_CLEAR is not specified then
>>> + * the entries will be left dirty, otherwise they are returned to being not
>>> + * write dirty.
>>> + *
>>> + * Context: The caller must hold a read range lock that includes @iova.
>>> + *
>>> + * Returns: -ERRNO on failure, 0 on success.
>>> + */
>>> +int DOMAIN_NS(read_and_clear_dirty)(struct iommu_domain *domain,
>>> +				    unsigned long iova, size_t size,
>>> +				    unsigned long flags,
>>> +				    struct iommu_dirty_bitmap *dirty)
>>> +{
>>
>> Just FYI:
>>
>> I guess that a function with DOMAIN_NS() is going to confuse
>> scripts/kernel-doc.py.
>>
>> From patch 3 of this series:
>>
>> +#define DOMAIN_NS(op) CONCATENATE(CONCATENATE(pt_iommu_, PTPFX), op)
> 
> Yeah, I don't think kdoc is pointed at this file. Still need to
> document the function though..

OK, sounds good.

-- 
~Randy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
