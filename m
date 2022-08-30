Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E4FECAAD1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 15:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ho9GLCnn7B9uPrzx1c+XxRSPtQjBjt4wTeNxx8UOLUc=; b=RR5zPdpYym+eoy
	DYUbhlJYhKkxcZz8bNqYIqrGyl6ronyuhxHASHWiPVHuERTR5jXe8X8ho7wf0D2sFoS92QERK5sme
	HP11VcVrYIrcLiBSTry5lVtbgDc23IxcfI467WCmM+Imh7MxIBW6BeIV3ck6cOCVvvhDWaK6owlOj
	Po3Xo9CpW0R/foYhpcgeEFoyEZ4WYmYlPR23/xM9TbMDnHfc4D/h0xMpfCef95Qld3D/g9AVLwaSh
	GyT7BBtVWoP35/C7uHhHP2neu7RVt0t0ZLJvK7lDV+wIQv2rID9rOU1nHGmEi4E58YgLcsqxgUFnK
	23pZOcYCgTgVwPox6wrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT2la-0009vH-El; Tue, 30 Aug 2022 15:03:02 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT2lX-0009sw-Cx
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 15:03:00 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oT2lP-0007UQ-Vl; Tue, 30 Aug 2022 17:02:52 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: atishp@atishpatra.org, anup@brainfault.org, will@kernel.org, mark.rutland@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, Conor.Dooley@microchip.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, philipp.tomsich@vrull.eu, cmuellner@linux.com, samuel@sholland.org, guoren@kernel.org
Subject: Re: [PATCH v2] drivers/perf: riscv_pmu_sbi: add support for PMU variant on T-Head C9xx cores
Date: Tue, 30 Aug 2022 17:02:51 +0200
Message-ID: <3973491.N7aMVyhfb1@diego>
In-Reply-To: <3627040.SvYEEZNnvj@diego>
References: <20220826163500.1748653-1-heiko@sntech.de> <5f72e3da-d87d-2d8d-bb4b-d95dca65d4f7@microchip.com> <3627040.SvYEEZNnvj@diego>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_080259_455151_DFAC11D4 
X-CRM114-Status: GOOD (  15.59  )
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

Am Dienstag, 30. August 2022, 16:33:27 CEST schrieb Heiko St=FCbner:
> Am Freitag, 26. August 2022, 19:57:33 CEST schrieb Conor.Dooley@microchip=
.com:
> > On 26/08/2022 17:35, Heiko Stuebner wrote:
> > > diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/the=
ad/errata.c
> > > index 202c83f677b2..e6101eab25c8 100644
> > > --- a/arch/riscv/errata/thead/errata.c
> > > +++ b/arch/riscv/errata/thead/errata.c
> > > @@ -44,6 +44,22 @@ static bool errata_probe_cmo(unsigned int stage,
> > >  #endif
> > >  }
> > > =

> > > +static bool errata_probe_pmu(unsigned int stage,
> > > +                            unsigned long arch_id, unsigned long imp=
id)
> > > +{
> > > +#ifdef CONFIG_ERRATA_THEAD_PMU
> > =

> > Is there a reason that all the alternatives use ifdef
> > rather than if(IS_ENABLED())?
> =

> no real reason I guess - more like not enough thinking :-)
> =

> Using IS_ENABLED also makes it way nicer as we can just do
> =

> 	if (!IS_ENABLED(CONFIG_ERRATA_THEAD_PMU))
> 		return false;

Though at least for the CMO this is not possible, as the
	riscv_noncoherent_supported()
is not defined in that case.

Though it might be nice to define a stub for the
not-CONFIG_RISCV_DMA_NONCOHERENT case
so that we don't need to #ifdef around it.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
