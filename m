Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAE9C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Nov 2022 17:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EEi3BVBVKEcPfHxt/GoAtFL2dB6vGI5R+0ZDyqh7ahU=; b=lxCztXXeoWFA9l
	4aStjMQGbjZzT+SeOyp/dj7U3osYxmnH8xSzEkShBiB/4jjCVI+w9FsdyzNYyfJT0S003gWc0PFxY
	u+iXE8qlk2FC3E+25/kcXOc4xMDmoms2CLcJF7Ccr1GvLOaJh/ke0KTQrfg0jDsQ8MdoODvEAGef+
	Fg/kSmJxHzucwOqOwRi3O6DpwhcjRgpyQa4fhI92GR+HuiTU0Hu24MLDrOb3q4o41ul/doAm87Cm4
	CS0Go3fEoIzqlPKqtIhWL/zzD2hZF/XN7HpWIL6QkNz7z6KFTiV0uPjA8ga3opLQvEwXiN1CaWIto
	sgKCv0u+9W5FKSB5ZMVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouGeq-00Cd1s-O5; Sun, 13 Nov 2022 17:20:36 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouGeo-00Cczp-Cs
	for linux-riscv@lists.infradead.org; Sun, 13 Nov 2022 17:20:35 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ouGek-0003Yq-3l; Sun, 13 Nov 2022 18:20:30 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com, philipp.tomsich@vrull.eu, ajones@ventanamicro.com, emil.renner.berthing@canonical.com
Subject: Re: [PATCH 1/7] efi/riscv: libstub: mark when compiling libstub
Date: Sun, 13 Nov 2022 18:20:29 +0100
Message-ID: <2243332.usQuhbGJ8B@diego>
In-Reply-To: <Y3EmWsGanb4jf35F@spud>
References: <20221110164924.529386-1-heiko@sntech.de> <20221110164924.529386-2-heiko@sntech.de> <Y3EmWsGanb4jf35F@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221113_092034_463877_0D0182AA 
X-CRM114-Status: GOOD (  22.26  )
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

Am Sonntag, 13. November 2022, 18:16:10 CET schrieb Conor Dooley:
> On Thu, Nov 10, 2022 at 05:49:18PM +0100, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > 
> > We want to runtime-optimize some core functions (str*, mem*)
> > but not have this leak into libstub. Instead libstub
> > for the short while it's running should just use the generic
> 
> Totally pedantic reword, mostly b/c I am an eejit and confused myself
> the first time reading this:
> 
> "Instead, libstub, for the short while it's running, should just use
> the generic implementation."
> 
> > implementation.
> > 
> > To be able to determine whether functions are getting compiled
> > as part of libstub or not, add a compile-flag we can check
> > via #ifdef.
> 
> Exempting the stub makes sense to me given when it runs. What's the
> actual downside of not exempting it though?

You run into build-errors.

I.e. the alternatives (zbb-variants in this case) get compiled
so there is the reference to the _strlen_zbb function in the efi-stub,
which of course is not fullfillable, hence the "magic" in patch6 :-) .


Heiko


> > Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > ---
> >  drivers/firmware/efi/libstub/Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
> > index b1601aad7e1a..39c8e3da1937 100644
> > --- a/drivers/firmware/efi/libstub/Makefile
> > +++ b/drivers/firmware/efi/libstub/Makefile
> > @@ -25,7 +25,7 @@ cflags-$(CONFIG_ARM)		:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
> >  				   -fno-builtin -fpic \
> >  				   $(call cc-option,-mno-single-pic-base)
> >  cflags-$(CONFIG_RISCV)		:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
> > -				   -fpic
> > +				   -fpic -DRISCV_EFISTUB
> >  cflags-$(CONFIG_LOONGARCH)	:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
> >  				   -fpie
> >  
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
