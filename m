Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F401C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 21:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8tU3sFOEI9T9S6vSj42C+SwRwDilR5DL5BGDvQ6Na4Y=; b=ODe6MjJFcyA1yr
	i8kidMhxaXLpnoh5x5/l97wW01hrxKMwN9QldXZSITzQILT/iL1jQ4XkLlCRgus15vb4S+JL03SWE
	LTt2C3JKOZ0150U6gbGen/2CGa9Yx0hGqtSpq7M5gF6Aw58jmJebeGp5wHR5nlGoyeHK9105gO99N
	VU3459GagfxLfD5oueaLptk27DxP09r5znB9PcmPl/Eb+3zcT642h9i/95oRvDsfXaaCwpFRB5qi8
	G5RMMzm9IfxzYGs0pTLQlV1u6dRAE8LDNvKDD3/G5IkQiLn09maLqOdPkckH5pgQq0W+ysxl8NcVz
	NiW5E20qUfj8+5tYukiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL9CG-00CCUa-1r;
	Wed, 03 Jan 2024 21:54:44 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL9CD-00CCT4-0S;
	Wed, 03 Jan 2024 21:54:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 83382B8161D;
	Wed,  3 Jan 2024 21:54:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD1BC433C8;
	Wed,  3 Jan 2024 21:54:34 +0000 (UTC)
Date: Wed, 3 Jan 2024 21:54:32 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Nadav Amit <namit@vmware.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, Yu Zhao <yuzhao@google.com>,
	x86@kernel.org
Subject: Re: [PATCH 1/2] mm/tlb: fix fullmm semantics
Message-ID: <ZZXXmFthrXO6G9OE@arm.com>
References: <20231228084642.1765-1-jszhang@kernel.org>
 <20231228084642.1765-2-jszhang@kernel.org>
 <ZZWh4c3ZUtadFqD1@arm.com>
 <6ee6340a-ffe2-4106-b845-47cf443558c3@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6ee6340a-ffe2-4106-b845-47cf443558c3@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_135441_335691_9F8EECE2 
X-CRM114-Status: GOOD (  15.82  )
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

On Wed, Jan 03, 2024 at 12:26:29PM -0800, Dave Hansen wrote:
> On 1/3/24 10:05, Catalin Marinas wrote:
> >> --- a/mm/mmu_gather.c
> >> +++ b/mm/mmu_gather.c
> >> @@ -384,7 +384,7 @@ void tlb_finish_mmu(struct mmu_gather *tlb)
> >>  		 * On x86 non-fullmm doesn't yield significant difference
> >>  		 * against fullmm.
> >>  		 */
> >> -		tlb->fullmm = 1;
> >> +		tlb->need_flush_all = 1;
> >>  		__tlb_reset_range(tlb);
> >>  		tlb->freed_tables = 1;
> >>  	}
> > The optimisation here was added about a year later in commit
> > 7a30df49f63a ("mm: mmu_gather: remove __tlb_reset_range() for force
> > flush"). Do we still need to keep freed_tables = 1 here? I'd say only
> > __tlb_reset_range().
> 
> I think the __tlb_reset_range() can be dangerous if it clears
> ->freed_tables.  On x86 at least, it might lead to skipping the TLB IPI
> for CPUs that are in lazy TLB mode.  When those wake back up they might
> start using the freed page tables.

You are right, I did not realise freed_tables is reset in
__tlb_reset_range().

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
