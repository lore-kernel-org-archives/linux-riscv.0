Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B045CF531EA
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 06:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jm3/B1HO15oc7KMVab3FwSPL3qu9RTvMYkVAExA9H3w=; b=bqhGEaPpQlPuVx
	TDye2NuW06QSTPLEYOPgZS/sG7fBNFlDofvw6GNRaUZ2sCol3YnSyP93EP1k095uiegaLoHJC9TpJ
	HtzdH1OIbRMYz7DWCpFUDV8Ja1TiuIdXmpevEAZTYsZqNGIqEyWRk7aWFKhQe+OIXbj5vAn5n4Yba
	MTwdEnVnDDc4YMtAB37HqIsSE+yI9UzvvClitItf99hSlY4a0ZDbE/JgTHepix7U1hBmVye3YSp65
	5TEjiJ1daO8a6fDSXEKzpMmyILzJeu+zvZhOdO7j2VYRf2CFE1kd27Au8yyNzQBnQ3RVYOY/2oHmw
	sG7TrYs/CkhdutkBklhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCWtS-0000000GkPo-2kuW;
	Tue, 14 Apr 2026 06:05:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCWtQ-0000000GkNq-10le
	for linux-riscv@lists.infradead.org;
	Tue, 14 Apr 2026 06:05:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EC92543BB3;
	Tue, 14 Apr 2026 06:04:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63420C19425;
	Tue, 14 Apr 2026 06:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776146696;
	bh=l6iBfcudaZxGwh852DmRi0hqjipK/40+/a0KJ/CaPyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tkYJbgrczCaFmWG7KuMw4rMZsZ3tEH+yUIbVhVyTfBIVmOh+3LqxmxCJBIo2oPJYw
	 Xht/EvbxkeJv5tGcJxZxtofyd6SZhbTXyc0eSk1okQ1OADs37rMEOcrHCgE3Xca5qA
	 R71ORwt0WTwOy3MvQixkRwIDHFpGYbs7+ku34IdONQdifs1nr+JXzBonhaOwYJzTNT
	 qrf13IZ+FqGfVXTZUIWObDTi78ZAQxAz3aGeYlbN57PAVGKjRTY/NWMycYgBxccoMP
	 +C5I0ujLEDV/BNqWWNJ2rbwWJaM17EnRpOXPm5kW3SDtY3CN1X6jNy/fi8f++sNVVe
	 EqS/CiwnNHBMQ==
Date: Tue, 14 Apr 2026 06:04:53 +0000
From: Yixun Lan <dlan@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 2/2] pwm: pxa: Add optional bus clock
Message-ID: <20260414060453-GKA203300@kernel.org>
References: <20260409-03-k3-pwm-drv-v1-0-1307a06fba38@kernel.org>
 <20260409-03-k3-pwm-drv-v1-2-1307a06fba38@kernel.org>
 <adyq-Uckwwe9uACA@monoceros>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <adyq-Uckwwe9uACA@monoceros>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_230500_302966_6E72DE85 
X-CRM114-Status: GOOD (  21.69  )
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

Hi Uwe,

On 10:38 Mon 13 Apr     , Uwe Kleine-K=F6nig wrote:
> Hello,
> =

> On Thu, Apr 09, 2026 at 12:45:12AM +0000, Yixun Lan wrote:
> > Add one secondary optional bus clock for the PWM PXA driver, also keep =
it
> > compatible with old single clock.
> > =

> > The SpacemiT K3 SoC require one bus clock for PWM controller, acquire
> =

> s/one/a/ ?
> =

Ok

> > and enable it during probe phase.
> > =

> > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > ---
> >  drivers/pwm/pwm-pxa.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> > =

> > diff --git a/drivers/pwm/pwm-pxa.c b/drivers/pwm/pwm-pxa.c
> > index 0f5bdb0e395e..2ace31405c2d 100644
> > --- a/drivers/pwm/pwm-pxa.c
> > +++ b/drivers/pwm/pwm-pxa.c
> > @@ -53,6 +53,7 @@ struct pxa_pwm_chip {
> >  	struct device	*dev;
> >  =

> >  	struct clk	*clk;
> > +	struct clk	*bus_clk;
> >  	void __iomem	*mmio_base;
> >  };
> >  =

> > @@ -177,7 +178,12 @@ static int pwm_probe(struct platform_device *pdev)
> >  		return PTR_ERR(chip);
> >  	pc =3D to_pxa_pwm_chip(chip);
> >  =

> > -	pc->clk =3D devm_clk_get(dev, NULL);
> > +	pc->bus_clk =3D devm_clk_get_optional_enabled(dev, "bus");
> > +	if (IS_ERR(pc->bus_clk))
> > +		return dev_err_probe(dev, PTR_ERR(pc->bus_clk), "Failed to get bus c=
lock\n");
> > +
> > +	/* Get named func clk if bus clock is valid */
> > +	pc->clk =3D devm_clk_get(dev, pc->bus_clk ? "func" : NULL);
> =

> A local variable for bus_clk would be sufficient.
> =

Ok, will do

> I'm not sure, but I think passing "func" unconditionally to
> devm_clk_get() would also work fine.
Passing "func" unconditionally, will break old compatibles(not k3-pwm), as =
only
one clocks property is provided, but no clock-names property

-- =

Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
