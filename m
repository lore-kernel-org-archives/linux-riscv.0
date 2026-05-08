Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DCECD342F
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 20:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GedGt2LJQxkAJC9he9bUU6BzEqY52DXgqSofhNe7OTI=; b=od9xb7NNbCoim2
	JWHtbDtAflUiiM8E8HbO195wLucmHnnnG8ZMYQ6IPWvk8gehlddbnwIAUOgHA3df3n7Xk1Qd0ruSQ
	sVgh9iSwtG37+rJ2lO5B+wdTjJftIXVCvsba4ZkWDUqU9PVIsh/h/8Q0dZLhoZKCThOyzE4vnYh2i
	43Hota9Y/WwawEmPhdFOWpNk2HIuNvkzqgQJc49djIhbyor9Nxm+d3TbOaeCl1vF+d1fPt4eOhVqv
	k/53m9w4kiMcY5WAlojeZoNQEJ4cRBvibHxeA2QUAPMFUwJ0vRDeK5M94zp8KcB0l2/F+MflYwwYp
	ecBRMzAkCUTHk+Of/MCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLRh7-00000007RUb-2s0y;
	Fri, 08 May 2026 20:21:09 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLRh4-00000007RTE-27bG
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 20:21:08 +0000
Date: Fri, 8 May 2026 22:20:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778271663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9mS8gtYntpLCSU0tApfkVV6AUA34BBbgret+6ejxc+k=;
	b=sMBLF0/izGlHqk5z4o3Ierxy+U4DQT1NcRMe4qklRhvUjZm7S065MhPD++t/EzsacxtJco
	xCyd9E2P3qboH39E5+9kSUsMF7oo9V3oRF15pfHsNM+Yioblr48CoLISlpO9CUjAMhBe1F
	STFPyQ1pkGFEfEcZakQbp1J8CrqZU74=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Ard Biesheuvel <ardb@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 1/2] riscv/purgatory: return bool from
 verify_sha256_digest
Message-ID: <af5Fq8zWaY9JS5Xf@linux.dev>
References: <20260508143544.2484-3-thorsten.blum@linux.dev>
 <20260508184137.GC4145640@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260508184137.GC4145640@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_132106_694456_ECB13646 
X-CRM114-Status: GOOD (  17.11  )
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

On Fri, May 08, 2026 at 06:41:37PM +0000, Eric Biggers wrote:
> On Fri, May 08, 2026 at 04:35:44PM +0200, Thorsten Blum wrote:
> > Change the function's return type from int to bool and return the result
> > of memcmp() directly to simplify the code.  While at it, cast ->start to
> > 'const u8 *' to better match the expected type.
> > 
> > Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> > ---
> >  arch/riscv/purgatory/purgatory.c | 9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
> > 
> > diff --git a/arch/riscv/purgatory/purgatory.c b/arch/riscv/purgatory/purgatory.c
> > index bbd5cfa4d741..15c72dafa3d8 100644
> > --- a/arch/riscv/purgatory/purgatory.c
> > +++ b/arch/riscv/purgatory/purgatory.c
> > @@ -17,7 +17,7 @@ u8 purgatory_sha256_digest[SHA256_DIGEST_SIZE] __section(".kexec-purgatory");
> >  
> >  struct kexec_sha_region purgatory_sha_regions[KEXEC_SEGMENT_MAX] __section(".kexec-purgatory");
> >  
> > -static int verify_sha256_digest(void)
> > +static bool verify_sha256_digest(void)
> >  {
> >  	struct kexec_sha_region *ptr, *end;
> >  	struct sha256_ctx sctx;
> > @@ -26,11 +26,10 @@ static int verify_sha256_digest(void)
> >  	sha256_init(&sctx);
> >  	end = purgatory_sha_regions + ARRAY_SIZE(purgatory_sha_regions);
> >  	for (ptr = purgatory_sha_regions; ptr < end; ptr++)
> > -		sha256_update(&sctx, (uint8_t *)(ptr->start), ptr->len);
> > +		sha256_update(&sctx, (const u8 *)(ptr->start), ptr->len);
> >  	sha256_final(&sctx, digest);
> > -	if (memcmp(digest, purgatory_sha256_digest, sizeof(digest)) != 0)
> > -		return 1;
> > -	return 0;
> > +
> > +	return memcmp(digest, purgatory_sha256_digest, sizeof(digest));
> >  }
> 
> So true on failure and false on success?  Might make sense to flip that.

Ahem yes, that should obviously be flipped. I'll send a v2. Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
