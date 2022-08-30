Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BF8ECAAD1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 14:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=muf5oWLGOeVXQh9eRO0TJ0SywzCKNa1+XB5DkD95dK4=; b=DPMdJEDG+IISE8
	z9GE4BAXItRK7qvayLkzlMqbKe4mBDeNz6GA/rZCcNFQ4N7qL5KkiuA7gn6QQucDo6x/p3eBf6Pfa
	P5GVl+MGdSpXfV9XLECddOcvRn9vkzIjdojhyKkBN0KG9LwuoWSb0MPIBkkIeAsXMMVdYVnuruM6V
	ZVF5Ib+z8Ex1+NIrQNgzpSAd/AWLuVvGK6fd/MBdgd0RtdOzCdeLoRAxJKrJ8AL3tEhU5Z0osOiqo
	sDKuGGXPlwIkNxQ0wU65WYSq0mML4Kn/U3wuD+6irX5KoPps0DqkEjdhrxqshvKr74OCLlu6+IAqZ
	1waIyGjMAbFK/sJS9ePA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT2hW-0008jt-VU; Tue, 30 Aug 2022 14:58:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT2hV-0008iY-RF
	for linux-riscv@bombadil.infradead.org; Tue, 30 Aug 2022 14:58:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+wuuSsIJvGSlr+oH/uuuBZarn+U4ovjH9kckUIVcZus=; b=Z6jbt7m+FbHC5zy+bwPbWJ7O1m
	ro9WL7xbDEwoCpdzAuj9mzrYvW+YLGKQqGaFmw+2vPWUJmts1tIbVGpq1De9mfwenxBuP5nPjKC3L
	KGsrKUbe4Cd8dftoVUINcOH2UKo8RrTTqORWQdv5Vc6jqs++iiix0bmwgKGjqLFm/iHm0Yehsr1g5
	zu1lX8fbQihwMyiwFFBHus4Sjj9ZM5+OWCoy49Y0Lqeb7lg4JiIOGLJdH4spTxXO2Nc8Ij3IgVMx7
	mUFyfM5U2f3lWMbiDnRwsC0brvL5lyZBef2UBWuXoeAgPU7/DaKlEjeqEeugkdvysnyS/hAggruHq
	Dl/dhprw==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT2J4-007rzJ-MG
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 14:33:37 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oT2Iy-0007M4-0n; Tue, 30 Aug 2022 16:33:28 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: atishp@atishpatra.org, anup@brainfault.org, will@kernel.org, mark.rutland@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, Conor.Dooley@microchip.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, philipp.tomsich@vrull.eu, cmuellner@linux.com, samuel@sholland.org, guoren@kernel.org
Subject: Re: [PATCH v2] drivers/perf: riscv_pmu_sbi: add support for PMU variant on T-Head C9xx cores
Date: Tue, 30 Aug 2022 16:33:27 +0200
Message-ID: <3627040.SvYEEZNnvj@diego>
In-Reply-To: <5f72e3da-d87d-2d8d-bb4b-d95dca65d4f7@microchip.com>
References: <20220826163500.1748653-1-heiko@sntech.de> <5f72e3da-d87d-2d8d-bb4b-d95dca65d4f7@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_153334_917294_306279ED 
X-CRM114-Status: GOOD (  38.00  )
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

Hi Conor,

Am Freitag, 26. August 2022, 19:57:33 CEST schrieb Conor.Dooley@microchip.com:
> On 26/08/2022 17:35, Heiko Stuebner wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > With the T-HEAD C9XX cores being designed before or during the ratification
> > to the SSCOFPMF extension, they implement functionality very similar but
> > not equal to it. So add some adaptions to allow the C9XX to still handle
> > its PMU through the regular SBI PMU interface instead of defining new
> > interfaces or drivers.
> > 
> > To work properly, this requires a matching change in SBI, though the actual
> > interface between kernel and SBI does not change.
> > 
> > The main differences are a the overflow CSR and irq number.
> > 
> > As the reading of the overflow-csr is in the hot-path during irq handling
> 
> Hey Heiko,
> 
> Very nitpicky, but I had to read this twice to get it.. If you respin,
> it'd be worth adding a comma after "handling".

ok :-)


> > use an errata and alternatives to not introduce new conditionals there.
> > 
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> > changes in v2:
> > - use alternatives for the CSR access
> > - make the irq num selection a bit nicer
> > 
> > There is of course a matching opensbi-part whose current implementation can
> > be found on [0], but as comments show, this needs some more work still.
> > 
> > 
> > [0] https://patchwork.ozlabs.org/project/opensbi/cover/20220817112004.745776-1-heiko@sntech.de/
> > 
> >  arch/riscv/Kconfig.erratas           | 14 ++++++++++++
> >  arch/riscv/errata/thead/errata.c     | 19 +++++++++++++++++
> >  arch/riscv/include/asm/errata_list.h | 16 +++++++++++++-
> >  drivers/perf/riscv_pmu_sbi.c         | 32 +++++++++++++++++++---------
> >  4 files changed, 70 insertions(+), 11 deletions(-)
> > 
> > diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
> > index 6850e9389930..f1eaac4c0073 100644
> > --- a/arch/riscv/Kconfig.erratas
> > +++ b/arch/riscv/Kconfig.erratas
> > @@ -66,4 +66,18 @@ config ERRATA_THEAD_CMO
> > 
> >           If you don't know what to do here, say "Y".
> > 
> > +config ERRATA_THEAD_PMU
> > +       bool "Apply T-Head PMU errata"
> > +       depends on ERRATA_THEAD
> > +       depends on RISCV_PMU_SBI
> > +       default y
> > +       help
> > +         The T-Head C9xx cores implement a PMU overflow extension very
> > +         similar to the core SSCOFPMF extension.
> > +
> > +         This will apply the overflow errata to handle the non-standard
> > +         behaviour via the regular SBI PMU driver and interface.
> > +
> > +         If you don't know what to do here, say "Y".
> > +
> >  endmenu # "CPU errata selection"
> > diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> > index 202c83f677b2..e6101eab25c8 100644
> > --- a/arch/riscv/errata/thead/errata.c
> > +++ b/arch/riscv/errata/thead/errata.c
> > @@ -44,6 +44,22 @@ static bool errata_probe_cmo(unsigned int stage,
> >  #endif
> >  }
> > 
> > +static bool errata_probe_pmu(unsigned int stage,
> > +                            unsigned long arch_id, unsigned long impid)
> > +{
> > +#ifdef CONFIG_ERRATA_THEAD_PMU
> 
> Is there a reason that all the alternatives use ifdef
> rather than if(IS_ENABLED())?

no real reason I guess - more like not enough thinking :-)

Using IS_ENABLED also makes it way nicer as we can just do

	if (!IS_ENABLED(CONFIG_ERRATA_THEAD_PMU))
		return false;


> 
> > +       if (arch_id != 0 || impid != 0)
> > +               return false;
> > +
> > +       if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> > +               return false;
> > +
> > +       return true;
> > +#else
> > +       return false;
> > +#endif
> > +}
> > +
> >  static u32 thead_errata_probe(unsigned int stage,
> >                               unsigned long archid, unsigned long impid)
> >  {
> > @@ -55,6 +71,9 @@ static u32 thead_errata_probe(unsigned int stage,
> >         if (errata_probe_cmo(stage, archid, impid))
> >                 cpu_req_errata |= (1U << ERRATA_THEAD_CMO);
> > 
> > +       if (errata_probe_pmu(stage, archid, impid))
> > +               cpu_req_errata |= (1U << ERRATA_THEAD_PMU);
> 
> BIT(ERRATA_THEAD_PMU), no? Ditto for the CMO I guess..

and also the memory types - makes things quite a bit nicer :-)

So I'll include these fixes into the next revision.


Thanks
Heiko

> 
> > +
> >         return cpu_req_errata;
> >  }
> > 
> 
> Thanks,
> Conor.
> 
> 
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
