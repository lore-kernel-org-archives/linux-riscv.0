Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CBEC4706F
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 03:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OFGrv9MDMaQ58g0X4al9ZNKUqdM25p/4INEk0XOlVmg=; b=RhHzkFAUSNAGQn
	5SAKCok4tZl0hCWzvRcy0RF/N1kchKnYa7uFUcoGvR1NUkUSG6HFXPsLXLmiZtLkczrkDPV/fHBLk
	u/GIUIaLTkKnWhvg6GnsrzhakoLJaKp2PpyIfrF9W6/aF/uXo8YhiH4ZjlxhlFsgK8E9/bU9wvHw4
	3/f/UYUAEa4kwoQo8IHs11n+c7vZMdtCAV2naLS8iFam8qpI6dsxTi7H1cexCEMsA0cAkmR3hkklt
	+6TNoQK3U/gu71GBTmTpibI5L/udGZh5XRqlrg3/aLYrSup2XtmSBtWXar48mCE3Ad6fAjLTwJfim
	6xm2q4IDELNXHu9iVJRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKVPF-00711d-1G;
	Tue, 02 Jan 2024 03:25:29 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKVPC-00710T-1l;
	Tue, 02 Jan 2024 03:25:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 90600B80B26;
	Tue,  2 Jan 2024 03:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ABCFC433C7;
	Tue,  2 Jan 2024 03:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704165920;
	bh=o/p87hu05uv8+RjO26XUTaEkNHmf3m3Fyaag4qcW8jc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eFpz/HwQpMqLwV8rzZWW11P6Dv8qkJCFf/jA3j9XCkL7/ypnfinGbNA8QHws0wBUj
	 wgYpbC096foRDJI1zKTYJ+eFZJ23P+/seKkF0K4GTanOpPW4trwk21boCAcz7rH1jt
	 W+GOyIlUPV6uRl7EeHQJKqaxDMweOKubhk89NArt78GqNR/QEireW4+2vfU/+/Gl8T
	 9h3MA9fZK4+f/aGVWSTsy+LklekVjKO/0rJ1AUq7faP+1ZbPJ/3BaPUo/CQakpck/2
	 ifxd8ipDb53P3TKakbMzxyGG51wiXE3sikJoFCMGAVs+LwB18YNYXyGG7z3wgoqls3
	 TENkP7y2dOl1Q==
Date: Tue, 2 Jan 2024 11:12:32 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/2] riscv: tlb: avoid tlb flushing if fullmm == 1
Message-ID: <ZZN/IKBgbtyIc+NL@xhacker>
References: <20231228084642.1765-1-jszhang@kernel.org>
 <20231228084642.1765-3-jszhang@kernel.org>
 <e227f095-0c3d-43c4-8ba3-8ec1b925b929@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e227f095-0c3d-43c4-8ba3-8ec1b925b929@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240101_192526_721129_585BD4E7 
X-CRM114-Status: GOOD (  23.82  )
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

On Sat, Dec 30, 2023 at 07:26:11PM +0100, Alexandre Ghiti wrote:
> Hi Jisheng,

Hi Alex,

> 
> On 28/12/2023 09:46, Jisheng Zhang wrote:
> > The mmu_gather code sets fullmm=1 when tearing down the entire address
> > space for an mm_struct on exit or execve. So if the underlying platform
> > supports ASID, the tlb flushing can be avoided because the ASID
> > allocator will never re-allocate a dirty ASID.
> > 
> > Use the performance of Process creation in unixbench on T-HEAD TH1520
> > platform is improved by about 4%.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >   arch/riscv/include/asm/tlb.h | 9 +++++++++
> >   1 file changed, 9 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/tlb.h b/arch/riscv/include/asm/tlb.h
> > index 1eb5682b2af6..35f3c214332e 100644
> > --- a/arch/riscv/include/asm/tlb.h
> > +++ b/arch/riscv/include/asm/tlb.h
> > @@ -12,10 +12,19 @@ static void tlb_flush(struct mmu_gather *tlb);
> >   #define tlb_flush tlb_flush
> >   #include <asm-generic/tlb.h>
> > +#include <asm/mmu_context.h>
> >   static inline void tlb_flush(struct mmu_gather *tlb)
> >   {
> >   #ifdef CONFIG_MMU
> > +	/*
> > +	 * If ASID is supported, the ASID allocator will either invalidate the
> > +	 * ASID or mark it as used. So we can avoid TLB invalidation when
> > +	 * pulling down a full mm.
> > +	 */
> 
> 
> Given the number of bits are limited for the ASID, at some point we'll reuse
> previously allocated ASID so the ASID allocator must make sure to invalidate
> the entries when reusing an ASID: can you point where this is done?

Per my understanding of the code, the path would be
set_mm_asid()
  __new_context()
    __flush_context()  // set context_tlb_flush_pending
if (need_flush_tlb)
  local_flush_tlb_all()

Thanks
 
> 
> > +	if (static_branch_likely(&use_asid_allocator) && tlb->fullmm)
> > +		return;
> > +
> >   	if (tlb->fullmm || tlb->need_flush_all)
> >   		flush_tlb_mm(tlb->mm);
> >   	else

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
