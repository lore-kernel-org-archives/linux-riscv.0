Return-Path: <SRS0=LzlR=MY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C950FC6783C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Oct 2018 14:49:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E8D12098A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Oct 2018 14:49:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qII1YbrP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E8D12098A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kot-begemot.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z5GEX8DC5w8Bv5HDFW4eaipBd8k4Y2w7knwszlqmMQs=; b=qII1YbrP8/e4lUvOBvuSSSGLy
	WRglxMAdOAPfG3SS8b8wZxKeBgRwNpQAPP0lzwAh2eXWA7cK8COX2VwEF51RhRYcEsEbo5+3EiHCD
	pR2dtl7fCMtMQaTXSk7wUuzAbDWu+wcyVuwD4jceckW5fH12Ids6VoQhw06n4VLRUeFz6kNwEL7jt
	UWCxuCWln+Y2El2WPXsGgRDTyUhO03EeKM9+rMa1trvwOEQaVBlIMuV3rWVcKErWxXluetviCWFio
	A/X7JgCbCIvqMUOb1pnAKBFPSukvjI1jR6okylRJoE6smEiS5LJ5rn8T+1ElwIu8WoT9LlOxTj/zE
	gcATHYaeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gAyl3-0000ze-04; Fri, 12 Oct 2018 14:49:41 +0000
Received: from ivanoab6.miniserver.com ([5.153.251.140]
 helo=www.kot-begemot.co.uk)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAykh-0000ky-Kl; Fri, 12 Oct 2018 14:49:31 +0000
Received: from [192.168.17.6] (helo=smaug.kot-begemot.co.uk)
 by www.kot-begemot.co.uk with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <anton.ivanov@kot-begemot.co.uk>)
 id 1gAyjg-0002yC-S2; Fri, 12 Oct 2018 14:48:16 +0000
Received: from wyvern.kot-begemot.co.uk ([192.168.3.72])
 by smaug.kot-begemot.co.uk with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <anton.ivanov@kot-begemot.co.uk>)
 id 1gAyjg-0005U0-9X; Fri, 12 Oct 2018 15:48:16 +0100
Subject: Re: [PATCH v2 2/2] mm: speed up mremap by 500x on large regions
To: "Kirill A. Shutemov" <kirill@shutemov.name>
References: <20181012013756.11285-1-joel@joelfernandes.org>
 <20181012013756.11285-2-joel@joelfernandes.org>
 <9ed82f9e-88c4-8e4f-8c45-3ef153469603@kot-begemot.co.uk>
 <20181012143728.t42uvr6etg7gp7fh@kshutemo-mobl1>
From: Anton Ivanov <anton.ivanov@kot-begemot.co.uk>
Message-ID: <4dd52e22-5b51-9b30-7178-fde603a08f88@kot-begemot.co.uk>
Date: Fri, 12 Oct 2018 15:48:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181012143728.t42uvr6etg7gp7fh@kshutemo-mobl1>
Content-Language: en-US
X-Clacks-Overhead: GNU Terry Pratchett
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181012_074919_873651_FD779865 
X-CRM114-Status: GOOD (  23.03  )
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
Cc: linux-mips@linux-mips.org, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Will Deacon <will.deacon@arm.com>,
 mhocko@kernel.org, linux-mm@kvack.org, lokeshgidra@google.com,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 linux-riscv@lists.infradead.org, elfring@users.sourceforge.net,
 Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org, dancol@google.com,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 hughd@google.com, "James E.J. Bottomley" <jejb@parisc-linux.org>,
 kasan-dev@googlegroups.com, kvmarm@lists.cs.columbia.edu,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, linux-snps-arc@lists.infradead.org,
 kernel-team@android.com, Sam Creasey <sammy@sammy.net>,
 linux-xtensa@linux-xtensa.org, Jeff Dike <jdike@addtoit.com>,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Julia Lawall <Julia.Lawall@lip6.fr>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, nios2-dev@lists.rocketboards.org,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Tony Luck <tony.luck@intel.com>, linux-parisc@vger.kernel.org,
 pantin@google.com, linux-kernel@vger.kernel.org,
 Fenghua Yu <fenghua.yu@intel.com>, minchan@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Richard Weinberger <richard@nod.at>,
 sparclinux@vger.kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Ley Foon Tan <lftan@altera.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181012144815.83z_mSWcqzalmkhab89YPVZ1bC1B2PlRzsMBTI_qMt4@z>

On 12/10/2018 15:37, Kirill A. Shutemov wrote:
> On Fri, Oct 12, 2018 at 03:09:49PM +0100, Anton Ivanov wrote:
>> On 10/12/18 2:37 AM, Joel Fernandes (Google) wrote:
>>> Android needs to mremap large regions of memory during memory management
>>> related operations. The mremap system call can be really slow if THP is
>>> not enabled. The bottleneck is move_page_tables, which is copying each
>>> pte at a time, and can be really slow across a large map. Turning on THP
>>> may not be a viable option, and is not for us. This patch speeds up the
>>> performance for non-THP system by copying at the PMD level when possible.
>>>
>>> The speed up is three orders of magnitude. On a 1GB mremap, the mremap
>>> completion times drops from 160-250 millesconds to 380-400 microseconds.
>>>
>>> Before:
>>> Total mremap time for 1GB data: 242321014 nanoseconds.
>>> Total mremap time for 1GB data: 196842467 nanoseconds.
>>> Total mremap time for 1GB data: 167051162 nanoseconds.
>>>
>>> After:
>>> Total mremap time for 1GB data: 385781 nanoseconds.
>>> Total mremap time for 1GB data: 388959 nanoseconds.
>>> Total mremap time for 1GB data: 402813 nanoseconds.
>>>
>>> Incase THP is enabled, the optimization is skipped. I also flush the
>>> tlb every time we do this optimization since I couldn't find a way to
>>> determine if the low-level PTEs are dirty. It is seen that the cost of
>>> doing so is not much compared the improvement, on both x86-64 and arm64.
>>>
>>> Cc: minchan@kernel.org
>>> Cc: pantin@google.com
>>> Cc: hughd@google.com
>>> Cc: lokeshgidra@google.com
>>> Cc: dancol@google.com
>>> Cc: mhocko@kernel.org
>>> Cc: kirill@shutemov.name
>>> Cc: akpm@linux-foundation.org
>>> Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
>>> ---
>>>    mm/mremap.c | 62 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>>>    1 file changed, 62 insertions(+)
>>>
>>> diff --git a/mm/mremap.c b/mm/mremap.c
>>> index 9e68a02a52b1..d82c485822ef 100644
>>> --- a/mm/mremap.c
>>> +++ b/mm/mremap.c
>>> @@ -191,6 +191,54 @@ static void move_ptes(struct vm_area_struct *vma, pmd_t *old_pmd,
>>>    		drop_rmap_locks(vma);
>>>    }
>>> +static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
>>> +		  unsigned long new_addr, unsigned long old_end,
>>> +		  pmd_t *old_pmd, pmd_t *new_pmd, bool *need_flush)
>>> +{
>>> +	spinlock_t *old_ptl, *new_ptl;
>>> +	struct mm_struct *mm = vma->vm_mm;
>>> +
>>> +	if ((old_addr & ~PMD_MASK) || (new_addr & ~PMD_MASK)
>>> +	    || old_end - old_addr < PMD_SIZE)
>>> +		return false;
>>> +
>>> +	/*
>>> +	 * The destination pmd shouldn't be established, free_pgtables()
>>> +	 * should have release it.
>>> +	 */
>>> +	if (WARN_ON(!pmd_none(*new_pmd)))
>>> +		return false;
>>> +
>>> +	/*
>>> +	 * We don't have to worry about the ordering of src and dst
>>> +	 * ptlocks because exclusive mmap_sem prevents deadlock.
>>> +	 */
>>> +	old_ptl = pmd_lock(vma->vm_mm, old_pmd);
>>> +	if (old_ptl) {
>>> +		pmd_t pmd;
>>> +
>>> +		new_ptl = pmd_lockptr(mm, new_pmd);
>>> +		if (new_ptl != old_ptl)
>>> +			spin_lock_nested(new_ptl, SINGLE_DEPTH_NESTING);
>>> +
>>> +		/* Clear the pmd */
>>> +		pmd = *old_pmd;
>>> +		pmd_clear(old_pmd);
>>> +
>>> +		VM_BUG_ON(!pmd_none(*new_pmd));
>>> +
>>> +		/* Set the new pmd */
>>> +		set_pmd_at(mm, new_addr, new_pmd, pmd);
>> UML does not have set_pmd_at at all
> Every architecture does. :)

I tried to build it patching vs 4.19-rc before I made this statement and 
ran into that.

Presently it does not.

https://elixir.bootlin.com/linux/v4.19-rc7/ident/set_pmd_at - UML is not 
on the list.

>
> But it may come not from the arch code.

There is no generic definition as far as I can see. All 12 defines in 
4.19 are in arch specific code. Unless i am missing something...

>
>> If I read the code right, MIPS completely ignores the address argument so
>> set_pmd_at there may not have the effect which this patch is trying to
>> achieve.
> Ignoring address is fine. Most architectures do that..
> The ideas is to move page table to the new pmd slot. It's nothing to do
> with the address passed to set_pmd_at().

If that is it's only function, then I am going to appropriate the code 
out of the MIPS tree for further uml testing. It does exactly that - 
just move the pmd the new slot.

>
A.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
