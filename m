Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE16CC38145
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 06:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sQRdpyIJYqO6ZmYIXxsO/0Z9QIbnZ0lbOlre8d98QD8=; b=jf9gBuZWqsIK+A
	P5K7NJ3e/a20MOOtoGEefO4sBORoKYWGIYefeiQ2MSVGNE/CjiDhoTLMhNligvBSEQ7FMVGG+vXCD
	xoOx5enb0chwXmKvU7+1Jl9BQPgNGMx7LblXPgAWlktaBu0SDXO75eXj1azITAIw80fwS3GpFO936
	lXhcC0ORfcSxz4wxTvnLikTFz6BpBdpUgJzUsUSv/Ibfsm4b+R+9FuS1isyeDbQ11lGI9HLFKLsUt
	kScjQ7wlTiKfQmQt1xvEMizuVyVtlPOm/b0klChv2zPS/L7u1kbHj8mKsAtgJ48dNtp649spMlx65
	kKLfrO7QYW5bI3MKAiPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVRlc-00AHC7-Fu; Tue, 06 Sep 2022 06:09:00 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVRlZ-00AH8d-Tm
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 06:08:59 +0000
Received: by mail-wr1-x42c.google.com with SMTP id t7so8795415wrm.10
        for <linux-riscv@lists.infradead.org>; Mon, 05 Sep 2022 23:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=sjh3UIZkNb6zw8kGM7+3rUJzfnRyorMYafJe9bX3CqQ=;
        b=mhyivIcll6wl+ubjMnGxie62l7X+M8oHAgVpsA+4pVz4gHy/ZKD+olI9Bao8BBLbKb
         WMZ5winWO8ludPkZ427U8q4ZNnYyG93qo/vei9BheCbyCixpRtNnFea6576rAKqv7A8I
         j/6B9b6ve+MLCGUpDXkubBQOmOJSLPWjzL/yj/PP1Cy2cVT/G3mjGub3Lz5npBNnz7EX
         1qqXBLCC1EpLGFp4ff7mm6TzuTPNQ+1K82ScY8yaWQfnSRNpz9GRPpumF49evtXVx9ki
         zYeHfJwuc35sMvuWh0htuBAfGofKnPmPjOP4u3lhGeRZtqnxsAVdqeNlLSvT9JbVntyk
         Qgmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=sjh3UIZkNb6zw8kGM7+3rUJzfnRyorMYafJe9bX3CqQ=;
        b=opPTutSMb32LEzZJDY8/WYn/ypOYSsBU3nqWH7olF8A2dug/NwBdLo7pJxVJOVjKTn
         wVqq9m6711b7ZkOkycbSRPD3jFq0kMfLxZbefeddvR5s9X80eBdd9c+mhTuM5fuB3Ph3
         Qq0Zq1F5XYj9cKgWB5Ye+LPjOzWNWYl3W9z1GN5qCYKKftwFwGz1wdaEqDcYsESNtvZQ
         C3Q3aiGYucTDZA2zmJdacuW/KZ5cEvZBZFmAqCIGRm9vUW9sGVGHnW3rGdkS9ebbCBSI
         5vdtttduqzBF/nQat6yrHLzcieR94oFHOcOyxLXY8tkHy+z3ht2K8j2GuINaxYghrgzL
         GUJw==
X-Gm-Message-State: ACgBeo1TZmFyiwM7x6VWBNgA3OYrJjm1fqUjb4VrIHqXhxigPhsZwq7J
	wdeAq9Mtah1vDmHXBZdht+pDIQ==
X-Google-Smtp-Source: AA6agR4XJ3zoMAn1edRZj9OnJjxdU9w7wRgkEHLuASWLsPd18sXofkbQACoxiobO8P2N3PwHFF691w==
X-Received: by 2002:a5d:62d0:0:b0:228:d6ee:9bf4 with SMTP id o16-20020a5d62d0000000b00228d6ee9bf4mr1183432wrv.34.1662444534217;
        Mon, 05 Sep 2022 23:08:54 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id t64-20020a1c4643000000b003a673055e68sm23142337wma.0.2022.09.05.23.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 23:08:53 -0700 (PDT)
Date: Tue, 6 Sep 2022 08:08:52 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor.Dooley@microchip.com
Cc: heiko@sntech.de, linux-riscv@lists.infradead.org, anup@brainfault.org,
	palmer@rivosinc.com, lkp@intel.com
Subject: Re: [PATCH v2] RISC-V: Clean up the Zicbom block size probing
Message-ID: <20220906060852.rwofqr4qifpy5chb@kamzik>
References: <20220812154010.18280-1-palmer@rivosinc.com>
 <4581901.fW5hKsROvD@diego>
 <34dd1ff3-7202-d6dc-55b8-fe2830902995@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <34dd1ff3-7202-d6dc-55b8-fe2830902995@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_230858_005325_2EFD956B 
X-CRM114-Status: GOOD (  28.12  )
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

On Fri, Sep 02, 2022 at 09:55:27AM +0000, Conor.Dooley@microchip.com wrote:
> On 01/09/2022 16:57, Heiko St=FCbner wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know =
the content is safe
> > =

> > Am Freitag, 12. August 2022, 17:40:10 CEST schrieb Palmer Dabbelt:
> >> This fixes two issues: I truncated the warning's hart ID when porting =
to
> >> the 64-bit hart ID code, and the original code's warning handling could
> >> fire on an uninitialized hart ID.
> >>
> >> The biggest change here is that riscv_cbom_block_size is no longer
> >> initialized, as IMO the default isn't sane: there's nothing in the ISA
> >> that mandates any specific cache block size, so falling back to one wi=
ll
> >> just silently produce the wrong answer on some systems.  This also
> >> changes the probing order so the cache block size is known before
> >> enabling Zicbom support.
> >>
> >> Fixes: 3aefb2ee5bdd ("riscv: implement Zicbom-based CMO instructions +=
 the t-head variant")
> >> Fixes: 1631ba1259d6 ("riscv: Add support for non-coherent devices usin=
g zicbom extension")
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > =

> > With Conor's fixes folded in, this compiles and breaks the T-Head CMOs
> > as they rely on that default value :-) .
> > =

> > Can we do the following:
> > =

> > (1) pick Anup's patch moving the block-size init over to cacheflush [0]
> > (2) apply this patch (with Conor's fixes and adapted to the changed
> >      location) and add this one additional line:
> > =

> > diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead=
/errata.c
> > index d4b1526538ad..67fa078f303f 100644
> > --- a/arch/riscv/errata/thead/errata.c
> > +++ b/arch/riscv/errata/thead/errata.c
> > @@ -42,6 +42,7 @@ static bool errata_probe_cmo(unsigned int stage,
> >          if (stage =3D=3D RISCV_ALTERNATIVES_EARLY_BOOT)
> >                  return false;
> > =

> > +       riscv_cbom_block_size =3D L1_CACHE_BYTES;
> >          riscv_noncoherent_supported();
> >          return true;
> >   }
> > =

> > =

> > With that done everything works (again) and looks great, so would be
> > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> > Tested-by: Heiko Stuebner <heiko@sntech.de>
> =

> With all of the above, it'd also be:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

I needed these fixes for a patch series enabling KVM guests to use Zicbom
so I've gone ahead and made Conor's and Heiko's changes [1]. I rebased
Anup's moving patch on top of that [2]. I'll go ahead and post this patch
separately in case that makes things easier.

[1] https://github.com/jones-drew/linux/commit/af361283ec3129846307f787a3eb=
b19bd4a9c421
[2] https://github.com/jones-drew/linux/commit/61c404299c63c8706c129d2a6707=
1f5aae94594f

(I forgot Conor's r-b on this patch in the branch, but I'll pick it up now
while posting.)

Thanks,
drew

> =

> > =

> > =

> > Heiko
> > =

> > [0] https://lore.kernel.org/r/20220830044642.566769-3-apatel@ventanamic=
ro.com
> > =

> > =

> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
