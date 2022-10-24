Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B860C38A2D
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Oct 2022 07:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GiQ2FGirAXJEBkkjZbyg2ZyKjj5YY7S+YydAR0bVax8=; b=YEPpyR1DQnhLG/
	wvV8JnBAV3A5hAASlK5PXKCKQ+0cJetEP5X1K9pJ6YsKk42lPza311ZGavbHC4z6p7Hl5Y5Ymudxh
	5n6S2ES3YgaFut4ln9Ud0L3c+hZXoAGRvn7TtHTU0BK43Na0q9HQ425whBGCGIUgYeOvrGlUxSX+D
	tZkKFZB7qWakQ5dm7hmvCLkfS37N7AdfUUgE8XHxVT0CH496oXunuwo2k6Gx/2/UIfTXkrsvq9jdr
	pUV7PBBXsHmcnrSBS0TmJwLdbWrZamkPfOkWLnh9wE+WL4nAxfbkOTvgxyJ95yXw/YW0N81HWzIHO
	Y02QS+atu7c1OTTfu2Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omrah-00HR90-HU; Mon, 24 Oct 2022 07:09:43 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omrae-00HR7a-Ga
	for linux-riscv@lists.infradead.org; Mon, 24 Oct 2022 07:09:42 +0000
Received: by mail-ed1-x531.google.com with SMTP id a5so14655282edb.11
        for <linux-riscv@lists.infradead.org>; Mon, 24 Oct 2022 00:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HgMFGrTg5j8psvT/kCSxeh2gmeSzJURcrGx15Hw1Xj4=;
        b=RAbIBjxg+fWdM/nBCA8gOpCtrqNiXIM6Db+n/5PH1cRMUTueIH/tOz2cHeuBdqymbw
         ZKjWT42uE4l5dZSY+aj2ksxgWOkbmE2ahnJ5SEbtPJ+QvUkSb3hg6H7RL01CN6jJ/3hb
         wPk4CJV7U5pQOUBO9p24KMIL0J9E3YaobSrIRyQZi8YLy1HaJocSed2PH+7XWy9unqey
         G+CsumLYgixqrCnn1Vati1DmjNsw97IszjTn7pE7eIikjYHz/6TbF86bnPoTgPtCJnSr
         ras58ONLpWoqA+/DjgLV4seQ4PU8zKW/K/yfY04gCwlOcgHu9EK7/0Jsdp1trg28CGwd
         OZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgMFGrTg5j8psvT/kCSxeh2gmeSzJURcrGx15Hw1Xj4=;
        b=SE5SEz405Z599CXqcU3AqnuP4GTi6Q6VLjH/UceciHSxoid0oRj9ICtFQZs1l/hr2Z
         HrWhJKu00y+KcnA2ozgIC+BEPCCQwAJ/UQFIKDN0g8qEg0vjqYgHqE2HtWg3CvKuNiBv
         GpoYHhoq8+Ewrfo0CEtXUNzhHP2/gB2JYvE7RpBRZS79nHRBnUfl3YlF2sO7Z9NqWyeY
         zGonxsCeRclMnUQUCVzwweOSynaLDor7M2oM8ZXocY8O51+mlOwvYF4v9b5NZ9IiMeI3
         WSxmFhI7x45U+r7ToU7qZKKdoG3VbHfKdOdIb3swHUVuTLuVKhbb787SAF+/uD2MD9NU
         lBvg==
X-Gm-Message-State: ACrzQf2CArClO7WiZjFAzKExht+AwxwBDTNoF8/IAXvVc355R2/5rCVL
	hC/8TkeLCdsEZsS3WOLuAhuUow==
X-Google-Smtp-Source: AMsMyM7m+x+9O7x9nX/L4hudwF57h0OpOnFcSeTVLXi9+KHZM5DegnOWxoHWcmUgsAo5uBtOH7lz0g==
X-Received: by 2002:a17:907:980e:b0:78d:b6ea:25b3 with SMTP id ji14-20020a170907980e00b0078db6ea25b3mr26342825ejc.98.1666595376839;
        Mon, 24 Oct 2022 00:09:36 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id s25-20020a50ab19000000b004587f9d3ce8sm17965977edc.56.2022.10.24.00.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 00:09:36 -0700 (PDT)
Date: Mon, 24 Oct 2022 09:09:35 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 3/3] RISC-V: Ensure Zicbom has a valid block size
Message-ID: <20221024070935.ff62bcjl6z7i4flh@kamzik>
References: <20221021105905.206385-1-ajones@ventanamicro.com>
 <20221021105905.206385-4-ajones@ventanamicro.com>
 <Y1WYT97IQy3Q6BhF@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y1WYT97IQy3Q6BhF@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_000940_573633_4B63BF96 
X-CRM114-Status: GOOD (  32.52  )
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

On Sun, Oct 23, 2022 at 08:38:55PM +0100, Conor Dooley wrote:
> On Fri, Oct 21, 2022 at 12:59:05PM +0200, Andrew Jones wrote:
> > When a DT puts zicbom in the isa string, but does not provide a block
> > size, ALT_CMO_OP() will attempt to do cache operations on address
> > zero since the start address will be ANDed with zero. We can't simply
> > BUG() in riscv_init_cbom_blocksize() when we fail to find a block
> > size because the failure will happen before logging works, leaving
> > users to scratch their heads as to why the boot hung. Instead, ensure
> > Zicbom is disabled and output an error which will hopefully alert
> > people that the DT needs to be fixed. While at it, add a check that
> > the block size is a power-of-2 too.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/kernel/cpufeature.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 220be7222129..a4430a77df53 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -9,6 +9,7 @@
> >  #include <linux/bitmap.h>
> >  #include <linux/ctype.h>
> >  #include <linux/libfdt.h>
> > +#include <linux/log2.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> >  #include <asm/alternative.h>
> > @@ -70,6 +71,20 @@ EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
> >  
> >  static bool riscv_isa_extension_check(int id)
> >  {
> > +	switch (id) {
> > +	case RISCV_ISA_EXT_ZICBOM:
> > +		if (!riscv_cbom_block_size) {
> > +			if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM))
> 
> Maybe I've missed something... Why not check if !IS_ENABLED() & return
> false immediately rather than doing it inside the attribute checks?
> I'll be compiled out of zicbom is enabled, so not like the non-error
> patch will be penalised with an extra check.

Ths IS_ENABLED checks are only here to decide if we want to complain or
not, not to decide if we want to add the extension to the isa bitmap or
not. As we've decided for the KVM compilation fix for Zicbom patch we
don't mind the kernel knowing the extension 'foo' is present, even when
it's compiled without CONFIG_RISCV_ISA_FOO. Indeed, for Zicbom, KVM can
still offer the extension to guests, whether the host wants to use it or
not. So, for this code, we can't factor out the IS_ENABLED checks since
they're tied to the pr_err()s they're guarding, which are tied to the
sanity checks they're inside.

Thinking about it some more, though, maybe we should unconditionally
complain, but with a different message, one that doesn't imply the kernel
wanted to use the extension. Something like

  if (!riscv_cbom_block_size) {
      pr_err("Zicbom detected in ISA string, but no cbom-block-size found\n");
      return false;
  } else if (!is_power_of_2(riscv_cbom_block_size)) {
      pr_err("riscv_cbom_block_size present, but it is not a power-of-2\n");
      return false;
  }

I'm still not sure if those should be errors or warnings when
CONFIG_RISCV_ISA_ZICBOM=no, though.

Thanks,
drew

> 
> > +				pr_err("cbom-block-size not found, cannot use Zicbom\n");
> > +			return false;
> > +		} else if (!is_power_of_2(riscv_cbom_block_size)) {
> > +			if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM))
> > +				pr_err("cbom-block-size is not a power-of-2, cannot use Zicbom\n");
> > +			return false;
> > +		}
> > +		return true;
> > +	}
> > +
> >  	return true;
> >  }
> >  
> > -- 
> > 2.37.3
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
