Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFACC43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 12:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nIlFzCe1/Rn0QBnuhtMJxqC4MxnQVhXB/K2tHYZOkpA=; b=MSRdOX3+E1Take
	XtErT66UHjYwFAmR2uEsfZN50KWVwoHUmTGCke4JUFoIX00ITasfHzZY8iigBN8dDs/5vYZsIt2f1
	P5PBJPu+skNDuk78V/mlsecE3SrCItD+815M6E/b7yT0gVdNsA6ks6uMPu/tut9qtGNl0GE0d3XEq
	RcT65veKoXIKwgKKWGR/a5sPY0FcKCrbq4oxsq4gSsm5S1j08Yx4c/82i2ZtE3WG9Jya6g34S+Bn8
	Yx+FBB98tV/pQX9BFqz06LocytmanIyMZUSNK9B7zZTC5GxEsWOjDmVqyIiyppT6hhj17L407K7At
	zuZ+5VxSwXWpqcpRbpxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ii7-007Jkv-Af; Thu, 01 Dec 2022 12:30:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ii3-007Jio-96
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 12:30:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669897835; x=1701433835;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WA7HrCslX8Gj2DNul0k+rAI/etG0UhniwQU7QIeWfmo=;
  b=eUPxxN2E1JYGVxtTAh/WBQVKjJ0bwT83x4xbrGDUM+v5JaDmFNTH45in
   Z7soAhZfnLmT4ZbtS2+KQQfvlBlWNKpmwUXMglgfpYq9yJIDFcWb7wmMu
   b+InVf/h7MKv/K/5FPHG/WJqv0ezzR776/u38fPtxU05+k2iDInrfwO3f
   xNf2RyPbH9I9pKuxFqvIl+EtjQcsAHD6WuG8MgyHpGv8HoYdyQbyKFjLF
   SjWsoqiQW63vxtn7jvNVtXUvLzrUZRue5tkbNmLDST+7FM5rTC/UPCGH/
   gnLCxBl+3iZ4gFiE9Nq5FTMxhyLBkE6ipTzkh2QQ8ifmNhJjvise0a500
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; 
   d="scan'208";a="125982533"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Dec 2022 05:30:16 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 1 Dec 2022 05:30:13 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 1 Dec 2022 05:30:11 -0700
Date: Thu, 1 Dec 2022 12:29:53 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	<linux-riscv@lists.infradead.org>, <aou@eecs.berkeley.edu>, <corbet@lwn.net>,
	<guoren@kernel.org>, <heiko@sntech.de>, <paul.walmsley@sifive.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v1 2/3] RISC-V: resort all extensions in consistent orders
Message-ID: <Y4ieQf4Q9ywJivDH@wendy>
References: <20221130234125.2722364-1-conor@kernel.org>
 <20221130234125.2722364-3-conor@kernel.org>
 <20221201090041.525op4sateq5wq4y@kamzik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221201090041.525op4sateq5wq4y@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_043035_411786_356F8021 
X-CRM114-Status: GOOD (  42.79  )
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

On Thu, Dec 01, 2022 at 10:00:41AM +0100, Andrew Jones wrote:
> On Wed, Nov 30, 2022 at 11:41:25PM +0000, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > Ordering between each and every list of extensions is wildly
> > inconsistent. Per discussion on the lists pick the following policy:
> > 
> > - The array defining order in /proc/cpuinfo follows a narrow
> >   interpretation of the ISA specifications, described in a comment
> >   immediately presiding it.
> > 
> > - All other lists of extensions are sorted alphabetically.
> > 
> > This will hopefully allow for easier review & future additions, and
> > reduce conflicts between patchsets as the number of extensions grows.
> > 
> > Link: https://lore.kernel.org/all/20221129144742.2935581-2-conor.dooley@microchip.com/
> > Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---

> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > index 68b2bd0cc3bc..686d41b14206 100644
> > --- a/arch/riscv/kernel/cpu.c
> > +++ b/arch/riscv/kernel/cpu.c
> > @@ -161,12 +161,12 @@ device_initcall(riscv_cpuinfo_init);
> >   * New entries to this struct should follow the ordering rules described above.
> >   */
> >  static struct riscv_isa_ext_data isa_ext_arr[] = {
> > +	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
> > +	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> >  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
> >  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> >  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> >  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> > -	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
> > -	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> >  	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
> >  };
> 
> Technically we should have leave these in the wrong order if we want to be
> strict about the ISA string published to userspace, but I'm in favor of
> changing this array as necessary and hoping we teach userspace to use
> flexible parsers. Actually, IMO, we shouldn't teach userspace to parse
> this at all. We should instead create sysfs nodes:
> 
>  .../isa/zicbom
>  .../isa/zihintpause
>  .../isa/sscofpmf
> 
> and teach userspace to list .../isa/ to learn about extensions. That would
> also allow us to publish extension version numbers which we are not
> current doing with the proc isa string.
> 
>  .../isa/zicbom/major
>  .../isa/zicbom/minor
> 
> and we could add other properties if necessary too, e.g.
> 
>  .../isa/zicbom/block_size

Yah, this all kinda ties in with Palmer's RFC set that does the hwcap
stuff. Kinda been holding off on any thoughts on the isa string as a
valuable anything until that sees a proper respin.

> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 694267d1fe81..8a76a6ce70cf 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -199,12 +199,13 @@ void __init riscv_fill_hwcap(void)
> >  				this_hwcap |= isa2hwcap[(unsigned char)(*ext)];
> >  				set_bit(*ext - 'a', this_isa);
> >  			} else {
> > +				/* sorted alphabetically */
> >  				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
> > +				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
> > +				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
> >  				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
> >  				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
> >  				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
> > -				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
> > -				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
> >  			}
> >  #undef SET_ISA_EXT_MAP
> >  		}
> > @@ -284,6 +285,7 @@ static bool __init_or_module cpufeature_probe_zicbom(unsigned int stage)
> >   * This code may also be executed before kernel relocation, so we cannot use
> >   * addresses generated by the address-of operator as they won't be valid in
> >   * this context.
> > + * Tests, unless otherwise required, are to be added in alphabetical order.
> >   */
> >  static u32 __init_or_module cpufeature_probe(unsigned int stage)
> >  {
> > -- 
> > 2.38.1
> > 
> 
> I realize that I have a suggested-by tag in the commit message, but I

I did one thing as a "putting it out there" in the responses to another
series and you suggested something different entirely. Ordinarily, I'd
not put review comments in a suggested-by, but figured it was okay this
time.

> don't really have a strong opinion on how we order extensions where the
> order doesn't matter. A consistent policy of alphabetical or always at
> the bottom both work for me. I personally prefer alphabetical when
> reading the lists, but I realize we'll eventually merge stuff out of
> order and then that'll generate some churn to reorder (but hopefully not
> too frequently).

Think I said it at the yoke yesterday, but I don't think that this is
much of a problem. If it gets out of order, we just get someone that's
sending a patchset already to fix things up.

> My biggest concern is how much we need to care about the order of the
> string in proc and whether or not we're allowed to fix its order like
> we're doing with this patch. I hope we can, and I vote we do.

Being a bit hard-nosed about it:
- the spec has said for years that this order is not correct

- their parser cannot assume any given extension is even present, so the
  index at which the extension starts was only ever going to vary wildly

- to break a parser, it must expect to see extension Abcd before Efgh &
  that order has to change for them

- expecting that a given pair of extensions that appeared one after
  another would always do so is not something we should worry about
  breaking as it was always noted in the comment (and by the specs?)
  that new extensions would be added in alphabetical order (I'd like to
  think that if a clairvoyant wrote a parser and knew that there'd be
  nothing in the gap between the extensions we have now & what may be
  produced they'd also account for this re-ordering...)

- the re-order of sstc is going to land for v6.1 & the addition of sstc
  out of order landed in v6.0, so either that is an issue too or this is
  fine

I guess I sent the patches, so my opinion is fairly obvious, but I think
we change it & see if someone complains about an issue that something
other than a re-jig would break.

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
