Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F686C636BD
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Jan 2023 16:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XQmPSmqI0JeGE6OEs88WrvzPfTDo81XAXzhnoKTeAmA=; b=r5qrW1iSaxZkZO
	Jr5tJfhd25UY1MR/eXTHgUZA+YL3iUoJtLUA5XTMHL1IPeVfa0jSxS7TGOEhHL0vZzAZ3Qxt2IebR
	2T+HjOr6dWkoxxGsJqphocna3U7x6apLDAKR1FEnPPoOQXv8TmEMmYpnhd+RWZx7MnvT7GkgfNuHc
	MQyJE6UQdydX39ACOkNMqqEmPViPluzn1Dg53HM7FQgbwXgxmAq41x4xFlxhrpXB47CRxub47rj9I
	d3/HRJ9atNHnOV2E5X4C5c4gWHIeBNuFPubWqgAEoqVvY3LhH6mFfHYZ/90i96fAWAakWLf096Dx0
	k33vzx2UCuDJ4fg1CWJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLoSS-000QWA-DI; Sat, 28 Jan 2023 16:53:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLoSO-000QVV-JF; Sat, 28 Jan 2023 16:53:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F23D060B50;
	Sat, 28 Jan 2023 16:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 670D8C433D2;
	Sat, 28 Jan 2023 16:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674924814;
	bh=v/CtqhVfGpAQw4Ngw2O+HeRUmhaWbbQs7pcp4hkRZVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uesfwittlLwxxzvYiXZ3RbH4v5b9g6T3bULdwgrsZOe5aI1bGgmTH866m1QYGr29e
	 UvcnVUTEC5Tcj40kgA80NXRueJhBNW4wu0ERd8Gd/CvqKLU8BfR0Z0GmA4T6tR4Ssf
	 XVbLfXKxc+YToHraAAdWfzFzwS5fC/rA25U0/tY/d274QejgSOQqyiuXQODH7SyyiJ
	 PMsXMhk/Z/n5/FrPd4kcNs8guLE8DPDYTRB+4ojrM2Zks6JielSq5OnyKQz/83IleD
	 G3Na5QiegutOaOQDUmgOP+Yd6n+tFiyco9WsElprQQ9jaT9OVsZsXe/RHSu87ak/TY
	 ScuWQFzpu3+lQ==
Date: Sun, 29 Jan 2023 00:43:06 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v4 09/13] riscv: switch to relative alternative entries
Message-ID: <Y9VQmprEF6Jg7A7S@xhacker>
References: <20230115154953.831-1-jszhang@kernel.org>
 <20230115154953.831-10-jszhang@kernel.org>
 <20230120183418.ngdppppvwzysqtcr@orel>
 <20230126070930.wvqsrrcmcuq5vv2x@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230126070930.wvqsrrcmcuq5vv2x@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230128_085336_754851_988470E4 
X-CRM114-Status: GOOD (  29.95  )
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

On Thu, Jan 26, 2023 at 08:09:30AM +0100, Andrew Jones wrote:
> On Fri, Jan 20, 2023 at 07:34:18PM +0100, Andrew Jones wrote:
> > On Sun, Jan 15, 2023 at 11:49:49PM +0800, Jisheng Zhang wrote:
> > ...
> > >  #define ALT_ENTRY(oldptr, newptr, vendor_id, errata_id, newlen)		\
> > > -	RISCV_PTR " " oldptr "\n"					\
> > > -	RISCV_PTR " " newptr "\n"					\
> > > -	REG_ASM " " vendor_id "\n"					\
> > > -	REG_ASM " " newlen "\n"						\
> > > -	".word " errata_id "\n"
> > > +	".4byte	((" oldptr ") - .) \n"					\
> > > +	".4byte	((" newptr ") - .) \n"					\
> > > +	".2byte	" vendor_id "\n"					\
> > > +	".2byte " newlen "\n"						\
> > > +	".4byte	" errata_id "\n"
> > >
> > 
> > Hi Jisheng,
> > 
> > This patch breaks loading the KVM module for me. I got "kvm: Unknown
> > relocation type 34". My guess is that these 2 byte fields are inspiring
> > the compiler to emit 16-bit relocation types. The patch below fixes
> > things for me. If you agree with fixing it this way, rather than
> > changing something in alternatives, like not using 2 byte fields,
> > then please pick the below patch up in your series.
> 
> Hi Jisheng,
> 
> I'm poking again on this as I see this series is now working its way
> to be merged into for-next. I'd rather avoid the bisection breakage
> which will be present if we fix this issue afterwards by having a
> v5 merged which addresses the issue in the correct patch order.

Hi Andrew,

Sorry for being late. I was on holiday in the past few days. I'm
cooking v5 and will send out it soon.

Thanks so much

> 
> Thanks,
> drew
> 
> > 
> > From 4d203697aa745a0cd3a9217d547a9fb7fa2a87c7 Mon Sep 17 00:00:00 2001
> > From: Andrew Jones <ajones@ventanamicro.com>
> > Date: Fri, 20 Jan 2023 19:05:44 +0100
> > Subject: [PATCH] riscv: module: Add ADD16 and SUB16 rela types
> > Content-type: text/plain
> > 
> > To prepare for 16-bit relocation types to be emitted in alternatives
> > add support for ADD16 and SUB16.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/kernel/module.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> > index 76f4b9c2ec5b..7c651d55fcbd 100644
> > --- a/arch/riscv/kernel/module.c
> > +++ b/arch/riscv/kernel/module.c
> > @@ -268,6 +268,13 @@ static int apply_r_riscv_align_rela(struct module *me, u32 *location,
> >  	return -EINVAL;
> >  }
> >  
> > +static int apply_r_riscv_add16_rela(struct module *me, u32 *location,
> > +				    Elf_Addr v)
> > +{
> > +	*(u16 *)location += (u16)v;
> > +	return 0;
> > +}
> > +
> >  static int apply_r_riscv_add32_rela(struct module *me, u32 *location,
> >  				    Elf_Addr v)
> >  {
> > @@ -282,6 +289,13 @@ static int apply_r_riscv_add64_rela(struct module *me, u32 *location,
> >  	return 0;
> >  }
> >  
> > +static int apply_r_riscv_sub16_rela(struct module *me, u32 *location,
> > +				    Elf_Addr v)
> > +{
> > +	*(u16 *)location -= (u16)v;
> > +	return 0;
> > +}
> > +
> >  static int apply_r_riscv_sub32_rela(struct module *me, u32 *location,
> >  				    Elf_Addr v)
> >  {
> > @@ -315,8 +329,10 @@ static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
> >  	[R_RISCV_CALL]			= apply_r_riscv_call_rela,
> >  	[R_RISCV_RELAX]			= apply_r_riscv_relax_rela,
> >  	[R_RISCV_ALIGN]			= apply_r_riscv_align_rela,
> > +	[R_RISCV_ADD16]			= apply_r_riscv_add16_rela,
> >  	[R_RISCV_ADD32]			= apply_r_riscv_add32_rela,
> >  	[R_RISCV_ADD64]			= apply_r_riscv_add64_rela,
> > +	[R_RISCV_SUB16]			= apply_r_riscv_sub16_rela,
> >  	[R_RISCV_SUB32]			= apply_r_riscv_sub32_rela,
> >  	[R_RISCV_SUB64]			= apply_r_riscv_sub64_rela,
> >  };
> > -- 
> > 2.39.0
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
