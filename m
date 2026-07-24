Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6320C531C9
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 16:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dPKKtqOgIiy50Q4rsWeNgD42ZVuh7l2QgxZ96ypUVJI=; b=hcbsP7XkEZOw3B
	rikr/msBTEvyk1AwiGE1VkTN9Pp1/YlBWo0pCg2VIib4Ph2gjEYlDWqAJ8BXPeQ1TdJrab2TwAX55
	wKzJXWE/e3s8dhKyOIAhqWEqM76zdDC6/O5eNJPsS+q3SNsjMGQ1fGsNT8Qi10Pxt/GvceWhfuLtW
	Ei+kW5ROctB2T5MtVbSNDQBNRKr2gDQrj5qXK6Q7KodOv6s5IqRZOzgzb7FHklcVIPyNC2dAZhKbl
	8TUuPxG+xAcaVlnRtIgZb7kGDNBDlbgu5u9fQZ0wQEMp5b2ThPIKeFJSuneyedrbwIXxpxsL4MEA0
	X3pPPMsIWvafu8ciQKsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIfk-0000000GpAN-1ZPz;
	Fri, 24 Jul 2026 16:22:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIfh-0000000Gp9k-0LIX;
	Fri, 24 Jul 2026 16:22:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 843141477;
	Fri, 24 Jul 2026 09:22:38 -0700 (PDT)
Received: from [10.57.0.90] (unknown [10.57.0.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7856F3F66F;
	Fri, 24 Jul 2026 09:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784910162; bh=FFVNLm6cUPe+DY2rkf5pd5Leq74yf6D6PzaUiEZnC0A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R7MxYTQE16B+EFlZhAFNzpK/0UI6uEPH8HK6SGQ5hyeqeT6j8iAR77v5YY2NfW/d4
	 wGXOQqyKivCn5JH5gQtKtNPWqOLpyczrOtSk5oCk0yNFOuS6VkPHifDvbrYCkTP2w8
	 btuF4jwwRwcKGtleKvrCkdzLvz40C3HZ61djVm00=
Message-ID: <54805074-0512-447f-bf13-d19551953d41@arm.com>
Date: Fri, 24 Jul 2026 18:22:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/22] mm: introduce MMF_KERNEL flag and set it for
 init_mm
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Dave Hansen <dave.hansen@intel.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Pasha Tatashin <pasha.tatashin@soleen.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, linux-arm-kernel@lists.infradead.org,
 Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
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
 <20260714-remove_pgtable_cdtor-v1-3-44be8a7685d7@arm.com>
 <71045fa8-89fe-4a0b-a05b-67e19ce89834@intel.com> <alZOs30ziqa7l_Lq@lucifer>
 <5ce00109-c0ea-43f0-881d-f58a0fda8dcb@arm.com>
 <0bab816d-5de9-4814-b97d-11e89322c413@kernel.org>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <0bab816d-5de9-4814-b97d-11e89322c413@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_092249_333886_09722104 
X-CRM114-Status: GOOD (  20.01  )
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

On 21/07/2026 17:04, David Hildenbrand (Arm) wrote:
> On 7/16/26 11:33, Kevin Brodsky wrote:
>> On 14/07/2026 17:04, Lorenzo Stoakes (ARM) wrote:
>>> On Tue, Jul 14, 2026 at 07:47:43AM -0700, Dave Hansen wrote:
>>>> Could we give this some nice comments explaining what a kernel mm is,
>>>> please? Part of the problem with the init_mm checks is that they're
>>>> magic and it's not always clear what's special about init_mm.
>> Agreed, we need to define what this property means exactly, and your
>> comments on patch 14 show that extending it to efi_mm isn't necessarily
>> as benign as it appeared to me at first.
>>
>> My motivation really is about how page tables are handled (in particular
>> whether ptlocks are used), so as you suggested on patch 19 maybe this
>> flag should be narrower in scope, and the naming should reflect it.
>> Possibly MMF_KERNEL_PGTABLES? That's at least one thing that should be
>> true of all of init_mm, efi_mm and tboot_mm: their page tables use
>> kernel permissions, not user, and should follow the same rules including
>> not using ptlocks.
>>
>>>> Maybe start with this list?
>>>>
>>>> 1. There's only one of them.
>>>> 2. All kernel threads share it. tsk->mm is the same for all kernel
>>>>    threads.
>>>> 3. It holds the reference copy of the kernel page tables
>>>> 4. Userspace can't be entered when it is the current mm
>>>> 5. It has different TLB flushing rules than userspace mms
>>>>
>>>> I _think_ those are universal across all architectures.
>>> Well point 1 isn't true of efimm or tboot_mm so we possibly need a better
>>> name :)
>>>
>>> "Special" is overloaded too much already. I quite like "eternal" so:
>>>
>>> 	static inline bool mm_is_eternal(const struct mm_struct *mm)
>>> 	{
>>> 		return mm && mm_flags_test(MMF_ETERNAL, mm);
>>> 	}
>> Cheeky but why not! I do wonder whether this conveys the right idea
>> though. The main point of this flag is that page tables are
>> allocated/initialised/locked differently; in principle you could have a
>> temporary non-user mm.
> I mean, we talk about MMs that are not used for actual user space processes?
>
> IOW, the following:
>
> arch/x86/kernel/tboot.c:static struct mm_struct tboot_mm = {
> drivers/firmware/efi/efi.c:struct mm_struct efi_mm = {
> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:static struct mm_struct sva_mm = {
> mm/init-mm.c:struct mm_struct init_mm = {
>
>
> So "user" vs. "kernel" is quite intuitive. Sure, there can be multiple
> "kernel" ones, but each with a distinct purpose (IOW, we don't have multiple init_mm MMs).

That was my rationale as well - anything that isn't a user mm is a
kernel mm, in the sense that it owns kernel-space page tables.

However if we reduce the scope of the flag as per Dave Hansen's
feedback, maybe MMF_KERNEL_PGTABLES is more appropriate. I think it's a
question of whether we want to keep this flag with a narrow scope
(strictly about page table handling), or possibly widen it later.

- Kevin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
