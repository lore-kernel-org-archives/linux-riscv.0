Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D942C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 22:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0w25XD13mj6cmQVms1GZmZ3bIzOGXzpyvIEN6phdEb4=; b=fFL3137NDQQBbH
	9d+aJl+5oMVNZvoE7YlR0innIhzdK5BA2wJqmnpmERo9y0vy6SHETSKK9YeIWItCOZU8OAvP68OkD
	mnB0awvhvy4xkwg8f92Enf4kPSt5u2h5PpLs26BsMMSw++PLCZi+/vGwgt7rzHCpyYURqr3mnn0fZ
	aHfLxQBpDPfMgPmXn2/hj83HsLSa5rZVEeTMmhXy6jx+sXPKLjlJRXUYCQsbWNaOdibVcQ1bRgq7+
	rLbGiK6xyzF8V1K2t7kLcYkDgzvZK1s5NPI7KOjup9F18w/dbzprfU/47MoOgDylNgDKxRvPAmnEE
	2/wb52+X/WdGarQ8Z04w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0sRR-00BRsZ-2H; Thu, 01 Dec 2022 22:54:05 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0sDL-00BPxf-3p
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 22:39:32 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p0sDF-0004Fj-8b; Thu, 01 Dec 2022 23:39:25 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andrew Jones <ajones@ventanamicro.com>, Ard Biesheuvel <ardb@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com, conor@kernel.org, philipp.tomsich@vrull.eu, emil.renner.berthing@canonical.com, linux-efi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 12/14] efi/riscv: libstub: mark when compiling libstub
Date: Thu, 01 Dec 2022 23:39:22 +0100
Message-ID: <4822525.e9J7NaK4W3@diego>
In-Reply-To: <CAMj1kXG=zM0EFFPn8MBWFurk=oSRPqwdd6CP1dudQC+JXV36Og@mail.gmail.com>
References: <20221130225614.1594256-1-heiko@sntech.de> <20221201193455.2hr6mwm6sa6vnd3w@kamzik> <CAMj1kXG=zM0EFFPn8MBWFurk=oSRPqwdd6CP1dudQC+JXV36Og@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_143931_186300_B578A6CB 
X-CRM114-Status: GOOD (  35.20  )
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

Hi Ard,

Am Donnerstag, 1. Dezember 2022, 21:57:00 CET schrieb Ard Biesheuvel:
> On Thu, 1 Dec 2022 at 20:35, Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Wed, Nov 30, 2022 at 11:56:12PM +0100, Heiko Stuebner wrote:
> > > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > >
> > > We may want to runtime-optimize some core functions (str*, mem*),
> > > but not have this leak into libstub and cause build issues.
> > > Instead libstub, for the short while it's running, should just use
> > > the generic implementation.
> > >
> > > So, to be able to determine whether functions, that are used both in
> > > libstub and the main kernel, are getting compiled as part of libstub or
> > > not, add a compile-flag we can check via #ifdef.
> > >
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> I think it would be better to update arch/riscv/kernel/image-vars.h so
> that only these generic implementations are exposed to the stub in the
> first place.

The relevant code is in patch13 + patch14.

To provide more context, the actual str* function we want to run is
determined at runtime. This is due to a all the possible extensions
(present and future) a riscv core can or cannot support, which in turn
blooms into a plethora of possible implementations for them.

Of course we want to have a unified kernel image, so we check on boot
for available extensions and patch the call to the actual best function

The introduction in the mentioned patches is still simple with a
generic + bitmanipulation variant, but that is more to keep the changes
somewhat manageable and there are already more variants on the horizon.

So the actual strlen and friends is just an inline function with a call to
the actual function, which gets patched via alternatives.

So this looks then like:

--------- 8< ---------
static inline int strcmp(const char *cs, const char *ct)
{
#if defined(RISCV_EFISTUB) || defined(RISCV_PURGATORY)
        return __strcmp_generic(cs, ct);
#else
        register const char *a0 asm("a0") = cs;
        register const char *a1 asm("a1") = ct;
        register int a0_out asm("a0");

        asm volatile(
                ALTERNATIVE(
                        "call __strcmp_generic\n\t",
                        "call __strcmp_zbb\n\t",
                        0, CPUFEATURE_ZBB, CONFIG_RISCV_ISA_ZBB)
                : "=r"(a0_out)
                : "r"(a0), "r"(a1)
                : "ra", "t0", "t1", "t2", "t3", "t4", "t5");

        return a0_out;
#endif
}
--------- 8< ---------

When that gets pulled into libstub without that separation, libstub ends up
with references to __strcmp_generic and __strcmp_zbb.

Of course the zbb variant would never get used, but still would also need
to be present in libstub and image-vars.h just to make the build happy.

And for every additional variant this would also mean adding more to
unused code to libstub and image-vars.h, hence I came up with the flag
to mark when code gets to be part of libstub.


Heiko



> 
> > > ---
> > >  drivers/firmware/efi/libstub/Makefile | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
> > > index ef5045a53ce0..777d1ab059e3 100644
> > > --- a/drivers/firmware/efi/libstub/Makefile
> > > +++ b/drivers/firmware/efi/libstub/Makefile
> > > @@ -25,7 +25,7 @@ cflags-$(CONFIG_ARM)                := $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
> > >                                  -fno-builtin -fpic \
> > >                                  $(call cc-option,-mno-single-pic-base)
> > >  cflags-$(CONFIG_RISCV)               := $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
> > > -                                -fpic
> > > +                                -fpic -DRISCV_EFISTUB
> > >  cflags-$(CONFIG_LOONGARCH)   := $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
> > >                                  -fpie
> > >
> > > --
> > > 2.35.1
> > >
> >
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
