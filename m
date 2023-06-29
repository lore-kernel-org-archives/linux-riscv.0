Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AAA6EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 13:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t5/R4lYgaFm9dKeSsfCcBUGt5HU+Ldd6PZtbxdVXMrg=; b=MWi4wsSxEayeyq
	aqv5IVdVRdo5js6hBwok1qsNOxHEBye9PRcvFcC5e8pGX/ymj+gxeVkRa6Si/XelUPrfietErQroT
	GMjtjPCmqmHL2nkg56trGWbMaJD+EtMKopwwzSU2SdaAV6PTfZPQVgIzrMv6Jy6Q4iegTr/sNKzDd
	yluTy6saOWcBMa8G65Vric4ehFOL0elfT0KnwoezNQlxso7oSgiu4oWCgXYr/Kdu76LO0/AHqICXw
	rtWsqbkDITUTdCd+CZzShW1nHNTyySoQdXG19Bs8h/qallygzzCcro/TKPvsj6qnZUxfPQ9gOZqwW
	a/BUrgy98eeqvTjJAdGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEs5D-001EaQ-32;
	Thu, 29 Jun 2023 13:53:15 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEs5A-001EZN-1U
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 13:53:13 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-313f3cd6bb4so670346f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 29 Jun 2023 06:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1688046790; x=1690638790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=deXO6fUjQ/I1CcOjtw/6ftLQJ+2W+4iNuI5l6xeu1MY=;
        b=R3X+tNcWmh90c7FQO2IFEUfn3dY7XU/IHZ8m0K4m8FncWd17IOSWpZkcdQ/U4hooaD
         cgGmeTTrRr2OrRfKuTs1sHB+4cNZN5NqDhyzsmfk4Zxjjb56L51k//kPcbMmsSj01LRu
         D2R89DHBjJKgxDL6HCLJv3XKtZ/Twswg5Y7/iTwtbaAFODUrne1G0IHI8OdIxb5kchDd
         GRDkla/ZEuvPWSXTReK24119T8u8/ZPQYsYaoOtebqXT2a10XTEQ6uJ1S8wF2Oj08XDI
         06o58qwmThSFm8Zs1nzZTznOXaj9hIS1yUsdD8NKey0rq7eFGm833c2UCm9yBnmFXmlU
         LBzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688046790; x=1690638790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=deXO6fUjQ/I1CcOjtw/6ftLQJ+2W+4iNuI5l6xeu1MY=;
        b=JtwN+gkGWY+gtl6DwNsMEFv/vWvgaSnB/1SMXy7/D87p8V/3h082j1+RfNFrSGbUii
         M8Gk60ttOVjIDURrKRvSLqsBXajkXCquA85rlxyNBgls7DBzW3YSJxyHLrZJMVsjKVgz
         tgF8v4LIr1CnGd2jqSy6Rfimbd+QZYJKl+xCt79QGfKmSRirFzVrcrXWyaRWuuKLN6Bj
         TlzCx2n/exYayKVozQdMlGCwaGdbUdhD7wwhDKjZZ+xCGykGMnResNz/o6OoJUofcQln
         DWSyUNwpmTLxnFRnq/6bQNDzCkZazZVoqZStWblLERtxnLjL2YweCsJYw0bPpVruKVDX
         +JPQ==
X-Gm-Message-State: AC+VfDwt3XESOuCwp0eWxEKHQRbTtwy51sYmvvDUapcrE2u6cZsJLwU6
	tHB3EPbV9YHIaHJjC10JpZAFEQ==
X-Google-Smtp-Source: ACHHUZ7FopTsScqJSZJdQm5B0JeBmJRowx9BBtyn/tckLRY0Q6eU6yJYdVMGnFQeUUk6i7smW5PvUA==
X-Received: by 2002:a5d:564e:0:b0:313:f241:f198 with SMTP id j14-20020a5d564e000000b00313f241f198mr8536457wrw.8.1688046790109;
        Thu, 29 Jun 2023 06:53:10 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id b7-20020a5d45c7000000b003141a3c4353sm1340835wrs.30.2023.06.29.06.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 06:53:09 -0700 (PDT)
Date: Thu, 29 Jun 2023 15:53:08 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 10/10] RISC-V: provide a Kconfig option to disable
 parsing "riscv,isa"
Message-ID: <20230629-11c59410a48bba2c00bb2433@orel>
References: <20230629-rebuttal-vagueness-a699deb7c7b3@wendy>
 <20230629-resilient-grievance-d782163b09d6@wendy>
 <20230629-a80f112e6ed4158080867694@orel>
 <20230629-deceit-macarena-2a744ac70148@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230629-deceit-macarena-2a744ac70148@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_065312_504220_7406083C 
X-CRM114-Status: GOOD (  38.85  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, conor@kernel.org, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, Palmer Dabbelt <palmer@rivosinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Evan Green <evan@rivosinc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jun 29, 2023 at 12:39:51PM +0100, Conor Dooley wrote:
> On Thu, Jun 29, 2023 at 11:31:33AM +0200, Andrew Jones wrote:
> > On Thu, Jun 29, 2023 at 09:28:56AM +0100, Conor Dooley wrote:
> > > As it says on the tin, provide a Kconfig option to disabling parsing the
> > > "riscv,isa" devicetree property. Hide the option behind NONPORTABLE so
> > > that only those willing to keep the pieces enable it, and make sure the
> > > default kernel contains the fallback code.
> > > 
> > > Suggested-by: Palmer Dabbelt <palmer@rivosinc.com>
> > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> > >  arch/riscv/Kconfig             | 16 ++++++++++++++++
> > >  arch/riscv/kernel/cpu.c        |  3 +++
> > >  arch/riscv/kernel/cpufeature.c |  2 +-
> > >  3 files changed, 20 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > index 1d39efe2b940..0e1909ac5947 100644
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -291,6 +291,22 @@ config NONPORTABLE
> > >  
> > >  	  If unsure, say N.
> > >  
> > > +config NO_RISCV_ISA_FALLBACK
> > > +	bool "Permit falling back to parsing riscv,isa for extension support"
> > > +	depends on NONPORTABLE
> > > +	help
> > > +	  Parsing the "riscv,isa" devicetree property has been deprecated and
> > > +	  replaced by a list of explicitly defined strings. For compatibility
> > > +	  with existing platforms, the kernel will fall back to parsing the
> > > +	  "riscv,isa" property if the replacements are not found.
> > > +
> > > +	  Selecting Y here will result in a kernel without this fallback, and
> > > +	  will not work on platforms where the devicetree does not contain the
> > > +	  replacement 	  properties of "riscv,isa-base" and
> >                      ^ spacing issue
> 
> Huh, weird. Given the tab followed by spaces, it must have snuck in
> during reflow of the text after some rewording.
> Wonder how I missed it, given that...
> 
> > Should we also have a kernel command line option, 'isa_fallback', where
> > without this config the command line option is not necessary to fallback,
> > but, with this config, no fallback will be done unless 'isa_fallback' is
> > provided?
> 
> I don't know, maybe I have the wrong end of the stick but it feels a bit
> premature for something that may never not be hidden behind NONPORTABLE?
> Perhaps that could be left for a point in time where the default value
> of the symbol changes, or the dependency on NONPORTABLE is removed?
> 

With the command line option, we could consider dropping NONPORTABLE (but
still default off this config). What I'm thinking is that if we want to
encourage the adoption of the new format, then there should be a bit of
pain when it's not used, but not enough pain to risk rebellion. So,

 * defconfig builds will silently/painlessly fallback

 * builds that want to encourage adoption enable this config and will
   fail to boot when they don't get what they want and don't have the
   command line option

 * users still working through the growing pains can manage when
   the boot fails, and when it doesn't, with the command line

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
