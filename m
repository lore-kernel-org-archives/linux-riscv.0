Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A24C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Oct 2022 20:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jmXJBbVvj9yeo5xlfOxpbVM4AZvbKdIaubDkXZXre0E=; b=yb8mJ1Vis9jiqn
	g0Ki+JKSQx38ykjw7JO89vi5lJD/utSHWR4lWXKdecqUjamIOhHC8iGRoWoASurZc1J502P9Y2asj
	70lQkC3ZmkTDWpsr3QD02BNjY2g11i4Y5Ewg7R41ngftdzU9odVfxK5/b/V1KO7eyHkIqgxX+xKGL
	GPvpPUp/5HKQhLtM300Gf3LyUemt8qMe0kdw+ylyMyMY6++LCoWsofJJhYEfk9Ujz/vcY6fcNfXLC
	k3iojm3Qzq2YNJcTCTQayQB91iqoRhbhnzIqudLwwIuzCjZ+ljOkkbC773q88xMr0KmQRPiaChqu2
	c5gPpV8FTjmrHAhnRECA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohzaO-002Ekb-62; Mon, 10 Oct 2022 20:41:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohzaL-002EjI-IS
	for linux-riscv@lists.infradead.org; Mon, 10 Oct 2022 20:41:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1BF0A60F0F;
	Mon, 10 Oct 2022 20:41:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26D49C43141;
	Mon, 10 Oct 2022 20:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665434472;
	bh=riedfV3ivnQOAQhla+tYKGqWnDDbhtLkrw7/hfZiCu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NqemqHQAvm/ubhTbk9lXHu0KKl1XuOkEM0lHnwax/S3sTUYK8Sx20jbBPj8ra2FWL
	 4MFgcE+deQsZmQRNslrTZPxw6ayeQqgQd6FAMx6ZR2715dWsgCiJlmOtkneWcqinxC
	 OuQ2IL81j9fDRcdT/aC+QQhcV7MjTGSIQDIGKUva6qLbxk8KFPoVxB8Oy7zBxMyomS
	 W3/i9QcvufEvqDdFP/iGTlUV6THTXyIQOJ4xO0AHw3Blu/detNT15M1q0tDK2cnxEn
	 ZuGokmmrx17QGJvGKuWrd7qrvLo9xLQnRTnB2KpM6QpIj9E1/mNvJIOLyGHBK3M/7v
	 NsxBEZkfUn9VQ==
Date: Mon, 10 Oct 2022 21:41:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Cleo John <waterdev@galaxycrow.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: fix styling in ucontext header
Message-ID: <Y0SDZEXQ5kXGJZLh@spud>
References: <20221010182848.GA28029@watet-ms7b87>
 <Y0RpkI66dwEKD9Kw@spud>
 <5631093.DvuYhMxLoT@watet-ms7b87>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5631093.DvuYhMxLoT@watet-ms7b87>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_134113_703930_1227D1AF 
X-CRM114-Status: GOOD (  36.32  )
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

On Mon, Oct 10, 2022 at 09:55:17PM +0200, Cleo John wrote:
> Am Montag, 10. Oktober 2022, 20:50:56 CEST schrieb Conor Dooley:
> > On Mon, Oct 10, 2022 at 08:28:48PM +0200, Cleo John wrote:
> > > Change the two comments in ucontext.h by getting them up to
> > > the coding style proposed by torvalds.
> > > 
> > > Signed-off-by: Cleo John <waterdev@galaxycrow.de>
> > > ---
> > > In my opinion this also improves the readability so I think this is a useful change to do.
> > > Please also tell me if you have a different opinion.
> > 
> > I don't think it is all that /important/ of a change, but it does make
> > things match between this file and the other headers.
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > 
> > Thanks.
> > 
> 
> Yes, its not that important. Thats why I chose it. :D

:)

> To be honest this is my first commit to the kernel so 
> I wanted to do something simple to start things of
> easy and to get more familiar with the procedure,
> before getting my feet wet into some real kernel
> additions.

Cool, nice to have you & good luck!

> Thanks for helping!

nw, hopefully I wasn't too direct/negative.

Conor.

> 
> > > 
> > > Changes in v2:
> > >  - change the styling of the top comments too
> > > 
> > >  arch/riscv/include/uapi/asm/ucontext.h | 12 ++++++++----
> > >  1 file changed, 8 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/arch/riscv/include/uapi/asm/ucontext.h b/arch/riscv/include/uapi/asm/ucontext.h
> > > index 44eb993950e5..516bd0bb0da5 100644
> > > --- a/arch/riscv/include/uapi/asm/ucontext.h
> > > +++ b/arch/riscv/include/uapi/asm/ucontext.h
> > > @@ -15,19 +15,23 @@ struct ucontext {
> > >  	struct ucontext	 *uc_link;
> > >  	stack_t		  uc_stack;
> > >  	sigset_t	  uc_sigmask;
> > > -	/* There's some padding here to allow sigset_t to be expanded in the
> > > +	/*
> > > +	 * There's some padding here to allow sigset_t to be expanded in the
> > >  	 * future.  Though this is unlikely, other architectures put uc_sigmask
> > >  	 * at the end of this structure and explicitly state it can be
> > > -	 * expanded, so we didn't want to box ourselves in here. */
> > > +	 * expanded, so we didn't want to box ourselves in here.
> > > +	 */
> > >  	__u8		  __unused[1024 / 8 - sizeof(sigset_t)];
> > > -	/* We can't put uc_sigmask at the end of this structure because we need
> > > +	/*
> > > +	 * We can't put uc_sigmask at the end of this structure because we need
> > >  	 * to be able to expand sigcontext in the future.  For example, the
> > >  	 * vector ISA extension will almost certainly add ISA state.  We want
> > >  	 * to ensure all user-visible ISA state can be saved and restored via a
> > >  	 * ucontext, so we're putting this at the end in order to allow for
> > >  	 * infinite extensibility.  Since we know this will be extended and we
> > >  	 * assume sigset_t won't be extended an extreme amount, we're
> > > -	 * prioritizing this. */
> > > +	 * prioritizing this.
> > > +	 */
> > >  	struct sigcontext uc_mcontext;
> > >  };
> > >  
> > 
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
