Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17FAAC4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 14:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=za9EBeVamP4bzk2V64cYVQSORNQX8AOKOvfJTpB4lhc=; b=XDhhfkTAge+PVG
	muyXgUdrDFBj0CrUQ96eVPkUmPilfwPhzEJ+hSGjazYwHCjIyipsl+xXgdGgfgRZRRKSzSqC+5MNB
	mihVUqHGbH4vlBr9++d+h8EDEyqe649z8zP2rq8zT3Xd7yfRdNQJoLdKbtiQx0gsGCd/Q7eIxkSd3
	ew+2N8REmyNniOfIV6W7pdINahHYuRmE2pxa++UPq12pxY/lWaX0KF4b5IwG5kGHyxBEsdSKzKVMF
	JK6Jy7d/CcLnHTupxtxKBYILZxfJGnPeXFw28oHt+SwIJNDXYPpzc09ocP96N8/RUI/vNrIB/A5rC
	Mb6atbdWpXqJKSpm2yFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAW4B-007Z1k-00;
	Tue, 05 Dec 2023 14:06:27 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAW47-007Z17-1l
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 14:06:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A7A23B81A40;
	Tue,  5 Dec 2023 14:06:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E145DC433C8;
	Tue,  5 Dec 2023 14:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701785181;
	bh=ztrbzYTZQKsvH33tkgl+qwxlT0HfVPRGVJ2xrk1JJVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SmHmUefIXAFabqnUAvfcofVrTfm2RcsTluAm+Xmw61SuLNhe5yjfdiqa+lU2oaxIc
	 icituGymcVYow/PXPTqTAU2Sqo89b3S0A+JRMA1Jx7l4b/n2Aeww8e2Usc35lDCyac
	 OWDjd7AeeoAgpmfCtRU0yqekStpY1do1ZGxNlPaU+a9+NwwXcVwL61m9/VRLRVGiJs
	 5XwNg2VDcZMo/+TY+qF2EjH5JAr46unQvCEebQkUgR9i1bq1ISFCza+QbUzPRk6XU1
	 I82U8TSJlERrTvk7LvGS2LvCt5AeEgbrPjWuEJRXMaAMlcKvJe80r7OUtmJ9Tg7RZr
	 M86gdse7FdLhA==
Date: Tue, 5 Dec 2023 21:53:50 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Charlie Jenkins <charlie@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] riscv: introduce RISCV_EFFICIENT_UNALIGNED_ACCESS
Message-ID: <ZW8rbgsTqmuLTvoK@xhacker>
References: <20231203135753.1575-1-jszhang@kernel.org>
 <20231203135753.1575-2-jszhang@kernel.org>
 <ZW4lUDpl0eZVNjrp@ghost>
 <20231205021406.GD1168@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231205021406.GD1168@sol.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_060623_899096_B09B4ADB 
X-CRM114-Status: GOOD (  22.01  )
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

On Mon, Dec 04, 2023 at 06:14:06PM -0800, Eric Biggers wrote:
> On Mon, Dec 04, 2023 at 11:15:28AM -0800, Charlie Jenkins wrote:
> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > index 7f8aa25457ba..0a76209e9b02 100644
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -654,6 +654,18 @@ config RISCV_MISALIGNED
> > >  	  load/store for both kernel and userspace. When disable, misaligned
> > >  	  accesses will generate SIGBUS in userspace and panic in kernel.
> > >  
> > > +config RISCV_EFFICIENT_UNALIGNED_ACCESS
> > 
> > There already exists hwprobe for this purpose. If kernel code wants to
> > leverage the efficient unaligned accesses of hardware, it can use static
> > keys. I have a patch that will set this static key if the hardware was
> > detected to have fast unaligned accesses:
> > 
> > https://lore.kernel.org/linux-riscv/20231117-optimize_checksum-v11-2-7d9d954fe361@rivosinc.com/
> 
> Is the plan to make the get_unaligned* and put_unaligned* macros expand to code
> for both cases, and select between them using a static key?  Note that there are
> a very large number of callers of these macros in the kernel.  And what about
> kernel code that checks CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS directly?
> 
> AFAIK, no other Linux architecture supports kernel images where the unaligned
> access support is unknown at compile time.  It's not clear to me that such an
> approach is feasible.  A static key can easily be provided, but it's unclear
> what code would use it, given that currently lots of kernel code assumes that
> unaligned access support is known at compile time.
> 
> Meanwhile, there are people building kernels they know will only be deployed on
> systems where unaligned accesses are supported.  To me, it seems useful to
> provide a kconfig option for them to build a more efficient kernel.

Generally, I agree with Eric's above points. Various subsystem such as net, mm,
lib and so on have different code path for CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS,
while Charlie's patch only touch partial code of arch/riscv, and even if those
subsystem maintainers agree with dynamic code patching(I still believe
persuading those subsystem maintainers is not easy), that's still a
huge task which needs to be done step by step. So before that, we'd
better let this series merged and benefit all efficient unaligned access
riscv systems. When the huge task is completed, we can remove the config
option.

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
