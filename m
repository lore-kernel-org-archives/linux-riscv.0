Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C12CC43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 10:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2sQTpTJF2vZXl3JjU37uyXoX+N8JnwO/V+7/4Y39cTc=; b=CfSB0k0PyQvTVL
	zUSBYLFZeSP9J9wDxk4osI1ehLrLC0n7CIYD9+tk1tNaANYpk/hlGQB0GSskAoGbCn7hOpMKUJCqv
	GSCeTqabbBYuJGSLfP9aAc7iU6p1uP8c0oN//y1GpoPTMhB2CWM3/GVDD9HjXV+HRC88g3Z6pkHh1
	RJEajhr0VqvQV8J5z211dgDVCkMnLsfJcCXEk8uUca1+jlIuWXakUDAbo7jHv+ilx6FznsHFvDxFl
	z0Qa1WJVhN/J67AiEdT6+jZ2EDh3s0OToX2lZRNGicyHGmWt+DiWPiDd4DXunPFjunS5peU88XKZZ
	Mwat3W9DRhDm2zvCy3ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0h62-006pWJ-7u; Thu, 01 Dec 2022 10:47:14 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0h5z-006pUg-A8
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 10:47:12 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p0h5t-0000rB-MD; Thu, 01 Dec 2022 11:47:05 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Conor Dooley <conor@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, aou@eecs.berkeley.edu, corbet@lwn.net, guoren@kernel.org, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v1 2/3] RISC-V: resort all extensions in consistent orders
Date: Thu, 01 Dec 2022 11:47:04 +0100
Message-ID: <46873028.fMDQidcC6G@diego>
In-Reply-To: <20221201090041.525op4sateq5wq4y@kamzik>
References: <20221130234125.2722364-1-conor@kernel.org> <20221130234125.2722364-3-conor@kernel.org> <20221201090041.525op4sateq5wq4y@kamzik>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_024711_376910_315B3354 
X-CRM114-Status: GOOD (  27.74  )
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

Am Donnerstag, 1. Dezember 2022, 10:00:41 CET schrieb Andrew Jones:
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
> > I could not decide between adding an alphabetical comment to each
> > alphabetical site or not. I did it anyway. Scream if you hate it!
> > 
> > I also moved a static branch thingy in this version, but that should not
> > matter, right? riightt?
> 
> riiighttt. And it goes away with [1] anyway.
> 
> [1] https://lore.kernel.org/all/20221006070818.3616-1-jszhang@kernel.org/

I'm not sure what became of that series since mid october, though noting
that tightly coupling the patching to extensions alone might cause issues [2]
which some of the "features" like fast-unaligned access, that are not directly
bound to a isa-extension but to an implementation detail

[2] https://lore.kernel.org/all/1991071.yIU609i1g2@phil/


> 
> > ---
> >  arch/riscv/include/asm/hwcap.h | 12 +++++++-----
> >  arch/riscv/kernel/cpu.c        |  4 ++--
> >  arch/riscv/kernel/cpufeature.c |  6 ++++--
> >  3 files changed, 13 insertions(+), 9 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > index b22525290073..ce522aad641a 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -51,14 +51,15 @@ extern unsigned long elf_hwcap;
> >   * RISCV_ISA_EXT_MAX. 0-25 range is reserved for single letter
> >   * extensions while all the multi-letter extensions should define the next
> >   * available logical extension id.
> > + * Entries are sorted alphabetically.
> >   */
> >  enum riscv_isa_ext_id {
> >  	RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
> > +	RISCV_ISA_EXT_SSTC,
> > +	RISCV_ISA_EXT_SVINVAL,
> >  	RISCV_ISA_EXT_SVPBMT,
> >  	RISCV_ISA_EXT_ZICBOM,
> >  	RISCV_ISA_EXT_ZIHINTPAUSE,
> > -	RISCV_ISA_EXT_SSTC,
> > -	RISCV_ISA_EXT_SVINVAL,
> >  	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
> >  };
> 
> Unrelated to this patch, but every time I look at this enum I want to post
> the diff below, but I haven't bothered, because this enum also goes away
> with [1].
> 
> @@ -59,8 +59,9 @@ enum riscv_isa_ext_id {
>         RISCV_ISA_EXT_ZIHINTPAUSE,
>         RISCV_ISA_EXT_SSTC,
>         RISCV_ISA_EXT_SVINVAL,
> -       RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
> +       RISCV_ISA_EXT_ID_MAX
>  };
> +static_assert(RISCV_ISA_EXT_ID_MAX <= RISCV_ISA_EXT_MAX);

that sounds like a very reasonable idea ... what's keeping you? :-)


Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
