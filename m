Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC5EC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 13:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bb72sAn+CU5Q9WDEXZCfCzIFpCM8eS2qLzYzVshPQFQ=; b=F6j5xoBAMo7FQS
	tf6Q1pMVKITJU0TTVv2iCtagt7/COfdgPV/EBFCLBFUfNWFIl+AoaxwU3xgWFbK9OTCMbGOph8bnv
	rXFWVMkEAk7lFMR9+1hhByMIlUfHu3e7nrdoDdbcijKA2kxUbp9G0RPBNEd7pSjb09Cj4SUrWqyoq
	V1T53diJGVwSPT9m++OYeBTIY3Os3sU+hPQ4XIk/vLmdoBbMil3h6Lx7h8bw1ZgPaszyozGD9hS0f
	iPUuwRH6Ey4sy8f+EoO6FPeedJaP0Qe6s3xAc9wG/uvjJ8dSMAap6NB1CWTHjpoO3mZwfc7IT63T2
	hZ1RgCILPN/C9h91t8gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUoKO-0000000GrzY-0935;
	Tue, 30 Jan 2024 13:39:04 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUoKL-0000000Gry8-0S0c
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 13:39:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0A5D4CE10AB;
	Tue, 30 Jan 2024 13:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3111C433C7;
	Tue, 30 Jan 2024 13:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706621925;
	bh=xay3PI/Hwj0fNnXBZKE/+lBBhM3wX3Wp31e3E0sjX4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tsj9h8iZY2aMJC53CXOKLFz4LsJq8oqWRAzzEC9+cXF9Xa8WkvaoGPhVxmuq9pzj/
	 7NcOiH14E7UmFWhgy/q292BEONRVoNwEDs9zTNO2PtpMOIMW2yWdi0BiQxnKDGpf4B
	 KB60EB9a1dXdw9GA9SkEfIBPHzy0LjBojp50r6D0Jvzln7hmuSrbZ0F444RTnYWrOQ
	 5+kHe28ToY98XUgNITCAeoog14Dp8FA/7AX1WYuj5ANgqVB6WFFKULJLvTi1Bele5j
	 SnqIu6dXFD3QcfcDVZepw+rQ9YddMAZE9wVoY6HkKqtHpFtttTpL31BXS3oZFO2V15
	 UByrHn9TCNV3g==
Date: Tue, 30 Jan 2024 21:25:54 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Matteo Croce <mcroce@microsoft.com>
Subject: Re: [PATCH 3/3] riscv: optimized memset
Message-ID: <Zbj44v8QsQPtQ_jD@xhacker>
References: <20240128111013.2450-1-jszhang@kernel.org>
 <20240128111013.2450-4-jszhang@kernel.org>
 <b7ae944c-2b7c-4c8d-8623-a8387b8d4e02@ics.forth.gr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b7ae944c-2b7c-4c8d-8623-a8387b8d4e02@ics.forth.gr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_053901_578552_362D9827 
X-CRM114-Status: GOOD (  20.17  )
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

On Tue, Jan 30, 2024 at 02:07:37PM +0200, Nick Kossifidis wrote:
> On 1/28/24 13:10, Jisheng Zhang wrote:
> > diff --git a/arch/riscv/lib/string.c b/arch/riscv/lib/string.c
> > index 20677c8067da..022edda68f1c 100644
> > --- a/arch/riscv/lib/string.c
> > +++ b/arch/riscv/lib/string.c
> > @@ -144,3 +144,44 @@ void *memmove(void *dest, const void *src, size_t count) __weak __alias(__memmov
> >   EXPORT_SYMBOL(memmove);
> >   void *__pi_memmove(void *dest, const void *src, size_t count) __alias(__memmove);
> >   void *__pi___memmove(void *dest, const void *src, size_t count) __alias(__memmove);
> > +
> > +void *__memset(void *s, int c, size_t count)
> > +{
> > +	union types dest = { .as_u8 = s };
> > +
> > +	if (count >= MIN_THRESHOLD) {
> > +		unsigned long cu = (unsigned long)c;
> > +
> > +		/* Compose an ulong with 'c' repeated 4/8 times */
> > +#ifdef CONFIG_ARCH_HAS_FAST_MULTIPLIER
> > +		cu *= 0x0101010101010101UL;

Here we need to check BITS_PER_LONG, use 0x01010101UL for rv32

> > +#else
> > +		cu |= cu << 8;
> > +		cu |= cu << 16;
> > +		/* Suppress warning on 32 bit machines */
> > +		cu |= (cu << 16) << 16;
> > +#endif
> 
> I guess you could check against __SIZEOF_LONG__ here.

Hmm I believe we can remove the | and shift totally, and fall
back to ARCH_HAS_FAST_MULTIPLIER, see
https://lore.kernel.org/linux-riscv/20240125145703.913-1-jszhang@kernel.org/

> 
> > +		if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)) {
> > +			/*
> > +			 * Fill the buffer one byte at time until
> > +			 * the destination is word aligned.
> > +			 */
> > +			for (; count && dest.as_uptr & WORD_MASK; count--)
> > +				*dest.as_u8++ = c;
> > +		}
> > +
> > +		/* Copy using the largest size allowed */
> > +		for (; count >= BYTES_LONG; count -= BYTES_LONG)
> > +			*dest.as_ulong++ = cu;
> > +	}
> > +
> > +	/* copy the remainder */
> > +	while (count--)
> > +		*dest.as_u8++ = c;
> > +
> > +	return s;
> > +}
> > +EXPORT_SYMBOL(__memset);
> 
> BTW a similar approach could be used for memchr, e.g.:
> 
> #if __SIZEOF_LONG__ == 8
> #define HAS_ZERO(_x) (((_x) - 0x0101010101010101ULL) & ~(_x) &
> 0x8080808080808080ULL)
> #else
> #define HAS_ZERO(_x) (((_x) - 0x01010101UL) & ~(_x) & 0x80808080UL)
> #endif
> 
> void *
> memchr(const void *src_ptr, int c, size_t len)
> {
> 	union const_data src = { .as_bytes = src_ptr };
> 	unsigned char byte = (unsigned char) c;
> 	unsigned long mask = (unsigned long) c;
> 	size_t remaining = len;
> 
> 	/* Nothing to do */
> 	if (!src_ptr || !len)
> 		return NULL;
> 
> 	if (len < 2 * WORD_SIZE)
> 		goto trailing;
> 
> 	mask |= mask << 8;
> 	mask |= mask << 16;
> #if __SIZEOF_LONG__ == 8
> 	mask |= mask << 32;
> #endif
> 
> 	/* Search by byte up to the src's alignment boundary */
> 	for(; src.as_uptr & WORD_MASK; remaining--, src.as_bytes++) {
> 		if (*src.as_bytes == byte)
> 			return (void*) src.as_bytes;
> 	}
> 
> 	/* Search word by word using the mask */
> 	for(; remaining >= WORD_SIZE; remaining -= WORD_SIZE, src.as_ulong++) {
> 		unsigned long check = *src.as_ulong ^ mask;
> 		if(HAS_ZERO(check))
> 			break;
> 	}
> 
>  trailing:
> 	for(; remaining > 0; remaining--, src.as_bytes++) {
> 		if (*src.as_bytes == byte)
> 			return (void*) src.as_bytes;
> 	}
> 
> 	return NULL;
> }
> 
> Regards,
> Nick

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
