Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04684C54EBC
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 11:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z9AJHcGzmvpKyMTftFjwhoEmuG/kWcLjiiwZhdONE94=; b=GR2eS1+jYCKZR4
	KpzCnn8+wMwmBey4SkmsdoXH9MCMpCP6XBTeWT1nY3CUkPzNpWygtV3hKHATV+pTlPKJ634JxLvjl
	jFCv2sTWyPL4uAFNtb1otIwp9Zw7J9jv0TyeQQ5tp+DQX+2gDJn6Le8Cc8kL1hmU6DoUCsj5Dx4eu
	CZw+sleBBkSN9Vd6wIQ0UdrRM4IxzkgGBuVVMzi9mTZisOeMStdevzXYsnjwuWUiUnHjeffpyWYO3
	6YA32VbaobpVBIli1nyYo2hlqvaV2ORcQRNBPUoxQ5QlZrSWIt6CkwYYtgDLFv3zHeXEJTIWIKKXw
	ZE94BCa22S84nst2NAtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFveT-00Eote-QU; Thu, 12 Jan 2023 11:21:45 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFveQ-00Eosq-Vr
	for linux-riscv@lists.infradead.org; Thu, 12 Jan 2023 11:21:44 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pFveN-0005fb-1N; Thu, 12 Jan 2023 12:21:39 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andrew Jones <ajones@ventanamicro.com>, Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, christoph.muellner@vrull.eu, conor@kernel.org, philipp.tomsich@vrull.eu, jszhang@kernel.org
Subject: Re: [PATCH v4 5/5] RISC-V: add zbb support to string functions
Date: Thu, 12 Jan 2023 12:21:38 +0100
Message-ID: <6183320.UjTJXf6HLC@diego>
In-Reply-To: <Y706jSZjUOle32m+@wendy>
References: <20230109181755.2383085-1-heiko@sntech.de> <20230110095720.j7ll3qwmwneodmpw@orel> <Y706jSZjUOle32m+@wendy>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_032143_057424_9E1A2901 
X-CRM114-Status: GOOD (  26.74  )
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

Am Dienstag, 10. Januar 2023, 11:14:37 CET schrieb Conor Dooley:
> On Tue, Jan 10, 2023 at 10:57:20AM +0100, Andrew Jones wrote:
> > On Mon, Jan 09, 2023 at 07:17:55PM +0100, Heiko Stuebner wrote:
> 
> > > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > > index 1b9a5a66e55a..c4d1aa166f8b 100644
> > > --- a/arch/riscv/kernel/cpu.c
> > > +++ b/arch/riscv/kernel/cpu.c
> > > @@ -162,6 +162,7 @@ arch_initcall(riscv_cpuinfo_init);
> > >   *    extensions by an underscore.
> > >   */
> > >  static struct riscv_isa_ext_data isa_ext_arr[] = {
> > > +	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
> > >  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
> > >  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> > >  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> > 
> > Huh, this array still doesn't appear to be in order... Zbb should
> > be getting inserted between the Zi* extensions (which should be first)
> > and the S* extensions and each of those three categories should be
> > in alphabetical order.
> 
> Correct. The new entry was at least added in the right place, reordering
> existing entries aside.
> 
> > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > > index 205bbd6b1fce..bf3a791d7110 100644
> > > --- a/arch/riscv/kernel/cpufeature.c
> > > +++ b/arch/riscv/kernel/cpufeature.c
> > > @@ -222,6 +222,7 @@ void __init riscv_fill_hwcap(void)
> > >  					set_bit(nr, this_isa);
> > >  				}
> > >  			} else {
> > > +				SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);
> > >  				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
> > >  				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
> > >  				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
> > 
> > I think we wanted this one in alphabetical order...
> 
> Correct again.
> 
> I've been avoiding mentioning this stuff in reviews though as Palmer has
> not yet picked up the patches [0] putting these arrays into those orders
> in the first place.
> 
> I tried to harass him about them last night, but he didn't get around to
> them. Perhaps worth mentioning tomorrow if we're gonna keep having to
> discussing these lists in reviews?
> 
> Thanks,
> Conor.
> 
> 0 - https://lore.kernel.org/all/20221205144525.2148448-1-conor.dooley@microchip.com/
> (I tried applying it yesterday, worked with `git am -3`)

I've gone forward and imported that series as a dependency in my tree so that the
ordering becomes correct :-) .

Though of course I got a conflict with Andrew's
commit e923f4625ed3 ("riscv: Apply a static assert to riscv_isa_ext_id")
but fixed that up - though maybe a rebased v3 may be in order?


Heiko




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
