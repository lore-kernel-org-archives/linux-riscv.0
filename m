Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A3CC02183
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 13:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mazk0HqRjP8rIoT3kcpzB5TOzN9bfovrbcM1vlUzVOg=; b=b543jyudYIR6zU
	AaiMkF3BrzH72jS2Fac4FeYw67d2KvPUTGocj2VT4KOhIoG2gfmhO4nItsigrna6hCycSqxNovCM3
	G2biMitHnngnmHuBQeBtRFheDqapB4nfojYhZtYv6Tst9JeFUVti+5cyvmD9+9BzSjrgsr9YHJXYU
	opywtSDG/KEsSFOAMMB3d69HwVfayG+3071vnlgEdglYXlQ8aj+HGlzzNzAtpn0Jdb7ZbYvzTqKdj
	HZXXdf3IhUdIbpGIZqLYqOxfmufTY6MWxVHUJyrRBh6yiHjaWjDLS1hQZDA9ywCqyUPca8Zb3h8ue
	m+qpWXdGecOXT+he8+mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYmNG-00000000LgV-2t3V;
	Fri, 17 Jan 2025 13:26:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYmM0-00000000LTP-1Zwi;
	Fri, 17 Jan 2025 13:25:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D60BBA42C2C;
	Fri, 17 Jan 2025 13:23:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84C43C4CEDD;
	Fri, 17 Jan 2025 13:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737120338;
	bh=i5g2DbcJlsukG3CuQeCOvnrmGoI0+t7RerfHcE2ITE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nCvHMpF21/84VoMzTIfTmODZawDxjude8tCR6JJtkJECU6I5I9whWXy05LWEyoVNW
	 KSzrpuQi7EY7p8WZMS465l3rzsHJ8EnYeKCSayrYuWoVdpTDqvziBmoejLV5qSMBK6
	 f5E+BQjEiCRh0u6SKqq//93pPU+X4JoeMx70R+9aHhWo8pxelv+5LYbQpozArWbl4N
	 fjahkxBv/te1ioiDTpeoXYuLizhvr0ePIgbB6YsYdqX4IS/429ehvwWhMUBrLB8HOx
	 2ER9LwPKInXFc4sc8Z5xZ0s6RECYLRZli7PrwB954w5tTFqDoUfRjjNblQvSNEU4sb
	 Uskxi7/yiLEew==
Date: Fri, 17 Jan 2025 13:25:28 +0000
From: Will Deacon <will@kernel.org>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: peterz@infradead.org, agordeev@linux.ibm.com, kevin.brodsky@arm.com,
	alex@ghiti.fr, andreas@gaisler.com, palmer@dabbelt.com,
	tglx@linutronix.de, david@redhat.com, jannh@google.com,
	hughd@google.com, yuzhao@google.com, willy@infradead.org,
	muchun.song@linux.dev, vbabka@kernel.org,
	lorenzo.stoakes@oracle.com, akpm@linux-foundation.org,
	rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de,
	aneesh.kumar@kernel.org, npiggin@gmail.com,
	dave.hansen@linux.intel.com, rppt@kernel.org, ryan.roberts@arm.com,
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org
Subject: Re: [PATCH v5 05/17] arm64: pgtable: use mmu gather to free p4d
 level page table
Message-ID: <20250117132527.GA17058@willie-the-truck>
References: <cover.1736317725.git.zhengqi.arch@bytedance.com>
 <3fd48525397b34a64f7c0eb76746da30814dc941.1736317725.git.zhengqi.arch@bytedance.com>
 <20250113162600.GA14101@willie-the-truck>
 <a017d072-943f-4008-bb1d-7be438804a44@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a017d072-943f-4008-bb1d-7be438804a44@bytedance.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_052540_549076_650C0C40 
X-CRM114-Status: GOOD (  19.88  )
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

On Tue, Jan 14, 2025 at 10:26:54AM +0800, Qi Zheng wrote:
> Hi Will,
> 
> On 2025/1/14 00:26, Will Deacon wrote:
> > On Wed, Jan 08, 2025 at 02:57:21PM +0800, Qi Zheng wrote:
> > > Like other levels of page tables, also use mmu gather mechanism to free
> > > p4d level page table.
> > > 
> > > Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> > > Originally-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > > Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > ---
> > >   arch/arm64/include/asm/pgalloc.h |  1 -
> > >   arch/arm64/include/asm/tlb.h     | 14 ++++++++++++++
> > >   2 files changed, 14 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
> > > index 2965f5a7e39e3..1b4509d3382c6 100644
> > > --- a/arch/arm64/include/asm/pgalloc.h
> > > +++ b/arch/arm64/include/asm/pgalloc.h
> > > @@ -85,7 +85,6 @@ static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgdp, p4d_t *p4dp)
> > >   	__pgd_populate(pgdp, __pa(p4dp), pgdval);
> > >   }
> > > -#define __p4d_free_tlb(tlb, p4d, addr)  p4d_free((tlb)->mm, p4d)
> > >   #else
> > >   static inline void __pgd_populate(pgd_t *pgdp, phys_addr_t p4dp, pgdval_t prot)
> > >   {
> > > diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
> > > index a947c6e784ed2..445282cde9afb 100644
> > > --- a/arch/arm64/include/asm/tlb.h
> > > +++ b/arch/arm64/include/asm/tlb.h
> > > @@ -111,4 +111,18 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pudp,
> > >   }
> > >   #endif
> > > +#if CONFIG_PGTABLE_LEVELS > 4
> > > +static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4dp,
> > > +				  unsigned long addr)
> > > +{
> > > +	struct ptdesc *ptdesc = virt_to_ptdesc(p4dp);
> > > +
> > > +	if (!pgtable_l5_enabled())
> > > +		return;
> > > +
> > > +	pagetable_p4d_dtor(ptdesc);
> > > +	tlb_remove_ptdesc(tlb, ptdesc);
> > > +}
> > 
> > Should we update p4d_free() to call the destructor, too? It looks like
> > it just does free_page() atm.
> 
> The patch #3 introduces the generic p4d_free() and lets arm64 to use it.
> The patch #4 adds the destructor to generic p4d_free(). So IIUC, there
> is no problem here.

Sorry, I missed that. In which case:

Acked-by: Will Deacon <will@kernel.org>

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
