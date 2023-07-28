Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F43FC001DE
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 14:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zzO0OLz1LQ9j94IcdbP7fiScZIAM1mbYIGcZErPost8=; b=MXNUv7fpQA0FgT
	ApQpmBPy+JIijZkOR1FT7bbU5apovXY/CxukUBju7O41mxFC65qJctRUYtIo5Evpoif2R9sazaYdQ
	uQoKKXjx1KKqaKBJouA4VrMUBNioKz3X3ORh3mTZwMGQPo5wTj7cW28du0LrRbo/P/OjR20FJ+iHY
	VE5JN2acXP3Bu4xF098dp/jctuM9r/lkPmK0fjqxr7lbrF9P9I1IFr5nEWdG1fQvP1IFINrqWYEOX
	WF/G2CB8okGTHWVbxgTdV89gutezpOFrhanIbLDsVK7sd4VNsG/tPDLo3ZjH2PGtDxF0q2JrEnoMC
	zjXCdsBc/gu3F+l5SLhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPOMl-003hZf-2A;
	Fri, 28 Jul 2023 14:22:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPOMi-003hYn-2C
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 14:22:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0121D6214C;
	Fri, 28 Jul 2023 14:22:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A798C433C7;
	Fri, 28 Jul 2023 14:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690554167;
	bh=Q4/k4P2dqUmrtwh4epIswDRV1O6WVzXd1ZzdcykMzQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HXgwWVobIMhag8kRKa1fpslTUp8NIm0uFxXJVqWplVIfERV1wUu5snDIro91YqCPh
	 pQaRHAc97m2qXmslbXzjvHe3CifDgMGf4QMgduyI5W4kYmqYmW6idB3/+wl8ZppDN5
	 tLctMrSfoGi4SbksNsd2jLItjoZfsaDcFcOrGXS43pZ1k9hPdNX1vjasiuSkyLg7r9
	 +e3mZC0pC2IGdboXVdXpdhWgBNDobBC+zmGDHRuaMBHbwTchhFifWEXBrU+YshcYXN
	 t7tkNTUDBZjM743N3dIwFNR0EpQmkdc8JPB1y9SvBgWNADz8EiXE9uT5S90jC4oXOT
	 /02TYAXwfAq/Q==
Date: Fri, 28 Jul 2023 22:11:08 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] riscv: vdso.lds.S: merge .data section into .rodata
 section
Message-ID: <ZMPMfMPoG/KnuWLN@xhacker>
References: <20230726173024.3684-1-jszhang@kernel.org>
 <20230726173024.3684-3-jszhang@kernel.org>
 <20230728-cec389a85a7dc8dcca803e06@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230728-cec389a85a7dc8dcca803e06@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_072248_763026_F6069FDB 
X-CRM114-Status: GOOD (  19.37  )
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

On Fri, Jul 28, 2023 at 02:57:03PM +0200, Andrew Jones wrote:
> On Thu, Jul 27, 2023 at 01:30:23AM +0800, Jisheng Zhang wrote:
> > The .data section doesn't need to be separate from .rodata section,
> > they are both readonly.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  arch/riscv/kernel/vdso/vdso.lds.S | 15 +++++++--------
> >  1 file changed, 7 insertions(+), 8 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
> > index d43fd7c7dd11..671aa21769bc 100644
> > --- a/arch/riscv/kernel/vdso/vdso.lds.S
> > +++ b/arch/riscv/kernel/vdso/vdso.lds.S
> > @@ -29,7 +29,13 @@ SECTIONS
> >  	.eh_frame_hdr	: { *(.eh_frame_hdr) }		:text	:eh_frame_hdr
> >  	.eh_frame	: { KEEP (*(.eh_frame)) }	:text
> >  
> > -	.rodata		: { *(.rodata .rodata.* .gnu.linkonce.r.*) }
> > +	.rodata		: {
> > +		*(.rodata .rodata.* .gnu.linkonce.r.*)
> > +		*(.got.plt) *(.got)
> > +		*(.data .data.* .gnu.linkonce.d.*)
> > +		*(.dynbss)
> > +		*(.bss .bss.* .gnu.linkonce.b.*)
> 
> Looking at other architectures, it appears the last three lines of
> sections could be discarded, but I don't know enough about this to

Hi Andrew,

I checked x86, they still keep those sections. From another side,
even if those sections are not needed, removing unused sections could
be an independent patch, for safe reason or bisect reason.

Thanks


> state they should be.
> 
> Thanks,
> drew
> 
> 
> > +	}
> >  
> >  	/*
> >  	 * This linker script is used both with -r and with -shared.
> > @@ -44,13 +50,6 @@ SECTIONS
> >  	.alternative : {
> >  		*(.alternative)
> >  	}
> > -
> > -	.data		: {
> > -		*(.got.plt) *(.got)
> > -		*(.data .data.* .gnu.linkonce.d.*)
> > -		*(.dynbss)
> > -		*(.bss .bss.* .gnu.linkonce.b.*)
> > -	}
> >  }
> >  
> >  /*
> > -- 
> > 2.40.1
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
