Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E545C531C9
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 16:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UKU0iTFiwIE30qKkR9eRPfJxw7IlRUAe1r8/t/uQoB0=; b=EdOfI4kX2jQfs2
	ktlvnDl92y1J50djbusnYim+C2F30VWTSDXJiQut4RWRZarG4kfnHaLRGoP0V3LKvubeKaPJ2vBNK
	NGqMaKjxj6GEwpe0zcyIqxahyb2SZ6cZZL7g4KYENmKz3rq3oTAOPXhKYFALWQ1IT212AnzEj7RiH
	byJrET+Jo4t66ZoffiVz0pRj5dxX/q8XSDCJxBAxSRbk1RhBMyD5ktTH7SM6cG1LEG5KRPgC5pxdl
	TEsbv8XAE50K+Ro2TgAthrNo9RGAYhgK6aTi9vDza6NZMFSEaebrL1NEqcNHBZ0JwtJrDK4vkAsd2
	ju5uainur/MpLG1MiGGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIft-0000000GpDR-2yjo;
	Fri, 24 Jul 2026 16:23:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIfq-0000000GpCN-2gdU;
	Fri, 24 Jul 2026 16:23:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 930E91684;
	Fri, 24 Jul 2026 09:22:52 -0700 (PDT)
Received: from [10.57.0.90] (unknown [10.57.0.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C7F03F66F;
	Fri, 24 Jul 2026 09:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784910176; bh=C02uWs/fpXnABbH43y4jX8fXPGtwBqhc0kWtZDPeayg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iUC98dpbFgd+i9SnSkYL0GKvWGOk7xpTRmX2UXYjyfh9B/6bLE/WuAx7CloLocREN
	 hl9aaz1HKjYAaCZbwP0FbaUIknYs8KANk5nrYXdBG0Da9JXUPnYnhocq3QUWcdY9Et
	 OVQZdbXfa8qUjKcrVhyZR4pIQLBjcpiml/L4ONBo=
Message-ID: <d312f635-7c34-4452-b879-d29137a7f450@arm.com>
Date: Fri, 24 Jul 2026 18:22:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/22] mm: use mm_is_kernel() in generic page table code
To: "David Hildenbrand (Arm)" <david@kernel.org>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, linux-arm-kernel@lists.infradead.org,
 Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, linux-s390@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, sparclinux@vger.kernel.org,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>, linux-um@lists.infradead.org,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Ning Sun <ning.sun@intel.com>,
 x86@kernel.org, tboot-devel@lists.sourceforge.net,
 Ard Biesheuvel <ardb@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-efi@vger.kernel.org,
 Vishal Moola <vishal.moola@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
References: <20260714-remove_pgtable_cdtor-v1-0-44be8a7685d7@arm.com>
 <20260714-remove_pgtable_cdtor-v1-4-44be8a7685d7@arm.com>
 <02565237-d777-4c63-8b17-817df59feac4@arm.com>
 <0d75daa4-a034-4094-bce5-57938d294163@kernel.org>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <0d75daa4-a034-4094-bce5-57938d294163@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_092258_950054_60996F26 
X-CRM114-Status: GOOD (  11.59  )
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

On 21/07/2026 17:07, David Hildenbrand (Arm) wrote:
> On 7/16/26 11:35, Kevin Brodsky wrote:
>> On 14/07/2026 16:03, Kevin Brodsky wrote:
>>> diff --git a/mm/memory.c b/mm/memory.c
>>> index d5e87624f692..c0244c0b0756 100644
>>> --- a/mm/memory.c
>>> +++ b/mm/memory.c
>>> @@ -3394,13 +3394,13 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
>>>  	spinlock_t *ptl;
>>>  
>>>  	if (create) {
>>> - mapped_pte = pte = (mm == &init_mm) ?
>>> + mapped_pte = pte = mm_is_kernel(mm) ?
>>>  			pte_alloc_kernel_track(pmd, addr, mask) :
>>>  			pte_alloc_map_lock(mm, pmd, addr, &ptl);
>> As noted by Sashiko, this is a little problematic because if
>> apply_to_page_range() is called on efi_mm, then we will end up with
>> __pte_alloc_kernel() taking the init_mm lock, since that's hardcoded.
>>
>> That probably means we should pass the mm to __pte_alloc_kernel().
> Agreed.
>
> I guess we have to audit all existing init_mm usage?

Indeed, I looked through comparisons with &init_mm but really all
references to init_mm should be checked. Will do for v2.

- Kevin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
