Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F15FA3740
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 14:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eAaNG1FC+1qORETOiRIR4mtL9sh62mZrnTBlKfcpq/U=; b=zXRJ40QBkQvjLy
	HGtm4vVK2fdyTSiquOEhb3BZKubT+BBvcmGTvE3Z2scOuxu7xf+0f/AHobW6uPMroNOiWstABs3FE
	ICECZHSFE/3h1NW2+hx4E78YkR5BvJrCbr+xP1d0eAC9RJdU9G3wvtHzrLnIV8kRObswpZXkJE4iU
	mcQKVXBmty7R3yJIbsjFu06GU+bJVt0ImwWRfhIsPUBrj2MvHtntZJfxaPmuvR5OgueO1Hzecuq1n
	GOr1jaI+YWFrjjIThJ3drFfEPOZGHF33NK8sT8rvWfCiHxIz7uiTGjnRBm/UvFuY0Tyx/KE8JG+Si
	odimk2LdkxNd7VTGX2BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo3h5-00DmWD-0q; Thu, 27 Oct 2022 14:17:15 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo3h2-00DmTv-Ec
	for linux-riscv@lists.infradead.org; Thu, 27 Oct 2022 14:17:13 +0000
Received: by mail-wr1-x42b.google.com with SMTP id z14so2403427wrn.7
        for <linux-riscv@lists.infradead.org>; Thu, 27 Oct 2022 07:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e4YlgYuCLoM9Crpccqb33NDf543NNKrBtiPvnJr1WSE=;
        b=jBydwqFeN6O5ynAp5spvqkWsMaOAcvV7ZJ4ULTsehAUddrlJjDbKOGSO1KOIBD+9Do
         Au5Dx0dZWAFd5gpIPub/6DGfvQ++PWk0AYLaXLuYYk4tKxGqBq98i5GfvRyOaOD4UCt9
         sRJJi8qR1xXWwBVsISD+BioqOnvrgWtyWYf4BdADCMi2zwQGMRWrg/l7jWFWS3zS1iyB
         WTrtd0HQ08Lbb2RyAyDVMSLC76WJdVtGv5OsbWK+n4XYNYP0pVSGNcgOgTYqAdkKP1Yz
         3SgYJenBoLkzbZyKUAkq8TTHfBSZ62m7QF5VlPJPj+OPgYOwP4WNjmIAvgWaspyYhW6L
         fAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e4YlgYuCLoM9Crpccqb33NDf543NNKrBtiPvnJr1WSE=;
        b=2hqBKvGiprUypPYyIUFskajIY3AgTEiVCuKO6UGA/NxRelmJilFeKUgGqNcYYUZLXT
         dav+FUFC9ZVXcG7hKjCkgPm4wYAqdUOph8gRHHdzN6ob9dLRb2ckJFNmPEYSE80GZEo5
         f9QA1Ms/iMRiQeqEdSOZVrAVuW8qnDec3m47cJgIs7+wdlVpSD49kbEbEeRIbtJU8Mpg
         P20L+4/3GedtkLS8nBqeuhy4reNfYu5fWO3K9elpLSnOV7KtHae1daXJFeO4t1etud7F
         aWPBY3K/kncX0FGnWe4bmyu+ZXA9q1LYOJZUG0gztQuzxB0fbGBRloV1hk6/pyWHg+P7
         q6fg==
X-Gm-Message-State: ACrzQf0pE/x2nga3TcM4Z20QFcjwmncyDg+kQ8mKzWz8xxMaJ4sYuN2B
	0bXLoOe6Ux5jbIKGnoR0qY8jdg==
X-Google-Smtp-Source: AMsMyM7id9sgWazP91CMyZtLFeUxyzWhyxRAZ2lAQ6H8wMpQCjQ58vDEOd/GGCUquWvl+y1DcqV3Jg==
X-Received: by 2002:a5d:44d0:0:b0:236:4acc:d977 with SMTP id z16-20020a5d44d0000000b002364accd977mr23654853wrr.479.1666880209710;
        Thu, 27 Oct 2022 07:16:49 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id i6-20020adfdec6000000b002366ded5864sm1301006wrn.116.2022.10.27.07.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 07:16:49 -0700 (PDT)
Date: Thu, 27 Oct 2022 16:16:48 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v2 3/3] RISC-V: Ensure Zicbom has a valid block size
Message-ID: <20221027141648.26erujzb7qf6rz37@kamzik>
References: <20221024091309.406906-1-ajones@ventanamicro.com>
 <20221024091309.406906-4-ajones@ventanamicro.com>
 <3361717.44csPzL39Z@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3361717.44csPzL39Z@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_071712_512249_F272FD73 
X-CRM114-Status: GOOD (  27.22  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 27, 2022 at 03:16:48PM +0200, Heiko St=FCbner wrote:
> Hi,
> =

> Am Montag, 24. Oktober 2022, 11:13:09 CEST schrieb Andrew Jones:
> > When a DT puts zicbom in the isa string, but does not provide a block
> > size, ALT_CMO_OP() will attempt to do cache operations on address
> > zero since the start address will be ANDed with zero. We can't simply
> > BUG() in riscv_init_cbom_blocksize() when we fail to find a block
> > size because the failure will happen before logging works, leaving
> > users to scratch their heads as to why the boot hung. Instead, ensure
> > Zicbom is disabled and output an error which will hopefully alert
> > people that the DT needs to be fixed. While at it, add a check that
> > the block size is a power-of-2 too.
> > =

> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/kernel/cpufeature.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> > =

> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeat=
ure.c
> > index 220be7222129..93e45560af30 100644
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
> > @@ -70,6 +71,18 @@ EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
> >  =

> >  static bool riscv_isa_extension_check(int id)
> >  {
> > +	switch (id) {
> > +	case RISCV_ISA_EXT_ZICBOM:
> > +		if (!riscv_cbom_block_size) {
> > +			pr_err("Zicbom detected in ISA string, but no cbom-block-size found=
\n");
> > +			return false;
> > +		} else if (!is_power_of_2(riscv_cbom_block_size)) {
> > +			pr_err("cbom-block-size present, but is not a power-of-2\n");
> > +			return false;
> =

> I guess this could use a comment where that rule stems from.
> =

> I.e. the cmo-spec only says
>   "the size of a cache block are [...] implementation-specific"
> =

> So while requiring this to be a power-of-2 is abviously sane,
> this looks like an additional requirement from the kernel side?

I was thinking the sentence a few before this one implied the block size
must be a power-of-2 since it says "Caches organize copies of data into
cache blocks, each of which represents a contiguous, naturally aligned
power-of-two (or NAPOT) range of memory locations."

> =

> Otherwise
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Thanks,
drew

> =

> Heiko
> =

> =

> > +		}
> > +		return true;
> > +	}
> > +
> >  	return true;
> >  }
> >  =

> > =

> =

> =

> =

> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
