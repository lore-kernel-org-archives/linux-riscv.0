Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423B8C4828D
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Feb 2024 11:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pfFNHGBIiPgoWvlENdHzUG/1Pbv90SOjGG46ztdKUd8=; b=ZLDsSNZq6fW17E
	nH0KC1i1tJg2H4yOymQZmGbrT3fiP4eG83Oc+U4eZFpK0EBLk+jUBmXbhdb6/NRuAZO+Yd4tsem5t
	9hE/e25hFl1EStCFmoTrk0iONUtLfIqKdjpR7SqqdR82pLj6ry4Q5NO2TLDui8xC8M5O7vhLZhFDW
	CG8uucCopeS6RFLDDKbf6eo3tomJxEDhVBI5vxS3DfjV7FVhkkua80Sj5q8l3B12vcKnqj09b+NQI
	Ft34PHG12HIanjUJ4bhlUKGEQysn1ZrK4GFr75Lc8xcxxntaCt68Rdp+hKlgoCeV1wrFSDeKV+OzS
	m/XSMbbbiX+AXb+R9dXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXJf4-00000007KgI-1nYt;
	Tue, 06 Feb 2024 11:30:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXIgW-000000071tE-3BYa
	for linux-riscv@bombadil.infradead.org;
	Tue, 06 Feb 2024 10:28:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wL2XaDrz9Zzdo3dIVcROropReKDbFnXvTTG6U4vznPI=; b=DN7+IuBsmgD1xAGHvDUhFPTdFn
	EI8M3xT8koA3veNEcUvJbz3O63v0yMVwpVqjNiL6yVcd682pbnBsKSbLcc22eySuyGWy6UKwcHqDM
	/Ri8WY/WhH5wBWHNvX/EBarGNS8yEhzujr8dhOWdI7AnSn9m0PitdrRvIz2gmnktF0Lyy4hkx7ep9
	DpPqDqnoDX1pCMJgyyHIsouehrhamrzz0mgrZxD3KrCuwgkUvzLnkyfu2p42pUKpizR2NimNuOelp
	WfZ/WbW9H48HQBcR9xHjLetCctm6S8hW2jbQRGAdc0VW8EhoqUDilgRouyf6FLlIhbO2eR1ijjIMc
	mMoXEVUg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXIgS-0000000CUMX-30CR
	for linux-riscv@lists.infradead.org;
	Tue, 06 Feb 2024 10:28:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4C88F613E9;
	Tue,  6 Feb 2024 10:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F2DFC433F1;
	Tue,  6 Feb 2024 10:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707215279;
	bh=u7wVea/4SlPP6+h8wkS+v2aRTJMeBzRcPmydx6VUVxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rDyATUQGLxwlWacikkMc8egWhFadby+tHgYFnfV2j5PI1VZurWKjs76qQ/mVFMTP4
	 XQgkVTpQJG5MYyPUyDTyYDtp99q8EVkXl0dvjnpenPkgeD/Gqr0R+F4T5cQIHSOtFB
	 vEGV7bbUGRNjb3XDJMD8l9EMJF2Ki+v+9FrZWL27tKvcIgkyucAsMOzCRu1Z2gcrQE
	 J6YNFGdutLdnmQKoviIVcaLK5Z9wDh273+fwqL/QQGXjnlh9tt/GurukwU+OLMivqN
	 a1hbMwkvb2gy25OFKMI6jf81NsLrVzqCSa8rg8SguUMq1kKfEAbce2FA+LkgvuevAa
	 CUV/dDV8DdtHQ==
Date: Tue, 6 Feb 2024 18:15:04 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes] riscv: Fix arch_tlbbatch_flush() by clearing the
 batch cpumask
Message-ID: <ZcIGqBSHzjI1xVRX@xhacker>
References: <20240130115508.105386-1-alexghiti@rivosinc.com>
 <ZcF8z18dwnGsw0Ix@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZcF8z18dwnGsw0Ix@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_102809_371938_D7EE0C0C 
X-CRM114-Status: GOOD (  14.64  )
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

On Mon, Feb 05, 2024 at 04:26:55PM -0800, Charlie Jenkins wrote:
> On Tue, Jan 30, 2024 at 12:55:08PM +0100, Alexandre Ghiti wrote:
> > We must clear the cpumask once we have flushed the batch, otherwise cpus
> > get accumulated and we end sending IPIs to more cpus than needed.
> > 
> > Fixes: 54d7431af73e ("riscv: Add support for BATCHED_UNMAP_TLB_FLUSH")
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  arch/riscv/mm/tlbflush.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> > index 99c3e037f127..c8efc3f87a0f 100644
> > --- a/arch/riscv/mm/tlbflush.c
> > +++ b/arch/riscv/mm/tlbflush.c
> > @@ -240,4 +240,5 @@ void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
> >  {
> >  	__flush_tlb_range(NULL, &batch->cpumask,
> >  			  0, FLUSH_TLB_MAX_SIZE, PAGE_SIZE);
> > +	cpumask_clear(&batch->cpumask);
> >  }
> > -- 
> > 2.39.2
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
