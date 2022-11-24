Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E63BC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 16:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jRmlO+yUqgQIAMLKoZDiNnyMiTr34cZpkvD6q5WNkFY=; b=kPYsBCeC6Uzd+3
	2z7ZNTatpryJW7c5/pNXzFiXMYppMB/CgIY7W9lJNKUppSORHF0rqn52ecHhFBlfN0j03eMQobqvS
	SqeJMEo2jZ7ktdiu6cwanYxYkXI1otFDygh4Y4yEWZF5gZSHy3eYZq1CT6I7MpoPkAT4LsR9WI/hp
	4ig03W+JfRYH0g5JGfM+uSn8P8xOzCrnIq4LlCXvKB0fS/NMuNr2derYKzR+oMfYSAOgR4Q/8tvAA
	2e1+F9o5qbTlgi4gW0x1t76HNyziVVrh8OqIE802iGF/uN4PEdz1XmsQKlvd6kw2+Q39suuX5DyCf
	cZjpB0W3o7p2PaQey2og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyFTC-00AFCt-Kd; Thu, 24 Nov 2022 16:53:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyFT9-00AFAa-Oi
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 16:53:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 24371620AB;
	Thu, 24 Nov 2022 16:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60177C433C1;
	Thu, 24 Nov 2022 16:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669308776;
	bh=yFbO4x3hDBBM+JAuuuh1GsVahDb3/rYX8oN4gtqbqLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mavm9VVQ4QHSXsvmn0b+W1IrSzqzy9S4aexHCIZRkGlfsKT8ukRd0JBXFiIp6HnFv
	 yOvWyIfNHzY09QpgOFtZPAwYtIy5p5ICHKbg0qFFCtT7BWeKihmBAQ3c3DTvhneGqj
	 +EcS1GoWc1YfQQJ9XV2U/A0UgHUCLNnxzUSgFl1GodlPhWmFyy/Lh4W7LthVYEvsZ/
	 sHcFFQdtdRDLC81RmHCPXblwfsNchF9MjssH3N8v4yi68IU0DW5FHanR3djD0omPxM
	 Epbbq6WDY9jGldgVn2JxySoW+5+8V6nNI3Bxa9jiZ367Y0YP+ODYubxs0wZjpMKuH7
	 DXyJXJ7d57EOw==
Date: Fri, 25 Nov 2022 00:43:05 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] riscv: vdso: remove hardcoded 0x800 .text section
 start addr
Message-ID: <Y3+fGZuHBoZIGT3g@xhacker>
References: <20221123161805.1579-1-jszhang@kernel.org>
 <20221124103255.33prhf3gf6xtwlsk@kamzik>
 <Y3+XmWazrB0RURfI@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y3+XmWazrB0RURfI@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_085259_899646_4CF8F4D0 
X-CRM114-Status: GOOD (  36.95  )
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

On Fri, Nov 25, 2022 at 12:11:09AM +0800, Jisheng Zhang wrote:
> On Thu, Nov 24, 2022 at 11:32:55AM +0100, Andrew Jones wrote:
> > On Thu, Nov 24, 2022 at 12:18:05AM +0800, Jisheng Zhang wrote:
> > > It seems the hardcoded 0x800 isn't necessary, but removing it brings a
> > 
> > s/, but/and/
> > 
> > > small vdso.so and aligns with other architectures.
> > 
> > This commit message didn't really satisfy my desire to understand why
> > the comment and '. = 0x800' were there in the first place and if its safe
> > to remove now, so I tried to do some of my own digging. I found
> > 
> > commit 5b9304933730 ("x86 vDSO: generate vdso-syms.lds")
> > commit f6b46ebf904f ("x86 vDSO: new layout")
> > 
> > which removes the comment and hard coding for x86 by changing the vdso
> > Makefile. Then looking at
> > 
> > commit 9031fefde6f2 ("arm64: VDSO support")
> > 
> > we see that it starts with the new Makefile approach and doesn't bother
> > with the hard coding from the start. As riscv also started with the new
> > Makefile approach it also could have dropped the hard coding from the
> > start (I guess).
> > 
> > > 
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > ---
> > >  arch/riscv/kernel/vdso/vdso.lds.S | 8 +-------
> > >  1 file changed, 1 insertion(+), 7 deletions(-)
> > > 
> > > diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
> > > index 150b1a572e61..7be7e618d59c 100644
> > > --- a/arch/riscv/kernel/vdso/vdso.lds.S
> > > +++ b/arch/riscv/kernel/vdso/vdso.lds.S
> > > @@ -31,13 +31,7 @@ SECTIONS
> > >  
> > >  	.rodata		: { *(.rodata .rodata.* .gnu.linkonce.r.*) }
> > >  
> > > -	/*
> > > -	 * This linker script is used both with -r and with -shared.
> > > -	 * For the layouts to match, we need to skip more than enough
> > > -	 * space for the dynamic symbol table, etc. If this amount is
> > > -	 * insufficient, ld -shared will error; simply increase it here.
> > > -	 */
> > > -	. = 0x800;
> > > +	. = ALIGN(4);
> > 
> > I realize 4 is used here now because I questioned the 16, but after doing
> > my digging I think a larger alignment may be better. Loading the text may
> > be done with 8 byte or larger reads, so having the section aligned to a
> > larger size would be better reading it. We might as well use 16, like
> > arm64 does, and like you had before?
> > 
> > Also, having enough separation between data and text seems to be
> > important for cache reasons, based on the comment in
> > ./arch/x86/entry/vdso/vdso-layout.lds.S and other vdso history.
> > Maybe we should move .note, .eh_frame_hdr, and .eh_frame below
> > .rodata like x86 has it?
> > 
> 
> Thank you so much for pointing out the two commits and above
> separation, new version will be sent out soon.

After looking at the git history, besides your wonderful suggestion,
I think we can do something more to clean up and make riscv vdso
better, for example, Is the .data section read only, so could be
merged with .rodata? or we can discard it as arm64 does? I need some
time to dump the section then check and do some test.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
