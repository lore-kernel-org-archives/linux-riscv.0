Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF496C79FB6
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 15:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XWVWoTFknYPlvKXP7bQbnHxGDL4HhNnMampmiDIbC/E=; b=joVg81MdqWx4FE
	JaOIhQt7Pc4Z+nP1Q96Y5lB/4CkBDyKgf1J3oZ8yjyLxJSjTMPWxT1n5eteb7J8Rte3kbPzBAiNIw
	QNwPnYCM6JPIv+tQcTSmU97Lh9TJ113/WJBHJrxCPGAJwy7wCTVOetmHjZzk6pg7P1/h4X4b4cIG6
	lbXnk9clCCyW8c2Dynrww3rQnrhADr+AtudxF9iICl2trxnEUHplVZ+kcbn/vIYRnnejEnMEmYT5c
	zfOL70ZwAJLaNi8O8YRT2ncGzeLJO3WQhNcmCTslG06pPTzHlnMC9bPBz90wVfT5OfYHpcaCk4TX0
	YG/yXskAox+BIWInHJlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4K76-0000000C7xh-2zGK;
	Wed, 09 Sep 2026 15:21:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4K75-0000000C7x7-0sAp
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 15:21:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F155841772;
	Wed,  9 Sep 2026 15:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A28601F00A3A;
	Wed,  9 Sep 2026 15:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788967286;
	bh=rNUvA2/lQtpBECQm6efuKE8jX/o1YQk5zTI6Hl7HK0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RhDaHzT6GUcF2HWTvpoJElGyNMHmJSDgj1ko7bu6VBsyOE23dRHeBuzp/IgJicJLu
	 SGssZIMoPGM1cmma2sCr6OUn5ao0t3y4wT8vW9jgt/7g4u0yywdrNV8WKXFO1h/B3x
	 C/K7+4UXXEdkONlAsqWBc8rN8RsfJaB4RxlA/LC68yqVsvl1mYV5CUymKi+zQM2n6F
	 GZKZOYNThfxdR3AYELn4ch3N8BdwMOn68fPG97UFAyaIMK8cbqTV9GZF5tx2uSeXlw
	 nkscrSqXojNmTocE240Fn9la0KKT+WwJPW74gKw6ZXckSdxuj91xMNTmrkRrRjq2dS
	 LVExWNenhvauQ==
Date: Wed, 9 Sep 2026 23:01:37 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com
Subject: Re: [PATCH v2 3/5] riscv: support early isa ext and use it to
 optimize pgtable_l4|l5_enabled
Message-ID: <aqF00YcBdJIupeJr@xhacker>
References: <20260907151437.7603-1-jszhang@kernel.org>
 <20260907151437.7603-4-jszhang@kernel.org>
 <20260907-smashup-darn-93d1ee105a57@spud>
 <ap-EZ-rb7RJ5ykmG@xhacker>
 <20260908-baggie-tripping-c2cee6bb4947@spud>
 <aqCeaXYJEdW78PMV@xhacker>
 <aqFHr3BWR0XhxMsv@squawk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aqFHr3BWR0XhxMsv@squawk>
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

On Wed, Sep 09, 2026 at 12:49:09PM +0100, Conor Dooley wrote:
> On Wed, Sep 09, 2026 at 07:46:49AM +0800, Jisheng Zhang wrote:
> > > > This assumes SV48 and SV57 are the only "early" users, but
> > > > other ISA ext may also need "early", who knows. So if future some extensions
> > > > need the "early", the code is ready, the author doesn't need to care about
> > > > the isa filling at all.
> > > > 
> > > > So I prefer my patch as is. What's your opinion?
> > > 
> > > We're about decade into the port being merged and this is the only thing
> > 
> > but the isa extension alternative is not, it was introduced by me three
> > years ago. But no matter how many years, 
> > 
> > > behaving in this way. I don't think the code in this patch is worth it on
> > > the off chance that something else comes along. If it does, we can
> > 
> > this makes sense. Let me cook a new version
> > 
> > > always fish this implementation back up and use it.
> > 
> > > 
> > > I'd also like to differentiate this code from "needing early", because
> > > this is about populating the information early in the extension bitmap,
> > > rather than about actually needing the information. There's no advantage
> > 
> > the code after arch/riscv/mm/init.c but before mmu on needs the
> > bitmap informaion when pgtable_l5|l4_enabled() is called (w/o
> > USE_EARLY_PGTABLE_LEVELS)
> 
> Oh, I must have missed something then, I didn't realise you were
> patching the alternatives early - I thought you were skipping them until
> the information became available at the normal time. Sorry bout that.


Aha, your suggestion about the simplifying the isa bitmap filling
still works.

> 
> How bad is the damage btw, if you implement pgtable_l5_enabled() as
> 
> static __always_inline bool pgtable_l5_enabled(void)
> {
> 	if (riscv_has_extension_likely(RISCV_ISA_EXT_SV57))
> 		return true;
> 
> 	return _pgtable_l5_enabled;
> }
> 
> ? It shouldn't be too bad since it should get expanded to stuff like
> 
> 	if (riscv_has_extension_likely(RISCV_ISA_EXT_SV57) || _pgtable_l5_enabled)
> 
> by the compiler. I wonder if you can do this and get rid of
> USE_EARLY_PGTABLE_LEVELS entirely, since the unpatched alternative
> should return false?

I know why you want this. AIUI, the early patched alternative is
still needed outside arch/riscv/mm/init.c but before mmu on. For
example, on a SV57 capable platform, the set_satp_mode() will detect
pgtable cap correctly, then _pgtable_l5_enabled = true and
_pgtable_l4_enabled = true, then any pgtable_l5|l4_enabled() calling
outside init.c but before mmu on also expects true. so we need to set
the isa bitmap so that latter apply_early_boot_alternatives() can
correctly patch .text section for us.

BTW, the USE_EARLY_PGTABLE_LEVELS is stolen from the x86 world, see
its USE_EARLY_PGTABLE_L5 ;)

> 
> Cheers,
> Conor.
> 
> (btw, I am kinda unavailable til the 22nd, so sorry if I take some time
> to reply here or to a new revision)

I just sent out v3, could you plz kindly review it when convenient

> 
> > 
> > > gained, as far as I can tell, by setting this early and it only makes
> > > the code more complicated.
> > > 
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
