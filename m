Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA79FECAAD3
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Sep 2022 14:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P2FsBGdjklePqC8E8Bs8ZIOOHscgrTVVnBhQyVt07mE=; b=gsENwWHceepdVC
	/Gc1M4l3vRQvlKs1Prn+mFCPLJYu/1QHUA7OGXbmO/TWgubN77S7sqcrJuOk+qr2SyDLL3yR1LvND
	UklH5KG+dKyRfCfmSqD4LIIF6uQeUmhSsKDcwfIfaMNiecuU6ELin77qXryeskQSXLR6DnxhzxnCD
	jKA5zmt37lR6VFYYGBPmMkVBFDTYiTgwE0K9PPxJ7qrWxI09XyItrIzLiLYxH7FSC53TVVluckJ/y
	Y2AGa5JPD7rCn63Tzna/RI7yoi2qtjllB507Ng3aaZ5/Y1UJATZtTLOZPTEmkVtHhyu56oRvFMmkI
	gDX1XqiWQ/BsfYsWFt8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZZDA-006cZF-AA; Sat, 17 Sep 2022 14:54:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZZD7-006cYU-Ai
	for linux-riscv@lists.infradead.org; Sat, 17 Sep 2022 14:54:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D21CD60C4B;
	Sat, 17 Sep 2022 14:54:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09C35C433D6;
	Sat, 17 Sep 2022 14:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663426463;
	bh=W1KG87zu6uBdd7P3UWzyx5ROSiBb8aMsImd8mdNwoXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OooGCbySgRDe6MkejeDiPkW5nR1eNotks/mfR904VkGZt59jnGjNFfsxiAYRBiQp7
	 mFUyRLB0QP4rfq0yB5VL7MnAEX5w436xv/0kqxdo7tulUDAj3jEDJkAEWWLw7mD2/A
	 5IlU/6f6qgGEaVIk6K+yOtbNykCaoyNINlv8kHjQ4pSbZaJQLpmOZzXY6dcR1KE6AD
	 baopyJq66xuGmjwTrvWPD3/Q3xxCWxuPVk5lR3SQt6PeuV5JqDx1PbOm8OZ1JuGkl/
	 nqSIn/bpRtkpdzvxD4vVnhsyFVfMx5ubyGSaTdwxBKbsHSTlEkCl3poZO6SSNAGlgs
	 E6BLo7tSEgdaA==
Date: Sat, 17 Sep 2022 15:54:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Conor.Dooley@microchip.com, linux-riscv@lists.infradead.org,
	stable@vger.kernel.org, lkp@intel.com
Subject: Re: [PATCH] RISC-V: Avoid coupling the T-Head CMOs and Zicbom
Message-ID: <YyXfm6V3DfzOqKvr@spud>
References: <4d7ab3d1-72cc-f1cf-15bf-50bbb64837da@microchip.com>
 <mhng-85fb2ed5-046c-4fd3-a703-b417bff95c57@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-85fb2ed5-046c-4fd3-a703-b417bff95c57@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220917_075425_488650_DF9E8797 
X-CRM114-Status: GOOD (  26.72  )
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

On Sat, Sep 17, 2022 at 07:41:34AM -0700, Palmer Dabbelt wrote:
> On Fri, 16 Sep 2022 05:22:59 PDT (-0700), Conor.Dooley@microchip.com wrote:
> > On 15/09/2022 18:13, Conor Dooley wrote:
> > > On 15/09/2022 18:09, Palmer Dabbelt wrote:
> > > > We could make the T-Head CMOs depend on a new-enough assembler to have
> > > > Zicbom, but it's not strictly necessary because the T-Head CMOs
> > > > circumvent the assembler.
> > > > 
> > > > Fixes: 8f7e001e0325 ("RISC-V: Clean up the Zicbom block size probing")
> > > > Cc: stable@vger.kernel.org
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > Reported-by: Conor Dooley <conor.dooley@microchip.com>
> > > 
> > > I build-tested this last night when I accidentally found it so:
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > 
> > This is the one you I noticed you missed, msg-id is:
> > 4d943291-f78f-31ed-0d67-7073e1f762e2@microchip.com
> 
> Sorry about that, the scripts to search for a Reviewed-by weren't handling
> the base64 encoding that Exchange was doing.  It should be fixed, at least
> it is for the test merge I just made.

I'm just going to bite the bullet & learn lei + mutt & use my korg
address for all mailing list things.* At least that'll help with my
mails getting through to rivos inboxes if they come via infread too.

> 
> > 
> > > 
> > > > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > > > ---
> > > >   arch/riscv/include/asm/cacheflush.h | 6 +++++-
> > > >   1 file changed, 5 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> > > > index a89c005b4bbf..273ece6b622f 100644
> > > > --- a/arch/riscv/include/asm/cacheflush.h
> > > > +++ b/arch/riscv/include/asm/cacheflush.h
> > > > @@ -42,8 +42,12 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
> > > >   #endif /* CONFIG_SMP */
> > > > -#ifdef CONFIG_RISCV_ISA_ZICBOM
> > > > +/*
> > > > + * The T-Head CMO errata internally probe the CBOM block size, but otherwise
> > > > + * don't depend on Zicbom.
> > > > + */
> > > >   extern unsigned int riscv_cbom_block_size;
> > > > +#ifdef CONFIG_RISCV_ISA_ZICBOM
> > > >   void riscv_init_cbom_blocksize(void);
> > > >   #else
> > > >   static inline void riscv_init_cbom_blocksize(void) { }
> > 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
