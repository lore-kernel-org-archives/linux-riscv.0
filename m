Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5D6C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 02:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eUqJ9ppl/zydV8TpVYmufm3R7KJ0SUUhHc6GFmIlZ60=; b=ohZYMIGCq2TH2b
	Mj3bLp+8oGfOFaLeKBth9MivZ10IiM/NSNls2g/bkhYqkdIL6GHZJBReG0+uSWdAFnDS9FGuA+rlO
	Euwx9Wk+RqgZl8NByzj9AoD5Kl98untqYuXwwpd3H/R3smE9oSDL0fQmvTJp2pJUxZ1FTuvBu7EMY
	yI/RHI8+GqS05NmbIoe39X1CP9dPbMEK4veuFldtUoV6yKtoUPW3Y3JLvdA+ks7tfFD2H5PSEOYaL
	YtTzXcQgToKqQknzaZsSKsQOIgYJ/j5TuFash2+V4URVvm3hZ/KbwQvDbuPya1fxuxCHL65l1mK43
	CWjldoiH/pAGRIgyt64g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAKww-00612j-14;
	Tue, 05 Dec 2023 02:14:14 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAKwt-00611s-0l
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 02:14:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AB383CE13FE;
	Tue,  5 Dec 2023 02:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC604C433C7;
	Tue,  5 Dec 2023 02:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701742448;
	bh=Ptz0fJBcWbfsG0oxaIzA0E/svH7JZtCOrjX9y9bQLyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gKx3XjHV3fTHtX9IMh4wMxd+mVu98af3QIcNrtzqEa3jNUUtHdGghmc6Z2WnBvkgy
	 EuauIQv3c4Q6CIXeFFVtbZqOuirDPCPCxrWOZONK6Hq0mQtvO7ahX7eCydaQOEVKDh
	 0XdHojXjflQkf+c0CZmhyLW2JAQmza7Php6CpJY+WXUINDPcWYxM+nBrGyTveFFx9s
	 ZPa6/HvB08+sl/dp/NyYdr44vhuwkJo9LfpGKtuzwcXyfsZm+ak9uZyjk2PrPR+vVA
	 9UIyHsq0OpwPVZd5YweB1/SIvaEAl1eYFVpFpnDORY01+Ffl89IFTmn8K5tecOWH3O
	 DyBqbwOU/D2AQ==
Date: Mon, 4 Dec 2023 18:14:06 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] riscv: introduce RISCV_EFFICIENT_UNALIGNED_ACCESS
Message-ID: <20231205021406.GD1168@sol.localdomain>
References: <20231203135753.1575-1-jszhang@kernel.org>
 <20231203135753.1575-2-jszhang@kernel.org>
 <ZW4lUDpl0eZVNjrp@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZW4lUDpl0eZVNjrp@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_181411_519242_64FB5EA0 
X-CRM114-Status: GOOD (  16.53  )
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

On Mon, Dec 04, 2023 at 11:15:28AM -0800, Charlie Jenkins wrote:
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 7f8aa25457ba..0a76209e9b02 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -654,6 +654,18 @@ config RISCV_MISALIGNED
> >  	  load/store for both kernel and userspace. When disable, misaligned
> >  	  accesses will generate SIGBUS in userspace and panic in kernel.
> >  
> > +config RISCV_EFFICIENT_UNALIGNED_ACCESS
> 
> There already exists hwprobe for this purpose. If kernel code wants to
> leverage the efficient unaligned accesses of hardware, it can use static
> keys. I have a patch that will set this static key if the hardware was
> detected to have fast unaligned accesses:
> 
> https://lore.kernel.org/linux-riscv/20231117-optimize_checksum-v11-2-7d9d954fe361@rivosinc.com/

Is the plan to make the get_unaligned* and put_unaligned* macros expand to code
for both cases, and select between them using a static key?  Note that there are
a very large number of callers of these macros in the kernel.  And what about
kernel code that checks CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS directly?

AFAIK, no other Linux architecture supports kernel images where the unaligned
access support is unknown at compile time.  It's not clear to me that such an
approach is feasible.  A static key can easily be provided, but it's unclear
what code would use it, given that currently lots of kernel code assumes that
unaligned access support is known at compile time.

Meanwhile, there are people building kernels they know will only be deployed on
systems where unaligned accesses are supported.  To me, it seems useful to
provide a kconfig option for them to build a more efficient kernel.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
