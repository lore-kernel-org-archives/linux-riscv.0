Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA84C38A2D
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Oct 2022 08:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M8xOsvGdYy8DbKsqxWGFjF3aOyZsKvnvBGPj7YWlsKs=; b=cNpzq3UKBWYkrU
	MCh/mD5o73wlE5/k3Va50xcUMULmY4nXj2Bgb1cYkOtLjVChOXJ7cG6obRrMLDIWW0pzOROOhLkEy
	wz8XhwJ9GC3Iy9A/DjKhOfoM6pW5nAIvuwW2AOVAhUlxTUK9Oq59ZPRiDzpDRmH5B9P7QeJa2O+CT
	IaDemzQ2HvO+bL31ZYY21H9cSPGannzh8SLwQlT2d77nTNf2GVRncvQxc2lJWi8zEib1ukGuDGruA
	RUq6Co2M15Gh/YS2MumBtBHc2V0JK8vFJgKkhWMcRyLijE9KYuzHTBJYssPVSsAvgOf227PocZ8sR
	mpw/C3MG2N17Rg7GjVSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omsww-000A1A-WB; Mon, 24 Oct 2022 08:36:47 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omsvf-0009IN-Sg
	for linux-riscv@lists.infradead.org; Mon, 24 Oct 2022 08:35:30 +0000
Received: by mail-ed1-x536.google.com with SMTP id b12so28460821edd.6
        for <linux-riscv@lists.infradead.org>; Mon, 24 Oct 2022 01:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=39WHpXhtT0N+hZSDgTZ0tCOhceQWnucOBNoNO2itXes=;
        b=lxFfdYmNqpTpLZm9TqkccTaspAQwtMd1E+xxuUpAhvy2GP4fjgBqNTyJSUuCrxfJcs
         PFYKXWkm1Jzoz75CPVx82ara+pNEArzxrpXbpvonqUsDZuVezqkbsNr9QR2QiCO1UFhW
         wX6ZHTaMDBiCkUewNTEx6T7341ItDaAD79N0HPM2HCT9XT4cVWsbfMX4Cs+nZkvQg1Dq
         uyCrrrhx/UH3Y3llngKEUieE4bE6i9yVPG+gWrGCidnJJ708as0jYPAiKlAa43HDpbwK
         0H6s8Cr6mozpSOfMFUKnkugHN2D9Q/nGmNDpNGZVpdfYLgpZ49qxGi2SnU4qLt6xkcJ1
         FKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39WHpXhtT0N+hZSDgTZ0tCOhceQWnucOBNoNO2itXes=;
        b=3JNtLIDbwz5vEZo9WvrfoQDPmuYGjl2ROSCDPW6bq1Pwy+IlOaViJEM93DDX6KvaWp
         c7ypt+HfU0sCzhUIXX/x20jW250ZJwRmV+qF6wIE4HgPYbxYYgM6/pQJE7eXDhS5ppCB
         tqhrbWshIIH8p/FLlcEgJF7hba2tVWevaZk/8ngeXY/4RGcluk2IYeFB8t/EAqGL2laF
         BUJGotbbdsrkGsrdcro6f8F24NT4t47HC5d5ogWIEvWLA8LOLpdTejGX2WboR4iKetam
         BSMGQHjxpSQWoc0CjuNGBwV49P2YX6k+Oi4eIuJYI0OFtzRz0dIOvqOBZ6hJbOawE2ID
         FmmQ==
X-Gm-Message-State: ACrzQf2BZ1I6YCZBc5fASWqFemkjdPxCB2PeJ9dHxIUrdHTottGOgj4l
	9RJlWxquD4f9fapD2luBLvEk0w==
X-Google-Smtp-Source: AMsMyM5VlFNoeOOnZEeVGZB2hEQpD+IJ+YAKECxituYDDcfW/q5puxM6Jk58tHLeEybBuxcuEVM/6g==
X-Received: by 2002:a17:907:6d18:b0:78e:259d:c391 with SMTP id sa24-20020a1709076d1800b0078e259dc391mr26624036ejc.615.1666600523465;
        Mon, 24 Oct 2022 01:35:23 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id p5-20020a170906498500b0078b83968ad4sm15124286eju.24.2022.10.24.01.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 01:35:23 -0700 (PDT)
Date: Mon, 24 Oct 2022 10:35:22 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 3/3] RISC-V: Ensure Zicbom has a valid block size
Message-ID: <20221024083522.fgwej6saqhbvumfj@kamzik>
References: <20221021105905.206385-1-ajones@ventanamicro.com>
 <20221021105905.206385-4-ajones@ventanamicro.com>
 <Y1WYT97IQy3Q6BhF@spud>
 <20221024070935.ff62bcjl6z7i4flh@kamzik>
 <Y1ZKLjC/ZnnjSNy2@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y1ZKLjC/ZnnjSNy2@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_013527_991539_827C0375 
X-CRM114-Status: GOOD (  48.17  )
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

On Mon, Oct 24, 2022 at 09:17:50AM +0100, Conor Dooley wrote:
> On Mon, Oct 24, 2022 at 09:09:35AM +0200, Andrew Jones wrote:
> > On Sun, Oct 23, 2022 at 08:38:55PM +0100, Conor Dooley wrote:
> > > On Fri, Oct 21, 2022 at 12:59:05PM +0200, Andrew Jones wrote:
> > > > When a DT puts zicbom in the isa string, but does not provide a block
> > > > size, ALT_CMO_OP() will attempt to do cache operations on address
> > > > zero since the start address will be ANDed with zero. We can't simply
> > > > BUG() in riscv_init_cbom_blocksize() when we fail to find a block
> > > > size because the failure will happen before logging works, leaving
> > > > users to scratch their heads as to why the boot hung. Instead, ensure
> > > > Zicbom is disabled and output an error which will hopefully alert
> > > > people that the DT needs to be fixed. While at it, add a check that
> > > > the block size is a power-of-2 too.
> > > > 
> > > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > > ---
> > > >  arch/riscv/kernel/cpufeature.c | 15 +++++++++++++++
> > > >  1 file changed, 15 insertions(+)
> > > > 
> > > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > > > index 220be7222129..a4430a77df53 100644
> > > > --- a/arch/riscv/kernel/cpufeature.c
> > > > +++ b/arch/riscv/kernel/cpufeature.c
> > > > @@ -9,6 +9,7 @@
> > > >  #include <linux/bitmap.h>
> > > >  #include <linux/ctype.h>
> > > >  #include <linux/libfdt.h>
> > > > +#include <linux/log2.h>
> > > >  #include <linux/module.h>
> > > >  #include <linux/of.h>
> > > >  #include <asm/alternative.h>
> > > > @@ -70,6 +71,20 @@ EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
> > > >  
> > > >  static bool riscv_isa_extension_check(int id)
> > > >  {
> > > > +	switch (id) {
> > > > +	case RISCV_ISA_EXT_ZICBOM:
> > > > +		if (!riscv_cbom_block_size) {
> > > > +			if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM))
> > > 
> > > Maybe I've missed something... Why not check if !IS_ENABLED() & return
> > > false immediately rather than doing it inside the attribute checks?
> > > I'll be compiled out of zicbom is enabled, so not like the non-error
> > > patch will be penalised with an extra check.
> > 
> > Ths IS_ENABLED checks are only here to decide if we want to complain or
> > not, not to decide if we want to add the extension to the isa bitmap or
> > not. As we've decided for the KVM compilation fix for Zicbom patch we
> > don't mind the kernel knowing the extension 'foo' is present, even when
> > it's compiled without CONFIG_RISCV_ISA_FOO. Indeed, for Zicbom, KVM can
> 
> Of course, how did I forget last weeks breakage already...
> 
> > still offer the extension to guests, whether the host wants to use it or
> > not. So, for this code, we can't factor out the IS_ENABLED checks since
> > they're tied to the pr_err()s they're guarding, which are tied to the
> > sanity checks they're inside.
> 
> So yeah, this all makes sense.
> 
> > 
> > Thinking about it some more, though, maybe we should unconditionally
> > complain, but with a different message, one that doesn't imply the kernel
> > wanted to use the extension. Something like
> > 
> >   if (!riscv_cbom_block_size) {
> >       pr_err("Zicbom detected in ISA string, but no cbom-block-size found\n");
> >       return false;
> >   } else if (!is_power_of_2(riscv_cbom_block_size)) {
> >       pr_err("riscv_cbom_block_size present, but it is not a power-of-2\n");
> >       return false;
> >   }
> > 
> > I'm still not sure if those should be errors or warnings when
> > CONFIG_RISCV_ISA_ZICBOM=no, though.
> 
> My initial thought here was along the lines of "why care about the
> issues when it's not enabled", but I went to get some caffeine before
> replying and had a change of heart.
> IMO, it'd be good to tell people that their DT doesn't describe their
> hardware properly when it's gone wrong in a way that we cannot really
> spot via dtbs_check etc. I'll go away and have a think about whether
> the DT checks can force cbom-block-size if zicbom is in the isa string,
> but I'm not sure if that sort of conditional is checkable.
> If either of these error cases are hit (regardless of whether you set
> CONFIG_RISCV_ISA_ZICBOM) then it'd cause issues for KVM right? That
> would imply printing unconditionally to me.

Yes and no. KVM won't have any issues as it won't see Zicbom in the ISA
bitmap and therefore won't consider offering it to guests. However, it
could have offered it to guests, if only the DT was fixed, so I agree,
it's best to unconditionally complain when we see something wrong.

> The level at which to
> actually emit that is beyond the scope of what I care about though ;)

This stackoverflow.com thread indicates I should use 'error'.
https://stackoverflow.com/questions/2031163/when-to-use-the-different-log-levels

I'll send a v2 with IS_ENABLED dropped and the wordage changed to not
imply that the kernel wanted to use the extension, in case it didn't.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
